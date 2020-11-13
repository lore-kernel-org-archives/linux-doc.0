Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B960EC55ABD
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 22:22:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C86D2223F
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 22:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgKMWWl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 17:22:41 -0500
Received: from ms.lwn.net ([45.79.88.28]:51048 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726855AbgKMWWl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Nov 2020 17:22:41 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 401D74FA;
        Fri, 13 Nov 2020 22:22:38 +0000 (UTC)
Date:   Fri, 13 Nov 2020 15:22:37 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bailu Lin <bailu.lin@vivo.com>
Cc:     alex.shi@linux.alibaba.com, catalin.marinas@arm.com,
        harryxiyou@gmail.com, kernel@vivo.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH v2] Documentation: Chinese translation of 
 Documentation/arm64/perf.rst
Message-ID: <20201113152237.41d452a6@lwn.net>
In-Reply-To: <20201030040541.8733-1-bailu.lin@vivo.com>
References: <07c84db5-9a07-c106-300c-583f2625f9a7@linux.alibaba.com>
        <20201030040541.8733-1-bailu.lin@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 29 Oct 2020 21:05:41 -0700
Bailu Lin <bailu.lin@vivo.com> wrote:

> This is a Chinese translated version of
>  Documentation/arm64/perf.rst
> 
> Signed-off-by: Bailu Lin <bailu.lin@vivo.com>
> ---
> Changes in v2:
>  - Modify a translation of 'guest/host/blackout window' as Alex sugguested.
> ---
>  Documentation/arm64/perf.rst                  |  2 +
>  .../translations/zh_CN/arm64/index.rst        |  1 +
>  .../translations/zh_CN/arm64/perf.rst         | 86 +++++++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/arm64/perf.rst

Applied, thanks.

BTW, many thanks to Alex for reviewing all of these, it definitely
improves my confidence in applying them :)

jon
