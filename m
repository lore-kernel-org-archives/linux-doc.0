Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55322C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 22:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351028AbiDSWtl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 18:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350306AbiDSWtk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 18:49:40 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA512FFF9
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 15:46:55 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id j2so33808607ybu.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 15:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NQ0ZlCBfLIaeShdjzTYSygfV13RjcJgPJ7CXYizgpCQ=;
        b=FGFYWIZ04CCV8ztbKRGzvwRYgJdM2X2X/exeme+rEEMfoSrr1bgTHMT/epk6OoQuhi
         N64zTZGkr1hifKRi+OMxWckHFciH8cOrJ4lA/wCJI9gJWRTf+f4MrSTFsahKs8UJOMNs
         YVLV7+ZDfxey96RUtIHpK9Z4ftJ3BMmXaHO05XB3IDFjSyPWT24hT28JWF8esuCt4Nx3
         r/ph0t0/qk9GGbRS8p8lVQ3XZmV+vBP5nfgI7vpW1ADF19RV7zgDj1IWwH0zmByEq3qH
         fOkBlvUixw3c1hyGdvMgMt9Kogqq/qpShsSDIfVjVOUYPZP/227XbI6nmg5VpixY9tdY
         acww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NQ0ZlCBfLIaeShdjzTYSygfV13RjcJgPJ7CXYizgpCQ=;
        b=iOP6SjJ3aMU8vERjDDmrj533ZMCYTFKC/7tgre4Lv38wQ7oBtDEssLnmbd+ryYkX7N
         NQ2cNc6TXeAZowrfFbbgtyV+dlniT0QLeIla24LsDJ/I5ZGjclEDojjTKQmGCoKi0o8p
         0kNBebB2F2uqBP/yuuNcVYoGLW4x+vGtWMNbxUaWBXRJMX3ZlALMN9hDnEZZqjwM1tkl
         KUO7QH6ImHNhezc/Ggc5+jV142Kyu2+KeQWs1QelZ/bjo0Ftz8QghZ7GlPhbXO9os1DR
         EUTlgY7jbtoD6ztln8MbJVG69f6wcwsdDMHOuPSTt/laeyVW25SDRtOTsILNbjFD1H+N
         DuiQ==
X-Gm-Message-State: AOAM532voe7fzORjOoi4CeHLJnaQdjkuYbRbleFSPXVO3nI3XE4LGpi6
        2wEktI1taI4vd2lwL+0G1N3y1ffGvXolA2bl1TTvtw==
X-Google-Smtp-Source: ABdhPJzL1ZMzGRF0eQBZ7PUfu61f5JoJrxbPpEb6s7UVIgvJVwImWmYItXwnN0X+wwcRlvyNP0KhXn4m3KRIcON6pnU=
X-Received: by 2002:a25:cf4c:0:b0:641:15d2:54a3 with SMTP id
 f73-20020a25cf4c000000b0064115d254a3mr16840709ybg.626.1650408414361; Tue, 19
 Apr 2022 15:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220329054521.14420-1-dipenp@nvidia.com>
In-Reply-To: <20220329054521.14420-1-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:46:43 +0200
Message-ID: <CACRpkdbGyrRU9DDTmNDpU52rECAKY3wfi2y3jo9FMypDG=pmJQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] Intro to Hardware timestamping engine
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        smangipudi@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, warthog618@gmail.com,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 29, 2022 at 7:45 AM Dipen Patel <dipenp@nvidia.com> wrote:

> This patch series introduces new subsystem called hardware timestamping
> engine (HTE). It offers functionality such as timestamping through hardware
> means in realtime. The HTE subsystem centralizes HTE provider and consumers
> where providers can register themselves and the consumers can request
> interested entity which could be lines, GPIO, signals or buses. The
> HTE subsystem provides timestamp in nano seconds, having said that the provider
> need to convert the timestamp if its not in that unit. There was upstream
> discussion about the HTE at
> https://lore.kernel.org/lkml/4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com/

I like this.

Can you put it in a public git and make it eligible for Stephen Rothwell to
pull into linux-next and ask him to do so, as we intend to merge this for
v5.19?

Yours,
Linus Walleij
