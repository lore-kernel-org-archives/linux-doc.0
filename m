Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED3FC4338F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 681486103A
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236091AbhHLO40 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:56:26 -0400
Received: from ms.lwn.net ([45.79.88.28]:48498 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237036AbhHLO4Z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 12 Aug 2021 10:56:25 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D3D6D2CC;
        Thu, 12 Aug 2021 14:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3D6D2CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628780159; bh=1JQPA+fNH9JvXq6H5OcRxZpMwZyUA6KRvTyni3Isu5g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=s0epbSV/8A77bdTx/nB7b+sbLlpx+YDkrXS7G+U3Yh1LkZk4l5l3KDfq7+Bz29Ixm
         sy176twIJZ4mZDPUeob0s/uCBOmtFb+CTsWLrEzAhMvLXdoDpLSbZ0oXfC28Y1SbNn
         JcVK9P4XRDreUb0haSQ5cjcxTGscdFwvoM0KLwXCmOtwo/RTef0M4NvUChw7veIUqL
         eQ1PzKXOo/UuW4lHXoPRgJqC3FhqFK/4yjzgNPteJw7asXGf8iesM/30oAakScpPev
         qDPK+W+wPnd960XmUhE0AhVa8cIc9fEev7kyGmBQp20klppnQCQ362bj0yeH1pxTJk
         8iRjAAc/JTNnw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: Re: [PATCH 1/2] doc: align Italian translation
In-Reply-To: <20210731085513.11820-1-federico.vaga@vaga.pv.it>
References: <20210731085513.11820-1-federico.vaga@vaga.pv.it>
Date:   Thu, 12 Aug 2021 08:55:58 -0600
Message-ID: <871r6y1zlt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Federico Vaga <federico.vaga@vaga.pv.it> writes:

> Translation for the following patches
>
> commit 0ca0d55526d3 ("docs/core-api: Consistent code style")
> commit 9912d0bb9dee ("docs: process: submitting-patches.rst: avoid using ReST :doc:`foo` markup")
> commit 6349469a4f3c ("Documentation/submitting-patches: Document RESEND tag on patches")
> commit dbbe7c962c3a ("docs: networking: drop special stable handling")
> commit 7f3f7bfbbe02 ("docs: kernel-hacking: hacking.rst: avoid using ReST :doc:`foo` markup")
> commit 6ab0493dfc62 ("deprecated.rst: Include details on "no_hash_pointers" ")
> commit 77167b966b7e ("docs: submitting-patches: clarify the role of LKML ")
>
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> ---
>  .../it_IT/core-api/symbol-namespaces.rst      | 26 ++++-----
>  .../it_IT/kernel-hacking/hacking.rst          |  4 +-
>  .../translations/it_IT/process/deprecated.rst |  8 ++-
>  .../it_IT/process/stable-kernel-rules.rst     |  6 --
>  .../it_IT/process/submitting-patches.rst      | 57 ++++++++++---------
>  5 files changed, 51 insertions(+), 50 deletions(-)

Applied, thanks.

jon
