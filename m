Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2D9877D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Feb 2019 22:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfBTWfD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Feb 2019 17:35:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:50338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbfBTWfD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Feb 2019 17:35:03 -0500
Subject: Re: [GIT PULL] One 5.0 docs fix
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550702103;
        bh=8ejO3t2qL1fTtQ8NHzc7Ndxkbhl1g5O84vIfPnXS8ok=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ktGyOCE8EfTUs04LANw6BCXpZRkylmWNVsWq/Q+AvW1sfqrG5ZISCJyhvhKguUsyO
         o9teeI4R7GAWXa3ZmBo5f1pXxXYu0LKccRsS/FwU5PiBrrjvP1RPIxwimeD1KB2xuW
         UM+ONY4KOY+7MiZoNAvzetMNn8N5CTlYMIb1katk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190220140859.122694ba@lwn.net>
References: <20190220140859.122694ba@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190220140859.122694ba@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.0-fix
X-PR-Tracked-Commit-Id: 0358affb5cd8bbd685a6ab163a36dd28a818da73
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f6163d67cc31b8f2a946c4df82be3c6dd918412d
Message-Id: <155070210301.24450.13385064231161991074.pr-tracker-bot@kernel.org>
Date:   Wed, 20 Feb 2019 22:35:03 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Wed, 20 Feb 2019 14:08:59 -0700:

> git://git.lwn.net/linux.git tags/docs-5.0-fix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f6163d67cc31b8f2a946c4df82be3c6dd918412d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
