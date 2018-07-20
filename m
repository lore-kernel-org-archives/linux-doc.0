Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6DB177D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 01:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbeGTCOa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 22:14:30 -0400
Received: from mail-oi0-f67.google.com ([209.85.218.67]:46847 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbeGTCOa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 22:14:30 -0400
Received: by mail-oi0-f67.google.com with SMTP id y207-v6so18477838oie.13
        for <linux-doc@vger.kernel.org>; Thu, 19 Jul 2018 18:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqi0IEh2fmxDA1oblTuh04rP1yjTAkA8FqJ6V/aQsZw=;
        b=jpQV+wVLeDPVrBYm25FUF7BH0CC17teNY+xr6bhiHI79OpzlGoFmlBi12WsIrrGGYH
         vjIPWIUa+waQwrEgPCH9yF4Kd7XkQcGrkuJHBgeVpeIv3Tq2FunlLreMuihR+/SUITFM
         uYqeDllv2knCSTGd0qIUVDR3kKhzZiNGASqE7fKEPhcw1D9SHWjYirIyoKQWMtHJjqO+
         pqtisLrRI0zwEf5q/xxJ5JsmXIbD7e/nJMq+lct0gk3vP+rlTrY+kVWZW1opqPYMUlJh
         mqRmXEFfIiriHmqu/m4jFRvSPyq3pGRK19SZr/3DfCQafZiOP/mFEkLOu+0ZLuZ5Ruca
         /rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqi0IEh2fmxDA1oblTuh04rP1yjTAkA8FqJ6V/aQsZw=;
        b=uj5lkuidsCQxoN6iXoeugkPXzcOd49DRSXWjJ6FWe/m0ZCxYY2cRRluCCoCMWp3sv7
         By4keI4yMJlq8h2kEAppzl2GcV4Kavs6aDv9r+yQ2RlPPffTUhSWApxGNlnXJa/HpGS5
         OMl4ssqafzyPXJWycb9vy230LdpSrZU3EtRrTiDaaaMQREWgYAAVXu61QxGTR4r0IPyw
         1k4EZmiU0OzeuXnoKq8/+hxXUkFjmysgjxZoGBL7C8SQhD14c1xTA8EjKC5A2mwdOesp
         uT3vB2V6LR4JU/hiyaTkgxczhBMaUJbQDbkbCFjdi9GjGFbHexynVa6EqFjUYu2/6R5T
         Ye0w==
X-Gm-Message-State: AOUpUlHvRGo7DaV95yCwpMCCH2bwswsCP20riGM0gbRBz7wv3bJi/KVT
        PXtKXOSJHv6qdmqAnYtGBwLoEg4RzvNWzTib59IxKQ==
X-Google-Smtp-Source: AAOMgpfgfPWrYxUYy0Y1K4LS3Wc3RSU+DFsLLfkk+kcAgWUJ/s/E5tM4z9rYNlvaKLoBAGULxWPRR2L6kbKjLk7wVf8=
X-Received: by 2002:aca:5bd5:: with SMTP id p204-v6mr24374oib.91.1532050122322;
 Thu, 19 Jul 2018 18:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
 <20180719213802.17161-4-ahmedsoliman0x666@gmail.com> <CAG48ez3EyU=ROBczUdHEuOYBtZghYqOpq3K16Bs4RQLO1OO6oA@mail.gmail.com>
 <CAAGnT3aQhvHJ4H1vaTYiYotN022wh1if76=xywTVGqA5o_UQrA@mail.gmail.com>
In-Reply-To: <CAAGnT3aQhvHJ4H1vaTYiYotN022wh1if76=xywTVGqA5o_UQrA@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 20 Jul 2018 03:28:15 +0200
Message-ID: <CAG48ez0+KiOhyX1R3=FjWQe5M0MFZ5GC=AkV6ZiSYK3OBXsS+A@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC V3] KVM: X86: Adding skeleton for Memory ROE
To:     ahmedsoliman0x666@gmail.com
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
        Ard Biesheuvel <ard.biesheuvel@linaro.org>, david@redhat.com,
        Boris Lukashev <blukashev@sempervictus.com>,
        david.vrabel@nutanix.com, nigel.edwards@hpe.com, riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 20, 2018 at 2:26 AM Ahmed Soliman
<ahmedsoliman0x666@gmail.com> wrote:
>
> On 20 July 2018 at 00:59, Jann Horn <jannh@google.com> wrote:
> > On Thu, Jul 19, 2018 at 11:40 PM Ahmed Abd El Mawgood
>
> > Why are you implementing this in the kernel, instead of doing it in
> > host userspace?
>
> I thought about implementing it completely in QEMU but It won't be
> possible for few reasons:
>
> - After talking to QEMU folks I came up to conclusion that it when it
>  comes to managing memory allocated for guest, it is always better to let
>  KVM handles everything, unless there is a good reason to play with that
>  memory chunk inside QEMU itself.

Why? It seems to me like it'd be easier to add a way to mprotect()
guest pages to readonly via virtio or whatever in QEMU than to add
kernel code?

And if you ever want to support VM snapshotting/resumption, you'll
need support for restoring the protection flags from QEMU anyway.

> - But actually there is a good reason for implementing ROE in kernel space,
>  it is that ROE is architecture dependent to great extent.

How so? The host component just has to make pages in guest memory
readonly, right? As far as I can tell, from QEMU, it'd more or less be
a matter of calling mprotect() a few times? (Plus potentially some
hooks to prevent other virtio code from crashing by attempting to
access protected pages - but you'd need that anyway, no matter where
the protection for the guest is enforced.)

> I should have
>  emphasized that the only currently supported architecture is X86. I am
>  not sure how deep the dependency on architecture goes. But as for now
>  the current set of patches does a SPTE enumeration as part of the process.
>  To my best knowledge, this isn't exposed outside arch/x68/kvm let alone
>  having a host user space interface for it. Also the way I am planning to
>  protect TLB from malicious gva -> gpa mapping is by knowing that in x86
>  it is possible to VMEXIT on page faults, I am not sure if it will safe to
>  assume that all kvm supported architectures will behave this way.

You mean EPT faults, right? If so: I think all architectures have to
support that - there are already other reasons why random guest memory
accesses can fault. In particular, the host can page out guest memory.
I think that's the case on all architectures?

> For these reasons I thought it will be better if arch dependent stuff (the
> mechanism implementation) is kept in arch/*/kvm folder and with minimal
> modifications to virt/kvm/* after setting a kconfig variable to enable ROE.
> But I left room for the user space app using kvm to decide the rightful policy
> for handling ROE violations. The way it works by KVM_EXIT_MMIO error to user
> space, keeping all the architectural details hidden away from user space.
>
> A last note is that I didn't create this from scratch, instead I extended
> KVM_MEM_READONLY implementation to also allow R/O per page instead
> R/O per whole slot which is already done in kernel space.

But then you still have to also do something about virtio code in QEMU
that might write to those pages, right?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
