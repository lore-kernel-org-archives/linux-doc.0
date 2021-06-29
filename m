Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2642C11F64
	for <linux-doc@archiver.kernel.org>; Tue, 29 Jun 2021 00:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BB1E61CED
	for <linux-doc@archiver.kernel.org>; Tue, 29 Jun 2021 00:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhF2ADv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Jun 2021 20:03:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:55508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230152AbhF2ADu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 28 Jun 2021 20:03:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8110661CC0;
        Tue, 29 Jun 2021 00:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624924884;
        bh=Nw6QNWARDSIscomuJp3dl3VHz7NsR8+jcWVtakuKWSA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=BTPAECLSzOG4sCpepRwb1CxRBFFrOT61OBXbsxE/vHoMfBpdAWEZTbDdmQsRvmrT0
         MYt49YEBbn7e9yFhCK8MOoXu2fLp7G6i7PZ3qaxDob+0wCgYtSoCOWv20OjyJM3B20
         J+kUMmMUbZKmk4Y8oydm3PrKyx1U2D5IVO/HOGO8vsPtGtjO/t2s4i2Sp4vLeSNB8Z
         FrENNXG7JrmMxUAyGuijoI6cW1U5cmknkVg1sHv9s1vhRjzJZzdrtElnJnPsKJ3IyH
         32xcUqQIu7qYaM/zOauaXQ7dTnAR6WGrEUWWQXOHSHZFq7qwIn2uIOMAgHJ3ej55JO
         +c9BhHIBoy9Qw==
Subject: Re: [GIT PULL] Documentation for 5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <87czs6ypio.fsf@meer.lwn.net>
References: <87czs6ypio.fsf@meer.lwn.net>
X-PR-Tracked-List-Id: <linux-doc.vger.kernel.org>
X-PR-Tracked-Message-Id: <87czs6ypio.fsf@meer.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-5.14
X-PR-Tracked-Commit-Id: 98cf4951842adbb03079dadedddf30b95e623cb0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 233a806b00e31b3ab8d57a68f1aab40cf1e5eaea
Message-Id: <162492488439.6641.6240379608669729681.pr-tracker-bot@kernel.org>
Date:   Tue, 29 Jun 2021 00:01:24 +0000
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pull request you sent on Mon, 28 Jun 2021 09:31:27 -0600:

> git://git.lwn.net/linux.git tags/docs-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/233a806b00e31b3ab8d57a68f1aab40cf1e5eaea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
