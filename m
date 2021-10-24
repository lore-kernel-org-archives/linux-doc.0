Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27939C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 21:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0FF46103D
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 21:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhJXVzK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Oct 2021 17:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbhJXVzK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Oct 2021 17:55:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF92AC061764
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:52:48 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u21so9106357lff.8
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGcra+weT29QDbFJeb2GMMbHD8nmk+xPQ61A0yy6Buc=;
        b=dMt46fk0KsnsI0CL0WhgAHfyeXWOZLkYgJY4TWFsOkppIh9ixzYsug0YmFh1+mZ5uD
         2S/IX26auyMNJ2J4I61Qz49lJ7ev2g2pX2Jv7RTMY+UYnPDlb7EgM1MyLNpH4w7ELnpu
         CaaS1MDj+LGhlmYFsS+4OAtY2usrMKPk0NxzFi9weCEIflMv4+9yTMrP6Xd9CUuOEIIW
         rauPF+x0++gDri9Q17072GyGQMllFV6r7YFdhj0WTe8b5iAEpALlg06JDEVHJSEWTCZq
         mEHqNkY0nPvyKdQfLVS62BRSpQ1HG12eH2NY0XMwXORghJ70h2Sz+u2KLYVZkdW8MYF+
         nQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGcra+weT29QDbFJeb2GMMbHD8nmk+xPQ61A0yy6Buc=;
        b=auxNDX6JcqkvmFLLWX7fDiEgyy4ddx8pedIykX0VEp5WBb/xkpxCaTofKw90I+XI1F
         v4XuCqRG+RgG4C7ThGAFLZeLyhLJZYqdZWpcT/e+d1ggD+YBIbHFlUWYrzkVdqQGjK1g
         Z5MHvhz+zxEEL/5aacyTOBg3iQFmXrQYcyC7r96JW2R1ENfu07yuuUCyGRiRFkRQaC4l
         kgiRggmiRU6LSvO+FmKF2DeN9kzgwM+ymdx0UAUQlz4I+kKK5SG9/NtwarUUc3BtYsQ9
         jPWlBV+LNMClKLwrf7KjMd7yoWgm3y/8q7/xbrD18umOhYnZBvnCCFUIZKKbGVOqJDz/
         jdhA==
X-Gm-Message-State: AOAM531je88zhWrYjz+NrKIXGD/jxPDrjuCdq7KgN5H8VuQHWfajOmQD
        fYnUMpwxXhG7gie9HunWk4LXt1O3duZTZoRwdDCQMA==
X-Google-Smtp-Source: ABdhPJybqQLtZteLK7c8/tTsew45j5rTVereodZKTUXVUDOygRZQikTgXlzcmo8V7PjXRTUExcmpWK+je8WLfhyAfZ8=
X-Received: by 2002:a19:c10d:: with SMTP id r13mr13257054lff.339.1635112367259;
 Sun, 24 Oct 2021 14:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org> <70a3d6696de52a3d6112adbf7247a4b4ae9c7e11.1634630486.git.mchehab+huawei@kernel.org>
In-Reply-To: <70a3d6696de52a3d6112adbf7247a4b4ae9c7e11.1634630486.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:52:35 +0200
Message-ID: <CACRpkdb84V3hk4goi_Z8hVpF863TpqtCt+XY135nk+D3PW+PGQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] MAINTAINERS: update intel,ixp46x-rng.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 10:04 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> The file name: Documentation/devicetree/bindings/display/intel,ixp46x-rng.yaml
> should be, instead: Documentation/devicetree/bindings/rng/intel,ixp46x-rng.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: cca061b04c0d ("hw_random: ixp4xx: Add DT bindings")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It'd be great if Rob or you can apply this patch, I have sent my ixp4xx
patches upstream already.

Yours,
Linus Walleij
