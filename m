Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E9FA7D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Nov 2018 08:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393273AbeKVTe0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Nov 2018 14:34:26 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41277 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731963AbeKVTe0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Nov 2018 14:34:26 -0500
Received: by mail-ed1-f66.google.com with SMTP id z28so7034270edi.8
        for <linux-doc@vger.kernel.org>; Thu, 22 Nov 2018 00:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=bXnYE1APjd1iQLoGDe6cvTAiLMQqWdlXEVV06KVqXvc=;
        b=iZpcjNUBjqVfz6kaD3joNZ2rKJDojWZrnYrXpGEMuagkdqSqD8v45SNugOu74xNRE/
         +ZaN+cZLIcZQv3/PDVkAxp3sG40PnleJ0yjCvDccFHJRh5WhVcZ2b2ww1BskbOxkxl2P
         UR02Z5519nozqIHarR42SRQcNa+d25yThpAN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=bXnYE1APjd1iQLoGDe6cvTAiLMQqWdlXEVV06KVqXvc=;
        b=ITTjQeAZZebTGKEiXALd7NbW8gaOM1ywvgoFaqVP+P8ptabPl7ixlWiGlp6ee/9Zg+
         ZApf0DurLooEWprDRJgKvx2F2v6VJSec+vfhRErKABJutw1RHXGd63+1eoFtErZxfWoM
         fCSNl8xJI+GPsEzpI5yFP9sSZskx6E+yYsfbFeYhott4KrNRWSI6CNiIgLlR24N9fGsQ
         HCO8r/d7JFYztWuIClsb5r8s7XgeUjFs3txyeXoxc82fGksdlRMXs0fnjPpNSGtMSmBY
         6j/oQXlmsxhyj2Hda06mXotLwPnPUI6JY/bxhvp9UcxnmEpmGJNxzze9XgXHQAvpyFxq
         gYdQ==
X-Gm-Message-State: AA+aEWYYfv4aQlUM4/nUYDdSwCtMbXA2KKG2HmVP1ZJ4ZmlNq+L8vPbw
        dZLX+1D9xtxaIfZ2mjYLa5peDQ==
X-Google-Smtp-Source: AFSGD/V2TAFl8vvyJQ3YvxF+olUzPJBkXlBHYy+tIG7IeQFyOdeas0Rclfy3WwEJA6PmbWMo1LtA2A==
X-Received: by 2002:a50:ce0f:: with SMTP id y15mr7867485edi.207.1542876953045;
        Thu, 22 Nov 2018 00:55:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id c11-v6sm6159456ejm.67.2018.11.22.00.55.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Nov 2018 00:55:51 -0800 (PST)
Date:   Thu, 22 Nov 2018 09:55:49 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        greenfoo@gluegarage.com,
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
        Lucas Stach <l.stach@pengutronix.de>,
        linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, michal.lkml@markovi.net,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        cocci@systeme.lip6.fr
Subject: Re: [PATCH 0/9] drm: remove deprecated functions
Message-ID: <20181122085549.GX4266@phenom.ffwll.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>, greenfoo@gluegarage.com,
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
        Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, michal.lkml@markovi.net,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        cocci@systeme.lip6.fr
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com>
 <20181121094233.GN4266@phenom.ffwll.local>
 <22044302.7aKok9czXB@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22044302.7aKok9czXB@avalon>
X-Operating-System: Linux phenom 4.18.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 21, 2018 at 08:21:29PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wednesday, 21 November 2018 11:42:33 EET Daniel Vetter wrote:
> > On Thu, Nov 15, 2018 at 11:38:35PM +0100, Linus Walleij wrote:
> > > On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos wrote:
> > >> One of the things in the DRM TODO list ("Documentation/gpu/todo.rst")
> > >> was to "switch from reference/unreference to get/put". That's what this
> > >> patch series is about.
> > > 
> > > The series:
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > Since your reviewed it all, and there's a pile of acks for the driver
> > parts too: Want to go ahead and apply it too?
> 
> Please remember to give at least a week to reviewers, especially with LPC last 
> week.

I think for this undisputed cocci series waiting for everyone is not
needed. There's really not much the driver-specific reviewer perspective
would help here.

In general I do agree though, if there's something driver maintainers can
have better insight on.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
