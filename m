Return-Path: <SRS0=cy2k=32=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EDCC35247
	for <linux-doc@archiver.kernel.org>; Thu,  6 Feb 2020 21:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61E0F214AF
	for <linux-doc@archiver.kernel.org>; Thu,  6 Feb 2020 21:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FGZ/e3iN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbgBFV5s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Feb 2020 16:57:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21483 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726765AbgBFV5r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Feb 2020 16:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581026267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=10sxOSYhRMsVf98oXqVUEQI4+OBsS58gSL9iiVuqLjE=;
        b=FGZ/e3iN8XwtLsTMLyUmFaR1Yab+RnDGkVH9q2c777Xda8ALepSoXKvhyvejMMY7BUBaXa
        DhtutlXhc9icsbXcPtz2ksaJuEejp74rW+FENdaKGe61Iun9Iu6tFWkYlV+lnv0wFVyrkW
        +LNLoasvYiR+7XRLlGbJZOovfBsm0uY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-e-oMuF3SN8mTCkS7uLYqqw-1; Thu, 06 Feb 2020 16:57:45 -0500
X-MC-Unique: e-oMuF3SN8mTCkS7uLYqqw-1
Received: by mail-wr1-f71.google.com with SMTP id c6so115476wrm.18
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2020 13:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10sxOSYhRMsVf98oXqVUEQI4+OBsS58gSL9iiVuqLjE=;
        b=fa/aScXfcrfmJab4Hw1r0zO9MvDTL4s7ZQOufNz4LtpSBN65WI/gDOsB+nTuFCSdT1
         lYYgkybakt5v7CH70mdgXrAZJqnmoL0RHCHubL5RZjV5vN+sPxKTLkQnSfWVFylx/4dk
         AVncdPaL+vivR3JLw+6jCYuOoAV86L++s3sghoJyuxXNSDSYkkVf0MRYp/hmS44/T628
         9L3pKxww4yDks4q05Zc5dwBVxq6poRRQ4r1/l4uv7PQmBNY3x7yESHAQ/K4Qt3lS8m66
         K5bWGqdrmQKRzUKuKq6z7lKyakNyVdOn0QTtwe43blpi2v492IwVSxeLvAZbVtPF7OB6
         ytOg==
X-Gm-Message-State: APjAAAXnRZWUWxC7XzC8gaC/dhFcDMrPRBk8xK/6NAn6bHhLR69kispV
        Mw6YOdUgUpFvpFSmUjzMS+k6vfGmSmewELncoZWRmE1kH2Ew3ZANXdUUzYrkPaAvyNalgciLyeb
        LbK2uYjbFkLQof9DgPfcL
X-Received: by 2002:adf:f44a:: with SMTP id f10mr112380wrp.16.1581026263797;
        Thu, 06 Feb 2020 13:57:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkLFknJmswfLS3WjKUC9icqucrhzXHz50poy/wudiPuIytWlnrCqIq9yCj0/e3FcMbZ4huIQ==
X-Received: by 2002:adf:f44a:: with SMTP id f10mr112362wrp.16.1581026263425;
        Thu, 06 Feb 2020 13:57:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56? ([2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56])
        by smtp.gmail.com with ESMTPSA id e16sm733749wrs.73.2020.02.06.13.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 13:57:42 -0800 (PST)
Subject: Re: [PATCH v2 21/27] docs: kvm: Convert locking.txt to ReST format
To:     Cornelia Huck <cohuck@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <cover.1581000481.git.mchehab+huawei@kernel.org>
 <1464d69fe780940cec6ecec4ac2505b9701a1e01.1581000481.git.mchehab+huawei@kernel.org>
 <20200206171132.4f51f17a.cohuck@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a17d6a27-0d3f-2020-7fc2-87ec20a6225f@redhat.com>
Date:   Thu, 6 Feb 2020 22:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200206171132.4f51f17a.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/02/20 17:11, Cornelia Huck wrote:
> On Thu,  6 Feb 2020 15:50:18 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
>> - Use document title and chapter markups;
>> - Add markups for literal blocks;
>> - use :field: for field descriptions;
>> - Add blank lines and adjust indentation.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> ---
>>  Documentation/virt/kvm/index.rst              |   1 +
>>  .../virt/kvm/{locking.txt => locking.rst}     | 111 ++++++++++--------
>>  2 files changed, 63 insertions(+), 49 deletions(-)
>>  rename Documentation/virt/kvm/{locking.txt => locking.rst} (78%)
> 
> (...)
> 
>> @@ -48,19 +52,23 @@ restore the saved R/X bits if VMX_EPT_TRACK_ACCESS mask is set, or both. This
>>  is safe because whenever changing these bits can be detected by cmpxchg.
>>  
>>  But we need carefully check these cases:
>> -1): The mapping from gfn to pfn
>> +
>> +1) The mapping from gfn to pfn
>> +
>>  The mapping from gfn to pfn may be changed since we can only ensure the pfn
>>  is not changed during cmpxchg. This is a ABA problem, for example, below case
>>  will happen:
>>  
>> -At the beginning:
>> -gpte = gfn1
>> -gfn1 is mapped to pfn1 on host
>> -spte is the shadow page table entry corresponding with gpte and
>> -spte = pfn1
>> +At the beginning::
>>  
>> -   VCPU 0                           VCPU0
>> -on fast page fault path:
>> +	gpte = gfn1
>> +	gfn1 is mapped to pfn1 on host
>> +	spte is the shadow page table entry corresponding with gpte and
>> +	spte = pfn1
>> +
>> +	   VCPU 0                           VCPU0
>> +
>> +on fast page fault path::
>>  
>>     old_spte = *spte;
>>                                   pfn1 is swapped out:
> 
> I'm wondering if that should rather be converted to a proper table.

Would be nicer but this is acceptable too I think.  Especially, the
monospaced font allows breaking the table and keeping the parts aligned.

But the two headers should be "CPU 0" and "CPU 1", and it's worth
changing that while we're at it.  Same for the table below.

Paolo


> 
>> @@ -99,12 +109,14 @@ Accessed bit and Dirty bit can not be lost.
>>  But it is not true after fast page fault since the spte can be marked
>>  writable between reading spte and updating spte. Like below case:
>>  
>> -At the beginning:
>> -spte.W = 0
>> -spte.Accessed = 1
>> +At the beginning::
>>  
>> -   VCPU 0                                       VCPU0
>> -In mmu_spte_clear_track_bits():
>> +	spte.W = 0
>> +	spte.Accessed = 1
>> +
>> +	   VCPU 0                                       VCPU0
>> +
>> +In mmu_spte_clear_track_bits()::
>>  
>>     old_spte = *spte;
>>  
> 
> This one as well.



