Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14AAC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 13:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354110AbiELNFO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 09:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354107AbiELNFF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 09:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 95C5924EA26
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652360703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=efOMr3P/7pGohN9ErE4jqv2LFNSoc71Z8ICykAkWQU4=;
        b=O6ZCx7eSYDOSlnxFG3Ud3LLrZmDPuOGHRrWR9j0anPM3w1lWfs+R7REzy/HHA2L5v9SLuL
        6SNqLo9D5v9P+A13utg4A8ODinsjd9rnAjg4kCiUWj2lYLjxPUeufXiKJCtorXLfT1kTNU
        T5y4EmFnU2hBXJ3R4KklFfobjuBONcA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-xH98nWH1NC6URmAZTZrAMA-1; Thu, 12 May 2022 09:05:02 -0400
X-MC-Unique: xH98nWH1NC6URmAZTZrAMA-1
Received: by mail-wr1-f72.google.com with SMTP id bj22-20020a0560001e1600b0020cccc6b25aso2060539wrb.1
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 06:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=efOMr3P/7pGohN9ErE4jqv2LFNSoc71Z8ICykAkWQU4=;
        b=XA/aj6PH+Zf5noZGtZADLyT+HKDya12rzBCp7FsYmRLFS7j+ehcnm/5Vlp+CM2x3Fq
         AN5nrEJAnQ5nKS6FF57gkoaXik0KEkDhPxQxvojBkF35AZfEQczYv9wAmQkIiWAJFrPC
         UIDmjWJ1uWPXykZpCmvEYiPFWdS8+reE6gEiy0h5eiuICLn4CEra3WIzfU9Fo3ee6T7g
         f6cGYzJS8zYqChqR8KnYk2LNPQxlMmwH/guH1ONzzlWmtg8AWcQwSqsjUiE1GmbIvB/f
         UDzrLgGuPBRN/327NaW+0q4qH1WVwTFEnp5pkuLPADAK3xWVY+rSfsEeNlJplHQRch1B
         KvOA==
X-Gm-Message-State: AOAM530rDmzmC9d0CIJpFB6C5iQevpXzY1XRuesIQNAn7vkF3nWsiIWW
        HhChMU1ib1Db2sztaSuGsMwuD96xe5PFL0HYGRiwN+LwCDfMZI4ckS4SFuj21Ey9eQw6Mpghg+F
        n4TokEUICx2uQe4hqUYYy
X-Received: by 2002:a5d:5502:0:b0:20a:e0aa:90bd with SMTP id b2-20020a5d5502000000b0020ae0aa90bdmr28284045wrv.551.1652360700700;
        Thu, 12 May 2022 06:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdbDUlWFRb1WciroIQ1XDBEiFyzj/9JbtF68Ro3xbJ4jLGkiv/MQOmwWuOkoPWwT9ahyEkiw==
X-Received: by 2002:a5d:5502:0:b0:20a:e0aa:90bd with SMTP id b2-20020a5d5502000000b0020ae0aa90bdmr28284017wrv.551.1652360700457;
        Thu, 12 May 2022 06:05:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:d200:ee5d:1275:f171:136d? (p200300cbc701d200ee5d1275f171136d.dip0.t-ipconnect.de. [2003:cb:c701:d200:ee5d:1275:f171:136d])
        by smtp.gmail.com with ESMTPSA id a7-20020a7bc1c7000000b0039429bfebeasm2647067wmj.2.2022.05.12.06.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 06:04:59 -0700 (PDT)
Message-ID: <284eec3f-a79d-c5f0-3cd6-53b8e64100cd@redhat.com>
Date:   Thu, 12 May 2022 15:04:57 +0200
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yn0Ck5isxx4ghQi6@FVFYT0MHHV2J.usts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12.05.22 14:50, Muchun Song wrote:
> On Thu, May 12, 2022 at 09:36:15AM +0200, David Hildenbrand wrote:
>> On 09.05.22 08:27, Muchun Song wrote:
>>> Optimizing HugeTLB vmemmap pages is not compatible with allocating memmap on
>>> hot added memory. If "hugetlb_free_vmemmap=on" and
>>> memory_hotplug.memmap_on_memory" are both passed on the kernel command line,
>>> optimizing hugetlb pages takes precedence. 
>>
>> Why?
>>
> 
> Because both two features are not compatible since hugetlb_free_vmemmap cannot
> optimize the vmemmap pages allocated from alternative allocator (when
> memory_hotplug.memmap_on_memory=1). So when the feature of hugetlb_free_vmemmap
> is introduced, I made hugetlb_free_vmemmap take precedence.  BTW, I have a plan
> to remove this restriction, I'll post it out ASAP.

I was asking why vmemmap optimization should take precedence.
memmap_on_memory makes it more likely to succeed memory hotplug in
close-to-OOM situations -- which is IMHO more important than a vmemmap
optimization.

But anyhow, the proper approach should most probably be to simply not
mess with the vmemmap if we stumble over a vmemmap that's special due to
memmap_on_memory. I assume that's what you're talking about sending out.

-- 
Thanks,

David / dhildenb

