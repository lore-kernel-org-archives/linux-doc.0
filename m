Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD02C43460
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 11:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DF7B61382
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 11:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343817AbhDGLej (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:34:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37397 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343726AbhDGLec (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 07:34:32 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F204D2000A;
        Wed,  7 Apr 2021 11:34:20 +0000 (UTC)
Date:   Wed, 7 Apr 2021 13:34:20 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vitor Soares <vitor.soares@synopsys.com>,
        devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/19] dt-bindings: i3c: update i3c.yaml references
Message-ID: <YG2YvD2WABchrVAA@piout.net>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
 <8bb8923b4d98b4e8a6336a4c0b548c714e01aef5.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bb8923b4d98b4e8a6336a4c0b548c714e01aef5.1617783062.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/04/2021 10:20:48+0200, Mauro Carvalho Chehab wrote:
> Changeset 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
> renamed: Documentation/devicetree/bindings/i3c/i3c.txt
> to: Documentation/devicetree/bindings/i3c/i3c.yaml.
> 
> Update the cross-references accordingly.
> 
> Fixes: 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
> Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt   | 6 +++---
>  .../devicetree/bindings/i3c/snps,dw-i3c-master.txt          | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> index 1cf6182f888c..3716589d6999 100644
> --- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
> @@ -10,19 +10,19 @@ Required properties:
>  - reg: I3C master registers
>  
>  Mandatory properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - #address-cells: shall be set to 1
>  - #size-cells: shall be set to 0
>  
>  Optional properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - i2c-scl-hz
>  - i3c-scl-hz
>  
>  I3C device connected on the bus follow the generic description (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
>  
>  Example:
>  
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> index 5020eb71eb8d..07f35f36085d 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
> @@ -9,19 +9,19 @@ Required properties:
>  - reg: Offset and length of I3C master registers
>  
>  Mandatory properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - #address-cells: shall be set to 3
>  - #size-cells: shall be set to 0
>  
>  Optional properties defined by the generic binding (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
>  
>  - i2c-scl-hz
>  - i3c-scl-hz
>  
>  I3C device connected on the bus follow the generic description (see
> -Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> +Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
>  
>  Example:
>  
> -- 
> 2.30.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
