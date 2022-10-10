Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FC9C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 18:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiJJSwA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 14:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJJSv7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 14:51:59 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B8D1EC46
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 11:51:57 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 66A0D299;
        Mon, 10 Oct 2022 18:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66A0D299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1665427917; bh=V3S5vl+gUZhjhJcnKDOJH6I8iTxoqbaoJ5y+dCypAkE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qCfmoOXe88I+dBo0LcHjtN6qNsUT/26mMsM1EJwQ5UeByk1H4jx93G9qCRAh9d9CJ
         A+JZL04MNVPY9QckKzTbLRw6tMnO1CirrisDUfpQZ8tvp//H//0/rThjq+eXcUdESe
         uD34Zp9QmX08H0ZX1ZHXuv7MffDUAjPquPQ3Uz3K7ChkOCgI1fv2K5RkdBXz1HulQO
         b+JJJKIUURHh2hzwME7BlU2tmKndArlH6o5PSOX5ZdfWgnLDTRLJswhm7y31udAlx/
         MHjcOMRnlBM17wPfmkRb/Tpnsq3x5BeOghg6MXbHuc2+UyPnBS4qHgkTyRsnclICAa
         QiTbO2txZFUfQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     wu.xiangcheng@linux.dev, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>,
        kernel test robot <lkp@intel.com>,
        Wu XiangCheng <bobwxc@email.cn>
Subject: Re: [PATCH v2] docs/zh_CN: Fix build warning
In-Reply-To: <20221008094139.314151-1-siyanteng@loongson.cn>
References: <20221008094139.314151-1-siyanteng@loongson.cn>
Date:   Mon, 10 Oct 2022 12:51:56 -0600
Message-ID: <878rlnqzoz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Since a patch set in my translation devicetree
> introduce some build warnings:
>
> Warning: Documentation/translations/zh_CN/devicetree/changesets.rst
> references a file that doesn't exist:
> Documentation/Devicetree/changesets.rst
> ...
>
> Change the first letter of Devicetree to lowercase.
>
> Fixes: 9485acfded20 ("docs/zh_CN: add dt kernel-api translation")
> Fixes: f773455ce59d ("docs/zh_CN: add dt overlay-notes translation")
> Fixes: 5e38432db8f3 ("docs/zh_CN: add dt dynamic-resolution-notes translation")
> Fixes: 330f5a300548 ("docs/zh_CN: add dt changesets translation")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Applied, thanks.

jon
