Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FD8C4320A
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BECDC60EB5
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbhHLPQq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 11:16:46 -0400
Received: from ms.lwn.net ([45.79.88.28]:48894 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233554AbhHLPQp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 12 Aug 2021 11:16:45 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DD75644A;
        Thu, 12 Aug 2021 15:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DD75644A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628781380; bh=CnvYqSEF0ZWvynhGAoWUNAnqtMunsVqwTJ7qnUGujvk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mkHWVwrrjYw8Y3fFGXG1CnA7lRIaEVMLWXv7WgYCYNGsLUvDKxx/GeyCMzpkhHfFq
         rL0N+IO4Se3x/p0a7Z1IykHbaiXIgCzKur2J6G5bcii2oTmIVVhQKG25UG/JdKH+qn
         gvN1fGMigOCoECOs+S16n5Md3Mvc7+J4C0XBxgAA22I/mkVcTDWO6Y1Ntm+2i34hnU
         761T8pg+miQZuoRu64fUQcsJpOU866769qCyqtQqMNfh1IuvaRsz7rP1aU3U+gp++z
         99OweVEUzmjtviyDorE6wqLtXx6ClabEBpd/dUTbr4+3knJxnW7Q6LcFXsoeE529r8
         eMxE20XbKllfQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2] docs: sphinx-requirements: Move sphinx_rtd_theme to top
In-Reply-To: <75f14c88-6091-1072-41cb-16b886aee5a0@gmail.com>
References: <974babfe-540f-40e4-38b3-ab294ba70ccc@gmail.com>
 <75f14c88-6091-1072-41cb-16b886aee5a0@gmail.com>
Date:   Thu, 12 Aug 2021 09:16:19 -0600
Message-ID: <87fsvezoak.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> sphinx_rtd_theme 0.5.2 has "docutils<0.17" in its requirements.
> docutils 0.17 released this April caused regression in
> sphinx_rtd_theme 0.5.1 [1].
>
> By removing docutils and moving sphinx_rtd_theme before Sphinx in
> requirements.txt, the requirement of "docutils<0.17" can be met
> naturally.
>
> [1]: https://github.com/readthedocs/sphinx_rtd_theme/issues/1112
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> Hi,
>
> It is better to keep requirements as minimal as possible.
> Let's leave the dependency to the sphinx_rtd_theme package.
>
> Changes in v1 [2] -> v2:
>
>     o Remove docutils entry.
>     o Move sphinx_rtd_theme to top.
>     o Adjust patch title.
>
> [2]: https://lore.kernel.org/linux-doc/974babfe-540f-40e4-38b3-ab294ba70ccc@gmail.com/

Applied, thanks.

jon
