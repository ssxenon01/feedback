<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="base"/>
		<title>Welcome to Grails</title>
	</head>
	<body>

    <div class="content-wrapper">
    <div class="container">
    <div class="home-panel">
        <div class="jumbotron">
            <h2>Change Your Life!</h2>
            <div class="steps clearfix">
                <a href="#">Санал оруулах</a>
                <a href="#">Санал дэмжих</a>
                <a href="#">Саналын хариу</a>
            </div>
            <div class="create-petition">
                <a href="#">Шударга бус өрсөлдөөн улмаас !</a>
                <a href="#">Хэрэглэгчийн эрх ашиг зөрчигдөж байна уу !</a>
            </div>
        </div>
    </div>
    <div class="row popular-petitions">
    <div class="span12">
        <div class="header">
            <div class="pull-left"><h1>Бүх саналууд</h1></div>
            <div class="pull-right">
                <span class="filter">
                    <a href="#" id="filter-button" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Default tooltip">Шүүлтүүр</a>
                </span>
            </div>

            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        <div class="filter-collapse hide" style="">
            <div class="head-filter">
                <div class="pull-left">
                    <button id="filter-close" class="btn btn-small btn-pet" type="button"><i class="icon-arrow-up icon-white"></i>Хаах</button>
                </div>
                <div class="pull-right">
                    <div class="btn-group">
                        <button class="btn btn-small btn-select">Бүгд</button>
                        <button class="btn btn-small">Нээлттэй</button>
                        <button class="btn btn-small">Шалгаж байгаа</button>
                        <button class="btn btn-small">Хаасан</button>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="filter-body">
                <span class="help-block" style="font-weight: bold;">Та хамгийн ихдээ гурван салбар сонгох боломжтой</span>
                <div class="row" style="">
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Хэрэглэгчийн хууль
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Өрсөлдөөний хууль
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Худалдаа үйлчилгээ
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Төрийн болон Төрийн бус байгууллага
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Хөдөө аж ахуй
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Банк санхүү, худалдаа үйлчилгээний салбар
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Мэдээллийн технологи
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Харилцаа холбоо, Мэдээллийн технологи
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Түлш эрчим хүч, Барилга орон сууц
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Нийтийн аж ахуй, Зам тээвэр
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Аялал жуулчлал
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Боловсрол, Соёл урлаг
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Шинжлэх ухаан
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Эрүүл мэндийн үйлчилгээ
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Эмнэлэгийн хэрэгслийн худалдаа
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Үйлдвэрлэл, Ниймгмийн хамгаалал
                        </label>
                    </div>
                    <div class="span5">
                        <label class="checkbox">
                            <input type="checkbox" value="">
                            Түлш эрчим хүч, Уул уурхай
                        </label>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-large btn-like">Шүүх</button>
                </div>
            </div>
        </div>
    </div>
    <div class="clear" style="height: 15px;"></div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="span4 petition">
        <div class="inner">
            <div class="title">
                <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
            </div>
            <div class="dateline">
                <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                <i class=" icon-time"></i> 4:24 PM - 03 May 12
            </div>
            <div class="pet-graph">
                <div class="thermometer" style="">
                    <div class="mercury" style="width: 78%"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bottom">
                <span class="stats-narrow">
                    <span class="stats">
                        <span class="picture">
                            <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                        </span>
                        <span class="like-count">
                            <strong class="">246</strong> Дэмжсэн
                        </span>

                    </span>
                </span>
                <span class="action">
                    <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                </span>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    %{--
        <div class="content" style="margin-top: 40px">
            <div class="hero-unit">
                <div class="container">
                    <h1>Нээлттэй санал гомдлын пратформ.</h1>
                    <h2>Шударга өрсөлдөөн, Хэрэглэгчийн төлөө газар.</h2>

                    <ul class="row ">
                        <li class="span3 start float-up">
                            <p>Санал, Гомдол нэмэх</p>
                            <p>Таны эрх ашиг зөрчигдөж байгаа бол Та асуудлаа дэвшүүлнэ үү.</p>
                        </li>

                        <li class="span3 likethis float-up">
                            <p>Санал, Гомдол дэмжигдэх</p>
                            <p>Таны дэвшүүлсэн санал гомдол 1000 хүнээр дэмжигдэж чадвал.</p>
                        </li>

                        <li class="span3 discuss float-up">
                            <p>Санал, Гомдол шийдвэрлэх</p>
                            <p>Хяналт шалгалтын үр дүнг нээлттэй танилцуулах.</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="container">
                <div class="row get-started-now">
                    <div class="span10 offset1 white-panel button-text-panel">
                        <h2>Таны эрх ашиг зөрчигдсөн үү?</h2>
                        <a href="<g:createLink controller="ticket" action="create"/>" class="btn btn-large btn-create">Санал нэмэх!</a>
                    </div>
                </div>
                <div class="row">
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 78%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 78%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 75%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 68%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 60%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 48%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 38%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 20%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="widget">
                            <div class="head">
                                <h3><a href="#">Гурил гурилан бүтээгдэхүүн хэрэглэх хүндрэлтэй байна.</a></h3>
                                <div class="list-meta">by <a href="#">Amar Pagva</a> <span class="liked">· 162 дэмжсэн</span><span class="liked">· <a href="#">Дэмжих</a></span></div>
                            </div>
                            <div class="pet-graph">
                                <div class="thermometer" style="">
                                    <div class="mercury" style="width: 15%"></div>
                                </div>
                            </div>
                            <div class="date">6 өдөр, 7 цагийн өмнө үүссэн</div>
                        </div>
                    </div>
                </div>
                <div class="clearfix" style="height: 40px"></div>

            </div>
        </div>--}%
	</body>
</html>
