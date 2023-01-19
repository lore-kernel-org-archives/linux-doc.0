Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAD2C46467
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 21:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjASVVK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 16:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjASVUR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 16:20:17 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74564265AE
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 13:14:08 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8F8D82C0;
        Thu, 19 Jan 2023 21:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8F8D82C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674162824; bh=wpNJa31GP/3CO69It2vDWiFDL6RmiEBoSTEIbaVubmI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QCs0mhroV3uh0yfvNgRGATiabXb4e0oPOkox2ocHQTZ+4UUcYL6DcR80uHL+9mcoF
         f93thWyCFodffpdtSKS5OI7jjwODVrRDRmSTWj6ojixDFsDii0t0f2VFfNnCkvNCDh
         D4ZaPUaW0tp1t4uwm8Y1HPyEnXypPORJC7ICdCygv3SrQoAfPzTqLR9fcR+Ura6iYy
         YNz00bZx6BZ68FkP7+gsHlV4ENBDPQ43KpdoKwQE1LZEhClIs8Qlr0dkA0ImimvBkK
         K1qmXqwKKdo5mVkIKKk4u2qIvvTA/kEyByTU25cPrMwn656BKuf5cHTUf0r9ux95xB
         jkPzdZskEj9SA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, bobwxc@email.cn,
        tangyeechou@gmail.com, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, me@lirui.org, siyanteng01@gmail.com
Subject: Re: [PATCH v3] docs/zh_CN: Add a glossary of Chinese translation terms
In-Reply-To: <20230117093416.2262787-1-siyanteng@loongson.cn>
References: <20230117093416.2262787-1-siyanteng@loongson.cn>
Date:   Thu, 19 Jan 2023 14:13:43 -0700
Message-ID: <874jsm8by0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> As more and more documents are translated and some English
> words are translated into different Chinese, it seems that
> we need a glossary of Chinese translation terms.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Reviewed-by: Tang Yizhou <tangyeechou@gmail.com>
> Acked-by: Wu XiangCheng <bobwxc@email.cn>

Applied, thanks.

jon
