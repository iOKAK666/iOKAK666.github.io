$(".submit_buyproduct").click(function(){
    var id_product = $(this).attr("id_product");
    var name_product = $(this).attr("name_product");
    Swal.fire({
        title: 'คำอธิบาย',
        text: "อย่าลืมอ่านคำบรรยายข้างล่าง",
        footer: '<p>ถ้า ID มีปัญหาสามารถติดต่อแอดได้ทันทีที่ดิสคอร์ดคุณแน่ใจที่ซื้อสินค้านี้หรือไม่</p>',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'ซื้อ',
        cancelButtonText: 'ไม่'
      }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: 'คุณแน่ใจหรือไม่!',
                text: "คุณแน่ใจที่ต้องการซื้อสินค้า "+name_product,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'สั่งซื้อของ',
                cancelButtonText: 'ไม่ซื้อออก'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type:"POST",
                        url:"./api/bypluemv1/buyproduct.php",
                        dataType:"json",
                        data:{id_product},
                        success:function(data){
                            if (data.status == "success") {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'สำเร็จ!',
                                    text: data.message,
                                }).then(function(){
                                    window.location.href = '/history_shop';
                                })
                            }else{
                                Swal.fire({
                                    icon: 'error',
                                    title: 'เกิดข้อผิดพลาด!',
                                    text: data.message,
                                })
                            }
                        }
                    })
                }
            })
        }
    })
})