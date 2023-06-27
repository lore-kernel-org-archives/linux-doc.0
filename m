Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3581EB64DC
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jun 2023 16:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjF0Qk0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jun 2023 12:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjF0QkZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 12:40:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB70FE5
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 09:40:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DF05611E9
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 16:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8C4DC433D9;
        Tue, 27 Jun 2023 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687884023;
        bh=9sAKz/w99GQ7YaxV0Q2pQyQWA0CCuy4epW7pYlNrcJ4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qdOdNu5v7lgA2oM3N7WmUAdKduOrp9BBV4LJInL/tHXk8wPWLixQnTxL/jCBPt8Q9
         3NOUKul8flcOJHlmHQMbmaygOykHV18tiDFnZjLznTVQmN28gSkOBlqh0NuZ7rsBLh
         in8a2nOY4OtQOm1gfSVY9vr6g7cA1AaRM1WidGuarKNVyFbyZ0T4SSlzU9pLl1DHs9
         Oecf6UdlR/S32u29GQ05JrUcLq89r4LLqEh57bYl//+m94NjP2RgeCs7YqFYCmhNjq
         Kwl501DbU01Tlx1vEjgokVmpszknMuObmkz+8zAVtRJe0glVzPKF1lWEXomnnZ3W2W
         gtJVz+f73GQ6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BE10C64457;
        Tue, 27 Jun 2023 16:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] phylink: ReST-ify the phylink_pcs_neg_mode() kdoc
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168788402356.21860.7572149702440920426.git-patchwork-notify@kernel.org>
Date:   Tue, 27 Jun 2023 16:40:23 +0000
References: <20230626214640.3142252-1-kuba@kernel.org>
In-Reply-To: <20230626214640.3142252-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, sfr@canb.auug.org.au, linux@armlinux.org.uk,
        linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 26 Jun 2023 14:46:40 -0700 you wrote:
> Stephen reports warnings when rendering phylink kdocs as HTML:
> 
>   include/linux/phylink.h:110: ERROR: Unexpected indentation.
>   include/linux/phylink.h:111: WARNING: Block quote ends without a blank line; unexpected unindent.
>   include/linux/phylink.h:614: WARNING: Inline literal start-string without end-string.
>   include/linux/phylink.h:644: WARNING: Inline literal start-string without end-string.
> 
> [...]

Here is the summary with links:
  - [net-next] phylink: ReST-ify the phylink_pcs_neg_mode() kdoc
    https://git.kernel.org/netdev/net-next/c/1a3f6fc430ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


