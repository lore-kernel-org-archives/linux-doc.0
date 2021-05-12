Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364BAC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 23:32:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10CA8613FE
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 23:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhELXda (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 19:33:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:33472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349917AbhELWtt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 18:49:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 22C1B613F6;
        Wed, 12 May 2021 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620859721;
        bh=RV5KSsyjN5zrSi+plYiBq6iX76+2FIQJwELu21I+eAo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=GlNvIpwmFeUU9H6B4pHeuBmhQBEtFpX6QkqHKzBlWsavbUxQLmfPKfEawX9VUac1I
         WV+dh4k9PgcgpVSanDTanqPZmqH9QamxsHnYdRBKLIM3s8viG9+H1pXEDAamkp0omE
         XsMEtg5FKuHk4JDwiiZ2xDCyhA8XJcKNBY7+EZksY78n6E3oad/FysR5THkVI3nrQn
         bJYWZUxUxLVLWwYIjVr+imq7Fv+Un27aJNVwOkoJaaxZIiN2estdo46XDlyIA/cQcD
         yz8lAmxd0XyAXjW+wRc+HuUUFAJgKfyULyRub0sqoUdV8//xpQRXp4NHnNqF/AwKm1
         qrzdNDdVqB/PQ==
Subject: Re: [GIT PULL] Documentation fixes
From:   pr-tracker-bot@kernel.org
In-Reply-To: <87mtszad8p.fsf@meer.lwn.net>
References: <87mtszad8p.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87mtszad8p.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.13-3
X-PR-Tracked-Commit-Id: 7240cd200541543008a7ce4fcaf2ba5a5556128f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1
Message-Id: <162085972110.12307.14492533564881183670.pr-tracker-bot@kernel.org>
Date:   Wed, 12 May 2021 22:48:41 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Wed, 12 May 2021 14:49:58 -0600:

> git://git.lwn.net/linux.git tags/docs-5.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
