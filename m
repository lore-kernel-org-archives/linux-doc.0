Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 89A6C7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Nov 2018 14:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbeK0BHC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Nov 2018 20:07:02 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45486 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbeK0BHC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Nov 2018 20:07:02 -0500
Received: by mail-ed1-f65.google.com with SMTP id d39so15915853edb.12
        for <linux-doc@vger.kernel.org>; Mon, 26 Nov 2018 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qq/PbGp799w3uYXWNREd+3JhKli+YCIiF7KMrs04i/4=;
        b=LlFnBbHrJ3bA8Wsi7gKJSePi2TaWlvcihiZJJdJx5zMtlIsUXRA59CTLLV5clkNLL0
         J3g6OgIYeHpeEiy5VKI8SknzeQraTz4P2hZrk9ajbYNSQEUmtlu4Fg/PQQO1ycQpcCDl
         nHE9r410+IP9Tb7xxzjI57sBobmz2YdTTp7CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Qq/PbGp799w3uYXWNREd+3JhKli+YCIiF7KMrs04i/4=;
        b=OzkgUQkLGv76habcF7Lt76fqaEqclB0F9IqPU4ytQKb2vA/Bs5YFCEzYacuUCTVl2x
         T89TNlcA8jj6i7Z3BG7vskwBrybAhp2yiEwryNDPBWyvxRDqga0Rr5HMxF6svrQEAAJe
         CI/+7SHFnzSEGjCjDMEUrdzmNx5TARySWORKJgY/L7DCqB4/dslUxsqjqkRy/GJnZlp3
         e+pTiBB48Y8DGIt5UoVUlK55r4Z9wnrIKTZkvuxD9Da3QMRneuSgwTuq/LUnnysJoi5S
         1KFE3MEWLDPqggzmaQPQyECbhvlFHgcnuDcnnkCbAKu7ViGJRwpgA/dmui65cMtB/Ah5
         tT+g==
X-Gm-Message-State: AA+aEWbRj1lcClF1p8TSaIVnV+V2+6hKy6I8DqQnDtV81vsoor+8pW2P
        ToN8FsoEAHXeXwakoYM7zDyv6Q==
X-Google-Smtp-Source: AFSGD/U/Jc/8jyRSCDI7TrwJf3w2Vo/hXk7vWhjLCq10FAlslLdKVtfIeVKdSQDJqXMaa9r+Gvua4Q==
X-Received: by 2002:a50:f489:: with SMTP id s9mr23103319edm.101.1543241565482;
        Mon, 26 Nov 2018 06:12:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id k13-v6sm116687ejk.50.2018.11.26.06.12.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Nov 2018 06:12:44 -0800 (PST)
Date:   Mon, 26 Nov 2018 15:12:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     greenfoo@gluegarage.com,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>, sean@poorly.run,
        Dave Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>, abrodkin@synopsys.com,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, michal.lkml@markovi.net,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        cocci@systeme.lip6.fr
Subject: Re: [PATCH 0/9] drm: remove deprecated functions
Message-ID: <20181126141241.GM4266@phenom.ffwll.local>
Mail-Followup-To: Linus Walleij <linus.walleij@linaro.org>,
        greenfoo@gluegarage.com,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>, sean@poorly.run,
        Dave Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
        abrodkin@synopsys.com,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, michal.lkml@markovi.net,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        cocci@systeme.lip6.fr
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com>
 <20181121094233.GN4266@phenom.ffwll.local>
 <CACRpkdaXUFwSiQnMqv2WBXr2ytn7kx3CeAuamkj9ZYU1C6bpnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaXUFwSiQnMqv2WBXr2ytn7kx3CeAuamkj9ZYU1C6bpnw@mail.gmail.com>
X-Operating-System: Linux phenom 4.18.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 24, 2018 at 10:17:13PM +0100, Linus Walleij wrote:
> On Wed, Nov 21, 2018 at 10:42 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Nov 15, 2018 at 11:38:35PM +0100, Linus Walleij wrote:
> > > On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos <greenfoo@gluegarage.com> wrote:
> > >
> > > > One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> > > > "switch from reference/unreference to get/put". That's what this patch series is
> > > > about.
> > >
> > > The series:
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Since your reviewed it all, and there's a pile of acks for the driver
> > parts too: Want to go ahead and apply it too?
> 
> OK I did... the git was quirky, patches changes around
> under my feet and dim started to complain about problems
> with commits that weren't even mine.
> 
> It was especially scary.
> 
> But I think I managed to apply the patches and push the
> branch now.

Except when you're racing with someone else you should only see conflicts
with stuff you've just pushed. Or if someone forgot to fix up their mess.
What was the conflict? Looking at the git-rerere log I'm not exactly sure
what happened ... Looks like only one of the patches didn't apply cleanly
anymore because it was somewhat outdated. Otherwise nothing from you.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
