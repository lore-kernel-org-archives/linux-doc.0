Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC668C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 18:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 930646104F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 18:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhHLSrU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 14:47:20 -0400
Received: from ms.lwn.net ([45.79.88.28]:51950 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229648AbhHLSrT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 12 Aug 2021 14:47:19 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A85966E2;
        Thu, 12 Aug 2021 18:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A85966E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628794013; bh=AS3ZXY9uEEpmndvTSSwUgG0OFUEKXjMLPrBwasBdFfo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bWRcDmxPO/ffhtEeZBebJoafRfcT0WI/G8Wz8VIBWEGRr25YhzO39SZM1+gDE8tR+
         2/v0rkpmNM3GUgRMTd/YdULUt2ycq+UJSwoEnTPoh4eOQJMeBZqS1cqo148W6Uumgj
         o8QHkfRjH6vSPME+jO4YjdI5DCY+9ls2/ayUMDDOlF4aDj5bQ0tiVAN4JbCHoGWaKx
         OHg3yhGM7sqAoNU9l19oXha33ZvcTf43IKhY+/L/EdmJfJdD3y98+2b+dwECjTih4w
         QdHuEX4SHSggDZwAQ9tK0d9A0LJYtnM3uIvZ+ouB1cb2I5U3CPjo2ntLVoFr8VZXP/
         ACLYerGzAyCow==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hu Haowen <src.res@email.cn>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] docs: zh_TW translation fixes
In-Reply-To: <b19c4d3f-9a36-c217-c4ad-0f818f8e864a@email.cn>
References: <b19c4d3f-9a36-c217-c4ad-0f818f8e864a@email.cn>
Date:   Thu, 12 Aug 2021 12:46:52 -0600
Message-ID: <877dgqzejn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hu Haowen <src.res@email.cn> writes:

> The following changes since commit ff17578e267c74db1619b6643a98e8a83ff6b9=
96:
>
> =C2=A0 docs/zh_TW: add translations for zh_TW/process (2021-07-27 23:08:5=
0 +0800)
>
> are available in the Git repository at:
>
> =C2=A0 https://github.com/srcres258/linux-doc.git doc-zh-tw
>
> for you to fetch changes up to d9b28270985fdc551cf4aaae3d8a5b3e9ae2ee9e:
>
> =C2=A0 docs/zh_TW: add translations for zh_TW/filesystems (2021-08-12 22:=
54:51 +0800)
>
> ----------------------------------------------------------------
> Hu Haowen (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs/zh_TW: add translations for zh_TW/arm=
64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs/zh_TW: add translations for zh_TW/cpu=
-freq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 docs/zh_TW: add translations for zh_TW/fil=
esystems

I'm sorry, but I can't take patches that have never seen the light of
day through pull requests.  Please post them to the lists in the usual
way.

Thanks,

jon
