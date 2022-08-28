Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8500BECAAD2
	for <linux-doc@archiver.kernel.org>; Sun, 28 Aug 2022 11:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiH1LgN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Aug 2022 07:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiH1LgL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 07:36:11 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C35743314
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 04:36:10 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id nc14so5799249ejc.4
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=OdQ+Q9qV3LedSJkQfbn2p7WBBrnXUtBV8MUOTrhaEAY=;
        b=eeBB52Ce3r5kR9Dcp27QVPv61AMhihFpTZYjm3DkOv1VJWc6dejpSJHpOYakb68HeB
         akvqHdPr6RxF7jBUDq/hyyx8Ub1PLDhFD6VA41pYOF5zCY08yz6bbSY4QqUY2VXPDykb
         xFjRr29B2z700CCN8O0GJOAN29YA33B1RF54Vhm8aAY9vFQyOy+wSKiEAeTyaOH3wLg7
         9l7lsS2WzkLlehfx9n6wRdq4L+5Wo5wLhI8erWLJYJZfl0hatDEgJGjjFdCBmAiP4VBc
         7Bw+VqNTkYXGlAKQEd8bkrAKeig8lYdFPvJbEW/TdPfkpxjnjqqmlWSXuOEDhGhWR4Eq
         zA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OdQ+Q9qV3LedSJkQfbn2p7WBBrnXUtBV8MUOTrhaEAY=;
        b=oYOYfqc3qiNEWlDMBF5bt39z4WRNwzWPZmOtUhEW3KQ3nBdcRnCyo7+wQ4GT4EDZwc
         X/2LAO5JVMJtrZrOAUu6DOR7aCv/66AkLtC03UaP5vv/FLkrVsvZHInzbmOOEeMQ7LK3
         h8UjCaR2ahmq24cKl0mGiLA/wjYV59eqWA5wKase5rDTD8GEVoNGpoNAyGKnJNxKKZB6
         yfIyA30xUCaDsh+KOJfUWBU1ZimGOK7MydJwbHoah20mXd2V7E6HtTGSNWVufWNILJXE
         c0PmghLtEljWIo0VFpphzrBqgwOSo5cQtmq+jhgp63LoP8ayarJ3SAhEzUJhscoh+C5m
         7T3w==
X-Gm-Message-State: ACgBeo2cnKpwyIsMMejwvz4m29ju3Y8dbdGuwEcIodWHicfi1CwaxrX1
        93YQUpSniaJLKlcRIQuM+vMAnSFfUYQDInEae8zeFg==
X-Google-Smtp-Source: AA6agR7AmPxeYl/v4RcSVBl9iTpUGDHWyRcltexR6tY4uxIhIlTFbByhTuUZ07p3AOXBLqSGuwkccRVfPDLNHQeyuk8=
X-Received: by 2002:a17:906:cc5a:b0:741:5240:d91a with SMTP id
 mm26-20020a170906cc5a00b007415240d91amr3390854ejb.500.1661686568986; Sun, 28
 Aug 2022 04:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <f31b818cf8d682de61c74b133beffcc8a8202478.1660041358.git.christophe.leroy@csgroup.eu>
 <CACRpkdY53c0qXx24Am1TMivXr-MV+fQ8B0CDjtGi6=+2tn4-7A@mail.gmail.com>
 <CAK8P3a1Vh1Uehuin-u5QrTO5qh+t0aK_hA-QZwqc00Db_+MKcw@mail.gmail.com>
 <CACRpkdbhbwBe=jU5prifXCYUXPqULhst0se3ZRH+sWOh9XeoLQ@mail.gmail.com>
 <CAK8P3a0j-54_OkXC7x3NSNaHhwJ+9umNgbpsrPxUB4dwewK63A@mail.gmail.com>
 <CACRpkda0+iy8H0YmyowSDn8RbYgnVbC1k+o5F67inXg4Qb934Q@mail.gmail.com>
 <CAK8P3a0uuJ_z8wmNmQTW_qPNqzz7XoxZdHgqbzmK+ydtjraeHg@mail.gmail.com>
 <CACRpkdb5ow4hD3td6agCuKWvuxptm5AV4rsCrcxNStNdXnBzrA@mail.gmail.com>
 <87f2ff4c-3426-201c-df86-2d06d3587a20@csgroup.eu> <CACRpkdYizQhiJXzXNHg7TXUVHzhkwXHFN5+e58kH4udGm1ziEA@mail.gmail.com>
 <f76dbc49-526f-6dc7-2ef1-558baea5848b@csgroup.eu> <CACRpkdZpwdP+1VitohznqRfhFGcLT2f+sQnmsRWwMBB3bobwAw@mail.gmail.com>
 <515364a9-33a1-fafa-fdce-dc7dbd5bb7fb@csgroup.eu>
In-Reply-To: <515364a9-33a1-fafa-fdce-dc7dbd5bb7fb@csgroup.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Aug 2022 13:35:57 +0200
Message-ID: <CACRpkdaTSRSGx=SjXJ93tdMEPFD=hb3wbUscGO2Exf709SL5Ow@mail.gmail.com>
Subject: Re: [PATCH] gpio: Allow user to customise maximum number of GPIOs
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 28, 2022 at 11:06 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> And I guess there might be other drivers like that (I found that one
> because of its comment mentionning ARCH_NR_GPIOS.

Yes there are a bunch of GPIO controllers with fixed base.

These only exist because there is boardfile code that uses
these fixed GPIO numbers.

> Another solution could be to leave first GPIOs for static allocation,
> and allocate dynamic ones from 256 or from 512 ?
>
> Maybe in two steps:
> - First step: Allocate dynamic from 256 upwards and add a pr_warn() for
> all static allocations.

OK that is reasonable.

I thought that maybe we could assume the fixed bases to probe first
and thus reserve the GPIO bases they want before we get to the
dynamically allocated drivers.

This could be a good first step.

> - Second step later: Allocate dynamic from 0 and forbid static allocation.

What needs to happen for doing that 100% safe is to get rid of all
board files, mostly in arch/arm/mach* but also elsewhere, or to
augment all boardfiles to use descriptor tables instead.

But you're right, try the two step approach first.

Yours,
Linus Walleij
