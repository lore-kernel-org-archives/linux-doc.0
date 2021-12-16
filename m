Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1271C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 23:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbhLPXA3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 18:00:29 -0500
Received: from ms.lwn.net ([45.79.88.28]:50984 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230092AbhLPXA2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Dec 2021 18:00:28 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7446A35F;
        Thu, 16 Dec 2021 23:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7446A35F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639695628; bh=rTR7pSxlJPyzRgkBusNcHc524FK3vUhPwF78RuGrAYY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=alqbtUL5D1/lUD9neQ0Ze73EIpGTTmekWVvcAARlZ7RoMcdHbEUAVmnNS1CJQt6PL
         og7ZKvGyWKwckBmg/uf1ejrAfSBpRCsisrKJAlowqs7z4Wcq7vuYQo+WYzfdVTaieE
         ODZerztIWwMiWbb12R9dNjiUMf36qa5t2OsWwGYfnbaO1tRs93adKT1r0BjsyXNvzd
         DtVrar/ZJ6fYo9K+je7SroUHsuLAXsbT3EEMfaqENsdZgaatiteNYJF3VcUWRiKFpw
         E6mY4pmA+V33evKqgcUxml5PPru9zds2EMMCcCc0LEg8T4ztsSwoC26+cq35Qls6cv
         MuVczufqhNtGA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add sched-design-CFS Chinese translation
In-Reply-To: <20211215033726.4538-1-tangyizhou@huawei.com>
References: <20211215033726.4538-1-tangyizhou@huawei.com>
Date:   Thu, 16 Dec 2021 16:00:27 -0700
Message-ID: <87lf0kcfzo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/sched-design-CFS.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
> v2:
> 1. Pick Reviewed-by tags.
> 2. Add a missing blank line.
>
>  .../translations/zh_CN/scheduler/index.rst    |   2 +-
>  .../zh_CN/scheduler/sched-design-CFS.rst      | 205 ++++++++++++++++++
>  2 files changed, 206 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst

Applied, thanks.

jon
