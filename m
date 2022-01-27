Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D678EC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 18:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245390AbiA0Sww (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 13:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244451AbiA0Swm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 13:52:42 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F3AC061714
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 10:52:42 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 24D852D5;
        Thu, 27 Jan 2022 18:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 24D852D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1643309562; bh=BoM8Rpc4/yOktfRgK9KUSP4H1mdNylZ6IsOZdT0virQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HpVBF4D05xvA9cUK8oEKQn+TRDiTYY6d5c8QmnuqMa0x6FaM4ptqymEn/DLJxDvde
         K8x0Zd97NGDjFxybu/laTzTWBYSmSBLZq0dw25Xme1jtjBziJw7aCVXDBk3a+un+lC
         KhtPmnmhKrG8HSwtf66F47wlvwWyOnqhUfxxM/cUdSzMlaIpQviGxrbpNNjycEsgDs
         spaUWzoqCYoHdiZ2EcduKFr/K8QvjCb5HfD7ioD7JNAnRgQiCL6X27NtKUGlPfGW95
         rwZ10gVhLCFSxOOnS8gyiu5+tDkzhN6oWqyroUTZFmleQTyuEu13B7WEreurzo0ywq
         OvUlza78CtR4g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH 0/2] docs/zh_CN: add free_page_reporting and highmem
 translation
In-Reply-To: <cover.1643246827.git.siyanteng@loongson.cn>
References: <cover.1643246827.git.siyanteng@loongson.cn>
Date:   Thu, 27 Jan 2022 11:53:13 -0700
Message-ID: <87lez1qacm.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> Translate .../vm/free_page_reporting.rst .../vm/highmem.rst into Chinese.
>
> Yanteng Si (2):
>   docs/zh_CN: add free_page_reporting translation
>   docs/zh_CN: add highmem translation
>
>  .../zh_CN/vm/free_page_reporting.rst          |  38 ++++++
>  .../translations/zh_CN/vm/highmem.rst         | 128 ++++++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst |   7 +-
>  3 files changed, 170 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/free_page_reporting.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/highmem.rst

Set applied, thanks.

jon
