Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59628C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 17 Feb 2021 21:21:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1117464E58
	for <linux-doc@archiver.kernel.org>; Wed, 17 Feb 2021 21:21:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbhBQVVA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Feb 2021 16:21:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:49504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234684AbhBQVUs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Feb 2021 16:20:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 92B6264E58;
        Wed, 17 Feb 2021 21:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613596807;
        bh=JOFope0PF69yBz3icwaj3gnHWv0eRHgUytwIyBchAVc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=henge4a1JMMRqe4+UA2qe42aFM2Xv/3YtFetBCmqLJMpAHO417W41n07fOeLidIKZ
         o+IdxJ4BCIXcna8v+TN8eyVmrJJXP+TWPEvZhekJZNs1UvhEmieZYHBH/i5YefxNqf
         8iITrBxhX7PY+HD3ZOR0F/9FCv8bcrnd9r1zNP+haM8ENlPiMLN1eUb3oeX3AEDtzH
         C5JUJK85ocU3gfvjl9x2IfVt/RlL7nBKvAKVogcq8mHWlZpPBCwFNUss1ozG58DCoG
         8zBtz/OA/hXv4/Z10+WJFn09/vDbRC2NteWsjLutcGfqvgWLmJWlnpjxqpa8Zvx4Px
         87kEOV2iL9INg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: mdio: Remove of_phy_attach()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161359680752.30698.3346605749962540906.git-patchwork-notify@kernel.org>
Date:   Wed, 17 Feb 2021 21:20:07 +0000
References: <20210217202558.2645876-1-f.fainelli@gmail.com>
In-Reply-To: <20210217202558.2645876-1-f.fainelli@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        corbet@lwn.net, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, robh+dt@kernel.org, frowand.list@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 17 Feb 2021 12:25:57 -0800 you wrote:
> We have no in-tree users, also update the sfp-phylink.rst documentation
> to indicate that phy_attach_direct() is used instead of of_phy_attach().
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/networking/sfp-phylink.rst |  2 +-
>  drivers/net/mdio/of_mdio.c               | 30 ------------------------
>  include/linux/of_mdio.h                  | 10 --------
>  3 files changed, 1 insertion(+), 41 deletions(-)

Here is the summary with links:
  - [net-next] net: mdio: Remove of_phy_attach()
    https://git.kernel.org/netdev/net-next/c/96313e1db8e5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


