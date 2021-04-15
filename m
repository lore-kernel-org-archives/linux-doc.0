Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C63C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 15:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6229561131
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 15:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhDOPUW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 11:20:22 -0400
Received: from ms.lwn.net ([45.79.88.28]:52460 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233905AbhDOPSg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 11:18:36 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 19DAA24D7;
        Thu, 15 Apr 2021 15:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 19DAA24D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618499892; bh=F2kvtD3Uizp+1hvWvIXdFcvuRVTsCbwGfd1WBc6FthU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=L1+gXit7+dfkYP9jy2f6G7WhHH+x9sv6gq2jTBVLI9QKbWj5ZBg96ZdQraX49npYH
         FEWSLilS9PcM8jdv7KMZgwv7OHo5YG7Y0zsH4FGl38T0tatBt+7KXvSD8sL/YBn7Nn
         o7OQNcUvVmcvFT5FIb13PSn1MpiFHUR/dBz71x5csP+PuE6FPcgnj/nDURVEyO5e8h
         9Bkp46oiO+Xb5iN5of3SyVuNyCewJ1l9o6S3BiT1m/tUcpRSmWkFQyWQUpyUTlvpLy
         PF0iygKpI+9g/ds8JZ/8Yh8Bu+/xMTJ9I9Mmo1XlF3XtsXfWhALI65zS+6hodC6CX5
         E2CjRJy22l3tA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v5 0/4] docs/zh_CN: add core api and openrisc translation
In-Reply-To: <20210415063838.2341827-1-siyanteng@loongson.cn>
References: <20210415063838.2341827-1-siyanteng@loongson.cn>
Date:   Thu, 15 Apr 2021 09:18:11 -0600
Message-ID: <87y2dj4lvw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This series of patches translates core-api/irq/* and openrisc/* into
> Chinese
>
> v1 -> v2:
>
> Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewiew!
>
> v2 -> v3:
>
> keep the signs number equal to the title char under Alex's suggestion.=20
> Thanks for his rewiew!
>
> v3 -> v4:
>
> Add Xiangcheng Wu's review sign to 0002=E3=80=810003 and 0008; Thanks for=
 his rewiew!
>
> v4 -> v5:
>
> Split 8-11 into a separate series

So I am now totally confused.  I have two "v5" series with the same
subject; they are evidently different but there's no explanation of why
or which order I should put them in.

Please, why have you done this, and what do you expect me to do now?

Thanks,

jon
