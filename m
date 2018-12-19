Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F5BE7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Dec 2018 19:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbeLSTDL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Dec 2018 14:03:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37439 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730168AbeLSTDL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Dec 2018 14:03:11 -0500
Received: by mail-ot1-f67.google.com with SMTP id 40so20116196oth.4
        for <linux-doc@vger.kernel.org>; Wed, 19 Dec 2018 11:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YBSayooM6cyUUAhkVTY2kepW7RV6B37vyFu72FXyP+c=;
        b=hdAPwFpBqxaXmX5hBBlSPmZvWs62lWea89VdWbbydwIXg4SswU2MxcLxstsiH38I4o
         kp9urJ64nCyqlUKklIFLjCz19yVVx3Sz8QqzoytG13yev7Sz0TfpjL+gDerD7CUp6jqL
         mXEc7zyT6IqE3IphmzwqDhWfdvsD0HDYWm/Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YBSayooM6cyUUAhkVTY2kepW7RV6B37vyFu72FXyP+c=;
        b=e3NFAXxKbX0A2L3PbbntaIUWHnc6/nH7eRoj8YMHk0VZKvUzId5IePs9mqVQbGtTa0
         TA9fQFs6BRQHIjGb6kCvt8YwRwznrZswJ2Y/YI9zci1I1UToSDFNmeljcw8NnzwnIMcE
         ihyZJ2aktV3OZ+jrSaqTrt0b0BfLT697SQrjO3xrL0AWEc12VnekN/2lmaRZvw8Rabp5
         H1JTgebQgL0T4UzpzpNL8BEJE/6yC7zRVj9YLFy/+DQRq10rgvtwtn0JKPEW7oxuCUcv
         PwPei3S6G53PB9BnrtGFjd263mMAC4h+ytN9cIU4gmouQdIiMt3gnnEXwjKpOX6cyQYR
         a5sQ==
X-Gm-Message-State: AA+aEWYb1KliEQ7GujTwXLZ+Lv8fYHCBGBU3VHyPJA7JMw5LURt8TceY
        BlGIDI3MI/lD+UlrJFa3X/2I1h0sSfuh9txAdc/R3zto
X-Google-Smtp-Source: AFSGD/XMThmTIURvoVYMN5QLMIQAoEeWjZHBbkhrHbZ4Lj0DFiXonm6T5nxbxIfOFYNujx8nuB5YlDoII1ZLG+33m3k=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr893126oth.317.1545246189690;
 Wed, 19 Dec 2018 11:03:09 -0800 (PST)
MIME-Version: 1.0
References: <0184EA26B2509940AA629AE1405DD7F201FFC21E@dggema523-mbx.china.huawei.com>
 <c01e3ed0-f66c-f7df-295a-70b44bad49ff@arm.com>
In-Reply-To: <c01e3ed0-f66c-f7df-295a-70b44bad49ff@arm.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Wed, 19 Dec 2018 19:02:58 +0000
Message-ID: <CAFEAcA8No4tti6o9oErdfGKyHqRTfXebO4fuEOhBApFAxw=LOg@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH] kvm: arm64: export memory error recovery
 capability to user space
To:     James Morse <james.morse@arm.com>
Cc:     gengdongjiu <gengdongjiu@huawei.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 17 Dec 2018 at 15:56, James Morse <james.morse@arm.com> wrote:
> I think the root issue here is the name of the cpufeature 'RAS Extensions', this
> doesn't mean RAS is new, or even requires these features. It's just standardised
> records, classification and a barrier.
> Not only is it possible to build a platform that supports RAS without this
> extensions: there are at least three platforms out there that do!
>
>
> On 15/12/2018 00:12, gengdongjiu wrote:
> >> On Fri, 14 Dec 2018 at 13:56, James Morse <james.morse@arm.com> wrote:
> >>> On 14/12/2018 10:15, Dongjiu Geng wrote:
> >>>> When user space do memory recovery, it will check whether KVM and
> >>>> guest support the error recovery, only when both of them support,
> >>>> user space will do the error recovery. This patch exports this
> >>>> capability of KVM to user space.
> >>>
> >>> I can understand user-space only wanting to do the work if host and
> >>> guest support the feature. But 'error recovery' isn't a KVM feature,
> >>> its a Linux kernel feature.
>
> [...]
>
> > Thanks Peter's explanation. Frankly speaking, I agree Peter's suggestion.
> >
> > To James, I explain more to you, as peter said QEMU needs to check whether
> > the guest CPU is a type which can handle the error though guest ACPI table.
>
> I don't think this really matters. Its only the NMIlike notifications that the
> guest doesn't have to register or poll. The ones we support today extend the
> architectures existing behaviour: you would have taken an external-abort on a
> real system, whether you know about the additional metadata doesn't matter to Qemu.

Consider the case where we booted the guest using a DTB and no ACPI
table at all -- we certainly can't just call QEMU code that tries to
add entries to a nonexistent table. My main point is that there
needs to be logic in Dongjiu's QEMU patches that checks more than
just "does this KVM feature exist". I'm not sufficiently familiar
with all this RAS stuff to be certain what those checks should
be and what the right choices are; I just know we need to check
*something*...

> > Let us see the X86's QEMU logic:
> > 1. Before the vCPU created, it will set a default env->mcg_cap value with
>
> > MCE_CAP_DEF flag, MCG_SER_P means it expected the guest CPU model supports
> > RAS error recovery.[1] 2. when the vCPU initialize, it will check whether host
> > kernel support this feature[2]. Only when host kernel and default env->mcg_cap
> > value all expected this feature, then it will setup vCPU support RAS error
> > recovery[3].
>
> This looks like KVM exposing a CPU capability to Qemu, which then configures the
> behaviour KVM gives to the guest. This doesn't tell you anything about what the
> guest supports.

It tells you what the *guest CPU* supports, which for x86 is a combination
of (a) what did the user/machine model ask for and (b) what can KVM
actually implement. I don't much care whether the guest OS supports
anything or not, that's its business... but it does seem odd to me
that the equivalent Arm code is not similarly saying "what were we
asked for, and what can we do?".

I think one question here which it would be good to answer is:
if we are modelling a guest and we haven't specifically provided
it an ACPI table to tell it about memory errors, what do we do
when we get a sigbus from the host? We have basically two choices:
 (1) send the guest an SError (aka asynchronous external abort)
     anyway (with no further info about what the memory error is)
 (2) just stop QEMU (as we would for a memory error in QEMU's
     own memory)

thanks
-- PMM
