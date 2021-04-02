Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C45C43462
	for <linux-doc@archiver.kernel.org>; Fri,  2 Apr 2021 09:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6CE36113A
	for <linux-doc@archiver.kernel.org>; Fri,  2 Apr 2021 09:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbhDBJRt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Apr 2021 05:17:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234718AbhDBJRs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Apr 2021 05:17:48 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9076660FF3;
        Fri,  2 Apr 2021 09:17:45 +0000 (UTC)
Date:   Fri, 2 Apr 2021 10:17:55 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/32] MAINTAINERS: update atmel,sama5d2-adc.yaml
 reference
Message-ID: <20210402101755.509fbfc2@jic23-huawei>
In-Reply-To: <4574e4b7612f5fd683fddbcd7d7307d5e6d02988.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
        <4574e4b7612f5fd683fddbcd7d7307d5e6d02988.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  1 Apr 2021 14:17:35 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Changeset 58ff1b519753 ("dt-bindings:iio:adc:atmel,sama5d2-adc: txt to yaml conversion")
> renamed: Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> to: Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 58ff1b519753 ("dt-bindings:iio:adc:atmel,sama5d2-adc: txt to yaml conversion")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Applied

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 576d1bcabb20..89ed435ca6c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11930,7 +11930,7 @@ MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
>  M:	Eugen Hristev <eugen.hristev@microchip.com>
>  L:	linux-iio@vger.kernel.org
>  S:	Supported
> -F:	Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> +F:	Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
>  F:	drivers/iio/adc/at91-sama5d2_adc.c
>  F:	include/dt-bindings/iio/adc/at91-sama5d2_adc.h
>  

