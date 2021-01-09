Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0382C433E0
	for <linux-doc@archiver.kernel.org>; Sat,  9 Jan 2021 03:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7852923A3C
	for <linux-doc@archiver.kernel.org>; Sat,  9 Jan 2021 03:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbhAIDkt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jan 2021 22:40:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:47810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbhAIDkt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Jan 2021 22:40:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C21AA23A23;
        Sat,  9 Jan 2021 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610163608;
        bh=xKRQlUPM6LZ1/K5pS7j2eyZvG9rVM8WXhPSoJS6JKfg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=O6W03qDVV/8YJKjA7t7SbbkCEguZLqZ0M6iCwWw/4/1oAFF6tvYs7k7mCOOcnpQzA
         wp3q9KMWXPsCHvkvFxg+l8lEPTIU/zib4iXFmy3VSELTqGcfKFopzQ+RoatZDOiV/O
         PH0nqioqdNCLwoiwtooDLjcF66PrQB/i87B7i/HgTlkNgYnUJG+kmOJyA0mxzBjd+j
         RdZGE8zNy0H4FXmsTZeyFJqQQV6LeLi59cjVnN8Lf1q60S4sXKHHoqbP4nTaZ7R482
         pLDrGTgUDevu5d0wTHFzQreHmZEDbGaA4eteV0a4gxSo3d7kEy382HSg/s5IGUuA25
         WvpR7HyWiRIHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/3] net: fix issues around register_netdevice() failures
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161016360872.369.12946201469501614847.git-patchwork-notify@kernel.org>
Date:   Sat, 09 Jan 2021 03:40:08 +0000
References: <20210106184007.1821480-1-kuba@kernel.org>
In-Reply-To: <20210106184007.1821480-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, f.fainelli@gmail.com,
        xiyou.wangcong@gmail.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This series was applied to netdev/net.git (refs/heads/master):

On Wed,  6 Jan 2021 10:40:04 -0800 you wrote:
> This series attempts to clean up the life cycle of struct
> net_device. Dave has added dev->needs_free_netdev in the
> past to fix double frees, we can lean on that mechanism
> a little more to fix remaining issues with register_netdevice().
> 
> This is the next chapter of the saga which already includes:
> commit 0e0eee2465df ("net: correct error path in rtnl_newlink()")
> commit e51fb152318e ("rtnetlink: fix a memory leak when ->newlink fails")
> commit cf124db566e6 ("net: Fix inconsistent teardown and release of private netdev state.")
> commit 93ee31f14f6f ("[NET]: Fix free_netdev on register_netdev failure.")
> commit 814152a89ed5 ("net: fix memleak in register_netdevice()")
> commit 10cc514f451a ("net: Fix null de-reference of device refcount")
> 
> [...]

Here is the summary with links:
  - [net,1/3] docs: net: explain struct net_device lifetime
    https://git.kernel.org/netdev/net/c/2b446e650b41
  - [net,2/3] net: make free_netdev() more lenient with unregistering devices
    https://git.kernel.org/netdev/net/c/c269a24ce057
  - [net,3/3] net: make sure devices go through netdev_wait_all_refs
    https://git.kernel.org/netdev/net/c/766b0515d5be

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


