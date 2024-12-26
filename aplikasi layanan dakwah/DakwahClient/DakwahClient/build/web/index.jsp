<!--compile file header.jsp--> 
<%@include file="header.jsp" %> 
<div onload="reload()"> 
    <section> 
        <h1>Daftar Konten Dakwah</h1> 
        <div class="operasi"> 
            <button onclick="tambah()">Tambah Data</button> 
            <form style="display:none" name="vinform"> 
                Pencarian &nbsp; 
                <select class="kategori" name="kategori" onchange="kat(this.value)"> 
                </select> 
                <input type="text" name="q" onkeyup="kat(document.vinform.kategori.value)"> 
            </form> 
            <div style="clear: both;"> 
            </div> 
        </div> 
        <div id="amit" onchange="reload()"> 
            <table id="tabel"> 
                <thead> 
                    <!-- Head table (Nama Field)--> 
                    <tr> 
                        <th width='5%'>ID</th> 
                        <th width='30%'>Title </th> 
                        <th width='20%'>Link</th> 
                        <th width='20%'>Description</th>
                        <th width='15%'>Maker</th>
                        <th width='40%'>Date</th>
                    </tr> 
                </thead> 
                <tbody> 
                    <%-- start web service invocation (Menampilkan DatagetSiakad) --%> 
                    <% 
                    try  
                    { 
                        server.konten.Konten_Service service = new server.konten.Konten_Service();
                        server.konten.Konten port = service.getKontenPort();
                                                 
                        java.util.List<Object> resultSiakad = port.getKonten();
                        for (int i = 0; i < resultSiakad.size(); i++) 
                        { 
                            out.print("<tr class='data' onclick='edit(event)'>"); 
                            out.println(resultSiakad.get(i)); 
                            out.print("</tr>"); 
                        } 
                    } catch (Exception ex) { 
                        // TODO handle custom exceptions here 
                    } 
                    %> 
                    <%-- end web service invocation --%> 
                </tbody> 
            </table> 
        </div> 
    </section> 
</div> 
                
                
    <!-- MODAL BOX --> 
    <div id="idModal" class="modal" onclose="reload()"> 
        <div class="modal-content"> 
            <span class="close">&times;</span> 
            <h1 id="text"></h1> 
 
            <form id="input" name="input" method="post" onsubmit="sendInfo(event);"> 
                <table> 
                    <!-- Input untuk ID hanya akan muncul pada saat Edit -->
                    <tr id="idRow" style="display:none;"> 
                        <td width="120px">ID</td> 
                        <td><input id="id" name="id" type="text" readonly></td> 
                    </tr> 
                    <tr> 
                        <td width="120px">Title</td> 
                        <td><input id="title" name="title" type="text" minlength="1" maxlength="25" required></td> 
                    </tr> 
                    <tr> 
                        <td>Link </td> 
                        <td><input name="link" type="text" minlength="1" maxlength="150" required></td> 
                    </tr> 
                    <tr> 
                        <td>Description</td> 
                        <td><input name="description" id="description" type="text" minlength="1" maxlength="150" required></td> 
                    </tr>
                    <tr> 
                        <td>Maker</td> 
                        <td><input name="maker" id="maker" type="text" minlength="1" maxlength="25" required></td> 
                    </tr>
                </table> 
                <div class="submit"> 
                    <input id="simpan" type="submit" value="Simpan" onkeyup="reload"> 
                    <!--<input id="hapus" type="submit" value="Hapus" onkeyup="reload" onclick="act='hapus'">-->
                    <input id="hapus" type="button" value="Hapus" onclick="confirmDelete()"> <!-- Tombol Hapus -->
                    <div style="clear: both;"></div> 
                </div> 
            </form> 
        </div> 
    </div> 
 

    <!-- JAVASCRIPT --> 
    <script> 
        var modal = document.getElementById('idModal'); 
        var span = document.getElementsByClassName("close")[0]; 
        var act, cat; 

        function kat(str){ 
            cat = str; 
            sendInfo(); 
        }
        
        function confirmDelete() {
            var result = confirm("Apakah Anda yakin ingin menghapus data ini?");
            if (result) {
                // Jika pengguna menekan OK, maka lakukan penghapusan
                act = "hapus";  // Set aksi menjadi 'hapus'
                sendInfo();  // Panggil fungsi sendInfo untuk menghapus data
            }
        }

        function sendInfo(e) {
//            location.reload(true);
            var xhttp;
            var v = document.vinform.q.value;
            var title = document.input.title.value;
            var link = document.input.link.value;
            var description = document.input.description.value;
            var maker = document.input.maker.value;
            var id = document.input.id ? document.input.id.value : ''; // handle the case when ID is not present

            if (cat == "undefined") {
                cat = "title";
            }

            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("amit").innerHTML = this.responseText;
                    location.reload(); 
                }
            };

            xhttp.open("POST", "proses.jsp", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            xhttp.send("val=" + v + "&title=" + title + "&link=" + link + "&description=" + description + "&maker=" + maker + "&act=" + act + "&cat=" + cat + "&id=" + id);

            e.preventDefault();
            modal.style.display = "none";
            document.getElementById('input').reset();
        }

        function tambah() { 
            act = "tambah"; 
            
            modal.style.display = "block"; 
            document.getElementById('title').disabled = false; 
            document.getElementById('text').innerHTML = "Tambah Data"; 
            document.getElementById('hapus').style.display = "none"; 

            // Hide ID row for adding data
            document.getElementById('idRow').style.display = "none";
        } 

        function edit(event) { 
            var target = event.target.parentNode; 
            act = "edit"; 

            // Menampilkan modal
            modal.style.display = "block"; 

            // Menampilkan tombol Hapus
            document.getElementById('hapus').style.display = "block"; 
            document.getElementById('text').innerHTML = "Edit Data"; 

            // Menampilkan ID input field saat edit
            document.getElementById('idRow').style.display = "table-row"; 
            
            // Menonaktifkan ID jika perlu (jika ID tidak boleh diubah)
            document.getElementById('id').disabled = true;

            // Menampilkan data yang ingin diedit di dalam form modal
            document.input.id.value = target.cells[0].innerHTML; // ID
            document.input.title.value = target.cells[1].innerHTML; // Title
            document.input.link.value = target.cells[2].innerHTML; // Link
            document.input.description.value = target.cells[3].innerHTML; // Description
            document.input.maker.value = target.cells[4].innerHTML; // Maker
        }

        span.onclick = function() { 
            modal.style.display = "none"; 
            document.getElementById('input').reset(); 
        } 

        window.onclick = function(event) { 
            if (event.target == modal) { 
                modal.style.display = "none"; 
                document.getElementById('input').reset(); 
            } 
        } 
         
        function reload(){ 
            window.top.location.href = "index.jsp";  
        } 
    </script> 

<!--compile file footer.jsp--> 
<%@include file="footer.jsp" %>
