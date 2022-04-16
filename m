Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA2BC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 16 Apr 2022 08:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbiDPIlg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Apr 2022 04:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiDPIlg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 04:41:36 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA2690CCE
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 01:39:05 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1DA5D60C;
        Sat, 16 Apr 2022 08:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DA5D60C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1650098345; bh=Hz8VYX4jqFVmjw8wO33Q3aqroR8IkZTrLTLsQexS4X4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lqunuzank3ZbcME77HH+p4KjeMqQm9CdiP04oM4nkRg4K7nA0r5TI2xVFawoc0s4L
         QbWh2lVKAd0rE4/CCLKTJ8OjXm0jlr5wVfTpzmzdQVVRhd08i/gqtzjCOI8UQrs182
         v29TkSvbd3MM2I+z/1GCPQA3q7LIyR5pmK0PZfggy7LW3ReOcHNcv/++/KwTUBqzqf
         /Syy+IhKHDn0Bh0HmHmOpJQdLSd96BnE1e0NhlSGgT+GLgUZ2r6hFvSuNTrW/tIhmZ
         MNLctOb7QuOQu9PlzIXtTzA9LjxWzdG0Bk1DFwa/DDafvwi3GTn/PPAgbhriU0MUl+
         8+I+pWbRHqvlg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v3 1/1] docs/zh_CN: add vm hugetlbfs_reserv translation
In-Reply-To: <2fc8a76e1308e15823eebf614f35f36f322a55d3.1649384633.git.siyanteng@loongson.cn>
References: <cover.1649384633.git.siyanteng@loongson.cn>
 <2fc8a76e1308e15823eebf614f35f36f322a55d3.1649384633.git.siyanteng@loongson.cn>
Date:   Sat, 16 Apr 2022 02:39:00 -0600
Message-ID: <87czhh4e3f.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Translate .../vm/hugetlbfs_reserv.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>  .../zh_CN/vm/hugetlbfs_reserv.rst             | 436 ++++++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst |   1 +
>  2 files changed, 437 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/vm/hugetlbfs_reserv.rst

Applied, thanks.

jon
