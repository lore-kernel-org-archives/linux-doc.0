Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A0BC4338F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0FF360FC3
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238156AbhHLOvI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbhHLOvH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Aug 2021 10:51:07 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E92C061756
        for <linux-doc@vger.kernel.org>; Thu, 12 Aug 2021 07:50:42 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 07AF544A;
        Thu, 12 Aug 2021 14:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 07AF544A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628779841; bh=P9/03o+i6uPtaJC4GvDwnwfhd9raFTX0gkr1Ejh6mSk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rR9DH5SBnPOwFLzxzhCtLIG+pkZzTC3xwjeL21owxHtAIUmM9kJvvSuvCb97HH7p7
         xnMRJKFPlz7wQe/r5qc4OQKBG4FuK4BgDW+ptFDNPL6ZR5QqMLxDWO+tqr4+w6cemT
         Tjq9TSeTfKwTN4JxRPqc4CrLWhfzhvrAp0eG+3iRQ1iY1mRVWOeE7ju1IYC+rJnEWh
         iL4Rr00K5ilmMpe9Lf0N2PG0+cXcIioQ6ye97X85x73DsQTk+S6RYW/9E2GSvzlpds
         fYHbDPqzmoj8SVoqkmhsjciAIY5PtuAr/aSyuGb6/LKceaBc3fTAR1MFmMQwP50X46
         rYbS4j8hhi0Dw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v4 0/8] docs/zh_CN: add some virt docs translation
In-Reply-To: <cover.1628212777.git.siyanteng@loongson.cn>
References: <cover.1628212777.git.siyanteng@loongson.cn>
Date:   Thu, 12 Aug 2021 08:50:40 -0600
Message-ID: <87eeay1zun.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v4:
>
> * Modified some words under Alex's advices;
> * pick Alex's Review-by tag for [patch 5-8/8]
>
> v3:
>
> * Modified some words under Alex's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know
> * pick Alex's Review-by tag for [patch 1-4/8]
>
> v2:
>
> patch 2/8:
>
> * Modified some words under Feiyang's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
> Yanteng Si (8):
>   docs/zh_CN: add virt index translation
>   docs/zh_CN: add virt paravirt_ops translation
>   docs/zh_CN: add virt guest-halt-polling translation
>   docs/zh_CN: add virt ne_overview translation
>   docs/zh_CN: add virt acrn index translation
>   docs/zh_CN: add virt acrn introduction translation
>   docs/zh_CN: add virt acrn io-request translation
>   docs/zh_CN: add virt acrn cpuid translation

Set applied, thanks.

jon
