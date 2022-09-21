Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D4BECAAD8
	for <linux-doc@archiver.kernel.org>; Wed, 21 Sep 2022 20:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiIUUJ6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 16:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiIUUJ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 16:09:57 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7A928720
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 13:09:54 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5A6457F9;
        Wed, 21 Sep 2022 20:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5A6457F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1663790994; bh=raUjmRtjI3iJ70Zuhb3GkP9bImIhANGF1m+HIvCvuUY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QH/AddF7lRU908b+ZHijqXE2Z5fymQYAhXCZVmCjqOcH/UrGp/+TCd9gp5eQClw3U
         QgzxqoqgoHP8GdV0UoKzUAKFcQoBX32UALoh2RGgJxClDT68C0Z0kTlqZ4s68XAqxC
         3G+ZP+puAt/kEorJNdOtdnn+CSK8ZWjTNE6RSTzNr8T59pTJiamNGPdGJy+t2X9DPJ
         ckjBUKTYLDYA3DZ2lDHXDjGud2C0ytiSg7868eqQ6umhN8IA+wpCpyNYygq3yYI3oK
         A0ijmYV7ezLVxVJujPb8ARr9uHp6fck3kWP+AIma04M8S6EOo60by5CGmvlrjQib8J
         ZRcpnZxNwyQ/Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     linux-doc@vger.kernel.org, Andy Deng <theandy.deng@gmail.com>,
        Zefan Li <lizefan.x@bytedance.com>
Subject: Re: [PATCH] docs/zh_CN: Update zh_CN/process/coding-style.rst to
 6.0-rc2
In-Reply-To: <Yw2ewM4wfaDDLjTk@bobwxc.mipc>
References: <Yw2ewM4wfaDDLjTk@bobwxc.mipc>
Date:   Wed, 21 Sep 2022 14:09:53 -0600
Message-ID: <87czbov69a.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <wu.xiangcheng@linux.dev> writes:

> From: Wu XiangCheng <bobwxc@email.cn>
>
> * update to commit c04639a7d2fb ("coding-style.rst: trivial: fix
>   location of driver model macros")
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../zh_CN/process/coding-style.rst            | 274 +++++++++++++-----
>  1 file changed, 202 insertions(+), 72 deletions(-)

Applied, thanks.

jon
