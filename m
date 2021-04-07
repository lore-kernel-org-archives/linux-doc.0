Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82339C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 00:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C0A5613D5
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 00:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241735AbhDGAUV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 20:20:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232814AbhDGAUV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 20:20:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F0224610FB;
        Wed,  7 Apr 2021 00:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617754813;
        bh=a+nxXapFw3wpNBlAwTQ00WbTA5s7hGD+AeytfxxAFWU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Av46AZYY0YMEsKUQLSub5ehCqnoF0sgnkF/Gid9HaIMzY606rHmp/Ne5bsLUSmWmy
         VFfxVYVzDuuyGMARvC/rDasFhPl3fVNqMypOgBpXhashgXT9wXiZ1fqunlML3O6yl9
         HhxzxcKLeqLSSObJSYtplcsGugD3fdKOl6WC+EOVbzi51QTkM3gH20RphOM60Y8tBn
         XnUP0bxH6doreTjsSg3XoylVdj6c7BOQyYZq0l+Or24p7+sKXhhgnNswM5IpptdTCW
         /+HQg8XNEnLIluF4Zw7UOD4PMDWnK23fThVxlUx/HZRFX/aT6fQYWPAmF77xLayD4v
         QJLeHGbDyJlnw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] docs: ethtool: correct quotes
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161775481293.4854.7614248503758645642.git-patchwork-notify@kernel.org>
Date:   Wed, 07 Apr 2021 00:20:12 +0000
References: <20210406225931.1846872-1-kuba@kernel.org>
In-Reply-To: <20210406225931.1846872-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, mkubecek@suse.cz, andrew@lunn.ch
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue,  6 Apr 2021 15:59:31 -0700 you wrote:
> Quotes to backticks. All commands use backticks since the names
> are constants.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> Targeting net-next to avoid conflicts with upcoming patches.
> 
> [...]

Here is the summary with links:
  - [net-next] docs: ethtool: correct quotes
    https://git.kernel.org/netdev/net-next/c/0b35e0deb5be

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


