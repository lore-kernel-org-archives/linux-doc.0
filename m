Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ECCC432BE
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 14:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32F7D6108F
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 14:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbhHZOKQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41438 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229832AbhHZOKQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Aug 2021 10:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629986968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8G/7ZlO3OCW/oELCaVsXFVvVuQOIOXBoolUrlOFg5ds=;
        b=T7H6w4XCPD32D4jzvKxRdfYCaXQ75H36vjDO9GQLqZapOkxmmvWvqHKcRcs7SVpFDc/m/R
        XXvufAemqnt+B+hRTK1TGgGIi2vJEj002Hk52PFdhr/DrXaoN++zeg7DRT/f+A0+3DkNIl
        48EYfqHnQaVEsQtVjMNVcIZshOIlGYM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-aIwFaBy9MpyjshLEmuRltw-1; Thu, 26 Aug 2021 10:09:27 -0400
X-MC-Unique: aIwFaBy9MpyjshLEmuRltw-1
Received: by mail-wr1-f72.google.com with SMTP id z15-20020adff74f000000b001577d70c98dso879789wrp.12
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 07:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8G/7ZlO3OCW/oELCaVsXFVvVuQOIOXBoolUrlOFg5ds=;
        b=EIvApRdDwuPw/gdtV44hrfxPNV7Dnk7l4EbvgGqhYPPF+57wY1FvH4oUUNjUZf3Rzr
         K/ZuzHYoiQwIDBv/VvDLfioHx8Wu2I9ajCkuNDisIuIt5zYZaPDv93soKJ38F489L1NZ
         jmQz66GjpE+xrVrxSDLkBYa5k33360z4FG6uF1hzQiRpBos2JEDsCbvWIWc95VE238cZ
         FQPegnhESYW337mHxjoFr6ZrqtGo1L9R2mIDO9jj6YSLksjxVQCRImzOTbvp5sHlK3vN
         DalljZdPYggVZx+kQXR1O5OTbSEX29mY0hExF5W/rJ5trZM0m51ULlMPhAzVibal8nAv
         +0NQ==
X-Gm-Message-State: AOAM531Z8SzSfLlOPsOH4gfspAZbnzCXgRs19iZbe+YGmm+sJThcuK5f
        j1xGZSI90JBpcDyRes9GDeYGLXomBHjYcSMfTiQ6YL8lHXvnxQyubmk4DLI8R40+UB2yjXW54jY
        kPdJsot54KalA3jx95Hu8
X-Received: by 2002:a05:600c:4786:: with SMTP id k6mr3810267wmo.177.1629986966052;
        Thu, 26 Aug 2021 07:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNZb+DI3d7hc5fu4d3o+gW7xumIsZ6ppo8lQ6GiIt4+/RCYJMTCrbeKlf8aKlmLHYchjnECQ==
X-Received: by 2002:a05:600c:4786:: with SMTP id k6mr3810237wmo.177.1629986965829;
        Thu, 26 Aug 2021 07:09:25 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23dec.dip0.t-ipconnect.de. [79.242.61.236])
        by smtp.gmail.com with ESMTPSA id s7sm3255500wra.75.2021.08.26.07.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 07:09:25 -0700 (PDT)
To:     SeongJae Park <sj38.park@gmail.com>, akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, dwmw@amazon.com,
        elver@google.com, fan.du@intel.com, foersleo@amazon.de,
        greg@kroah.com, gthelen@google.com, guoju.fgj@alibaba-inc.com,
        jgowans@amazon.com, joe@perches.com, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        snu@zelle79.org, vbabka@suse.cz, vdavydov.dev@gmail.com,
        zgf574564920@gmail.com, linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210716081449.22187-1-sj38.park@gmail.com>
 <20210716081449.22187-6-sj38.park@gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v34 05/13] mm/damon: Implement primitives for the virtual
 memory address spaces
Message-ID: <358fa060-7702-d523-5169-f25a3de0c22e@redhat.com>
Date:   Thu, 26 Aug 2021 16:09:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716081449.22187-6-sj38.park@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +static void damon_va_mkold(struct mm_struct *mm, unsigned long addr)
> +{
> +	pte_t *pte = NULL;
> +	pmd_t *pmd = NULL;
> +	spinlock_t *ptl;
> +

I just stumbled over this, sorry for the dumb questions:


a) What do we know about that region we are messing with?

AFAIU, just like follow_pte() and follow_pfn(), follow_invalidate_pte() 
should only be called on VM_IO and raw VM_PFNMAP mappings in general 
(see the doc of follow_pte()). Do you even know that it's within a 
single VMA and that there are no concurrent modifications?

b) Which locks are we holding?

I hope we're holding the mmap lock in read mode at least. Or how are you 
making sure there are no concurrent modifications to page tables / VMA 
layout ... ?

> +	if (follow_invalidate_pte(mm, addr, NULL, &pte, &pmd, &ptl))



-- 
Thanks,

David / dhildenb

