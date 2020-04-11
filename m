Return-Path: <SRS0=sG06=53=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4860CC2D0EC
	for <linux-doc@archiver.kernel.org>; Sat, 11 Apr 2020 01:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21DE220769
	for <linux-doc@archiver.kernel.org>; Sat, 11 Apr 2020 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586568036;
	bh=0f/nAFTAgDDnswn/TNW8Kf0GtwlMhB8VczbOZKXk/+Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=lgEVmtM0SoROkgVw9rkKWV/BEcJl+f5O4D3IvUHd4XvhvJp8qWRaOUhLYPPhnTcFf
	 J3LSwRYyblapQUl/N6tvYEImWbFVpTKNZxzoisjpXkvbvrFm4REDaw3a37DaIN/Can
	 bN8u0Kui37oOw7j0khpTTtZ0RcipA+ahDQAlbWjk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgDKBU2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Apr 2020 21:20:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbgDKBU2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 10 Apr 2020 21:20:28 -0400
Subject: Re: [GIT PULL] Documentation fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586568028;
        bh=0f/nAFTAgDDnswn/TNW8Kf0GtwlMhB8VczbOZKXk/+Q=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=RhCB5SsvxPCwtUdAZ/taBTG60HjK7pQ2mhuFPRLH9b6JRMv3jehlhw1d5qzZUDaa1
         vfIo+3hi0PdRCTiieJXr5gmeQOLidEGPlV9IC2UMJNvrJobROxWfNVef2wPwvK1ILP
         P3/rdblz+03ua2AbPgkkwD64inG2VBgIod83h3Ds=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200410102339.2a14df24@lwn.net>
References: <20200410102339.2a14df24@lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200410102339.2a14df24@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.7-2
X-PR-Tracked-Commit-Id: befacdcf47d4a19eb584ae5b43da40941e8e660c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca6151a9788e2cbb1a7b5d320dcf4f16a3b64477
Message-Id: <158656802822.16442.5995987901269942052.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Apr 2020 01:20:28 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Fri, 10 Apr 2020 10:23:39 -0600:

> git://git.lwn.net/linux.git tags/docs-5.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca6151a9788e2cbb1a7b5d320dcf4f16a3b64477

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
