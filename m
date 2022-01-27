Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E257C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 18:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiA0SpC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 13:45:02 -0500
Received: from ms.lwn.net ([45.79.88.28]:52012 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230106AbiA0SpC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Jan 2022 13:45:02 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C215E2D5;
        Thu, 27 Jan 2022 18:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C215E2D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1643309101; bh=l2YHuJ96fsm2Y5dsYwGv873ZRGov6kN7Be5A8VNVjdQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NyjA2WQGDO4at0lZwretWNPxVV0dpn9/sij4l4QwELEX3KEVa8Gaqt7rGSOtzR0U0
         SZ6G4Bn5Bx1O86hGpCBsMj4odvrz2jfNqhK2tEoXKpLY+g/6unoz3pp2LK1cnYyMgA
         sCd3nNsdkReLwkMda9vM6S4g5QQNPe0Z6N4Lw9KoOjN5hfPLpiSPzv4SplU7Ycnyq6
         Fjgx/Qe80VjO7RU7fO9so186PzhSFXUMtwfmrRX8VUX4tFzseDD/IB8Y5ZdpyikDCL
         0Tao0y7TJ50+ZPq16xSwBcdFNSA+rvIjZtQYLL4mMyFduhBtywp+X9W4pl+Oz5k7Rp
         G5c3KRo5HDbBQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     cgel.zte@gmail.com, sterlingteng@gmail.com, seakeel@gmail.com
Cc:     siyanteng01@gmail.com, linux-doc@vger.kernel.org,
        xu.xin16@zte.com.cn, cgel.zte@gmail.com
Subject: Re: [PATCH v2 0/3] Add Chinese translations for KSM documents
In-Reply-To: <20220117043455.861550-1-xu.xin16@zte.com.cn>
References: <20220117043455.861550-1-xu.xin16@zte.com.cn>
Date:   Thu, 27 Jan 2022 11:45:33 -0700
Message-ID: <87pmodqape.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

cgel.zte@gmail.com writes:

> From: xu xin <xu.xin16@zte.com.cn>
>
> According to the suggestions from Yanteng Si, Alex Shi and
> Jonathan Corbet, I have modified my patches. Here are my specific
> changelog:
>
> 	1. Remove Redundant Labels in added Documents like ``.. _ksm_sysfs:``
>
> 	   Yanteng Si said: Too many tags will cause a compilation
> 	   warning, because an identical one already exists for the Origin
> 	   document. Jonathan Corbet think so.
>
> 	2. Align with standard Chinese format on the 'original', 'translator',
> 	   etc.
>
> 	3. fix some translation error like =E2=80=9Cpages_unshared=E2=80=9D, I r=
emove  '=E7=8B=AC=E4=BA=AB'.
>
> 	   Alex Shi suggest to remove '=E7=8B=AC=E4=BA=AB'.
>
> 	4. Refactor translations/zh_CN/admin-guide/mm/index.rst.
>
> 	   Yanteng Si: Compile pass is only one of the basis for checking
> 	   through, we also have to check the html for any problems, as
> 	   far as I know, the above treatment is very ugly.
>
> I have rebased this patch series on top of Yanteng Si's series on his
> commit:
> https://lore.kernel.org/linux-doc/60c579b34792c4c76194c4843a695263a982b37=
d.1641866889.git.siyanteng@loongson.cn/
>
> xu xin (3):
>   Add Chinese translation for vm/ksm.rst
>   Add Chinese translations for admin-guide/mm/ksm.rst
>   Add admin-guide/mm/index.rst
>
>  .../translations/zh_CN/admin-guide/index.rst       |   2 +-
>  .../translations/zh_CN/admin-guide/mm/index.rst    |  49 +++++++
>  .../translations/zh_CN/admin-guide/mm/ksm.rst      | 148
> +++++++++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst      |   1 +
>  Documentation/translations/zh_CN/vm/ksm.rst        |  70 ++++++++++
>  5 files changed, 269 insertions(+), 1 deletion(-)
>  create mode 100644
> Documentation/translations/zh_CN/admin-guide/mm/index.rst
>  create mode 100644
> Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

Unfortunately, these patches don't apply.  Among other things, they have
the famous charset=3Dy problem.  Please regenerate, email to yourself, and
verify that you can apply the result before sending again.

Thanks,

jon
