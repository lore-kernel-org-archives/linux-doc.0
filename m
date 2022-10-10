Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38120C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 19:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiJJTKi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 15:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiJJTKc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 15:10:32 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF97D70E7E
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 12:10:31 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6CCFB299;
        Mon, 10 Oct 2022 19:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6CCFB299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1665429031; bh=gvYIFWP0jwsBKXcWyvqcrpoOR1BRnOSEmvhJDlPIzw4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SEvtfMsENxXb+9HosbK6lLxhTW3Akuhzkv7IWX2/3bwa+fpUxtVAO6xkg7Rracez+
         EnHqxKQZCCrxCpJ4e0h+dtA2UXJsYr61mA9fO+B3MgJ5EPS7j5F+FhV79+k5Rch57s
         8EFvYDtaefYFADCMsVjVD1QS5sjrBOHJzGdVmnGovwGYtmqIyyiAPO4lZPcX3L4Yu7
         lUuGDyI9Lwsx4Ha0L0DcSsgP8vgF2wFrll2Jy0f23Oa0EOo9fDGE8fNfYnUIHLPT8V
         K6LrrC9KBkRnYQI5b2xsAxDKBh+egBgrayA8x6Nx2KzDmeYvu1SrElR8mOxh2tW4g3
         J7qD0Gvq5+yPA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 0/2] docs/zh_CN: Update mm to 6.0-rc7
In-Reply-To: <cover.1664360331.git.siyanteng@loongson.cn>
References: <cover.1664360331.git.siyanteng@loongson.cn>
Date:   Mon, 10 Oct 2022 13:10:30 -0600
Message-ID: <87mta3pk9l.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> There are two files in the zh_CN/mm
> that need to be updated, let's do it.
>
> Yanteng Si (2):
>   docs/zh_CN: Update the translation of ksm to 6.0-rc7
>   docs/zh_CN: Update the translation of page_owner to 6.0-rc7
>
>  Documentation/translations/zh_CN/mm/ksm.rst        |  2 +-
>  Documentation/translations/zh_CN/mm/page_owner.rst | 10 +++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)

Applied, thanks.

jon
