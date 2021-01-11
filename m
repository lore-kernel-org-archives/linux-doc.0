Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4875C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:22:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DCDF22C7B
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403884AbhAKUWP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:22:15 -0500
Received: from ms.lwn.net ([45.79.88.28]:33720 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390690AbhAKUWP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Jan 2021 15:22:15 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BAFF69A8;
        Mon, 11 Jan 2021 20:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BAFF69A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610396495; bh=Y5nKj9qq5Sk360DGiCdSa15rkyiTDFl+lAdKS4TbTmI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k2eJGxB7o9RL28bpZ28dx///rnBde/p0Nrzuv4/BmSMaShioY8C1kE6Oqej1AKrFB
         Ftc040T+MYgHg4O2O5p46/MIEmGWjuVU8xxwgCtxLd8CxHE/Mufj7ybPEIZO8TBgHx
         /os4roqkKC75K7IrLCjQ8inIFFDvLHojRH6BEuSokgAOKWqD1hgu2PCGnw2uJAoPb4
         61/SAQAgFS4UUCUp/Z9H6VfRvwJQMsghkmpjciGtIpT4oITmB0GMSIahAK3/OVI+wo
         Nw0ubeyE3J1m3MhXN5UCBri5IAMWhOa0hzkquqDkS5Jm1hGQipZvUSRTtIKRoHrnLP
         oPOabaPYxp36w==
Date:   Mon, 11 Jan 2021 13:21:33 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jan Kara <jack@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Include ext4 documentation via filesystems/
Message-ID: <20210111132133.68c1fe44@lwn.net>
In-Reply-To: <20210101215215.1047826-1-j.neuschaefer@gmx.net>
References: <20210101215215.1047826-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  1 Jan 2021 22:52:13 +0100
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> The documentation for other filesystems is already included via
> filesystems/index.rst. Include ext4 in the same way and remove it
> from the top-level table of contents.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/filesystems/index.rst |  1 +
>  Documentation/index.rst             | 11 -----------
>  2 files changed, 1 insertion(+), 11 deletions(-)

Applied, thanks.

jon
