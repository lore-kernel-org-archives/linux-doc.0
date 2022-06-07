Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE96CCA483
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 01:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242567AbiFHBCt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jun 2022 21:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1840059AbiFHAEV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 20:04:21 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5981A8E13
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 15:42:14 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-30c2f288f13so191211287b3.7
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y+9mkaC5FXCdiilP0sDFa95pXGDowopI6qZcmfpOFwY=;
        b=THGdgTWpz2L5yBciJ+3Rp6qRkwa3YV8CzDaERGa1QNRKVT/VWtYXuaZ/4qrV3XRG2e
         BVFuV4GtFjklye2XPemT4GhsO9WNT3UtZOgV/U3GrscQINoitVv6tdr3qP0lDaedcFkF
         1XuXJIyca7cvFEiDuKDSpJGA0QblfBT/DaMngv4vQxtESApf00rw13BQBJQSNcukywRF
         uxy8nJ5UwX7wk/VwYQi80pvbOvkWFhXnl0OXANctXKeqYSGap9JRubfD4NxcIGzkuf1T
         +PgqYeVTs2wSCe7WMwG+684FgQc0Cc3hQYmDzPDQ3+sCrGim9mKX+TmzimLYU1mF+Caj
         mKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+9mkaC5FXCdiilP0sDFa95pXGDowopI6qZcmfpOFwY=;
        b=tEcd3kcMfnVf0GGanreaWzagWm3EPPw4vP7jXKHPCVrrT5q3JQdLSHndjZ+t34ZE4I
         WDHgpqBBoS+l3diK4zb4aFHdc55e4axqEMOSuWQticqFOyOTZuGCQpks6Vhc4vG192ff
         idYn13CrMrcu2i0PyB9xrwOsshGcDnZc5eJsnnWY2XTzP1q4g4ukXOuxngXaI9Sj6Nml
         75ALg7WZLHc4e213namK/ivrLm+TbhY4+S/CUiu+ZGWCKA870T/+JNSfQH6ZhTeT/a1t
         KPlup2P+qj0kVzdaBaawS4JC34P0iKcnTqOF4++8seFpLHDg9kMUL6hYDkY2FZJu8XFP
         9J7Q==
X-Gm-Message-State: AOAM531QzCdUzpgl9WENZs/pb8L1NJH9A/2Wevs1YTcMz05d7b5Vj8Np
        70DC8/fbbcNi+qe3pYnRDVWmZ4wRpJFEADmZs7LYeg==
X-Google-Smtp-Source: ABdhPJzl1Nbb7E5Gb8nax2J8oOG9hgoViYBNrjUIWKyk/TT1bG7pSkuwyr5KQvYdLoD6HBAKGfxEyFAcUZqCfHuqjpg=
X-Received: by 2002:a0d:ca44:0:b0:30f:a4fd:2ae7 with SMTP id
 m65-20020a0dca44000000b0030fa4fd2ae7mr35214191ywd.151.1654641733433; Tue, 07
 Jun 2022 15:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654529011.git.mchehab@kernel.org> <d27b5d508fb757147b720bf573ce5a2e3fc5920e.1654529011.git.mchehab@kernel.org>
In-Reply-To: <d27b5d508fb757147b720bf573ce5a2e3fc5920e.1654529011.git.mchehab@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jun 2022 00:42:02 +0200
Message-ID: <CACRpkdYas3jHvigeHPGBVHuEtqvQvAKvnuKwBMXPOgdUV6d7DA@mail.gmail.com>
Subject: Re: [PATCH 17/23] MAINTAINERS: update cortina,gemini-ethernet.yaml reference
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 6, 2022 at 5:25 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:

> Changeset 208b65f7b5cc ("dt-bindings: net: convert net/cortina,gemini-ethernet to yaml")
> renamed: Documentation/devicetree/bindings/net/cortina,gemini-ethernet.txt
> to: Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 208b65f7b5cc ("dt-bindings: net: convert net/cortina,gemini-ethernet to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
