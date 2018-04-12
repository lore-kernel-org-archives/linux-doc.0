Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DF6A07DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Apr 2018 05:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751112AbeDLFAY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Apr 2018 01:00:24 -0400
Received: from mail-ua0-f196.google.com ([209.85.217.196]:40529 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbeDLFAX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Apr 2018 01:00:23 -0400
Received: by mail-ua0-f196.google.com with SMTP id n20so2649558ual.7;
        Wed, 11 Apr 2018 22:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=32bpMdQslqwhhp7QJUG32Bdfu17N8b018r4cR9fS/i8=;
        b=Qd9DAdio27Tz64uatw4Zz2ljWeGBP0HlG2C+KLfgNYAWE4HF3EjbIhLmsGMY2pbtLn
         CViQq+vG8xM3YcUADAfGYh2Tif7OmM/nJ9RD1f6I21/26Q6KSWGIKYavxZnOnd9EpIj4
         rgpjwM9ipJxUJCKby3WizC2sMbCiq4Gq2qoNTQl2do0AcCWgZWlR9VT8PjjoJ5jqROZT
         GqpFtLlNo9vQ5oFMIkdkNNJgFLpYJbdPcu4C2KviUdz6iBFu3i3Y2pVwz4aLrK5TOJw6
         uS7JY0yj2WGFArMC6eXEKRr80RRzll1nW0BHoTqP31ZiGXK8Axfe7kb0iCuexNt0ArA5
         r7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=32bpMdQslqwhhp7QJUG32Bdfu17N8b018r4cR9fS/i8=;
        b=Eco2PhtffXABoEfNRZCmASBCxNJeb5O1/7rvugo4+J+ro5Wubld61vRJuP6C5SJJX2
         wG3sqKSeHM39jwk2D2iX9QTplVqTFTfTTxpVDn+f72/eb/7+6DZIFj/OvnJQMFXDMZQ1
         ZGPMfsPWTPLEQIAOijHFQcFPujEHkzgLwdF2RGNl2cvzT5EwxsgjdZavc282FyrAab57
         /ZXJVw+uScYTwOfzzYVY68MRlqNhEK+tT8/A7gykY4Px6zNX2kTS9NKNqqu5FwsJE5U3
         /Po5x1q8bCQuE24v9x8ggx3cVOEW/eRCpP40tPvuoaL4V5IPGRaMyZ/CYZ2pnArF7dym
         iRMQ==
X-Gm-Message-State: ALQs6tBszFNoTMEWMVAIAoFwYyhq8e8WIJddh6KExHg4odSXTqkCNvdV
        a869oqoAEvNpUDZ65XSoREdcpAqQnP7HMlQEApY=
X-Google-Smtp-Source: AIpwx49s3rtYlr0dIxvNg/wMtnq0/OZIJGkyTLStHZx6j2D47IoK+OyQbCGlktkv97jv4igXsYLL9Y5iluTg2kg919w=
X-Received: by 10.176.89.11 with SMTP id n11mr5522958uad.181.1523509222914;
 Wed, 11 Apr 2018 22:00:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.116.197 with HTTP; Wed, 11 Apr 2018 22:00:22 -0700 (PDT)
In-Reply-To: <5A85C97C.5080605@arm.com>
References: <0184EA26B2509940AA629AE1405DD7F201AC71DE@DGGEMA503-MBS.china.huawei.com>
 <5A85C97C.5080605@arm.com>
From:   gengdongjiu <gengdj.1984@gmail.com>
Date:   Thu, 12 Apr 2018 13:00:22 +0800
Message-ID: <CAMj-D2CEcNjdi8VkSMw0aTqeb678nFnBKiq5ggix3gJhzkgSEA@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] acpi: apei: Add SEI notification type support for ARMv8
To:     James Morse <james.morse@arm.com>, lishuo1@hisilicon.com,
        merry.libing@hisilicon.com
Cc:     gengdongjiu <gengdongjiu@huawei.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "Liujun (Jun Liu)" <liujun88@hisilicon.com>,
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

Dear James,
        Thanks for this mail and sorry for my late response.


2018-02-16 1:55 GMT+08:00 James Morse <james.morse@arm.com>:
> Hi gengdongjiu, liu jun
>
> On 05/02/18 11:24, gengdongjiu wrote:
[....]
>>
>>> Is the emulated SError routed following the routing rules for HCR_EL2.{AMO,
>>> TGE}?
>>
>> Yes, it is.
>
> ... and yet ...
>
>
>>> What does your firmware do when it wants to emulate SError but its masked?
>>> (e.g.1: The physical-SError interrupted EL2 and the SPSR shows EL2 had
>>> PSTATE.A  set.
>>>  e.g.2: The physical-SError interrupted EL2 but HCR_EL2 indicates the
>>> emulated  SError should go to EL1. This effectively masks SError.)
>>
>> Currently we does not consider much about the mask status(SPSR).
>
> .. this is a problem.
>
> If you ignore SPSR_EL3 you may deliver an SError to EL1 when the exception
> interrupted EL2. Even if you setup the EL1 register correctly, EL1 can't eret to
> EL2. This should never happen, SError is effectively masked if you are running
> at an EL higher than the one its routed to.
>
> More obviously: if the exception came from the EL that SError should be routed
> to, but PSTATE.A was set, you can't deliver SError. Masking SError is the only

James, I  summarized the masking and routing rules for SError to
confirm with you for the firmware first solution,

1. If the HCR_EL2.{AMO,TGE} is set, which means the SError should route to EL2,
When system happens SError and trap to EL3,   If EL3 find
HCR_EL2.{AMO,TGE} and SPSR_EL3.A are both set,
and find this SError come from EL2, it will not deliver an SError:
store the RAS error in the BERT and 'reboot'; but if
it find that this SError come from EL1 or EL0, it also need to deliver
an SError, right?


2. If the HCR_EL2.{AMO,TGE} is not set, which means the SError should
route to EL1,
When system happens SError and trap to EL3, If EL3 find
HCR_EL2.{AMO,TGE} and SPSR_EL3.A are both not set,
and find this SError come from EL1, it will not deliver an SError:
store the RAS error in the BERT and 'reboot'; but if
it find that this SError come from EL0, it also need to deliver an
SError, right?


> way the OS has to indicate it can't take an exception right now. VBAR_EL1 may be
> 'wrong' if we're doing some power-management, the FAR/ELR/ESR/SPSR registers may
> contain live values that the OS would lose if you deliver another exception over
> the top.
>
> If you deliver an emulated-SError as the OS eret's, your new ELR will point at
> the eret instruction and the CPU will spin on this instruction forever.
>
> You have to honour the masking and routing rules for SError, otherwise no OS can
> run safely with this firmware.
>
>
>> I remember that you ever suggested firmware should reboot if the mask status
>> is set(SPSR), right?
>
> Yes, this is my suggestion of what to do if you can't deliver an SError: store
> the RAS error in the BERT and 'reboot'.
>
>
>> I CC "liu jun" <liujun88@hisilicon.com> who is our UEFI firmware Architect,
>> if you have firmware requirements, you can raise again.
>
> (UEFI? I didn't think there was any of that at EL3, but I'm not familiar with
> all the 'PI' bits).
>
> The requirement is your emulated-SError from EL3 looks exactly like a
> physical-SError as if EL3 wasn't implemented.
> Your CPU has to handle cases where it can't deliver an SError, your emulation
> has to do the same.
>
> This is not something any OS can work around.
>
>
>>> Answers to these let us determine whether a bug is in the firmware or the
>>> kernel. If firmware is expecting the OS to do something special, I'd like to know
>>> about it from the beginning!
>>
>> I know your meaning, thanks for raising it again.
>
>
> Happy new year,
>
> James
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
