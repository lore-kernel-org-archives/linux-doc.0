Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 32C9D7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Apr 2019 21:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730596AbfDYVj3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Apr 2019 17:39:29 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40620 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731340AbfDYVj2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Apr 2019 17:39:28 -0400
Received: by mail-oi1-f195.google.com with SMTP id k10so1306239oik.7
        for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2019 14:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dPZ7rdZkRKHvl7tQSBXYLFpo+EXi1n//LfsmoJY/Z2s=;
        b=aYdwRc1HggUO9HL2nIeKqe+hn+Sk6MTVGTkf+pkSUW1w1acF2uKUF+Q1q50U9Y3aaC
         iV8DLA3o0UHQQwh7u2LDLZ2dULCvFPACLRWcICRHJwk55EGTGEhuesSmDrJKY+GZ+pBQ
         zxW7c7nFWIsSTuM66KbhGr6p5ywsTb9yBASdwUTfB4mCZRAEjeV3MwJixtVF/8dJKYwg
         Aa9JBZbSh5KailXw7X/dDBSWpnyer/ZCPxUVQrjc2WwJPc6O+oT4RbnwacyHBj7h51vC
         7yoslX52WmthkJmI8/w4rDSzwtqIPzANAeLWsPayMNzRiiKdK9ZXi0LV1FkrRZkUS4wq
         xI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dPZ7rdZkRKHvl7tQSBXYLFpo+EXi1n//LfsmoJY/Z2s=;
        b=N2RygxegT4j5uTJO/I7eIWrLugaldquqFGMYpKRiEwyOjPmbmJQUVvOB2J4AqemVgR
         pRbAsuyZzrqt+OfV7u84IOsKsZkuICmntTZXt9dZJsR1YMSIb4XVmMHbkpGIm0i9XLE0
         /52xS1SURybL18X9fhXvx9KHQ+soxiolJVZQ/38Bd9U4wrhJ4jX39UrQL7oV5pFLxmQr
         oqjb7g/cDv7TsMhiRg1QjmY4INsACN05pQ68ne+am8xWWFZBLATzgGHvfr+S0vK8l3MF
         j5brDKFu4oxWUj8FxFV+4B2aDFWrFyk41TgtSyOOpLBka/TCMaZHOFMshzg3CtnODDNN
         tSug==
X-Gm-Message-State: APjAAAXb+P6dvAQZbTv0XpMe7p/KPKVBt7eg7K8rZcQHMnk+CuKQPO5s
        0pneOwWFCdkiEae0HtDBBrBLIk8xsfzFQtftiFC+9A==
X-Google-Smtp-Source: APXvYqzMnmezfGQBjvzygGZvKQhtUxW7arA2XBMSLKS4eoO8FcHAUp85gWsE4yl6KWxO3L1QIJ9mam6oY0mRcWXHqTQ=
X-Received: by 2002:aca:4586:: with SMTP id s128mr4542736oia.148.1556228366758;
 Thu, 25 Apr 2019 14:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190404220652.19765-1-brendanhiggins@google.com>
 <20190404220652.19765-12-brendanhiggins@google.com> <20190424190019.wvljyeo3y7gd24p5@gabell>
In-Reply-To: <20190424190019.wvljyeo3y7gd24p5@gabell>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 25 Apr 2019 14:39:15 -0700
Message-ID: <CAFd5g45CaCFdQCxQqxgYfoQSGAF8RAV2YrOMs0oR4R-iCTZrig@mail.gmail.com>
Subject: Re: [PATCH v1 11/17] kunit: test: add test managed resource tests
To:     Masayoshi Mizuma <msys.mizuma@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, shuah@kernel.org,
        yamada.masahiro@socionext.com, Petr Mladek <pmladek@suse.com>,
        linux-doc@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        linux-kselftest@vger.kernel.org,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>, wfg@linux.intel.com,
        Joel Stanley <joel@jms.id.au>, Jeff Dike <jdike@addtoit.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kbuild@vger.kernel.org, "Bird, Timothy" <Tim.Bird@sony.com>,
        Avinash Kondareddy <akndr41@gmail.com>,
        linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
        Julia Lawall <julia.lawall@lip6.fr>,
        kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 24, 2019 at 12:00 PM Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
>
> On Thu, Apr 04, 2019 at 03:06:46PM -0700, Brendan Higgins wrote:
> > From: Avinash Kondareddy <akndr41@gmail.com>
> >
> > Tests how tests interact with test managed resources in their lifetime.
> >
> > Signed-off-by: Avinash Kondareddy <akndr41@gmail.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  kunit/test-test.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 122 insertions(+)
> >
> > diff --git a/kunit/test-test.c b/kunit/test-test.c
> > index 4bd7a34d0a6cb..54add8ca418a0 100644
> > --- a/kunit/test-test.c
> > +++ b/kunit/test-test.c
> > @@ -135,3 +135,125 @@ static struct kunit_module kunit_try_catch_test_module = {
> >       .test_cases = kunit_try_catch_test_cases,
> >  };
> >  module_test(kunit_try_catch_test_module);
> > +
> > +/*
> > + * Context for testing test managed resources
> > + * is_resource_initialized is used to test arbitrary resources
> > + */
> > +struct kunit_test_resource_context {
> > +     struct kunit test;
> > +     bool is_resource_initialized;
> > +};
> > +
> > +static int fake_resource_init(struct kunit_resource *res, void *context)
> > +{
> > +     struct kunit_test_resource_context *ctx = context;
> > +
> > +     res->allocation = &ctx->is_resource_initialized;
> > +     ctx->is_resource_initialized = true;
> > +     return 0;
> > +}
> > +
> > +static void fake_resource_free(struct kunit_resource *res)
> > +{
> > +     bool *is_resource_initialized = res->allocation;
> > +
> > +     *is_resource_initialized = false;
> > +}
> > +
> > +static void kunit_resource_test_init_resources(struct kunit *test)
> > +{
> > +     struct kunit_test_resource_context *ctx = test->priv;
> > +
> > +     kunit_init_test(&ctx->test, "testing_test_init_test");
> > +
> > +     KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
> > +}
> > +
> > +static void kunit_resource_test_alloc_resource(struct kunit *test)
> > +{
> > +     struct kunit_test_resource_context *ctx = test->priv;
> > +     struct kunit_resource *res;
> > +     kunit_resource_free_t free = fake_resource_free;
> > +
> > +     res = kunit_alloc_resource(&ctx->test,
> > +                                fake_resource_init,
> > +                                fake_resource_free,
> > +                                ctx);
> > +
>
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res);
>
>         KUNIT_EXPECT_NOT_ERR_OR_NULL(test, res);

See my reply to your email on the 14/17 patch.
