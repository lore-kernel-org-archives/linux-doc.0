Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D27AC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 15:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5BAE61409
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 15:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhD3PGf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Apr 2021 11:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3PGf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Apr 2021 11:06:35 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE63FC06174A
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 08:05:46 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id h11so9040086pfn.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 08:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=anUjd0VO1y6HUwEWgdtpQhLXYQBEQ91kwaAjqTARTOE=;
        b=aT6SWLQK4YUxWJgO+baqL16grlM2/wUWzt075buDTGWI9nci3mZiuCUUmCoJD9zqVD
         Sf3BGFYu2Bz1LWLv7HHWOi36ashUg7cqyCezFijQEbIL9ZNaXmSjU0zRkJ0eAAgPezAA
         eVFFBzPyFxJNQij8N7wq7dZyPTnlAKvhIdMibBcKcRwxEpVDgfDWM9gcdXSuUD5M68CA
         RRj/KuauR0r0xDVPPJXCdG/3kr5zg7kUf6cW9jdzDUORZt6hQXkdFoGm0NM/PdFonteZ
         Aj9KJPtdUVD0lu8q+yhpDZ0eotHour9uilidKJUDc7qU5M1WvJ9FZbFAYM/u5tT/YTmH
         Isnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=anUjd0VO1y6HUwEWgdtpQhLXYQBEQ91kwaAjqTARTOE=;
        b=Ex5aYrRkNfxXAGb9TxSvw2ZhYJnkBkfWLhD9kmDdu3mz378s3JtsxWwqhz0pzdxnrJ
         qnkjWTLbRvY43XTVW+JphaElGaDRUiz534t4Kuu7QdQOxird8JHsL1INUGui+h+OJhe0
         TRdEc4IQm4BCkTFyRiBsD3d3npGQImysq5nA49z4mNjnBW/cuf7ftXpz+CeHKbnVQ1O5
         znpDgHIDLzg2d6Knu+7lEnxQBU8djQHVK8v4XQS2ZNCkRfpc/n/r49tZ0LOrk7Jo/NMO
         uyQyeJxGHxjBk17xQAq4gYvTueB4MwbngiXyg9O8LJY9WjEHTDQcl3jt6w/lsZp2niqd
         3/NA==
X-Gm-Message-State: AOAM530+GFmQybDDQxbOn2AxDQRx2wd5QBXe2KMFn+admsWrcqE0e1+w
        6H+eNFujXTLBLJdBfP2whF8=
X-Google-Smtp-Source: ABdhPJzOJGYJXfpomEslKMnAwQNUBrjHJTL/zL69XKSYLLnk66mGIrVMkqljUGiUzqX2EF3K7J7VqA==
X-Received: by 2002:aa7:9910:0:b029:27e:8025:72bd with SMTP id z16-20020aa799100000b029027e802572bdmr5569891pff.24.1619795146368;
        Fri, 30 Apr 2021 08:05:46 -0700 (PDT)
Received: from [127.0.0.1] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id x23sm2247601pfc.170.2021.04.30.08.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 08:05:45 -0700 (PDT)
Subject: Re: [PATCH 1/3] docs/zh_CN: add core-api kernel-api.rst translation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
References: <cover.1618836460.git.siyanteng@loongson.cn>
 <301caca03324dd367830a50ff84e250882b91957.1618836460.git.siyanteng@loongson.cn>
 <20210419133526.GB2531743@casper.infradead.org>
 <77f0e536-9458-5ef2-6cd8-6d47f0452e14@gmail.com>
 <20210430123457.GM1847222@casper.infradead.org>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <ddbdfb78-f14c-656e-7d4a-2f914af3875f@gmail.com>
Date:   Fri, 30 Apr 2021 23:05:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210430123457.GM1847222@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/30 下午8:34, Matthew Wilcox wrote:
> On Fri, Apr 30, 2021 at 07:06:08PM +0800, Alex Shi wrote:
>> On 2021/4/19 下午9:35, Matthew Wilcox wrote:
>>> and surely you need a '.. kernel-doc' to have the ':internal:' make sense?
>>>
>>> Then, I wonder how useful it is to bring kernel-doc written in English
>>> into a Chinese document?  Wouldn't we be better off admitting that we
>>> don't provide Chinese documentation for kernel APIs and referring to
>>> the English documents?
>>>
>>> (I would love nothing more than to provide Chinese documentation for
>>> kernel APIs, but we don't have any kind of system for providing that
>>> today)
>>>
>>
>> I wouldn't reject the Chinese version of kernel-api, but a bit concern
>> of the subtle of the doc could be kept in translation. It would be a
>> big challenge. :)
> 
> That's a big challenge, to be sure, but logistically, where would we
> keep it?

Hi Willy,

Good question!

I have the same concern with you at the first look. But after check the
translation. I don't feel that bad. Correct Chinese version could be
read much faster and no misleading problem.

> 
> A concrete example, we have:
> 
> Documentation/core-api/xarray.rst
> 
> which has
> .. kernel-doc:: lib/xarray.c

It's a good example, I guess most descriptions in xarray.rst could be
translated for a quick reference.
On other side, Yes there do need a boundary, that would be the
real code, like lib/xarray.c. Guess we'd better stop there.


BTW, 
As to the original/translation version issue, We'd better to written
down the original commit ID in translation commit or doc properly. Then
we know the sync up time.

Thanks
Alex
 
> 
> which contains:
> 
> /**
>  * xas_load() - Load an entry from the XArray (advanced).
>  * @xas: XArray operation state.
>  *
> ...
>  */
> 
> So where do we put the Chinese translations?  The kernel-doc is
> adjacent to the function to "encourage" C programmers to keep
> the documentation up to date when they change the function.
> Do we also put the Chinese text in xarray.c?  Do we have a magic
> Documentation/translations/zh_CN/lib/xarray.c which contains the
> translations of the kernel-doc in lib/xarray.c?  Do we then have tooling
> which notices that the inline documentation in lib/xarray.c has changed
> and notifies the translator to keep it up-to-date?
> 
