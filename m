Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AE4C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jun 2022 19:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiFXTjU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jun 2022 15:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiFXTjT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 15:39:19 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA5E5DF19
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 12:39:19 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C012F2A0;
        Fri, 24 Jun 2022 19:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C012F2A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1656099558; bh=XJtsCW0NTaG4wWdkHjHtz38LEcS2JF1NnTig4OgiIp8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Gyp3Lck480t0Mph4jyIHnoi2q4VkD/dmnu/9XgAgQ7yhuNx0wpfUDl7Dp5lchDNxo
         68WQpVG8kDzoBakb7R6xLe2WaE0iO7V+QZIcfd3FGpqWxOeE7lyp90wlzgDEMz8pWX
         7SHgTHKfPGaOyvBzz/LcacAEnx1WB7XcJkvrQOoAG6B+IGhOosHFlaI5epH/5SHRBL
         AoA44HJbzgpDDttdZ0vKj1XIYGx6qVxy6Vbu7GuaVxnJfzdz56ygFDwvlme58FLxPN
         A8jH94iKIlLeBITjDfhXz0qO+5wTB+obKBupsdiMGEPca1/5E41o8BgeB4oDrbpAvm
         oBUqRyxxtYrPQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org,
        siyanteng@loongson.cn
Cc:     chenhuacai@loongson.cn, bobwxc@email.cn, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V2 0/2] docs/zh_CN: riscv: Update the translation to
 5.19-rc1
In-Reply-To: <cover.1654685338.git.zhoubinbin@loongson.cn>
References: <cover.1654685338.git.zhoubinbin@loongson.cn>
Date:   Fri, 24 Jun 2022 13:39:18 -0600
Message-ID: <8735ft4zrt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Binbin Zhou <zhoubinbin@loongson.cn> writes:

> The content of riscv Chinese documents lags behind the corresponding
> English documents, and the relevant commits are updated synchronously.
>
> Changes since v1:
> 1.The features.rst file does not need to be translated.
> 2.Update the commit message.
>
> Binbin Zhou (2):
>   docs/zh_CN: riscv: Remove the translation of pmu.rst
>   docs/zh_CN: riscv: Update the translation of vm-layout.rst to 5.19-rc1
>
>  .../translations/zh_CN/riscv/index.rst        |   1 -
>  .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
>  .../translations/zh_CN/riscv/vm-layout.rst    |  37 +++
>  3 files changed, 37 insertions(+), 236 deletions(-)
>  delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst

Series applied, thanks.

jon
