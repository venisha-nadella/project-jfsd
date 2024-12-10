package com.project.service;

import com.project.model.SupportMessage;
import java.util.List;

public interface SupportMessageService {

    SupportMessage saveSupportMessage(SupportMessage message);

    List<SupportMessage> getAllMessages();

    SupportMessage updateMessageReply(Long id, String adminReply);

    List<SupportMessage> getMessagesByUserId(Long userId);
}
