Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECFDC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 17:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiJCRcu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 13:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiJCRcL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 13:32:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D193D5AA;
        Mon,  3 Oct 2022 10:32:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A37B61195;
        Mon,  3 Oct 2022 17:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD8D3C433D7;
        Mon,  3 Oct 2022 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664818324;
        bh=qttt7Uxs0sBdlwFose7t3BZQ/ldcS5H9IGLBii+YX9o=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ujC6ZVD/dbFnl0IgVNkvKAj1kJa1e8+UjjaG+i9YF8VW4F9d1i2yrfTbWCZAJs3Yd
         052PmllQQRi8PBHQNcS0qVeXAlBYOU6TBfPSde/XhZJYA8EHY9T6hdShouJzCzP4Aa
         69QM+lTaHVO2m8a5U4YGYaKsX+7cvL3gd2DTquG+8NjvqGjNc43//ogGHTivbVfvmj
         Nf+V7debr55RGt0bx6UasE7QOCd9/m9ju4yJ067v7naLdrLj4lAVLalplMzav/UbfI
         M0h0Euey+cLs1Nu+1zAnLOwVODt92G7ftBJ13zZoNuvdlInJIX4wcDrHrjj2Hypuxx
         I9eCx017+/t9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CCD4CE49FA7;
        Mon,  3 Oct 2022 17:32:04 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation changes for 6.0
From:   pr-tracker-bot@kernel.org
In-Reply-To: <87k05gga6t.fsf@meer.lwn.net>
References: <87k05gga6t.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87k05gga6t.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.1
X-PR-Tracked-Commit-Id: 69d517e6e21099f81efbd39e47874649ae575804
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f3dfe925f9548a4337883926db542ccf4ca55fe1
Message-Id: <166481832483.20277.4120335695055989668.pr-tracker-bot@kernel.org>
Date:   Mon, 03 Oct 2022 17:32:04 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Mon, 03 Oct 2022 10:10:18 -0600:

> git://git.lwn.net/linux.git tags/docs-6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f3dfe925f9548a4337883926db542ccf4ca55fe1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
