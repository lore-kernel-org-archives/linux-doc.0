Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CEDC388F9
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEEDD2419A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 21:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505924AbgJUVPi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 17:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440268AbgJUVPi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 17:15:38 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40940C0613CE;
        Wed, 21 Oct 2020 14:15:38 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E9F0C2C8;
        Wed, 21 Oct 2020 21:15:36 +0000 (UTC)
Date:   Wed, 21 Oct 2020 15:15:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bailu Lin <bailu.lin@vivo.com>
Cc:     alex.shi@linux.alibaba.com, catalin.marinas@arm.com,
        harryxiyou@gmail.com, kernel@vivo.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH v3] Documentation: Chinese translation of 
 Documentation/arm64/hugetlbpage.rst
Message-ID: <20201021151533.3b3bb5ea@lwn.net>
In-Reply-To: <20201014022003.43862-1-bailu.lin@vivo.com>
References: <ab3df28a-cde4-67d1-d0a3-abaa5ada58a1@linux.alibaba.com>
        <20201014022003.43862-1-bailu.lin@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Oct 2020 19:20:03 -0700
Bailu Lin <bailu.lin@vivo.com> wrote:

> This is a Chinese translated version of
>  Documentation/arm64/hugetlbpage.rst
> 
> Signed-off-by: Bailu Lin <bailu.lin@vivo.com>
> ---
> Changes in v3:
>  - Modify a translation as Alex sugguested.
> Changes in v2:
>  - Fix Sphinx 2.4.4's waring by increasing underline' size.
> ---
>  Documentation/arm64/hugetlbpage.rst           |  2 +
>  .../translations/zh_CN/arm64/hugetlbpage.rst  | 45 +++++++++++++++++++
>  .../translations/zh_CN/arm64/index.rst        |  1 +
>  3 files changed, 48 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/arm64/hugetlbpage.rst

Applied, thanks.

jon
