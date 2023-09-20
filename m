Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA81C0032E
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 15:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbjITP43 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 11:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235018AbjITP42 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 11:56:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57F8B9
        for <linux-doc@vger.kernel.org>; Wed, 20 Sep 2023 08:56:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACFCC433C8;
        Wed, 20 Sep 2023 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695225382;
        bh=v8EP6rd+e0JXFgWJJVTrshogxYhGsEaW990one0qWt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XSZiiQ7VZUyu4W/luWKAihXbJpGdMRVAMteyZ308XcIEzqFe4h1dgSulqL+buOcHK
         h3SNeKtSUCIwhPjeHMkE7E6OZhInfY+9b7G75zdiiqak3w/9oVW/3/4iYQ5USKLhEq
         ST/I0I8gqT3geaK2aMpi0D9vNeyKfKM5FKxiCqBw31Ok6pDptduCigvu4OdLyNbcv9
         e1IfDg3rLGMSLQtfcSxnp0qi45OpDbQAMUXJNqtQDtyi/d/3foUr9lWI1zxlOvER5t
         oHPIZmzn1PWr5/fLa4Agui3Lv/t8voaHNj9Y+7zJ6xYiMf5q57EnUyzbmnSqxwZP+l
         A5iq2+ugQm5aA==
Received: (nullmailer pid 2424113 invoked by uid 1000);
        Wed, 20 Sep 2023 15:56:19 -0000
Date:   Wed, 20 Sep 2023 10:56:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, Frank.li@nxp.com,
        devicetree@vger.kernel.org, s.hauer@pengutronix.de,
        mark.rutland@arm.com, corbet@lwn.net, kernel@pengutronix.de,
        festevam@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        linux-imx@nxp.com, will@kernel.org, linux-doc@vger.kernel.org,
        shawnguo@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX8DXL
 compatible
Message-ID: <20230920155619.GA2422686-robh@kernel.org>
References: <20230920102004.886599-1-xu.yang_2@nxp.com>
 <20230920102004.886599-3-xu.yang_2@nxp.com>
 <169521103427.1930124.5864996786068746858.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169521103427.1930124.5864996786068746858.robh@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 20, 2023 at 06:57:14AM -0500, Rob Herring wrote:
> 
> On Wed, 20 Sep 2023 18:20:02 +0800, Xu Yang wrote:
> > Add a compatible for i.MX8DXL which is compatile with "fsl,imx8-ddr-pmu".
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 

This can be ignored. Looks like some transcient issue with dtschema not 
being able to run and the version check failed.

Rob
