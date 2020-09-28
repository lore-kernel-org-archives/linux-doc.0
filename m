Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A837C2D0A8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 21:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F32A3208FE
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 21:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgI1VYv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 17:24:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:48296 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbgI1VYv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 28 Sep 2020 17:24:51 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1B1D572D;
        Mon, 28 Sep 2020 21:24:49 +0000 (UTC)
Date:   Mon, 28 Sep 2020 15:24:48 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bailu Lin <bailu.lin@vivo.com>
Cc:     alex.shi@linux.alibaba.com, catalin.marinas@arm.com,
        harryxiyou@gmail.com, kernel@vivo.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH v3] Documentation: Chinese translation of 
 Documentation/arm64/amu.rst
Message-ID: <20200928152448.578034f3@lwn.net>
In-Reply-To: <20200925151758.41818-1-bailu.lin@vivo.com>
References: <20200924104141.7abc7271@lwn.net>
        <20200925151758.41818-1-bailu.lin@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 25 Sep 2020 08:17:58 -0700
Bailu Lin <bailu.lin@vivo.com> wrote:

> This is a Chinese translated version of Documentation/arm64/amu.rst
> 
> Signed-off-by: Bailu Lin <bailu.lin@vivo.com>
> ---
> Changes in v3:
>  - Remove Documentation/arm64/amu.rst's inappropriate License claim.
> Changes in v2:
>  - Add index to arm64 directoy.
>  - Fix a document format error.
>  - Correct email encoding format.
> ---
>  Documentation/arm64/amu.rst                   |   2 +
>  .../translations/zh_CN/arm64/amu.rst          | 102 ++++++++++++++++++
>  .../translations/zh_CN/arm64/index.rst        |   2 +
>  3 files changed, 106 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/arm64/amu.rst

Applied, thanks.

jon
