<!--  
Kerjakan Semua Prosesnya Disini  
(Tambah , Edit , dan Hapus ) --> 
<div onchange="reload()"> 
<%-- start web service invocation --%> 
<%  
    try  
    { 
 String act = request.getParameter("act"); 
     
        client.event.Event_Service service = new client.event.Event_Service();
        client.event.Event port = service.getEventPort();
        //If Statement  untuk Proses CRUD 
        if(act.equals("tambah")) //Proses Tambah  
        { 
            try  
            { 
                String name = String.valueOf(request.getParameter("name")); 
                java.lang.String description = request.getParameter("description");
                java.lang.String location = request.getParameter("location");
          
                port.addEvent(name, description, location);
 
                response.sendRedirect("index.jsp"); 
            } 
            catch(Exception e){} 
        } 
        else if(act.equals("edit") ) //Proses Edit  
        {
            try  
            { 
                String id = String.valueOf(request.getParameter("id")); 
                String name = String.valueOf(request.getParameter("name")); 
                java.lang.String description = request.getParameter("description");
                java.lang.String location = request.getParameter("location");
                
                int ID = java.lang.Integer.valueOf(id);
                port.updateEvent(name, description, location, ID);
 
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
                port.delete(ID);
 
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