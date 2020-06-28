Return-Path: <SRS0=Bi2S=AJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB15DC433DF
	for <linux-doc@archiver.kernel.org>; Sun, 28 Jun 2020 02:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B736C2080C
	for <linux-doc@archiver.kernel.org>; Sun, 28 Jun 2020 02:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593310644;
	bh=s+j0DpSpf+pJTifM2ueSwyP8+cQOQaaE3UKI6KE+sm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=T8g7ViJKLpyeMqb4lvAitT0obxfxf2F+S3aV1CwIR/62gWqx9WIQLL36yl/H2PwkG
	 dj2MqhH9knUIPONC4Pb8NnZLEWwRwFXcu8QZQuaHeDCVf5+SYHC+LfXyV2AJxG0Hcj
	 1jE/ZqUrf5boZosACn8fDccVgmz7ODFU/k4C96ww=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgF1CRY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Jun 2020 22:17:24 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45700 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgF1CRW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Jun 2020 22:17:22 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 05S2GpKY019135;
        Sun, 28 Jun 2020 11:16:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 05S2GpKY019135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593310612;
        bh=rY/0X8wDdH/OppPIbg3bn9miQy2NtSJWkHyvn81VgTQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zWk6Ubxh7EeIJwHsGsYANQrAwipL/H+0loj7+02Lb+6oq+tVMdMsffEQmfZVb4Uf3
         A8Q7xE5hapq8Vp3Lj4jmjAW9Z4aLxNbnuMocpoLWmXEqlxpRehycBpgkhc0oDpZgjH
         /GAL1D55zpCNDy7cM5R6auuyNyAoqscUMb8ogS80iKCFbXV53vDvI52QglzjG6A2Sl
         WWtWxalQ0rvWqrv/LHshcVRt2qp3q5liBDWQC4rYHjW6sKR4yXptydGtpjVe68+OMc
         YULkKW63xIDWvLkkXYOP1fNaQxigfUCmtlc8dqGqdTJTjeD7URptODYeFWN1ZGLxJ5
         AdBCoMPrqrjJg==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id s18so7480616vsi.6;
        Sat, 27 Jun 2020 19:16:51 -0700 (PDT)
X-Gm-Message-State: AOAM5319Esou97ZJm5yTE2JyTRsTPAcNSi9hV8tj30t1TG0mnc5nBA6r
        r7QcGCh6dqVOY1sG6ruzYmVsPddZ8T9Cj/O+fbg=
X-Google-Smtp-Source: ABdhPJyV0+QzYH9ugRIW/wmYF8Yh1BKt0nhPYLIEFJRYPjbO8Dv67C5Xl+tH/RG9xCvtlJzTVvZ/lZKUXU2YVgn3Shg=
X-Received: by 2002:a67:6c84:: with SMTP id h126mr5653011vsc.181.1593310610605;
 Sat, 27 Jun 2020 19:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
In-Reply-To: <20200622124343.121043-1-dovmurik@linux.vnet.ibm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 11:16:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASD4ha4AGSPY4=mALo4JY0WfSLTrmJBUPeiH8yWjSsO=Q@mail.gmail.com>
Message-ID: <CAK7LNASD4ha4AGSPY4=mALo4JY0WfSLTrmJBUPeiH8yWjSsO=Q@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: fix ReST formatting
To:     Dov Murik <dovmurik@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 22, 2020 at 9:44 PM Dov Murik <dovmurik@linux.vnet.ibm.com> wrote:
>
> Commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename to
> *.rst") missed a ReST header and a verbatim file content area.
>
> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> ---

Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/modules.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index a45cccff467d..85ccc878895e 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -182,7 +182,8 @@ module 8123.ko, which is built from the following files::
>         8123_pci.c
>         8123_bin.o_shipped      <= Binary blob
>
> ---- 3.1 Shared Makefile
> +3.1 Shared Makefile
> +-------------------
>
>         An external module always includes a wrapper makefile that
>         supports building the module using "make" with no arguments.
> @@ -470,9 +471,9 @@ build.
>
>         The syntax of the Module.symvers file is::
>
> -       <CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
> +               <CRC>       <Symbol>         <Module>                         <Export Type>     <Namespace>
>
> -       0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
> +               0xe1cc2a05  usb_stor_suspend drivers/usb/storage/usb-storage  EXPORT_SYMBOL_GPL USB_STORAGE
>
>         The fields are separated by tabs and values may be empty (e.g.
>         if no namespace is defined for an exported symbol).
>
> base-commit: b103c607654e55dcb1da40557628a2044b72c936
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
