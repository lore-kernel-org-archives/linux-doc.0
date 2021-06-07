Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8251C47082
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 20:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC16F6109F
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 20:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbhFGUEm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 16:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhFGUEm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 16:04:42 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E360C061574
        for <linux-doc@vger.kernel.org>; Mon,  7 Jun 2021 13:02:50 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso786753pji.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X2XQQivzvNRkfVR3uSuxxvXJvrtUp9ycHqIQW57PEVc=;
        b=FUJQObTw+/Sj5743vZFa+P0h1Lm/oP1FX1dHa+Jtegd7gPGGZIcatslpsMnCbbxgty
         x8T7iwJ+hbKMaQW6gP4FuBSIKvHOG/QspuRA2lAySUNb6SGgzi8+WRrU631omy47Xhdw
         PYEuK6nxnzR1wiUC/dqtuK14DitfffDlK/w8CVAIMVn++0Y3Qksr5DFVh3J23JBQMpOU
         X1CfbuI8PTA02PSH6/a2xGZ5hFEG2IYEzQiC9EHjPdWrfYWKg1p0DKs5OZ2JSRzCDIY7
         YLeffiPvPfoFvrypyX7/kTlKaKD9XfWD0OVHmFy9ZIMZ2ebmHkAd1MLYx8IQ/LA4wA0H
         9Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X2XQQivzvNRkfVR3uSuxxvXJvrtUp9ycHqIQW57PEVc=;
        b=s+u7eSJ8kFIe1WHJgqB6CSLiD3Yqw7ZxXchvejXXhB05hvCGD+4Nz2lwzmheakkpUN
         noKT6WQWxNGzgUheGmsS7az+BOZUDh2LLdYjBsA9pZawYfHWuMgBaM2XwJFyNGceLLSC
         ErDFvCTgH+toH/rL7NT/AmclW0bh8u4ITgymARA6HskRfDsl5ru/NYoZkSpMHjh0w8nr
         n2Gi2LiV9J38Lq/4CHoXtPlojmAJJFa28WxHW+7d5VyAdJ0uddAeVfqJ+re6j+qeNV1k
         hLsB7E1FDeJ1osXrgvbdgSezU9uyUlNZjhXSePUASkd0o+GKuw3fn3EPZtP60YJfDtqk
         VBxw==
X-Gm-Message-State: AOAM531/vjHiBjKrYC5BYLfQ03Rjrs+pnbMSAVgo9QVCsJTDdrV+xMLG
        oVNR9amqJ5NKAeeHoj/dg8xMikiZc2C5tQlQWsMx8w==
X-Google-Smtp-Source: ABdhPJzvxHRhWpJjs2Wf9Ov/7iB+vMzF0yxTtBqxQOHhtftZGhx8lpquxFicR0ACfQDsXLXgsM0CgtTAyTv2de9x/nQ=
X-Received: by 2002:a17:90a:b28d:: with SMTP id c13mr854921pjr.80.1623096169879;
 Mon, 07 Jun 2021 13:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210606005531.165954-1-davidgow@google.com>
In-Reply-To: <20210606005531.165954-1-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 7 Jun 2021 13:02:38 -0700
Message-ID: <CAFd5g44YH5P=4U34kTnWwgTKQbT6toLtEfDNHw3bHLHqiyj8QQ@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: test: Improve failure message in KUNIT_EXPECT_KASAN_FAIL()
To:     David Gow <davidgow@google.com>
Cc:     Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Daniel Axtens <dja@axtens.net>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 5, 2021 at 5:55 PM David Gow <davidgow@google.com> wrote:
>
> The KUNIT_EXPECT_KASAN_FAIL() macro currently uses KUNIT_EXPECT_EQ() to
> compare fail_data.report_expected and fail_data.report_found. This
> always gave a somewhat useless error message on failure, but the
> addition of extra compile-time checking with READ_ONCE() has caused it
> to get much longer, and be truncated before anything useful is displayed.
>
> Instead, just check fail_data.report_found by hand (we've just set
> report_expected to 'true'), and print a better failure message with
> KUNIT_FAIL(). Because of this, report_expected is no longer used
> anywhere, and can be removed.
>
> Beforehand, a failure in:
> KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)area)[3100]);
> would have looked like:
> [22:00:34] [FAILED] vmalloc_oob
> [22:00:34]     # vmalloc_oob: EXPECTATION FAILED at lib/test_kasan.c:991
> [22:00:34]     Expected ({ do { extern void __compiletime_assert_705(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(fail_data.report_expected) == sizeof(char) || sizeof(fail_data.repp
> [22:00:34]     not ok 45 - vmalloc_oob
>
> With this change, it instead looks like:
> [22:04:04] [FAILED] vmalloc_oob
> [22:04:04]     # vmalloc_oob: EXPECTATION FAILED at lib/test_kasan.c:993
> [22:04:04]     KASAN failure expected in "((volatile char *)area)[3100]", but none occurred
> [22:04:04]     not ok 45 - vmalloc_oob
>
> Also update the example failure in the documentation to reflect this.
>
> Signed-off-by: David Gow <davidgow@google.com>

Nice work!

Acked-by: Brendan Higgins <brendanhiggins@google.com>
