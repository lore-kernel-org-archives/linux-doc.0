Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B314C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 19:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59F5F22ADC
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 19:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394053AbhARTcl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 14:32:41 -0500
Received: from ms.lwn.net ([45.79.88.28]:37522 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394051AbhARTcj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jan 2021 14:32:39 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BD782559;
        Mon, 18 Jan 2021 19:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BD782559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610998318; bh=lFqXBHvWyIcVmFiDXcgQKlHNf9HagjYDA8Gw0gv+HhU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EJ79yiUmU5GZttXIefS6STv4NgwZ3a4mnowe0+Xj2dOLw7qvPpwfaipu8FOKukg4+
         asUFQVpGxcGdMhzjXrZrbv7cyA0qKqhaYifp87F0uwVSzvoNiXbWh2wmx/JgcsTXyM
         E6O07pOZ+5zocYwj1VLkB4unsi+26ap2yYIvnFQ1BpSrqY1D+d8lfUEjd3k2C69rJ3
         IcBDLGPGsqz/JlbvUiIRXLAqC5NBaJr5vlUeLd94nvfBkKH8NfoazbksLtJnbQx1/b
         JXxsEVo4eXtMDrJKmEcOUK4y+ZY0cUhHf5n46IsYaOJLyluaiCLWDI0dXDv6/Khc/c
         /QWecHZFH8B9A==
Date:   Mon, 18 Jan 2021 12:31:56 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: process/howto.rst: make sections on bug reporting
 match practice
Message-ID: <20210118123156.02f8ca28@lwn.net>
In-Reply-To: <20210116143542.69199-1-linux@leemhuis.info>
References: <20210116143542.69199-1-linux@leemhuis.info>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 16 Jan 2021 15:35:42 +0100
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> The file Documentation/process/howto.rst points to bugzilla.kernel.org
> as the primary place to report kernel bugs to. For most of the kernel
> that's the wrong place, as the MAINTAINERS file shows. Adjust those
> sections to make them match current practice.
> 
> This change also removes a contradiction with the recently added text
> Documentation/admin-guide/reporting-issues.rst, which is a reason for a
> 'this needs further discussion' warning note in there. The change is
> thus a prerequisite to remove that warning, nevertheless it is left for
> now to make sure people review the text's approach more carefully.
> 
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>

Applied, thanks.

jon
