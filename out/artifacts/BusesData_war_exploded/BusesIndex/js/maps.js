// 百度地图API功能
	var map = new BMap.Map("allmap");  // 创建Map实例
	map.centerAndZoom("重庆",15);      // 初始化地图,用城市名设置地图中心点
	map.enableScrollWheelZoom(true);         //开启鼠标滚轮缩放
	//添加比例尺
	map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));        
	map.addControl(new BMap.NavigationControl()); 
	var marker = new BMap.Marker(new BMap.Point(116.404, 39.915));