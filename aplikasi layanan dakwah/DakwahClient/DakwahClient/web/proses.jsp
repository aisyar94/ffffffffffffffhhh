<!--  
Kerjakan Semua Prosesnya Disini  
(Tambah , Edit , dan Hapus ) --> 
<div onchange="reload()"> 
<%-- start web service invocation --%> 
<%  
    try  
    { 
 String act = request.getParameter("act"); 
     
        server.konten.Konten_Service service = new server.konten.Konten_Service();
        server.konten.Konten port = service.getKontenPort();
         
        //If Statement  untuk Proses CRUD 
        if(act.equals("tambah")) //Proses Tambah  
        { 
            try  
            { 
                String title = String.valueOf(request.getParameter("title")); 
                java.lang.String link = request.getParameter("link"); 
                java.lang.String description = request.getParameter("description");
                java.lang.String maker = request.getParameter("maker");
          
                port.addKonten(title, link, description, maker);
 
                response.sendRedirect("index.jsp"); 
            } 
            catch(Exception e){} 
        } 
        else if(act.equals("edit") ) //Proses Edit  
        {
            try  
            { 
                String id = String.valueOf(request.getParameter("id")); 
                String title = String.valueOf(request.getParameter("title")); 
                java.lang.String link = request.getParameter("link"); 
                java.lang.String description = request.getParameter("description");
                java.lang.String maker = request.getParameter("maker");
                
                int ID = java.lang.Integer.valueOf(id);
                port.updateKonten(title, link, description, maker, ID);
 
                response.sendRedirect("index.jsp"); 
            } 
            catch(Exception e){} 
        }  
        else if(act.equals("hapus")) //Proses Hapus  
        { 
            System.out.println("Masuk Ke hapus");
            try  
            { 
                String id = String.valueOf(request.getParameter("id")); 
                int ID = java.lang.Integer.valueOf(id); 
                port.deleteKonten(ID);
 
                response.sendRedirect("index.jsp"); 
            } 
            catch(Exception e){} 
        } 
        //Selesai If Statement untuk Proses CRUD 
    } 
    catch (Exception ex)  
    { 
 { out.print("<p style='font-size:20px; font-weight:bold; color:red;'>Gagal koneksi ke server!</p>"); } 
    } 
%> 
</div> 
<script> 
    function reload() 
    { 
        location.reload(true); 
    } 
</script> 
<%-- end web service invocation --%> 