Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D320C43217
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 12:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbiKHMlm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 07:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbiKHMll (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 07:41:41 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0751E51C27
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 04:41:40 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id m22so1034371eji.10
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 04:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gi9G5NsNt+Ih2E7N83yfZTdIZYSFxlj5Rim1ZcoMIso=;
        b=qGVPRCWL/D+mJBt/YMpR/hJd+4+6vgRZYwr0Y/oVlUwH+qLV4eWqaggSLqst80bRSK
         33Dsc/PPoR4rNmTsCfQv/u1Pw3hKLnPKDz5ormbRqWS8C1px+0JIsCQxVc12d6egE9q8
         xoiJc7yxZ/0dpZvPdBcH1AV6g8/Sw2SOSMcRaNP74U48RoJQouqtX3bx/zsgRQoWp6LF
         Es3nd+BQmABuAYlGrosKrbyNePLh+BP7L2C4iFRzh7c/gtZERA2QOc+UHBlRtUzwdHQk
         k/Y0LH4KrXCmcThcVJNx6p2pfBDMyJwhjE0F1v7AK9NeV/c877ozDa6Dm7zDoN4Upd34
         Xrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gi9G5NsNt+Ih2E7N83yfZTdIZYSFxlj5Rim1ZcoMIso=;
        b=gOHAOwAZ+vFAWd12LnWmeZStngwbLg+2/3ODORjLXW2DQy8QZNbYlwt3HeoUbTX4SE
         uYXLUv2TAm9CSy5twsp0lQ58HAh1AMCtZx+wuQH+0YEcnrjky+vIk0wtv7rFHmYRGfBe
         9L5C+GKR2/YdY1aKXsauESLTKCMVPKJKXVLuzY/UnLKVSkvCTZ/JTHHbB2l2rWsD03Sg
         B3J2qKs2QSn327bgURwnWLEd+JO/hCYuAj0cFkHP9W6n969ZKmPh5vQiOsq2KVGtIfJY
         sKSqnpyRYGUqF/cPX5dnOHxGxIwdkPaLY52OKuo3v4a8MCdBrg/rt5W64dqG+keQdtRi
         CmjA==
X-Gm-Message-State: ACrzQf2y3zDNXCt0hCNi4CjCkUi1JgHZULTLQ3q2sY5COV6eBJpLUK5O
        Rr00YvEMEXZEdxus0igk60SK3VmZcFccRVL8o9VGUQ==
X-Google-Smtp-Source: AMsMyM4D93wKvgktKtF5pSLNAQhwJArnmkseAbPQu6Ig5bPJ7gB6T8TvEqq/MsHMHo31i9VmzOer9LWWXHAKTEwxw8g=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr20975544ejc.690.1667911298631; Tue, 08
 Nov 2022 04:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20221101205159.1468069-1-lis8215@gmail.com>
In-Reply-To: <20221101205159.1468069-1-lis8215@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 13:41:27 +0100
Message-ID: <CACRpkdbKv_EBBpvSkGkftexJs4t2ani2bVz8vnRLN2YjpBVvAg@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs/pinctrl: fix pinctrl examples
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 1, 2022 at 9:52 PM Siarhei Volkau <lis8215@gmail.com> wrote:

> The document has some typos in the examples related to using
> pinctrl_select_state function and out-of-context variables.
> The patchset aims to fix that.

Thanks so much for fixing this! My ages old mistakes...

Patches applied.

Yours,
Linus Walleij
