Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD5AC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 18:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345665AbhLFSMn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 13:12:43 -0500
Received: from ms.lwn.net ([45.79.88.28]:53598 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229880AbhLFSMn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Dec 2021 13:12:43 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BFD4A385;
        Mon,  6 Dec 2021 18:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BFD4A385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638814153; bh=EkmvEsjBQKV50hnAH02gTUxkrSfkmbccZBZMi/Tjfog=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=axfQuDCqlEaH8bHw515+GCuc5vmtLaE/WfYdiKUpjYxVGws0ZrRCrl08HP0a5btyh
         UA6d0n12PHHTAELZcvkcXHeCbkaDNyuUyiigGUH2fhEOouBOLLuNMWzjdTu5nvGhIp
         8BzMYRrj6J6ALtVxr1ElFk61TqS+vzaHuXxIMXG9HvyYr/pu2DRZ60TVIBvBEjxQHg
         0pqvAiwEKP+PpGZwHHdQ1vPwXeH4MbRoW1MEGzdZqQZEpiUDpivnluO3very6xbopo
         XQP3ghlWRW38DIXC+Sl6ZSMFtYQ802W5Vc8T2Vep9ioBpWrLU1LJU45vfQ0cojXka8
         UTpkvbSZLa0+A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH 00/11] docs: fix build warning
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
Date:   Mon, 06 Dec 2021 11:09:13 -0700
Message-ID: <87lf0x38s6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> I can't stand these red warnings anymore, especially when I'm testing my
> patches and looking for my own warnings in a sea of warnings. so, let's
> fix them!

So I totally approve of fixing docs build warnings, so thanks for doing
this work.  As I was working through the patches, though, I noticed that
these patches are against linux-next, so I can't take them into the docs
tree.  Instead, each fix needs to go into the tree that has introduced
the problem.

Thus, I encourage you to separate out this patch set, add an appropriate
Fixes tag to each, then send each separately to the same places where
the original patch went.  That should get these problems fixed before
they go into mainline.

Sorry to make more work, but I'd like to see these changes get in.  I've
commented on a couple of the individual patches as well.

Thanks,

jon
