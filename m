Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A82BEB64DC
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jul 2023 03:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbjGLDaY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jul 2023 23:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjGLDaX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jul 2023 23:30:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F2CE5C
        for <linux-doc@vger.kernel.org>; Tue, 11 Jul 2023 20:30:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 097F8616C9
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 03:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B2D4C433C9;
        Wed, 12 Jul 2023 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689132621;
        bh=F5OHTJmsvWsPBg+s9YyEg55V9UBjn5vIWY2oXUbvAEw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LFCdBy3SzsUx5B4A9P8Ux7idfyGF0ELTFUjTtmYv3TpymD1Omwxv7YFQar4jKAVgL
         8Cl2Gtn8f93a/LvlYXGRy4k0LAtwrXgV+bap1wpxIXcf4eFntXVmk2/VBOsSisChEG
         ywN3NISTjwArsuUvAf4MPDGgEHfiEpbGKwX7r5gzKJGwtkXuO3/JUPLTxiSMhqIOs1
         ovYN3ODnRj84Znbfver/TApoHT8oOfcDivsSM8n/Hxg04vvt3y9qS6/yupsnwTQ7mP
         doAylzVfiAC2O/eE4bXrZKw+xE9CzVEfOgY81uSQIQFLqmMMFIXGgdGLtiTpMnjTAh
         TpxqQeNmuUU2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D632E29F44;
        Wed, 12 Jul 2023 03:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: netdev: update the URL of the status page
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168913262124.27250.13393462797556521653.git-patchwork-notify@kernel.org>
Date:   Wed, 12 Jul 2023 03:30:21 +0000
References: <20230710174636.1174684-1-kuba@kernel.org>
In-Reply-To: <20230710174636.1174684-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, bpf@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 10 Jul 2023 10:46:36 -0700 you wrote:
> Move the status page from vger to the same server as mailbot.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> BPF folks, I see a mention of the status page in your FAQ, too,
> but I'm leaving it to you to update, cause I'm not sure how
> up to date that section is.
> 
> [...]

Here is the summary with links:
  - [net] docs: netdev: update the URL of the status page
    https://git.kernel.org/netdev/net/c/cf28792facaa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


