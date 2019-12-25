Return-Path: <SRS0=2lNs=2P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A730C2D0C8
	for <linux-doc@archiver.kernel.org>; Wed, 25 Dec 2019 18:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07A3A2075E
	for <linux-doc@archiver.kernel.org>; Wed, 25 Dec 2019 18:49:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZcnzPFqW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfLYStu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Dec 2019 13:49:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38600 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726353AbfLYStu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Dec 2019 13:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577299788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=285kDepmv9QK1DA/8vrnMjbxXwuHVWfi0yZmFm9MG4s=;
        b=ZcnzPFqWfq7ZHhkG3ZYYH1yDUklTgfhbTPRozc1lOFyU9JCuqhr8urQD1CIW19w/yLcSnt
        HJ6+nWsT/TeMGgTthwpyKpLIC48Ldh015qkafFcqamP9a/yHlZ0o3m3B52bhahS6CJS/C4
        FIZkgr9OEjmNMLJEXuHenZIzCE3ovMA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-4uuUiltjNC6nfuS5rAbwTw-1; Wed, 25 Dec 2019 13:49:46 -0500
X-MC-Unique: 4uuUiltjNC6nfuS5rAbwTw-1
Received: by mail-pg1-f198.google.com with SMTP id t189so14821799pgd.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Dec 2019 10:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=285kDepmv9QK1DA/8vrnMjbxXwuHVWfi0yZmFm9MG4s=;
        b=qplgOxF98OmB93oAoOqw6f1eCGjyh1bmXuAUe2K4F/Ux6noucruiIrCB27s80YGymm
         GXo4AL09JYcgN9nswB/VLboCrifeLcKixLFBJwzN4ac3Ghj7ceSFAqzeV63FQEEKtClC
         snvBfghxTzcFTdxtdS0vPCXjmdm3G/C+lIv/QCY1axF7/gUDd9/tbwFCgTGClDgqABwM
         QFKSX0kZroknSdtIzv0LbV0cKhGqvJStb44aBX7FyQvzG9vhICCWfUFkrxC8VhOmaovR
         o3eflRZ/NQXejgUmSplFPVPuwmeBzq+/X6vllah7d0W5NyLUeuRpAWO08A+m9mLC96hQ
         IhHA==
X-Gm-Message-State: APjAAAXv/xF9wk+4psPv1dWRKt8DIHapscHqEgSb68XSH775A7UaXfAx
        WN9ejjMIPR18zx/lv+nMz7qlYkcDOJrfDP2rBwcuzeKucXlrie1+j2p4+ggMROOncn1zAUs/IeW
        Zi7Jme5PlfZ66845DCZAq
X-Received: by 2002:a62:14c4:: with SMTP id 187mr43265279pfu.96.1577299785654;
        Wed, 25 Dec 2019 10:49:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZq0WNOzdua1RfDEkn3HqURrkcIdrDtqUjWUQg9SWvt9FzZCJpCtHEmlsjvv06Sjav1Dxdww==
X-Received: by 2002:a62:7c54:: with SMTP id x81mr43381216pfc.180.1577299783422;
        Wed, 25 Dec 2019 10:49:43 -0800 (PST)
Received: from localhost.localdomain ([122.177.237.105])
        by smtp.gmail.com with ESMTPSA id b98sm7539818pjc.16.2019.12.25.10.49.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Dec 2019 10:49:42 -0800 (PST)
Subject: Re: [RESEND PATCH v5 5/5] Documentation/vmcoreinfo: Add documentation
 for 'TCR_EL1.T1SZ'
To:     James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Cc:     bhupesh.linux@gmail.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-6-git-send-email-bhsharma@redhat.com>
 <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Message-ID: <b7d8d603-d9fe-3e18-c754-baf2015acd16@redhat.com>
Date:   Thu, 26 Dec 2019 00:19:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi James,

On 12/12/2019 04:02 PM, James Morse wrote:
> Hi Bhupesh,

I am sorry this review mail skipped my attention due to holidays and 
focus on other urgent issues.

> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>> Add documentation for TCR_EL1.T1SZ variable being added to
>> vmcoreinfo.
>>
>> It indicates the size offset of the memory region addressed by TTBR1_EL1
> 
>> and hence can be used for determining the vabits_actual value.
> 
> used for determining random-internal-kernel-variable, that might not exist tomorrow.
> 
> Could you describe how this is useful/necessary if a debugger wants to walk the page
> tables from the core file? I think this is a better argument.
> 
> Wouldn't the documentation be better as part of the patch that adds the export?
> (... unless these have to go via different trees? ..)

Ok, will fix the same in v6 version.

>> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
>> index 447b64314f56..f9349f9d3345 100644
>> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
>> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
>> @@ -398,6 +398,12 @@ KERNELOFFSET
>>   The kernel randomization offset. Used to compute the page offset. If
>>   KASLR is disabled, this value is zero.
>>   
>> +TCR_EL1.T1SZ
>> +------------
>> +
>> +Indicates the size offset of the memory region addressed by TTBR1_EL1
> 
>> +and hence can be used for determining the vabits_actual value.
> 
> 'vabits_actual' may not exist when the next person comes to read this documentation (its
> going to rot really quickly).
> 
> I think the first half of this text is enough to say what this is for. You should include
> words to the effect that its the hardware value that goes with swapper_pg_dir. You may
> want to point readers to the arm-arm for more details on what the value means.

Ok, got it. Fixed this in v6, which should be on its way shortly.

Thanks,
Bhupesh

