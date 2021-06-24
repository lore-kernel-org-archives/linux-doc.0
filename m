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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E03C48BC2
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 01:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA48361380
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 01:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFXBht (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 21:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFXBht (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 21:37:49 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1815BC061574
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 18:35:30 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id 69so2100362plc.5
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 18:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mmjXrdylBjDxK/ZKzVX5a40t8t/VcpEBzho9L3jyNug=;
        b=W/BWlQszZ3BopBOb5RPkZkITCFEl/5l1vIMaHFgsBnoma0hDu7a/YWssHHHxWrQh9q
         r6970lJ9VM5iKXDWWnIzby4ANJDg6op/gFw8zW201YWJxeHYAIHx44L9fTURq7vsZhbt
         VB1DdsAgP780OTb459oQH42KBC1DQ6IttgQaX8YVC02CHOY9t858GYSOsrOjJUHbq6zi
         AD9z8eacuSjb5LizMglQzxDFsVaIjcnbA8EgeZYX57vEf1Z1q+J5j1ZUyzyVjtWe2CmL
         60MMd7XvVlp7o9mhA2veV5SHhUWNg5jcM7fzAapazFl6t2nOqGNSTrrKwIj7AHML9bu6
         UTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mmjXrdylBjDxK/ZKzVX5a40t8t/VcpEBzho9L3jyNug=;
        b=dHEBodVOL6bUMUccgEBTHTdEXVnzsWI+DY2rc8mehbs+6iP4Sx5wFZKYWTI9PYRogu
         08L54pwqpd9nrkjoIrKq1GSMoFJnoWwiuNVLAlsS01N0Rnr2BelzjDMn85lO+Y++hmPI
         V/Ma6pxMEZLQ3v0ueSot3tqOA6QFEJ+ov5PhrfFnVa8/T/xJ/cx9OzWsxfCIllxD/vdS
         lI361zCShdrNVAowcfOFf3vEwMI/7qKETiTNGTS8kmzsGyTVspRGg4YDLIQm22U7uJNh
         qD8d4aI9j1ZU3fx130iaWhDz2+okT3bQn/DZNUHi/m3M9gUIkXvBU2Lna8vVc/T7c2xr
         V53g==
X-Gm-Message-State: AOAM533BiqI6cgL3qr/b7iUkv2I+mQBRzZioWDjpssSB6qrISwvY4aMK
        6V40K30P4EoVVQl1NFqPUfosK0aiHCuJg5A8JZs=
X-Google-Smtp-Source: ABdhPJw30agMLECaw2JjptzRr24KFTC5in1WTSPYKoEjDl48mdNgh9rF7uSCkraFUlnOYU+qE3zEo19oZqY4T7H3qoY=
X-Received: by 2002:a17:90a:7bc4:: with SMTP id d4mr12011102pjl.24.1624498529004;
 Wed, 23 Jun 2021 18:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624434673.git.bobwxc@email.cn>
In-Reply-To: <cover.1624434673.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 24 Jun 2021 09:35:19 +0800
Message-ID: <CAMU9jJq1CRX-yi91z2v2ExfBtkW=QrPoTEm7wRQLHoq1_jGt5A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] docs/zh_CN: Add two new translations in zh_CN/admin-guide
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Thanks,
Yanteng

Wu XiangCheng <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B46=E6=9C=8823=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:14=E5=86=99=E9=81=93=EF=BC=9A
>
> Add two new translations
>     zh_CN/admin-guide/efi-stub.rst
>     zh_CN/admin-guide/initrd.rst
>
> v2:
> * modify some words under Alex Shi and Yanteng Si's suggestions,
>   see <http://fars.ee/1MWq/diff> .
>   Thanks for their's review!
>
> v1:
> <https://lore.kernel.org/linux-doc/cover.1624169811.git.bobwxc@email.cn/T=
/>
>
> Thanks!
>
> Wu XiangCheng (2):
>   docs/zh_CN: Add translation zh_CN/admin-guide/efi-stub.rst
>   docs/zh_CN: Add translation zh_CN/admin-guide/initrd.rst
>
>  .../zh_CN/admin-guide/efi-stub.rst            |  86 +++++
>  .../translations/zh_CN/admin-guide/index.rst  |   4 +-
>  .../translations/zh_CN/admin-guide/initrd.rst | 321 ++++++++++++++++++
>  3 files changed, 409 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/efi-stub=
.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/initrd.r=
st
>
> --
> 2.20.1
>
