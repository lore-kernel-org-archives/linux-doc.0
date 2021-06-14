Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F55FC48BE6
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 21:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD1A961001
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 21:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbhFNV5u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 17:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhFNV51 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 17:57:27 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB92C061574;
        Mon, 14 Jun 2021 14:55:18 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9ADB1734;
        Mon, 14 Jun 2021 21:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9ADB1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1623707718; bh=SvCPEL3LymRJY8Z4zFDjusjTKlfzkWoiS1/ZZxd122Y=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VRcO5xEuHvCJwtBVqAoftQoyPdyhozTSlEx4GDEM2mB/zNGORsI4XmVSiUZFnvBug
         s9ha4MwVsxWqU7mi20fthSZ3rriHwS9tmKeS7+qEky6sXVDArkG/R/s1rKQKLKuuL4
         v4Ki6cAZBdJwzA++o869koK/ChllfrU2YaDseelroKovJP0cfEu3d7P56NowrEQAc3
         v64gsRzEIAr+udcIAoegsUn8wj9jqIbFEi0cUVufngJdgOpPZ6ECPmfT7Zk/CTQ5ep
         YOacoUYiYj9n7XnPWLX4AT9C4TCOqZrBn7BP6YlzOPictSAi/IqssOMYIUwpTkbazk
         12zYgLqwEoGpg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hu Haowen <src.res@email.cn>, alexs@kernel.org, bobwxc@email.cn,
        maskray@google.com, bernard@vivo.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hu Haowen <src.res@email.cn>
Subject: Re: [PATCH v2 1/2] docs/zh_CN: update a translation in
 zh_CN/dev-tools/gcov
In-Reply-To: <20210522025545.57275-1-src.res@email.cn>
References: <20210522025545.57275-1-src.res@email.cn>
Date:   Mon, 14 Jun 2021 15:55:18 -0600
Message-ID: <87im2g1589.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hu Haowen <src.res@email.cn> writes:

> The original file has added some words in commit c797997a244cd2c58908
> ("Documentation: dev-tools: Add Testing Overview"), hence update the
> Chinese translation of them.
>
> Signed-off-by: Hu Haowen <src.res@email.cn>
> ---
>  Documentation/translations/zh_CN/dev-tools/index.rst | 3 +++
>  1 file changed, 3 insertions(+)

I have been holding onto this series in the hope that somebody would
review it ... any takers?

Thanks,

jon
