Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74178C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 21:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 579AC610CC
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 21:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349960AbhICV6u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Sep 2021 17:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344767AbhICV6t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Sep 2021 17:58:49 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B9CC061575;
        Fri,  3 Sep 2021 14:57:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C2D69734;
        Fri,  3 Sep 2021 21:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C2D69734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1630706268; bh=0ztR2PG58bionl4htPOnZ6zEyz1G9LrFqWLzfCqwD/s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NZfFHTrXboAKes3S4DXV9qNAGuGzHChc7P4QQ32ONj3Ns6rPIO8APXnUdbZGXpcye
         DY/TzQtAFRVekgi4ieNgKQK1WnC2ugh73N3DuqwxDbToPwlYYr7WzZVIKaUJxNOash
         SMb/DIisJImpVPGqHjxvbood6DSZiDKeUvR5VA0eMJRq/sfKGTztwv/yYSa9pl2QgK
         yeY4xS5ER7Yh9qswM4+Kv0HnlYwdW0U7k6EazEdgYy97Jp862wTnhqYNMsEE+IrR4F
         4tC1WQ5JND0vrdQLzGNE5rVP5zO3zvhywGBA1hs00Th67s0THq++J/bVhaeUKiEUFh
         AOjAihDGoHqvg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-doc@vger.kernel.org
Cc:     Takashi Iwai <tiwai@suse.de>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH] docs: kernel-hacking: Remove inappropriate text
In-Reply-To: <20210903151826.6300-1-alyssa@rosenzweig.io>
References: <20210903151826.6300-1-alyssa@rosenzweig.io>
Date:   Fri, 03 Sep 2021 15:57:48 -0600
Message-ID: <877dfxxqxv.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alyssa Rosenzweig <alyssa@rosenzweig.io> writes:

> Remove inappropriate sexual (and ableist) text from the locking
> documentation, aligning it with the kernel code-of-conduct. As the text
> was unrelated to locking, this change streamlines the document and
> improves readability.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>  Documentation/kernel-hacking/locking.rst | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

That text dates all the way back to pre-2.4 kernels...there goes a bit
of history.  It's history that we can do without at this point, though;
patch applied, thanks.

jon
