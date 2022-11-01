Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DB4C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  1 Nov 2022 22:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiKAWNO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Nov 2022 18:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbiKAWNL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Nov 2022 18:13:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0966E1A228;
        Tue,  1 Nov 2022 15:13:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 98FF661746;
        Tue,  1 Nov 2022 22:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE2F6C433C1;
        Tue,  1 Nov 2022 22:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667340790;
        bh=Vok6on786QzsZly4amEdPRAnd7OWmpRL2s+ad9j9NM4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=BZiwYDczsumoDNj+l5zjSeA9gotOLAmxiOSvXiCTVgJJzOd+Z7wXqS739DK4hZfeq
         8XEQWL0xOS98DwToZVdwhwdJwEybBme//jxr6NBOSXdzdW/YJafbj0N18yYrDS9Bjx
         7nxPQScZlQ715J4wN9tdmSqJiNy43DP362TJ37EmW63v/U6bMilrTe0vcOrk8zwNTC
         Db/AFiLf4HEiQiZXXnrVPARveFyJ/kT5utLD06mNULiFoEQbaAJJwbi2SE7/HFHs+4
         LVNupsa9SYJGouubIggUL1Tps0EBRJnxp9hpC3Mp8ieK6Sai3lQ65cbcBfaCfCabDs
         tAVGipR8dNigw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8C0EE270D5;
        Tue,  1 Nov 2022 22:13:09 +0000 (UTC)
Subject: Re: [GIT PULL] A handful of documentation fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <87o7tqxrg7.fsf@meer.lwn.net>
References: <87o7tqxrg7.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87o7tqxrg7.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.1-fixes
X-PR-Tracked-Commit-Id: 2f3f53d62307262f0086804ea7cea99b0e085450
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8f71a2b3f435f29b787537d1abedaa7d8ebe6647
Message-Id: <166734078987.28322.4032474177368618408.pr-tracker-bot@kernel.org>
Date:   Tue, 01 Nov 2022 22:13:09 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Tue, 01 Nov 2022 16:03:52 -0600:

> git://git.lwn.net/linux.git tags/docs-6.1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8f71a2b3f435f29b787537d1abedaa7d8ebe6647

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
