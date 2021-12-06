Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2E5C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 17:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345257AbhLFR7y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 12:59:54 -0500
Received: from ms.lwn.net ([45.79.88.28]:53594 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243468AbhLFR7y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Dec 2021 12:59:54 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 52BAD2ED;
        Mon,  6 Dec 2021 17:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 52BAD2ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638813385; bh=zsNyYsKMcIcYOkUcsvRhjiavqU2dnrPsdcu2w4nfeHE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UWt0Hvxobbdc4skQofsXMUq65P9mSLhsnTyb+GDZ33GpiZr2eBt2k1oPV0UE74QRS
         xJnQuwBtkWapLBMQaB+7LxLkbIFrWjMc+PxW4GI2EdIYRfVccBiXfjgFf30ee7GhvP
         9wq/f18a8rCQ85Guai1N3SPcCPBxeLvzYhbCwkm852PqSNHd1TZzM+xEJUn9YCFZ8i
         gOLnSCFzwrZw5xyLVtAGN4Xp2DPa0CxFxQPt1wn1TXRYUDddrF5gHlTAeFtBucoyyy
         WHqHkJlwMNT8QeBr+tAQNbOAJ8Qbtat/jo4oMHlcVTH+M0rrt/ORKvRRvj8dJZYx0w
         Rh8SbLDCfJPxw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH 01/11] docs/driver-api: Reformatting serial ngsm
In-Reply-To: <6976a61ec50f837f482751c427af8598b30cc497.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
 <6976a61ec50f837f482751c427af8598b30cc497.1638706875.git.siyanteng@loongson.cn>
Date:   Mon, 06 Dec 2021 10:56:24 -0700
Message-ID: <87tufl39dj.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> Added necessary indents and blank lines, optimized typography in html documents.eg:
>
>  "1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl. 1.4 obtain base gsmtty number for the used serial port."
>
> Here's what they should have looked like:
>
>  1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
>
>  1.4 obtain base gsmtty number for the used serial port.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/driver-api/serial/n_gsm.rst | 246 +++++++++++-----------
>  1 file changed, 126 insertions(+), 120 deletions(-)

So that is a huge diffstat for just having inserted some blank lines and
such.  What did you do that makes it appear that so many lines have been
changed?  What change in the code sample, for example?

Thanks,

jon
