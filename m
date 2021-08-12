Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C166C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D98046103A
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238173AbhHLOxZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238169AbhHLOxY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Aug 2021 10:53:24 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12FCC061756
        for <linux-doc@vger.kernel.org>; Thu, 12 Aug 2021 07:52:59 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6F9B944A;
        Thu, 12 Aug 2021 14:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6F9B944A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628779979; bh=8odF7egrxxP7AxsODSFDLxwFvNOewJT7fM4Flce7ZBI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=aTfrILKstxrjK3pKTFozNaNfJIAxbulkswMLO1Nd8Gph8A+IpDKYmNWen0epsRnMU
         4tyMqd3UoWEvpSRfQyIIM6ZIcNCEKpcQpm2FYF4+lTasuelwFpBwVH++DBlXedqDl8
         Z4nm+teAiv3b3kI1TLddsAY/ak/yOXBmmZi1Ia6P7BObylsx2YWVMbVX9kGsNJocBp
         q5eLiSG7+wdoJKtEH8wJU6OIDOuIdbwx1fIL8WLaKyBkZFK4pGnwhWfHQa7xSaBM6z
         FUyp+ciLHafmWY1P8mgMsVUuIzgtIZIOx41j6YIEmuQ2Eyk3orFuumQsEZv27Xd9UP
         AlURBFfP0v5IQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com,
        chenweiguang82@126.com
Subject: Re: [PATCH v4 0/8] docs/zh_CN: add infiniband translation
In-Reply-To: <cover.1628218477.git.siyanteng@loongson.cn>
References: <cover.1628218477.git.siyanteng@loongson.cn>
Date:   Thu, 12 Aug 2021 08:52:58 -0600
Message-ID: <87a6lm1zqt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v4:
>
> Modified a word under Puyu advices; [PATCH 8/8]
>
> v3:
>
> * Modified some words under Alex's advices;
>
> * pick Review-by tags.
>
> v2:
>
> * Modified some words under Alex's and Puyu advices; Thanks for their rev=
iew!
>
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
> *--CC chenweiguang82@126.com
>
>
> Yanteng Si (8):
>   docs/zh_CN: add infiniband index translation
>   docs/zh_CN: add infiniband core_locking translation
>   docs/zh_CN: add infiniband ipoib translation
>   docs/zh_CN: add infiniband opa_vnic translation
>   docs/zh_CN: add infiniband sysfs translation
>   docs/zh_CN: add infiniband tag_matching translation
>   docs/zh_CN: add infiniband user_mad translation
>   docs/zh_CN: add infiniband user_verbs translation

Set applied, thanks.

jon
