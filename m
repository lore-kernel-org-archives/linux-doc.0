Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A885EC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 23:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbiCIXdg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 18:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiCIXdg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 18:33:36 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C776A20185
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 15:32:34 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 63990383;
        Wed,  9 Mar 2022 23:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 63990383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1646868754; bh=hLjlBCM7Y2H+HhVlUbXqpgEVb3jLdNA+tfKcTxAGUXw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fYLf5yGfMAWyHpykyJ1PkyU6i+Kpjq2Az1RznOY975bvk8Ja06if11gMvrK0XWsJ+
         v7PARSHh+qHmOH9H4WSHzMAQ6CBvAYlHwOPFcRC4SqoQJFJr6EU1ElUqXfwk7U7VxA
         UCbrkMRGF9+BhIMtzj629Hmzwae65qs+05sTZqMOukxGYIC/0x5p4Sp0S7kuu2lTJE
         NU/Jwy7RNSnnl9ieObVTrz8afAu5iS4cSw3uUs67Sz51b/xVQJ+lD2AQmEFCZVQSyQ
         7cXbgmRMcoAKSInkBcyUQd5B+x4/7p4cjdRqrkLvhqVIJl3ZHvzu1k27ujoNYwExCN
         LcpknOtR3EUvA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] docs/zh_CN: add devicetree translation
In-Reply-To: <cover.1646642188.git.siyanteng@loongson.cn>
References: <cover.1646642188.git.siyanteng@loongson.cn>
Date:   Wed, 09 Mar 2022 16:32:33 -0700
Message-ID: <87ilsm7lda.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> From: Yanteng Si <siyanteng01@gmail.com>
>
> v2:
> * Pick Alex's Review-by tag.
> * Modify "test-date" to "=E6=B5=8B=E8=AF=95=E6=95=B0=E6=8D=AE" according =
to Alex's opinion.
>
> v1:
> * Translate .../devicetree/of_unittest.rst and .../devicetree/usage-model=
.rst into Chinese.
>
> Yanteng Si (3):
>   docs/zh_CN: add devicetree index translation
>   docs/zh_CN: add devicetree usage-model translation
>   docs/zh_CN: add devicetree of_unittest translation
>
>  .../translations/zh_CN/devicetree/index.rst   |  50 +++
>  .../zh_CN/devicetree/of_unittest.rst          | 189 ++++++++++
>  .../zh_CN/devicetree/usage-model.rst          | 330 ++++++++++++++++++
>  Documentation/translations/zh_CN/index.rst    |   6 +-
>  4 files changed, 574 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/devicetree/index.rst
>  create mode 100644 Documentation/translations/zh_CN/devicetree/of_unitte=
st.rst
>  create mode 100644 Documentation/translations/zh_CN/devicetree/usage-mod=
el.rst

Set applied, thanks.

For future patches, though, could you please ensure that your signoff
and sending email addresses match?

Thanks,

jon
