Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 35B977D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 14:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731821AbeGTPdP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 11:33:15 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:54429 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731699AbeGTPdP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jul 2018 11:33:15 -0400
Received: by mail-it0-f67.google.com with SMTP id s7-v6so14980311itb.4;
        Fri, 20 Jul 2018 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=KAPbA5bTicJEEEqpqlpLggBFAhmc/Vw8hpfD1ZhNeeA=;
        b=NQn/Gudtfpa57idjqRh9M1kFshjxJi2fW4R01aBN3xMHUW+b7sjpbtQdReK+kOXBQe
         x7HnXSoOWdG4OKkZgraoAcODBlzLp0ZxFlJDUlsHkTtNZgFhdIh+QESIE0xH9JXc9Z4c
         hP0aAt3cFWmeAhbhGo9vLt/xK2moZ4Q90Wmdz+5GHWK7OTbYj2oGeXAR+mYSp15YHonI
         QihEMFpGmX4GmT32s3VLGpKBiEtJF8TgBkhQ16UnFr5ZMVPdhW91gEtl5a9AtCmXVWsg
         hRffSRWILWLLoxoC+QtBkkibB9x33OWMky8t57d6EhhK9qaYyCbZDvkOPzF/jkzSjsXM
         cgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=KAPbA5bTicJEEEqpqlpLggBFAhmc/Vw8hpfD1ZhNeeA=;
        b=Kr2x77jDEJcq5CRRbIiXmjGFDufm+4OvvE9QTGoLcgg2oDKH0wNhqnzu+yEbyye8ie
         zMRbj7Fs8qhFji3Ju+amPKXEYQyw7T34i+27PeH8nehPieqzuPdGsRvwAyg9w77jA/uh
         PoSCqk4PWC34QGTjNhSkVM+LxF4HrGefs5aq+waVLi7upehytKpdhws2u7t3YXkeEYdd
         9Ciza5IwuhNk3xS6Nq1tSnyLL7hJZtwH9LdBSNS24qRXfiAopqPMoo24BoXED7wO8oOO
         1q/jcS1wa3A9tsy5DI8tHLGeGPgwAHu5gpDPOLyN80eVe+RfY11erwVYsk/MtnWF3oHj
         5IRw==
X-Gm-Message-State: AOUpUlF4BXkeycnqa/y1BfpDiHrIPe64LxdG8UeCqF6fDe7t1hI0PfnQ
        hVascUb3tGKhN3Q1obpR5I0Ks1D2f0J1oOqFAMM=
X-Google-Smtp-Source: AAOMgpcB4h0Hqm6aWpzNcYPCDM6VbhZqbcyed/d43QC0hyu3+Pwp0JUW6NZkP5dESdTXERCPO0Y+HGEVMSEClhIxRGE=
X-Received: by 2002:a24:dec5:: with SMTP id d188-v6mr2014182itg.123.1532097877879;
 Fri, 20 Jul 2018 07:44:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:2c9:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 07:44:37 -0700 (PDT)
In-Reply-To: <CAG48ez0+KiOhyX1R3=FjWQe5M0MFZ5GC=AkV6ZiSYK3OBXsS+A@mail.gmail.com>
References: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
 <20180719213802.17161-4-ahmedsoliman0x666@gmail.com> <CAG48ez3EyU=ROBczUdHEuOYBtZghYqOpq3K16Bs4RQLO1OO6oA@mail.gmail.com>
 <CAAGnT3aQhvHJ4H1vaTYiYotN022wh1if76=xywTVGqA5o_UQrA@mail.gmail.com> <CAG48ez0+KiOhyX1R3=FjWQe5M0MFZ5GC=AkV6ZiSYK3OBXsS+A@mail.gmail.com>
From:   Ahmed Soliman <ahmedsoliman0x666@gmail.com>
Date:   Fri, 20 Jul 2018 16:44:37 +0200
Message-ID: <CAAGnT3a9ckTt3+ati5Xi=7=pcDiXkasZP=t0hrsp9Tw-B6p5DQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC V3] KVM: X86: Adding skeleton for Memory ROE
To:     Jann Horn <jannh@google.com>
Cc:     kvm@vger.kernel.org,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        virtualization@lists.linux-foundation.org,
        linux-doc@vger.kernel.org,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Boris Lukashev <blukashev@sempervictus.com>,
        David Vrabel <david.vrabel@nutanix.com>, nigel.edwards@hpe.com,
        Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20 July 2018 at 03:28, Jann Horn <jannh@google.com> wrote:
> On Fri, Jul 20, 2018 at 2:26 AM Ahmed Soliman
> <ahmedsoliman0x666@gmail.com> wrote:
>>
>> On 20 July 2018 at 00:59, Jann Horn <jannh@google.com> wrote:
>> > On Thu, Jul 19, 2018 at 11:40 PM Ahmed Abd El Mawgood
>>
>> > Why are you implementing this in the kernel, instead of doing it in
>> > host userspace?
>>
>> I thought about implementing it completely in QEMU but It won't be
>> possible for few reasons:
>>
>> - After talking to QEMU folks I came up to conclusion that it when it
>>  comes to managing memory allocated for guest, it is always better to let
>>  KVM handles everything, unless there is a good reason to play with that
>>  memory chunk inside QEMU itself.
>
> Why? It seems to me like it'd be easier to add a way to mprotect()
> guest pages to readonly via virtio or whatever in QEMU than to add
> kernel code?

I did an early prototype with mprotect(), But then mprotect() didn't do exactly
what I wanted, The goal here is to prevent the guest from writing to protected
page but allow the host to do if it ever needs to at the same time.
mprotect() will
either allow both host and guest, or prevent both host and guest. Even though I
can not come up with a use case where one might need to allow host to read/write
to a page but prevent guest from writing to that page, I think that it
is a limitation
that will cost complete redesign if it proves that this kind of
behavior is undesired.
Also mprotect is kind of inflexible. Writing to mprotected pages would
immediately
trigger SIGSEGV and then userspace process will have to handle that
fault in order
to control the situation. That sounded to me more like a little hack
than a solid design.


> And if you ever want to support VM snapshotting/resumption, you'll
> need support for restoring the protection flags from QEMU anyway.

I never thought about that, but thanks for letting me know. I will keep that in
my TODO list.


>> - But actually there is a good reason for implementing ROE in kernel space,
>>  it is that ROE is architecture dependent to great extent.
>
> How so? The host component just has to make pages in guest memory
> readonly, right? As far as I can tell, from QEMU, it'd more or less be
> a matter of calling mprotect() a few times? (Plus potentially some
> hooks to prevent other virtio code from crashing by attempting to
> access protected pages - but you'd need that anyway, no matter where
> the protection for the guest is enforced.)

I don't think that virtio would crash that way, because host should be
able write to memory
as it wants. but yet I see where there is this going, probably I can
add hooks so that virtio
can respect the read only flags.


>> I should have
>>  emphasized that the only currently supported architecture is X86. I am
>>  not sure how deep the dependency on architecture goes. But as for now
>>  the current set of patches does a SPTE enumeration as part of the process.
>>  To my best knowledge, this isn't exposed outside arch/x68/kvm let alone
>>  having a host user space interface for it. Also the way I am planning to
>>  protect TLB from malicious gva -> gpa mapping is by knowing that in x86
>>  it is possible to VMEXIT on page faults, I am not sure if it will safe to
>>  assume that all kvm supported architectures will behave this way.
>
> You mean EPT faults, right? If so: I think all architectures have to
> support that - there are already other reasons why random guest memory
> accesses can fault. In particular, the host can page out guest memory.
> I think that's the case on all architectures?

Here my lack of full knowledge kicks in, I am not sure whether is EPT fault or
guest pf is what I want to capture validate. I think X86 can vm exit
on both. Due to
nature of ROE, guest user space code can not have ROE because it is
irreversible, so it will be safe to assume that only pages that are
not swappable
are the one's I would care about. still lots of the details are blurry for me.
But what I was trying to say is that there is always differences based
on architecture
that is why it will be better to do things in kernel module if we
decided not to use
mprotect method.


>> For these reasons I thought it will be better if arch dependent stuff (the
>> mechanism implementation) is kept in arch/*/kvm folder and with minimal
>> modifications to virt/kvm/* after setting a kconfig variable to enable ROE.
>> But I left room for the user space app using kvm to decide the rightful policy
>> for handling ROE violations. The way it works by KVM_EXIT_MMIO error to user
>> space, keeping all the architectural details hidden away from user space.
>>
>> A last note is that I didn't create this from scratch, instead I extended
>> KVM_MEM_READONLY implementation to also allow R/O per page instead
>> R/O per whole slot which is already done in kernel space.
>
> But then you still have to also do something about virtio code in QEMU
> that might write to those pages, right?

Probably yes, still I haven't fully planned that yet. But I was thinking about
if I can make use of IOMMU protection for DMA and have something
similar for emulated devices backed by virtio.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
