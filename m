Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A790C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Feb 2022 13:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241394AbiBQN4N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Feb 2022 08:56:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241506AbiBQNz7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Feb 2022 08:55:59 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F111279084
        for <linux-doc@vger.kernel.org>; Thu, 17 Feb 2022 05:55:44 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id 24so3704685ioe.7
        for <linux-doc@vger.kernel.org>; Thu, 17 Feb 2022 05:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Bxbkjw/VTvWv2xNrsmQvhTrD2GSumqC08fAC7izCWuw=;
        b=outf+RQGSyF1GA3m+NRwczTWulqQE/egA9xBYNNndj+A/xaFVLYleR595iutiy5/FG
         uX1JgPNHPgWIc1hV13Fj2ESoz7WKzbfXKQCa3A1K9prG0YXpoPylsI6K5i2BXxpot/31
         yRxxC1waf/yNIPyJxB3/ToM3SydNwrqLE35bTtrEirOKTZnGHrYBxDyYJ+2bHWUF61BC
         VPyZBl58J+myQ5YdbKJFch1Orjw4BMoPcdoZgNIZ1T8LO7v8+LJYNSIhw7sCu3gG/oCh
         N8EhO1mttvzigAyrA8IsqEQH5DzUhgcJ1qnMaJS0OpdAn3f8B3Iyq7az8eBvizwbenL+
         otsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Bxbkjw/VTvWv2xNrsmQvhTrD2GSumqC08fAC7izCWuw=;
        b=F7boqJvuEYKFfkDxyt06kKNHf6jfNakdNlLEt0s5ejTrCJmsRbT+FcwOOvdRJzh5l7
         VePVd4cDw2qb116+XVn3nnvuLyVDaEq4L7eu1RJlEJaqS0aQBEr5PlhEiiZIDMrKqdAK
         emXSyLmrsWhOq46iyQ+8dyBQ5Yk/ROld0EdqhwkqQrFQAOcL7q+gVRS+czWCnoTCQoND
         7kTIOVhUy/Fc4ZGtPMDSknGAj4T34LQCIj5yRCbD53yNMSlnC5sWcq/cnlS8wOPQCb7E
         xxGMUSpV8NBfHvuiQTxhRaKG+7Khppy/XflkGzkFL36vCxS95VX2tduZ3+5MnzIVPox6
         40QA==
X-Gm-Message-State: AOAM531LPITsBOCkEeuiQVAwL+98IkeHumN7s4brqanJmmLo3BujD+/k
        TNrFrScjkTWfxGeZkcqN0yoBNVvZhfXLc1kFZ10=
X-Google-Smtp-Source: ABdhPJzcH2laGma8uZ+uw5RXSHhrlObWoJ7y1OkKFJDEA/2UzudBwRPTD5lXRK3TlqMRL4/8XwZs551YKfg161Qrf84=
X-Received: by 2002:a02:2908:0:b0:314:48d3:2d6b with SMTP id
 p8-20020a022908000000b0031448d32d6bmr1946134jap.169.1645106143809; Thu, 17
 Feb 2022 05:55:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645003763.git.siyanteng@loongson.cn> <f8b5b077721b22eef6437255010d2020a40bde65.1645003763.git.siyanteng@loongson.cn>
In-Reply-To: <f8b5b077721b22eef6437255010d2020a40bde65.1645003763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 17 Feb 2022 21:55:07 +0800
Message-ID: <CAJy-Amnua0DM_LmfM-i8P+80FEfuMnb_V71eyOf=m6gFJ66e_A@mail.gmail.com>
Subject: Re: [PATCH 1/5] docs/zh_CN: Refactoring the admin-guide directory index
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     corbet@lwn.net, alexs@kernel.org,
        Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 16, 2022 at 5:38 PM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> The Todolist in the html document looks a mess, now give it a nice lookin=
g format.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  .../translations/zh_CN/admin-guide/index.rst  | 122 +++++++++---------
>  1 file changed, 61 insertions(+), 61 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Doc=
umentation/translations/zh_CN/admin-guide/index.rst
> index 763055f161dd..be535ffaf4b0 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -20,15 +20,15 @@ Linux =E5=86=85=E6=A0=B8=E7=94=A8=E6=88=B7=E5=92=8C=
=E7=AE=A1=E7=90=86=E5=91=98=E6=8C=87=E5=8D=97
>
>  Todolist:
>
> -   kernel-parameters
> -   devices
> -   sysctl/index
> +*   kernel-parameters
> +*   devices
> +*   sysctl/index
>
>  =E6=9C=AC=E8=8A=82=E4=BB=8B=E7=BB=8DCPU=E6=BC=8F=E6=B4=9E=E5=8F=8A=E5=85=
=B6=E7=BC=93=E8=A7=A3=E6=8E=AA=E6=96=BD=E3=80=82
>
>  Todolist:
>
> -   hw-vuln/index
> +*   hw-vuln/index
>
>  =E4=B8=8B=E9=9D=A2=E7=9A=84=E4=B8=80=E7=BB=84=E6=96=87=E6=A1=A3=EF=BC=8C=
=E9=92=88=E5=AF=B9=E7=9A=84=E6=98=AF=E8=AF=95=E5=9B=BE=E8=B7=9F=E8=B8=AA=E9=
=97=AE=E9=A2=98=E5=92=8Cbug=E7=9A=84=E7=94=A8=E6=88=B7=E3=80=82
>
> @@ -44,18 +44,18 @@ Todolist:
>
>  Todolist:
>
> -   reporting-bugs
> -   ramoops
> -   dynamic-debug-howto
> -   kdump/index
> -   perf/index
> +*   reporting-bugs
> +*   ramoops
> +*   dynamic-debug-howto
> +*   kdump/index
> +*   perf/index
>
>  =E8=BF=99=E6=98=AF=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E5=BC=80=E5=8F=91=
=E4=BA=BA=E5=91=98=E6=84=9F=E5=85=B4=E8=B6=A3=E7=9A=84=E7=AB=A0=E8=8A=82=E7=
=9A=84=E5=BC=80=E5=A7=8B=E3=80=82=E5=8F=AF=E4=BB=A5=E5=9C=A8=E8=BF=99=E9=87=
=8C=E6=89=BE=E5=88=B0=E6=B6=B5=E7=9B=96=E5=86=85=E6=A0=B8ABI=E5=90=84=E4=B8=
=AA
>  =E6=96=B9=E9=9D=A2=E7=9A=84=E6=96=87=E6=A1=A3=E3=80=82
>
>  Todolist:
>
> -   sysfs-rules
> +*   sysfs-rules
>
>  =E6=9C=AC=E6=89=8B=E5=86=8C=E7=9A=84=E5=85=B6=E4=BD=99=E9=83=A8=E5=88=86=
=E5=8C=85=E6=8B=AC=E5=90=84=E7=A7=8D=E6=8C=87=E5=8D=97=EF=BC=8C=E4=BB=8B=E7=
=BB=8D=E5=A6=82=E4=BD=95=E6=A0=B9=E6=8D=AE=E6=82=A8=E7=9A=84=E5=96=9C=E5=A5=
=BD=E9=85=8D=E7=BD=AE=E5=86=85=E6=A0=B8=E7=9A=84=E7=89=B9=E5=AE=9A=E8=A1=8C=
=E4=B8=BA=E3=80=82
>
> @@ -73,57 +73,57 @@ Todolist:
>
>  Todolist:
>
> -   acpi/index
> -   aoe/index
> -   auxdisplay/index
> -   bcache
> -   binderfs
> -   binfmt-misc
> -   blockdev/index
> -   bootconfig
> -   braille-console
> -   btmrvl
> -   cgroup-v1/index
> -   cgroup-v2
> -   cifs/index
> -   dell_rbu
> -   device-mapper/index
> -   edid
> -   efi-stub
> -   ext4
> -   nfs/index
> -   gpio/index
> -   highuid
> -   hw_random
> -   initrd
> -   iostats
> -   java
> -   jfs
> -   kernel-per-CPU-kthreads
> -   laptops/index
> -   lcd-panel-cgram
> -   ldm
> -   LSM/index
> -   md
> -   media/index
> -   module-signing
> -   mono
> -   namespaces/index
> -   numastat
> -   parport
> -   perf-security
> -   pm/index
> -   pnp
> -   rapidio
> -   ras
> -   rtc
> -   serial-console
> -   svga
> -   thunderbolt
> -   ufs
> -   vga-softcursor
> -   video-output
> -   xfs
> +*   acpi/index
> +*   aoe/index
> +*   auxdisplay/index
> +*   bcache
> +*   binderfs
> +*   binfmt-misc
> +*   blockdev/index
> +*   bootconfig
> +*   braille-console
> +*   btmrvl
> +*   cgroup-v1/index
> +*   cgroup-v2
> +*   cifs/index
> +*   dell_rbu
> +*   device-mapper/index
> +*   edid
> +*   efi-stub
> +*   ext4
> +*   nfs/index
> +*   gpio/index
> +*   highuid
> +*   hw_random
> +*   initrd
> +*   iostats
> +*   java
> +*   jfs
> +*   kernel-per-CPU-kthreads
> +*   laptops/index
> +*   lcd-panel-cgram
> +*   ldm
> +*   LSM/index
> +*   md
> +*   media/index
> +*   module-signing
> +*   mono
> +*   namespaces/index
> +*   numastat
> +*   parport
> +*   perf-security
> +*   pm/index
> +*   pnp
> +*   rapidio
> +*   ras
> +*   rtc
> +*   serial-console
> +*   svga
> +*   thunderbolt
> +*   ufs
> +*   vga-softcursor
> +*   video-output
> +*   xfs
>
>  .. only::  subproject and html
>
> --
> 2.27.0
>
