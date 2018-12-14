Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7BB797D8BA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Dec 2018 14:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbeLNO4y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Dec 2018 09:56:54 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44881 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730266AbeLNO4y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Dec 2018 09:56:54 -0500
Received: by mail-lf1-f68.google.com with SMTP id z13so4440803lfe.11
        for <linux-doc@vger.kernel.org>; Fri, 14 Dec 2018 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f7qHdv4d+TSPqVBsntahUoP51/tk6CvuxKnleedRPlg=;
        b=BxbYWoKwfEgxYks4R5O7lU7FvNf7zt8Zjh3eJWA5t70HuXnsV5mBJEAExAx+zsrVqz
         IOaunLc1jU0V+O2LSs8ekmdfltkRIAgtcbjr8JUu1Bp97t1hF6Eq0OqLP136GvC5Epav
         IKdxBAF2odHcXc7KRymB2BE5i2Ufh/nin1EuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f7qHdv4d+TSPqVBsntahUoP51/tk6CvuxKnleedRPlg=;
        b=LXdB/iQRwiiTZfYwPk70P3I/hObjZTC80WqVAG2pPF18kYSZ8AepQk3Y9vBsWbt4ba
         Ts1Gbg9S6Rz+BEJDzE17jK05v6ibSCxvpKjNoLLzWRxJ225n4uf+M+TAIBPTBcFHDmQG
         z8gGnaf7e60vMC7MKQ4FOQGa1YSRQi1P5/JNtXDV7y6Dxgex019gPFRUQw5s7IrtnFu7
         Ovs528Ej6Qv94gvYtB4M99duBsLDw4DdI/rnctyfY5AxNiktQqjNl3J47BxmemJIzg1G
         DcSb6VAFZHdL/bo7fBMnmCnGYTLeRFoevIbl3dIyD3DzZ4YelSisaEocDiF+dGWXXS2W
         9TsA==
X-Gm-Message-State: AA+aEWYfFOt3NwmMThhwI2pDtAZjoqLpP/llf+x7nGib61dxL6Dyx7fk
        4L85QHzTrfSSitliFwsQl2QLtRBpLnckP7a0vFwrhQ==
X-Google-Smtp-Source: AFSGD/U0kDZwRiK6+GFjOlhZAXTsRddSHE6PgC9Tw7aCth5If+HZHvrVIztNuN74AKxXk1nijt0jg+3rejVKDplpCCQ=
X-Received: by 2002:a19:f813:: with SMTP id a19mr1949724lff.67.1544799411698;
 Fri, 14 Dec 2018 06:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20181212220922.18759-1-paul@crapouillou.net> <20181212220922.18759-16-paul@crapouillou.net>
 <20181213092409.ml4wpnzow2nnszkd@pengutronix.de> <1544709795.18952.1@crapouillou.net>
 <20181213204219.onem3q6dcmakusl2@pengutronix.de> <CACRpkdbABtDgwKai=8Pfji7qVb-XHsX8pDsuDdS5hhg7qEN0Bw@mail.gmail.com>
 <20181214142628.zwi4hadrju53z6f3@pengutronix.de>
In-Reply-To: <20181214142628.zwi4hadrju53z6f3@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Dec 2018 15:56:39 +0100
Message-ID: <CACRpkdYo0RrQTnjQhxG=CRa1AWoRrVjL9naYC_ZCz2_dzAz-Jg@mail.gmail.com>
Subject: Re: [PATCH v8 15/26] pwm: jz4740: Add support for the JZ4725B
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>, paul.burton@mips.com,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Malaterre <malat@debian.org>, ezequiel@collabora.co.uk,
        prasannatsmkumar@gmail.com, linux-pwm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>, od@zcrc.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 14, 2018 at 3:26 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Fri, Dec 14, 2018 at 02:50:20PM +0100, Linus Walleij wrote:

> > So if the PWM case is something similar, then by all means add
> > num-pwms.
>
> .. or "npwms" to use the same nomenclature as the gpio binding?

Either works for me, I don't have a very high need of consistency
but there are others that have so your suggestion seems wise.

Yours,
Linus Walleij
