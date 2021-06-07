Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445AEC47082
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 09:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 240CA611BD
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 09:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhFGJSl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 05:18:41 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39433 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhFGJSk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 05:18:40 -0400
Received: by mail-oi1-f181.google.com with SMTP id m137so13489263oig.6
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XUfDIMDCYmEA5qA3F9WnU83CptP8nZGrHCEeaSa3FvE=;
        b=SlECEHPDMWENulEr++apu6/G+2zFcXBexSePch2iSbzOpmlPyT2ze8ULZiKZfH8Lfb
         eZEGE0V3Sq+20EQSZanC5weNOdPBPFGNeHPpOQl5z9weNBKUPG8DASHqcGM+0faXME1L
         BtcFMn03HUOWAVp//oOp2Zq04OO2G24uBYJSqb3fO5cHupL8WbEzuFNj+Yb+ANxZYxq1
         tmVUK1a4KMmRm+vA7uTqs/WspyjSCjG3Xf8CEB/Yt/5tV5hDQ8Mrrue7IR1VrB93PMvg
         sABFqpthta1sWItIjhoG4+xWNB/rRfLxZpe3ewRs1OoFOMOmcPPvMnSqqvjC0eeiVC4b
         TIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XUfDIMDCYmEA5qA3F9WnU83CptP8nZGrHCEeaSa3FvE=;
        b=uNr1YLsoFcupR53iGpe6Kko+gh2AW/sfuzhsjnKA1FdstulCwqQiP8BnBCDQi283JS
         3sbPRwbY/VQalZqSKO6rrtMIsgGKBDbZYlpX4HWxG0scqyfuyyp4hjAa3gxUL0CfDfJ2
         H2EeYAtVSV3a4lhfhudMkF3MviqAxD+SNAx/cntdNFv/ZX9PeNPOfCqZrvV64k56ejNQ
         YI1tQe1S78qTQqdXQk+EtxKJVP55TK7AmEKcyRuU87W93OqeKGHgU7mRTUTuU8ZN2p+u
         A0t3zLPBP8LYalHBLhdVdjAP0ys7BxgjGYxqWsOlxoy66l8xaJ7/sevzVV4Xb1JqfV8O
         tOag==
X-Gm-Message-State: AOAM532uAHPPgQPfI/fuq6aogsJI+DAZywxRz2ZfFJ2aTHrS9eCpPMZ8
        mTCCEHx5FE5+bNsA1vjUZkScah7/+sF7Fc1oR5Br+Q==
X-Google-Smtp-Source: ABdhPJzK6LNKG2d3o8knlsOaS4I6EbfOC+G5si4OV2vHOPYrXkvXdS4HwGLhD1MGbIO1vvbf33Hy00GdZuXlkxuCcjg=
X-Received: by 2002:a05:6808:10d4:: with SMTP id s20mr11061334ois.70.1623057349040;
 Mon, 07 Jun 2021 02:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210606005531.165954-1-davidgow@google.com> <CA+fCnZdzki-0vMgbsjrXBz7Uqwh+vo9L6tXCAfiyMpVjV3tV=g@mail.gmail.com>
In-Reply-To: <CA+fCnZdzki-0vMgbsjrXBz7Uqwh+vo9L6tXCAfiyMpVjV3tV=g@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 7 Jun 2021 11:15:37 +0200
Message-ID: <CANpmjNMu3pwhAq4DdKpgsz=qTzB6v5qW6A2FWo9CaYstKcWkqw@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: test: Improve failure message in KUNIT_EXPECT_KASAN_FAIL()
To:     Andrey Konovalov <andreyknvl@gmail.com>
Cc:     David Gow <davidgow@google.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Daniel Axtens <dja@axtens.net>,
        Brendan Higgins <brendanhiggins@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 6 Jun 2021 at 11:57, Andrey Konovalov <andreyknvl@gmail.com> wrote:
>
> On Sun, Jun 6, 2021 at 3:55 AM 'David Gow' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> >
> > The KUNIT_EXPECT_KASAN_FAIL() macro currently uses KUNIT_EXPECT_EQ() to
> > compare fail_data.report_expected and fail_data.report_found. This
> > always gave a somewhat useless error message on failure, but the
> > addition of extra compile-time checking with READ_ONCE() has caused it
> > to get much longer, and be truncated before anything useful is displayed.
> >
> > Instead, just check fail_data.report_found by hand (we've just set
> > report_expected to 'true'), and print a better failure message with
> > KUNIT_FAIL(). Because of this, report_expected is no longer used
> > anywhere, and can be removed.
> >
> > Beforehand, a failure in:
> > KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)area)[3100]);
> > would have looked like:
> > [22:00:34] [FAILED] vmalloc_oob
> > [22:00:34]     # vmalloc_oob: EXPECTATION FAILED at lib/test_kasan.c:991
> > [22:00:34]     Expected ({ do { extern void __compiletime_assert_705(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(fail_data.report_expected) == sizeof(char) || sizeof(fail_data.repp
> > [22:00:34]     not ok 45 - vmalloc_oob
> >
> > With this change, it instead looks like:
> > [22:04:04] [FAILED] vmalloc_oob
> > [22:04:04]     # vmalloc_oob: EXPECTATION FAILED at lib/test_kasan.c:993
> > [22:04:04]     KASAN failure expected in "((volatile char *)area)[3100]", but none occurred
> > [22:04:04]     not ok 45 - vmalloc_oob
> >
> > Also update the example failure in the documentation to reflect this.
> >
> > Signed-off-by: David Gow <davidgow@google.com>
> > ---
> >
> > Changes since v2:
> > https://lkml.org/lkml/2021/6/4/1264
> > - Update the example error in the documentation
> >
> > Changes since v1:
> > https://groups.google.com/g/kasan-dev/c/CbabdwoXGlE
> > - Remove fail_data.report_expected now that it's unused.
> > - Use '!' instead of '== false' in the comparison.
> > - Minor typo fixes in the commit message.
> >
> > The test failure being used as an example is tracked in:
> > https://bugzilla.kernel.org/show_bug.cgi?id=213335
> >
> >
> >
> >  Documentation/dev-tools/kasan.rst |  9 ++++-----
> >  include/linux/kasan.h             |  1 -
> >  lib/test_kasan.c                  | 11 +++++------
> >  3 files changed, 9 insertions(+), 12 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> > index d3f335ffc751..83ec4a556c19 100644
> > --- a/Documentation/dev-tools/kasan.rst
> > +++ b/Documentation/dev-tools/kasan.rst
> > @@ -447,11 +447,10 @@ When a test fails due to a failed ``kmalloc``::
> >
> >  When a test fails due to a missing KASAN report::
> >
> > -        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:629
> > -        Expected kasan_data->report_expected == kasan_data->report_found, but
> > -        kasan_data->report_expected == 1
> > -        kasan_data->report_found == 0
> > -        not ok 28 - kmalloc_double_kzfree
> > +        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:974
> > +        KASAN failure expected in "kfree_sensitive(ptr)", but none occurred
> > +        not ok 44 - kmalloc_double_kzfree
> > +
> >
> >  At the end the cumulative status of all KASAN tests is printed. On success::
> >
> > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > index b1678a61e6a7..18cd5ec2f469 100644
> > --- a/include/linux/kasan.h
> > +++ b/include/linux/kasan.h
> > @@ -17,7 +17,6 @@ struct task_struct;
> >
> >  /* kasan_data struct is used in KUnit tests for KASAN expected failures */
> >  struct kunit_kasan_expectation {
> > -       bool report_expected;
> >         bool report_found;
> >  };
> >
> > diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> > index cacbbbdef768..44e08f4d9c52 100644
> > --- a/lib/test_kasan.c
> > +++ b/lib/test_kasan.c
> > @@ -55,7 +55,6 @@ static int kasan_test_init(struct kunit *test)
> >         multishot = kasan_save_enable_multi_shot();
> >         kasan_set_tagging_report_once(false);
> >         fail_data.report_found = false;
> > -       fail_data.report_expected = false;
> >         kunit_add_named_resource(test, NULL, NULL, &resource,
> >                                         "kasan_data", &fail_data);
> >         return 0;
> > @@ -94,20 +93,20 @@ static void kasan_test_exit(struct kunit *test)
> >             !kasan_async_mode_enabled())                                \
> >                 migrate_disable();                                      \
> >         KUNIT_EXPECT_FALSE(test, READ_ONCE(fail_data.report_found));    \
> > -       WRITE_ONCE(fail_data.report_expected, true);                    \
> >         barrier();                                                      \
> >         expression;                                                     \
> >         barrier();                                                      \
> > -       KUNIT_EXPECT_EQ(test,                                           \
> > -                       READ_ONCE(fail_data.report_expected),           \
> > -                       READ_ONCE(fail_data.report_found));             \
> > +       if (!READ_ONCE(fail_data.report_found)) {                       \
> > +               KUNIT_FAIL(test, KUNIT_SUBTEST_INDENT "KASAN failure "  \
> > +                               "expected in \"" #expression            \
> > +                                "\", but none occurred");              \
> > +       }                                                               \
> >         if (IS_ENABLED(CONFIG_KASAN_HW_TAGS)) {                         \
> >                 if (READ_ONCE(fail_data.report_found))                  \
> >                         kasan_enable_tagging_sync();                    \
> >                 migrate_enable();                                       \
> >         }                                                               \
> >         WRITE_ONCE(fail_data.report_found, false);                      \
> > -       WRITE_ONCE(fail_data.report_expected, false);                   \
> >  } while (0)
> >
> >  #define KASAN_TEST_NEEDS_CONFIG_ON(test, config) do {                  \
> > --
> > 2.32.0.rc1.229.g3e70b5a671-goog
>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Reviewed-by: Marco Elver <elver@google.com>
