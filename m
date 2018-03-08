Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 994047E676
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 06:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935225AbeCHGSH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 01:18:07 -0500
Received: from mail-ua0-f194.google.com ([209.85.217.194]:42710 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935211AbeCHGSE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 01:18:04 -0500
Received: by mail-ua0-f194.google.com with SMTP id b23so3178671uak.9;
        Wed, 07 Mar 2018 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=zFhUIMQnQda98x1LG2YYdoKDEi2sCF/lhpUjyCwOxaM=;
        b=pLMmadqKzkinzcc/UtWETOZENK9ZPnWU3D1gp8PdpVbrukSpGOVqa/D9Lsqo3l7Kx0
         aZWCoMopJHUavfsYYbMtlpbcQ2Yd1kxnCe7C8Kj5/WuQYAJEUUfBTv1/YbKk94DhmJLg
         22EOdN2bIrHy6inwwYhJ6xq55QxWrSQFQrQsCBJU/UvuXuJHx1vVKwwUl3l7eYn0CHFq
         l526sjGZwJn9vF7vXYvUmmkGr0Q6h4N7Nb4jFXK+9jh7k1dnVsNW230cRWCRQBrMcuzK
         3nonE2ofcsWRe9YWUaWpPersjtK7ixSQ+gJDa4WCzrZVWxrti2tf/G5EbaeglwzHQEwW
         10GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=zFhUIMQnQda98x1LG2YYdoKDEi2sCF/lhpUjyCwOxaM=;
        b=kAP+j/bSB3znRJ4PDZ91F8g/zONJiF4mP+5aD44HFz2lC+nN5nqCVZHj39z/4l2df3
         PZalP/4BWso0K/a/Do1EXsVbG3Y11EU45BSAcafqd/59PXBQ5YkKk+m6LmeTcTwGwsJ8
         5K9slqhFcDfjbpDB5icWdVmHJo+bIGJO8qAWRpNI1LoZ0dHUXP3hwRuQNHX73pJ0c5H5
         yZ6dFcxSXxgWxpnpTMYTHpEjdtS3qLgkZJc7bKUf6+S3FxiLgAZ9LyVXFYfAGd/TUBWm
         pOFDPIgNlz4+ZQKjn7NAq5OTI9oFKN8yeHacHavCNISO94564PQk2y/n3L9XUW4qh/vY
         ABWQ==
X-Gm-Message-State: APf1xPBuqlawpmhSsK0s2fvX/S6Y7SoFpSZKsY/Trt9jNim/LmLXg1k+
        AeJBAVs/rJ0H5hsldzKiSRP4RBpdybSTUI53rFPiEQ==
X-Google-Smtp-Source: AG47ELvSUt0R2h1kPKUB+Ch8SkOGFf1ll3j++M7BbTbB7QKzcdcY5LW3B9SCqaU2slnP4/G2cWKUNxFPhDuvqsIYCjc=
X-Received: by 10.176.27.3 with SMTP id d3mr17077745uai.60.1520489883454; Wed,
 07 Mar 2018 22:18:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.35.193 with HTTP; Wed, 7 Mar 2018 22:18:02 -0800 (PST)
In-Reply-To: <5A85C974.70500@arm.com>
References: <0184EA26B2509940AA629AE1405DD7F201A9E8EA@DGGEMA503-MBS.china.huawei.com>
 <5A70C5A0.1050600@arm.com> <d1b17dae-9d9c-970a-d164-a41c618d449b@huawei.com>
 <5A7DDDEE.9050306@arm.com> <93d07d3e-8388-7814-d674-538071d84e2a@huawei.com> <5A85C974.70500@arm.com>
From:   gengdongjiu <gengdj.1984@gmail.com>
Date:   Thu, 8 Mar 2018 14:18:02 +0800
Message-ID: <CAMj-D2COh4xDKreZXPHeiJK34mrPqDbHszDWY-fz_SfxTRaHQA@mail.gmail.com>
Subject: Re: [PATCH v9 5/7] arm64: kvm: Introduce KVM_ARM_SET_SERROR_ESR ioctl
To:     James Morse <james.morse@arm.com>, drjones@redhat.com
Cc:     gengdongjiu <gengdongjiu@huawei.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "marc.zyngier@arm.com" <marc.zyngier@arm.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "robert.moore@intel.com" <robert.moore@intel.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "bp@alien8.de" <bp@alien8.de>,
        "lv.zheng@intel.com" <lv.zheng@intel.com>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        "devel@acpica.org" <devel@acpica.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi James,
   sorry for my late response due to chines new year.

2018-02-16 1:55 GMT+08:00 James Morse <james.morse@arm.com>:
> Hi gengdongjiu,
>
> On 12/02/18 10:19, gengdongjiu wrote:
>> On 2018/2/10 1:44, James Morse wrote:
>>> The point? We can't know what a CPU without the RAS extensions puts in there.
>>>
>>> Why Does this matter? When migrating a pending SError we have to know the
>>> difference between 'use this 64bit value', and 'the CPU will generate it'.
>>> If I make an SError pending with ESR=0 on a CPU with VSESR, I can't migrated to
>>> a system that generates an impdef SError-ESR, because I can't know it will be 0.
>
>> For the target system, before taking the SError, no one can know whether its syndrome value
>> is IMPLEMENTATION DEFINED or architecturally defined.
>
> For a virtual-SError, the hypervisor knows what it generated. (do I have
> VSESR_EL2? What did I put in there?).
>
>
>> when the virtual SError is taken, the ESR_ELx.IDS will be updated, then we can know
>> whether the ESR value is impdef or architecturally defined.
>
> True, the guest can't know anything about a pending virtual SError until it
> takes it. Why is this a problem?
>
>
>> It seems migration is only allowed only when target system and source system all support
>> RAS extension, because we do not know whether its syndrome is IMPLEMENTATION DEFINED or
>> architecturally defined.
>
> I don't think Qemu allows migration between hosts with differing guest-ID
> registers. But we shouldn't depend on this, and we may want to hide the v8.2 RAS
> features from the guest's ID register, but still use them from the host.
>
> The way I imagined it working was we would pack the following information into
> that events struct:
> {
>         bool serror_pending;
>         bool serror_has_esr;
>         u64  serror_esr;
> }

I have used your suggestion struct

>
> The problem I was trying to describe is because there is no value of serror_esr
> we can use to mean 'Ignore this, I'm a v8.0 CPU'. VSESR_EL2 is a 64bit register,
> any bits we abuse may get a meaning we want to use in the future.
>
> When it comes to migration, v8.{0,1} systems can only GET/SET events where
> serror_has_esr == false, they can't use the serror_esr. On v8.2 systems we
> should require serror_has_esr to be true.
yes, I agreed.

>
> If we need to support migration from v8.{0,1} to v8.2, we can make up an impdef
> serror_esr.

For the Qemu migration, I need to check more the QEMU code.


Hi Andrew,
      I use KVM_GET/SET_VCPU_EVENTS IOCTL to migrate the Serror
exception status of VM,
The even struct is shown below:

{
      bool serror_pending;
      bool serror_has_esr;
     u64  serror_esr;
}

Only when the target machine is armv8.2, it needs to set the
serror_esr(SError Exception Syndrome Register).
for the armv8.0,  software can not set the serror_esr(SError Exception
Syndrome Register).
so when migration from v8.{0,1} to v8.2, QEMU should make up an impdef
serror_esr for the v8.2 target.
can you give me some suggestion how to set that register in the QEMU?
I do not familar with the QEMU migration.
Thanks very much.

>
> We will need to decide what KVM does when SET is called but an SError was
> already pending. 2.5.3 "Multiple SError interrupts" of [0] has something to say.

how about KVM set again to the same VCPU?

>
>
> Happy new year,
thanks!

>
> James
>
>
> [0]
> https://static.docs.arm.com/ddi0587/a/RAS%20Extension-release%20candidate_march_29.pdf
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
