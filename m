Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2383C2D0E2
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4CC122208
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgIXQyF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 12:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIXQyF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 12:54:05 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC64C0613CE
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 09:54:05 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8302B382;
        Thu, 24 Sep 2020 16:54:04 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:54:02 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     anton.ivanov@cambridgegreys.com
Cc:     linux-doc@vger.kernel.org, linux-um@lists.infradead.org,
        richard@nod.at
Subject: Re: [PATCH v4] docs: replace the old User Mode Linux HowTo with a
 new one
Message-ID: <20200924105402.5615d626@lwn.net>
In-Reply-To: <20200917103557.26063-1-anton.ivanov@cambridgegreys.com>
References: <20200917103557.26063-1-anton.ivanov@cambridgegreys.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Sep 2020 11:35:57 +0100
anton.ivanov@cambridgegreys.com wrote:

> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> 
> The new HowTo migrates the portions of the old howto which
> are still relevant to a new document, updates them to linux 5.x
> and adds documentation for vector transports and other new
> features.
> 
> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> ---
>  Documentation/virt/index.rst                  |    2 +-
>  Documentation/virt/uml/user_mode_linux.rst    | 4403 -----------------
>  .../virt/uml/user_mode_linux_howto_v2.rst     | 1208 +++++
>  3 files changed, 1209 insertions(+), 4404 deletions(-)
>  delete mode 100644 Documentation/virt/uml/user_mode_linux.rst
>  create mode 100644 Documentation/virt/uml/user_mode_linux_howto_v2.rst

Applied, thanks.

jon
