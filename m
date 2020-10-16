Return-Path: <SRS0=BNGE=DX=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75868C433DF
	for <linux-doc@archiver.kernel.org>; Fri, 16 Oct 2020 22:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CF80221EB
	for <linux-doc@archiver.kernel.org>; Fri, 16 Oct 2020 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602886475;
	bh=M0aAyDxVvnvmqVlN5x9Wl3j8xqrcyEPTBdj62UDYQ2M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=X451zBBnXI2reSWU/vZxMZHRZMslnJ280tQT81qCGvvGKsSH7uUoBsTO9lUAQ/EpJ
	 yzfR/13hcU9zSP8s4baYx9cBl5e9KvXEJiKTHaYPWO724+lMyRCyqxME8zOcOAxa4D
	 ZEP+Jt4FuWvdLO79pGMBVADBjtmaB0D+VGQfbJuQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390066AbgJPWOe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Oct 2020 18:14:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388993AbgJPWOd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Oct 2020 18:14:33 -0400
Subject: Re: [GIT PULL for v5.10-rc1] docs: fix building warnings and add
 support for Sphinx 3.1+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602886472;
        bh=M0aAyDxVvnvmqVlN5x9Wl3j8xqrcyEPTBdj62UDYQ2M=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=eWqPaGV7HPrJlPFDOm4qtTb/Mw8JPxh96CkCu8Dsp1zs5+yvDj8Z3yESB8F+RGsEO
         xDNXT+XLBLZEC4xvl9rTkXncpd3H6LRBS7CvzyrTiWUaMzyuiYhg6CcDkE9DvCQ8nk
         PVncdDvDM0IGEDfEWp8IbIkSgVXs+BtOa49TDrhE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201016091048.574b2eeb@coco.lan>
References: <20201016091048.574b2eeb@coco.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201016091048.574b2eeb@coco.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/docs/v5.10-1
X-PR-Tracked-Commit-Id: 3e2ac9798e13ad1f52d735ea2ea1d252cb140ae5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54a4c789ca8091ab8fcd70285caeee2c5bc62997
Message-Id: <160288647259.19132.3173461329672086595.pr-tracker-bot@kernel.org>
Date:   Fri, 16 Oct 2020 22:14:32 +0000
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Docs Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Fri, 16 Oct 2020 09:10:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/docs/v5.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/54a4c789ca8091ab8fcd70285caeee2c5bc62997

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
