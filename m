Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848D0CE79D0
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 11:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbjITL5a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 07:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235136AbjITL5Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 07:57:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83521DE
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 04:57:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EF7C433C7;
        Wed, 20 Sep 2023 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695211037;
        bh=KtSbqudyEVLJe2yzLXtxiMZhhIuB13J1aPSKzXcALg8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=oLBbX4Cv3v9iOckqbsTnnENFYzHek+LSW9giSPZ0ZxpE7WDTbGIX/IS7lWMsoUY9M
         fYdu7afhAHPuIMwzyNPFGMLuIM+hVibfWj1evrQ39pkAk9r1IbRDh5TdnffqF6/pQN
         VDYS1FBQsoFKhYQWxX+6csuosUmj8dy2JE3rrDmaZaKLauQFG4QQ3az4PmIIRpXiGV
         LaKbaSgc0DhbvnCogYJP4pLM3R6xAkBWUKT2PWn93u/JfADaJzKP4Q/dPh+gn58Ons
         Rs5r6g7wc9DxB4VYEtaDePyCs00zyV3+JhLVBUKyqMpNAB9zojbnLcsWdOtyzC80f6
         LNZLpu4UDgN1g==
Received: (nullmailer pid 1930164 invoked by uid 1000);
        Wed, 20 Sep 2023 11:57:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, Frank.li@nxp.com,
        devicetree@vger.kernel.org, s.hauer@pengutronix.de,
        mark.rutland@arm.com, corbet@lwn.net, kernel@pengutronix.de,
        robh+dt@kernel.org, festevam@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        will@kernel.org, linux-doc@vger.kernel.org, shawnguo@kernel.org,
        conor+dt@kernel.org
In-Reply-To: <20230920102004.886599-3-xu.yang_2@nxp.com>
References: <20230920102004.886599-1-xu.yang_2@nxp.com>
 <20230920102004.886599-3-xu.yang_2@nxp.com>
Message-Id: <169521103427.1930124.5864996786068746858.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX8DXL
 compatible
Date:   Wed, 20 Sep 2023 06:57:14 -0500
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Wed, 20 Sep 2023 18:20:02 +0800, Xu Yang wrote:
> Add a compatible for i.MX8DXL which is compatile with "fsl,imx8-ddr-pmu".
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230920102004.886599-3-xu.yang_2@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

