Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 71DE17D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbeKYHgy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:36:54 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44309 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbeKYHgy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:36:54 -0500
Received: by mail-lf1-f65.google.com with SMTP id z13so10838007lfe.11
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7Xyf6jPNPlCKW7o1JJYDMnX2t/q5N0SRjNYl9BRhgk=;
        b=BQnkdG+tOgUg4o4O2XIKE21cFdeahwnECO2fU4UgAXjGpJDeTl5Uo+n5tXoBQ2S+s+
         IEDkZU4GVUjELhpdaw2SylBLKsfGR9CGg9DOE0IteCBrQkaoR9iGhn3f9iWFF1+fb1dy
         SGVEfaAgNGGqoWqxJGEezdUs7zGeMSBiFzn74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7Xyf6jPNPlCKW7o1JJYDMnX2t/q5N0SRjNYl9BRhgk=;
        b=qwVop+C55q6zZ6qw/t1fCG42BZclHvJOSQExIeSP6m7M3+FLGyzHYIdIwBSp0gyhbp
         L8kh9PNs+ThdPPHnmkJp8v1CIoLTEb2Kuyvpohmg+3lYirdkLQRUsqF6AtW5esyffeup
         ALiZTA6MuSS5LDwaD/pbdafM3+UeH9GveP3AS46d92jXoWLpfg6w6vAfEP2g1x20k47S
         kuq843jufymTOk40ZirVUVS12B855AVKItzrIYvPM4L+6FN+QPlCW1ujlxiGalHmUIW6
         SA9SAn3MEGPsQIN56T6kq9mBvp+SEpo+WCNr+DZVv/ZFRAmyzbjOT5RY9VEexrTqP4f7
         R63w==
X-Gm-Message-State: AGRZ1gLhBkCYkpbpwc0fVe3WDiot3TWcsVhjISKxMxjeagTLmZ2TIgFG
        I+4uSwDUT7htXoK+gx3ojSlYA/YdCJ03Yq75roggdA==
X-Google-Smtp-Source: AJdET5ePiTDsn0dkzMlSv4QNCrfx/lx05ubDKflpLy8SyYC5zhCEcIBigU/vfO5c8kx531y6qhanEz0XahVRmymPh2Y=
X-Received: by 2002:a19:5154:: with SMTP id f81mr13108290lfb.96.1543092457002;
 Sat, 24 Nov 2018 12:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-6-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-6-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:47:25 +0100
Message-ID: <CACRpkdbUK-Xx4XfLPAzJdH_R_JADFDxKkvQLiYeZyd6sJ02Pzw@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm: replace "drm_connector_unreference" with "drm_connector_put"
To:     greenfoo@gluegarage.com
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>, sean@poorly.run,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos <greenfoo@gluegarage.com> wrote:

> This patch unifies the naming of DRM functions for reference counting as
> requested on Documentation/gpu/todo.rst
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

Patch applied.

Yours,
Linus Walleij
