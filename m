Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 91F857D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 12:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936070AbeF2Mgk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 08:36:40 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:52682 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934068AbeF2Mgj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 08:36:39 -0400
Received: by mail-it0-f67.google.com with SMTP id p4-v6so2620415itf.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aBG7mXx2IxpRnogZ1FpdbDkhc+onC7si3N5eMJNpvmY=;
        b=TFVjrxwwbI+D8PXRgqV710Bc4s4q65h6JYRyq+s4KFmUdD0Tjb7PaqAql8Nn93XO/4
         GBf4ZiDFxSn/zY1tu5XNDDgai72vuFDS/YpwCE4WUUiFg3nl8x6xKAu8B9kERyzZBh4p
         qfOq2Ec5EereTMpbnkZm+tS6KyFPPQr+9+Pfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBG7mXx2IxpRnogZ1FpdbDkhc+onC7si3N5eMJNpvmY=;
        b=CDpmSPeZg1EDRiLB3x9xnwmGyh9rca3EN85HCYX8pqYjyo1ktMs9URcT1kkdBVeD5Y
         2lfMwt4pZtfW3ks0rkjgWOUo5LogOJuta0LOmc8c5gQGxHIORlDyiPxjp35d5UpleLud
         IxhciRkd0aTRjtQWhBRipMa3Ig0P0+H/JcCasYGddZ7xpbfvZfbsE8zOiyYHzdEpMe/v
         IHKa0AmCbjssXBp+YmFqMTSAKCdSXGSeMjfUpBPrx7qkk5g/kltQhyhPms5rMkn4/IV/
         e/HyWmbznYmgjkqfaVwfuii7AeFOpaYK4s2OMxVtIz3UeQvFsRbULo2WYp6A6r8MpHeC
         pxHw==
X-Gm-Message-State: APt69E2om1Xn37PhQ9PpHgNySN+1hEtDJEWUd2LphFr/UZAHeHyTaFjv
        5XamZHluogXfM6+lXsiZfDNPUjq/RpoQA/RZRMGkUA==
X-Google-Smtp-Source: AAOMgpcLP+7K8pwUSuQVf7CME2zc8KPAPLFcHsBfSCUDCoL6uMkn/GRyW/2c4oTp+MkKg8aZLtI/wv/+90xSPc9Zixg=
X-Received: by 2002:a02:597:: with SMTP id 23-v6mr11398982jal.112.1530275799017;
 Fri, 29 Jun 2018 05:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1530005114.git.mchehab+samsung@kernel.org> <60e0372bb4d96f7795404e28d776a4600e38efe2.1530005114.git.mchehab+samsung@kernel.org>
In-Reply-To: <60e0372bb4d96f7795404e28d776a4600e38efe2.1530005114.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Jun 2018 14:36:28 +0200
Message-ID: <CACRpkdbiWoZ0HjYw37MyN_23mdijDNEJhdJ=voqVTKAqbgAqXw@mail.gmail.com>
Subject: Re: [PATCH 6/9] gpio.h: fix location of gpio legacy documentation
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 26, 2018 at 11:49 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> The location of this doc file was moved. Change its reference
> accordingly.
>
> Fixes: 7ee2c13080c9 ("Documentation: gpio: Move legacy documentation to driver-api")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Should I apply this to the GPIO tree?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
