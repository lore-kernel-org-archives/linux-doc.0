Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D27C83013
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F42F2074A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387616AbgK3Rg0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387579AbgK3Rg0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 12:36:26 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABECCC0613CF;
        Mon, 30 Nov 2020 09:35:46 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6336C2BA;
        Mon, 30 Nov 2020 17:35:46 +0000 (UTC)
Date:   Mon, 30 Nov 2020 10:35:45 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2] Documentation/admin-guide: mark memmap parameter is
 supported by a few architectures
Message-ID: <20201130103545.3fde4e8f@lwn.net>
In-Reply-To: <20201128195121.2556-1-song.bao.hua@hisilicon.com>
References: <20201128195121.2556-1-song.bao.hua@hisilicon.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 29 Nov 2020 08:51:21 +1300
Barry Song <song.bao.hua@hisilicon.com> wrote:

> early_param memmap is only implemented on X86, MIPS and XTENSA. To avoid
> wasting users’ time on trying this on platform like ARM, mark it clearly.
> 
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  -v2:
>  * add reviewed-by of Mike, thanks!
> 
>  Documentation/admin-guide/kernel-parameters.rst | 1 +
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

jon
