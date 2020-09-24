Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEBCC4363D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 17:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0033A2311A
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 17:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgIXRCF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 13:02:05 -0400
Received: from ms.lwn.net ([45.79.88.28]:59338 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726458AbgIXRCF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Sep 2020 13:02:05 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 595A52CB;
        Thu, 24 Sep 2020 17:02:04 +0000 (UTC)
Date:   Thu, 24 Sep 2020 11:02:01 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: rewrite admin-guide/sysctl/abi.rst
Message-ID: <20200924110201.2071ec35@lwn.net>
In-Reply-To: <20200917072123.8847-1-steve@sk2.org>
References: <20200917072123.8847-1-steve@sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Sep 2020 09:21:23 +0200
Stephen Kitt <steve@sk2.org> wrote:

> Following the structure used in sysctl/kernel.rst, this updates
> abi.rst to use ReStructured Text more fully and updates the entries to
> match current kernels:
> 
>   * the list of files is now the table of contents;
>   * links are used to point to other documentation and other sections;
>   * all the existing entries are no longer present, so this removes
>     them;
>   * document vsyscall32.
> 
> Mentions of the kernel version are dropped. Since the document is
> entirely rewritten, I've replaced the copyright statement.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Applied, thanks.

jon
