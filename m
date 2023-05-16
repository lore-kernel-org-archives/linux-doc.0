Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E98AC77B7A
	for <linux-doc@archiver.kernel.org>; Tue, 16 May 2023 13:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbjEPNgx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 May 2023 09:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbjEPNgr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 09:36:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E212527B;
        Tue, 16 May 2023 06:36:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A476617FF;
        Tue, 16 May 2023 13:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9985C433EF;
        Tue, 16 May 2023 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684244203;
        bh=y/yWoPs8Nlf4p3CTjaVQfoHaJvHxuvjvDqaUL6F6Phs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UjFmnmvm35D7Eoud6qOlQMYj0uS3SPPHJcIUVr0C9BDKoibiNK8iuxNXsMfN8dUcl
         mVm73t4opsFn4yO0j6dumM+xej3qJCNa76TPN9pFSHIrzPk4gJY7dHx3ArwaUhJG1m
         mRMvXSsr3sblzY1w38uCi8+ho8rBSWj6yui36whSEGEQVWI+NM8vEvEK5OL22MkFi3
         FncsH9nsj40e6PPPzWlCBVz6ymCuBSDoD79oWbiprWq/5FEmdYM2tn2UwaLT5z5q1k
         ZIMNJVjtmipsCnGvhlqqu+G63uKI6zGkdoKe4c6qBlY8PSExWjIhu9bTYaUozT7pua
         0TiA4WuBanyaA==
Date:   Tue, 16 May 2023 19:06:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v14 07/15] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <ZGOG5iwINTcFABHB@matsya>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-8-sean.anderson@seco.com>
 <ZFi/Y7wcad4hrAMe@matsya>
 <957a6bb4-f07b-f511-72c9-da4199dc8616@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <957a6bb4-f07b-f511-72c9-da4199dc8616@seco.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08-05-23, 11:28, Sean Anderson wrote:
> On 5/8/23 05:22, Vinod Koul wrote:
> > On 13-04-23, 12:05, Sean Anderson wrote:

> >> +static const struct lynx_cfg ls1088a_cfg = {
> >> +	.lanes = 4,
> >> +	.endian = REGMAP_ENDIAN_LITTLE,
> >> +	.mode_conflict = lynx_ls_mode_conflict,
> >> +	.mode_apply = lynx_ls_mode_apply,
> >> +	.mode_init = lynx_ls_mode_init,
> > 
> > So you have cfg with mode_xxx pointing to same functions for both of the
> > versions you support... so question is why do this and not call the
> > functions directly?
> 
> The intention is to make it easy to add support for T-series processors,
> which have a different PCCR layout.

And when is that going to come. I would prefer this to be added when we
have users being added

-- 
~Vinod
