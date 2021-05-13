Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE83C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 23:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05F3861260
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 23:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhEMXIi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 19:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhEMXIh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 May 2021 19:08:37 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B247FC06174A
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 16:07:25 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id h6so24358110ila.7
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 16:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bou5KXeCvHfl4/qHpjsymnMf5AsOCJ/K4VqDNbdqdkY=;
        b=X7YVbJy4ppZrHv1bHPlY+C+GoiwZMyeHIxdxmgLs4FmXw2szFAgX1eVYIRdGrRiHKp
         htSSNmYFtuGfiIXFdaDdfDjGTARDKMpzVag4r6YlxsyEg6pANHiOph72LPWoCtkIFgF9
         3zH8L9Sb1vTlA55IVr8DU4yK4JsDBct/XJhA0F71SJDH15THOTosGIO7DGe75Om8vtga
         v5I2ibDPie5KVFkawdMyWAN8vVnrzfQmNbF1tgFxj2IPIkSPPA8iIa9Hz6sgCIcMpEAQ
         utB35246/6y+5+yGrsQFUba6ES1+vTz/UIQa8EUDP5Kl6q/OvmwFrSkIwTHFDWfMIitl
         WZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bou5KXeCvHfl4/qHpjsymnMf5AsOCJ/K4VqDNbdqdkY=;
        b=SRj7UmoX0Qy0ODki0u66etEh9PETB/LTOHkx//tueoxaCBwUHWNsn5EfEPUYddUzqk
         nRKpADiXdPnVPwIjwR/ZL/8PLno5wt9FmfCcF7eCr6q7uVikJbU3KcVgkhbZinzm8wpj
         RLkD6YepOXB4z24eZoA2OwIpiWW/EOpClgalqe/2hXq/D7L/otn0hZjpQsyJ5E2/Wy6G
         q8WqUlbfkSJsuCNwAcU7jJFbbMtwWoESWoOFjoCsDuEyxA5B6BE+SxOSatk6i0t2+1Vb
         ocLM49FyQ4Ep+1GU5HLtjeMH7Ho3CZo78m8g7QKZ9Y/7lo049iEC6i3qSjXYuFNFZtCo
         MFmQ==
X-Gm-Message-State: AOAM531+SmyDLShKe/Kb/jcCJIENNFvwXTDzAJNGjarQkp5DtHTVCM/x
        jF1dFqIckm1x2Xe4gMlE0S1Qkcjq0mtfGtELTre/Zg==
X-Google-Smtp-Source: ABdhPJz4R66VGFen2Ru+lT1VNd1sy/SfX6XIaF9ommoJgsudkcPrsEsYn6C2L5M2093GG9jDVbD5KeB+s/Ra4aT3HoM=
X-Received: by 2002:a92:d5cd:: with SMTP id d13mr37013472ilq.133.1620947245043;
 Thu, 13 May 2021 16:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com> <20210513193204.816681-3-davidgow@google.com>
In-Reply-To: <20210513193204.816681-3-davidgow@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 13 May 2021 16:07:13 -0700
Message-ID: <CAGS_qxpck5qy14OOJm2-_MBd160BXnBDyGu+iTzQCh1ay=VkGw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] Documentation: kunit: Clean up some string casts
 in examples
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 13, 2021 at 12:36 PM David Gow <davidgow@google.com> wrote:
>
> As the type checking is no longer excessively strict, get rid of the
> unsightly (char*) casts -- and comment discussing them -- from the KUnit
> usage page.
>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

Thanks!

> ---
>  Documentation/dev-tools/kunit/usage.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> index 650f99590df5..756747417a19 100644
> --- a/Documentation/dev-tools/kunit/usage.rst
> +++ b/Documentation/dev-tools/kunit/usage.rst
> @@ -465,10 +465,9 @@ fictitious example for ``sha1sum(1)``
>
>  .. code-block:: c
>
> -       /* Note: the cast is to satisfy overly strict type-checking. */
>         #define TEST_SHA1(in, want) \
>                 sha1sum(in, out); \
> -               KUNIT_EXPECT_STREQ_MSG(test, (char *)out, want, "sha1sum(%s)", in);
> +               KUNIT_EXPECT_STREQ_MSG(test, out, want, "sha1sum(%s)", in);
>
>         char out[40];
>         TEST_SHA1("hello world",  "2aae6c35c94fcfb415dbe95f408b9ce91ee846ed");
> @@ -507,7 +506,7 @@ In some cases, it can be helpful to write a *table-driven test* instead, e.g.
>         };
>         for (i = 0; i < ARRAY_SIZE(cases); ++i) {
>                 sha1sum(cases[i].str, out);
> -               KUNIT_EXPECT_STREQ_MSG(test, (char *)out, cases[i].sha1,
> +               KUNIT_EXPECT_STREQ_MSG(test, out, cases[i].sha1,
>                                       "sha1sum(%s)", cases[i].str);
>         }
>
> @@ -568,7 +567,7 @@ Reusing the same ``cases`` array from above, we can write the test as a
>                 struct sha1_test_case *test_param = (struct sha1_test_case *)(test->param_value);
>
>                 sha1sum(test_param->str, out);
> -               KUNIT_EXPECT_STREQ_MSG(test, (char *)out, test_param->sha1,
> +               KUNIT_EXPECT_STREQ_MSG(test, out, test_param->sha1,
>                                       "sha1sum(%s)", test_param->str);
>         }
>
> --
> 2.31.1.751.gd2f1c929bd-goog
>
