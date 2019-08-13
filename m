Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C69E97D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 04:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfHME1S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 00:27:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37876 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfHME1R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Aug 2019 00:27:17 -0400
Received: by mail-pf1-f195.google.com with SMTP id 129so3921814pfa.4
        for <linux-doc@vger.kernel.org>; Mon, 12 Aug 2019 21:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQL9RUtIML/PZe8MNFP8yQiCjWtKgPLyEfIL1k8PJhc=;
        b=fbg8VeT4fWy8MdPE5NDtumx+KrkUlXY0FY4hQL0ZwFaSB+aAw9A23C2a0B2+TAgTcn
         QRSm6g30QyXjT5+Li/OxZJId+1mikYGNYaRjFswNcd6fvPG4iGcxHlUtL+YOAsZsA1S0
         rcxRRdXDnZm1MmAStKLyKDuVzVZJLX5Lpcsp/wnXCV2B+DSuCumnuklf6b0VFdNwZEgN
         UTua35jaJGosxDOytq+pTP+fwXsPV3GIbr3R559nMEJhIG1Zt9VqS/XG0JoEGRztyMPv
         pjPkYqPfyv4d0basCqZO32/EFQQWHTlJ0mQAVIAE2306A8Q+UbbHGf9TCQnW3CYkOtTX
         JP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQL9RUtIML/PZe8MNFP8yQiCjWtKgPLyEfIL1k8PJhc=;
        b=SBKQobZm3KUr3F0V3+Nc/eQhMhyGGj/oys7ZgzyArK99aA+s3mZL6KglzMqTZ/xyv2
         7d2y13BTSOkG/sbq46Ohsi8fhjeUtjSoVZGSkJ5k32hVj2n9Hw2l83bu+rFTXbBHjhuz
         +JW4rMu2S3pHKfUkV2MorZuzi5FqKs4KhMqUDZkzQs6xBI6VI1lctqVW8pK+08lwyfYU
         O1fHzPw8+4DHKMK+bfZseq+KNUK7JwaL2aeRKWy2onKsQp9WxRPJhMC9HC5Kdtn0bZsW
         d/5KdWn2Aoc6H6hSkYMVx04aK3ZO61/xz5IAqx5+9y4IjL7xMtCQGR5jH+ub6wUDn/WV
         SuKw==
X-Gm-Message-State: APjAAAUKEG0vDrFpHVZ4eKqzjRv7sN5fXLJQIh5tlw/okS00K25p03JZ
        VqQ0TnPhxpEblk1LZlgbjcemQPgSXMJuou5r3tx6og==
X-Google-Smtp-Source: APXvYqyDNtjg1vEeMDr2gVCEsRefZmM7lb53WZNnRaIftMCnD83RA48eWcYK2L1Qi2YiTKmhvzfk7GUpdRuiK3gA3Wg=
X-Received: by 2002:a63:b919:: with SMTP id z25mr32569272pge.201.1565670436109;
 Mon, 12 Aug 2019 21:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-5-brendanhiggins@google.com> <20190812234644.E054D20679@mail.kernel.org>
 <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
In-Reply-To: <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 12 Aug 2019 21:27:05 -0700
Message-ID: <CAFd5g44GxE-p+Jk_46GYA-WWVHLW7w=yE+K_tbbdiniDfrk-2w@mail.gmail.com>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 12, 2019 at 4:56 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Mon, Aug 12, 2019 at 4:46 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Brendan Higgins (2019-08-12 11:24:07)
> > > Add `struct kunit_assert` and friends which provide a structured way to
> > > capture data from an expectation or an assertion (introduced later in
> > > the series) so that it may be printed out in the event of a failure.
> > >
> > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > ---
> >
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> >
> > Just some minor nits below
> >
> > > diff --git a/include/kunit/assert.h b/include/kunit/assert.h
> > > new file mode 100644
> > > index 0000000000000..55f1b88b0cb4d
> > > --- /dev/null
> > > +++ b/include/kunit/assert.h
> > > @@ -0,0 +1,183 @@
> > [...]
> > > +                           struct string_stream *stream);
> > > +
> > > +struct kunit_fail_assert {
> > > +       struct kunit_assert assert;
> > > +};
> > > +
> > > +void kunit_fail_assert_format(const struct kunit_assert *assert,
> > > +                             struct string_stream *stream);
> > > +
> > > +#define KUNIT_INIT_FAIL_ASSERT_STRUCT(test, type) {                           \
> > > +               .assert = KUNIT_INIT_ASSERT_STRUCT(test,                       \
> > > +                                                  type,                       \
> > > +                                                  kunit_fail_assert_format)   \
> >
> > This one got indented one too many times?
>
> Not unless I have been using the wrong formatting for multiline
> macros. You can see this commit applied here:
> https://kunit.googlesource.com/linux/+/870964da2990920030990dd1ffb647ef408e52df/include/kunit/assert.h#59
>
> I have test, type, and kunit_fail_assert_format all column aligned (it
> just doesn't render nicely in the patch format).

Disregard that last comment. I just looked at the line immediately
above your comment and thought it looked correct. Sorry about that
(you were pointing out that the .assert line looked wrong, correct?).

> > > +}
> > > +
> > > +struct kunit_unary_assert {
> > > +       struct kunit_assert assert;
> > > +       const char *condition;
> > > +       bool expected_true;
> > > +};
> > > +
> > > +void kunit_unary_assert_format(const struct kunit_assert *assert,
> > > +                              struct string_stream *stream);
> > > +
> > [...]
> > > +#define KUNIT_INIT_BINARY_STR_ASSERT_STRUCT(test,                             \
> > > +                                           type,                              \
> > > +                                           op_str,                            \
> > > +                                           left_str,                          \
> > > +                                           left_val,                          \
> > > +                                           right_str,                         \
> > > +                                           right_val) {                       \
> > > +       .assert = KUNIT_INIT_ASSERT_STRUCT(test,                               \
> > > +                                          type,                               \
> > > +                                          kunit_binary_str_assert_format),    \
> > > +       .operation = op_str,                                                   \
> > > +       .left_text = left_str,                                                 \
> > > +       .left_value = left_val,                                                \
> > > +       .right_text = right_str,                                               \
> > > +       .right_value = right_val                                               \
> > > +}
> >
> > It would be nice to have kernel doc on these macros so we know how to
> > use them.
>
> Sounds good. Will fix.
