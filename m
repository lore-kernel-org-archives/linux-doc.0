Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D376C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 20:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28C376135A
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 20:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240385AbhETUUD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 16:20:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:59950 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240383AbhETUUB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 May 2021 16:20:01 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C5DE9301;
        Thu, 20 May 2021 20:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C5DE9301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1621541918; bh=7G0mnJOy8jZvJNE7haBvNkwE5/S7km1ij4tGB6xQvDc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cq/yFCuu4dUKJ146NJcwjEVDF5AGng+WJOmqQwTlnRCw4W1OZr78tXsqfCyKRPNyj
         6IZ6BMhxKr9mCAPfqXVqFYv0+mRza0dP0VK2L+SHB9/mtobAw65G5SaGAt0umW3pTu
         5Da4jy05vxK35O7jRVGcvratZUymPK09G6O3jR9wzJX6M3iUhE9NNAr7anblSJZlRO
         kTaEGWmPdfU7B7RVPsw5keCxLWOiloyz2qOjh8HSSCmfB8afGWWzCTofKxYlAoQMCp
         rgIzXexAfMtHPg5YktQJWcl1NlMcUo37eJ4Kxvo8gkFnaC8t9ursyRrOif5pCKCwYn
         C9kauaFT95HTw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sanjeev Gupta <ghane0@gmail.com>, linux-doc@vger.kernel.org
Cc:     Sanjeev Gupta <ghane0@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 1/3] Documentation/translations/it_IT: switch LWN
 links to https
In-Reply-To: <743d9c7f.AUwAAC8yN1IAAAAAAAAAAKAiBu8AAAAAAMcAAAAAAA6qeABgn302@mailjet.com>
References: <743d9c7f.AUwAAC8yN1IAAAAAAAAAAKAiBu8AAAAAAMcAAAAAAA6qeABgn302@mailjet.com>
Date:   Thu, 20 May 2021 14:18:38 -0600
Message-ID: <87fsyhnopt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sanjeev Gupta <ghane0@gmail.com> writes:

> Links have been checked to ensure that the old and new URL
> return the same page.
>
> Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
> ---
>  Documentation/translations/it_IT/process/2.Process.rst      | 2 +-
>  Documentation/translations/it_IT/process/3.Early-stage.rst  | 4 ++--
>  Documentation/translations/it_IT/process/4.Coding.rst       | 2 +-
>  .../translations/it_IT/process/7.AdvancedTopics.rst         | 2 +-
>  Documentation/translations/it_IT/process/8.Conclusion.rst   | 6 +++---
>  .../it_IT/process/volatile-considered-harmful.rst           | 4 ++--
>  6 files changed, 10 insertions(+), 10 deletions(-)

So these seem about ready to apply, but ... they never made it to a
public list.  I see linux-doc in the headers, but somehow your messages
didn't actually get there.

Could I ask you to resend, fixing whatever it was that prevented the
messages from getting onto linux-doc last time?  While you are at it,
you can also send them as a proper series with a cover letter and fix
the additional URL that Federico pointed out in part 2.

Thanks,

jon
