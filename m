Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE913C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 16 Apr 2022 08:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiDPIYF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Apr 2022 04:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiDPIYE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 04:24:04 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D9E2125D
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 01:21:34 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1DFF02CC;
        Sat, 16 Apr 2022 08:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DFF02CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1650097294; bh=2DPdB6qDbWYtZAcU5Zi7HimVmItrlRysllWkAvdB+gE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=L08WAERSW4TsiXxppoqy61hZyIoSpgyd1BXWjCHfFeHFOOc7kwjCT4Ha1iM5A8/jL
         dow8eq8FtIFQjXsX0Vw4UGk2UL3SnY9S0b58B3xTot6lpcAnDU72S/6WluscSJUFjG
         EdQ+HES+a0fQeJEi/AqgQOl5j6iqMdhU7+55cbZ8d0eUhAbPYakuMeuwNzVhyAgJCa
         jkuB/fuWPkHDS9UvYYx0uOIODDmQLvTVl2RpYh4hpbAaKXwQN4XngwQ5clmbqGnfrE
         gpTf4zVYyMhaGRPRk6T5IyjsgYdHka5XTQQey7IGrRESOhMPdKYPUJqGceurtB6nTg
         lvNu1EF055pJg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2 0/2] Add spinlocks Chinese translation
In-Reply-To: <20220408144742.23225-1-tangyizhou@huawei.com>
References: <20220408144742.23225-1-tangyizhou@huawei.com>
Date:   Sat, 16 Apr 2022 02:21:29 -0600
Message-ID: <87lew54ewm.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Now I start to translate some documents of locking.
>
> Tang Yizhou (2):
>   docs/zh_CN: Add locking/index Chinese translation
>   docs/zh_CN: Add spinlocks Chinese translation
>
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  .../translations/zh_CN/locking/index.rst      |  42 +++++
>  .../translations/zh_CN/locking/spinlocks.rst  | 149 ++++++++++++++++++
>  3 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/locking/index.rst
>  create mode 100644 Documentation/translations/zh_CN/locking/spinlocks.rst

Applied, thanks.

jon
