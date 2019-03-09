Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CFF987D91B
	for <lwn-linux-doc@archive.lwn.net>; Sat,  9 Mar 2019 19:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfCITzV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 9 Mar 2019 14:55:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:56648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726753AbfCITzU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 9 Mar 2019 14:55:20 -0500
Subject: Re: [GIT PULL] Documentation for 5.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552161320;
        bh=al15/8SuNusjjtwDcL512VzDE5MiFCwyFZhXVi9FnP8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=E+hSBNx8yJvoNXF0hvec4fs04j09JPV6zoeze97Kva8dhrn6/XohtEfdY/hw5OwM7
         3txSEffZuunh4JBXakpBk0kPVT4/pSMYJtdZE0N7zynsKKKOwGIAYvC9sUPLZxHPzH
         Kun6WCADMQJidrsIGnzYcXh4Ge7gO5e7APdNvf/s=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190307151820.1fdd73b7@lwn.net>
References: <20190307151820.1fdd73b7@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190307151820.1fdd73b7@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.1
X-PR-Tracked-Commit-Id: 4064174becc09a5a2385a27c8a6fd40888b0e13c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1a29e857507046e413ca7a4a7c9cd32fed9ea255
Message-Id: <155216132031.23333.12855437492532761373.pr-tracker-bot@kernel.org>
Date:   Sat, 09 Mar 2019 19:55:20 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Thu, 7 Mar 2019 15:18:20 -0700:

> git://git.lwn.net/linux.git tags/docs-5.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1a29e857507046e413ca7a4a7c9cd32fed9ea255

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
