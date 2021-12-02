Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0312C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  2 Dec 2021 09:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346031AbhLBJej (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Dec 2021 04:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240976AbhLBJei (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Dec 2021 04:34:38 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96749C06174A
        for <linux-doc@vger.kernel.org>; Thu,  2 Dec 2021 01:31:16 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id iq11so20110682pjb.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Dec 2021 01:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SoknoP58lfTefhPic/InEtJ7lAsohw87fhlIuwYrrKo=;
        b=kbmT2PmaVoGUcxYc22QC2y7WHDyH7VgMfO3rgseqM9O5nPbxD8ejoghG3IoGXoTm0g
         58k+tKBUt32ysG1nUz3y6EzrMY6A8V4Odq5YSUHUW37ZMSi5tRaCbbo9bAd/ecnv7sjJ
         Lq1JeSa1dczIJqnRPefeOumL0zw4xB8XDBXlzFtaKpZg1De9+OnK5u7DDqeeegOZOtpg
         L0DJ5dWdts2ZqCCEsZjly39+P/YxcldmIX2vgC/j9YsCTvj2QBvNDcMuyvfbt68iNEGV
         kd/N28uW/WfRU3x7AILaVWYk/NQeRF8XRYRXjFoywJj+Uzwha77BB7t2UEJD+wivGPSL
         ew9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SoknoP58lfTefhPic/InEtJ7lAsohw87fhlIuwYrrKo=;
        b=0NG8E73BZGTtjJCyeESK0Ft70l0cwvZxQ+jHTP9/BZgCuoul6xgMFKEFgtWepZdecT
         X+hOqm4zKTuQkYbc7HfYQZ8gOu2Y3UZV7lPv8u6869Se3EqrCGsGzlHiZN/NIvKEs8Ef
         vO92N29BhnUvWnZfges4GKR8ts1n4EspaGR/aSZxYWVDO5XP7Xt+24pWZIuN+bk591ie
         ySEtSoYd/mgHF3WbmKKGzHNaHtnMepvAKj/R1U3ZUQsqyG7Dv6Cg2v5ttjZuwqOID/kx
         G8Yd7bkjtm4cxFnEYQg+WVI0vKYbBO+zzpIW7XWVlj40rZlQ0KwMxY8y8kTVOtf1yrMe
         W+2A==
X-Gm-Message-State: AOAM5321ckqAXb1OwM13as9qj5dWev6tngajP9kJVhLx01TXeXqSE3eO
        67qLGYqJh1aFqQ9ELa+qhj6YuTuygV9aADvA19g=
X-Google-Smtp-Source: ABdhPJyQkP+QIG+x6qgokm8MZ9THNyUUpBGz4yBm8I73a7V+0pI+7RVHSWNCRNGxTtBKE9UEZYp27Bjtlhsz2lo1kPE=
X-Received: by 2002:a17:90b:155:: with SMTP id em21mr4886325pjb.12.1638437476162;
 Thu, 02 Dec 2021 01:31:16 -0800 (PST)
MIME-Version: 1.0
References: <1c883061-e538-757e-d3fe-df8f6d201e1e@huawei.com>
In-Reply-To: <1c883061-e538-757e-d3fe-df8f6d201e1e@huawei.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 2 Dec 2021 17:31:04 +0800
Message-ID: <CAMU9jJoBqHJu7hu_U3nBSO5i+GxDWdeNa2-8sC3Z92VB0RsKcw@mail.gmail.com>
Subject: Re: [DISCUSSION] Want to participate in Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B411=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8811:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi, I'm glad to see you are contributing to the Chinese translations of t=
he documents.
>
> I have translated scheduler/sched-capacity for a in-company technical tal=
king and I want to contribute it to the community. I'll send the patch soon=
.
Welcome! I can't wait to see your translation!

Thanks,
Yanteng
>
> Also, I will take part in the reviewing for the subjects I'm interested i=
n, such as scheduling and CPU power management.
>
> Thanks,
> Tang
