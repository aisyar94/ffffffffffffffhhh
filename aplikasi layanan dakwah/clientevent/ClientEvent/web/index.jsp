<!--compile file header.jsp--> 
<%@include file="header.jsp" %> 
<div onload="reload()">
    <section> 
        <h1>Daftar Event Dakwah</h1> 
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
                        <th width='30%'>Name </th> 
                        <th width='20%'>Description</th>
                        <th width='15%'>Date</th>
                        <th width='40%'>Location</th>
                        <th width='40%'>Status</th>
                    </tr> 
                </thead> 
                <tbody> 
                    <%-- start web service invocation (Menampilkan DatagetSiakad) --%> 
                    <% 
                    try  
                    { 
                        client.event.Event_Service service = new client.event.Event_Service();
                        client.event.Event port = service.getEventPort();
                                                 
                        java.util.List<Object> resultSiakad = port.getEvent();
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
                        <td width="120px">Name</td> 
                        <td><input id="name" name="name" type="text" minlength="1" maxlength="25" required></td> 
                    </tr> 
                    <tr> 
                        <td>Description</td> 
                        <td><input name="description" id="description" type="text" minlength="1" maxlength="150" required></td> 
                    </tr>
                    <tr> 
                        <td>Location</td> 
                        <td><input name="location" id="location" type="text" minlength="1" maxlength="25" required></td> 
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
            act = "hapus";  // Set aksi menjadi 'hapus'
            sendInfo();  // Panggil fungsi sendInfo untuk menghapus data
        }
    }

    function sendInfo(e) {
        var xhttp;
        var v = document.vinform.q.value;
        var name = document.input.name.value;
        var description = document.input.description.value;
        var locations = document.input.location.value;
        var id = document.input.id ? document.input.id.value : ''; // ID yang akan dikirim

        if (cat == "undefined") {
            cat = "name";
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

        xhttp.send("val=" + v + "&name=" + name + "&description=" + description + "&location=" + locations + "&act=" + act + "&cat=" + cat + "&id=" + id);

        e.preventDefault();
        modal.style.display = "none";
        document.getElementById('input').reset();
    }

    function tambah() { 
        act = "tambah"; 
        modal.style.display = "block"; 
        document.getElementById('text').innerHTML = "Tambah Data"; 
        document.getElementById('hapus').style.display = "none"; 
        document.getElementById('idRow').style.display = "none"; // Sembunyikan ID saat tambah
    }

    function edit(event) { 
        var target = event.target.parentNode; 
        act = "edit"; 
        modal.style.display = "block"; 
        document.getElementById('hapus').style.display = "block"; 
        document.getElementById('text').innerHTML = "Edit Data"; 
        document.getElementById('idRow').style.display = "table-row"; // Tampilkan ID saat edit
        document.getElementById('id').disabled = true; // ID tidak bisa diedit

        // Menampilkan data yang akan diedit
        document.input.id.value = target.cells[0].innerHTML;
        document.input.name.value = target.cells[1].innerHTML;
        document.input.description.value = target.cells[2].innerHTML;
        document.input.location.value = target.cells[4].innerHTML;
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
