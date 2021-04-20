Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30F5C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 22:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C46F61407
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 22:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhDTWL0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 18:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbhDTWL0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 18:11:26 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E508C06174A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 15:10:54 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 29D832E6;
        Tue, 20 Apr 2021 22:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 29D832E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618956654; bh=owmIKtHfksLMYPxKZOBZNwG+BMqsl5rHMgBuFfXU01o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=V1naubVN7ru1F371Jti6RuM06O1UaUqbUI3vADp6qQnJGzooVo32mGdzoMsIpXm24
         9RNTC2/7aQeFWlSkjgqog5IN1wn1jU5tle8rLW6DzAn4dkYlVZCbuvjQTgkK336WK3
         90LJbJxYpyjgDW0lgRCZon4Gp1x6ZNaNNm3TPtSkrX76hIREs2KoSzpfOQR5ipC/F2
         68tM2ELOteNahKkrttpavsxK/4p7Qx+YRxJ+Hkz9m3DuMqkNb/nwjelX99xQxecua/
         KZrMKAmVIz1H0Qs2L/lz6hHvPJsEmrwGjZ+SkXbXjlaiRz+MNk77Q7yHII6L5Tp8Cu
         qgSBpn7oZp8yg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
Subject: Re: [PATCH v7 00/11] docs/zh_CN: add core api and openrisc translation
In-Reply-To: <cover.1618568135.git.siyanteng@loongson.cn>
References: <cover.1618568135.git.siyanteng@loongson.cn>
Date:   Tue, 20 Apr 2021 16:10:53 -0600
Message-ID: <87lf9cip3m.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This series of patches translates core-api/irq/* and openrisc/* into Chin=
ese.
>
> v1 -> v2:
>
> Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewiew!
>
> v2 -> v3:
>
> keep the signs number equal to the title char under Alex's suggestion.
> Thanks for his rewiew!
>
> v3 -> v4:
>
> Add Xiangcheng Wu's review sign to 0002=E3=80=810003 and 0008; Thanks for=
 his rewiew!
>
> v4 -> v5:
>
> Split 1-7 into a separate series.
>
> v5 -> v6:
>
> Modify the Subject of patches 07 and 11.
> Patch 11 will not be sent if not modified. (name repeat)
>
> Revert to one series because there is no need to split into two series.
>
> v6 -> v7:
>
> Send patch 11 to the series. Thank you Xiangcheng for your help!
>
> Yanteng Si (11):
>   docs/zh_CN: add core-api irq concepts.rst translation
>   docs/zh_CN: add core-api irq irq-affinity.rst translation
>   docs/zh_CN: add core-api irq irq-domain.rst translation
>   docs/zh_CN: add core-api irq irqflags-tracing.rst translation
>   docs/zh_CN: add core-api irq index.rst translation
>   docs/zh_CN: add core-api index.rst translation
>   docs/zh_CN: add core api translation to zh_CN index
>   docs/zh_CN: add openrisc openrisc_port.rst translation
>   docs/zh_CN: add openrisc todo.rst translation
>   docs/zh_CN: add openrisc index.rst translation
>   docs/zh_CN: add openrisc translation to zh_CN index

I have applied this series, thanks.

I have a request for the future, though: when you add a new file, do the
associated index.rst changes *in the same patch*.  Among other things,
that helps bisectability - we'll know which patch adds a build error,
for example.  It's not hugely important for docs, but is a good way to
approach kernel work in general - don't stack up lots of work that only
becomes active as the result of a small patch at the end.

THanks,

jon
