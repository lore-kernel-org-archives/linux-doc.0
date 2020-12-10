Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380B9C0018C
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 18:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD9CA23E1D
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 18:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388961AbgLJSPh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 13:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392761AbgLJSOG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 13:14:06 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6304C061793
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 10:13:25 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id b10so5430860ljp.6
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 10:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et/f3RjbZyuZ9JQ6heD+AHbTOUp1bUm1tRV1afS0ffo=;
        b=v19m+I06m7joT/AcjLb0tMF6lAJ5V8z+FKPko5snmNCFHTPv3bdEHyAb+gPnz4se2R
         +INSchsHDnXs6CHDwyr1OX9D7lgsQLp0+HpPcFPNqyTm2K0h1yTcKG2yEcdN7vKYkDxZ
         /r5QdIJlQZDG0tU68JwmcZR5S+hOa0hDvt1zdO/fcLCeGHukWpFmaF2PxrCHxWjHeiE0
         gaBxJ0NFtD5oc7137LS/skmzqx28uL8EH24BWt9F/nsw2pVhq6uhRBMeYbwhLkauiQ4g
         kiZ0QTjeICTynLVhctWqyARIy3ebvmQcwkfwaIqdz4p+gTYl4zTCqUoRiuFb3GKZl3vD
         QPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=et/f3RjbZyuZ9JQ6heD+AHbTOUp1bUm1tRV1afS0ffo=;
        b=IFfwMbAEorUH8f0nzt7YtyNUNNemZ/vmD4iPRcjIYn3ItJU9zEpFVAdlz0PqhghMmU
         QMDxbx4674923dj3okT7b13YHL4ZvsqfDuVplMF4urnf8RoBq8JPKtO+0LtG4FOOcH49
         B2P/7KFrz1F89VBfns1xnvO6bVxL4U0OWGKYVknb8QEsBVXrye/d09BIseuNW/eYP9hC
         XTZn2yNt540XLEM2dK68wybzDRwxQl4gLELuaB8fEXG+9o6AvuNBH50FMiO1RP6AR5xg
         s268uR6pJk/aKD8yLUjwq/cS1+/o0DjDjmsuFKj/WTxqgDR17+lc8Q7gOo6BewkmomAT
         ieMw==
X-Gm-Message-State: AOAM533REudJwQuCAtm1KdVFtgPxqn7fqt2Z2+4bt84NfPd5oYlL+6yE
        1PVft4bYsskVODivwxdCp40MYHJ3jxL9aDdsBjyqKg==
X-Google-Smtp-Source: ABdhPJz6mHpgMVqJUnrdAcxtrWUH9N8Z8HVVDmP+wLkbZLA/HDgRzT6WQeKWJ0VSyM8PZFXMwJ9fVjlXIYWpFEccPKQ=
X-Received: by 2002:a2e:961a:: with SMTP id v26mr3699249ljh.314.1607624003934;
 Thu, 10 Dec 2020 10:13:23 -0800 (PST)
MIME-Version: 1.0
References: <9389c1198da174bcc9483d6ebf535405aa8bdb45.camel@redhat.com>
 <E4F263BE-6CAA-4152-8818-187D34D8D0FD@amacapital.net> <CAOQ_QshW0UvwSS3TUCK5PxkLQhHTqDNXNeMxwVDyf+DXc23fXQ@mail.gmail.com>
 <eb0cbfaa-251a-810b-3c12-4ee63d082bc8@redhat.com>
In-Reply-To: <eb0cbfaa-251a-810b-3c12-4ee63d082bc8@redhat.com>
From:   Oliver Upton <oupton@google.com>
Date:   Thu, 10 Dec 2020 12:13:12 -0600
Message-ID: <CAOQ_QsggH=RaPbiOTGjDviKUCa0r4YgJjLsP7ghUGbcVtr2YJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Andy Lutomirski <luto@amacapital.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        kvm list <kvm@vger.kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 12:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 10/12/20 18:59, Oliver Upton wrote:
> > However, I don't believe we can assume the guest's TSCs to be synchronized,
> > even if sane guests will never touch them. In this case, I think a per-vCPU
> > ioctl is still warranted, allowing userspace to get at the guest CPU adjust
> > component of Thomas' equation below (paraphrased):
> >
> >          TSC guest CPU = host tsc base + guest base offset + guest CPU adjust
>
> Right now that would be:
>
> - KVM_GET_TSC_STATE (vm) returns host tsc base + guest base offset (plus
> the associated time)
>
> - KVM_GET_MSR *without* KVM_X86_QUIRK_TSC_HOST_ACCESS for guest CPU adjust
>
> and the corresponding SET ioctls.  What am *I* missing?
>
> > Alternatively, a write from userspace to the guest's IA32_TSC_ADJUST with
> > KVM_X86_QUIRK_TSC_HOST_ACCESS could have the same effect, but that seems to be
> > problematic for a couple reasons. First, depending on the guest's CPUID the
> > TSC_ADJUST MSR may not even be available, meaning that the guest could've used
> > IA32_TSC to adjust the TSC (eww).
>
> Indeed, the host should always be able to read/write IA32_TSC and
> IA32_TSC_ADJUST.

So long as it is guaranteed that guest manipulations of IA32_TSC are
reflected in IA32_TSC_ADJUST even if it isn't in the guest's CPUID,
then this seems OK. I think having clear documentation on this subject
is also necessary, as we're going to rely on the combination of
KVM_{GET,SET}_TSC_STATE, disabling KVM_X86_QUIRK_TSC_HOST_ACCESS, and
userspace reading/writing a possibly hidden MSR to pull this off
right.

--
Thanks,
Oliver

> Thanks,
>
> Paolo
>
> > Second, userspace replaying writes to IA32_TSC
> > (in the case IA32_TSC_ADJUST doesn't exist for the guest) seems_very_
> > unlikely to work given all the magic handling that KVM does for
> > writes to it.
> >
> > Is this roughly where we are or have I entirely missed the mark?:-)
>
