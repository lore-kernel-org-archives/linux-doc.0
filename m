Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F0EC636CD
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 20:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjAaU3S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 15:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjAaU3R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 15:29:17 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DFACC2E;
        Tue, 31 Jan 2023 12:29:17 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F00BC31A;
        Tue, 31 Jan 2023 20:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F00BC31A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675196957; bh=v2veY8IvTtdByySn4YeSTgH3lspjXeFUWSbuvpCo+Lg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=eWmH4wvaioDw7Y+VvVi+nuGLUWkt3vOJAunTZaRFyvrG1A40GcfNocymw2Ot7orcY
         VVDBTWkhj32i8CISC3RoBf27kj4fDSLKHtHu04R2noKzqAHIxsWqYAemkwW7pzgpJb
         qWHmZ9jbUHQPsJV31m8UF75XrUYXcgwYFUQSfEWCSHlnfJ6hWaiwC6OGQHgYDy32oP
         FShR2XIaHsUXUjASU2ewxnFe/3NgmZwnAdzc1Ns/MdFpx1/ofKXnoDnEQsYJk1RGHb
         BsJaWSbak8erV7e4APd7PQ7g2K8V96Z4UAR7Z3HvElyrnDf+S0yx1P1iS1n557y7/q
         squoNwdPL1lZw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/2] docs/mm: remove useless markup
In-Reply-To: <20230131144220.822989-1-rppt@kernel.org>
References: <20230131144220.822989-1-rppt@kernel.org>
Date:   Tue, 31 Jan 2023 13:29:16 -0700
Message-ID: <87357q4fdv.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Hi,
>
> Following Jon's gripe about top-of-file labels [1], I went ahead and
> updated admin-guide/mm and mm docs to use file names instead of labels for
> document cross-referencing.
>
> [1] https://lore.kernel.org/all/87r0vh9n17.fsf@meer.lwn.net

This is a nice cleanup and I want to apply it, but it adds some
warnings:

> Documentation/mm/physical_memory.rst:61: WARNING: undefined label: page_migration
> Documentation/mm/physical_memory.rst:61: WARNING: undefined label: admin_guide_memory_hotplug
> Documentation/translations/zh_CN/mm/hmm.rst:251: WARNING: undefined label: page_migration
> Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst:18: WARNING: undefined label: hugetlbpage
> Documentation/translations/zh_CN/mm/numa.rst:76: WARNING: undefined label: numa_memory_policy

It looks like a few references didn't get fixed?

Thanks,

jon
