Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F632C43460
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 14:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D37961130
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 14:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhDHODk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 10:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhDHODj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 10:03:39 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081E9C061760
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 07:03:26 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u10so2403446lju.7
        for <linux-doc@vger.kernel.org>; Thu, 08 Apr 2021 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EuaDV5PFzJtGwP30IwdE97tcENsaGWJZ27LkFoNdlRE=;
        b=iDwn8tUVD9hBlSLhZZ0w4Bnih9Vx+R/uMXMbfYvvfK/BE8dJSRvxkKkQbttlBRuWy8
         UkmYVW8ZjgP7eao4YvSaUP0ny3Ocp65OkcLk1qwx5C8flM3nfBRn81rV5R5ONN1HFv+p
         B1N6lB4KaPu6NKVvOUxuZ9xyPjXGmXlA9tNCN5ElfqECGpu6/1tXwp95Txg/lrjyUiok
         LFcEwLk1PH9/2Z/rdQiwOx4Hm2Ddgey0xDXKF2fhwU/YzXOpjpXSghE7luLvsfc+DT9M
         EeoVqWgLS4E73OLAU177MBBZ3iWggzNmcAKOsgzl+6TdCEKjhAUekOwcJiFxWqdVB/0O
         hU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EuaDV5PFzJtGwP30IwdE97tcENsaGWJZ27LkFoNdlRE=;
        b=IG7S9wIy/EQnzf8rjvW94DdgMaUz+9MgdemOTbISQi+Vq3Xki7C8RuzALnVjS/tYGj
         Sb7ds3pUX6EMiSYo19QJqmFrDO9PcCitFb3iOVJYjCCoi8CMLJ9ub9vQPWLaJU+dyabX
         53e/Kr5L/nrMRtP250u1isOVjxaxf8uARyOVkmZZ0dkP7P4N718rnDYiIv7Oahy3KySO
         jGUAcsgk3sghRhlt12JAAPaKBSY88fdSQPCsr/1O3iDN3EGxgur0Xq/9Gi5tttJiz8Ge
         Dwmimhf1Q2MFtPFJiGkeHoF2lTDCX7zWsoczBh8gq/FCqlnlO5GoKZCMLwUeZ0EL2oJa
         Ncfg==
X-Gm-Message-State: AOAM532WC9rausRC1uApQcDbsBLpttNBzTko2/GNiD88b6NjgrkKCrjp
        22TWIHmCPAYYUl7JU/cdIFV4rkvOuNOPASeqSvMK1A==
X-Google-Smtp-Source: ABdhPJzaHapit3W4Z0PRJSrkxM0lTe9VKjj4klFARLjv+msdrPSeZ8yCS0Jwc7SQYxAM8UFn5ifpK906CRiek58aRtU=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr5792845ljj.438.1617890602657;
 Thu, 08 Apr 2021 07:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210328164222.720525-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210328164222.720525-1-niklas.soderlund+renesas@ragnatech.se>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 16:03:11 +0200
Message-ID: <CACRpkdZ_COOJcJtg8G5-GfTcBCX97qMnQukYzRYVkCK8von7UQ@mail.gmail.com>
Subject: Re: [PATCH] docs: pin-control: Fix error path for control state example
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 28, 2021 at 6:42 PM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:

> The error is constructed using the wrong variable.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Patch applied!

Yours,
Linus Walleij
