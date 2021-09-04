Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5936C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 05:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 871A360FD7
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 05:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhIDFO1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Sep 2021 01:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhIDFO1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Sep 2021 01:14:27 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25351C061575
        for <linux-doc@vger.kernel.org>; Fri,  3 Sep 2021 22:13:26 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id j16so1120824pfc.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Sep 2021 22:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4FBi/SmbsWTKPaDkm83WldKROPiB4DCQsFRv9YOlHOg=;
        b=UxN6KTrUJpR9vt1jZS3B+l0PVOKeseiBMN0+CL5Qnwag0kLccXzkSXFWrp35oiwd0H
         mSNCYt6kBWWmAtyHCvaFOa8bftpTvRK707XGHcvqzE7o2VMrrOaREBqhTaMyo28oKk2Q
         bYEY7eP2aOORG5c3zEVqRarBKCvsMiRHp17lsP+710LogLCGJC4W7DqHMM3ayZKazwbu
         ZBsuKKH4pEn+09x4bnnM09TR7r9tVohPWe/Dpi0nwkrK7uC1qA77j55Uav7MtKU38CIX
         A0T6vD83gcYz8CUj3FkNGOzSUH6cC/ZiYzhHtt6xqPlucR4BjvplISr9wqWluZY+RiWe
         gEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4FBi/SmbsWTKPaDkm83WldKROPiB4DCQsFRv9YOlHOg=;
        b=rM45A7TnlnA0+kRq6bpvvR6W1yMfoKDUsrF5tWIx8ZnBj9vRrNt0nxQUx6kh7cnXZN
         PonFk+jOc/xv+dAMRAIWxVSYj8D43gaj6KuC20kYXgt5f1G9oQ+F9Dwob/ciRtUZuyqG
         zJZFx4hhWmv4iwh8pLbj9z8/vMIJ9FMQqwWX5oyHfHeQN8TCyhJbp+UlXpZ9vbs3mFaR
         /jkII7+SgGETpmENgwbt3CbQP3CZDhafWefvAxWTwy8QCCcA80Qvux7faWkZfy9zukg4
         KptsVIWQqEqBhkz68STu0pzA95KgyEMtIgk2tIsLoCD2eYEYigVZ5xGmHf2hsWEJ75tB
         FtlQ==
X-Gm-Message-State: AOAM532oxWdSi/YmyLMhsriMpSuHJZQ4HNVsybuzwqwiz2XSDtomdDIg
        z7WiF5x/n248iSCSBnPhQE8VtBpIGEE=
X-Google-Smtp-Source: ABdhPJwYmMT63HDipz6pao0hdyfUnXWm9UebAxp37G8UNHySejOf1BQvM3fHbKImpmVGsEQ+zA2MPA==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id c6-20020a056a000ac6b0290374a33b0a74mr6454768pfl.51.1630732405481;
        Fri, 03 Sep 2021 22:13:25 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id u21sm925846pfh.163.2021.09.03.22.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 22:13:24 -0700 (PDT)
To:     ArthurYueh <ysde108@gmail.com>
Cc:     linux-doc@vger.kernel.org, Hu Haowen <src.res@email.cn>
References: <20210904040600.85817-1-ysde108@gmail.com>
Subject: Re: [PATCH] Update zh-tw document index.rst (#1)
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1e33a5c7-0def-0f6f-b65d-4849e656f2f4@gmail.com>
Date:   Sat, 4 Sep 2021 14:13:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210904040600.85817-1-ysde108@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[+CC: Hu Haowen]

Hello Arthur,
Welcome to kerneldoc!

I have a few comments WRT how to post patches in translations
and .rst in particular.  Please see inline comments below.

(Note: I don't read Chinese text.)

On Sat,  4 Sep 2021 12:06:00 +0800, arthur.yueh wrote:
> From: ArthurYueh <ysde108@gmail.com>
>=20
> Trying to make the `zh-tw` index.rst document more readable for users w=
ho use `zh-tw`
> ---

You do need to add your Signed-off-by tag here.
Otherwise, the patch won't be accepted.

See: Documentation/translations/zh_TW/process/submitting-patches.rst
or Documentation/process/submitting-patches.rst

As you see in the guide, in this case, you need to send zh_TW patches to
Hu Haowen, who is the maintainer of zh_TW translations.

You can find the right people to send patches by scripts/get_maintainer.p=
l

At current docs-next of -doc tree,

   ./scripts/get_maintainer.pl Documentation/translations/zh_TW/index.rst=


gives the following list:

Hu Haowen <src.res@email.cn> (maintainer:TRADITIONAL CHINESE DOCUMENTATIO=
N)
Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
Alexei Starovoitov <ast@kernel.org> (supporter:BPF (Safe dynamic programs=
 and tools))
Daniel Borkmann <daniel@iogearbox.net> (supporter:BPF (Safe dynamic progr=
ams and tools))
Andrii Nakryiko <andrii@kernel.org> (supporter:BPF (Safe dynamic programs=
 and tools))
Martin KaFai Lau <kafai@fb.com> (reviewer:BPF (Safe dynamic programs and =
tools))
Song Liu <songliubraving@fb.com> (reviewer:BPF (Safe dynamic programs and=
 tools))
Yonghong Song <yhs@fb.com> (reviewer:BPF (Safe dynamic programs and tools=
))
John Fastabend <john.fastabend@gmail.com> (reviewer:BPF (Safe dynamic pro=
grams and tools))
KP Singh <kpsingh@kernel.org> (reviewer:BPF (Safe dynamic programs and to=
ols))
linux-doc-tw-discuss@lists.sourceforge.net (open list:TRADITIONAL CHINESE=
 DOCUMENTATION)
linux-doc@vger.kernel.org (open list:DOCUMENTATION)
linux-kernel@vger.kernel.org (open list)
netdev@vger.kernel.org (open list:BPF (Safe dynamic programs and tools))
bpf@vger.kernel.org (open list:BPF (Safe dynamic programs and tools))

For this particular patch, I don't think BPF is relevant. so,

Hu Haowen <src.res@email.cn> (maintainer:TRADITIONAL CHINESE DOCUMENTATIO=
N)
Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
linux-doc-tw-discuss@lists.sourceforge.net (open list:TRADITIONAL CHINESE=
 DOCUMENTATION)
linux-doc@vger.kernel.org (open list:DOCUMENTATION)   -> you posted here
linux-kernel@vger.kernel.org (open list)

should suffice.

(Note: linux-doc-tw-discuss@lists.sourceforge.net is not an open list,
but moderated.  You can omit it if you'd like, or it might be a good idea=

to subscribe it if you are willing to continue contributing to
zh_TW translations.)

>  Documentation/translations/zh_TW/index.rst | 43 +++++++++-------------=

>  1 file changed, 18 insertions(+), 25 deletions(-)
>=20
> diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation=
/translations/zh_TW/index.rst
> index c02c4b528..5458dab82 100644
> --- a/Documentation/translations/zh_TW/index.rst
> +++ b/Documentation/translations/zh_TW/index.rst
> @@ -14,22 +14,20 @@
> =20
> =20
>  .. note::
> -   =E5=85=A7=E6=A0=B8=E6=96=87=E6=AA=94=E7=B9=81=E9=AB=94=E4=B8=AD=E6=96=
=87=E7=89=88=E7=9A=84=E7=BF=BB=E8=AD=AF=E5=B7=A5=E4=BD=9C=E6=AD=A3=E5=9C=A8=
=E9=80=B2=E8=A1=8C=E4=B8=AD=E3=80=82=E5=A6=82=E6=9E=9C=E6=82=A8=E9=A1=98=E6=
=84=8F=E4=B8=A6=E4=B8=94=E6=9C=89=E6=99=82=E9=96=93=E5=8F=83=E8=88=87=E9=80=
=99=E9=A0=85=E5=B7=A5
> -   =E4=BD=9C=EF=BC=8C=E6=AD=A1=E8=BF=8E=E6=8F=90=E4=BA=A4=E8=A3=9C=E4=B8=
=81=E7=B5=A6=E8=83=A1=E7=9A=93=E6=96=87 <src.res@email.cn>=E3=80=82
> +   linux=E6=A0=B8=E5=BF=83=E6=96=87=E4=BB=B6=E7=B9=81=E9=AB=94=E4=B8=AD=
=E6=96=87=E7=9A=84=E7=BF=BB=E8=AD=AF=E5=B7=A5=E4=BD=9C=E6=AD=A3=E5=9C=A8=E9=
=80=B2=E8=A1=8C=E4=B8=AD=E3=80=82=E5=A6=82=E6=9E=9C=E6=82=A8=E9=A1=98=E6=84=
=8F=E4=B8=A6=E4=B8=94=E6=9C=89=E6=99=82=E9=96=93=E5=8F=83=E8=88=87=E9=80=99=
=E9=A0=85=E5=B7=A5
> +   =E4=BD=9C=EF=BC=8C=E6=AD=A1=E8=BF=8E=E6=8F=90=E4=BA=A4=E4=BF=AE=E6=AD=
=A3=E7=B5=A6=E8=83=A1=E7=9A=93=E6=96=87 <src.res@email.cn>=E3=80=82
> =20
> -=E8=A8=B1=E5=8F=AF=E8=AD=89=E6=96=87=E6=AA=94
> +=E8=A8=B1=E5=8F=AF=E8=AD=89
>  ----------
   ------

In reST text, these bars indicate a section title and they should have
the same length as the title, so they should be shortened as well.
(One Chinese character -> two bars)

> =20
> -=E4=B8=8B=E9=9D=A2=E7=9A=84=E6=96=87=E6=AA=94=E4=BB=8B=E7=B4=B9=E4=BA=86=
Linux=E5=85=A7=E6=A0=B8=E5=8E=9F=E5=A7=8B=E7=A2=BC=E7=9A=84=E8=A8=B1=E5=8F=
=AF=E8=AD=89=EF=BC=88GPLv2=EF=BC=89=E3=80=81=E5=A6=82=E4=BD=95=E5=9C=A8=E5=
=8E=9F=E5=A7=8B=E7=A2=BC=E6=A8=B9=E4=B8=AD=E6=AD=A3=E7=A2=BA=E6=A8=99=E8=A8=
=98
> -=E5=96=AE=E5=80=8B=E6=96=87=E4=BB=B6=E7=9A=84=E8=A8=B1=E5=8F=AF=E8=AD=89=
=E3=80=81=E4=BB=A5=E5=8F=8A=E6=8C=87=E5=90=91=E5=AE=8C=E6=95=B4=E8=A8=B1=E5=
=8F=AF=E8=AD=89=E6=96=87=E6=9C=AC=E7=9A=84=E9=80=A3=E7=B5=90=E3=80=82
> +=E4=B8=8B=E9=9D=A2=E7=9A=84=E6=96=87=E4=BB=B6=E4=BB=8B=E7=B4=B9=E4=BA=86=
Linux=E6=A0=B8=E5=BF=83=E5=8E=9F=E5=A7=8B=E7=A2=BC=E7=9A=84=E8=A8=B1=E5=8F=
=AF=E8=AD=89=EF=BC=88GPLv2=EF=BC=89=E3=80=81=E5=A6=82=E4=BD=95=E5=9C=A8=E5=
=8E=9F=E5=A7=8B=E7=A2=BC=E7=9A=84=E6=A8=B9=E7=8B=80=E7=B4=80=E9=8C=84=E4=B8=
=AD=EF=BC=8C=E6=AD=A3=E7=A2=BA=E6=A8=99=E8=A8=98=E5=90=84=E5=80=8B=E6=96=87=
=E4=BB=B6=E7=9A=84=E8=A8=B1=E5=8F=AF=E8=AD=89=E3=80=81=E4=BB=A5=E5=8F=8A=E5=
=AE=8C=E6=95=B4=E7=9A=84=E8=A8=B1=E5=8F=AF=E8=AD=89=E5=85=A7=E6=96=87=E7=9A=
=84=E9=80=A3=E7=B5=90=E3=80=82

Please fold lines around 80 column.

> =20
>  Documentation/translations/zh_TW/process/license-rules.rst
> =20
> -=E7=94=A8=E6=88=B6=E6=96=87=E6=AA=94
> +=E7=94=A8=E6=88=B6=E7=9B=B8=E9=97=9C=E6=96=87=E4=BB=B6
>  --------
   ------------

Ditto. (In this case need to be lengthened.)

I leave other similar mismatches in your patch.
I look forward to seeing a v2 of this patch.

        Thanks, Akira
> =20
[...]


