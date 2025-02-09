<?php
$pluem = new classweb_bypluem;
$allproduct = $pluem->allproduct();
$soldproduct1 = $pluem->soldproduct1();
$readyproduct = $pluem->readyproduct();
$web_config = $pluem->web_config();
$show_card_other = $pluem->show_card_other();
$show_card_productlimit = $pluem->show_card_productlimit();
?>
<div class="container mt-3">
    <div class="row">
        <div class="col-12">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                    <img class="d-block w-100 image_show" src="<?php echo $web_config['image1'] ?>">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="card mt-3">
                <div class="card-obdy">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-secondary text-light"><i class="fa fa-newspaper"></i>&nbsp; ข่าวสารเเละอัพเดท</span>
                        </div>
                        <marquee class="form-control bg-card"><?php echo $web_config['news']; ?></marquee>
                    </div>
                </div>
            </div>
            <div class="d-none d-lg-block">
                <div class="row mt-3">
                    <div class="col-4 mt-2">
                        <div class="card">
                            <div class="card-body text-center">
                                <h1 class="mt-0 mb-0" style="font-size: 3.5rem;"><i class="fas fa-thin fa-box"></i></h1>
                                <h1 class="mt-0 mb-0"><?php echo $allproduct['total']; ?></h1>
                                <span class="text-muted">สินค้าทั้งหมดในระบบ</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 mt-2">
                        <div class="card">
                            <div class="card-body text-center">
                                <h1 class="mt-0 mb-0" style="font-size: 3.5rem;"><i class="fas fa-check-circle"></i></h1>
                                <h1 class="mt-0 mb-0"><?php echo $soldproduct1['total']; ?></h1>
                                <span class="text-muted">สินค้าที่จำหน่ายแล้ว</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 mt-2">
                        <div class="card">
                            <div class="card-body text-center">
                                <h1 class="mt-0 mb-0" style="font-size: 3.5rem;"><i class="fas fa-shopping-basket"></i></h1>
                                <h1 class="mt-0 mb-0"><?php echo $readyproduct['total']; ?></h1>
                                <span class="text-muted">สินค้าพร้อมจำหน่าย</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-block d-lg-none">
                <div class="row mt-3">
                    <div class="col-12 mt-2">
                        <div class="card">
                            <div class="card-body text-center">
                                <h1 class="mt-0 mb-0" style="font-size: 3.5rem;"><i class="fas fa-thin fa-box"></i></h1>
                                <h1 class="mt-0 mb-0"><?php echo $allproduct['total']; ?></h1>
                                <span class="text-muted">สินค้าทั้งหมดในระบบ</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 mt-2">
                        <div class="card">
                            <div class="card-body text-center">
                                <h1 class="mt-0 mb-0" style="font-size: 3.5rem;"><i class="fas fa-check-circle"></i></h1>
                                <h1 class="mt-0 mb-0"><?php echo $soldproduct1['total']; ?></h1>
                                <span class="text-muted">สินค้าที่จำหน่ายแล้ว</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 mt-2">
                        <div class="card">
                            <div class="card-body text-center">
                                <h1 class="mt-0 mb-0" style="font-size: 3.5rem;"><i class="fas fa-shopping-basket"></i></h1>
                                <h1 class="mt-0 mb-0"><?php echo $readyproduct['total']; ?></h1>
                                <span class="text-muted">สินค้าพร้อมจำหน่าย</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <p></p>
                <div class="bg-white p-2 text-dark rounded align-items-center shadow-sm mb-2">
                    <span style="font-size: 20px;" class="p-2">
                        <i class="fas fa-star text-warning"></i> บริการ ตางๆ
                   </span>
                </div>
            <p></p>
            <div class="row">
                <?php if(empty($show_card_other)){ ?>
                <div class="col-12 mt-2 text-center">
                    <h3>เร็วๆนี้</h3>
                </div>
                <?php }else{ ?>
                <?php foreach($show_card_other as $row){ ?>
                    <div class="col-6 mt-2">
                        <a href="/idpass">
                            <img class="image_show_card" src="<?php echo $row['image']; ?>" width="100%">
                        </a>
                    </div>
                <?php } ?>
                <?php } ?>
            </div>
            <p></p>
                <div class="bg-white p-2 text-dark rounded align-items-center shadow-sm mb-2">
                    <span style="font-size: 20px;" class="p-2">
                        <i class="fas fa-star text-warning"></i> สินค้าแนะนำ
                   </span>
                </div>
                <?php foreach($show_card_productlimit as $row){
                    $totalproduct = $pluem->totalproduct($row['id']);
                ?>
                <p></p>
                 <div class="col-sm-4 mt-2">
                    <div class="card" style="background-color: #fffffff;">
                        <img class="image_show_card" src="<?php echo $row['image']; ?>" width="100%">
                        <div class="card-body">
                            <div class="mt-2">
                                <?php 
                                    echo "<span class='badge bg-danger'>สินค้าแนะนำ</span>";
                                ?>
                                <h5>
                                    <span style="color: Red;">
                                    <?php echo $row['name']; ?>
                                    </span>
                                </h5>
                                <h6>ราคา :
                                    <span style="color: yellow;">
                                    <?php echo $row['price']; ?>
                                    </span> Points
                                </h6>
                                <h6>สถานะสินค้า:
                                    <span>
                                        <?php
                                            if($totalproduct['total'] == "0"){
                                                echo "<span class='badge bg-danger'>หมด</span>";
                                            }else{
                                                echo "<span class='badge bg-success'>มีของ</span>";
                                            }
                                        ?>
                                    </span>
                                </h6>
                                <h6><i class="fas fa-box-open"></i> สินค้าในสต็อก : <?php echo $totalproduct['total']; ?> ชิ้น</h6>
                                <h6>รายละเอียดสินค้า : <br><span style="color:#E71C1C;"><textarea disabled class="text-input-none"><?php echo $row['details']; ?></textarea></span></h6>
                                <div class="row">
                                        <button type="button" class="btn btn-success mt-2 w-100 submit_buyproduct" id_product="<?php echo $row['id']; ?>" name_product="<?php echo $row['name']; ?>">ซื้อสินค้า</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>

<script src="../assets/js/buyproduct.js"></script>