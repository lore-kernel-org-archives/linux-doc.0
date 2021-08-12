Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C93C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12B5E60F35
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236311AbhHLPLz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 11:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235052AbhHLPLz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Aug 2021 11:11:55 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C78DC061756
        for <linux-doc@vger.kernel.org>; Thu, 12 Aug 2021 08:11:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CA7E46E2;
        Thu, 12 Aug 2021 15:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CA7E46E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628781089; bh=MxL340qOaQoN/doogsQ5NhegtX8GhBY7SXLxUkPLf4Y=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mkXdwW1uPZUFQIYmGvDkn2B7P9YAfW7Xj7x9wMwIQQBfwUsD8dSys+NoOvmMNaiqi
         TjE1zFZ+zYfuVA4qMVKlgW1x4tH6qZRwZB4P1f1GZK+aFOMUi84+Ntph2z/+jqxmKh
         kCDFqN5DpEF+U1RKOkNFCXsSj1fmwGKOohfY6nTo465xz4zdV87Zt17By8RnXElhfD
         YxP6mldWSKXqJzmIscSnT0AHrVf10nFGbF6PxIE3nX+0nnH+sYSMTV1f1lP1YdCILd
         18HxE7ZLNayRzdK+YEghScv/A6pk5euYXAK8SJHYu1qhfhqUihtOSYCSkCiPY4ZGUF
         QyljJl+lV7wqg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>,
        linux-doc@vger.kernel.org
Cc:     ivan.teterevkov@nutanix.com, florian.schmidt@nutanix.com,
        carl.waldspurger@nutanix.com, jonathan.davies@nutanix.com,
        Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Subject: Re: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP
 shmem issue
In-Reply-To: <20210730160227.63017-1-tiberiu.georgescu@nutanix.com>
References: <20210730160227.63017-1-tiberiu.georgescu@nutanix.com>
Date:   Thu, 12 Aug 2021 09:11:29 -0600
Message-ID: <87o8a2zoim.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com> writes:

> Mentioning the current missing functionality of the pagemap, in case
> someone stumbles upon unexpected behaviour.
>
> Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
> Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
> Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
> Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
> Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
> ---
>  Documentation/admin-guide/mm/pagemap.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
> index fb578fbbb76c..627f3832b3a2 100644
> --- a/Documentation/admin-guide/mm/pagemap.rst
> +++ b/Documentation/admin-guide/mm/pagemap.rst
> @@ -207,3 +207,9 @@ Before Linux 3.11 pagemap bits 55-60 were used for "page-shift" (which is
>  always 12 at most architectures). Since Linux 3.11 their meaning changes
>  after first clear of soft-dirty bits. Since Linux 4.2 they are used for
>  flags unconditionally.
> +
> +Note that the page table entries for swappable and non-syncable pages are
> +cleared when those pages are zapped or swapped out. This makes information
> +about the page disappear from the pagemap.  The location of the swapped
> +page can still be retrieved from the page cache, but flags like SOFT_DIRTY
> +and UFFD_WP are lost irretrievably.

Thanks for the patch, please accept my apologies for taking to long to
look at it.

The change seems OK to me, but I think that the memory-management
developers should get a chance to at least look at it before I merge
it.  Could I ask you to submit, including the linux-mm list on CC?

Thanks,

jon
