Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FBBC433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 18:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21AA520809
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 18:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgIPSnP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:43:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:41706 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728101AbgIPSnL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Sep 2020 14:43:11 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4BCA92E5;
        Wed, 16 Sep 2020 18:43:11 +0000 (UTC)
Date:   Wed, 16 Sep 2020 12:43:10 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: rewrite admin-guide/sysctl/abi.rst
Message-ID: <20200916124310.1a06c89e@lwn.net>
In-Reply-To: <20200911190152.29730-1-steve@sk2.org>
References: <20200911190152.29730-1-steve@sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Sep 2020 21:01:52 +0200
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

Replacing a copyright makes me a little nervous, but I guess that is OK
here since everything else is replaced too.  Could I trouble you, though,
for a version that adds an SPDX line at the top while you're at it?

Thanks,

jon
