Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8602EC4338F
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 12:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E222600D1
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 12:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbhGZLcz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jul 2021 07:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbhGZLcy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jul 2021 07:32:54 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5EDC061760
        for <linux-doc@vger.kernel.org>; Mon, 26 Jul 2021 05:13:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d17so15139278lfv.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jul 2021 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LkVsind2FREvYoiAIwU/wtHv+3lFoPKWq+BzKSJr8LM=;
        b=sro0m7e7O0QHcEGBHPoUHSiPK41MX8FCGe42yubSaZutVwV05uUU4jSXoEV55MISvB
         CCgv5lbLdUtGzR1oXR+AbHgCcuL3tLuQhE052bQX2mXHpQOCcom5E+Kwa39TZj3W7opr
         eZrD9IhY+sj9z6gVOo8HQVhu44MrE8+CfRHa1BPnpD//hqEnXZzZ7ijaVBdf9we9T/cv
         uv2nw7ZJa/RpoXNAAW1fgXW0FXfQGXdGrIPKtq3vh+ZSz24DpDsfe3VbfeY1F/ATMt9h
         gepBXw82Cb73Vefz9LB/xm58gRUXzlSpv2qSWGo+qYcEjt2VpAAMuK1DsjIr7fuPVrPo
         7obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LkVsind2FREvYoiAIwU/wtHv+3lFoPKWq+BzKSJr8LM=;
        b=e5UZ91KcpHDea4ANoOocLOwFWAXPd7d68yji8ILH4KJ7CinEGON7YqsrxtNrJievw4
         F4viaVb2L1PZPgT0+RUvsWE4wTU6Nw6T+Rer0uawkIuRczZt9JOnJxcN7P6QDTooXrBP
         5LvpC6zKUagOZnR7kcVNt6TLcTGgweIb8USwncVCOoidkNqxGmDlAgjwnZ4LA2Th1beg
         mTv9JpQjxPvm/McDpNgytdTuWy7wykEN913vUZNRTzctFDuzvsTA8hrdSUrtQr/n+wnl
         Bc5oUupMvOYcI1NLpy9BP/Be7HwJx+TmL+ndQpXOns5PtRnUiFekz+kWRWf5wyd+4skK
         496Q==
X-Gm-Message-State: AOAM53161BUP0uUErMKHgWKb8SwEqtVZS4ifnFeAmnYExYFUl1tC/tgj
        ucGtr03pHPx1942rBXK1hxwWuPBZnDAOgbHDQTScIg==
X-Google-Smtp-Source: ABdhPJwXUrroVJGsC9LvoDXNLwilRg5E2/8m3lfMHzr5wT501AjmY7tK7VUV10q1fcPPN/BHmtIe4GrhWpAhLZjWyvY=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr2615881lfu.291.1627301601894;
 Mon, 26 Jul 2021 05:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626947923.git.mchehab+huawei@kernel.org> <7dbff9673e8703cd60e78f8b2110349d86d60a87.1626947923.git.mchehab+huawei@kernel.org>
In-Reply-To: <7dbff9673e8703cd60e78f8b2110349d86d60a87.1626947923.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jul 2021 14:13:10 +0200
Message-ID: <CACRpkdZK0dLie_mv=B1P0i-965u2S-EnmVQ-BxhXUkzozqFbUg@mail.gmail.com>
Subject: Re: [PATCH 05/15] MAINTAINERS: update arm,vic.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 22, 2021 at 12:00 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
> renamed: Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
> to: Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
