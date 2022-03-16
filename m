Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B70FC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Mar 2022 21:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347456AbiCPVI1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 17:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243953AbiCPVI1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 17:08:27 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6A062105
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 14:07:11 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4A19F2C3;
        Wed, 16 Mar 2022 21:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4A19F2C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1647464831; bh=lBiS9/Xb0eQ+VdI3bACjjn3aH9Q2Rpy8rYZ10GFxPv4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oTOcyVFkPwrCa6Yf7syZtTR8rjvSNOAaw+SLLsQzIrAWc257VewS4OVLTOIz2mVof
         U46bT20b4wUdjAVBD+MBsYDLoCNuJdn2wm/uR/1JAAWxCBnjjx5BcMSvUbDKgBCsDY
         k3xm7UEVwLgnJBp0D1GYgCBysAqTiWCgFbq3JL3s8fw5LB2xl/2tVqB/vCmoTU07cJ
         apm0U9zZJnegjWcioCdbbGgRVT+D+G3ldC6IZrs7Y5KeoKDiCBA+7kq5259DgITbLH
         CYfwNNhRWTDw670XSfEsdUSQLvTq9evtNLCISZvwuV4lLDFdSTzf2Lst9lJeWtA63M
         Tf+Ze8i0DdZ9w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, peterz@infradead.org,
        mingo@redhat.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        siyanteng@loongson.cn, siyanteng01@gmail.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2] docs: scheduler: Convert schedutil.txt to ReST
In-Reply-To: <20220312070751.16844-1-tangyizhou@huawei.com>
References: <20220312070751.16844-1-tangyizhou@huawei.com>
Date:   Wed, 16 Mar 2022 15:07:10 -0600
Message-ID: <871qz1txmp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> All other scheduler documents have been converted to *.rst. Let's do
> the same for schedutil.txt.
>
> Also fixed some typos.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
> v2:
> Remove unnecessary space-to-tab conversions.
>
>  Documentation/scheduler/index.rst             |  1 +
>  .../{schedutil.txt => schedutil.rst}          | 30 +++++++++++--------
>  2 files changed, 18 insertions(+), 13 deletions(-)
>  rename Documentation/scheduler/{schedutil.txt => schedutil.rst} (92%)

I have applied this version.

Thanks,

jon
