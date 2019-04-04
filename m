Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 52F4F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Apr 2019 14:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbfDDOb1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Apr 2019 10:31:27 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38952 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbfDDOb1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Apr 2019 10:31:27 -0400
Received: by mail-qk1-f195.google.com with SMTP id c189so1749186qke.6
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2019 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KLVCm6kIAoTWLgTBe6hlSrtymFpM3bNla2XomwKlVlU=;
        b=WgCmtclKttywXWSDCWjPpURto5mfng++8tzwpsM6R2jQNxjcQl6oipQh0kao44k+w/
         7ScqvFw86j9t8MbvdoxgzLJ+99OgVGYbvoKTu8yFp/S0WmnCp6EOORgB/Yq3PldT4F8I
         LeHqx9xzzGvLvZV3jZ8yrcDgfikppSwtx//pm/BxAHgDbnir1EUWuzpZvCOBUNkdRnd/
         bFEqfhAkszjZdeedNOaTlQEZor77kAEJ1ZeRSZzBoloYidCXsQi1kqYKT1SWgNk1ohdD
         ETWKlcdMgFiS+iBHxZdNUSzIK39d8erKOOQ5t+9dvuwoIpZLjLV4DVWH3Rp3+r8H2/wl
         A/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KLVCm6kIAoTWLgTBe6hlSrtymFpM3bNla2XomwKlVlU=;
        b=JWEBr9X2z57DBoHiPWYQEMMXyZoR8LSri1m66iZei07qlzRvGhoEZJ8QfiWCbPrPvn
         jCYx3LV9bY/w+rxYWY5gHtj/GuQD0MTpuvhsW5RLeACGJgPAFpmKrKank1MV3uS6KGeS
         ct+q9B9c41f8rElfxXcw7ItJ/+PaTBTqjvR74NEDbKWH/kUhr8pzRHnQ5SkBxxtCVjBM
         YlDwa21MzNyKfWLNbWzKCjYCCEiQkrC7blIYt1TU8Qw5tBgt5Fou6giKRe7IJzpv337j
         TaDiFjXqTJ6Y+CHqvQ/T+9lYYplzd9eSj379dqTqXKArOpgd3UDjcGnc5FuTzvuDrhD0
         sRiw==
X-Gm-Message-State: APjAAAXimsHimJMN3SMYx1AMGIlrNBgBNLh4ExEUmoQnKNyDWZR6hNqA
        funflpW8wFRw4RayVxuKVPOo2Q==
X-Google-Smtp-Source: APXvYqy8KZuCsaAN8F+ksKVej12iWMV74pdlf9w93Ybh37/pZDk0uq7iR3Ttsin1ASj87N8UJHm0+w==
X-Received: by 2002:a37:b4c:: with SMTP id 73mr5321954qkl.250.1554388286788;
        Thu, 04 Apr 2019 07:31:26 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id p6sm12604667qtk.70.2019.04.04.07.31.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2019 07:31:26 -0700 (PDT)
Date:   Thu, 4 Apr 2019 10:31:25 -0400
From:   Sean Paul <sean@poorly.run>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/gpu/meson: Remove link to meson_canvas.c
Message-ID: <20190404143125.GB17077@art_vandelay>
References: <20190403205652.183496-1-sean@poorly.run>
 <2afc7c09-a6e4-5191-d7e3-7a3a75451aab@baylibre.com>
 <de19dd7b-40dd-408b-a024-53036dedf7c3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de19dd7b-40dd-408b-a024-53036dedf7c3@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 04, 2019 at 10:28:29AM +0200, Neil Armstrong wrote:
> On 04/04/2019 08:56, Neil Armstrong wrote:
> > On 03/04/2019 22:56, Sean Paul wrote:
> >> From: Sean Paul <seanpaul@chromium.org>
> >>
> >> The file was removed in the below patch and is causing this error:
> >> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function Canvas ../drivers/gpu/drm/meson/meson_canvas.c' failed with return code
> >>
> >> Fixes: 2bf6b5b0e374 ("drm/meson: exclusively use the canvas provider module")
> >> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> >> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >> Cc: Kevin Hilman <khilman@baylibre.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: linux-amlogic@lists.infradead.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >> ---
> >>  Documentation/gpu/meson.rst | 6 ------
> >>  1 file changed, 6 deletions(-)
> >>
> >> diff --git a/Documentation/gpu/meson.rst b/Documentation/gpu/meson.rst
> >> index 479f6f51a13b..b9e2f9aa3bd8 100644
> >> --- a/Documentation/gpu/meson.rst
> >> +++ b/Documentation/gpu/meson.rst
> >> @@ -42,12 +42,6 @@ Video Encoder
> >>  .. kernel-doc:: drivers/gpu/drm/meson/meson_venc.c
> >>     :doc: Video Encoder
> >>  
> >> -Video Canvas Management
> >> -=======================
> >> -
> >> -.. kernel-doc:: drivers/gpu/drm/meson/meson_canvas.c
> >> -   :doc: Canvas
> >> -
> >>  Video Clocks
> >>  ============
> >>  
> >>
> > 
> > Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> > 
> 
> Applied to drm-misc-fixes

Hmm, the commit referenced in the Fixes line hasn't landed in -fixes yet, it's
in -next. So the fix has landed before the bug :(

I'll ping mripard on irc and see what he wants to do about this.

Sean

> 
> Neil

-- 
Sean Paul, Software Engineer, Google / Chromium OS
