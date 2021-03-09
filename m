Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E622C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 18:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A6C865238
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 18:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhCISOw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 13:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbhCISOd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 13:14:33 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3E9C06175F
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 10:14:33 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j2so17553347wrx.9
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 10:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:subject:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=YWRjKT60IEBhulpbgMdBcOEwMVDBc2QXRWkm6ND2LTY=;
        b=TIEoH2DNa8qRSYBVWnaxdsJQ+Zi7/GF7DRltAHbqpXoGbdlc4MMGMaFnIT5Z/TDUed
         g2vR7gAaFTAWUjUXilU5pBFbGW9EG3//W7O8fZaeeG4tcect3Fsol1/ba3c/o+kirWB5
         ar/BGkbk2+hGs5A1gXnGUmWjt9d00gZLL0f7EfWZbVnXFYBKmSOYIlkGPTavpkYTkN5j
         W8ezlpofISU+eEFENaF7FA2pR1kOchhiwnhdULUQJsCifMLBuhCFfk0G8qPBX5YaQc0C
         x+0NsKHpTJ11I4dxLOZ4AJbF/Sq6uvbC48s9f83qtPF5LcRTwvDsDreoFhfpPezIdx0M
         +rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YWRjKT60IEBhulpbgMdBcOEwMVDBc2QXRWkm6ND2LTY=;
        b=WCDyfmyxr8YfZX81FWX0L3bbWtXdZUE9J92HTA0v5SFAVYKQC1IpLpTBvSfYjioC7B
         ieLYhKMSpPHoiwOV4klWQIFskuLm98eg1k8DOjNC+sgcBN6R8C78objmzSIc9A9ehTPJ
         v+21NQ+vzRK1naCN8X1BXLvEzf/GSzLkgBIKWRVL4F3zaAtOwkCYhO9k663JH08CGnJM
         sTB0VE9DfuNvltj+hjc35gzdDIs9hmNpCZxs1Np6F2I1CeXd1SHnYmsZoRVxOQHcIgdF
         otl3zNH5rqRbIb5me81+BOPwkiKZW4Bked9Culqek0ZBASFG6KflMIZCP4lUQrdMeGpg
         DwUQ==
X-Gm-Message-State: AOAM532NpHkXp4b+zHVJUE+PCuzhHkOoSKgo4I3dpTRAjPqs3A3J1m5Q
        DLOCQtyyXX1PBqYOOzqBdt10dA==
X-Google-Smtp-Source: ABdhPJyPRsdzft5PXcEJd8oZLDku0oji0/0KIglu9HmYJeRoMykTORGWU7luuklo2QcxwLm/nPzLpg==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr28608333wrm.321.1615313671893;
        Tue, 09 Mar 2021 10:14:31 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id x8sm24791935wru.46.2021.03.09.10.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 10:14:31 -0800 (PST)
To:     Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        akpm@linux-foundation.org, cl@linux.com, penberg@kernel.org,
        rientjes@google.com, iamjoonsoo.kim@lge.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210309134720.29052-1-georgi.djakov@linaro.org>
 <390d8a2f-ead9-48a9-99eb-65c73bd18422@suse.cz>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] mm/slub: Add slub_debug option to panic on memory
 corruption
Message-ID: <6bfebf01-5f52-49bd-380b-04785c474c81@linaro.org>
Date:   Tue, 9 Mar 2021 20:14:30 +0200
MIME-Version: 1.0
In-Reply-To: <390d8a2f-ead9-48a9-99eb-65c73bd18422@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Vlastimil,

Thanks for the comment!

On 3/9/21 17:09, Vlastimil Babka wrote:
> On 3/9/21 2:47 PM, Georgi Djakov wrote:
>> Being able to stop the system immediately when a memory corruption
>> is detected is crucial to finding the source of it. This is very
>> useful when the memory can be inspected with kdump or other tools.
> 
> Is this in some testing scenarios where you would also use e.g. panic_on_warn?
> We could hook to that. If not, we could introduce a new
> panic_on_memory_corruption that would apply also for debug_pagealloc and whatnot?

I would prefer that we not tie it with panic_on_warn - there might be lots of
new code in multiple subsystems, so hitting some WARNing while testing is not
something unexpected.

Introducing an additional panic_on_memory_corruption would work, but i noticed
that we already have slub_debug and thought to re-use that. But indeed, аdding
an option to panic in for example bad_page() sounds also useful, if that's what
you suggest.

Thanks,
Georgi
