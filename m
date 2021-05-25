Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6983BC47084
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 00:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46F746141C
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 00:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhEYAcF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 May 2021 20:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhEYAcE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 May 2021 20:32:04 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35378C061574
        for <linux-doc@vger.kernel.org>; Mon, 24 May 2021 17:30:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i9so43200256lfe.13
        for <linux-doc@vger.kernel.org>; Mon, 24 May 2021 17:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oLP4oglLNCR+9nXwmE8IhmlcVIVSmG3eaWpMOp4bmk8=;
        b=rP/2hrI1pD+HuYaQkfSjt5L/O90JURl9WFveM0Bp/G+tbVrsVgygnir3hDkS9zFJqX
         XwL1LfEOIOxuB2aKqJEngEBuhsCz6MqBjebju6J+qBFyEqlvdRwR5atOCQXXH3Kkx2N1
         3fY2XXDpsZlfzLr4UMLuyNrxt/cNHjLd0CZdrgN1EMztuULY0zPEj5BwznG9AS3nIfd/
         Jpyu3RspjH4vFW3p5DQ/fhfYDFtsnm5XHL1ibkcu/Rny8E7jbDKOStD/nbSOvBdYKnco
         4wpIIkaIXl924s6i38dplGClI6DKYZSrxnniQcXThYcEDAsgkwfVcoYyxGdrcze3TwKm
         CB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oLP4oglLNCR+9nXwmE8IhmlcVIVSmG3eaWpMOp4bmk8=;
        b=aoUzK2BCdi+DPKEasPa0hpuZNBF+tAiHzSufN0FbE5K0+0MV0PPnNcSYfvrLeReUgL
         G3ZPBMwqiZmRcILPlyXrWO+ArlXAYiWD8VPAMUZM+SxCOm2nsnD4c1CFMaX5MEeQ30Hm
         PxulAF6+nUsSmYlFg/WHSFwPNjZJ6S+W0OaPn5IC0LZaD1bVIRr9MQ3reSqCzZYg7EXb
         S2kjiYq1gfIDtGicDeIa7UOzmO3v0etM8mcU9YHLmuy6RxiEc5G9H6yqYdROmguEDhcV
         y3Q9Bs7JMB4pGJeZnW34x007ES9BaUroLJjsw8zw85+igSkRjPubSbXh6Kjs2VjMs/Bd
         WgOA==
X-Gm-Message-State: AOAM533MRjm0NCshtKx1k1N4QiHAnCA0e9fXHG5XZTEgHQ50VQxdtlx1
        Lk4NggxacA1B7fCVp8lvSRMlTveLd+gcq3ZSsvScFg==
X-Google-Smtp-Source: ABdhPJw1HN3EJMYQmc9N6v18t6ySbunlT/243xY0jxo6mquZnjHFnii7atHe6NxbmrbfQ6HLxJ1mbqJN+Y9YvZPTUTs=
X-Received: by 2002:a05:6512:11ea:: with SMTP id p10mr11731891lfs.157.1621902632596;
 Mon, 24 May 2021 17:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621413933.git.mchehab+huawei@kernel.org> <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
In-Reply-To: <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 02:30:21 +0200
Message-ID: <CACRpkdYU4LQM54rht9quJvfxJ7N4KjJf27+ckNGTdLOW1LF1UQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] docs: update pin-control.rst references
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Drew Fustini <drew@beagleboard.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Saravana Kannan <saravanak@google.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 19, 2021 at 10:51 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
>
> Update the cross-references accordingly.
>
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
I suppose you take it through the doc tree? I can apply it if you prefer.

Yours,
Linus Walleij
