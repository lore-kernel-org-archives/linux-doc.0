Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C8FC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 17:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FA0E60F4B
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 17:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238007AbhI0RqK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Sep 2021 13:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237939AbhI0RqG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Sep 2021 13:46:06 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7928C019DA4
        for <linux-doc@vger.kernel.org>; Mon, 27 Sep 2021 10:26:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 63851774;
        Mon, 27 Sep 2021 17:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 63851774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1632763580; bh=Q+9Z9CHlzFd83VIyytv9hghjr8VBDb14oNbQJ886udU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZTbH4OTu1oysmKAWPueDHjJ5VKV+eRjBwfWeoRvUz3S0+aLslLzdHOWHLk5yU1di4
         FMC27P8vMz/SwOdi2lKoKU4mB/usxd1wX/5AOF3pwA5TcJ+Ztzq0cqe3/aAUKsswVQ
         P0C6UFXYGCl3lMDvYJjmGp/FeoyO4/Pm4AUnz97YOV/UnIwnBu7YBtIfRbN44Loxs4
         riOuKp3R+/LbmOBnmvDo3YVlJhWOi1ZajeRNMp16HsjPR1jxgWDN7ZgY3hWmENC5ky
         JHQcfFsKM6HPGPeLAIg+a/1iVxEa2cLYCQwhFX+IVNhEa6USKqNxiqgeCQg+FjaSbG
         xYZOwVWJcN97w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, cgel.zte@gmail.com,
        junhuahuangdream@163.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v2] docs/zh_CN: add core api kref translation
In-Reply-To: <20210923095559.983679-1-siyanteng@loongson.cn>
References: <20210923095559.983679-1-siyanteng@loongson.cn>
Date:   Mon, 27 Sep 2021 11:26:19 -0600
Message-ID: <87wnn2hqv8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> From: Yanteng Si <siyanteng01@gmail.com>
>
> Translate Documentation/core-api/kref.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
> Pick Alex's Reviewed-by tag.
> Thank you for your review!
>
> .../translations/zh_CN/core-api/index.rst     |   3 +-
>  .../translations/zh_CN/core-api/kref.rst      | 311 ++++++++++++++++++
>  2 files changed, 313 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/kref.rst

Applied, thanks.

jon
