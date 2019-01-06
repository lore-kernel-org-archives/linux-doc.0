Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F0C57D04D
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 Jan 2019 02:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfAFCkT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 5 Jan 2019 21:40:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:36704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbfAFCkH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 5 Jan 2019 21:40:07 -0500
Subject: Re: [GIT PULL] Documentation fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546742407;
        bh=8tSN5fHHvIXucFtMrBlDvBPAqA0okPQ4/a67WErCKQA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=rdC9ULTG0pVQ6jNFQsZ39FfYNZwCxUpYSN97hxwsUR+MsZ3QgmEiRCHeCwKiWhrKe
         iRmzpDxfaxz3GtXTrKrzCppmmOYdiLhX/QOfpNOZUN8Zh/YGpppaL+bxnslCX0B/UN
         lTq9AVNrJ0lHIWF5QwA2xdTbCNJYpBAEMzVPajXY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190104150239.174f0f8a@lwn.net>
References: <20190104150239.174f0f8a@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190104150239.174f0f8a@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.0-fixes
X-PR-Tracked-Commit-Id: 93fb7f19985a08bbe3b76da0b35e97b6e472e4a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5aef86e089a2d85a6d627372287785d08938cbe
Message-Id: <20190106024007.13237.36931.pr-tracker-bot@pdx-korg-gitolite-1.ci.codeaurora.org>
Date:   Sun, 06 Jan 2019 02:40:07 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Fri, 4 Jan 2019 15:02:39 -0700:

> git://git.lwn.net/linux.git tags/docs-5.0-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b5aef86e089a2d85a6d627372287785d08938cbe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
