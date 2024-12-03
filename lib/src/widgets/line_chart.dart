part of template;

enum ChartType {
  spilne,
  line,
  column,
}

class LineChart<T, U> extends StatefulWidget {
  LineChart({
    required this.data,
    required this.getLineName,
    required this.charName,
    this.isSpline = true,
    this.getNameUnitOY,
    this.tooltipBuilder,
    this.chartType,
  });
  Map<T, List<ChartData<U>>> data;
  String Function(dynamic t) getLineName;
  String charName;
  bool isSpline;
  String Function(int value)? getNameUnitOY;
  ChartType? chartType;
  Widget Function(
    dynamic data,
    ChartPoint<dynamic> point,
    ChartSeries<dynamic, dynamic> series,
    int pointIndex,
    int seriesIndex,
  )? tooltipBuilder;
  @override
  _LineChartState createState() => _LineChartState<T, U>();
}

class _LineChartState<T, U> extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    U? u;
    if (widget.data.values.isNotEmpty && widget.data.values.first.isNotEmpty) {
      u = widget.data.values.first.first.x as U;
    }
    var series;
    switch (widget.chartType) {
      case ChartType.line:
        series = _getLineSeries();
        break;
      case ChartType.spilne:
        series = _getSplineLineSeries();
        break;
      case ChartType.column:
        series = _getColumnSeries();
        break;
      default:
        series = _getLineSeries();
    }

    child = Scaffold(
      body: SfCartesianChart(
        // Cho phép zoom và pan (cuộn)
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true, // Cho phép zoom in/out bằng cử chỉ pinch
          enablePanning: true, // Cho phép cuộn khi phóng to
          enableDoubleTapZooming: true,
          enableMouseWheelZooming: true,
          enableSelectionZooming: true,
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          canShowMarker: false,
          color: const Color.fromARGB(255, 239, 246, 255),
          animationDuration: 150,
          textStyle: const TextStyle(
            color: Colors.black,
          ),
          format: widget.tooltipBuilder != null ? 'point.x : point.y' : null, // Định dạng mặc định
          builder: widget.tooltipBuilder,
          // builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
          //   final value = data.y;
          //   return Text(
          //     '${_formatCurrency(value)}',
          //     style: const TextStyle(color: Colors.black),
          //   );
          // },
        ),
        primaryXAxis: u is DateTime
            ? DateTimeAxis(
                dateFormat: DateFormat('dd/MM'), // Hiển thị ngày tháng trên trục hoành
                intervalType: DateTimeIntervalType.days,
                minimum: findMinX(widget.data as Map<dynamic, List<ChartData<DateTime>>>), // Giới hạn ngày bắt đầu
                maximum: findMaxX(widget.data as Map<dynamic, List<ChartData<DateTime>>>), // Giới hạn ngày kết thúc
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
              )
            : const CategoryAxis(
                labelsExtent: 50,
                labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(size: 0),
                labelStyle: TextStyle(fontSize: 10),
              ),
        primaryYAxis: NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(size: 0),
          axisLabelFormatter: (axisLabelRenderArgs) {
            final value = axisLabelRenderArgs.value.toInt();
            return ChartAxisLabel(
              widget.getNameUnitOY?.call(value) ?? value.shorten(),
              const TextStyle(color: Colors.black),
            );
          },
        ),
        // tooltipBehavior: TooltipBehavior(
        //   enable: true,
        //   canShowMarker: false,
        //   color: const Color.fromARGB(255, 239, 246, 255),
        //   animationDuration: 150,
        //   textStyle: const TextStyle(
        //     color: Colors.black,
        //   ),
        // ), // Hiển thị giá trị khi người dùng nhấn vào điểm
        series: series as List<CartesianSeries<dynamic, dynamic>>,
      ),
    );

    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          AppBoxShadow.ksSmallShadow(),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.charName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
              // decoration: TextDecoration.underline,
            ),
          ),
          const Gap(12),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }

  // Hàm để lấy ngày nhỏ nhất từ dữ liệu
  U? findMinX<T, U extends Comparable>(Map<T, List<ChartData<U>>> data) {
    U? minX;

    data.forEach((key, chartDataList) {
      for (var chartData in chartDataList) {
        if (chartData.x != null) {
          if (minX == null || chartData.x!.compareTo(minX) < 0) {
            minX = chartData.x;
          }
        }
      }
    });

    return minX;
  }

  U? findMaxX<T, U extends Comparable>(Map<T, List<ChartData<U>>> data) {
    U? maxX;

    data.forEach((key, chartDataList) {
      for (var chartData in chartDataList) {
        if (chartData.x != null) {
          if (maxX == null || chartData.x!.compareTo(maxX) > 0) {
            maxX = chartData.x;
          }
        }
      }
    });

    return maxX;
  }

  // Hàm tạo danh sách các series (dây) khác nhau với màu khác nhau
  List<SplineSeries<ChartData, dynamic>> _getSplineLineSeries() {
    return widget.data.entries.map((entry) {
      List<ChartData> chartData = entry.value;
      Color colorLine = Colors.black;
      String lineName = widget.getLineName(entry.key);
      if (chartData.isNotEmpty) {
        colorLine = chartData.first.color ?? Colors.black;
      }

      return SplineSeries<ChartData, dynamic>(
        dataSource: chartData,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        color: colorLine, // Mỗi dây có màu khác nhau
        name: lineName, // Đặt tên cho từng dây
        width: 2,
        splineType: SplineType.natural, // Để có đường cong tự nhiên hơn
        dataLabelMapper: (ChartData report, _) => report.y!.toString(),
        markerSettings: const MarkerSettings(
          isVisible: true,
          width: 4,
          height: 4,
        ), // Hiển thị dấu trên từng điểm
      );
    }).toList();
  }

  List<LineSeries<ChartData, dynamic>> _getLineSeries() {
    return widget.data.entries.map((entry) {
      List<ChartData> chartData = entry.value;
      Color colorLine = Colors.black;
      String lineName = widget.getLineName(entry.key);
      if (chartData.isNotEmpty) {
        colorLine = chartData.first.color ?? Colors.black;
      }

      return LineSeries<ChartData, dynamic>(
        dataSource: chartData,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        color: colorLine, // Mỗi dây có màu khác nhau
        name: lineName, // Đặt tên cho từng dây
        width: 2,
        dataLabelMapper: (ChartData report, _) => report.y!.toString(),
        markerSettings: const MarkerSettings(
          isVisible: true,
          width: 4,
          height: 4,
        ), // Hiển thị dấu trên từng điểm
      );
    }).toList();
  }

  List<ColumnSeries<ChartData, dynamic>> _getColumnSeries() {
    return widget.data.entries.map((entry) {
      List<ChartData> chartData = entry.value;
      Color colorColumn = Colors.blue; // Màu mặc định cho cột
      String columnName = widget.getLineName(entry.key);

      if (chartData.isNotEmpty) {
        colorColumn = chartData.first.color ?? Colors.blue;
      }

      return ColumnSeries<ChartData, dynamic>(
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        color: colorColumn, // Màu cho cột
        name: columnName, // Đặt tên cho từng series

        dataLabelSettings: const DataLabelSettings(
          isVisible: false, // Hiển thị nhãn dữ liệu trên cột
          textStyle: TextStyle(color: Colors.black),
        ),
      );
    }).toList();
  }
}

class ChartData<U> {
  ChartData({
    this.x,
    this.y,
    this.color,
  });

  final U? x;
  final int? y;
  final Color? color;
}
