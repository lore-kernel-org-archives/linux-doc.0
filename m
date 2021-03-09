Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487A7C433DB
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 18:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00AD765229
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 18:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhCISNP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 13:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbhCISM5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 13:12:57 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EAEC06175F
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 10:12:57 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a18so17513839wrc.13
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 10:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:subject:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=PnYU7rXIm7fcsv/hTsu+HY5l1Jj4HcmP4vRljn+UL84=;
        b=qR5tP57vrensSHbH0zTfCAQMKlFwNJ6pXRCQSZDrkzncBoB28xokLS6QVZpiNe4fr8
         0pgpNd7zndmhW2ig/6gn3RYJDIPLp0lS13rct6+gU0k0oX0TwjRCPdWzMpmLJeWIthLT
         S52RwHOBw8SVnPDE9hqdwwxdVnMBSQsi5VOYDRn/zJ7NgiEH9fzW9FRpDUqymnXimQu8
         U3g3he3LMEuR6H/zt9E7SuqfW/c8bUbI1DQVnOtepv9cxGvRGOschdkK/zQ/D2ire11O
         GztfqC1JM4kw5YYgbCAWJsBJdLGPcAj0+jJV9AACiphEkkSCy0unKbwaACHRFCgJK43P
         s3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PnYU7rXIm7fcsv/hTsu+HY5l1Jj4HcmP4vRljn+UL84=;
        b=Z45Xv+y1OOFBtOJL4DPxhiWwJ3J2m9WEUkxeYed8zCi6WECNDSwF4L/asdhefreTJU
         FD29bUmTMyfM8Lbbq0nJlHRZzbb4nByhd5xql0yJkb3vq7+ZVhH446y8JLpkDJCmVXqG
         0XFJhncVtPQ0cxLo5yzX1AJOssxhDcZU2Dga/nuiQbr2WeiBLceDB7bcwGrDlL9ZPrSh
         xiA2lwBep45x2/n47gBTP6kYtSZpFtM2lGpLH2K6AV/claD/0hiSmcJ9m9OYKxCSv2DE
         kWySU2WezPdC0B0jCcqtfqyjnxO/0BvHgXvXqmrs7yA636Cu49yxhLEtTvmrThAxSqn7
         L0pw==
X-Gm-Message-State: AOAM531XJFVXRL/8zmvI++DeiVxsiwUQH4gAW4SaGOXAFzpgY6Ffep6F
        THEjg2Rt8dSlN8z+1xKNOvFr3P8IleAOUQ==
X-Google-Smtp-Source: ABdhPJyUhmCZRb3yVzm1lSCDABma40ZstGQI5xbIv0evvrzQxGSMPzx3lANEC5guKWGQV3XPb95Otw==
X-Received: by 2002:a5d:4fc5:: with SMTP id h5mr30693815wrw.33.1615313576019;
        Tue, 09 Mar 2021 10:12:56 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id n186sm5189504wmn.22.2021.03.09.10.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 10:12:55 -0800 (PST)
To:     Christoph Lameter <cl@gentwo.de>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210309134720.29052-1-georgi.djakov@linaro.org>
 <alpine.DEB.2.22.394.2103091554430.109061@gentwo.de>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] mm/slub: Add slub_debug option to panic on memory
 corruption
Message-ID: <a712359c-4671-6f6e-13a1-2a9682a6ec08@linaro.org>
Date:   Tue, 9 Mar 2021 20:12:53 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2103091554430.109061@gentwo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph,

Thanks for the comments!

On 3/9/21 16:56, Christoph Lameter wrote:
> On Tue, 9 Mar 2021, Georgi Djakov wrote:
> 
>> Being able to stop the system immediately when a memory corruption
>> is detected is crucial to finding the source of it. This is very
>> useful when the memory can be inspected with kdump or other tools.
> 
> Hmmm.... ok.

The idea is to be able to collect data right after the corruption is
detected, otherwise more data might be corrupted and tracing becomes
more difficult.

> 
>>   static void restore_bytes(struct kmem_cache *s, char *message, u8 data,
>>   						void *from, void *to)
>>   {
>> +	if (slub_debug & SLAB_CORRUPTION_PANIC)
>> +		panic("slab: object overwritten\n");
>>   	slab_fix(s, "Restoring 0x%p-0x%p=0x%x\n", from, to - 1, data);
>>   	memset(from, data, to - from);
>>   }
> 
> Why panic here? This should only be called late in the bug reporting when
> an error has already been printed.

This is called by both slab_pad_check() and check_bytes_and_report(), so it
seemed like a common place where i could put the panic(). I can move it to
the caller functions instead, if that's preferred.

Thanks,
Georgi
