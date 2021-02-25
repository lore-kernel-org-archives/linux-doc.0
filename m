Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60871C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 20:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17B4064F17
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 20:05:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhBYUFr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 15:05:47 -0500
Received: from ms.lwn.net ([45.79.88.28]:36580 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234087AbhBYUFg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Feb 2021 15:05:36 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B4C3177F;
        Thu, 25 Feb 2021 20:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4C3177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614283491; bh=lFhsGiaPaFrLP7bCx4x5oX0VuWHZvAm6Q4Pio+vky4g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qYoy3qMeV1Jj27pmWOiJ6LCiqLr/yY8dbHBPIwyJHt8OVdyWASoMm9KhBPhJdXP+E
         LkmVUwfRo0J7Yj1xmJ7nnwyZadGmRB8OQ0jow4P1BN47q+SP1y66P4sqfgyq3ZGnCs
         moXKp3phc/nShUfAFxWrufBr/3vIIMdzpyaCdIqBI+JcAquHuCIyYlpSAX2AWE5CU0
         d3ajcvGl+et67nkQbL/8Xsaad3WrOoPYLdMvWPs/W/NpSh+M6m81LbjbmaEDrZ3lw0
         +G8Uc4ExKGgWW0ouHlAYwlSEU0lsGAZ9jq94Ep2LhGNxewpZur03EFCkelAWadhC3A
         J1hPwm/YEvnJA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-doc@vger.kernel.org, mchehab+huawei@kernel.org
Subject: Re: [PATCH] docs: powerpc: Fix tables in syscall64-abi.rst
In-Reply-To: <20210225060857.16083-1-ajd@linux.ibm.com>
References: <20210225060857.16083-1-ajd@linux.ibm.com>
Date:   Thu, 25 Feb 2021 13:04:51 -0700
Message-ID: <874khzdicc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Andrew Donnellan <ajd@linux.ibm.com> writes:

> Commit 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed
> table") attempted to fix the formatting of tables in syscall64-abi.rst, but
> inadvertently changed some register names.
>
> Redo the tables with the correct register names, and while we're here,
> clean things up to separate the registers into different rows and add
> headings.
>
> Fixes: 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed table")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  Documentation/powerpc/syscall64-abi.rst | 51 ++++++++++++++++---------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Applied, thanks.

jon
