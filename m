Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C6BC47082
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 15:43:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30373613EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 15:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFEPpj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 11:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFEPpj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jun 2021 11:45:39 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C89C061766
        for <linux-doc@vger.kernel.org>; Sat,  5 Jun 2021 08:43:34 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso9662838wmh.4
        for <linux-doc@vger.kernel.org>; Sat, 05 Jun 2021 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=clvSa+JvU6uBZ+o4YWIoUVY1T/E/2QPROQXufQI5L34=;
        b=T0g+7NMfdg+/GWUIM/XuSqgrwASyZbRCGDGVNvTo3QwR7HHSOvoJeV5wwnhAYyEu8p
         lNCqV8yQ7QZXDNGNVrsstpm1xDzeS/IWZMneJbjVR+IHlGfredBoI6hFBgUpSnP1+rcw
         lPRPTiKnOkt32MhcYup1zoHo6FabIXls9uVdcH8vAJ++OGYRgSsDqb5sCZYbbDgOHYI6
         h1BMPdgCtpaVHpGaoFHrUaKGqsD5sauVVUh/AxjDkxobKYd+46Q+iYA+e4fO2kSeqB1k
         trU0dGYNFBnEOSl22Uu/TgW1U4k+IVbgIlUDqqcX5K/6JMdMM/BI2Kmydu2ehZunaF0u
         ESWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=clvSa+JvU6uBZ+o4YWIoUVY1T/E/2QPROQXufQI5L34=;
        b=ScAmn4cbo9UN8hSrcRvalm/wUuL+ko73rn3KASKVgkk5p1xezZlf5xZcv6O3y6GTbJ
         FRVLjtE+llAMYSJWpo/tF4OrzupuuQ3XR3RgBWUQLWHEE1uLe1zebh3HmoTS76LVWPEh
         a+p/9e8SDHx/7p3XRMP794KZ4QO6NMSK+Jt/lpE9rdvqj5d3kgbZ0erYdM/AmM+TAHAE
         OsX3ZlrpZ7HcxRmeMDYQkdS4TC1EtB0H9wa7EOUht98mUUMPFSypwDkT6g+WERIVJOCl
         EMCadRTKBFuBLv6d9Xb9RED/erwuqrPCIRIA0kqW2VjZk2IltB3+d0B9M0pwazIgCfhN
         WqAA==
X-Gm-Message-State: AOAM530WzrVX2QIA7DW7X36DMvGq+bUoT4F/xq9qQBM2diIjjNaRP805
        T3xhhEPFuQ9nI/lXC9+vqI3W8Lr4hBj+kkxaFYkuPg==
X-Google-Smtp-Source: ABdhPJw4Dw/ErnZ+CAGXFG16Mr96Iq3PCkOCpBV8t6JOv8RyD39fk8GHFGJiW0cDt6C2hHns9FgdWJ5t4GAeTvXvhxo=
X-Received: by 2002:a1c:1dd3:: with SMTP id d202mr8688712wmd.78.1622907813308;
 Sat, 05 Jun 2021 08:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622898327.git.mchehab+huawei@kernel.org> <08ac283ac5bdc2664255a7ad34514e50d3ed85d8.1622898327.git.mchehab+huawei@kernel.org>
In-Reply-To: <08ac283ac5bdc2664255a7ad34514e50d3ed85d8.1622898327.git.mchehab+huawei@kernel.org>
From:   David Gow <davidgow@google.com>
Date:   Sat, 5 Jun 2021 23:43:22 +0800
Message-ID: <CABVgOSmheB_f5gNc_zyuDHrwdRs_x_osutorJbLUMGpRRU4nzA@mail.gmail.com>
Subject: Re: [PATCH 02/34] docs: dev-tools: kunit: don't use a table for docs name
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 5, 2021 at 9:18 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> We'll be replacing :doc:`foo` references to
> Documentation/foo.rst. Yet, here it happens inside a table.
> Doing a search-and-replace would break it.
>
> Yet, as there's no good reason to use a table there,
> let's just convert it into a list.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

While I personally quite like the look of the table when rendered by
Sphinx, I think the list is much more readable as plain-text, so this
is okay by me.

That being said, a definition list[1] seems like it should be better
still, though I can't get it to work with the kernel's Sphinx
configuration, so let's stick with this for now. (Given we've only got
one page of documentation here, the whole thing doesn't matter much
anyway.)

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

[1] https://rest-sphinx-memo.readthedocs.io/en/latest/ReST.html#definition-list


>  Documentation/dev-tools/kunit/api/index.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/api/index.rst b/Documentation/dev-tools/kunit/api/index.rst
> index 9b9bffe5d41a..b33ad72bcf0b 100644
> --- a/Documentation/dev-tools/kunit/api/index.rst
> +++ b/Documentation/dev-tools/kunit/api/index.rst
> @@ -10,7 +10,7 @@ API Reference
>  This section documents the KUnit kernel testing API. It is divided into the
>  following sections:
>
> -================================= ==============================================
> -:doc:`test`                       documents all of the standard testing API
> -                                  excluding mocking or mocking related features.
> -================================= ==============================================
> +Documentation/dev-tools/kunit/api/test.rst
> +
> + - documents all of the standard testing API excluding mocking
> +   or mocking related features.
> --
> 2.31.1
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/08ac283ac5bdc2664255a7ad34514e50d3ed85d8.1622898327.git.mchehab%2Bhuawei%40kernel.org.
