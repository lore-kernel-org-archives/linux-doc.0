Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDD4C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 22:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 672DA613D6
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 22:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhETWbd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 18:31:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231329AbhETWbc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 May 2021 18:31:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 62039613AC;
        Thu, 20 May 2021 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621549810;
        bh=5cDZduWBJFBYYAmarnpupAcbglPvZM4E9xEdY5bWkPE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SAUlCG1Fv3QQlODUOis6erQ5rGNwqQkoURWfCGKra2fC2rOhan45l28ksz0NF0leA
         B5daeNJEQDicc5GzMENmFUE+SZmPxeq634MiCJB7km4YtKqH/RwzwCkOXQF6e6gadr
         EAvT3J1NtozLHSIBD/E5QTBGFZNBIA9MEHb4ZxgcnERxJut5U/m3/6BvrkldCy7bNW
         tcSPUYqMM0/MSzUAso2L1RQTa5hkLed7E6IZTDt8QzQ7eEOJI6xB6qdmy8Rqp0wM06
         fEC5pgklUJ+TOvsXJ0qnOWLwbxIsV04EmRSLUYrGpLCLWRIHGinwTeH9Cl9xctyOUp
         VOzuoWUhyElsw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: encx24j600: fix kernel-doc syntax in file headers
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162154981031.17678.7698185941474619213.git-patchwork-notify@kernel.org>
Date:   Thu, 20 May 2021 22:30:10 +0000
References: <20210520184915.588-1-yashsri421@gmail.com>
In-Reply-To: <20210520184915.588-1-yashsri421@gmail.com>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     davem@davemloft.net, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 21 May 2021 00:19:15 +0530 you wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/net/ethernet/microchip/encx24j600 files follows
> this syntax, but the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> For e.g., running scripts/kernel-doc -none
> drivers/net/ethernet/microchip/encx24j600_hw.h emits:
> warning: expecting prototype for h(). Prototype was for _ENCX24J600_HW_H() instead
> 
> [...]

Here is the summary with links:
  - net: encx24j600: fix kernel-doc syntax in file headers
    https://git.kernel.org/netdev/net/c/503c599a4f53

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


