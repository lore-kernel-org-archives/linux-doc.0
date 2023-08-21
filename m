Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE5BEE4996
	for <linux-doc@archiver.kernel.org>; Mon, 21 Aug 2023 21:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjHUVxS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Aug 2023 17:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjHUVxR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 17:53:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EF2129;
        Mon, 21 Aug 2023 14:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=Icdp6L2IcSi59UlWlFjAZimxTTfJngGpDQ5q2XGzEJY=; b=j3sidcPk0LJCiC+GWIh3RPeulA
        mNok3KUk74VxS/Th0+6Ec1ea5TxSVrIfj78p5S7TtR5bIiLK7GmTUyklvprc6ljG65aPS1xAqdrC9
        VOzVLGBqlcEpy0a4KPh4DcOsnAeKB7NdM/affQu19OoChCwH0xz5V71AhpIv1t2SB85EaBKslF48f
        uljjpgqoEca12sFEwWYvdHcNNH2Ha1rmAtvVJczZgEHgA2nu1PMyjTKetHnLQ/pxPNzi8eoFznOUy
        VHFulL2zdzj3mQZEI/f5qTaOJ0CBa8F6ngb+VgpDFlgY/H5kFHMcHLFvfb0cC45/xDYmpWBsAbD9e
        fcIxjzhw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qYCpi-00Ekbl-2n;
        Mon, 21 Aug 2023 21:53:10 +0000
Message-ID: <faf9dca2-ee62-3647-7f56-808d0da42ee2@infradead.org>
Date:   Mon, 21 Aug 2023 14:53:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: Fix typos
Content-Language: en-US
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20230821194132.366474-1-helgaas@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230821194132.366474-1-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/21/23 12:41, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix typos in Documentation/devicetree/bindings.  The changes are in
> descriptions or comments where they shouldn't affect functionality.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Hi,
One nit below. In any case:

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> This is a follow-up to the patch at [1] for things that conflicted with
> other changes in linux-next, plus a couple that I missed before.
> 
> Based on next-20230821: 47d9bb711707 ("Add linux-next specific files for
> 20230821")
> 
> [1] https://lore.kernel.org/r/20230814212822.193684-3-helgaas@kernel.org
> 
>  .../devicetree/bindings/leds/leds-group-multicolor.yaml       | 2 +-
>  Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml   | 4 ++--
>  Documentation/devicetree/bindings/phy/apm-xgene-phy.txt       | 2 +-
>  .../devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml     | 2 +-
>  .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 

> diff --git a/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt b/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
> index e1bb12711fbf..602cf952b92b 100644
> --- a/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
> @@ -36,7 +36,7 @@ Optional properties:
>  			  3-tuple setting for each (up to 3) supported link
>  			  speed on the host. Range is 0 to 273000 in unit of
>  			  uV. Default is 0.
> -- apm,tx-pre-cursor2	: 2st pre-cursor emphasis taps control. Two set of
> +- apm,tx-pre-cursor2	: 2nd pre-cursor emphasis taps control. Two set of

s/set/sets/

>  			  3-tuple setting for each (up to 3) supported link
>  			  speed on the host. Range is 0 to 127400 in unit uV.
>  			  Default is 0x0.

-- 
~Randy
