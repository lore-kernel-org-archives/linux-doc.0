Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3CCC433C1
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 07:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD642619BD
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 07:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbhCaHrS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 03:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbhCaHqx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 03:46:53 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05E9C06175F
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 00:46:52 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id v107so15203756ybi.9
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2rFGf1esbHz4egss6iFrdkmprUibXom4Lehtgfz/t8=;
        b=wNvvmcd2vLBOYVXCdJKdJUCUXRM8rxSdk/0zIxhgHqPRvEUr6QlOyjw7UZB1wvnPn6
         P+IdPHsA9Ff/oSA1KlyYqMXiJF26Nx9r9LsNIOsD//AzqFnMSBdy02TZGFmHJBfb5scJ
         RQnlHQGPgVVKWBRxFfx8W5H+U+1NxHLjiOJLmISEYK9MdfrSpDgEXKAtWSq4fbuMV+bw
         TWWKP7n8EMLny7LOTCUx8rJ1CmR1x2qi9rXuxKKN5CtkeOjEzcESt52Fx0JCkpKdW9sw
         vjWs2pyIu//5CfRDv7Mvsn0Ze9053TmJZkKpJNK/tNx6n/edUYCQ2VVHMktOi4S959vT
         E0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2rFGf1esbHz4egss6iFrdkmprUibXom4Lehtgfz/t8=;
        b=tSNuZAUUVw394wptKCAYIBPJluuSZbTz305sniMgf2DQ0gIwFaC5qccZTfbMMiejDx
         Nw0ZJPRH6F0OxQq4K4GZZvPNROycfJ1usspsg3T33LnXlEYVpBdJKnFU7CpSbLLaG5zp
         g3kAL4QV4qjTHMlaDy5adSbvKk73IQ3MfoLz/Bz2IX097RDIP9t91ik4K0ZW9HLx09a6
         GSrhddgQ+oc/9ASBWnfJAEGGCiFMYO4ZvAws1Wa3pK2p/cX06m39B7aqYSYEa3P6fFCZ
         1FoCnJoX+TwEhi4TtCAyR5uZ9+hZMT9/74K2kuNwCKZ1u0Yq8fWDsBLaVhJBwRTNb9c3
         cPEw==
X-Gm-Message-State: AOAM533C7BW7OOu6NaopbCkEFXZXTa87tN1ewU2z8AG8Q44e4O9u+Gcj
        63+y3HH1Kq53E9ksUVr+Su7lS3gdb/nPevDoqCujyw==
X-Google-Smtp-Source: ABdhPJw8yT4SWhZQRGy/dMTE9DhMO6jmXXDpakMeL7dKWa4vIbjLEbTQCiEFgCzu57F+7Df9ui52v2KrxaBgx6/A80c=
X-Received: by 2002:a25:d2d3:: with SMTP id j202mr2870845ybg.157.1617176812042;
 Wed, 31 Mar 2021 00:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210329111648.7969-1-ada@thorsis.com> <20210329111648.7969-4-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-4-ada@thorsis.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 09:46:41 +0200
Message-ID: <CAMpxmJV06cvy=T-TQV2088ucsJrC0YEAZ1HFxkpU18vvpKqr_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs: kernel-parameters: Add gpio_mockup_named_lines
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 29, 2021 at 1:17 PM Alexander Dahl <ada@thorsis.com> wrote:
>
> Missing since introduced in the driver.
>
> Fixes: commit 8a68ea00a62e ("gpio: mockup: implement naming the lines")
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---

Applied, thanks!

Bartosz
