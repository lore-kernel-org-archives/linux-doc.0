Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BD4C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 10 Mar 2021 13:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CA0364FDD
	for <linux-doc@archiver.kernel.org>; Wed, 10 Mar 2021 13:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhCJNnZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Mar 2021 08:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbhCJNnV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Mar 2021 08:43:21 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE31C061760
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 05:43:20 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v2so20504890lft.9
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Gtn7a3SlZcZcLg9Wg50TppuDrba0MjDBKcLLojbDF8=;
        b=USasne00YKM9uYo6kMhDbJsaBjmmOaztCoOaWEXD1YbBoHm2IN9dXF4EjtTfnpTkUJ
         V7PCl4Ts4yJgH86RLK8a/mpIKJxH/iftPoSYF6PEjo2SkfyYcDAjRswirkIIy0uTM6W0
         smrdpREQUHDk5GIP78hjVtcO8kKduphzg1lNoT5fxlsMsm7WyivE0bxGsZaMzOruWnWj
         TWXqN7+hl9UjfcJhXsdh50/Pr6aVzpjU4jU+4HGVyMvjib3vi4YKcybj/t4ycAqlFPUs
         GgbR1nisDhdwjaG3RWg5OSOoAdzz8tpbA2Y6VexFy65vLpFX5YBKWl4VqBE+RZRl5KeJ
         bxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Gtn7a3SlZcZcLg9Wg50TppuDrba0MjDBKcLLojbDF8=;
        b=OJ8bZkHyEcy3Id4lDB/XrlrZwSVjMgPEx1fDnDCypgYX63OE6UKsY6MyrhF+bPYBZq
         RnmyaLo/zddPCGZAFFX6gkg+f27goLAVa7d/XHNRRrvI022FdxYLK9Vg2VqynZ+ZGH0D
         pp2nF6SY/lhpOr6J/EWfqSCXtbFJNORiTfnBZKQvle8P2+Z8Mtino0NW34GQmb6u1NO2
         XtKmfl5yn4MW60Gsfwha0J7ZPqRir477fTBfDiRE1ZcnqpxE1a/1z0IxnQkGbD5eao14
         wh+SsV+BbusRcXtRQ/o3SJX8LFSiyfG3WDQktWmQqEM2aniZPaFKN8GEPQV8hBr0b41L
         M3HA==
X-Gm-Message-State: AOAM533u42bD+ei3+y+4j8KakHnrJ93vkUxQeuSixv4eVWNyXT09w1l2
        Ri1FEUGShXcFfdQe4gYAECuj6Ob2ot1DpQvCWJARNQ==
X-Google-Smtp-Source: ABdhPJxloZHW0uPelXMb0ewD3vJZPiEIEU7042/GrR6h+mFR3JKWf+KHRcSPMGa0gkdaR3uD3cbSzJQsWcIy+WWcrvA=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr2145553lfo.529.1615383799394;
 Wed, 10 Mar 2021 05:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20210302053059.1049035-1-drew@beagleboard.org>
In-Reply-To: <20210302053059.1049035-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Mar 2021 14:43:08 +0100
Message-ID: <CACRpkdbnipjuFU3pTHanhirExWct6OQ2t0T22tne2PHwD7jgUg@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] pinctrl: pinmux: Add pinmux-select debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 2, 2021 at 6:32 AM Drew Fustini <drew@beagleboard.org> wrote:

> This series first converts the debugfs files in the pinctrl subsystem to
> octal permissions and then adds a new debugfs file "pinmux-select".
>
> Group name and function name can be written to "pinmux-select" which
> will cause the pin function for the specified group to be activated on
> the pin controller.
>
> This series also renames documentation from pinctl to pin-control and
> adds documentation for the pinctrl debugfs files.
>
> Notes for PATCH v9:
> - rename pinctl.rst documentation to pin-control.rst per discussion
>   with Linus W.

Excellent, I have applied this v9 version!

Good job!
Linus Walleij
