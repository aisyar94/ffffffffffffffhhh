
package server.konten;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the server.konten package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _AddKonten_QNAME = new QName("http://konten.server/", "addKonten");
    private final static QName _AddKontenResponse_QNAME = new QName("http://konten.server/", "addKontenResponse");
    private final static QName _DeleteKonten_QNAME = new QName("http://konten.server/", "deleteKonten");
    private final static QName _DeleteKontenResponse_QNAME = new QName("http://konten.server/", "deleteKontenResponse");
    private final static QName _GetKonten_QNAME = new QName("http://konten.server/", "getKonten");
    private final static QName _GetKontenResponse_QNAME = new QName("http://konten.server/", "getKontenResponse");
    private final static QName _UpdateKonten_QNAME = new QName("http://konten.server/", "updateKonten");
    private final static QName _UpdateKontenResponse_QNAME = new QName("http://konten.server/", "updateKontenResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: server.konten
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link AddKonten }
     * 
     */
    public AddKonten createAddKonten() {
        return new AddKonten();
    }

    /**
     * Create an instance of {@link AddKontenResponse }
     * 
     */
    public AddKontenResponse createAddKontenResponse() {
        return new AddKontenResponse();
    }

    /**
     * Create an instance of {@link DeleteKonten }
     * 
     */
    public DeleteKonten createDeleteKonten() {
        return new DeleteKonten();
    }

    /**
     * Create an instance of {@link DeleteKontenResponse }
     * 
     */
    public DeleteKontenResponse createDeleteKontenResponse() {
        return new DeleteKontenResponse();
    }

    /**
     * Create an instance of {@link GetKonten }
     * 
     */
    public GetKonten createGetKonten() {
        return new GetKonten();
    }

    /**
     * Create an instance of {@link GetKontenResponse }
     * 
     */
    public GetKontenResponse createGetKontenResponse() {
        return new GetKontenResponse();
    }

    /**
     * Create an instance of {@link UpdateKonten }
     * 
     */
    public UpdateKonten createUpdateKonten() {
        return new UpdateKonten();
    }

    /**
     * Create an instance of {@link UpdateKontenResponse }
     * 
     */
    public UpdateKontenResponse createUpdateKontenResponse() {
        return new UpdateKontenResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AddKonten }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "addKonten")
    public JAXBElement<AddKonten> createAddKonten(AddKonten value) {
        return new JAXBElement<AddKonten>(_AddKonten_QNAME, AddKonten.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AddKontenResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "addKontenResponse")
    public JAXBElement<AddKontenResponse> createAddKontenResponse(AddKontenResponse value) {
        return new JAXBElement<AddKontenResponse>(_AddKontenResponse_QNAME, AddKontenResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteKonten }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "deleteKonten")
    public JAXBElement<DeleteKonten> createDeleteKonten(DeleteKonten value) {
        return new JAXBElement<DeleteKonten>(_DeleteKonten_QNAME, DeleteKonten.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DeleteKontenResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "deleteKontenResponse")
    public JAXBElement<DeleteKontenResponse> createDeleteKontenResponse(DeleteKontenResponse value) {
        return new JAXBElement<DeleteKontenResponse>(_DeleteKontenResponse_QNAME, DeleteKontenResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetKonten }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "getKonten")
    public JAXBElement<GetKonten> createGetKonten(GetKonten value) {
        return new JAXBElement<GetKonten>(_GetKonten_QNAME, GetKonten.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetKontenResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "getKontenResponse")
    public JAXBElement<GetKontenResponse> createGetKontenResponse(GetKontenResponse value) {
        return new JAXBElement<GetKontenResponse>(_GetKontenResponse_QNAME, GetKontenResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateKonten }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "updateKonten")
    public JAXBElement<UpdateKonten> createUpdateKonten(UpdateKonten value) {
        return new JAXBElement<UpdateKonten>(_UpdateKonten_QNAME, UpdateKonten.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateKontenResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://konten.server/", name = "updateKontenResponse")
    public JAXBElement<UpdateKontenResponse> createUpdateKontenResponse(UpdateKontenResponse value) {
        return new JAXBElement<UpdateKontenResponse>(_UpdateKontenResponse_QNAME, UpdateKontenResponse.class, null, value);
    }

}
