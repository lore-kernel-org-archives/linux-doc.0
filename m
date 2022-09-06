Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A288ECAAD5
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 12:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbiIFM6x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 08:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239635AbiIFM6h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 08:58:37 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154032638
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 05:58:36 -0700 (PDT)
Date:   Tue, 6 Sep 2022 20:58:04 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1662469114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vaVktxq5fMOLBzVZDTg7zu6ORVDj8Vw2EHOW3mEue6Y=;
        b=hn0w1WoMIi3Ixg+FrY+zHHJycxZpV8rf3l1UtG4PTp6oE9Yq7OV++ZHss5db4FZuL2+qy4
        Q6oOb4wvDZDIkLbB8xskpolX55MDioS3j2SpJzy0oAkxNILASzHqqnQxGoX5VkdCIqW0Lr
        3UlZrNks6rOMI09nkS5Ujyngmn5Y5I4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com,
        corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 1/5] docs/zh_CN: add PCI acpi-info translation
Message-ID: <YxdD3B5ces+tUfBs@bobwxc.mipc>
References: <cover.1662449105.git.siyanteng@loongson.cn>
 <f07ba17ae9c6d728d6135ecc0577a932e9836fba.1662449105.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f07ba17ae9c6d728d6135ecc0577a932e9836fba.1662449105.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-09-06 (二) 16:26:47 +0800 Yanteng Si 曰：
> Translate .../PCI/acpi-info.rst into Chinese.
> Add PCI into .../zh_CN/index.rst.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/PCI/acpi-info.rst      | 139 ++++++++++++++++++
>  .../translations/zh_CN/PCI/index.rst          |  13 +-
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  3 files changed, 145 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/PCI/acpi-info.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

