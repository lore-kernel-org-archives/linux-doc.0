Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F2CC4363D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 17:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF4B12311A
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 17:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgIXREE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 13:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIXREE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 13:04:04 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B67C0613CE;
        Thu, 24 Sep 2020 10:04:04 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 60E3C2CB;
        Thu, 24 Sep 2020 17:04:03 +0000 (UTC)
Date:   Thu, 24 Sep 2020 11:04:00 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix references to nommu-mmap.rst
Message-ID: <20200924110400.1cda36a6@lwn.net>
In-Reply-To: <20200812092230.27541-1-steve@sk2.org>
References: <20200812092230.27541-1-steve@sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 12 Aug 2020 11:22:30 +0200
Stephen Kitt <steve@sk2.org> wrote:

> nommu-mmap.rst was moved to Documentation/admin-guide/mm; this patch
> updates the remaining stale references to Documentation/mm.
> 
> Fixes: 800c02f5d030 ("docs: move nommu-mmap.txt to admin-guide and rename to ReST")
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  init/Kconfig | 2 +-
>  mm/Kconfig   | 2 +-
>  mm/nommu.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

It seems nobody else wants this, so I've applied it.

Thanks,

jon
