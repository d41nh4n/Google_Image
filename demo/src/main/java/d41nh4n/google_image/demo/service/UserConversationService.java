package d41nh4n.google_image.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import d41nh4n.google_image.demo.dto.respone.ConversationExsisted;
import d41nh4n.google_image.demo.entity.Conversation.UserConversation;
import d41nh4n.google_image.demo.repository.UserConversationRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserConversationService {

    private final UserConversationRepository userConversationRepository;

    public void save(UserConversation conversation) {
        userConversationRepository.save(conversation);
    }

    // public Optional<List<UserConversation>> findByUsersInConversation(String
    // conversationId) {
    // return userConversationRepository.findByConversationId(conversationId);
    // }

    public List<ConversationExsisted> findConversationByUserId(String user) {
        return userConversationRepository.findConversationsByUserId(user);
    }
}
