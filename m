Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40A3C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 20:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD9F464DF3
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 20:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhBYUMD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 15:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhBYUMC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Feb 2021 15:12:02 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115F7C06174A;
        Thu, 25 Feb 2021 12:11:22 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BE2E57DE;
        Thu, 25 Feb 2021 20:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BE2E57DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614283881; bh=x+UiLAWpiYh0JD6ayrWflGl7JaEf/FYymNi0YrQd/yI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rg/v8AsQN0nMNsV9KO33qUv48CzJKIGJsMW+J00ZYp0zUbuhM3A9HBV08CkRx4cEE
         CvarbNPxZhHtVHK4/25TaqqsDks8jDj7M4MAKvIjIxq6UqTJ6dqFBP8zgxxIaijGtH
         BYaaV1EFzbOezQH4fdhUdX5Q/X3pWVOBVjatdJgXwy6JErlH099MkzRPGauPqzvWoW
         vOqyq+oyMDz+PJRGYKkVrztgaRus8D22sv8dbJ9t1T+69qX8/tXaiIDw8/qCXL8Pml
         Zb1tacAxoN2vF4TLbXWA+kxKmh6o0Fj4YRf9cJluDH0/fnnLCA2k1t2AFr7xTuRu75
         EfETD6Npv4Yyg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH -next] docs: proc.rst: fix indentation warning
In-Reply-To: <20210223060418.21443-1-rdunlap@infradead.org>
References: <20210223060418.21443-1-rdunlap@infradead.org>
Date:   Thu, 25 Feb 2021 13:11:21 -0700
Message-ID: <87v9afc3h2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Fix indentation snafu in proc.rst as reported by Stephen.
>
> next-20210219/Documentation/filesystems/proc.rst:697: WARNING: Unexpected indentation.
>
> Fixes: 93ea4a0b8fce ("Documentation: proc.rst: add more about the 6 fields in loadavg")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
> shame on me.
>
>  Documentation/filesystems/proc.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
