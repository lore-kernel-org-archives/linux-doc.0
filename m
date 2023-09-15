Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43058CD37AA
	for <linux-doc@archiver.kernel.org>; Fri, 15 Sep 2023 21:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237390AbjIOVXU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Sep 2023 17:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237464AbjIOVXK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 17:23:10 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3367EE6
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:23:05 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf5c314a57so21911395ad.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694812984; x=1695417784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiVyFYFD+iY/+Ocrmo3l32JHL4fUNs4RLt/6Kj3cZUw=;
        b=d3U4W1LFavFPht1x25ls6ivrIShNxB9NmTtrc2L7xOhNutXS+EOV/8W4eeI/IjPuSV
         qqFEGdNm5/fgGOsC1s/P8IPLd5uUpabi8gSbxMI+8FZmm0SCIp8dl8XFjqMV5DStF6V8
         DShYduPlVlIt87KTFEQ4h8/uvTxdxBBwqgF0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694812984; x=1695417784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiVyFYFD+iY/+Ocrmo3l32JHL4fUNs4RLt/6Kj3cZUw=;
        b=P2Vy9kv7OuxWJyGyYjsoj8mfW8S+0H6CfOpcdRdWTV3qwUxrN5PDS2g2bq7fXO9uuq
         xpGXzIlG2exwsCOXBySR3w5kfL+VNaj4d63wmtnNuuGnvPqZ/29rKWgV01YW2pa+CXG8
         c35x3phdjpfjuoxoqtl4NIqKxDoewSf9RS8IRIVk/rMeR6EHagvZwnLM9Gk1GAka5MvU
         yMb/c9F8fNUYaMy7gN5TV9V6fLfEjFdCYmMPptheDI2KXRdgG2HcTNiNApdXJsqwJ8+C
         fNeUAJUlDDloaTl/vTTXLMzh05VJEfZ8El6nnDcolDXY0Yg1CaPlyJBlXLSN+E61+WiD
         Lgyw==
X-Gm-Message-State: AOJu0Yy95YMyDt014PZsWzBuiaxwIdItA0KUe9wC8xCLBai9SWXfPlt7
        p2D76rq//GbGzsMEgKzUSxzZvg==
X-Google-Smtp-Source: AGHT+IGK3s7+1sbLHNP+MzY1eBho88i+hlkIlJpvOqkzeAkzu9GD01LibMXuB4ThZYh7TqDkMF9xFw==
X-Received: by 2002:a17:902:dac5:b0:1b5:64a4:bea0 with SMTP id q5-20020a170902dac500b001b564a4bea0mr3329386plx.10.1694812984632;
        Fri, 15 Sep 2023 14:23:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090322c600b001bc5dc0cd75sm3904512plg.180.2023.09.15.14.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 14:23:04 -0700 (PDT)
Date:   Fri, 15 Sep 2023 14:23:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     cl@linux.com, penberg@kernel.org, rientjes@google.com,
        iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, luto@kernel.org, peterz@infradead.org,
        jannh@google.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com
Subject: Re: [RFC PATCH 12/14] mm/slub: introduce the deallocated_pages sysfs
 attribute
Message-ID: <202309151422.C3F39B8D8E@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-13-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-13-matteorizzo@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:31AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> When SLAB_VIRTUAL is enabled this new sysfs attribute tracks the number
> of slab pages whose physical memory has been reclaimed but whose virtual
> memory is still allocated to a kmem_cache.
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Yay stats. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
