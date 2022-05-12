Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7568C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 16:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242977AbiELQjG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 12:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356576AbiELQjA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 12:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 751A525B05C
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652373537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mp/k4+ROOQmqxpZwmJD0fhrk0KhPBsBL98sUg/4FvV4=;
        b=CqiKjiiyFRZHG4Ih/bEBU3q3fqts3XffXZxoU5RYiDQQMu7nxE8ucBNDB8oME1+y/R/yIQ
        rn5JRVHn6o9zGetBcBlX4PM9bGOA4Rxc5u4nZQ95tlQFDaie4t9+nE3azyTogaMq+SlHIl
        pgJ6Lon3k+LJRCNIDvBMe4YuLBNw67Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-qyphkNK0MDO8TcMBGXm4uA-1; Thu, 12 May 2022 12:38:48 -0400
X-MC-Unique: qyphkNK0MDO8TcMBGXm4uA-1
Received: by mail-wm1-f70.google.com with SMTP id bi5-20020a05600c3d8500b0039489e1d18dso4611037wmb.5
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 09:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mp/k4+ROOQmqxpZwmJD0fhrk0KhPBsBL98sUg/4FvV4=;
        b=Ijg/IlF5Oea/FCmI6wrszYsIVyoo/ZKAWuY22BDwyYlG/SWZL6fVZ8B0jFBFzOK1l4
         6WCgcFTIcpucbPI5yoxZxullZrGk3M7q1VB/o4orZMSUaq+iql8JiBwaxU4v+laylnHh
         fOD1u8b267YO5VdY2x2Onw9FVi9+oGfntMxo16YWHoVJ6iciXblTDN8fk7HQeufyu2Mi
         /YXd7KZgaDWQbUK14g0RkOChCmo42oRm821IDUFfYPcup3/dVAmAKzzEpomg3tmc2ZvE
         nrSGfuAbHOGDiKCKJ4CnEUIYmLMF6g6DuOvHGy4oWGxQMgqUKgFDFb3Qb0tgYzmNFFip
         cNbg==
X-Gm-Message-State: AOAM532cqwWtiplDEJI7DlTd0ayVFLpBmjZiQiKYvW398QCHsyIJBh/P
        UzRtQ67N7C2UvsqUTGyU8YsKq9xvFrZWg7Amrn7LkcdrEu9ElnlV+rbhGD6JRQw6PeR9KPHEvv3
        HNpTa6lyHSAkmS56mK+Q8
X-Received: by 2002:a5d:52c5:0:b0:1f2:1a3:465a with SMTP id r5-20020a5d52c5000000b001f201a3465amr486448wrv.206.1652373527705;
        Thu, 12 May 2022 09:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw//xNJoDYn5jy5VfLK8EYdFrB0LMzS/0yyqB5elC7RCc26OTEcBI18h7H0GbGJR3KT78tEog==
X-Received: by 2002:a5d:52c5:0:b0:1f2:1a3:465a with SMTP id r5-20020a5d52c5000000b001f201a3465amr486433wrv.206.1652373527464;
        Thu, 12 May 2022 09:38:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:d200:ee5d:1275:f171:136d? (p200300cbc701d200ee5d1275f171136d.dip0.t-ipconnect.de. [2003:cb:c701:d200:ee5d:1275:f171:136d])
        by smtp.gmail.com with ESMTPSA id j10-20020adfc68a000000b0020c635ca28bsm2219wrg.87.2022.05.12.09.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 09:38:45 -0700 (PDT)
Message-ID: <5ca142fd-c7c0-768d-39f4-c58a84fff1f7@redhat.com>
Date:   Thu, 12 May 2022 18:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 2/4] mm: memory_hotplug: override memmap_on_memory
 when hugetlb_free_vmemmap=on
Content-Language: en-US
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220509062703.64249-1-songmuchun@bytedance.com>
 <20220509062703.64249-3-songmuchun@bytedance.com>
 <ebffd794-697b-9bf1-f41b-4b2d52c100fc@redhat.com>
 <Yn0Ck5isxx4ghQi6@FVFYT0MHHV2J.usts.net>
 <284eec3f-a79d-c5f0-3cd6-53b8e64100cd@redhat.com>
 <Yn0SyaqfS2YZ8kO/@FVFYT0MHHV2J.usts.net>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yn0SyaqfS2YZ8kO/@FVFYT0MHHV2J.usts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12.05.22 15:59, Muchun Song wrote:
> On Thu, May 12, 2022 at 03:04:57PM +0200, David Hildenbrand wrote:
>> On 12.05.22 14:50, Muchun Song wrote:
>>> On Thu, May 12, 2022 at 09:36:15AM +0200, David Hildenbrand wrote:
>>>> On 09.05.22 08:27, Muchun Song wrote:
>>>>> Optimizing HugeTLB vmemmap pages is not compatible with allocating memmap on
>>>>> hot added memory. If "hugetlb_free_vmemmap=on" and
>>>>> memory_hotplug.memmap_on_memory" are both passed on the kernel command line,
>>>>> optimizing hugetlb pages takes precedence. 
>>>>
>>>> Why?
>>>>
>>>
>>> Because both two features are not compatible since hugetlb_free_vmemmap cannot
>>> optimize the vmemmap pages allocated from alternative allocator (when
>>> memory_hotplug.memmap_on_memory=1). So when the feature of hugetlb_free_vmemmap
>>> is introduced, I made hugetlb_free_vmemmap take precedence.  BTW, I have a plan
>>> to remove this restriction, I'll post it out ASAP.
>>
>> I was asking why vmemmap optimization should take precedence.
>> memmap_on_memory makes it more likely to succeed memory hotplug in
>> close-to-OOM situations -- which is IMHO more important than a vmemmap
>> optimization.
>>
> 
> I thought the users who enable hugetlb_free_vmemmap value memory
> savings more, so I made a decision in commit 4bab4964a59f.  Seems
> I made a bad decision from your description.

Depends on the perspective I guess. :)

>  
>> But anyhow, the proper approach should most probably be to simply not
>> mess with the vmemmap if we stumble over a vmemmap that's special due to
>> memmap_on_memory. I assume that's what you're talking about sending out.
>>
> 
> I mean I want to have hugetlb_vmemmap.c do the check whether the section
> which the HugeTLB pages belong to can be optimized instead of making
> hugetlb_free_vmemmap take precedence.  E.g. If the section's vmemmap pages
> are allocated from the added memory block itself, hugetlb_free_vmemmap will
> refuse to optimize the vmemmap, otherwise, do the optimization.  Then
> both kernel parameters are compatible.  I have done those patches, but
> haven't send them out.

Yeah, that's exactly what I thought. How complicated are they? If they
are easy, can we just avoid this patch here and do it "properly"? :)

-- 
Thanks,

David / dhildenb

