Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A01C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 18:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbiA0SgP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 13:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239720AbiA0SgO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 13:36:14 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D58DC061748
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 10:36:14 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CD0EA37C;
        Thu, 27 Jan 2022 18:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CD0EA37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1643308574; bh=PJi8uyxbz7yTV6VRiSBEWXA9qL5orVWo8w1uaWrxEjQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Cc/jZvYruxalG+GS+lw+ILgWgh5+cyQqtnk+jZn79mnoP2tEh2DmYiib9qlifiraj
         DJKLlSYEzELFp7f9cpY64//gtYRzblcbVLuZsv9XoGUna0oDob5js67YQyW8fohmf5
         zYDkLtNohYk/xAomd43v+Kjwx1N7RPVwx9Ms0a3ZxN6kciHjZX8yOlqjb5GLcGTrnv
         G9VOS6H9PzWuoEU+vqyVu5XJBZA5RWL/ETcwunUIeJIv4noQCoX72M6p48qaCavuPH
         SOn1sX8YBhYBQtKqm5vNsPlJkKMY/pGgKBIQfhQ4v5anPJ2xpscSwzv0shlWZLaUPs
         ciusYXpuCGYcw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v3 0/3] docs/zh_CN: add active_mm and balance translation
In-Reply-To: <cover.1641866889.git.siyanteng@loongson.cn>
References: <cover.1641866889.git.siyanteng@loongson.cn>
Date:   Thu, 27 Jan 2022 11:36:45 -0700
Message-ID: <8735l9rpoi.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v3:
> * Pick Alex's Reviewed-by tag.
> * Pick Yizhou's Reviewed-by tag.
>
> v2:
> * Modified some words under Yizhou advices.
>
> v1:
> * add vm into zh_CN/index.
> * Translate active_mm and balance into Chinese.
>
> Yanteng Si (3):
>   docs/zh_CN: add vm/index translation
>   docs_zh_CN: add active_mm translation
>   docs/zh_CN: add balance translation
>
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../translations/zh_CN/vm/active_mm.rst       | 85 +++++++++++++++++++
>  .../translations/zh_CN/vm/balance.rst         | 81 ++++++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst | 52 ++++++++++++
>  4 files changed, 219 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/active_mm.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/balance.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/index.rst

Set applied, thanks.

jon
