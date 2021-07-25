Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34A8C4338F
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:27:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B6C460F11
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:27:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhGYTqk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jul 2021 15:46:40 -0400
Received: from ms.lwn.net ([45.79.88.28]:41858 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229661AbhGYTqk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Jul 2021 15:46:40 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4312F2E6;
        Sun, 25 Jul 2021 20:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4312F2E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1627244830; bh=2ZtyOP7LSZiuS83fKR5BTbOY5GRTtIWRj5/RUsKx1UE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VLblgjoRXWucWx4QouVsvnOH3MhIVxAHUbS4hMJuof6xk7PM6ba8/YmHcRcwTp7Lp
         B7zv28dt26jbZSCQy7tHaJEsrxFK7iQI0XNZiA5PWx8HiIiVnA86RPld28WafYVOba
         SdJKgq6GlGhWYWav4ISBPAGFY3cBCe8AF7zod/Ynkjtpn84ERSRuLq9lBubO45MfSR
         8o2bghbYljssPqQ7BFxCqu6IuyUxek4No/BAZ4k++bWvMMF+Scs3vUkYy6DAqR74ic
         OV7/ilKjHl50PcLtA+xsxqelPjDNxKEPLaOnsmXwS5MbaMXbkTeEGcPhP3egooF/wP
         V6o+BDq8ICvvQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hu Haowen <src.res@email.cn>
Cc:     panyunwang849@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] docs: add traditional Chinese translation for
 kernel Documentation
In-Reply-To: <b46316da-9c91-4407-649f-c3304e73696f@email.cn>
References: <20210721142537.29409-1-src.res@email.cn>
 <20210725141435.112074-1-src.res@email.cn> <87eebmwk9n.fsf@meer.lwn.net>
 <b46316da-9c91-4407-649f-c3304e73696f@email.cn>
Date:   Sun, 25 Jul 2021 14:27:09 -0600
Message-ID: <871r7mw34y.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hu Haowen <src.res@email.cn> writes:

> =E5=9C=A8 2021/7/25 =E4=B8=8B=E5=8D=8810:17, Jonathan Corbet =E5=86=99=E9=
=81=93:
>> Hu Haowen <src.res@email.cn> writes:
>>
>>> Add traditional Chinese translation (zh_TW) for the Linux Kernel
>>> documentation with a series of translated files.
>>>
>>> Signed-off-by: Hu Haowen <src.res@email.cn>
>>> Reviewed-by: Pan Yunwang <panyunwang849@gmail.com>
>> When you send a new version of a patch set, please include (after the
>> "---" line) what changed.  Otherwise maintainers have no idea why you
>> keep sending the patch out or whether it seems to be stabilizing.
>
>
> Sorry, forgot to append them.
>
> v2:
> * Added more translations for zh_TW.
>
> v3:
> * Fixed building errors.
> * Added SPDX identifiers for each file.
>
> v4:
> * Reorganised patch format and compressed patch content.
>
> v5:
> * Added Reviewed-by tag.

OK, I tried to apply these, but it adds a new warning:

  Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst:25=
: WARNING: duplicate label zh_contact, other instance in Documentation/tran=
slations/zh_CN/process/embargoed-hardware-issues.rst

Please get to a point where you don't add any warnings, and I guess
we're good to go.  I do hope there's a reader community for all of this
work, and that it will be kept current...

Thanks,

jon
