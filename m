Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FCAEB64DA
	for <linux-doc@archiver.kernel.org>; Tue, 18 Jul 2023 09:10:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjGRJKX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Jul 2023 05:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjGRJKX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jul 2023 05:10:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7070DE4C;
        Tue, 18 Jul 2023 02:10:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07E65614CA;
        Tue, 18 Jul 2023 09:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6694DC433C7;
        Tue, 18 Jul 2023 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689671421;
        bh=yBxieB02Q43x6OYM38BcWUL2jrFZGxlD04R9OB038LE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P9ld01B5Huin4iUgDmdwZy2qv7NCZEoCLlbR61oI7Kby0piBnCiI8KANiLYckdPg9
         zv+1d/PW7Fy9kn1noJWgVfZsrC8v2tkMNRt+z1gc1VtWaPPk+D2XDCyFZk38yYxoub
         py5Z99T31mBObhI+zDylJmr2D9bNiprMDnbPjhaSU56bDYV3Y8iJ4HWWjbGGAxEX4t
         WJMTPXzsIz7eZuofyFbEMLkg6zSRcjtMFTMUNBCiKoorTTzLqneS0yNSOLLFua8qwk
         /u4tLuR4DRWg1tFk3AaBORcWjhc8w/kUx9dP1rfTXPQgngy8eqPYxMMaSy9DsLf/23
         CLiZwWRn0vleQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B771C64458;
        Tue, 18 Jul 2023 09:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH next-next v3] netconsole: Append kernel version to message
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168967142123.21513.16830020700570524475.git-patchwork-notify@kernel.org>
Date:   Tue, 18 Jul 2023 09:10:21 +0000
References: <20230714111330.3069605-1-leitao@debian.org>
In-Reply-To: <20230714111330.3069605-1-leitao@debian.org>
To:     Breno Leitao <leitao@debian.org>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, leit@meta.com,
        davej@codemonkey.org.uk, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 14 Jul 2023 04:13:29 -0700 you wrote:
> Create a new netconsole runtime option that prepends the kernel version in
> the netconsole message. This is useful to map kernel messages to kernel
> version in a simple way, i.e., without checking somewhere which kernel
> version the host that sent the message is using.
> 
> If this option is selected, then the "<release>," is prepended before the
> netconsole message. This is an example of a netconsole output, with
> release feature enabled:
> 
> [...]

Here is the summary with links:
  - [next-next,v3] netconsole: Append kernel version to message
    https://git.kernel.org/netdev/net-next/c/c62c0a17f9b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


