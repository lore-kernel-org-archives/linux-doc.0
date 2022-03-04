Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA70C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  4 Mar 2022 17:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbiCDRKM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Mar 2022 12:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbiCDRKM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Mar 2022 12:10:12 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866CA1107E0
        for <linux-doc@vger.kernel.org>; Fri,  4 Mar 2022 09:09:24 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CAE542C0;
        Fri,  4 Mar 2022 17:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CAE542C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1646413763; bh=x/slY9C6tmnmBap2rXeohnLiheN+ELf6S7MYzFUCiTQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ehNk3hpGpCzRd9styBC7b8YDVbORDkTNR9QjkhdP8qaVJgeSBgMJDNBvG+NsSOZjJ
         mz236yC3xCy1QMi1f1q5bM6TTGmzcVO/6ejwLg3lmHvdihhnLj25uOqasoG8lA0rmh
         kdblQsJlFcaN4mFYZhQU4vALD4gWJUO/YHW6DVvvfRjvpTuQ4BcQtf3qeG1x8u4MdW
         vehBPUkymjMwf9MlNEva7TcoGUx3+KlCXiudAgWgmqJ3iepZlNi4WCksq1AFLFysoN
         p658Fcn2qp+jkfl1CCazHHDcH72T6rt/J32qU6MIwl893JOAamKEzcRKgGa1qfBlrD
         n+G8769iYLzaA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com, seakeel@gmail.com
Subject: Re: [PATCH v4 0/3] Add Chinese translations for KSM documents
In-Reply-To: <cover.1645669457.git.siyanteng@loongson.cn>
References: <cover.1645669457.git.siyanteng@loongson.cn>
Date:   Fri, 04 Mar 2022 10:09:23 -0700
Message-ID: <87a6e5hcfw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v4:
>   Fix build error and build warning.
>
> v3:
> 	Fix the patch '[1/3] Add Chinese translation for vm/ksm.rst'
> 	because its old version does not apply for the latest commit.
>
> v2:
>
> 	According to the suggestions from Yanteng Si, Alex Shi and
> 	Jonathan Corbet, I have modified my patches. Here are my specific
> 	changelog:
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
> xu xin (3):
>   Add Chinese translation for vm/ksm.rst
>   zh_CN: Add translations for admin-guide/mm/ksm.rst
>   zh_CN: Add translation for admin-guide/mm/index.rst

So you are passing on somebody else's patches, and have modified one of
them.  That means that your signoff needs to be in the chain, but you've
not added it.  Please fix that and I should be able to apply this set.

Thanks,

jon
