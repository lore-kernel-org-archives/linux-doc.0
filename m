Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A667B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Oct 2019 08:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbfJaIM1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Oct 2019 04:12:27 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40803 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfJaIM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Oct 2019 04:12:27 -0400
Received: by mail-io1-f67.google.com with SMTP id p6so5688023iod.7
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2019 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rOCUGAkw41wVs89+EhO5yewU1a4RTtYYZqQvXNtrcs0=;
        b=GR9/xp6H+4NBpu+XucDM5RhhleRHZ/B36we0Tx9iqC0S9iWspFCAyw35gLfklGkCwD
         VwXz2x3iqgf4+egjISYf6W4F1r5LHTnnNd/hl1pMf8CaAnU4gK7E6d0ypCSt47LXJq4B
         lDPLtGzh4baJj4iXZDxDNVz2fvlhG0F01/GAcbza8d1rnx7s6+Vj/KXMJlM6ZYxPnhTP
         MxyiRodNGpY4zXxB+D6KALdMtbKmAPWUmeHKpKvU+IiLpSTjBRh+E1PxjRFu73Ud6nmI
         3So3HJcb5HBwkKEYIhk9Bk6KTaoEkz53UcPNUlbq0SWQdCpYXw05aKhxhrn+zlm5JWX/
         9AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rOCUGAkw41wVs89+EhO5yewU1a4RTtYYZqQvXNtrcs0=;
        b=AT4KagKXruyQNyA7A/ZB9jZJoCYuW4zHzcI7qitaRi+cH9MSpXo83hrrsBNtkjpjZL
         PV4sESk+VkdCqq5W4AFH3M9xa79VkDdocaUEZmDzaxJT2so++HNoApMzVplKXeQ/FxL0
         8o+8rR079MlvzAggtmb78EgAISOxc18XddEANQPeN1wY5ae8SxdMzjPN5I9O1fUaTpBI
         yxF0Mx1aQbCo5RCd/2Pe1ea0GLmCmxdk96/xFYIrSgGPPesQfoYuYjcesNxKxUf/mg3u
         +adqqOmfK6COL3vQsTqBatWhUqLO+gEA+/oTKfUQeU9ZrN0gFsWk7rlUsJwT7BqP/MjA
         YD1g==
X-Gm-Message-State: APjAAAXmKsHVR6L2VJVu5OG3ZeAovizUxLkg2KsUU/pz1C8rXgqwvPmO
        +42V1J7IDOIGFR+Q0l33F4eexhuUtbu056OLmoNC9w==
X-Google-Smtp-Source: APXvYqzCS2TeB4sqdrLijb5Y1d6jjSdnZ6MQdPlO/+Ixz45cbwTzvFNMP7rQQMznswokntR4fKoTP6lgkkSuzK7nlgY=
X-Received: by 2002:a02:742a:: with SMTP id o42mr2364jac.24.1572509546182;
 Thu, 31 Oct 2019 01:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191006053916.8849-1-brgl@bgdev.pl> <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
 <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
 <CAMRc=Me8g2gFiag0UQwuu4UZONcowQw900+MUbGF+4-E0z09Zg@mail.gmail.com>
 <CAK8P3a2mh+Eh+W1GFL2Mi5R3t55SRwWyXW_iBxXB-nBhdCO8LA@mail.gmail.com>
 <20191030213555.GA25515@infradead.org> <CAMpxmJXOANjxZgTcReRmd6TGaUKNi=8Cxwj4K69aRY=bF3jDiw@mail.gmail.com>
In-Reply-To: <CAMpxmJXOANjxZgTcReRmd6TGaUKNi=8Cxwj4K69aRY=bF3jDiw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 31 Oct 2019 09:12:15 +0100
Message-ID: <CAMRc=MeYe4X1zXAnsK_cAYfcAE-t3X0nW7+NbsVtsBU4f+C_KA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

czw., 31 pa=C5=BA 2019 o 07:41 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> =C5=9Br., 30 pa=C5=BA 2019 o 22:35 Christoph Hellwig <hch@infradead.org> =
napisa=C5=82(a):
> >
> > On Mon, Oct 21, 2019 at 09:29:30PM +0200, Arnd Bergmann wrote:
> > > > Is Christoph's work in next? The series doesn't apply cleanly on ne=
xt,
> > > > I needed to fix a couple conflicts. What branch should I rebase it =
on
> > > > before resending?
> > >
> > > Not sure, maybe Christoph can comment.
> > >
> > > Your patches would best go through the char-misc tree and be based
> > > on top of that, for Christoph's I think the idea is to have some go
> > > through the architecture maintainer trees, and have whatever is
> > > left go through my asm-generic tree.
> >
> > Actually I thought of just doing an ioremap tree for this merge window.
> >
> > What kind of changes does Bartosz have?  I'm kinda missing the context
> > here.
>
> Just the series you've responded to here, but I don't think it should
> conflict with your changes (not very much anyway).
>
> Greg: can this be picked up into char-misc?
>
> Bart

I refer of course to the re-sent version rebased on top of char-misc.

Bart
