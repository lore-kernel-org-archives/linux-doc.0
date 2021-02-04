Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C0C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C261164FAA
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhBDVdk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 16:33:40 -0500
Received: from ms.lwn.net ([45.79.88.28]:51176 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230077AbhBDVdi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Feb 2021 16:33:38 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0CF885F5A;
        Thu,  4 Feb 2021 21:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0CF885F5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612474376; bh=P7aWeJh8DhGd5C6KcqKgeo3j5wbjvgl4UiraJpKWk3M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EF4bijglo7T3l9nMWMsCQgWFenqwbIXTkpF6SPb1ERyME3Oa6feakVXXCQxJFN8cw
         NDuXjSEk9Tiw1Qw7z1EqRepRgAJF/9WgxBesgB/kjpAF4qhBvplhR4RJvxtgnYOOAu
         VSr3fCZ6XfD5qVnnafYpZ+OrUxMYHpAPe0/1hJJh5Dq2cw1QTSkNc7stXX+vKDWdVV
         w6oM+L6PQEy4Gwzx/fzjuhajhEch8vQFMPEZ/+ynmHTPaxb8g1GMIFjcE4eHQ6rIEU
         wlD11qwFIj7jlXcuVmb3UAl81QBWJqg2J3nXAkKTo1NnmZdoim/SiV/LBkgVFNKYVk
         GiUU+NnHiEv7Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] docs: arm: Improvements to Marvell SoC
 documentation
In-Reply-To: <20210203235305.506528-1-lkundrak@v3.sk>
References: <20210203235305.506528-1-lkundrak@v3.sk>
Date:   Thu, 04 Feb 2021 14:32:55 -0700
Message-ID: <87h7mrfri0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Lubomir Rintel <lkundrak@v3.sk> writes:

> Hi,
>
> please consider applying the patches chained to this message.
>
> The objective is to deal with the a large amount of dead links to
> material that often comes handy in marvel.rst; and improve some details
> along the way.
>
> The most important change since v1 is the removal of "[PATCH 1/5] docs:
> arm: marvell: turn the automatic links into labels" patch and replacing
> the URLs inline instead. Detailed changelogs in individual patches.

So I've commented on parts 1 and 5.  If you send me versions of 2-4
based on docs-next, I'll apply them; for part 1, I'd like to see wayback
machine links or a good reason why we should just delete them even
though those links exist.

Thanks,

jon
