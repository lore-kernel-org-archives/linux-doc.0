Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2087C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 03:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BA7E611CC
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 03:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbhDCDLE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Apr 2021 23:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhDCDLE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Apr 2021 23:11:04 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854F3C0613E6
        for <linux-doc@vger.kernel.org>; Fri,  2 Apr 2021 20:11:02 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id y3so303231pgi.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Apr 2021 20:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s0+pNrHAUkM55mVGeeupfQ/KQgWXQ88I5UxGETqejPs=;
        b=lj5qGjB9n7K1foVsBmCaxTywSbBI0zLdSAb+L6tZPbLAFCz4YeywRfpBfrf+FJRWJH
         vUelcIs6dBD335FABjlVnxvELxOQ4lUlgUX+cwWB90mg8PGQoQiucRUKbOcUDIVwptkR
         CxQqAS12tpx8r+wcej0cn4/hKvzTmqeusPQcTutrb7s2dt3/yk1SJu9KpLS26dqL1VQs
         gHbXiJPtVd7D7qIOb3Fz08TtXM90wnE627qijJ6ISD4ecdaBYRaHbdsVgZBDAG+dq1u9
         W8Tnd1qtwLOuw1dYRWgPPrE/0LbhVCpcBPEqA2Ykcs72zO5l00StTy75dYEM+h208fMr
         zFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s0+pNrHAUkM55mVGeeupfQ/KQgWXQ88I5UxGETqejPs=;
        b=pS2UZvt3dhZEa42zlJdeueJyE1zR+K0pAYC32cus4iATuSzMKCC02TPrN2c6Fap9Tx
         oYh6MhPBA5wsVWZ4RwCTb1JG+JKQQiH4GF44BjxKDdpbELZcj3mIIFvyBPoqKTswiGUN
         GbPOwiTQAacKHqGxmdHI6g44ZdMmt0aclUG4WmThe0FLvXGOr7oBqr56W9nbuO4rYqWp
         7WgocPpLbbsobFEY6Xq8v1wvfrSJpgpcq+fjVJ0fGeL/NtJt2Aj2JhNCsgLf3iXMEHJ1
         /FvXpNWanTONEAoi4LqEMX/NCHsDB0Od2L+SvMIPEMd0GUriYp66WrvtgQ9OxsBwBS6E
         4OLw==
X-Gm-Message-State: AOAM532cNTzXsa3gTr4d2aC3IK+vWnhhV40zY09Om3an95DRhfvYt0wv
        BJ75lTJtiebf69aS1UHzbwsh/C2+f25HiKe/N632h2Z7IpsekQ==
X-Google-Smtp-Source: ABdhPJyjiId8YrsCGAMNWe16yg2Xl95VsQsoFsprbV6Or0lXLXeCwP9ZMrcDPZPPSBP/I1/6XYwK3Icpw85m81O2mZ0=
X-Received: by 2002:aa7:8649:0:b029:1fb:283:6047 with SMTP id
 a9-20020aa786490000b02901fb02836047mr14844240pfo.62.1617419462173; Fri, 02
 Apr 2021 20:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617412012.git.bobwxc@email.cn> <fdc591a9f5449aa59269f6d9667c8c5d28b77567.1617412012.git.bobwxc@email.cn>
In-Reply-To: <fdc591a9f5449aa59269f6d9667c8c5d28b77567.1617412012.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Sat, 3 Apr 2021 11:10:58 +0800
Message-ID: <CAMU9jJqUdxLNp0PyA1qkLmtLLUDbYFoUJVLyhXQo7q8stVZS5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Wu XiangCheng <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B44=E6=9C=883=E6=97=A5=
=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=889:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Add zh_CN/doc-guide entry in zh_CN/index.rst
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index 4fdd57417ffb..4258006f4763 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -18,6 +18,7 @@
>
>     admin-guide/index
>     process/index
> +   doc-guide/index
>     kernel-hacking/index
>     filesystems/index
>     arm64/index
> --
> 2.20.1
>
