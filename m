Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181A3C83F01
	for <linux-doc@archiver.kernel.org>; Mon, 28 Aug 2023 01:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjH1BK5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 27 Aug 2023 21:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjH1BKf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Aug 2023 21:10:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B78AA
        for <linux-doc@vger.kernel.org>; Sun, 27 Aug 2023 18:10:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 933FF60EEF
        for <linux-doc@vger.kernel.org>; Mon, 28 Aug 2023 01:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8301C433CB;
        Mon, 28 Aug 2023 01:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693185032;
        bh=cfZiD3y3ugpsmjINH8YbPrPJZ/R9Oz49mvJK+G06CNI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oKmDPZ32ZTkxIV2AOR28nVjWwteY6vPGuJiRKLVq6OPdLiRq5bNtapaIc2apZcYpF
         3w5URoizOMLULYib7XktNf0p4AsnJ3kyLqTeZ582dW5dDyntl9sGMlaHAKaCMOlBVh
         DN2Wp0XuOKc+aPGlfQRYby4feLu3KHyiWbjNSvngC8wnBUbE8apdOe93UL2+yKnJpv
         5SO23MXuWMLD8A3SazsqgdrAyDKxZ5NA9U5nLhsMfkyfry6uVyTQxrvRACnywmle0l
         Vk4iWJeSakEiC1z8amJHi6YeB4+dBgAP95Qr4c6LpWNXatvg2tKAWPWSrSQ9eeabCL
         aPcJvsB+cAWRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CAF0FE44466;
        Mon, 28 Aug 2023 01:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 00/12] tools/net/ynl: Add support for netlink-raw
 families
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169318503182.15537.7692763414392804985.git-patchwork-notify@kernel.org>
Date:   Mon, 28 Aug 2023 01:10:31 +0000
References: <20230825122756.7603-1-donald.hunter@gmail.com>
In-Reply-To: <20230825122756.7603-1-donald.hunter@gmail.com>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, kuba@kernel.org, davem@davemloft.net,
        edumazet@google.com, pabeni@redhat.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, sdf@google.com,
        arkadiusz.kubalewski@intel.com, donald.hunter@redhat.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Aug 2023 13:27:43 +0100 you wrote:
> This patchset adds support for netlink-raw families such as rtnetlink.
> 
> Patch 1 fixes a typo in existing schemas
> Patch 2 contains the schema definition
> Patches 3 & 4 update the schema documentation
> Patches 5 - 9 extends ynl
> Patches 10 - 12 add several netlink-raw specs
> 
> [...]

Here is the summary with links:
  - [net-next,v6,01/12] doc/netlink: Fix typo in genetlink-* schemas
    https://git.kernel.org/netdev/net-next/c/c4e1ab07b557
  - [net-next,v6,02/12] doc/netlink: Add a schema for netlink-raw families
    https://git.kernel.org/netdev/net-next/c/ed68c58c0eb4
  - [net-next,v6,03/12] doc/netlink: Update genetlink-legacy documentation
    https://git.kernel.org/netdev/net-next/c/294f37fc8772
  - [net-next,v6,04/12] doc/netlink: Document the netlink-raw schema extensions
    https://git.kernel.org/netdev/net-next/c/2db8abf0b455
  - [net-next,v6,05/12] tools/ynl: Add mcast-group schema parsing to ynl
    https://git.kernel.org/netdev/net-next/c/88901b967958
  - [net-next,v6,06/12] tools/net/ynl: Fix extack parsing with fixed header genlmsg
    https://git.kernel.org/netdev/net-next/c/fb0a06d455d6
  - [net-next,v6,07/12] tools/net/ynl: Add support for netlink-raw families
    https://git.kernel.org/netdev/net-next/c/e46dd903efe3
  - [net-next,v6,08/12] tools/net/ynl: Implement nlattr array-nest decoding in ynl
    https://git.kernel.org/netdev/net-next/c/0493e56d021d
  - [net-next,v6,09/12] tools/net/ynl: Add support for create flags
    https://git.kernel.org/netdev/net-next/c/1768d8a767f8
  - [net-next,v6,10/12] doc/netlink: Add spec for rt addr messages
    https://git.kernel.org/netdev/net-next/c/dfb0f7d9d979
  - [net-next,v6,11/12] doc/netlink: Add spec for rt link messages
    https://git.kernel.org/netdev/net-next/c/b2f63d904e72
  - [net-next,v6,12/12] doc/netlink: Add spec for rt route messages
    https://git.kernel.org/netdev/net-next/c/023289b4f582

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


