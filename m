Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB042C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 18:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234996AbhLFSUd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 13:20:33 -0500
Received: from ms.lwn.net ([45.79.88.28]:53600 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234928AbhLFSUd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Dec 2021 13:20:33 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5DA22385;
        Mon,  6 Dec 2021 18:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5DA22385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638814624; bh=5VqIQ85EdN/E5td8TSVn0T6suREpDQ9OlE30cvje1LU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=hgL1NFsH0W0nvattf70oV89L3zLVP2erJMzm/Q+44JaitDYDytUOMdpeKQBIervVW
         lZATtXX8SvmhpJMHWP4amPgRBA413J9S42tnmnesq0qO4ye0fSbQLomWQbICao0lzZ
         n6OqfLcPUTbA2uJ/mQlkb/V9FCTWPZWMQQDxxqtFweHHoaaQjlTE1kLKTVPSq8bud7
         vl58+HpcV6VEo8ho27G92fQKLJw5Wgbvje+LU378BwOBPS0ftzbmd7YgRYCXZs571H
         uRoOmd44aS6XeW0P98GDYf754dAb8UVvBmIJazujWd/HzTuEUjhCsl3+SzX9HkADT0
         g8FqiQr72hQMg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH] doc/zh-CN: Update cpufreq-stats.rst to make it more
 readable
In-Reply-To: <20211202142312.20052-1-tangyizhou@huawei.com>
References: <20211202142312.20052-1-tangyizhou@huawei.com>
Date:   Mon, 06 Dec 2021 11:17:03 -0700
Message-ID: <87h7bl38f4.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> These Chinese translations are easier to understand.
> Also add proofreader.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  .../zh_CN/cpu-freq/cpufreq-stats.rst          | 45 ++++++++++---------
>  1 file changed, 23 insertions(+), 22 deletions(-)

Applied, thanks.

jon
