Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A28C2D0A8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 13:04:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5D8B20739
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 13:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xLsTUgj+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgI1NES (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgI1NES (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 09:04:18 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FDAC0613CE
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 06:04:17 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a12so1199838eds.13
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ne+81vxoKb22kRY3AEiPTbS5l+8d315k0Vq1Z+Caj8=;
        b=xLsTUgj+vnYaxnyZmTx6xItsEuEhBMjonEM/I4J2lSETvthslZ9C4+BlMjprjVwZKC
         ez+zjpNX4DyHeK7shz/xwa0i9NOPC0LIkDMRBHelgaWY28lDXynRwPlzjwbg3UImA9gs
         mtTgSsuxZdSA4uxUKBctjRb54UbU3r0FJLx/Q0/OODr3E+E1FaCxPlXJy++BuJD82qb/
         YPZ106ShHqTsFDmRvhoBXaj2i1XbXSeByJzHWm9jLO2dRwwTM3Q4zwgupnd64PnhvjYO
         k+hhc5u3ime9Ll/No6zQBTwPNIK6IJymVkxVIQjNl3/yX3pdtpUAjDNetdQDM/UAsqUi
         NvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ne+81vxoKb22kRY3AEiPTbS5l+8d315k0Vq1Z+Caj8=;
        b=FhR2Y8fKhB1fc0Y4Hc/NdcGn5YM59r2Mj9aV2yI4vXtTa+hsbPPcJohKuz9CJGNUfw
         L8lyA1x6piQlu7kHhoDZPZpHkXAYRJnEOguIvNBrIRp/O2QVpOnjf/F4RTd7mFNPl+1N
         bnMlo+Bq1wYH59FKXWAlMHUEJJvIuPFzhudTdNaP5qC0npzsPYV4CvG45FCfvKcr4TlR
         jPCyogeGelpqzIIEz4q70EEnF2Y01JBN+YQ7FGvXct5jgeUuygToHNrgRWMlViMkXTS1
         iDCPMLz0/92IqaAPsf4c4v0pw0qaJkgVaq9O51qwoprwtUT5tU1pCkTe51TrQQjC7CK1
         F+bQ==
X-Gm-Message-State: AOAM530k+1AkVbgUjqNETqo4ptwYQKrESI+juOr6KlAZhgmC1yVTISi5
        HY6is0Y+wzL7Zr+uRkncaToUm9Q9EiXO5C0J7E+TGw==
X-Google-Smtp-Source: ABdhPJw8HVtmC6lfse2CMPxO6e1wy5KcSGZu2BmULxtP/B5LlTFCaoMu3s/8C+xBwiREBQpN5mdFdDvkyjv0Y+BjdxU=
X-Received: by 2002:a05:6402:a51:: with SMTP id bt17mr1690554edb.186.1601298256459;
 Mon, 28 Sep 2020 06:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200928104155.7385-1-brgl@bgdev.pl> <20200928104155.7385-2-brgl@bgdev.pl>
 <20200928125539.GI3956970@smile.fi.intel.com>
In-Reply-To: <20200928125539.GI3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 15:04:05 +0200
Message-ID: <CAMpxmJWbws62wBcNuTeWr8xr+B0qd40kEtLTVXqxVoOzyUgp9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 28, 2020 at 2:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Sep 28, 2020 at 12:41:47PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > There's a common pattern of dynamically allocating an array of char
> > pointers and then also dynamically allocating each string in this
> > array. Provide a helper for freeing such a string array with one call.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> But see below.
>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  include/linux/string_helpers.h |  2 ++
> >  lib/string_helpers.c           | 25 +++++++++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
> > index 86f150c2a6b6..55b25120a1c6 100644
> > --- a/include/linux/string_helpers.h
> > +++ b/include/linux/string_helpers.h
> > @@ -94,4 +94,6 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
> >  char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
> >  char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
> >
> > +void kfree_strarray(char **str_array, size_t num_str);
> > +
> >  #endif
> > diff --git a/lib/string_helpers.c b/lib/string_helpers.c
> > index 963050c0283e..bfa4c9f3ca0a 100644
> > --- a/lib/string_helpers.c
> > +++ b/lib/string_helpers.c
> > @@ -649,3 +649,28 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
> >       return pathname;
> >  }
> >  EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
> > +
> > +/**
> > + * kfree_strarray - free a number of dynamically allocated strings contained
> > + *                  in an array and the array itself
> > + *
> > + * @str_array: Dynamically allocated array of strings to free. If NULL - the
> > + *             function does nothing.
> > + * @num_str: Number of strings (starting from the beginning of the array) to
> > + *           free.
> > + *
> > + * Passing a non-null str_array and num_str == 0 as well as NULL str_array
> > + * are valid use-cases.
> > + */
> > +void kfree_strarray(char **str_array, size_t num_str)
>
> Hmm... I have missed your answer to
>  str_array -> array
>  num_str -> n
>
> The rationale behind dropping str is to avoid duplicates in the name of the
> function and its parameters. 'array' is harder to avoid, but also possible,
> though I leave it to you.
>

Are you fine with me fixing this when applying the patches?

Bart
