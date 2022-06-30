Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1884EC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 30 Jun 2022 17:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236458AbiF3Rdv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Jun 2022 13:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236453AbiF3Rdu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jun 2022 13:33:50 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD023ED02
        for <linux-doc@vger.kernel.org>; Thu, 30 Jun 2022 10:33:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 331DD4B7;
        Thu, 30 Jun 2022 17:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 331DD4B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1656610429; bh=PAz95RVHDrQdNi+jh1vNYk/XoJCvy181Mtlx2c7tsHM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LnuczBREn9t0o1Wl5S5RNULEivR+qlK6iEjCAWgiXiTFGC1DvFq8A4x4wXH9700Lp
         FGhEuSFpuYycVE4fl8A/1WCA5Yrvbelk0jolGjb2b6ycwAHELU+S5OGgxWIq/ZEpd7
         Eu7jyTfOTA5LfZGf2BB5UdYZGmPdFEwG+5tTfyubsdwlHTmakVVmqDVZLekzlPFD/y
         SiU3flxtkHRp7cs+Ro0y7ODO0NkN4k7uqvKfcEkN+g32puvoITB7laIrOef+i8MpdC
         /CyNSNXgEy32rg5ZzhDpxtmRgw2cd1cC1uCu8OaG9ZxqabzAfV/fMgCskiyGhnlXE2
         BGQCEMBzoANEQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     yizhou.tang@shopee.com, siyanteng@loongson.cn, alexs@kernel.org,
        seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, robin.lubin@shopee.com, huangh@sea.com,
        bobwxc@email.cn, Tang Yizhou <yizhou.tang@shopee.com>
Subject: Re: [PATCH v2 0/2] Add mutex-design Chinese translation
In-Reply-To: <20220629013240.65386-1-yizhou.tang@shopee.com>
References: <20220629013240.65386-1-yizhou.tang@shopee.com>
Date:   Thu, 30 Jun 2022 11:33:48 -0600
Message-ID: <87tu82njib.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

yizhou.tang@shopee.com writes:

> From: Tang Yizhou <yizhou.tang@shopee.com>
>
> v2:
> Take Alex's advice and pick his Reviewed-by tag.
>
> Tang Yizhou (2):
>   docs/zh_CN: Show the Chinese translation of spinlocks
>   docs/zh_CN: Add mutex-design Chinese translation
>
>  .../translations/zh_CN/locking/index.rst      |   5 +-
>  .../zh_CN/locking/mutex-design.rst            | 145 ++++++++++++++++++
>  2 files changed, 148 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/locking/mutex-design.rst

Series applied, thanks.

jon
