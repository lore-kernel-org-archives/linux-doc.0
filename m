Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA6DC63777
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 19:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF7EF20679
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 19:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388253AbgK3T6j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 14:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388227AbgK3T6j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 14:58:39 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF42C0613D2;
        Mon, 30 Nov 2020 11:57:59 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B56156E6;
        Mon, 30 Nov 2020 19:57:58 +0000 (UTC)
Date:   Mon, 30 Nov 2020 12:57:57 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2] docs: automarkup.py: Allow automatic cross-reference
 inside C namespace
Message-ID: <20201130125757.1eccdaa2@lwn.net>
In-Reply-To: <20201117021107.214704-1-nfraprado@protonmail.com>
References: <20201117021107.214704-1-nfraprado@protonmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 17 Nov 2020 02:12:01 +0000
Nícolas F. R. A. Prado <nfraprado@protonmail.com> wrote:

> Sphinx 3.1 introduced namespaces for C cross-references. With this,
> each C domain type/function declaration is put inside the namespace that
> was active at the time of its declaration.
> 
> Add support for automatic cross-referencing inside C namespaces by
> checking whether the corresponding source file had a C namespace Sphinx
> directive, and if so, try cross-referencing inside of it before going to
> the global scope.
> 
> This assumes there's only one namespace (if any) per rst file.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> 
> To those following from v1:
> 
> I ended up doing the simplest solution possible, which is to just directly read
> the rst source corresponding to the doc page right before doing the automarkup.
> It's not very efficient in the sense that the source is being read
> twice (first by Sphinx, then by this), but it sidesteps the "data sharing
> between processes" issue, so parallel_read_safe can be reenabled, and I didn't
> notice any performance hit from this patch (as opposed to the big hit from v1).
> Works with both Sphinx 2 and 3.

OK, I've (finally) applied this, thanks.  It does indeed seem to work.
Still hoping for something more elegant someday...:)

Thanks,

jon
