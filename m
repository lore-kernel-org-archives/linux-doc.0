Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B8D5B7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Apr 2019 11:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbfDELne (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Apr 2019 07:43:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44134 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfDELnd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Apr 2019 07:43:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id y7so7568222wrn.11
        for <linux-doc@vger.kernel.org>; Fri, 05 Apr 2019 04:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gpfxNDWzN/lDwOzvYsaszMMS2bWA067N9o6KMdno+Sg=;
        b=VEtENkkChRlawaWLGL0UktdTMqQvT6OIdAqkP1vVlh5CM+ixrKMGoJIJd3Tai3Vzn2
         ijrv5I/k+JzIyztt3GpNXlhq+XRFdfDNqrF3MnzZn+f1aZhMvRTZDVKQ3HQ9zuCs734W
         4rFzXzw7jM6qc0obHbli+/rDVbeym7gpZNCxiAIboEXeV/gjvkppGczGiLX7prNr5JlD
         mGKlhn2vzzf00B9kKfvzHivnT5yRNMkmbcfdTDPhOkjaF759XUaUArY7A32yXwcQb5Hr
         jub2Qx5YKDUxga4/UfHhMmeV7JRTx/sEm6vGGVP2IfqjHCyKAk0QywbaGT5yd9TNZQgO
         b60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gpfxNDWzN/lDwOzvYsaszMMS2bWA067N9o6KMdno+Sg=;
        b=WU/2s2CbwuRndPoNtFG9NHDfSWTETsAhfw07L3dcbmlnmOJfq01n+tl9vCPFolAuVO
         4wzPxr66H+U4SffLCKrmiMiouPNTYseuxtZSuUxW5EllHO+VJ+kGqOOL1zuU/KE0g4N3
         GS8KIqHFuxskZ9elgSegaNHHuOcZsmTbkmQ7d7zXgPxrjfCr+6CUvAw/KP+IVNQwZGqW
         CfU/FnjxPE74TvA1KDYIeKs6mL6E0bP+LGsNqIeZY7mreaex1B69BnrQAlqJeBYrb1vt
         RgEh581Nl5LFdK+85SNP9/R6lY/KLd0hA829e5LuVNcSFMvDXFS+Kcr7uCSiz2vvNSBJ
         84cA==
X-Gm-Message-State: APjAAAUXcnSMP2wCau1QDGmQCNNg6irni01fel17mEjI5uP42V0XBDZj
        5mjZAUe2+2Z0nMdI3DeI1ZyitZzFzOH2HoYx2/EzSg==
X-Google-Smtp-Source: APXvYqxNhn/S888Oagmx6upP9dvFkew+zCKkT/hl+Jj/FWTLJNOGsjms5kXSveGWQFKaTn6E/NMw4uXDVNDmyzFNjrM=
X-Received: by 2002:adf:e9c1:: with SMTP id l1mr8021048wrn.270.1554464612316;
 Fri, 05 Apr 2019 04:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190403205652.183496-1-sean@poorly.run>
In-Reply-To: <20190403205652.183496-1-sean@poorly.run>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Fri, 5 Apr 2019 13:43:21 +0200
Message-ID: <CAMO6nax7zzzgAzh=F+JTSb6+KxZrOGZAX-t2G8JbyRBubDk6fw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu/meson: Remove link to meson_canvas.c
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Sean,
On Wed, Apr 3, 2019 at 10:56 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> The file was removed in the below patch and is causing this error:
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function Canvas ../drivers/gpu/drm/meson/meson_canvas.c' failed with return code
>
> Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  Documentation/gpu/meson.rst | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
> index 479f6f51a13b..b9e2f9aa3bd8 100644
> --- a/Documentation/gpu/meson.rst
> +++ b/Documentation/gpu/meson.rst
> @@ -42,12 +42,6 @@ Video Encoder
>  .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
>     :doc: Video Encoder
>
> -Video Canvas Management
> -=======================
> -
> -.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
> -   :doc: Canvas
> -
>  Video Clocks
>  ============
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>

Thanks for the patch, I missed that completely!

Maxime
