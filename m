Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20C557D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Sep 2019 23:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfIQXkT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Sep 2019 19:40:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbfIQXkT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Sep 2019 19:40:19 -0400
Subject: Re: [GIT PULL] Documentation for 5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568763618;
        bh=Ne0yRbdT8PpLUK/TPK3mDvpPWz3ogAq3s+79svNELtw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=EIXEkLp3nWp3SiqWA/lWfqmIrd4Cqu+No4b+UnwNL7VlfXMRZJ8HyR9DIV6EbNTfw
         2rFzxQLGu2H92adjC1mUvcO7E7RFAGQ3SAZyYnybQ3g/xfMKpPK20pnUuCo/YfPrzt
         k+0YAglrMXEEIS3Pju36k8h9Xs/CImbX8v+/yrew=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190916001918.7c9b69f7@lwn.net>
References: <20190916001918.7c9b69f7@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190916001918.7c9b69f7@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.4
X-PR-Tracked-Commit-Id: fe013f8bc160d79c6e33bb66d9bb0cd24949274c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c672abc120a55f678e5571ae2ee93f06ca4d7f9
Message-Id: <156876361890.26432.9962895084250559819.pr-tracker-bot@kernel.org>
Date:   Tue, 17 Sep 2019 23:40:18 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Mon, 16 Sep 2019 00:19:18 -0600:

> git://git.lwn.net/linux.git tags/docs-5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c672abc120a55f678e5571ae2ee93f06ca4d7f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
