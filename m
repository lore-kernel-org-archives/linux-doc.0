Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817B3C71156
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 568DE2074A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgK3Rim (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:38:42 -0500
Received: from ms.lwn.net ([45.79.88.28]:54598 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726970AbgK3Rim (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 30 Nov 2020 12:38:42 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B1F2B2BA;
        Mon, 30 Nov 2020 17:38:01 +0000 (UTC)
Date:   Mon, 30 Nov 2020 10:38:00 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bailu Lin <bailu.lin@vivo.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@vivo.com
Subject: Re: [PATCH] Documentation: Chinese translation of 
 Documentation/arm64/elf_hwcaps.rst
Message-ID: <20201130103800.7175bb67@lwn.net>
In-Reply-To: <20201124023846.34826-1-bailu.lin@vivo.com>
References: <20201124023846.34826-1-bailu.lin@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 23 Nov 2020 18:38:14 -0800
Bailu Lin <bailu.lin@vivo.com> wrote:

> This is a Chinese translated version of
>  Documentation/arm64/elf_hwcaps.rst
> 
> Signed-off-by: Bailu Lin <bailu.lin@vivo.com>
> ---
> Changes in v2:
>  - Modify five translation issues as Alex sugguested.
> ---
>  Documentation/arm64/elf_hwcaps.rst            |   2 +
>  .../translations/zh_CN/arm64/elf_hwcaps.rst   | 240 ++++++++++++++++++
>  .../translations/zh_CN/arm64/index.rst        |   1 +
>  3 files changed, 243 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/arm64/elf_hwcaps.rst

Applied, thanks.

jon
