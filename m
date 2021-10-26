Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB68DC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 15:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C61B760F92
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 15:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhJZPkA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236969AbhJZPj7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 11:39:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205CEC061745
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 08:37:34 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C48A0844;
        Tue, 26 Oct 2021 15:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C48A0844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1635262653; bh=BO0FH4NpsoKzz5ysD7mAWzUqzUOG5vEv7ZV5CUFRW8M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Xu05Dp33O+L+ESv8Lyr5fVBdlaEHL41KZPGiVMpDabg5wLbRNa59cDhn3DOrOpmmT
         ir4nHpsJeA/K+dc3EINXSs+Xf2TwZD+mQTDeX5kj/7lSFx0s/J28LNEWYBPxle5m6D
         4HRT7/57sg37DAfsXDgULCUaf01alh/nn+42iQpdOPwReQEb75ljkFWZqgFkz5WrhK
         AhWO53JBRaRSkka5MkVLlLYzGCsrqBD6Yry37DwHDTOYhrsxVUguxEMjn+N2+d0OiI
         XqO4PHTAqS63t3qgUcBjqP+1fZ7DBt7s0wpqmkQcYeroBxkNwBwI4eCbY7Y9jiuYCM
         2d6xEuewK+D9w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
        chao@kernel.org
Cc:     linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        Fengnan Chang <changfengnan@vivo.com>
Subject: Re: [PATCH] f2fs: fix f2fs.rst build warning
In-Reply-To: <20211023025833.216030-1-changfengnan@vivo.com>
References: <20211023025833.216030-1-changfengnan@vivo.com>
Date:   Tue, 26 Oct 2021 09:37:33 -0600
Message-ID: <87ee87g5ky.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fengnan Chang <changfengnan@vivo.com> writes:

> fix f2fs.rst build warning.
>
> Fixes: 151b1982be5d (f2fs: compress: add nocompress extensions support)
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>  Documentation/filesystems/f2fs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

"Fix a warning" is almost never a good changelog message; you are fixing
a problem that provoked a warning.  I rewrote the changelog to:

  The docs build was generating this warning:

    Documentation/filesystems/f2fs.rst:306: WARNING: Block quote ends without a blank line; unexpected unindent.

  Remove the extra white space that was confusing sphinx.

Applied, thanks.

jon
