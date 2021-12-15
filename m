Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49C5C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 15 Dec 2021 11:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbhLOLrH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Dec 2021 06:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242205AbhLOLq6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Dec 2021 06:46:58 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C910C061574
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 03:46:58 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so18923755pjb.5
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 03:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qifCQplKpi5wThtiYWvIQIM1UFUZ7s2V3qvlHgTq3Wg=;
        b=FaIX8FKOHOyopLeHCLnG3Z4pzxYuf5YIKReWrBlrMRRcowLpx/3JXk3nCR8eL4hXl0
         e0zxmh3EcpMe/HZMR2DQkRZ28cpQPXDOXsfbPVHwPmT8u13QAgPwO01wikYzoS5uJ64T
         Oe8hEwn/vRy/FMYerXGkZYUCDOufbfiduLg7Jt8Nsoa3T9+YSvEzn5UZ1KTmAEyFw5TO
         pQGJXtXIhVDbFBjFu92xZerSnJwURLEPtvoSVy4Wi/Pdjg58kMU0v+cBP3M+sQ/ZN0mH
         8Z/m7Rwjbvn/QrGqX10H8Ft3AxgHbyzt7WCtETHQrArEgO4UZIBOUHt+z0RT3h3ixTFT
         hCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qifCQplKpi5wThtiYWvIQIM1UFUZ7s2V3qvlHgTq3Wg=;
        b=4RJFuFgrDVJTj6E8VwQvp9eqDCf9q5s+jiUNF6ZX7RsTNU3cNnm32sC15ZAJO1B41n
         805DnIRPd+4eztfCKLZD8WoFo32/Qn8OzJhsVO08cPjVPnYo349xG7xX4L/6bKdM6s9K
         PrdKK99dLb7fxVnQsOOyKCKoPdKYGDgrxGlt8Oj5XXCoiOdnPWpcQ968i19m49+gmsCG
         cvXSMbmF2i2bvEDfn78xeAJSIXcFFG/CAhy0lljs7//Row+Ye8KMxuhDP0BzUf6/RaJa
         tSWelj1tlwhBQnswqVAWnakJsnOkAzKlcXkwchxee4m4tLbse2Q29NP9Ji4Mgt9cFQ+1
         AnTw==
X-Gm-Message-State: AOAM530ymYpVE7NxbQOEtaLYoelMrgP5yHhDu1mki5OjbzlKW5saa9VF
        B9Cfqy3BchnDTihjVCIRfd4=
X-Google-Smtp-Source: ABdhPJyK2IpxklKEcAGWUyZRhELKW71Y4IJTFTxyqMgQcuxzI5QGt2eAP6utYVZu4vQnF9y+hUk2tg==
X-Received: by 2002:a17:90a:1b26:: with SMTP id q35mr11141976pjq.212.1639568817715;
        Wed, 15 Dec 2021 03:46:57 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id rj5sm2094994pjb.14.2021.12.15.03.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 03:46:57 -0800 (PST)
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        seakeel@gmail.com, siyanteng01@gmail.com, siyanteng@loongson.cn,
        tangyeechou@gmail.com, zhengbin13@huawei.com
References: <ae8d297b-896c-a6b3-b5f4-6cb48223e814@huawei.com>
Subject: Re: [PATCH] docs/zh_CN: Add cputopology Chinese translation
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5a803a84-5e37-83ae-70b6-d913f703dffb@gmail.com>
Date:   Wed, 15 Dec 2021 20:46:53 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ae8d297b-896c-a6b3-b5f4-6cb48223e814@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, 15 Dec 2021 10:12:34 +0800, Tang Yizhou wrote:
> On 2021/12/15 10:29, Tang Yizhou wrote:
>> Translate admin-guide/cputopology.rst into Chinese.
>>=20
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> ---
>>  .../zh_CN/admin-guide/cputopology.rst         | 94 ++++++++++++++++++=
+
>>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>>  2 files changed, 95 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/translations/zh_CN/admin-guide/cputo=
pology.rst
>>=20
[...]
>> +
>> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +    kernel_max: =E5=86=85=E6=A0=B8=E9=85=8D=E7=BD=AE=E5=85=81=E8=AE=B8=
=E7=9A=84=E6=9C=80=E5=A4=A7CPU=E4=B8=8B=E6=A0=87=E5=80=BC=E3=80=82[NR_CPU=
S-1]
>> +
>> +    offline:    =E7=94=B1=E4=BA=8E=E7=83=AD=E6=8F=92=E6=8B=94=E7=A7=BB=
=E9=99=A4=E6=88=96=E8=80=85=E8=B6=85=E8=BF=87=E5=86=85=E6=A0=B8=E5=85=81=E8=
=AE=B8=E7=9A=84CPU=E4=B8=8A=E9=99=90=EF=BC=88=E4=B8=8A=E6=96=87=E6=8F=8F=E8=
=BF=B0=E7=9A=84kernel_max=EF=BC=89=E5=AF=BC=E8=87=B4=E6=9C=AA=E4=B8=8A=E7=
=BA=BF=E7=9A=84CPU=E3=80=82[~cpu_online_mask + cpus >=3D NR_CPUS]
>=20
> Here is an example of poor Chinese support. If a line break is made her=
e,
> *make htmldocs* warns 'Malformed table'.

Just out of curiosity, but I don't think such a line break can
be flagged as 'Malformed table'.

Can you share the version of the table "make htmldocs" complained?

I'm suspecting Sphinx might be confused by the widths of UTF-8
encoded characters/punctuations.

        Thanks, Akira

>=20
> Meanwhile, the number of '=3D' can be inconsistent with the number of C=
hinese
> chars and there won't be any warnings. I've already checked the HTML pa=
ge,
> the rendering effect is OK.
>=20
> Tang

