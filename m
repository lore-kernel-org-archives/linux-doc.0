Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E15FC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 03:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbiBHDpg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Feb 2022 22:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiBHDpf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Feb 2022 22:45:35 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF55C0401DC
        for <linux-doc@vger.kernel.org>; Mon,  7 Feb 2022 19:45:34 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id s18so19526763ioa.12
        for <linux-doc@vger.kernel.org>; Mon, 07 Feb 2022 19:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PbQrb0gTjMUA7dCpws+zpJj/Q7iWezj5fd3NPVq9yEY=;
        b=BzilsLNZcNUlqHMrSQbXYduezrhtsxkbotgfYlD9Yz3PmEQCnULDbpvB4eHYSLVhsp
         vG1G+V91nEeg78eyof9yqoWlLBZWVG2Ai93Vxe91ueabZA+0XcM1fwSVWnX4Yle45h+F
         h+2JXYa4acI5X0OhTIMDuGgxM9xNiLXKKLVua1dSrjoLSkSHXUxHhttpWHB4REcX87WS
         TKFdEnsxVsSLVnU+tuYSMtExlXcYSTe406+N+knqaXARNXbdaASWq+WRkUNw7ToAJoRD
         nlPqlNY0GAEZmAky+iBlq7GzbCCHgNuvhxRxt7iXnqmfj87hbPSlbTixTI+fyLPA+uJD
         e5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PbQrb0gTjMUA7dCpws+zpJj/Q7iWezj5fd3NPVq9yEY=;
        b=aKC0Yerrpi5VHtmUpbB+3rlbeDOrFqTDRbNOnJx+vzzud3XRAEjNs6qjQC+DlLrJnx
         EpFrAujHTsSL06ZZf+niJ/GiT9y6SRQGO5MClocEDCtqeFjQ277lEKOkBWJh4A43zdPt
         P6sUf8oi13ZKC11DMuedgk5CpVtGIDa0GwADEr5RGX4cwWpjGoLFJP8J81v/VHqSc1A+
         ChyXl/Bm23sRfdCrKQ8OGDih/H4dYI30cU+FP4Rg+BrtYfB7Vt3JK4PsNP1JLkIgDbgf
         iDlDoYBcKuwB5WkPnsfwoi1TrP/h9ybwCLL/J0rVJ7GvdPuj6suYdGQXb2/1Isca8gAh
         ZKHg==
X-Gm-Message-State: AOAM533kr5Wh9eHEp1iG8UkHjoD85cBNqJ+NYvy9R00RRr9LwvYJ476x
        fJJ2oGNpYVAm/1fC9AJhPdvxdOr0OT75ufKDWDQ=
X-Google-Smtp-Source: ABdhPJxT24T/OLSfHlry2PxHkmsaDLDu6UH3gZlY6rxJ8Pacrtel9F3AG/eXhXfyzCaB3OiQAdjzCmPwPcAiDh8Ba6Y=
X-Received: by 2002:a05:6602:1409:: with SMTP id t9mr1194530iov.176.1644291934343;
 Mon, 07 Feb 2022 19:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20220208020504.22847-1-tangyizhou@huawei.com> <CAEensMwar+DJNBgdxkXiv9GJfLnKOrZHAkMxifYUKYt9gbhcJw@mail.gmail.com>
In-Reply-To: <CAEensMwar+DJNBgdxkXiv9GJfLnKOrZHAkMxifYUKYt9gbhcJw@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 8 Feb 2022 11:44:58 +0800
Message-ID: <CAJy-Amm2BzqpVOj=XbuTYEQ+6DZdP0tC4FvX1b8MR_cOBpB6GA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add energy-model Chinese translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Tang Yizhou <tangyizhou@huawei.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > +2.4 API=E7=9A=84=E7=BB=86=E8=8A=82=E6=8F=8F=E8=BF=B0
> > +^^^^^^^^^^^^^^^^^
> > +.. kernel-doc:: include/linux/energy_model.h
> > +   :internal:
> > +
> > +.. kernel-doc:: kernel/power/energy_model.c
> > +   :export:
> Hi Yizhou=EF=BC=8C
>
> Html document is displayed here in English, this problem is tricky to
> solve, and it is not a good time to solve this problem, let's handle
> it like kernel-api.rst for now.
>

Right, we had some disscusion in lkml for the problem, the agreed
solution is that don't include the source code in translation docs.

Thanks
Alex
