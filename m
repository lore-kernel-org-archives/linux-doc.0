Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1244BC433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 10:20:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D29656139E
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 10:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbhDGKUd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 06:20:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2782 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350854AbhDGKUa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 06:20:30 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FFgBx45GGz687Y6;
        Wed,  7 Apr 2021 18:10:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 12:20:19 +0200
Received: from localhost (10.47.92.157) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 7 Apr 2021
 11:20:18 +0100
Date:   Wed, 7 Apr 2021 11:18:55 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/19] dt-bindings:iio:adc: update
 motorola,cpcap-adc.yaml reference
Message-ID: <20210407111855.000005f3@Huawei.com>
In-Reply-To: <702d97d71929bec342b8b60e408eccb68c4ed7a0.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
        <702d97d71929bec342b8b60e408eccb68c4ed7a0.1617783062.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.92.157]
X-ClientProxiedBy: lhreml752-chm.china.huawei.com (10.201.108.202) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 7 Apr 2021 10:20:49 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Changeset 1ca9d1b1342d ("dt-bindings:iio:adc:motorola,cpcap-adc yaml conversion")
> renamed: Documentation/devicetree/bindings/iio/adc/cpcap-adc.txt
> to: Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 1ca9d1b1342d ("dt-bindings:iio:adc:motorola,cpcap-adc yaml conversion")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> index ebdccfb600b9..b52e7a33f0f9 100644
> --- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> +++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> @@ -23,7 +23,7 @@ which are described in the following files:
>  - Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
>  - Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>  - Documentation/devicetree/bindings/leds/leds-cpcap.txt
> -- Documentation/devicetree/bindings/iio/adc/cpcap-adc.txt
> +- Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.yaml
>  
>  The only exception is the audio codec. Instead of a compatible value its
>  node must be named "audio-codec".

