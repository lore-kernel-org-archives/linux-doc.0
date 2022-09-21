Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B04ECAAD8
	for <linux-doc@archiver.kernel.org>; Wed, 21 Sep 2022 20:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiIUUAv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 16:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiIUUAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 16:00:51 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE9785FB2
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 13:00:50 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9FA05536;
        Wed, 21 Sep 2022 20:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9FA05536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1663790449; bh=qB6lm5hthqCkEgrFRAx+nm45BfSZzFeCmH4WWvR2k2A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WgUo0O+pr/JS0Uu0iur0FSlRgterXd380hAxnTZ9Jr0ez1nibPeD65qcf9YwJMeV/
         nEUY9Wuxoqq+Sxk2f3z3hY+32K4LteUXgbNH0fFJ+c865uHpvLUhtqHkfLYJ3oTtjA
         nqEL+ZjYfxyJMi2ikVwERvO4oyo15Hf5XcgGzMiQASyuK0DE9XE2mcZVOM8zCVm2Wi
         dVROwd3yBvWwLVTcIRaBriC7yYR79QZs3x9UvPGiLwFEfyT9Lc8/ZVuNL7Hnt9YWsJ
         EKb69Fijg08WlFHIPPk8YEo2AnGdKDK3TfOO6wp9LpMjAjsKJHlxXxmu9ClZpPOPMv
         CdCHJPjkAqUnw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 0/5] docs/zh_CN: Add some dt and PCI Chinese translation
In-Reply-To: <cover.1662449105.git.siyanteng@loongson.cn>
References: <cover.1662449105.git.siyanteng@loongson.cn>
Date:   Wed, 21 Sep 2022 14:00:48 -0600
Message-ID: <87y1ucv6of.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v2:
> * Modify some words under Alex's and Xiangcheng's advice.
>
> v1:
> Translation some dt documentation into Chinese.
> Translation .../PCI/acpi-info.rst into Chinese.
>
> Yanteng Si (5):
>   docs/zh_CN: add PCI acpi-info translation
>   docs/zh_CN: add dt changesets translation
>   docs/zh_CN: add dt dynamic-resolution-notes translation
>   docs/zh_CN: add dt overlay-notes translation
>   docs/zh_CN: add dt kernel-api translation
>
>  .../translations/zh_CN/PCI/acpi-info.rst      | 139 +++++++++++++++++
>  .../translations/zh_CN/PCI/index.rst          |  13 +-
>  .../zh_CN/devicetree/changesets.rst           |  37 +++++
>  .../devicetree/dynamic-resolution-notes.rst   |  31 ++++
>  .../translations/zh_CN/devicetree/index.rst   |  13 +-
>  .../zh_CN/devicetree/kernel-api.rst           |  58 ++++++++
>  .../zh_CN/devicetree/overlay-notes.rst        | 140 ++++++++++++++++++
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  8 files changed, 415 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/PCI/acpi-info.rst
>  create mode 100644 Documentation/translations/zh_CN/devicetree/changesets.rst
>  create mode 100644 Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
>  create mode 100644 Documentation/translations/zh_CN/devicetree/kernel-api.rst
>  create mode 100644 Documentation/translations/zh_CN/devicetree/overlay-notes.rst

Series applied, thanks.

jon
