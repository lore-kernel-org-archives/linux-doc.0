Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD3277D919
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 19:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729606AbfGITzO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 15:55:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729603AbfGITzN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Jul 2019 15:55:13 -0400
Subject: Re: [GIT PULL] Documentation for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562702112;
        bh=eB1qLdjo2ulElhEDKgNjSlyb+oQtb5f3Q7Ts+kBDFjc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=b9vEmawMjU2sffWucrwLLnyLtUJi0heYB5BU4GmOp/BE45T2HPGbdYchY1mB7RBpU
         wouacexNdJDNCoZBbZ+SeaAj+qKmQDMnbEDjwwpo12xgegOqnFBQCj52qLIQvqqnU6
         CMmHZXRpf+GvLwcsDCKBza/6wEO4yiZdZH9gQ6tA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190709090611.66911ed5@lwn.net>
References: <20190709090611.66911ed5@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190709090611.66911ed5@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.3
X-PR-Tracked-Commit-Id: 454f96f2b738374da4b0a703b1e2e7aed82c4486
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9a83bd2322035ed9d7dcf35753d3f984d76c6a5
Message-Id: <156270211223.21525.14304806713686758098.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 19:55:12 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Tue, 9 Jul 2019 09:06:11 -0600:

> git://git.lwn.net/linux.git tags/docs-5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9a83bd2322035ed9d7dcf35753d3f984d76c6a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
