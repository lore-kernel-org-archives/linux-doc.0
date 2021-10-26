Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C08DC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 15:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 583D560E75
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 15:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbhJZP3h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhJZP3h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 11:29:37 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F18C061745
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 08:27:13 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A917B4B9E;
        Tue, 26 Oct 2021 15:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A917B4B9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1635262032; bh=n24WLDF48/Ssj6zkgEgmtNOgfFkoH893NZ9OShPsFTI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Px2Q70rEpRgUwVYZbSCJ5T3109dAn393kuwUOnoFsBt0CKYNZMC67k/vIL3xMA3K6
         yFOeY0vd75j/UkdPixYWFjzDqgNXQBf4qTox2HkQ2rujkc9560ex66NTzFCX0bQzvF
         XRaBOwNjQ9Pt/Xfh4ji9Hs9dKh2WVufwUdgNOr3+Oy6rwMAhDUzNsmjN3S3VuB/RSB
         8opYuiKAX9QUvXRhndhObCjeXDsErJPLRU/AIGN+zTszY7UD65lq1miFmUKWCmW46w
         5fhiGSmldlbFsgxfG8lwDaKK6Kd/dhpCBknaEHyZYd2Gsa9eFsblk/ugK4/qkPxcaq
         SHsvSwDD8TSBg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 0/2] docs/zh_CN add pci.rst translation
In-Reply-To: <cover.1635248253.git.siyanteng@loongson.cn>
References: <cover.1635248253.git.siyanteng@loongson.cn>
Date:   Tue, 26 Oct 2021 09:27:12 -0600
Message-ID: <87ilxjg627.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v2:
>
> pick Alex's Reviewed-by tag.
>
> v1:
>
> Translate ../PCI/pci.rst into Chinese
>
> Yanteng Si (2):
>   docs/zh_CN add PCI index.rst translation
>   docs/zh_CN add PCI pci.rst translation
>
>  .../translations/zh_CN/PCI/index.rst          |  36 ++
>  Documentation/translations/zh_CN/PCI/pci.rst  | 514 ++++++++++++++++++
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  3 files changed, 551 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/PCI/index.rst
>  create mode 100644 Documentation/translations/zh_CN/PCI/pci.rst

Applied, thanks.

jon
