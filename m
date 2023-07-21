Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B755CEB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 21 Jul 2023 09:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjGUJA1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Jul 2023 05:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjGUJA0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Jul 2023 05:00:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E192D7C;
        Fri, 21 Jul 2023 02:00:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8815060FF6;
        Fri, 21 Jul 2023 09:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B10A7C433C7;
        Fri, 21 Jul 2023 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689930023;
        bh=d3bFSUvWr91gVcXF7JJcReHEGVVreHj7SrkoR+T7hm0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XOZIaQiQnHbhPctu9AlDlkS7QjUcCOCU1orAqt1ri+/gTjHWfJS7TwuTzKIMxVVbl
         g9mmi01sJgDDRJvYXc1shitnF/aKUj9MEGNEsSogQKqsFuo0Y9VbCDa+lQ6EfHbyok
         K+8xgB44fX6n02mjpGZWLhZsyBofN1qPL3QjAqsczeLz14ygS6W4DyI1QM462VITft
         tqBHVf2rQIV3d7lzDDfFKMhTyUYEusi167cvrz6voQRfNeWQDUEN/iZgIiYvVmapB6
         qXKbdHk9z40MemTQWle7l1B/69AWRwIUhsycGOYdExL662ImLFL664idAO3mIFHUQk
         4DOHRzWqg3DnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 91685E21EE0;
        Fri, 21 Jul 2023 09:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PatchV4 0/4] octeontx2-pf: support Round Robin scheduling
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168993002358.14749.10687127850006488208.git-patchwork-notify@kernel.org>
Date:   Fri, 21 Jul 2023 09:00:23 +0000
References: <20230719110443.15310-1-hkelam@marvell.com>
In-Reply-To: <20230719110443.15310-1-hkelam@marvell.com>
To:     Hariprasad Kelam <hkelam@marvell.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kuba@kernel.org, davem@davemloft.net,
        willemdebruijn.kernel@gmail.com, andrew@lunn.ch,
        sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
        jerinj@marvell.com, sbhatta@marvell.com, naveenm@marvell.com,
        edumazet@google.com, pabeni@redhat.com, jhs@mojatatu.com,
        xiyou.wangcong@gmail.com, jiri@resnulli.us, maxtram95@gmail.com,
        corbet@lwn.net, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 19 Jul 2023 16:34:39 +0530 you wrote:
> octeontx2 and CN10K silicons support Round Robin scheduling. When multiple
> traffic flows reach transmit level with the same priority, with Round Robin
> scheduling traffic flow with the highest quantum value is picked. With this
> support, the user can add multiple classes with the same priority and
> different quantum in htb offload.
> 
> This series of patches adds support for the same.
> 
> [...]

Here is the summary with links:
  - [net-next,PatchV4,1/4] octeontx2-pf: implement transmit schedular allocation algorithm
    https://git.kernel.org/netdev/net-next/c/f78dca691287
  - [net-next,PatchV4,2/4] sch_htb: Allow HTB quantum parameter in offload mode
    https://git.kernel.org/netdev/net-next/c/9fe63d5f1da9
  - [net-next,PatchV4,3/4] octeontx2-pf: htb offload support for Round Robin scheduling
    https://git.kernel.org/netdev/net-next/c/47a9656f168a
  - [net-next,PatchV4,4/4] docs: octeontx2: extend documentation for Round Robin scheduling
    https://git.kernel.org/netdev/net-next/c/6f71051ffbdb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


