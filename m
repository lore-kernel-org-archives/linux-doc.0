Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2877CC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Sep 2021 23:31:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0C3060FDA
	for <linux-doc@archiver.kernel.org>; Wed,  8 Sep 2021 23:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbhIHXcy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Sep 2021 19:32:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:50992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234742AbhIHXcx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 8 Sep 2021 19:32:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 794876044F;
        Wed,  8 Sep 2021 23:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631143904;
        bh=3Azri9URETVbjHfVCK3+IYMzbBlJxRKKjVeRzZYWWGs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=G2L5hw2reCpzh61h7Jo2RfvuEFv8RZfZSnPUUMuaUCb3zYeJMteptX1JhSUkWAEcx
         0WTg223ygek3scXjyEdhVGkqzXdB5j6CleAcFVEDAldXfFo+pY9n7C6EMuHacpOq2D
         LJJgqZHKnO46/E9sW60fd9AA1zpXsK++qhUVCizK/llfNVWN02DATTkPRB75wHh2DT
         8HUWcxCdZiRSJSIoEBPzAtdo+XyCiV375sg/SAbIfQQ7CRmXluB1QpP76qwdedxh0u
         89M1DF0va3FGewVv9snRfYrsqIKPbX2KPQpsGBF2a1sqhymC+SiZyynJNkamDlHMJ3
         4knGwLq5hJjLw==
Subject: Re: [GIT PULL] More documentation changes for 5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <87ilzaq0ze.fsf@meer.lwn.net>
References: <87ilzaq0ze.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ilzaq0ze.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.15-2
X-PR-Tracked-Commit-Id: 7c5c18bdb656057cb76fabfa1a74b793ac49da35
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f4b9289bad354b606190a4cd54d5222b4e41d98
Message-Id: <163114390436.13056.3844635275419991590.pr-tracker-bot@kernel.org>
Date:   Wed, 08 Sep 2021 23:31:44 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Wed, 08 Sep 2021 14:13:57 -0600:

> git://git.lwn.net/linux.git tags/docs-5.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f4b9289bad354b606190a4cd54d5222b4e41d98

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
