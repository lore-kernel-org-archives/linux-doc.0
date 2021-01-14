Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F4BC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 08:26:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BA3E23447
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 08:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbhANI01 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 03:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbhANI00 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 03:26:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9461EC061575
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 00:25:46 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzxws-00032n-W1; Thu, 14 Jan 2021 09:25:42 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kzxws-0005SP-Jl; Thu, 14 Jan 2021 09:25:42 +0100
Message-ID: <e9101eaf68398db4ee607ea583606c744bbb4578.camel@pengutronix.de>
Subject: Re: [PATCH v6 14/16] reset: core: fix a kernel-doc markup
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org
Date:   Thu, 14 Jan 2021 09:25:42 +0100
In-Reply-To: <8defd442bce0cf5524cf1cfbbd028eede90358a7.1610610937.git.mchehab+huawei@kernel.org>
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
         <8defd442bce0cf5524cf1cfbbd028eede90358a7.1610610937.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

On Thu, 2021-01-14 at 09:04 +0100, Mauro Carvalho Chehab wrote:
> A function has a different name between their prototype
> and its kernel-doc markup:
> 
> 	../drivers/reset/core.c:888: warning: expecting prototype for device_reset(). Prototype was for __device_reset() instead
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/reset/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 34e89aa0fb5e..dbf881b586d9 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -875,8 +875,8 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
>  EXPORT_SYMBOL_GPL(__devm_reset_control_get);
>  
>  /**
> - * device_reset - find reset controller associated with the device
> - *                and perform reset
> + * __device_reset - find reset controller associated with the device
> + *                  and perform reset
>   * @dev: device to be reset by the controller
>   * @optional: whether it is optional to reset the device
>   *

Thank you, applied to reset/next.

regards
Philipp
