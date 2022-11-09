Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8028EC4332F
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 14:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbiKIO2x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 09:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbiKIO2s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 09:28:48 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCB51BEB4
        for <linux-doc@vger.kernel.org>; Wed,  9 Nov 2022 06:28:44 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C91B037E;
        Wed,  9 Nov 2022 14:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C91B037E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668004123; bh=rL7IpYxPex2TA5C//RJsSeNxBHAww13hIWlgf65TLLw=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=lsWv946erXvW1Qw9W3/yXzE/Ojy2M/ZQTK/nRYrKD4NOd2vwoPhzBksUqcdbJJWcU
         1bxKE2VyT5GY6XlDQeIM1D30PI5OCdAgXkuSHLdNCY1ow2dftzf4nvA0ffZwyag80Q
         8yo77rVVXiv8PQWBvkiGjRPbHnxNvs5exJmLRGyFnrPkxqX1S/F6c6EdrymY1HO712
         FBOulFX/VtbGpcb0YKS5r31yLWfBCvCw6prOgGBS8fFv0ccYFgJvsVJqMoDS4MmncV
         h6wL9Rl4xaLjYO5BZWM4ZLbD/VLpcoXuSzR799jnLLx9pA0DLOKNjVq8KoYrfkW2px
         xbjE/ZFP8QwFA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] scripts/kernel-doc: support EXPORT_SYMBOL_NS_GPL() with
 -export
In-Reply-To: <8338c944-f1af-7c86-f50d-09a07dc2beb7@gmail.com>
References: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
 <8338c944-f1af-7c86-f50d-09a07dc2beb7@gmail.com>
Date:   Wed, 09 Nov 2022 07:28:43 -0700
Message-ID: <87a650nqw4.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

>> -Specify an additional FILE in which to look for EXPORT_SYMBOL() and
>> -EXPORT_SYMBOL_GPL().
>> +Specify an additional FILE in which to look for EXPORT_SYMBOL information.
>> 
>
> For consistency, what about "Specify an additional FILE in which to look for
> EXPORT_SYMBOL() and related macros."

Nobody runs kernel-doc by hand except for a few of us trying to figure
out some weirdness.  We really don't need nit-picking here.  Please (for
the Nth time) stop adding unnecessary friction for our contributors.

> Anyway, what are EXPORT_SYMBOL_NS{,_GPL}() macros?

Somebody who tries to come across as the authoritative master of patch
style should know that.  Maybe try reading the docs? :)

jon
