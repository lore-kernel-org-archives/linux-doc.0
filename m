Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B71BC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jun 2022 01:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiF2B2y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiF2B2y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 21:28:54 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561A61FCE6
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:28:53 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id x20so7035789plx.6
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0BKcY1bFgwGBzCmf/JqPtG+cfTHCwCaCL5k7kzYp4G8=;
        b=PA8F7fOGuep4wYWZ2hJDpbUeRZghrwcjzGQDp9gdCXdwSWLhw7DNxTeAZ+fJxt5ynP
         uOmHVHCayHN4WGevH5gnzPgUyECsGs5RO0Zn+M3MBNYhYCkn9QlhH0IFjQGGivUlnSj6
         r3WT1omwfwx0AWn+SHAEJhUljJL9tK1qSn7kqwv64ZjcAjejkMe3Lp2IIo4BwJkWUL64
         d174l2gn8OYzyZvE/0RGo11v0I/i5mJpDl5NuUvkOuD6+tlUpCo2dNfoiHoMt0V2QQE3
         E4Px9w1wB62OhfXAMjwe2/YEY49ObSatyiZRDxsWhWEwVWDSeVQ6eV1we2Gyedleb+we
         VUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0BKcY1bFgwGBzCmf/JqPtG+cfTHCwCaCL5k7kzYp4G8=;
        b=Xjv9k9E+/0a7FM+MrA1+wBNhbg2PhnV4O1Bygg78l1FD80J7gYm5gEaC+X7nYKtP/U
         VT18qaurnBgK1h/ewhXBgz5Zj9VL6N6Gi0QPO3cToDfZf7EORyxe3hGqou4HNPT/Hpzz
         Fi+DiVn0cUq5J6IDlh4VaXwDFqpI25Xz2tg4Dz+HpH98hraP5gTwNesBkbbR7tXwHImo
         7In3qraWEv4AwKgR+IqtkzVS/MVUPwJe5h1S9LLXoDqDd0aLx9x9PPWbLgcle8X7ScMM
         /xRS58JaHfcRreI4d+rzhtcP++1FfDer0WgQbgYFpAF3VeasSQZVtSKwbuyHwH4YVOqA
         P0Cw==
X-Gm-Message-State: AJIora/UdSBV42fMIW8tJwA4RD/MjC/68bMA/nWn1vGJmuQXOWnJrbP5
        RWR33qsnxQNXGz+yQv9LiMlkhg==
X-Google-Smtp-Source: AGRyM1thJ5CdaujditWNjp66MHQpGQ0yjEwoATJGUeM95pGZO81XLCTKh60zqCi8pvqX0NCu0cUj1A==
X-Received: by 2002:a17:903:124f:b0:16b:8167:e34e with SMTP id u15-20020a170903124f00b0016b8167e34emr7761056plh.52.1656466132699;
        Tue, 28 Jun 2022 18:28:52 -0700 (PDT)
Received: from smtpclient.apple (bb119-74-120-80.singnet.com.sg. [119.74.120.80])
        by smtp.gmail.com with ESMTPSA id x34-20020a634a22000000b0040ca587fe0fsm9812887pga.63.2022.06.28.18.28.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 18:28:52 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 2/2] docs/zh_CN: Add mutex-design Chinese translation
From:   Tang Yizhou <yizhou.tang@shopee.com>
In-Reply-To: <CAJy-AmkA7u1Lc76V8R-7L1cW-gpM-8fAaYU+kMk9p-7tHjW_Hw@mail.gmail.com>
Date:   Wed, 29 Jun 2022 09:28:48 +0800
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        robin.lubin@shopee.com, huangh@sea.com,
        "Wu X.C." <bobwxc@email.cn>, Tang Yizhou <yizhou.tang@shopee.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <498BC9DA-AE60-43C4-B96F-E87EA9758731@shopee.com>
References: <20220626122210.56704-1-yizhou.tang@shopee.com>
 <20220626122210.56704-3-yizhou.tang@shopee.com>
 <f3ba720a-cc26-09f5-5f24-d0746eed1b64@loongson.cn>
 <CAJy-Amn1D0Q97xfCQwr9Og9e4PSSkCwNAdXejVNVWX_TrqwCaA@mail.gmail.com>
 <85b29345-c2a8-6a92-f03f-94cad0017f68@loongson.cn>
 <CAJy-AmkA7u1Lc76V8R-7L1cW-gpM-8fAaYU+kMk9p-7tHjW_Hw@mail.gmail.com>
To:     Alex Shi <seakeel@gmail.com>, Alex Shi <alexs@kernel.org>,
        YanTeng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
X-Mailer: Apple Mail (2.3696.100.31)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On 28 Jun 2022, at 11:04, Alex Shi <seakeel@gmail.com> wrote:
>=20
>>>> =E5=AF=BC=E8=87=B4=E7=9A=84=E7=BC=93=E5=AD=98=E8=A1=8C=E8=B7=B3=E8=B7=
=83=EF=BC=88cacheline bouncing=EF=BC=89=E8=BF=99=E7=A7=8D=E6=98=82=E8=B4=B5=
=E7=9A=84=E5=BC=80=E9=94=80=EF=BC=9F
>>> Both look fine. and may we don't have a better way to reflect the =
fact
>>> cache bouncing between cpus?
>>=20
>> how about cpu=E6=A0=B8=E9=97=B4=E7=BC=93=E5=AD=98=E8=A1=8C=E5=BC=B9=E8=B7=
=B3?
>=20
> Uh, is the following better?
> =E5=AF=BC=E8=87=B4=E7=9A=84(CPU=E6=A0=B8=E9=97=B4)=E7=BC=93=E5=AD=98=E8=A1=
=8C=E5=9B=9E=E5=BC=B9=EF=BC=88cacheline bouncing=EF=BC=89=E8=BF=99=E7=A7=8D=
=E6=98=82=E8=B4=B5=E7=9A=84=E5=BC=80=E9=94=80
>=20

Seems much better. I will take this advice.

Thanks,
Yizhou

> Thanks
> Alex

