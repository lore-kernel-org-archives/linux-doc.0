Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978C3C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F5EE613B5
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhELIZv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 04:25:51 -0400
Received: from mx.kolabnow.com ([95.128.36.40]:47930 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230137AbhELIZu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:25:50 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 657F3A25;
        Wed, 12 May 2021 10:24:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        in-reply-to:content-disposition:content-type:content-type
        :mime-version:references:message-id:subject:subject:from:from
        :date:date:received:received:received; s=dkim20160331; t=
        1620807881; x=1622622282; bh=pNpMgAtoXuEvhZFZGFGFSlbgwGZCqEROhfU
        xoFMcU6Q=; b=pbxnJTxVVB1PN5OzW7C20wvi+ffHLXsJnRnAKXu07iPfScSQpMh
        vBKj37a9muPy0BALtFEnKdHSdljKEGb7QNAjDhGGKWwtvKmI0fK1UVCCSm9w8kSz
        Odij16bDpwVlSG9gN7XmY0fS+6jCiCWRdP0lPQ1ClWOvidQtoELlM87eIKyusN2d
        heNx8vSW7/yPhQrAoByd/MNVYL29lbD6Kodi08hGzvX3oT+g8ocQGPH6tf7Qzxg7
        Wt2sH2ky7gu5FWaqhLSIAPg3w7vaehG72KPEEGQw+CHVUH1Z/PXhR3GWj8Fklpyu
        FNTlncxOG3jti3hJvh6yryb7naIfy+4SAik00GtrJ2O//cFL+fJJUIqVtMveX9IQ
        nqqQ4OFKYqQwvihb4g/W3DX0NjiYfOo5HgBPcqAdiaBffbXGQSiHKHVFZdt5BSJc
        /oxZi36FdCpv1viSm3jenqwHtkYB5pcPwTbgnx3bMhYERzododCYenZ+C07apFAK
        1g+gWxblhGAikTLQ2MopCjtcYFf+4NnlgdHpM/De7dF86LL4YquDHU4B3fqTw4pL
        GzeQDN7zIexitPQm2nob6dQ9U5nEB9Pv/kL8GVyzVdEcDkrOooY7jKw7ViJHy9AI
        f6WZ0I9mCs5MYj1s84/138MpuNQngYvYXBnzDb8VGjvPbN2jKuMt50Kw=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0UGH77h8ZQpR; Wed, 12 May 2021 10:24:41 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id C6E4A465;
        Wed, 12 May 2021 10:24:40 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id EEC5A11A62;
        Wed, 12 May 2021 10:24:37 +0200 (CEST)
Date:   Wed, 12 May 2021 10:24:35 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] Documentation/translations/it_IT: switch some links
 to https
Message-ID: <20210512082434.timdb2sxntl6mktl@numero86.vaga.pv.it>
References: <cce90d8d.ANEAAKAcMY8AAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgmMlr@mailjet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cce90d8d.ANEAAKAcMY8AAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgmMlr@mailjet.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Mon, May 10, 2021 at 12:58:29PM +0800, Sanjeev Gupta wrote:
>Links have been checked to ensure that the old and new URL
>return the same page.  This is not true for many links.
>
>Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>

>---
> .../translations/it_IT/doc-guide/kernel-doc.rst        |  2 +-
> Documentation/translations/it_IT/doc-guide/sphinx.rst  | 10 +++++-----
> Documentation/translations/it_IT/process/changes.rst   |  2 +-
> .../translations/it_IT/process/coding-style.rst        |  2 +-
> 4 files changed, 8 insertions(+), 8 deletions(-)
