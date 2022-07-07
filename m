Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99BDC43334
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jul 2022 08:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbiGGILv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Jul 2022 04:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234850AbiGGILV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jul 2022 04:11:21 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42231A3BB
        for <linux-doc@vger.kernel.org>; Thu,  7 Jul 2022 01:10:38 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x184so4488707pfx.2
        for <linux-doc@vger.kernel.org>; Thu, 07 Jul 2022 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=jdYAV23wNagY2MyKAZgPFrBO8Ed8h1Dv//fXkTU2Cto=;
        b=cfxJ1pN7DrfaqTGawHodFMqwcFX7j0010SP4mq5RAyOg1wW4HTPqg9ce7HDK67xjy5
         RVGBJj/mxBTZGPEO42XCmdiMj/AGqBDl9HOloNsE4kSKaxbFnOiABhTDHJOlC6L1OdZO
         y6PPe+WezkEbk4aplnsqY5z9jxITWbUxr4kLq4znl3itmPkP2S17ZizVm9AYFxFpWbwi
         42LJMNJ5A9xbj11ceO6JnMiNIvv0XTl64YyX5aL7g0TXX07uS6BNuKSlbsoHIKcYzYWE
         l5FG/Sf2f5FBSNsWZJoo+QKOan/fjnWZQSVTdBMBVgeylFqpWRZh2H5mzAFSeevqsY/A
         C1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=jdYAV23wNagY2MyKAZgPFrBO8Ed8h1Dv//fXkTU2Cto=;
        b=H3TCuh0/QZFaRayy5Ral7+eME5K1yONBRhBJhELaEIgb8REbkY3eBm4KHvF32rtK25
         Sp5F5/y467PWttvoQM6GOnZzImX8Ql8zEx11z6xwQgP4BkLOdWKST2jAJ/PcTJhQB7xS
         Vrxb9ZiQYAc0dgT2VqFlvufnHW96FuCPxfD5YD298qhVI5GczTF1sn2RhfGq0oLgxDSG
         kiTx5uQ9kF/pFP0Kz0yRQboY0iVjIUjU9TcBlAR3K05uHcsOlDIa7dYYccFURsYZFz9c
         IS7JyBB5WAIgQw0mdvBz0eRcojnVb/Bp5wkM11kDahiFcFBLB/XgY2V1EQgkDDx0AI6y
         YbHg==
X-Gm-Message-State: AJIora+v+drUZ9VOabuxddwkqTMEBXbDBmb3uh7tY6Mi6aMtgbf0c9AD
        esMfdjietTGgY/CflXX0Zjm2Fl4ZbDI=
X-Google-Smtp-Source: AGRyM1swtCh2l75T7xHJMdfvf8NI2vDDokRivwazdgZvmAoSZApC94CRn7iqVHbhoh+nJfmlhx5y5Q==
X-Received: by 2002:a17:90b:268f:b0:1ef:ba7e:3fe4 with SMTP id pl15-20020a17090b268f00b001efba7e3fe4mr3767285pjb.23.1657181438093;
        Thu, 07 Jul 2022 01:10:38 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id w18-20020a627b12000000b00527e026591esm16823027pfc.150.2022.07.07.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 01:10:37 -0700 (PDT)
Message-ID: <e9aa6aec-7f2b-da3e-84d7-00ca6cfeff06@gmail.com>
Date:   Thu, 7 Jul 2022 17:10:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <YsXDP3r59jlOTXGb@casper.infradead.org>
Subject: Re: How to cross-link to another document?
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <YsXDP3r59jlOTXGb@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matthew,

On Wed, 6 Jul 2022 18:15:43 +0100, Matthew Wilcox wrote:
> I've tried several variants of this without success.  What's the
> correct incantation?
> 
> +++ b/Documentation/core-api/idr.rst
> @@ -17,6 +17,8 @@ solution to the problem to avoid everybody inventing their own.  The IDR
>  provides the ability to map an ID to a pointer, while the IDA provides
>  only ID allocation, and as a result is much more memory-efficient.
> 
> +The IDR interface is deprecated; please use the _`XArray` instead.

You can cross-link using .rst file's path, in this case the relative path.
(This is an extension to Sphinx for kernel documentation.)

+The IDR interface is deprecated; please use the xarray.rst instead.

If you think "the xarray.rst" looks weird in plain-text, then maybe:

+The IDR interface is deprecated; please use :doc:`the XArray <xarray>`
+instead.

Here, <xarray> points xarray.rst.  <xarray.rst> doesn't work behind
:doc:.

Or simply drop "the":

+The IDR interface is deprecated; please use xarray.rst instead.

In this case, as both idr.rst and xarray.rst are under core-api/,
the relative path would be a reasonable option.  As a bonus, it
works in both full and partial (subdirectory-wise) builds.
Cross-links using absolute paths don't work in partial builds.

> +
>  IDR usage
>  =========
> 
> +++ b/Documentation/core-api/xarray.rst
> @@ -1,4 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0+
> +.. XArray_

In any case, a reference label at the top of a .rst file is pointless.
Please don't add a new one.

See: https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#cross-referencing

Hope this helps.

        Thanks, Akira
> 
>  ======
>  XArray
> 
> I first tried "named reference, reStructuredText_;"
> and then "_`inline internal target`" and I've tried both prefixing and
> suffixing both destination and target with an underscore.  Nothing seems
> to work and sometimes I get error messages telling me it won't work,
> and sometimes I just get non-hyperlinks.
> 
> Do I have to do something like
> 
> 	:ref:`Documentation/core-api/xarray.rst <XArray>`
> ?  That would seem unnecessarily verbose.
