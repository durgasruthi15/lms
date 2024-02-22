package lms.lms.controller;
import lms.lms.model.Member;
import lms.lms.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/{memberId}")
    public Member getMember(@PathVariable Long memberId){
        return memberService.getMember(memberId);
    }

    // create a member
    @PostMapping
    public Member createMember(@RequestBody  Member member){
        return memberService.createMember(member);
    }

    @PutMapping("/{memberId}")
    public Member updateMember(@PathVariable Long memberId,@RequestBody Member member){
        return memberService.updateMember(memberId,member);
    }
    @DeleteMapping("/{memberId}")
    public void deleteMember(@PathVariable Long memberId){
         memberService.deleteMember(memberId);
    }


}