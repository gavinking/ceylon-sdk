import ceylon.io.buffer {
    ByteBuffer
}
import ceylon.net.http {
    Header
}

"An object to assist sending response to the client."
by("Matej Lazar")
shared sealed interface Response {

    "Writes string to the response."
    shared formal void writeString(String string);

    shared formal void writeStringAsynchronous(
        String string, 
        Anything() onCompletion,
        Anything(ServerException)? onError = null);

    "Writes bytes to the response."
    shared formal void writeBytes(Array<Byte> bytes);

    shared formal void writeBytesAsynchronous(
        Array<Byte> bytes,
        Anything() onCompletion,
        Anything(ServerException)? onError = null);

    "Writes ByteBuffer to the response."
    shared formal void writeByteBuffer(ByteBuffer buffer);

    shared formal void writeByteBufferAsynchronous(
        ByteBuffer byteBuffer,
        Anything() onCompletion,
        Anything(ServerException)? onError = null);

    "Add a header to response. Multiple headers can have the same name.
     Throws Exception if headers have been already sent to client."
    shared formal void addHeader(Header header);

    "The HTTP status code of the response."
    shared formal variable Integer responseStatus;

}
