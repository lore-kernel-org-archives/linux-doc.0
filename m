Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A182C433DB
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 23:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC69E652B1
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 23:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhCHXCL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 18:02:11 -0500
Received: from ms.lwn.net ([45.79.88.28]:54518 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231841AbhCHXCH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Mar 2021 18:02:07 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C74BC31A;
        Mon,  8 Mar 2021 23:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C74BC31A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615244526; bh=pD+tT/wMu9YWnJibPYF7u0XE9BUaaHuocRWO0mxi/0U=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SlpRJ7L7Cn9mPf8vci4b7sRPJyDqODAk4dWQRGPZUaAPsYIbNbBNYpMAJVmPqPbLi
         zZyDbQkgCdHiAaOFRcaxQKQlv4eH6l/QQJSovT42fGgW+Mrli3F9GUIrxALxKPV8CD
         fmEyKQsez4vdmfMzw8YsFbS4SX1nVGWhgVCa3DSHPcUMBnA4qNd5cGSRkWpdzQOE6z
         HOgNrropVGdJyg8p2GYY6mlFii3tBXMINe7TyoQEyGtUmS+33l9GlFnVyHyjzwDXhx
         V5i1y+tl8PImUp1nB1ZGj0QttpasiUTEybktFNGYGep4pj1udrvdDj0Iu41Cd1xE1n
         QsDepbkL5/Kag==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>,
        Alex Shi <alex.shi@linux.alibaba.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/9] docs/zh_CN: Improve language in zh_CN/process/
In-Reply-To: <cover.1614920267.git.bobwxc@email.cn>
References: <cover.1614920267.git.bobwxc@email.cn>
Date:   Mon, 08 Mar 2021 16:02:06 -0700
Message-ID: <87blbt6yhd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Hi all,
>  
> This set of patches aims to polish context, improve on fluency, idiomatic
> and grammar in some files in zh_CN/process/, and synchronize them with
> original files. Some structure modifications need to rewrite the whole
> sentences, so here are a lot of changes.

OK, I have applied this set, thanks.

jon
