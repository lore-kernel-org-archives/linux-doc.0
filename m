Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EED6F7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 May 2019 20:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfEHUAQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 May 2019 16:00:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:53628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728437AbfEHUAQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 8 May 2019 16:00:16 -0400
Subject: Re: [GIT PULL] Docs for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557345616;
        bh=C+d1yH9VgO3t0OZXP58pkmMthnaVNiUYGHsMQZujw6o=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Kpy+RQ1ig0LSRxqO34LyKLJx45bjjdh4f1o2TogLKB/Rzy+cK2X8azccPTCsYR1ce
         oLzWwGbpfaDKlKz0eccYkNdLxQi/vRAHoKSPJLHlR1H8kkkzWCDR2loR4O1c7knuDn
         HyboCY8e1lhhMVoL29QVMtHrD/5iHsXfcvKWWE6c=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190508120450.197d4e8e@lwn.net>
References: <20190508120450.197d4e8e@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190508120450.197d4e8e@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.2
X-PR-Tracked-Commit-Id: d9defe448f4c7b88ca2ae636a321ef8970fa718d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c79f4cd441b27df6cadd11b70a50e06b3b3a2bf
Message-Id: <155734561595.27473.7812087348378002899.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 20:00:15 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Wed, 8 May 2019 12:04:50 -0600:

> git://git.lwn.net/linux.git tags/docs-5.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c79f4cd441b27df6cadd11b70a50e06b3b3a2bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
