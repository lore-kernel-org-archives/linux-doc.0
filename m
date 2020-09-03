Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D487C433E2
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:44:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCEDE206D4
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgICPoN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 11:44:13 -0400
Received: from ms.lwn.net ([45.79.88.28]:58392 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgICPoN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 11:44:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A2A6144A;
        Thu,  3 Sep 2020 15:44:12 +0000 (UTC)
Date:   Thu, 3 Sep 2020 09:44:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] submitting-patches.rst: remove heading numbering
Message-ID: <20200903094411.3ca2652b@lwn.net>
In-Reply-To: <20200902155759.55895-2-sir@cmpwn.com>
References: <20200902155759.55895-1-sir@cmpwn.com>
        <20200902155759.55895-2-sir@cmpwn.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  2 Sep 2020 11:57:56 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> -11) Sign your work - the Developer's Certificate of Origin
> +Sign your work - the Developer's Certificate of Origin
>  ----------------------------------------------------------
>  
>  To improve tracking of who did what, especially with patches that can
> @@ -586,7 +586,7 @@ Example of a patch submitted by a Co-developed-by: author::
>  	Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
>  
>  
> -13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
> +Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
>  --------------------------------------------------------------------------

So why skip section 12 here?  You get to that in a later patch, where it
becomes an unrelated change; it would be better to finish that task here.

Thanks,

jon
