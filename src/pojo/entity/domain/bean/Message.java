package pojo.entity.domain.bean;

public class Message
{
    private int receiver,sender;
    private long sendTime;
    private String messageContent;

    public Message()
    {

    }

    public int getReceiver()
    {
        return receiver;
    }

    public void setReceiver(int receiver)
    {
        this.receiver = receiver;
    }

    public int getSender()
    {
        return sender;
    }

    public void setSender(int sender)
    {
        this.sender = sender;
    }

    public long getSendTime()
    {
        return sendTime;
    }

    public void setSendTime(long sendTime)
    {
        this.sendTime = sendTime;
    }

    public String getMessageContent()
    {
        return messageContent;
    }

    public void setMessageContent(String messageContent)
    {
        this.messageContent = messageContent;
    }

    @Override
    public String toString()
    {
        return "Message{" +
                "receiver=" + receiver +
                ", sender=" + sender +
                ", sendTime=" + sendTime +
                ", messageContent='" + messageContent + '\'' +
                '}';
    }
}
