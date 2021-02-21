Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D70C433E0
	for <linux-doc@archiver.kernel.org>; Sun, 21 Feb 2021 17:14:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7621964EB3
	for <linux-doc@archiver.kernel.org>; Sun, 21 Feb 2021 17:14:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhBUROk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 21 Feb 2021 12:14:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:40414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229970AbhBUROj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 21 Feb 2021 12:14:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F4BC64EB3;
        Sun, 21 Feb 2021 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613927637;
        bh=uNEaMQOzK9gUZsC7QfSeSsvmh6CaDwcaPJFPIbXGBlA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Tuq1koLtfVAP7UO4N0xpxBdO7//Gq2Cbzi4jakTjloKP0tmdmnI3XDgJ9zvsKTD0w
         TxEJ6OzQLHD7sGGPETVc5dEs29yVpVByRakFf2STV6LBQZwvDCvO5pgmTKscPku9XM
         6wbP3CG+tK1wcERiHNq7IX8PvgQsyvQ7Aw0WA8hnIDXpCuZ2PGJluvPFp6CsVk3Jjf
         N1k2pd7y7MhIN0EXiofJr9c/MLejIEX5pc7tUVDi0XvWy9j24cx5Ex7kcbwFjIK5yK
         k2oaqK3Q79wc78LcQSPenBdhToqkkULjkpy7XnDfbRbX7Eg5xPQpFxgiTyCn2JufQO
         ISYQFR6J7ah7A==
Received: by pali.im (Postfix)
        id 2C178B96; Sun, 21 Feb 2021 18:13:55 +0100 (CET)
Date:   Sun, 21 Feb 2021 18:13:52 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     lkundrak@v3.sk
Cc:     alior@marvell.com, andrew@lunn.ch, corbet@lwn.net,
        eric.y.miao@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, maen@marvell.com, nico@fluxnic.net,
        thomas.petazzoni@free-electrons.com
Subject: Re: [PATCH v3 2/3] docs: arm: marvell: drop a dead links
Message-ID: <20210221171352.qs2kpckhoeq2dsa2@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215220839.423709-3-lkundrak@v3.sk>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> This one has gone away.
...
> --- a/Documentation/arm/marvell.rst
> +++ b/Documentation/arm/marvell.rst
> @@ -399,7 +399,6 @@ Berlin family (Multimedia Solutions)
>    - Flavors:
> 	- 88DE3010, Armada 1000 (no Linux support)
> 		- Core:		Marvell PJ1 (ARMv5TE), Dual-core
> -		- Product Brief:	http://www.marvell.com.cn/digital-entertainment/assets/armada_1000_pb.pdf

It is still in web archive:
https://web.archive.org/web/20131103162620/http://www.marvell.com/digital-entertainment/assets/armada_1000_pb.pdf
