Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08E7C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 22:10:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CB6C64E3F
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 22:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhCPWKX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 18:10:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230397AbhCPWKH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Mar 2021 18:10:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8C2676186A;
        Tue, 16 Mar 2021 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615932607;
        bh=QDGfJY6zp/Cc6yn/TX1CZKO2H/GBxUEq6V7CIiYjTc8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FMoQE0yLi6mEo97em4yWyN2OZsNz4J9fFg3M4ImybBPMM1v2keDAUc1H1O+pbJ3xK
         yKHJhEaSjofrfy8tsKGJOL1GWKn4G+VyiVEGyWb//8CyWPnyhIt69blsPz1FqPGcsf
         NFXrEOz4k+g462tlNdSoiSvUOYNn63rZG1WFBLEgyKsLSgYMSAmr+2ehHuuiqJhbUV
         5jvhJyoluuUqfEM0sVgUu0WW3DKRbelYv/EopL5J3n26lpJNy0v8o7cF4YLba7b/dZ
         OFvljgfIqKqHiN95lQm98KJh98IwIlmj0UpW3jaorg6MfnSV0afTCAWoaNMwFaumdL
         qk0KlOsuesrUg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: net: ena: Fix ena_start_xmit() function name typo
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161593260749.31300.13526087563089117634.git-patchwork-notify@kernel.org>
Date:   Tue, 16 Mar 2021 22:10:07 +0000
References: <20210316032737.1429-1-yuzenghui@huawei.com>
In-Reply-To: <20210316032737.1429-1-yuzenghui@huawei.com>
To:     Zenghui Yu <yuzenghui@huawei.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netanel@amazon.com, akiyano@amazon.com, gtzalik@amazon.com,
        saeedb@amazon.com, corbet@lwn.net, wanghaibin.wang@huawei.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 16 Mar 2021 11:27:37 +0800 you wrote:
> The ena.rst documentation referred to end_start_xmit() when it should refer
> to ena_start_xmit(). Fix the typo.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  Documentation/networking/device_drivers/ethernet/amazon/ena.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] docs: net: ena: Fix ena_start_xmit() function name typo
    https://git.kernel.org/netdev/net/c/8a4452ca29f9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


