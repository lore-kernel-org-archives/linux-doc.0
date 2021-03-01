Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FD9C433E9
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 22:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53C4E601FF
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 22:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237891AbhCAWPn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 17:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238411AbhCAWNh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Mar 2021 17:13:37 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74782C061756;
        Mon,  1 Mar 2021 14:12:57 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E53B42BA;
        Mon,  1 Mar 2021 22:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E53B42BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614636777; bh=F9P99DsgHbCwVM4++wlvvEKHdYaFXK/MFSqiZkjVIgI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FqNzZVXo1E1c1Akv+Scvt5b1NdTwqhm2qxEY5ITdxTi17Mu8Hokc1K4Z5lG4duGpE
         RAikd6J121LippGoNZXicnPEcAdEn0GRa31cKZDit5WFMasNeW/F+OnqTogZYHTV/l
         OdTa/Ii9IvlQ5hEu5//TWVXMNyfHETuTUbKMs3sFQjg+WH6kRx8ylRPXfxaevwrnTv
         GeR8Klo0cxhrE9aI6xRbPu4sXXKVMCBA5uYowi8yuXb+AtjEyc+SnNFzw1Aq0Xs4lB
         l9OZgXFs3r2pKkiOcEW6CvygmzRGnn72fjT8Rt+iuHDoCMbhBq0h7p6B2DufAw3NnN
         lgkuaZH/SKOhg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] docs: arm: Improvements to Marvell SoC
 documentation
In-Reply-To: <20210215220839.423709-1-lkundrak@v3.sk>
References: <20210215220839.423709-1-lkundrak@v3.sk>
Date:   Mon, 01 Mar 2021 15:12:56 -0700
Message-ID: <87zgzm1q1j.fsf@meer.lwn.net>
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
> Compared to v2, the patches "[PATCH v2 2/5] docs: arm: marvell: fix 38x
> functional spec link" and "[PATCH v2 5/5] docs: arm: marvell: rename
> marvel.rst to marvell.rst" have been removed, because analogous patches
> have already been applied. Also, more dead links have been removed,
> reducing the count of links removed in [PATCH v3 1/3] to one.
> Detailed changelogs in individual patches.

I've applied parts 1 and 3; since there is evidently an archive link for
the one killed in part 2, I left that out.

Thanks,

jon
