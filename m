Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8445C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 21:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DDE560235
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 21:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240098AbhCAVyp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 16:54:45 -0500
Received: from ms.lwn.net ([45.79.88.28]:42658 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235811AbhCAVwp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Mar 2021 16:52:45 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BC63E2B8;
        Mon,  1 Mar 2021 21:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC63E2B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614635505; bh=7QCiNeV/LGx+Kezp++PV+sgJR5/h7g4Lbc34vL/8M5s=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gZ/Kt8NN2Vb1oGoXs3Q0bIixByIlGIlihtkjAUgBcXVLQ2Ewl5HbDG1rWY/CNHhkQ
         FLLNJdBvha8CxdZCDXVcs8VCqar3+8YZH3SKmMWAvsv4UmajSQpGuCTxRz8SkHpvFa
         JO5G/CiECqKGJkwHMWuGdywEt6lMURtKiwVDqk5b7igOaozdRwUqEbXct+5DcdZkP4
         zr7Tn0ZdnlJtXqAZYToGUjZwqYFEX9UYz4eDhuHfI2a6EUDrbINCwIhKksNjikXjTx
         8+ISYgkWcR7POvqPkg71rsmb53fUcRyzlZYO25r29rkhcP+6TlQB8o552yKZCQgOQM
         icLzFJs8ptgQg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [RFC v3] scripts: kernel-doc: fix typedef support for
 struct/union parsing
In-Reply-To: <20210225145033.11431-1-yashsri421@gmail.com>
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
 <20210225145033.11431-1-yashsri421@gmail.com>
Date:   Mon, 01 Mar 2021 14:51:44 -0700
Message-ID: <87pn0i35lb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Aditya Srivastava <yashsri421@gmail.com> writes:

> Currently, there are ~1290 occurrences in 447 files in the kernel tree
> 'typedef struct/union' syntax for defining some struct/union. However,
> kernel-doc currently does not support that syntax. Of the ~1290
> occurrences, there are four occurrences in ./include/linux/zstd.h with
> typedef struct/union syntax and a preceding kernel-doc; all other
> occurrences have no preceding kernel-doc.
>
> Add support for parsing struct/union following this syntax.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Applied, thanks.

jon
