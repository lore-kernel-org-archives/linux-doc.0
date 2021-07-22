Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CF5C6377D
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E01D961289
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhGVKD6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 06:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhGVKD6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 06:03:58 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD1EC061575
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:44:33 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b16so5510547ljq.9
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hx+tXCeNVlZXtP+zeduOnxQkOT9122ALhOtDZeoZNYo=;
        b=XHNb946JijWn6fWIJz37eBqa+L0/00CGYSz43JufTa+O8q32+cGY5gSPTwYJFTtXAQ
         XxkLY4cCFMjHWGRH0p7iZIwt2hlsh+J2MpVmn729WSl2Qdf4Z13JjoScV5wTL7VSLLGj
         gMOuLQZ5b6bHYDffjl7L1OeAcbPCenUj6AE8qZGqcxzcuyKMxGxdV1QlIEfCUNUU1pYS
         6XP3N+EVo6klcB+Zra4z7NsCRnsNGHH8VI78l4Zoi4buKBArSuJRB9DUzBLiM5MEAisd
         E7G524Q4uyroYLZNtWNOO+NtlbR3IRJikhWHhkuCAvJEyHM7QuCN31g6yqTkvaVWcust
         Va2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hx+tXCeNVlZXtP+zeduOnxQkOT9122ALhOtDZeoZNYo=;
        b=P1b7/jkEISbyhaeJ04EsMcz/dy+Ve/q7QBBeQ/c/KaIn3lz7JR+A3WUPvOxGu/WUC2
         T8YEcB2USDCdYVgKBF4ByBrSdFEQQtMpGDKi13C+X63KMfr7XUmtGN6vLLTvnHlVmRIC
         QKNpEeealQtLrK5GCpRtwmwbafdvbJIA/9tb7LpLa4Tn6HBNNJ/Dy2FWJFLJRrVS9X9l
         aOD4IGWXaw3ho/c8SaIUrindPlcE5QTKH55O7pSX8B9B7nD7WUllu4UdgIlskBSFpUj1
         lX78diFb++SyWVL1NGxTlZoi2SHyCLKEtyyPkmU6U+VkPMvspv9lKhZq05F+S8ypVBaa
         Flcg==
X-Gm-Message-State: AOAM532Ic8e4np2OF5OY0xlzoDNvF6EXaM4YFooXpDFucG7JnBnTPOZS
        pfWL7iCdLkBvHEwVQsNiCeJGm8XTdqZ1EeY7Z5RCFQ==
X-Google-Smtp-Source: ABdhPJzgWyducs5OR634fAQXIR2yxlEZtTKfJ30TfxVuMcWKkVY6KimUQEmZTpGJXeO+P1NXIlvcAn6pi3AZABBTJ0g=
X-Received: by 2002:a2e:908d:: with SMTP id l13mr33468095ljg.467.1626950671828;
 Thu, 22 Jul 2021 03:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626947923.git.mchehab+huawei@kernel.org> <95289c73673861f462954ae8383eb88804ae7a0c.1626947923.git.mchehab+huawei@kernel.org>
In-Reply-To: <95289c73673861f462954ae8383eb88804ae7a0c.1626947923.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Jul 2021 12:44:20 +0200
Message-ID: <CACRpkdZsF-mESJNZnN42YsfVoCtm-sOGu=Ud3Ce_EoPdQgo36A@mail.gmail.com>
Subject: Re: [PATCH 14/15] MAINTAINERS: update intel,ixp46x-rng.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 22, 2021 at 12:00 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> The file name: Documentation/devicetree/bindings/display/intel,ixp46x-rng.yaml
> should be, instead: Documentation/devicetree/bindings/rng/intel,ixp46x-rng.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: cca061b04c0d ("hw_random: ixp4xx: Add DT bindings")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Oops. Thanks for fixing this Mauro!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
