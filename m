Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5811C4361B
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 08:50:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83626229C5
	for <linux-doc@archiver.kernel.org>; Fri,  4 Dec 2020 08:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgLDIuS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Dec 2020 03:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbgLDIuR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Dec 2020 03:50:17 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8A3C061A53
        for <linux-doc@vger.kernel.org>; Fri,  4 Dec 2020 00:49:37 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id 142so5666700ljj.10
        for <linux-doc@vger.kernel.org>; Fri, 04 Dec 2020 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+M8zrbq6b1p8wlcXRVRPmBvCI2nb4z2DmdAj80G4yJY=;
        b=WdmUpBTMYIcMJSRVU1JOBuE7mf8hr8esrydhOy1Gzs7dnJja0RYck18VDWqZXWf4IQ
         6/QMs6QEHr70cEserUggAYNtEGvQSuz7OlFWn/h+jeLt9hg8tvwTCy7Osa+eu2fOHPAD
         nzPdWZnUKff8WxA5zaUASm031d28dSHlU4KRf5mwuoJBCd709azWoydVuKvsTGFryQHC
         /9GivUVguITQIGsbnrX5uXJvMnCR+MeMUZllGz/xa2dCFKBDqgznuz107Mn/3gr1aSXp
         whVJs3HWyQN8GuSCMzWvm/5kkpB0wppQ3FrBCY4mZACUP2ocEj0MaCJ8bTqvux+gzOOG
         D6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+M8zrbq6b1p8wlcXRVRPmBvCI2nb4z2DmdAj80G4yJY=;
        b=OarrYVxVp36ykMyEpeq3B0xVAzsrBLXtjWibnNsO37p+oyYxt79uJKlo6lq67bhRf8
         g5IrnhArsg0MWppP1KgikQoRUXOv8LY/GPnIUXSRem+L3WevZ7e6qJRhoR4g4pjwaGPZ
         UqBLvEQvaJa1ESpEFEhSIrlLZf8g2Xz/T4Z6z6a1bWrdpEAcV7f2+lyd0A3gG+glpvqe
         /niPB+oGXEXxJY0IgHIUKhkeCsSPyJ28ZdJwGoG0XtdmuZbHDxV9PemmLteAiIbDnkeI
         5hoQWsjpXZGcoXTZtMbL5MfN6ouQtZG1ZBheaYPU4VBFkrG5R5PHG1/bZ+YwN4NOr7hJ
         pAfg==
X-Gm-Message-State: AOAM531hRbuWe4WX2y8o5kiKUaPiNyD5v8Dg7LWpmZHwm6AmEOM7t4A3
        QfZ72lznbno5agOtTYW4WdunRDLHcPMlc/teAaWH5w==
X-Google-Smtp-Source: ABdhPJxqn4nKKGnNWQ8ZGC/Q2XERh1TtexNG5hJfal8ZUnxdUO5LOaSCB57gt9jbaaXkbFoYOCBibJQ5/e5byYO5UGE=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr2861001ljb.286.1607071775878;
 Fri, 04 Dec 2020 00:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20201122092548.61979-1-gnurou@gmail.com>
In-Reply-To: <20201122092548.61979-1-gnurou@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 09:49:25 +0100
Message-ID: <CACRpkdZzBxJMJknDL+bt8bGBSBCOO4mT3cbU+RDWL2W5Fpp5Zw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: fix typo and unclear legacy API section
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Nov 22, 2020 at 10:26 AM Alexandre Courbot <gnurou@gmail.com> wrote:

> The "Interacting With the Legacy GPIO Subsystem" of the documentation
> was unclear at best, and even included a sentence that seems to say the
> opposite of what it should say about the lifetime of the return value of
> the conversion functions.
>
> Try to clarify things a bit and hopefully make that section more
> readable.
>
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>

Patch applied!

Thanks for fixing this up and thanks to Andy for coordinating with
the fine folks over at StackOverflow. I added the BugLink and
Andy's Reported-by.

Yours,
Linus Walleij
