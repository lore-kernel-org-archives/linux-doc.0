Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3F2C4332D
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36E0D23A1C
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbhAUTTg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbhAUTJy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 14:09:54 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12439C061788;
        Thu, 21 Jan 2021 10:56:55 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 86074615D;
        Thu, 21 Jan 2021 18:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 86074615D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611255414; bh=lBGcLtN3UNL5gr1BP+tAQ2KxSLmKSWTrpPek3ZhcEAQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WGNRHEQdWkOCzSaE4PVU0Pmkn4fo1IUMXb+MFWMQ5Rcp8FMHFkYTgXW8IIWRJJNEr
         lfPl2kFAG7iKXoAkQlD0B6BqEwNSuX4JNzJ7H8rhOvIM2GdPy0vaBzY9AGOKJS2k8N
         ZXrtHsKlkesRMKMSnhWQQSCLQCbdWRLW/7leOqdhJUiqJe7gHL3b/sOzcLZUWPhcpV
         xUT7lWkLgj8zrvS4M+4ZdWLkOy6hx31VQ3Rtpb9qDAbIpegMmYx+8pccSabHh20FIM
         qAS101Yq+lEuD48uArfqbuVTnza/CMPjYW0b7SJsQZ1hKjXb1eCBvHiJbkpChHmJ+Q
         7SzLwnenbg7WA==
Date:   Thu, 21 Jan 2021 11:56:53 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        linux-afs@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] AFS: Documentation: fix a few typos in afs.rst
Message-ID: <20210121115653.42f89325@lwn.net>
In-Reply-To: <20210117213351.1075-1-rdunlap@infradead.org>
References: <20210117213351.1075-1-rdunlap@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 17 Jan 2021 13:33:51 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix typos (punctuation, grammar, spelling) in afs.rst.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Howells <dhowells@redhat.com>
> Cc: linux-afs@lists.infradead.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/filesystems/afs.rst |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
