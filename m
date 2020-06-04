Return-Path: <SRS0=2xrs=7R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E514C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Jun 2020 17:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7304204EF
	for <linux-doc@archiver.kernel.org>; Thu,  4 Jun 2020 17:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KZNOLW4T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbgFDRt0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Jun 2020 13:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730148AbgFDRtX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Jun 2020 13:49:23 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA69CC08C5C1
        for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2020 10:49:22 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f3so3574297pfd.11
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2020 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=noG/LYQmpQlBkRLXh/1JDc42VCvjqZbg5EroNmyoqmk=;
        b=KZNOLW4TTiegIen/0rV+bOBGoAq8LWAoNbsh9LwEnhoa3lm1XLj+Tvo/2Suk+Qqa2r
         0PK+jR6XoskReuOrGKp43FPISUnxUopcqSZa5nRe9TRsKMCnnc3jcAIcGJbLIExv5j3e
         dnVQq3+R67BSyVDZGmr+oEsxKSaB4ejH7UTFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=noG/LYQmpQlBkRLXh/1JDc42VCvjqZbg5EroNmyoqmk=;
        b=fOAxrdafMrhq0PlGBsa4DmCkAR+7IzETNMWhMlkXfDMBPuaSGdQZj3adnlT/PPI6lP
         7g9IRGCVz3Zs4HFTlKHVEbhe6nI1Pd+cSy83yORntRZeXKIfhishHCRo1tTXvZXP0+OM
         L53B8j0oYPZwlP+Cck1YWAvwlfEXWd8wvc0cqSrzzmQWExF5CNdVhfJvI8x182+I7NyC
         PuYkIIuOw1mMEMjrFmshPAOvM7d6tNPux0PYeIWX+QzMFE/JWVQar31ufQeFIZH0/FuK
         RksgI8eXCKLEHgeCbNUqZxd15sNa3t7ctZLPB2qjamGmvu2+OEGsvQbyUnEP2/D1Xp/m
         x/Aw==
X-Gm-Message-State: AOAM533vBb6dRfSWQF2Fk6d4u06Ce3NUtNA544u1e4S+KWUTUvSoi6vC
        3NUHFMLY4n5j8yCArbf+aAiS5OuWbF2g0g==
X-Google-Smtp-Source: ABdhPJysRzlATrCAy0ZPvBedXYSCT6fmmFeq1dUhIpKsU0v0V1SYE8+lycAy6wODSBhqz9XjAONNJw==
X-Received: by 2002:a63:3188:: with SMTP id x130mr5397319pgx.249.1591292962180;
        Thu, 04 Jun 2020 10:49:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l83sm4832663pfd.150.2020.06.04.10.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 10:49:21 -0700 (PDT)
Date:   Thu, 4 Jun 2020 10:49:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] docs: deprecated.rst: Add note to the use of
 struct_size() helper
Message-ID: <202006041047.9B3E8FB951@keescook>
References: <20200604172138.GA21820@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604172138.GA21820@embeddedor>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 04, 2020 at 12:21:38PM -0500, Gustavo A. R. Silva wrote:
> Add a note to educate people about the proper use of struct_size() when
> the trailing array in the enclosing structure is a one-element array.
> 
> Zero-length and one-element arrays will soon be removed from the kernel,
> but in the meantime, it's worth letting people know how to correctly
> use struct_size() together with such constructs.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> 
> Kees,
>  
> This is not substitute for the patch I'll write about flexible-arrays
> and the deprecation of zero-lenght and one-element arrays.

Hm, hm. I think I'd rather just get the 0/1-array docs written, since
that will mean this paragraph isn't needed at all. (Or rather, it can be
modified to say "if you're using struct_size() on a 1-array, stop using
a 1-array, see [link]". If someone is going to switch around their code,
they need to switch to flex at the same time, IMO.

-Kees

> 
> Thanks
> --
> Gustavo
> 
>  Documentation/process/deprecated.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 652e2aa02a66c..0b7b37718bf96 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -85,6 +85,17 @@ Instead, use the helper::
>  
>  	header = kzalloc(struct_size(header, item, count), GFP_KERNEL);
>  
> +NOTE: You might want to use the following form in case the trailing array
> +is a one-element array, as unlike zero-length arrays and flexible-array
> +members, `one-element arrays occupy at least as much space as a single
> +object of the type <https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html>`_,
> +hence they contribute to the size of the enclosing structure::
> +
> +	header = kzalloc(struct_size(header, item, count - 1), GFP_KERNEL);
> +
> +It's also worth noting that one-element arrays --together with zero-length
> +arrays-- will soon be completely removed from the codebase and deprecated.
> +
>  See array_size(), array3_size(), and struct_size(),
>  for more details as well as the related check_add_overflow() and
>  check_mul_overflow() family of functions.
> -- 
> 2.27.0
> 

-- 
Kees Cook
