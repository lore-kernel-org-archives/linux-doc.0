Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8D9C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 15:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiGFPJL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 11:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiGFPJI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 11:09:08 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE572DF30
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 08:09:07 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id m2so13890930plx.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=CjWh0bRoLxQ7VyDqT5yHnppMmjghw/7OuldZ9sVFwNs=;
        b=jwEGBFYenvAhomOzpE8JocUkqpOb8m4+FgB0WWXxjYZnEmWJs9kAi9Ikw0n6fD0Oy4
         P9k184IlYN0VVkJsCcozBokukq6pzEDmhYRszz7d2thF9UQVCc1PU7zuj5cgbJyRvEih
         jTVK/p+R/dFXkBNRwvva5sHHrMVmlqQDEhc9q1YvZ3Ce95ouAdR6XwsCkY34DLgP0qKQ
         gQJ/glw3UVG4ENgq3cdq/j2uV/7tnKXAYOwH5yzWaKkKpgIN5qFhTSotIgNNbZy1aOnK
         xOjwRyrA/TabZu5xn8rcvDRRaEV/zS0HMtbuCt2HLEE3XMUFLhEu8varrBEXVPb+JZNw
         QCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=CjWh0bRoLxQ7VyDqT5yHnppMmjghw/7OuldZ9sVFwNs=;
        b=JL6ewndTRCl2sfMqvVLF8R4NPt8LJZZzQCbz1YZt4p2eKILWiAPIt4pn353hj6BgEd
         yD3RzEp8RuUGDCLVcZ3DeGu+OR2SUvtDDLhBsfN1mvGONID5ypPFh1xEkPjcpGdHaafy
         zFTcLomGk58SZoueLuy7+r1zZkvv1su3VV5VL60kU1plK3cM1TE3Tfa36eC0ezKibfIG
         +NT+F4bzYM5Hxklq98/Ml+brOWL0vFSH5+jyLpeZTOv1Un6aF1wK9lUAKIcBukrPK+UK
         z0/ZMM8bP7JYgCjD6vDvAjgFOyk0mZvKUdqkwLLR5mCXcK1nljXlUdxXw5WGzSYWH4vF
         lo0g==
X-Gm-Message-State: AJIora8LJVCYS+mADtZOXwckOxPwyf8jYsVZ9vgHnl5uwwaaJXN6uZrN
        SD0Aapl6Bh4uVwydA1abRLI=
X-Google-Smtp-Source: AGRyM1vNIvCBCEDPfGbq+H/TPKvb63snJ/oXNL1XOcP8SbZhAwqROW35O8HczJy7c09eqmeb4cJtyg==
X-Received: by 2002:a17:90a:fa05:b0:1ef:89d1:1255 with SMTP id cm5-20020a17090afa0500b001ef89d11255mr19460179pjb.73.1657120147221;
        Wed, 06 Jul 2022 08:09:07 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id x16-20020a17090a165000b001ef406682c1sm14230990pje.39.2022.07.06.08.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:09:06 -0700 (PDT)
Message-ID: <554d0394-321c-c206-1774-7d33360b1553@gmail.com>
Date:   Thu, 7 Jul 2022 00:09:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To:     Martin Fernandez <martin.fernandez@eclypsium.com>
Cc:     dwaipayanray1@gmail.com, joe@perches.com,
        linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com,
        Akira Yokosawa <akiyks@gmail.com>
References: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
Subject: Re: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,
Minor nit on reST syntax.

On Mon,  4 Jul 2022 19:57:57 -0300, Martin Fernandez wrote:
> Add a description, an example and a possible workaround to the
> MACRO_ARG_REUSE check.
> 
> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
> Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index b52452bc2963..86545c65cf7b 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -759,6 +759,26 @@ Indentation and Line Breaks
>  Macros, Attributes and Symbols
>  ------------------------------
>  
> +  **ARG_REUSE**> +    Using the same argument multiple times in the macro definition
> +    would lead to unwanted side-effects.

You don't need manual emphasis as above, as this list is already
in the form of so-called "Definition Lists" [1, 2].

[1]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#definition-lists
[2]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#lists-and-quote-like-blocks

Defined terms will be automatically emphasized by Sphinx and
should look in bold face in the generated HTML/PDF.
(Style of emphasis might be customized by configuration.)

It looks like there exists other similar patterns in this file
(or might as well be in other related .rst files).  I'd suggest
removing those manual emphases in a follow-up patch.

This is only a weak suggestion, and there is no urgency.
Of course, if you have a reason to do the manual emphases,
there is no need to change.

        Thanks, Akira

> +
> +    For example, given a `min` macro defined like::
> +
> +      #define min(x, y)  ((x) < (y) ? (x) : (y))
> +
> +    If you call it with `min(foo(x), 0)`, it would expand to::
> +
> +      foo(x) < 0 ? foo(x) : 0
> +
> +    If `foo` has side-effects or it's an expensive calculation the
> +    results might not be what the user intended.
> +
> +    For a workaround the idea is to define local variables to hold the
> +    macro's arguments. Checkout the actual implementation of `min` in
> +    include/linux/minmax.h for the full implementation of the
> +    workaround.
> +
>    **ARRAY_SIZE**
>      The ARRAY_SIZE(foo) macro should be preferred over
>      sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
> -- 
> 2.30.2
