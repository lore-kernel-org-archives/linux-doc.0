Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D18C87D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 May 2019 11:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390947AbfEXL1o (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 May 2019 07:27:44 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40970 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390840AbfEXL1o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 May 2019 07:27:44 -0400
Received: by mail-qk1-f193.google.com with SMTP id m18so6924298qki.8
        for <linux-doc@vger.kernel.org>; Fri, 24 May 2019 04:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BjYcnQFmVjebl5i0cXPxIGxnyaXnU2JY+brSml/1DDA=;
        b=wGoUtIoO0xz1EQhdjt87mJBjfAHd7Ze0qgWrdLO3iyLU463hhfssDEWbk1Ei9Z18zD
         MzH1H0jYXc1FdtERUsP1TKuCRpAT1DJC+kGD7/6qUtElGHuy418CvUscrLkU/4gqu1TZ
         j05FNLrxUQCBUTfGoaPwzMuxLUedlu2x/ExF1zPVYt+Ce26ouQwv6MO3sZA8TRdeCURJ
         /AaGaj1MziyxFXmubqdVhkewE0SkemPgilorVvo10rANGoC294M0WlmnuMEI9OXQGmqu
         +ShnV6T6oumzk3r3twukFvr8i3d/6MGzzQ0MHXz5ssSfVnMySSixwiCRxCJQsh/5Ij09
         QExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BjYcnQFmVjebl5i0cXPxIGxnyaXnU2JY+brSml/1DDA=;
        b=GII2TE0/kJWaGfbCY91WHeArwHFii06K/gmkIPxiWHGO5c/w0sQchnNP7qoqIZ2xak
         VnfiJ1WPRrCIZ7x5/DCqpGCgZZG950cUMd19KnOCViiT5gbELX4pZ8onSU7fE8g0UgZF
         aLoVltq2Uzd4Ygsw/GVsRP75MyvJmacqMvUcmAb7DubyC9Bv5/0R2SQsG7Et40TxcyeR
         /axNe5BNfYf491z4tEMCl9YDchZMMHLVT9ONCttqYX67V3XeLY4bc8JZbkcymubilPdO
         MagAU88Ez3905M6K9pILU1rlVtzDPKV+S5gFh93bKHeobQKBJCCRdmtoXU7mTmXjmDfm
         cW+A==
X-Gm-Message-State: APjAAAV9KNWDUM7M9PNlJ1T8x7Idr4d/irzg636grY8Nxt+kyKPUfIho
        RrFDGOGAe/EgcuqkIr24jkShI/kvYC1dqx/tuqrXug==
X-Google-Smtp-Source: APXvYqxf7/9bFgNldoDEakk0wvrkUDY2w+3N/zeuVyi+hiSEB2HQNspS+Lvdr8CIJFtRT4V11GagahDvrbloBFIO5qU=
X-Received: by 2002:ad4:45ab:: with SMTP id y11mr82554975qvu.137.1558697263652;
 Fri, 24 May 2019 04:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190510090339.17211-1-luca@lucaceresoli.net>
In-Reply-To: <20190510090339.17211-1-luca@lucaceresoli.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:27:31 +0200
Message-ID: <CACRpkda5afsF+2WwMg4_L7uDexFR0UExgmHQ-+JajXmPCpzU3g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: remove duplicated lines
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 10, 2019 at 11:03 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:

> The 'default (active high)' lines are repeated twice. Avoid people stare at
> their screens looking for differences.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Patch applied with Bartosz's ACK.

Yours,
Linus Walleij
