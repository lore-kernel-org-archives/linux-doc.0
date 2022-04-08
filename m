Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB9AC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 04:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbiDHEEz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 00:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbiDHEEs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 00:04:48 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645A812925A
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 21:02:43 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id a19so3200211oie.7
        for <linux-doc@vger.kernel.org>; Thu, 07 Apr 2022 21:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HKC7fONhd8yxLSKitQPoRLoju91CAthR2ex0234j8bY=;
        b=c0UgyBNNALf5HYbJVeAJP6s9fNsd4XhuALmJCxSjQ+nyhI7op3sqI71/PSTpgiYjrh
         tJFscOcfWpC0mIQOVOi67yFXv2WSZsvISL+tMkmuRMdNAOZsGgSU/7sVQeAZZxkvH8jr
         nGb/oZ1Vhs2rdY4MzqXWgtCWVsHHUBIG6Gj2FWweCvN4+rnjNLX1YtVUjSmoBORylHJe
         iDgc1/HiKgQ1J8Gfes63vKhdTMCslKyC+Q1wfXG6fiKQ1HJZQq+sZ8Xz70nhd16FXsuL
         6QGz29d5L5SgE4bpMCPEi//AcfBA1G3O/E0KdD9gbGPSqq25BQ89K45fltpKOJxncz5i
         WbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HKC7fONhd8yxLSKitQPoRLoju91CAthR2ex0234j8bY=;
        b=FejznflqNqdfrKGGne0lYLFKOSeqEeDaI/AvD1tnPvBuf69dg8S7KBvuYw9767U15J
         hpRSQYUwi38b+tIOGZdhJy2s1PkmBb7jl5MONWyUyMxccxEf5Pd0s50KY2EesT2A55/q
         ODzlYBn5mCBE7Pqwu94SPzzWfDasTwWVvR1kEvdZnUuz6WaGPaBRzUGWKfmLTW16iDA8
         k4q5qY3/OlMnePsPMdTd85S1H3TCtKzpxzZcWTXwx8+OjQGoAmsnRq+xfX1ZgqyqnzMc
         65MrfYlh1DabTIZlsmGRjFv2ks1iMifNNBYUMsaKl6I8hyqH1HvHmw1vFdsqN3RBBX/I
         7udQ==
X-Gm-Message-State: AOAM5317Z/zJFz3cJ5OlaLVfxyT09OlUwf+VvVQ1VGRVbZg0Ptf1SQ1k
        FvzzK0rejaS78qkyHVKqyXM8gmprjRc0JUFFuDI=
X-Google-Smtp-Source: ABdhPJzc9yNSaPjGVc0589T0bs5HY8zjSKAza2+4hLu+rkM2hPBAgPGWNYsYzwL4dabjeoa1HiIULaL6Z8YLpdBPiyg=
X-Received: by 2002:a54:4d01:0:b0:2ec:b5b7:f1a2 with SMTP id
 v1-20020a544d01000000b002ecb5b7f1a2mr7496192oix.130.1649390562353; Thu, 07
 Apr 2022 21:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220408033921.GA931@DESKTOP-S4LJL03.localdomain> <CAM9d7cjhHyjM2zOZCOsJm+AU2dFUr3rd7mFK4TKrV+jGOKAGQw@mail.gmail.com>
In-Reply-To: <CAM9d7cjhHyjM2zOZCOsJm+AU2dFUr3rd7mFK4TKrV+jGOKAGQw@mail.gmail.com>
From:   Paran Lee <p4ranlee@gmail.com>
Date:   Fri, 8 Apr 2022 13:02:32 +0900
Message-ID: <CAM-w3QQGcPyXXr+XfjT-4wgFS=1SzKENKRHn1RMsvdCV9XbpAw@mail.gmail.com>
Subject: Re: Hangeul translation KLDP document - Unreliable Guide To Hacking
 The Linux Kernel - IAMROOT16 linux kernel study group
To:     Namhyung Kim <namhyung@kernel.org>
Cc:     linux-doc@vger.kernel.org, rnjsenwls1@gmail.com,
        =?UTF-8?B?6rmA6rCc66+4?= <oldkyeom@gmail.com>,
        jw p <n0isenair@gmail.com>, vvghjk1234@gmail.com,
        skseofh@gmail.com, 239lsg239@gmail.com,
        Peter Yoo <jh10.yoo@gmail.com>, mcsmonk@gmail.com,
        kyle.seungchul@gmail.com, ybgwon@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks you, Namhyung Kim!

We are going to work together on the iamroot16 kernel study time
tomorrow, saturday!

Have a good day :)
Namhyung Kim


2022=EB=85=84 4=EC=9B=94 8=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 12:45, N=
amhyung Kim <namhyung@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Paran Lee,
>
> Thanks for reaching out to me and your work on the kernel.  I am fine wit=
h updating it and submitting the translation.  Please go ahead.
>
> Thanks,
> Namhyung
>
>
> On Thu, Apr 7, 2022, 8:39 PM Paran Lee <p4ranlee@gmail.com> wrote:
>>
>> Hello Namhyung Kim! I am the Paran Lee of iamroot 16th, the korea arm64 =
Linux kernel study group.
>>
>> I have a question for you KLDP Hangeul Translation posting about Rusty R=
ussell's "Unreliable Guide To Hacking The Linux Kernel" liked in https://wi=
ki.kldp.org/wiki.php/UnreliableGuideToHackingTheLinuxKernel
>>
>> At the time of Linux kernel v4.13-rc1, original document was moved from =
`Documentation/DocBook/kernel-hacking.tmpl` to its current location `/Docum=
entation/kernel-hacking/hacking.rst`, and the contents have changed slightl=
y. linked in https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/log/Documentation/kernel-hacking/hacking.rst
>>
>> Me and our iamroot 16th study group members will review the contents of =
the translated KLDP document and check the latest Rusty Russell's docs.
>>
>> Is it ok for our study group to reformat from web document to .rst file =
and add that file to Documentation/translations/ko_KR, where the korea tran=
slated documents in upstream linux kernel?
