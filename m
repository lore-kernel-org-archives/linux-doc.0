Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38E9C49361
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 09:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EB4861059
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 09:12:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhFUJOs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 05:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhFUJOs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 05:14:48 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98A8C061574
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 02:12:32 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q192so6583118pfc.7
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tfHDUb8Hbrvlf5meVWSoIeXR4dRw11NHy3A4/sx75Tk=;
        b=P+DqXJGZw9EzN1sSn84Qc4UL4VlXQ8K+c1mKPGLq3K28QBLfxH+CUSJcSjJtfoFnIu
         LMX8p33pVrxvVSOzvbnIBKTs8JQ5fgXfturp4iZHaEOFXLO1pdUd+8Dg97jagmiJ8X0V
         Y7SxWZbT31MvqeBeaFHMo9ubpued95bIiDbZdQpjTtvNrBEoGuGhwrItMIyS9C2pNB/e
         WCxQ6FzmmaHKzvdyGqoH0NIiVJabahS5s4qdG/mSfYfCYgpXkiTan+i6fW+y9I0DueTA
         RC89clSCkdhA/cjM3bS2OIwHnf9If0JaAJAeEg62apM7Z3SOvCK8OJrPbdljWglAI9sQ
         i/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tfHDUb8Hbrvlf5meVWSoIeXR4dRw11NHy3A4/sx75Tk=;
        b=YrmjERLthQ+5MRFyEZVh0k5TxD5kR15oYrWEUfLECR8M7odYFm2/bAcA4VKcggT8xY
         Ul7UcZFM/deChCSemlmGUn0emw63UG4kf1vgMf8ZZKg3775v8k9JvGZPhSMvSlJlCjnE
         +z8mlH6VRuLAKkmH9ia1Li3Y5RwoLDN1VJQ95WZnhh5ziu6+lQLqy/l5E8oYO2GdAru/
         0bx9bHV+ghfeYSd7R5rCfA8OY12gAaZN9ndplZzCQiayUvOj87Bko5yV09NsI0bUhu7w
         BGEHawwfZlT+W+5WFxZo9ORZtqI1TVNGnzi8Pjylrqg1rqfsglpFrdaACAn2w/Ab61Oc
         zk1w==
X-Gm-Message-State: AOAM533M4GxmRBMvWzCg4Bg/55wxlwKQMsQhRvawww2+AbRXqFirUEoW
        R0ND3Sb0icHYqLnxrIwRCW8=
X-Google-Smtp-Source: ABdhPJyIFzTJgTgyFm00k24FqyQwapAF/vVlc78bk9QQa+rR1oZrO53wEI1FcI1QrOEsjw90mbnYCg==
X-Received: by 2002:a62:bd1a:0:b029:2fe:eaf8:8012 with SMTP id a26-20020a62bd1a0000b02902feeaf88012mr18121864pff.45.1624266752221;
        Mon, 21 Jun 2021 02:12:32 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id t8sm5449507pjs.12.2021.06.21.02.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 02:12:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] docs/zh_CN: Add translation
 zh_CN/admin-guide/efi-stub.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
References: <cover.1624169811.git.bobwxc@email.cn>
 <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <e7972da7-d17a-e48a-368e-b5f313625e3d@gmail.com>
Date:   Mon, 21 Jun 2021 17:12:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/20/21 6:40 PM, Wu XiangCheng wrote:
> Add a new translation
>   Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> and link it to zh_CN/admin-guide/index.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../zh_CN/admin-guide/efi-stub.rst            | 86 +++++++++++++++++++
>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>  2 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/efi-stub.rst b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> new file mode 100644
> index 000000000000..b6a4cedec8eb
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> @@ -0,0 +1,86 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/admin-guide/efi-stub.rst
> +
> +:译者:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +=========
> +EFI引导桩
> +=========
> +
> +在x86和ARM平台上，内核zImage/bzImage可以伪装成PE/COFF映像，从而使EFI固件加载
> +程序加载其作为EFI可执行文件。修改bzImage头以及固件加载程序跳转特定入口点的
> +代码被统称为“EFI引导桩（EFI Boot Stub）”，分布在arch/x86/boot/header.S和
> +arch/x86/boot/compressed/eboot.c中。对于ARM，EFI桩在arch/arm/boot/compressed/efi-header.S
> +和arch/arm/boot/compressed/efi-stub.c中实现。体系结构之间共享的EFI桩代码
> +位于drivers/firmware/efi/libstub中。
> +
> +而arm64没有压缩内核支持，因此映像本身伪装成PE/COFF映像，EFI桩链接到内核。

arm64不支持压缩内核？ 

Thanks
Alex
> +arm64 EFI桩位于arch/arm64/kernel/EFI entry.S和drivers/firmware/efi/libstub/arm64-stub.c
> +中。
> +
> +通过使用EFI引导桩，可以在不使用传统EFI引导加载程序的情况下引导Linux内核，
> +如grub或elilo。由于EFI引导桩执行了引导加载程序的工作，因此某种意义上来说
> +它 *就是* 引导加载程序。
> +
> +EFI引导桩通过CONFIG_EFI_STUB内核选项启用。
> +
> +
> +如何安装bzImage.efi
> +-------------------
> +
> +位于arch/x86/boot/bzImage中的bzImage必须复制到EFI系统分区（ESP）并修改扩展名
> +为“.efi”。没有扩展名的话EFI固件加载程序将拒绝执行它。尚无法从普通的Linux文件
> +系统中执行bzImage.efi，因为EFI固件不支持这些文件系统。ARM平台需要将arch/arm/boot/zImage
> +复制到系统分区，并可能无需重命名；arm64也类似，需要复制arch/arm64/boot/Image，
> +但不一定要重命名。
> +
> +
> +从EFI shell传递内核参数
> +-----------------------
> +
> +内核参数可于bzImage.efi之后传递，例如::
> +
> +	fs0:> bzImage.efi console=ttyS0 root=/dev/sda4
> +
> +
> +“initrd=”选项
> +-------------
> +
> +与大多数引导加载程序一样，EFI桩允许用户使用“initrd=”选项指定多个initrd文件。
> +这是唯一的EFI桩特殊特命令行参数，其他所有内容都在将内核启动时传递给内核。
> +
> +initrd文件的路径必须为从ESP开始的绝对路径，相对路径无法使用。同时此路径为EFI
> +风格，目录元素必须用反斜杠（\）分隔。例如给定以下目录布局::
> +
> +  fs0:>
> +	Kernels\
> +			bzImage.efi
> +			initrd-large.img
> +
> +	Ramdisks\
> +			initrd-small.img
> +			initrd-medium.img
> +
> +现工作目录为fs0:\Kernels，要使用initrd-large.img文件引导，则须使用以下命令::
> +
> +	fs0:\Kernels> bzImage.efi initrd=\Kernels\initrd-large.img
> +
> +请注意bzImage.efi是怎样可用相对路径指定的。那是因为我们执行的映像是由EFI shell
> +解释的，它可解析相对路径，而命令行的其余部分则传递给bzImage.efi。
> +
> +
> +“dtb=”选项
> +----------
> +
> +对于ARM和arm64体系结构，必须为内核提供一个设备树。通常固件应通过EFI CONFIGURATION
> +TABLE（EFI配置表）来支持设备树。但是“dtb=”命令行选项可以用于覆盖固件提供的设备
> +树，或在固件无法提供时来提供一个设备树。
> +
> +请注意：固件将在启动内核之前将运行时配置信息添加到设备树。如果 ``dtb=`` 被用来
> +覆盖设备树，则固件提供的任何运行时数据都将丢失。 ``dtb=`` 选项应只用作调试工具，
> +或者在EFI CONFIGURATION TABLE中未提供设备树时作为最后的手段。
> +
> +“dtb=”的处理方式与上述“initrd=”选项相同。
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index 460034cbc2ab..d74f5e864898 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -65,6 +65,7 @@ Todolist:
>  
>     clearing-warn-once
>     cpu-load
> +   efi-stub
>     lockup-watchdogs
>     unicode
>  
> @@ -87,7 +88,6 @@ Todolist:
>     dell_rbu
>     device-mapper/index
>     edid
> -   efi-stub
>     ext4
>     nfs/index
>     gpio/index
> 
