Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D08B47D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 29 Dec 2018 19:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbeL2TzS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 29 Dec 2018 14:55:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:34246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbeL2TzD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 29 Dec 2018 14:55:03 -0500
Subject: Re: [GIT PULL] Documentation for 5.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546113302;
        bh=aewzvD4LAtMtHRWPugCxZE8hgqFXXG7fYoGbgzsfSFY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=mQmFaQGkleU+EC5aIpeKCpqdtAM4JZUG2YaIhGKOFJtRtkPtWHnQO/LDYwMrYwJOS
         LKNciwOsXBo+RG985jXSGeq5mmG2uenk0/EXqL1QIPLjXNU20+SiGX2nVKip61MQAW
         D8mnCrWeK91WRNel4g1iNCJ9bFgjwoZU5MV4HXFY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20181228090622.4c210228@lwn.net>
References: <20181228090622.4c210228@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20181228090622.4c210228@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.0
X-PR-Tracked-Commit-Id: 942104a21ce4951420ddf6c6b3179a0627301f7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3868772b99e3146d02cf47e739d79022eba1d77c
Message-Id: <20181229195502.31407.90012.pr-tracker-bot@pdx-korg-gitolite-1.ci.codeaurora.org>
Date:   Sat, 29 Dec 2018 19:55:02 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Fri, 28 Dec 2018 09:06:22 -0700:

> git://git.lwn.net/linux.git tags/docs-5.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3868772b99e3146d02cf47e739d79022eba1d77c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
