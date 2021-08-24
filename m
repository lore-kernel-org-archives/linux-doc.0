Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6221AC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:35:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44E3861206
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhHXTfr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 15:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhHXTfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 15:35:47 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC53C061757
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 12:35:03 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C8F64304D;
        Tue, 24 Aug 2021 19:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C8F64304D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629833702; bh=bzbEQM2DO8F14bZex+T272uZgB3Lb+wzcjJa4RFzEp4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=i0wFR/JmFUq1X3XZcnzEh0Q6RI7yteDi0gU/8SVP1BwRBJ8T+/8xlrwTh1X0FwlpT
         vVj8bdsWVFY75J6+4iXqKDx/36nRUk8CaBflLS6UhVl7R4f79i38lu2Xr4ZhynIQBs
         8D1l00J3WiVNQt1u+WLkqXZ0kM9UTh7Fg4DYchprYtvzs/skJmXK6/LwVkmSXREdQ8
         aZ/li8pjajOSPeVW/fGqcP03ardCR+z5BIOTiJ4Qggno7C01a8VQTdIAHA9lANf9La
         J1duurLqPo+pSl5BsuwONRGiMCwZd+94N8jcB0RClHdHoBfHzdBXggHC0D2bxKCaV+
         Mmey5VawoJq0Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/zh_CN: Modify the translator tag and fix the wrong
 word
In-Reply-To: <20210821081800.2205103-1-siyanteng@loongson.cn>
References: <20210821081800.2205103-1-siyanteng@loongson.cn>
Date:   Tue, 24 Aug 2021 13:35:02 -0600
Message-ID: <87sfyyljq1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Fix a wrong word;
>
> Fix old Original tag;
>
> Remove unnecessary blank lines;
>
> Modify the translator tag to be consistent with the current.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/core-api/cachetlb.rst    | 2 +-
>  Documentation/translations/zh_CN/core-api/index.rst       | 8 +++++---
>  .../translations/zh_CN/core-api/irq/concepts.rst          | 8 +++++---
>  Documentation/translations/zh_CN/core-api/irq/index.rst   | 7 +++++--
>  .../translations/zh_CN/core-api/irq/irq-affinity.rst      | 8 +++++---
>  .../translations/zh_CN/core-api/irq/irq-domain.rst        | 8 +++++---
>  .../translations/zh_CN/core-api/irq/irqflags-tracing.rst  | 8 +++++---
>  Documentation/translations/zh_CN/core-api/kernel-api.rst  | 6 ++++--
>  Documentation/translations/zh_CN/core-api/kobject.rst     | 5 ++++-
>  Documentation/translations/zh_CN/core-api/local_ops.rst   | 6 ++++--
>  Documentation/translations/zh_CN/core-api/padata.rst      | 5 ++++-
>  .../translations/zh_CN/core-api/printk-basics.rst         | 6 ++++--
>  .../translations/zh_CN/core-api/printk-formats.rst        | 6 ++++--
>  .../translations/zh_CN/core-api/refcount-vs-atomic.rst    | 6 ++++--
>  .../translations/zh_CN/core-api/symbol-namespaces.rst     | 6 ++++--
>  Documentation/translations/zh_CN/core-api/workqueue.rst   | 6 ++++--
>  Documentation/translations/zh_CN/cpu-freq/core.rst        | 8 +++++---
>  Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 8 +++++---
>  .../translations/zh_CN/cpu-freq/cpufreq-stats.rst         | 8 +++++---
>  Documentation/translations/zh_CN/cpu-freq/index.rst       | 8 +++++---
>  Documentation/translations/zh_CN/filesystems/debugfs.rst  | 2 +-
>  Documentation/translations/zh_CN/iio/ep93xx_adc.rst       | 8 +++++---
>  Documentation/translations/zh_CN/iio/iio_configfs.rst     | 8 +++++---
>  Documentation/translations/zh_CN/iio/index.rst            | 8 +++++---
>  Documentation/translations/zh_CN/mips/booting.rst         | 7 +++++--
>  Documentation/translations/zh_CN/mips/features.rst        | 7 +++++--
>  Documentation/translations/zh_CN/mips/index.rst           | 7 +++++--
>  Documentation/translations/zh_CN/mips/ingenic-tcu.rst     | 7 +++++--
>  Documentation/translations/zh_CN/openrisc/index.rst       | 8 +++++---
>  .../translations/zh_CN/openrisc/openrisc_port.rst         | 7 +++++--
>  Documentation/translations/zh_CN/openrisc/todo.rst        | 7 +++++--
>  Documentation/translations/zh_CN/parisc/debugging.rst     | 5 ++++-
>  Documentation/translations/zh_CN/parisc/index.rst         | 5 ++++-
>  Documentation/translations/zh_CN/parisc/registers.rst     | 5 ++++-
>  .../translations/zh_CN/riscv/boot-image-header.rst        | 8 +++++---
>  Documentation/translations/zh_CN/riscv/index.rst          | 8 +++++---
>  .../translations/zh_CN/riscv/patch-acceptance.rst         | 8 +++++---
>  Documentation/translations/zh_CN/riscv/pmu.rst            | 8 +++++---
>  38 files changed, 170 insertions(+), 86 deletions(-)

Applied, thanks.

jon
