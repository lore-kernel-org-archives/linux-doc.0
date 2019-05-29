Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B9497D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 21:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfE2VpP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 17:45:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbfE2VpP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 29 May 2019 17:45:15 -0400
Subject: Re: [GIT PULL] Fixes for sphinx 2.0 docs build failures
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559166315;
        bh=MslAkn0MjKtReq/x6B4kRuRZHNL2td+pBIK0ZIkcHME=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=sIZqpnZVbBRDbZma5yyNI9XS7j8ZM5fZw2Rl+q440CLzSqv3/8XSjnwPr4vNoTMpW
         2Bqnwzmwqd9dR6AJSwgzX1shvSmWBKMFgip0IdFJ+ewN9gotLvt9qRDaU/WD3ASEvd
         tGp3Ik0XlJ2aeMim3VTHLL+sgg0OHO0CvhcZa3dM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190529095408.1429a5ab@lwn.net>
References: <20190529095408.1429a5ab@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190529095408.1429a5ab@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.2-fixes2
X-PR-Tracked-Commit-Id: 551bd3368a7b3cfef01edaade8970948d178d40a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bec7550cca106c3ccc061e3e625516af63054fe4
Message-Id: <155916631500.28954.14280541442507821303.pr-tracker-bot@kernel.org>
Date:   Wed, 29 May 2019 21:45:15 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Wed, 29 May 2019 09:54:08 -0600:

> git://git.lwn.net/linux.git tags/docs-5.2-fixes2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bec7550cca106c3ccc061e3e625516af63054fe4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
