Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF97AC25B0F
	for <linux-doc@archiver.kernel.org>; Sat, 13 Aug 2022 16:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234900AbiHMQxR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Aug 2022 12:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239927AbiHMQxQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Aug 2022 12:53:16 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FE427CEF
        for <linux-doc@vger.kernel.org>; Sat, 13 Aug 2022 09:53:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E421B6E3;
        Sat, 13 Aug 2022 16:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E421B6E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1660409595; bh=N3pPQU6EAE8u1q31RZgTc/C6IqDkrX0lsDB/ZPF0Mqk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nLftZaWUuJEy3Ddg2aG3YjnQZAOTSURFSrCfI8ykyL2hE1o2Ndl64xcZ5XGcmtU9s
         0gmbnEqVr/swmoRxhJ2EPnxRlw8Ku60L24MgbunYXRQ1aQpZKYhtBnTyOBZFQl0rny
         xxB6cMYrUaJSf3jjqzHjwLv+wR3nyZxyQ0x8bpZYObiVuzMYEUVPkdmySXLrc5rkSO
         m29O6PpxAwoqCVjgwEBaNXR0DaaH0tY1rl8NZxrUXmtIymh+JEjcz5tUjBYRnShFqn
         UZ8ouoAUhB3ICY13RF39baX3N8rQhZ0Uy9RhPLNHhJwpVdK1uizAcbDqTLmvlhAv5c
         Vsv1vD5P6/JEA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-doc.rst: move label "_kernel_doc" to top
In-Reply-To: <Yvex3fQSXFX3alIu@bobwxc.mipc>
References: <Yvex3fQSXFX3alIu@bobwxc.mipc>
Date:   Sat, 13 Aug 2022 10:53:13 -0600
Message-ID: <87zgg8w0ee.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <wu.xiangcheng@linux.dev> writes:

> From: Wu XiangCheng <bobwxc@email.cn>
>
> "_kernel_doc" label which should refer to the entire document was in the
> middle, move it to top. Also fix zh translation.
>
> Fixes: 46347502b099 ("Restructure kernel-doc.rst")
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  Documentation/doc-guide/kernel-doc.rst                    | 3 ++-
>  Documentation/translations/zh_CN/doc-guide/kernel-doc.rst | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Rather than do this, is there any reason to not just delete the label
entirely?  If anything references it, it can just name the file instead.
But, as it happens, it's not even referenced anywhere...

Thanks,

jon
