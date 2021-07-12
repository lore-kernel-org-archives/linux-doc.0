Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516AFC07E99
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 17:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34BA461241
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 17:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbhGLRUF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jul 2021 13:20:05 -0400
Received: from ms.lwn.net ([45.79.88.28]:43046 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234856AbhGLRUF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Jul 2021 13:20:05 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C06C52ED;
        Mon, 12 Jul 2021 17:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C06C52ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1626110236; bh=ZghF1QIfpBylUgZrydzUw4APZPa0Zbb8KYczw6h8vCA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EQgbuLOgfLz9nzumgOtr9yNrlO9pjKuHLoAoDOq+bP0V5Zf0PZppu1rOfogv+d6v2
         k8XC4JGgIbV3Hi5fxA6Sv54Z65RpJeV++/OPHy3S2EnE9HIBP31qASbSTh+TJbtWYx
         BPmI3h9G7n3g1wAcoiZTXSlE+f01lLP7K9pP4o3QZEw2JZgiZLMVcpx30l/PNEqn8i
         KK92CakIL2tAdf3ul5fXPVzev8KIo0I0384nFRBkHMuu2rU7VVrFC0moGclCThs2Bl
         +BthmVARh2uw2P3Ki++KdubEPYVzEDybwpLYj0yjL34Iww5Y3Kv1C15v9TKRRlUCkS
         VCFSY1gt2tkjg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v4 0/2] docs/core-api: add cpu_hotplug and protection
 keys translation
In-Reply-To: <cover.1625798719.git.siyanteng@loongson.cn>
References: <cover.1625798719.git.siyanteng@loongson.cn>
Date:   Mon, 12 Jul 2021 11:17:16 -0600
Message-ID: <87im1fpi3n.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v4:
>
> * Is anyone else reviewing this set? :-)
>
> v3:
>
> PATCH 2/2:
> * Modified some words under Xiangcheng's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
> v2:
>
> PATCH 1/2:
> * Modified some words under Xiangcheng's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
> Yanteng Si (2):
>   docs/core-api: Modify document layout
>   docs/zh_CN: add core api cpu_hotplug translation
>
>  Documentation/core-api/cpu_hotplug.rst        |  38 +-
>  .../zh_CN/core-api/cpu_hotplug.rst            | 348 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  3 files changed, 373 insertions(+), 15 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/cpu_hotplug=
.rst

Set applied, thanks.

jon
