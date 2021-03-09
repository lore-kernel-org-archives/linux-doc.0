Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53F9C433E6
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:04:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E02465287
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhCIADq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 19:03:46 -0500
Received: from ms.lwn.net ([45.79.88.28]:39118 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232040AbhCIADR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Mar 2021 19:03:17 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9DE882B0;
        Tue,  9 Mar 2021 00:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9DE882B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615248196; bh=G/fS5u3mPc+ik+AmTI+xNGafd2ZkA2Jq36xcVcGOHdI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jtm/EMZbeTlROgrVN0+pl36G1OH/Ln+aBv4rK1aWJsm63EMaEe2/IKrxjoMARp1UF
         LiY2jDIYewkPDvLzM+WSMdrKAB4fs+aqwkAEdRnhSwiDncqjVNRHuTiL6Tha+N/hx4
         gCYo9jaZtNyDZ694aRjjo+94ebc8Bz5AONcAmo6UXSbFUBU+Qj0aTTb86AIqAmUi0I
         dj9TUuGSy5kJ+Uw8cQ/7yWGbV6ePJyfNbPePw8LMO5gTZPsj+3fYmqSVRIxf1iBwsU
         iAt4K9apLcO5eq6tpKD6EKgYhJgYDOuXOwDODqnfYrti06NamkbErW3kuoQiW9xLVs
         Ru3liir7zkwZA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <alex.shi@linux.alibaba.com>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_CN: Add zh_CN/admin-guide/README.rst
In-Reply-To: <0958853c-604f-8b5a-2cb7-a1753eee9b84@linux.alibaba.com>
References: <20210304080131.GA16539@mipc>
 <0958853c-604f-8b5a-2cb7-a1753eee9b84@linux.alibaba.com>
Date:   Mon, 08 Mar 2021 17:03:16 -0700
Message-ID: <87pn095h2z.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <alex.shi@linux.alibaba.com> writes:

> =E5=9C=A8 2021/3/4 =E4=B8=8B=E5=8D=884:01, Wu XiangCheng =E5=86=99=E9=81=
=93:
>> Add translation zh_CN/admin-guide/README.rst, and link it to
>> zh_CN/admin-guide/index.rst while clean its todo entry.
>>=20
>> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
>
>
> Better send out a patchset into one series.
>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

I've applied both patches; in the future, getting them as a proper
series would be nice.

Thanks,

jon
