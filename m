Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C8C7EE23
	for <linux-doc@archiver.kernel.org>; Wed, 24 May 2023 04:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbjEXEUY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 May 2023 00:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbjEXEUX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 May 2023 00:20:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CB5FC
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 21:20:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BBFA638A5
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 04:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79BD0C4339B;
        Wed, 24 May 2023 04:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684902019;
        bh=LeExo37RJCv2OA/fAmm9mViNPPrjHuHTxxzO1Fj1jBw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RWGP8hxrDOsAyZbvvQiEBT8To/t3poeLc3Ekn+TInvSsm70c8pBQe97RbmbPA/Yt0
         abvZD1NmdkL3a7RpthpjIXI+E80NsAFAhKpxA1sJM1k0pwjYMD2zuhfx/kAa8afmpC
         jjh/4wQLHoRbtQdFa6+7WNMH7VXa8iEtF7Hwh1jELRSW86yH4noBQvu8OnYMW2RNE1
         kCD6q+LVbDUTr5gUPT5MsC2thYP7DMO4lKa8RsaEKqanPLObsu5/G6JcNdjjTVY1M6
         BObJwQjz0lr4sSvEJtmK1R0Gtgaj7Fa/Z44nZhA7OAUq4f3g/PwBUsX/juxbqXps5D
         BByMVFx3mnrDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 60E37E22AE9;
        Wed, 24 May 2023 04:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: netdev: document the existence of the mail bot
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168490201939.21222.16656430574097651589.git-patchwork-notify@kernel.org>
Date:   Wed, 24 May 2023 04:20:19 +0000
References: <20230522230903.1853151-1-kuba@kernel.org>
In-Reply-To: <20230522230903.1853151-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, andrew@lunn.ch, corbet@lwn.net,
        linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 22 May 2023 16:09:03 -0700 you wrote:
> We had a good run, but after 4 weeks of use we heard someone
> asking about pw-bot commands. Let's explain its existence
> in the docs. It's not a complete documentation but hopefully
> it's enough for the casual contributor. The project and scope
> are in flux so the details would likely become out of date,
> if we were to document more in depth.
> 
> [...]

Here is the summary with links:
  - [net] docs: netdev: document the existence of the mail bot
    https://git.kernel.org/netdev/net/c/7e7b3b097a9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


