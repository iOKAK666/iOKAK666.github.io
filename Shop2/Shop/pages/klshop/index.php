<?php
$pluem = new classweb_bypluem;
$show_card_other = $pluem->show_card_other();
?>
<div class="row">
    <?php if(empty($show_card_other)){ ?>
        <div class="col-12 mt-2 text-center">
            <h3>ไม่มีบริการอื่นๆ ณ ตอนนี้</h3>
        </div>
    <?php }else{ ?>
        <?php foreach($show_card_other as $row){ ?>
            <div class="col-6 mt-2">
                <a href="/termgame?id=<?php echo $row['id']; ?>">
                    <img class="image_show_card" src="<?php echo $row['image']; ?>" width="100%">
                </a>
            </div>
        <?php } ?>
    <?php } ?>
</div>