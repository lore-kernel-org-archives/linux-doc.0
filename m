Return-Path: <SRS0=n+aG=DT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51768C433DF
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 23:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1345321BE5
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 23:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602546617;
	bh=PFxcfnuYkMRy4JqihHf8jMqmmBOGezqQ9Vjun9KGwMU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=WfFzYfljmsnKUGEUxUApRKe/Xm840kwkphAa43JFzTD+h4OjId0BAcAZaIGT3fOL6
	 dErCipbzDZhLG8ASgKg2GCZYEeeJGloUpwltz1GN2ojwkJWH14cxlvvS4oQxt6OvTv
	 6jvSsFRB3hEeaC6G6/lSdt1ujBOcseo6Uf9R724I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390774AbgJLXuI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Oct 2020 19:50:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:49282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389654AbgJLXuG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Oct 2020 19:50:06 -0400
Subject: Re: [GIT PULL] Documentation for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602546605;
        bh=PFxcfnuYkMRy4JqihHf8jMqmmBOGezqQ9Vjun9KGwMU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gwlrHcRHejGvb4cjZJgc6Pc+XVtQJQdVB7wqQ6Lz50tkU1HoyASNCzIa939ld3uot
         UG/1KJl7ue130zSarlZ6HEPWiS6zMRVcbnoDbfZpC4HweROFnoHv3IfSiThCm4XYnM
         B0JyD6BfmrE04WPB8q4zpKE1ouNYpjgfBZBcWC7M=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201012133042.688ee6a6@lwn.net>
References: <20201012133042.688ee6a6@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201012133042.688ee6a6@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.10
X-PR-Tracked-Commit-Id: 4fb220da0dd03d3699776220d86ac84b38941c0c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 50d228345a03c882dfe11928ab41b42458b3f922
Message-Id: <160254660550.9131.14565875654021588152.pr-tracker-bot@kernel.org>
Date:   Mon, 12 Oct 2020 23:50:05 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Mon, 12 Oct 2020 13:30:42 -0600:

> git://git.lwn.net/linux.git tags/docs-5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/50d228345a03c882dfe11928ab41b42458b3f922

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
