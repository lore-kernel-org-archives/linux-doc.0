Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF6AC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D8D610CE
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240721AbhITOsW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhITOsW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 10:48:22 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F48C061574
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:46:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id c21so61910080edj.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7j6srl8/3xZKjxyWacXYbIEtIpxDFLQTimtSKuIoENk=;
        b=kyGncLMMgPtE20GLkmXsc7UM/MZ+9OoYC1mCd9RZR+H+DKNUxthdAI7YIy3UULS1Ij
         RqADjFkwY9wAsiTq4h9+xay+CQAlTOGDQtk3oRJquzoyaOnaMNFf4rix0wNw1Es8UOps
         jhrwsRuhAWYe27amG5pRPOSVWFXCAkFAPwK8VjN5yOA8r/+DCRP8CAze6Rx4QzcAjC2B
         QejLx5s+wgd/hLJCIv/htrVjd5sftxiyPvhvAoVU2752q4QY+L4kz3KxLnjTrN6ekXzl
         e3yLACHESS3bKkQlGfYnxSBoI9QG0GDexBJfZUcGe7yyKb3l9vd4q5R4ly8U2I5qUsDU
         iyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7j6srl8/3xZKjxyWacXYbIEtIpxDFLQTimtSKuIoENk=;
        b=iYhpSOyESN/XRW+PA123XzQQ1ohr2gZkd0Xy0YpdUMvYhx+gq6bNOoQRDAXu2uFPIq
         JIcwk5QKfUsCc1IrtjYQSx3715wORc7xIH+xaB4CkhDMLUw6MZcKWpnNYxloA8DYKy5v
         fTQtPlMmYwDPq8AyHEEHTJxedJ4eXbOSXMIjMBsYpilx32w0Xg4Dh5SViYhAdnXeB9za
         zPZjI4QjsGBGruHZ51YbMUcnnSa+NsN0KWygC8Ss8b5VILNAO79fCbiy+gGtxDXZfx9k
         6SXWFt3kyTY9Q98N0J5juM0TXoHRTzTqG6LDyewHRKLaf7PrDTPznebH33Xmay6EXuF3
         Staw==
X-Gm-Message-State: AOAM530y3xbMGYCC0x13216N0iIYxNNrx4hBBysuJ5771aRu2NheYL9S
        RqrZccuQLqgUQVAHhu4oRcHbPUDJLpNcbpl7y9tewg==
X-Google-Smtp-Source: ABdhPJyaEw/eUpjG3ulFa2EQFG6rh8w6JkYCqdetDbXc7XjD9luokV7sIfFz/prDMKhitjYaTvW0+QO2SjCHFP2FZ9E=
X-Received: by 2002:aa7:c9cd:: with SMTP id i13mr30083192edt.178.1632149169591;
 Mon, 20 Sep 2021 07:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210920140509.5177-1-brgl@bgdev.pl> <20210920140509.5177-3-brgl@bgdev.pl>
 <20210920140938.GA24424@lst.de> <CAMuHMdXoZdhSydMpbW8B6oQJNnpYpTxmhHrV5CJNTUP7T1KsoA@mail.gmail.com>
 <20210920143046.GA26163@lst.de>
In-Reply-To: <20210920143046.GA26163@lst.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Sep 2021 16:45:59 +0200
Message-ID: <CAMRc=McQoD=cUHLu6TMyW85fdtXOm4x38tHVnEGjkVfcfX0mfA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] configfs: use BIT() for internal flags
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Joel Becker <jlbec@evilplan.org>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 20, 2021 at 4:30 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Sep 20, 2021 at 04:29:30PM +0200, Geert Uytterhoeven wrote:
> > Hi Christoph,
> >
> > On Mon, Sep 20, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
> > > On Mon, Sep 20, 2021 at 04:05:03PM +0200, Bartosz Golaszewski wrote:
> > > > For better readability and maintenance: use the BIT() macro for flag
> > > > definitions.
> > >
> > > NAK.  BIT() is the stupidest macro in the kernel and shall not be used
> > > ever.  And I'm pretty sure we had this discussion a few times.
> >
> > Care to explain why it is a stupid macro?
>
> Please look at the previous thread.  I'm tired of this discussion.

Hi Geert!

The only previous answer from Christoph is this:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2399968.html

Bart
