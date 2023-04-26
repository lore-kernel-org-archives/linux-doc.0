Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3391CC77B78
	for <linux-doc@archiver.kernel.org>; Wed, 26 Apr 2023 18:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjDZSoI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Apr 2023 14:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjDZSoH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Apr 2023 14:44:07 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD47619A
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 11:44:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 868D8379;
        Wed, 26 Apr 2023 18:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 868D8379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1682534646; bh=UYVUQVPYNWOrVr8Ify87gHerQB3E9WGC6uJJrFEhLPE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=F6AsOiiZIBwcTqyn4c9/7vmoSBx8hmgZZKhEFr0REzdaWJJIB7oxLaBIzNlayo2SE
         xowGg3Cb/a+fsxVfKU1HI763Eq2jFUUuWLWTCFLBTryb52aEh07olc+W6GTE/LeGa7
         fskYo+Dr8Lzyz7s8YJVMK597uDKHLSqMP30UO+LqFyU+/WGytdx+Ixd6GMAmILY7jE
         bhCpDYShpIgQC56R2U7EzsM/8uLToirb5hdhaAYgfPFUH+I8G+oW9qyUpSus/CvqFU
         xKt9dLRK+MRAW54nxGtpIleUMHxcaKUzjSs+80mUIryhGyXpyDiYVEg2KiNRNru4j9
         zdPv/uP+nzasw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Donald Hunter <donald.hunter@gmail.com>, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Donald Hunter <donald.hunter@gmail.com>
Subject: Re: [PATCH] docs/admin-guide/mm/ksm.rst fix intraface -> interface
 typo
In-Reply-To: <20230424080305.2985-1-donald.hunter@gmail.com>
References: <20230424080305.2985-1-donald.hunter@gmail.com>
Date:   Wed, 26 Apr 2023 12:44:05 -0600
Message-ID: <87jzxyh4ay.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Donald Hunter <donald.hunter@gmail.com> writes:

> Fix typo from 'intraface' to 'interface' in admin guide for KSM.
>
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>  Documentation/admin-guide/mm/ksm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> index eed51a910c94..ca0c3a384f85 100644
> --- a/Documentation/admin-guide/mm/ksm.rst
> +++ b/Documentation/admin-guide/mm/ksm.rst
> @@ -20,7 +20,7 @@ content which can be replaced by a single write-protected page (which
>  is automatically copied if a process later wants to update its
>  content). The amount of pages that KSM daemon scans in a single pass
>  and the time between the passes are configured using :ref:`sysfs
> -intraface <ksm_sysfs>`
> +interface <ksm_sysfs>`

Applied, thanks.

jon
