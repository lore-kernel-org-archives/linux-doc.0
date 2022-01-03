Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDBEC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jan 2022 22:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbiACWwh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jan 2022 17:52:37 -0500
Received: from ms.lwn.net ([45.79.88.28]:51066 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230361AbiACWwh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Jan 2022 17:52:37 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BFBA0380;
        Mon,  3 Jan 2022 22:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BFBA0380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1641250356; bh=zZcTSll9169iHI2x8zFRuJHQeRArUKSVKvKv6oTwNII=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SHTxVh1lYv770kb1MdkUQprki8wMpKhlIrkEbqp0FAua0JFkBroMW3HNK0nvPlYd0
         RuPuTuJi6r/Vfu8GY5GMFS0biValb66JoE3PlbRN6Xat6rOsmyokFWWXe0dD8uSZS4
         PgjDBYcwcWPuZ7akQJ7hzLGMZkGD5zTeOG8tMqcXOD098zrH6busYwZSQr/Obyd6Hn
         kjRQqIvZvT6Lfsg1wXaSDtO8evMFVKMQ40fmqz6DttcvuiczbcPMx+v57gyWGJLACi
         yM6G5lA+/+08GXwgQ8Dm2FW37lyibBsSx5fsWpAffDJT2F0ap98y1uUa5tpMk4E+UV
         uV64F2c2tMsSg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        Alex Shi <alexs@kernel.org>, Wu XiangCheng <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: [PATCH] docs/zh_CN: Update and fix a couple of typos
In-Reply-To: <20211230025702.186158-1-shile.zhang@linux.alibaba.com>
References: <20211230025702.186158-1-shile.zhang@linux.alibaba.com>
Date:   Mon, 03 Jan 2022 15:52:39 -0700
Message-ID: <87ee5oxwi0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Shile Zhang <shile.zhang@linux.alibaba.com> writes:

> Update to the original README.rst and fix some typos.
>
> Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
> ---
>  .../translations/zh_CN/admin-guide/README.rst         | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Applied, thanks.

jon
