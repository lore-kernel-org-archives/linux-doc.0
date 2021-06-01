Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B3EC4708F
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 22:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CD74613AD
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 22:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbhFAWuB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 18:50:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:45678 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234799AbhFAWuB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Jun 2021 18:50:01 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3A2B36E2;
        Tue,  1 Jun 2021 22:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3A2B36E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622587699; bh=1lxdD2e/hRyTVseGue3xmHHNBf5wA/ijpSwbUndWQg4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DMtYTqG/W7DEz1588FmAxnO35OOl2h5syoaI/iciJiEYoMhnqnQZj+tGKyAHgDAas
         Xftfgsx6VEuWFzsFLHdlAlPbAFi0V+9LZmvZQwibkJTbrsi0VZrOcnFD0A3PU+rIaT
         +vqXOponlE/a5UUm7xiMdjHmyI5fXpESAI1WUbQdiKXeGYz55Q7uK7coBquAq4/3Pc
         /QHlxDiNhEeEU7QM2CfT5WddRWozWeN0Rlnfw4W/xlIEc4C6hZsdfjZQDlt2U3HNHe
         bO48/w9FH/VpWnBrL3KcuaZp5ghju+7mk8YnB8FzLeO2Q7Cj9sy4zfi7aGLSZ1/fbF
         3MiSPYvGxODCg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3] docs/zh_CN:add core-api padata translation
In-Reply-To: <20210531124105.946859-1-siyanteng@loongson.cn>
References: <20210531124105.946859-1-siyanteng@loongson.cn>
Date:   Tue, 01 Jun 2021 16:48:18 -0600
Message-ID: <87im2x8aml.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Translate Documentation/core-api/padata.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v3:
>
> * pick Xiangcheng's reviewed-by tag.
>
> v2:
>
> * Modified some words under Xiangcheng's advices.
> * update Documentation/translations/zh_CN/core-api/index.rst diff.
>
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../translations/zh_CN/core-api/padata.rst    | 158 ++++++++++++++++++
>  2 files changed, 159 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/padata.rst

Applied, thanks.

jon
