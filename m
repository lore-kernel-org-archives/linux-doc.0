Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F55C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 22:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhLPW4L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 17:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbhLPW4K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 17:56:10 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BAAC061574
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 14:56:10 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4DA4635F;
        Thu, 16 Dec 2021 22:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4DA4635F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639695370; bh=O0KYuLkO+tCkA+7woSJSKA+oLpL+g4h8IoadrRwdYis=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=auba0CL9NsMfdPe7mEUwOFBuudNaNnkIZ5G3r6OalVX/6rV1ExikcCN/ZGKvVE9Z4
         NP26Sb5mUUmc6mV2KzesFUH/tUtrpbcl5V+oxPAMxdU+mHXu5Rn9WlSRjJiNrkFhH5
         3KumukMxsT2C+f9nVNogM6EI6icZEjhE2RnlApRSr6un5byloZVdIkP/l0yLYKI2AX
         cdyirFSIJ4hyR05u2wqQXz3DS/KqHHzIN/n5dRLzGjvsOp4gZcA85yenePQOHQvM8l
         b7HbBzK2/ML8kJQ+6GtxDK+208GOcgsOAM5jFMG/70Kaah9VYeAXvXp0PYvFoUR9JR
         kgFmJW9QnfTYg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v4 0/2] docs/zh_CN: add msi-howto and sysfs-pci translation
In-Reply-To: <cover.1639224005.git.siyanteng@loongson.cn>
References: <cover.1639224005.git.siyanteng@loongson.cn>
Date:   Thu, 16 Dec 2021 15:56:09 -0700
Message-ID: <87tuf8cg6u.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v4:
>
> * Test in next-20211207.
>
> v3:
>
> * remove unused label.
>
> v2:
>
> * Pick Alex's Reviewed-by tag.
> * MSI -> =E6=B6=88=E6=81=AF=E6=A0=87=E8=AE=B0=E4=B8=AD=E6=96=AD=E3=80=82
> * modify index.rst. (When applying the series, they depend on the **pcieb=
us-howto and pci-iov-howto**)
>
>
> v1:
>
> * Translate .../PCI/msi-howto.rst and ../PCI/sysfs-pci.rst into Chinese.
>
> Yanteng Si (2):
>   docs/zh_CN: add msi-howto translation
>   docs/zh_CN: add sysfs-pci trnaslation
>
>  .../translations/zh_CN/PCI/index.rst          |   6 +-
>  .../translations/zh_CN/PCI/msi-howto.rst      | 233 ++++++++++++++++++
>  .../translations/zh_CN/PCI/sysfs-pci.rst      | 126 ++++++++++
>  3 files changed, 362 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/PCI/msi-howto.rst
>  create mode 100644 Documentation/translations/zh_CN/PCI/sysfs-pci.rst

Applied, thanks.

jon
