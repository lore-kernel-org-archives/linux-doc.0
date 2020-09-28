Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C50C2D0A8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 21:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C24F2083B
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 21:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgI1VX1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 17:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgI1VX1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 17:23:27 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB13C061755;
        Mon, 28 Sep 2020 14:23:27 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7DBD772D;
        Mon, 28 Sep 2020 21:23:26 +0000 (UTC)
Date:   Mon, 28 Sep 2020 15:23:25 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bailu Lin <bailu.lin@vivo.com>
Cc:     alex.shi@linux.alibaba.com, catalin.marinas@arm.com,
        harryxiyou@gmail.com, kernel@vivo.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH v5] doc: zh_CN: index files in arm64 subdirectory
Message-ID: <20200928152325.5dde1487@lwn.net>
In-Reply-To: <20200926022558.46232-1-bailu.lin@vivo.com>
References: <20200925144223.40381-1-bailu.lin@vivo.com>
        <20200926022558.46232-1-bailu.lin@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 25 Sep 2020 19:25:58 -0700
Bailu Lin <bailu.lin@vivo.com> wrote:

> Add arm64 subdirectory into the table of Contents for zh_CN,
> then add other translations in arm64 conveniently.
> 
> Signed-off-by: Bailu Lin <bailu.lin@vivo.com>
> ---
> Changes in v5:
>  - Remove zh_CN/arm64/index.rst's inappropriate License claim.
> Changes in v4:
>  - Remove index.rst's inappropriate License claim.
> Changes in v3:
>  - Correct email encoding format.
> Changes in v2:
>  - Fix patch description.
> ---
>  Documentation/arm64/index.rst                    |  2 ++
>  Documentation/translations/zh_CN/arm64/index.rst | 14 ++++++++++++++
>  Documentation/translations/zh_CN/index.rst       |  1 +
>  3 files changed, 17 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/arm64/index.rst

Applied, thanks.

jon
