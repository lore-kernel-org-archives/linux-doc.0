Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9344EC4363A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2933A24198
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506025AbgJUVTD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 17:19:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:37706 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506024AbgJUVTD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Oct 2020 17:19:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BAC482C8;
        Wed, 21 Oct 2020 21:19:02 +0000 (UTC)
Date:   Wed, 21 Oct 2020 15:18:59 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     fam@euphon.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add two missing entries in vm sysctl index
Message-ID: <20201021151859.085c7f70@lwn.net>
In-Reply-To: <20201013091404.3124178-1-fam@euphon.net>
References: <20201013091404.3124178-1-fam@euphon.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Oct 2020 10:14:04 +0100
fam@euphon.net wrote:

> From: Fam Zheng <famzheng@amazon.com>
> 
> Both seem overlooked while adding the section in the main content.
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.  The right way to fix this, though, is to let Sphinx
generate a table of contents at the beginning; that will never get out of
date.

jon
