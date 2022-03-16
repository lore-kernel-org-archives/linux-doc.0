Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE3EC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Mar 2022 21:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358188AbiCPVwc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 17:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358159AbiCPVw1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 17:52:27 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0FE11C30
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 14:51:12 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5F4362C3;
        Wed, 16 Mar 2022 21:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5F4362C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1647467472; bh=mJWjxMnI+2nlNx0KF+siStzh4CrYx06d+Z6j+k6pR/8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=m6jwSmQAavP3ygYJABzq39ZJGiJP6bwbwpQ3/J6n8XJAtqwe/ZLd9inSv9SLB7UmB
         KlCBorLx303GLIhekcsFCbNa9eyMa6woKFeINi7rV7AW05vQHnBGauTPbG3VIyoMLc
         RVjOp6JBINp3t7W+cXNKkroenUqtF7XVO5WcREX37NcfkvjuxipvHPtQF8jVXOX5jF
         ocwcAE9qarLJvEDjHliGpEQT4x46fnVzq+iOpTd+mWZOBArjMd5gLDw1sR0VcpdYBd
         I5QgzFvcFqfXAJYaqX/qBFLTXE1Wb2WGKFmO3P34fbwYlJIfDYIy5kqsEz439+Y0c+
         wDnaC6xv0cI4A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH] docs/zh_CN: Add sched-nice-design Chinese translation
In-Reply-To: <20220312072642.23118-1-tangyizhou@huawei.com>
References: <20220312072642.23118-1-tangyizhou@huawei.com>
Date:   Wed, 16 Mar 2022 15:51:11 -0600
Message-ID: <87bky5sh0w.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/sched-nice-design.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  .../translations/zh_CN/scheduler/index.rst    |  2 +-
>  .../zh_CN/scheduler/sched-nice-design.rst     | 99 +++++++++++++++++++
>  2 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-nice-design.rst

Applied, thanks.

jon
