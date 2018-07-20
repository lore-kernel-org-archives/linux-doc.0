Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A61C7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 00:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730679AbeGTBMX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 21:12:23 -0400
Received: from mail-io0-f193.google.com ([209.85.223.193]:39284 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730213AbeGTBMX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 21:12:23 -0400
Received: by mail-io0-f193.google.com with SMTP id o22-v6so7522616ioh.6;
        Thu, 19 Jul 2018 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=J4Lk8nsPzRRGZvWR2Xm4oyDudDUrXKNQVGg5/IMdGNM=;
        b=Yu9dm2dz2ptrLxSCLYqMf5+yS9uh/4eFEC2cRMnbvAhX//itQAsihAzUQqRdVGt7M9
         Bc0/1YiMQgPupan3sTovfhrzWG50KgyA1LO064uLLv1HmQ6tYwW9A3XM5u0iwzCV8ytV
         k9r0cL2DAw+cuhICrIZRALayrwQlTOP22Ix4CgfLmpsj0niahHXUtJq/FO/YPN9xOS8/
         9JMPvfhoRO+SOiDxBjOX60+vbtc+53P9hTckKmm8IUqKJeY5AhyKXX9VttK/aJKSG0if
         RAHeS/c31Jo6vezX+mmGA3psyFht0remMpm1eouoBbcVyOYh87L1qh1vXJn/Ra2vAwRj
         JeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=J4Lk8nsPzRRGZvWR2Xm4oyDudDUrXKNQVGg5/IMdGNM=;
        b=LAEmIGwEuNni0azxpiKg5bzym0iplvVYDOx3mvSsnula1LKkSgkFHKiJ5JzUGFa9tH
         GdIWA4m3zKLx/brpFNOjhynqYJqvjnOiL+f9vhYavp65Ti3x6/od2mandf9ohsbZGY3b
         BYhqon8d1nHW/8VUdz56QzOl26WtqHWZokMz8aGNDeYrvm0W7fCAkxD7ws3oZF4KszUB
         JdMpFA2BiyRRpAwCx4MEyA8LkRYOPbfcBAM7h4EkYar2joMgfX86uFDJ1hESOLIrXV4h
         JjPpC98d/DD92lV48gK2P7pynJonDQk7dpOK+Wikw1719USGuFmFKw8jTOij1iPVXu7U
         Mv7A==
X-Gm-Message-State: AOUpUlE0WN7YFuPVN5orG5J/p/sZ2pnqLs3zfsOun1FLtzrIhOEEI8vF
        fkNBMbwrQgVlUxnJsi7i9IPQdqhbfbF1P76wNHY=
X-Google-Smtp-Source: AAOMgpfZJAiHTIcCLyYCYojEDN+MEqT7LBSKOQPPeJx3DexYcKjs5uWjJD/EPBxB4r3Q6NPdkwvRLU2fqbswPfikwc0=
X-Received: by 2002:a6b:3b47:: with SMTP id i68-v6mr10374956ioa.133.1532046406995;
 Thu, 19 Jul 2018 17:26:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:2c9:0:0:0:0:0 with HTTP; Thu, 19 Jul 2018 17:26:46 -0700 (PDT)
In-Reply-To: <CAG48ez3EyU=ROBczUdHEuOYBtZghYqOpq3K16Bs4RQLO1OO6oA@mail.gmail.com>
References: <20180719213802.17161-1-ahmedsoliman0x666@gmail.com>
 <20180719213802.17161-4-ahmedsoliman0x666@gmail.com> <CAG48ez3EyU=ROBczUdHEuOYBtZghYqOpq3K16Bs4RQLO1OO6oA@mail.gmail.com>
From:   Ahmed Soliman <ahmedsoliman0x666@gmail.com>
Date:   Fri, 20 Jul 2018 02:26:46 +0200
Message-ID: <CAAGnT3aQhvHJ4H1vaTYiYotN022wh1if76=xywTVGqA5o_UQrA@mail.gmail.com>
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

On 20 July 2018 at 00:59, Jann Horn <jannh@google.com> wrote:
> On Thu, Jul 19, 2018 at 11:40 PM Ahmed Abd El Mawgood

> Why are you implementing this in the kernel, instead of doing it in
> host userspace?

I thought about implementing it completely in QEMU but It won't be
possible for few reasons:

- After talking to QEMU folks I came up to conclusion that it when it
 comes to managing memory allocated for guest, it is always better to let
 KVM handles everything, unless there is a good reason to play with that
 memory chunk inside QEMU itself.
- But actually there is a good reason for implementing ROE in kernel space,
 it is that ROE is architecture dependent to great extent. I should have
 emphasized that the only currently supported architecture is X86. I am
 not sure how deep the dependency on architecture goes. But as for now
 the current set of patches does a SPTE enumeration as part of the process.
 To my best knowledge, this isn't exposed outside arch/x68/kvm let alone
 having a host user space interface for it. Also the way I am planning to
 protect TLB from malicious gva -> gpa mapping is by knowing that in x86
 it is possible to VMEXIT on page faults, I am not sure if it will safe to
 assume that all kvm supported architectures will behave this way.

For these reasons I thought it will be better if arch dependent stuff (the
mechanism implementation) is kept in arch/*/kvm folder and with minimal
modifications to virt/kvm/* after setting a kconfig variable to enable ROE.
But I left room for the user space app using kvm to decide the rightful policy
for handling ROE violations. The way it works by KVM_EXIT_MMIO error to user
space, keeping all the architectural details hidden away from user space.

A last note is that I didn't create this from scratch, instead I extended
KVM_MEM_READONLY implementation to also allow R/O per page instead
R/O per whole slot which is already done in kernel space.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
