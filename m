Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8182E7D917
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 Oct 2019 08:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbfJHIrV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 Oct 2019 04:47:21 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45198 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730137AbfJHIrU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Oct 2019 04:47:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id q64so16609745ljb.12
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2019 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l8gpydJYA0YDgp2JmqFlI7k3M5woSWANVYThPnzBSyg=;
        b=BkRMuuut74Tg4ql3czpGBiGETKQ47t0yfFGj9qUtoNECtFLrPq7patqxRQTIKUPosJ
         e5ij5XG6gLCR9aH2tMBlyg4nicWRgSUUeguPdBLCGj5e+fmO4WBOWHqbIrjN23GcV9X+
         9UiM5zuZ8kUOjmbmakyLfk3DNm7gDqehMEcBVhaBie4GaVJqRz5rpcUAluJLllJOF3Mf
         +y7BzcB/eQ1ZrGH8gN2u8Rxxi+fzSaghOC5xViRMArZNRSxn2csNz/W1bUfwb6lH8tnt
         yTgKoyASrJ8JwI3YQxZpWYMIBXyHXAIoXg2BD9qf9M9BjKJeDzu0rw7W+YgoKaSJzGqP
         eNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l8gpydJYA0YDgp2JmqFlI7k3M5woSWANVYThPnzBSyg=;
        b=oJFjsDQoDOXHGiYCKZ1vFoZhJ3YeJ0OoJ0k9RsShj0ihUy0z6WRvemRhHE22jV+Yay
         Yzu5tglG3Q2fTmU6hLiBvHm2Aig69ATqsDHG47FKmgeM607VYuS5zmQLA+Ovsq/NwmrF
         nuzhuIJKqRp2outPvgWTrk6jhS/cFp0+rGfZexKUoDgaWXFVFj69gbIxwKaZ2Z+jbXJ1
         7ucZ27EdpzZ4ihWfvEPlkS9t2Iy2KZhdC2VyKdb6wJb2erQ7BlXtOraCTqDs5v43jWWS
         PUAHr4bgF4gh713KkdPr0H6/fVb68D/eHoDa1WYIKvnRk5IAsytvVeZoRCo4A3ESUS5U
         3odg==
X-Gm-Message-State: APjAAAXQTmx/59r0okn6WHVc7WzF+APFjBSXATYFtBVUKZakvdheRCIP
        XxPp2d+tx4buADPO3Nzq3MgLSZteIdBGqcdC1/MOAw==
X-Google-Smtp-Source: APXvYqxbNM71HM7CPR6QRsIgEbU3UU9U/CSiMXaA2SIbIfrQl+rWLBRuuYXoBIaSEvilchXKRH21ww7tus0XXj0qkXw=
X-Received: by 2002:a2e:63da:: with SMTP id s87mr20899729lje.79.1570524436968;
 Tue, 08 Oct 2019 01:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190617221134.9930-1-f.fainelli@gmail.com> <CACRpkdbqW2kJNdPi6JPupaHA_qRTWG-MsUxeCz0c38MRujOSSA@mail.gmail.com>
 <0ba50ae2-be09-f633-ab1f-860e8b053882@broadcom.com> <CAK8P3a2QBQrBU+bBBL20kR+qJfmspCNjiw05jHTa-q6EDfodMg@mail.gmail.com>
 <fbdc3788-3a24-2885-b61b-8480e8464a51@gmail.com> <CAK8P3a1E_1=_+eJXvcFMLd=a=YW_WGwjm3nzRZV7SzzZqovzRw@mail.gmail.com>
In-Reply-To: <CAK8P3a1E_1=_+eJXvcFMLd=a=YW_WGwjm3nzRZV7SzzZqovzRw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Oct 2019 10:47:05 +0200
Message-ID: <CACRpkdbuwn-YBYd324OsfC4efBU_1pfnyS+N=+3DmrYOEKKFJw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] KASan for arm
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Hocko <mhocko@suse.com>,
        Julien Thierry <julien.thierry@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        David Howells <dhowells@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Abbott Liu <liuwenliang@huawei.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        drjones@redhat.com, Vladimir Murzin <vladimir.murzin@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Jinbum Park <jinb.park7@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Landley <rob@landley.net>, philip@cog.systems,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Garnier <thgarnie@google.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 8, 2019 at 12:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Oct 7, 2019 at 11:35 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> > > 053555034bdf kasan: disable CONFIG_KASAN_STACK with clang on arm32
> >
> > This one I did not take based on Linus' feedback that is breaks booting
> > on his RealView board.
>
> That likely means that there is still a bigger problem somewhere.

I will try to look into it. I got pretty puzzled by this, it makes no sense.

One possible problem is that some of the test chips on the RealViews
are not that stable, especially with caches. The plan is to test in QEMU
and hardware in parallel.

Yours,
Linus Walleij
