Return-Path: <SRS0=VwwX=BX=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB61C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 13 Aug 2020 20:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 450C220715
	for <linux-doc@archiver.kernel.org>; Thu, 13 Aug 2020 20:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597352348;
	bh=OJn82vLl4fFMo2GhZtXhSmwvILS0DfzST7/ebcn9ZXA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=hrJvVvSDEno5G3kCu9wOAVlMY2Efx87HidZREXSmL4DrkbWYa4Mn8GVYQTgKrMdDf
	 RkTEkjunDl1TvJePePi3ZvgDOXYbdOWBi/PdGs4lOwCWLjNKAMYYcXkgDnV89x3mOg
	 98B+MitrkI3naReR9XBCMaxKuZMoyEJ8m9EFEHUg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgHMU7H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Aug 2020 16:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:32940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726499AbgHMU7H (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 Aug 2020 16:59:07 -0400
Subject: Re: [GIT PULL] Documentation fixes for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597352346;
        bh=OJn82vLl4fFMo2GhZtXhSmwvILS0DfzST7/ebcn9ZXA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=iJmwv/te1KZGynuVdpF04wZtWmBDlX227ebUvbrlDtkRanVR3JoTCC8GWsPYDMNCY
         SDsRD8DbbTJCNS5fcnrYM7vLdxn+s5UyOiUteMq+cu4V9Oqn4MagjBOWOXLcneKx8p
         1wxxAOt9TqdfUm7NfDTgMI7NuAJDiR4aXQhtmIT0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200813145207.0a4a3078@lwn.net>
References: <20200813145207.0a4a3078@lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200813145207.0a4a3078@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.9-2
X-PR-Tracked-Commit-Id: 1edcd4675e44dc0e6e3b34e8e29000d8a05f998c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dddcbc139e96bd18d8c65ef7b7e440f0d32457c2
Message-Id: <159735234672.28438.17329561494462832932.pr-tracker-bot@kernel.org>
Date:   Thu, 13 Aug 2020 20:59:06 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Thu, 13 Aug 2020 14:52:07 -0600:

> git://git.lwn.net/linux.git tags/docs-5.9-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dddcbc139e96bd18d8c65ef7b7e440f0d32457c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
