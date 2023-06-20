Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C03BEB64D8
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 14:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbjFTOtI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 10:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbjFTOtG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 10:49:06 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4AE1718
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 07:49:05 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f90b4ac529so33014005e9.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687272544; x=1689864544;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFBJCFv89ibLGDxP64+KT5RKVRcJ4ABThqZOUh/7S8U=;
        b=u/nNunrJJa6/pTEdqFGYPAhtOAsS9D0F0Anp3vZDPkfxNCw2tMiHHZcg6GSyR8nblh
         CNboKm+SxYJjYaFoXBPLi7zB10yrVnRTrlx+KejPLgk9SlKVgzkg9MlbIvtSsvURzXlf
         6/8H1AsUpPrUWvtYsLb6Uz3IQ0FqOD8+Nvyk8FempvIx7zVA5tMD4XJ0wQvB/ziNDViK
         vyZISyFCCkt5AC9InX2i8JjC6kDmpphGiiaJN8blfT9IYQCbL4eeQ38tTNKebViEPuo+
         D9mJkOCfxfhU0sjTaiw1603JgWXxKT5DGz77RpQVXdGXeUm8h6ALOhXtetH/FNZCT4ZZ
         zMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687272544; x=1689864544;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFBJCFv89ibLGDxP64+KT5RKVRcJ4ABThqZOUh/7S8U=;
        b=Dww8cWVgcElChU2ov0nkhywTBSmtgb/ZyD/hbG/kMcuGfHtq3jX/1TNBiAT1y+2aYu
         lerG2qneXwCiSfO2gFl/tqGoEwYf8ahEnpOYCuE6VtpLwQJTq/vXUlBQUhwGLPMKrm3l
         5bAQruswhaakJ9ZBdNCiL6O7plkuTGLuv4DjxAnURpjmOgIX3X+7S6jKei55zpw2mX2m
         jCRLKNTDhNxr81M9p1Tl6SzurA/8u0MzKU7Oi8BjT4GNvSfBoVoHs5ip1Vjm96504PeT
         L35oc2dv9mxUKNqY/cJs8qOJxlKxMxMixCcrT8cMCcUog9FQTNuGiT2q3IWiStkT/sih
         U/Kw==
X-Gm-Message-State: AC+VfDyyo3c/UWJJyuZCRPbAl1VY4U1V+EyapesT+AglufL10VVm4QRB
        XM/hNFLH4Y+f1SpjR1MVlP4yw5gm/ZhbSjBLF5Fa2Q==
X-Google-Smtp-Source: ACHHUZ7LDr1h7a0YR+y1QSbkuQ+nwXK7muhEZDUzjJ87F1Pyf+gCx4EV1rE49ZD6t+JhlLe/MGCHXQ==
X-Received: by 2002:a05:600c:231a:b0:3f9:b430:199b with SMTP id 26-20020a05600c231a00b003f9b430199bmr3194468wmo.15.1687272543652;
        Tue, 20 Jun 2023 07:49:03 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:9c:201:8530:a6a3:373f:683c])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b003f42d8dd7d1sm13668387wmd.7.2023.06.20.07.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 07:49:03 -0700 (PDT)
Date:   Tue, 20 Jun 2023 16:48:58 +0200
From:   Marco Elver <elver@google.com>
To:     Andrey Konovalov <andreyknvl@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Taras Madan <tarasmadan@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] kasan: add support for kasan.fault=panic_on_write
Message-ID: <ZJG8WiamZvEJJKUc@elver.google.com>
References: <20230614095158.1133673-1-elver@google.com>
 <CA+fCnZdy4TmMacvsPkoenCynUYsyKZ+kU1fx7cDpbh_6=cEPAQ@mail.gmail.com>
 <CANpmjNOSnVNy14xAVe6UHD0eHuMpxweg86+mYLQHpLM1k0H_cg@mail.gmail.com>
 <CA+fCnZccdLNqtxubVVtGPTOXcSoYfpM9CHk-nrYsZK7csC77Eg@mail.gmail.com>
 <ZJGSqdDQPs0sRQTb@elver.google.com>
 <CA+fCnZdZ0=kKN6hE_OF7jV_r_FjTh3FZtkGHBD57ZfqCXStKHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZdZ0=kKN6hE_OF7jV_r_FjTh3FZtkGHBD57ZfqCXStKHg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 20, 2023 at 03:56PM +0200, Andrey Konovalov wrote:
...
> Could you move this to the section that describes the kasan.fault
> flag? This seems more consistent.

Like this?


diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 7f37a46af574..f4acf9c2e90f 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -110,7 +110,9 @@ parameter can be used to control panic and reporting behaviour:
 - ``kasan.fault=report``, ``=panic``, or ``=panic_on_write`` controls whether
   to only print a KASAN report, panic the kernel, or panic the kernel on
   invalid writes only (default: ``report``). The panic happens even if
-  ``kasan_multi_shot`` is enabled.
+  ``kasan_multi_shot`` is enabled. Note that when using asynchronous mode of
+  Hardware Tag-Based KASAN, ``kasan.fault=panic_on_write`` always panics on
+  asynchronously checked accesses (including reads).
 
 Software and Hardware Tag-Based KASAN modes (see the section about various
 modes below) support altering stack trace collection behavior:
