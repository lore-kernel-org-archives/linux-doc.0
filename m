Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D16C388F7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 18:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBBC022226
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604426412;
	bh=Rz40gFbIKRRqBXyfBmMwEA3bLGYQr2L/1zeqbCuDfTY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=SEDRfYZKnCC2Pqcp9oAHGfSsH256qWaU8I+ZZpr87XNscQgA1UnK8gNu5UfIWxqjU
	 tmfRnLCRituvY/9MtTMtm5prhqQ1Astp8WcvFxH1H2qJpKLpPo3QEArmcxvEXoqIKR
	 /xQVdeqjgKN0UvTF7hSn0Rvrqt1u9QRldphLF6o4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgKCSAJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:00:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:33292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727706AbgKCSAI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:00:08 -0500
Subject: Re: [GIT PULL] Documentation fixes for 5.10-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604426408;
        bh=Rz40gFbIKRRqBXyfBmMwEA3bLGYQr2L/1zeqbCuDfTY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=DhKGIaQnJCZ/bFaU3HBd9M9UhpYChMQVlM6CHXK5UgnktCD4nWeZCBREG/v4nARLY
         lhIg5k4NyDoXsi3c554kJCsssqTPtpFzMfcJg3oNSK3pTpPimXu3F1FJloO9DWdywL
         seBMp/aBZFijvyGWeSrdcPuyKDGULldtguspeXm8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201103083006.06d519fc@lwn.net>
References: <20201103083006.06d519fc@lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201103083006.06d519fc@lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.10-3
X-PR-Tracked-Commit-Id: 4f3e69060dc9cc8f14ad9e172ada7120dc76445b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce2e33ba4163c66ff89d2c0f2a9a51214a122e27
Message-Id: <160442640855.29492.14125638284787290059.pr-tracker-bot@kernel.org>
Date:   Tue, 03 Nov 2020 18:00:08 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Tue, 3 Nov 2020 08:30:06 -0700:

> git://git.lwn.net/linux.git tags/docs-5.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce2e33ba4163c66ff89d2c0f2a9a51214a122e27

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
