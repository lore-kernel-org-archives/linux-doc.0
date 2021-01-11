Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7364CC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 19:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1837222CB1
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 19:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391184AbhAKT6G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 14:58:06 -0500
Received: from ms.lwn.net ([45.79.88.28]:59688 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391180AbhAKT6G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Jan 2021 14:58:06 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BF9879A8;
        Mon, 11 Jan 2021 19:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF9879A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610395046; bh=ebmv+ox9O+h4OGSC8EtF1ikhfHfKcuzg/f/4hj00CXg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cUvBMx9ggyvui0Keu9ZTsgJWW2Y+ro4lCjGJhnBYMWC3xA2Sx9BELFutO3XnRbpFO
         FitLl62DAeu6l1Zs9A2ROQeOZOtqay1gSZC1UmnAEuOtouL8qUOvNsd+6onkzuHD2+
         CPQLPGMmfISMv5aZw6zrJL/ujw1JLodAMrJVejeAYT6ZZLKerrZx3pDcFcVQB48Yql
         giB4n4M6H76fkgUVIuGIRD+fE2uYIfFjKqvseKFzGVHtQus6qtbRZPkAORQ246Orj3
         grE19iTn9ORRLafiLP0IW7OdJqL6xqZu9/Eh3gOuL8vaILK7pJ1mzKj+hCyJL0k6MD
         hg+IpfcwCG5WA==
Date:   Mon, 11 Jan 2021 12:57:24 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/4] doc/zh_CN: add mips index.rst translation
Message-ID: <20210111125724.689a7765@lwn.net>
In-Reply-To: <20210111113401.2852455-1-siyanteng@loongson.cn>
References: <20210111113401.2852455-1-siyanteng@loongson.cn>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 11 Jan 2021 19:33:58 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> This patch translates Documentation/mips/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/mips/index.rst

So I am confused by all of this; I've received a few variants of this
patch set; this one is not threaded properly. It looks like Alex reviewed
some of the previous versions, but you don't have his Reviewed-by tags
here.

I will drop these; could you please straighten this all up and send me a
version of the series that is ready to be merged?

Thanks,

jon
