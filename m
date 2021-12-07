Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41694C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 05:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhLGFUE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 00:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhLGFUE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 00:20:04 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F7DC061746
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 21:16:34 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id m9so15752131iop.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 21:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qW2P0wCopTvNDp6ptqhrHKepT4Nhi83PA02TJ3HBsz0=;
        b=oZeOHj16ATRA6HqzDkxZe+9XCsmg0uztVw8Nrwzn1E3SP/6T+SBFyv0xKrOKJmle11
         KMLHYdW1yl2enuZ47NtugjX0Cz4a4uSqu+vVMXAVx6jNHtDmytUUYwATuGLhDIaW29G/
         9/2zNVgaFvbbmHE34LtduDmNDvdCXkOinYkPKKvXDeVt5eJbtJmOdnfc0ed4OYj/UXkl
         yvzcb+HNsFQw75VC7Rke8gCAdgDLXMtCuo/D1NfA/8CL+blRY9u/9ZYb2PmR3Gi7kDgP
         4z2Pa3HjDTCZMcGklTr2QiEf8MQYSxZvcN5wEiQvcWdpQoU8l+P+yQXNiMW+ilfELXut
         /KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qW2P0wCopTvNDp6ptqhrHKepT4Nhi83PA02TJ3HBsz0=;
        b=CbEgdhRGkzlh+bOi4N2d3i6n5euK90gchhVKsmaGIKjK7Ve1ZkJnJqhaHLdq4mHfOV
         3xgLdu+meaa2vqATXTVmWLe2FB7mz+VJ+157wg0fU/BA5c8YhItYhcMWLplEG0n/5PCI
         zsM1hn2aTPVDFsxJG1mZfMR+csszbkgcJ8l9fjpe8b+zesxzpYKKDycVanHNnJHy31oz
         rsqaOAeWp9R2QnNQyia50EmcLzc3SfjjuoiC/4NxBXut2dAZ6Mo+8BXvCdoL5vG5u69N
         kv0RuQCnWv30lIL7x6NUz/J56B+eAq3+EvLb8CihQTgbjlJLdSGOnAgdCweuWN/x2hdW
         bukg==
X-Gm-Message-State: AOAM533ZNi/js+kycaUO2bogcx9DG2HQr2/ONrO0mo0AVav0HNaroSoO
        Vk6Rr38CYzyXvHfexp1XsnoUtejswAMyJQWqHsQ=
X-Google-Smtp-Source: ABdhPJzPer0K0l2IHOC1vvedXtnWZFiIEPsyrN1YCjhN3bK7X33ZpZn+GJhQMb/BCkLjgdJ7S6h59bQ2nZQKMK9/psg=
X-Received: by 2002:a05:6602:1813:: with SMTP id t19mr37436528ioh.135.1638854194151;
 Mon, 06 Dec 2021 21:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20211202142312.20052-1-tangyizhou@huawei.com>
In-Reply-To: <20211202142312.20052-1-tangyizhou@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 7 Dec 2021 13:15:58 +0800
Message-ID: <CAJy-AmkY8AomcT6ZAv=8bsmxutsZt0VfiOhfYrY6P3zT29oewQ@mail.gmail.com>
Subject: Re: [PATCH] doc/zh-CN: Update cpufreq-stats.rst to make it more readable
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        tangyeechou@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 2, 2021 at 9:55 PM Tang Yizhou <tangyizhou@huawei.com> wrote:

>
> -2. =E6=8F=90=E4=BE=9B=E7=9A=84=E7=BB=9F=E8=AE=A1=E6=95=B0=E6=8D=AE(=E4=
=B8=BE=E4=BE=8B=E8=AF=B4=E6=98=8E)
> +2. =E5=B7=B2=E6=8F=90=E4=BE=9B=E7=9A=84=E7=BB=9F=E8=AE=A1=E6=95=B0=E6=8D=
=AE(=E6=9C=89=E4=BE=8B=E5=AD=90)

The new one is more oral, the original version seems slightly better
for a document.
Such trivial change has no much help for understanding.  IMHO, that's
not worth for
correction while there are much of more meaningful document isn't
translated, like
Documentation/admin-guide/ etc. Shall we pay more attention on them?

Thanks
Alex
