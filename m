Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982E3C00144
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 02:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240072AbiG0CUj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiG0CUj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 22:20:39 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8779463E4
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:20:38 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id l9-20020a056830268900b006054381dd35so12083936otu.4
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=saKN+GmSH8P4jFeHGCwsX1I7N+IGrsdOgET4K/bAJwk=;
        b=Uelyt5ESJ5DqrdtD4sIJbYnlACxshpSzFC9EtmS/BdH/tO5RfHPGT5HCrSe1pbG01s
         K1xpMT/ePu9DAi2cE+2somFHxIE+gS+CP5k2mTzHMOkXOh3v28aafDZ40lQE8p/tkD9H
         KjdvjPE3ZCz2eQjxFTd3/lvSHWWmgVosElyIX8JNJUi9hiQrXcrKeRznjZPpbOCs+Q2f
         aRVEuv+TCwDMDbc9nf26TOjZJ+49tP+TE2Rs11ciJv/zK8nDSk+qpRrzkX451okEsHyL
         D8QzIDoCi9Ph7pC0da6NHDsEZdeOR7ZkPPZUT1Tyh7YcLWYHCbhV663atymAmXhBbMtM
         T6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=saKN+GmSH8P4jFeHGCwsX1I7N+IGrsdOgET4K/bAJwk=;
        b=qRIBTcFWvJ6ik+noBTfH31+xsvvvbAT7zHu5HcwDQ3WuTZj1wsTNZpEV4zaQY2zULI
         smSh4ZB97zjBXYCkYE+JkoB5BDukin3fQYqYGAVZqkW7nxQk3+OeL9QSy61IjgmUky0C
         9M5jJHAJN6Q0st6bfR8jhjTMboesrfMexncX8W/7nwG8/ZM0754FeLDMmBurgy1NxJpd
         kDjTxXj0QaTlrApApp06kkPLGV5DOrfWubSm/wNBIndEJA1m1CAzVMd6eOZ5PgFzpvzY
         DQc2xUUyx+U/626F2NxAiuV1ZkMJRXDjoiL2/BizjpiQDqkln0Ea5oCwiDIIGtHqcSrb
         8UPQ==
X-Gm-Message-State: AJIora/J64sG62IR+I55hm6Zn+JX9oUg7vkeJNxQ54nZ76MsrN6yJtgS
        WCa1ebaGdLNpXzufMQxG9lE=
X-Google-Smtp-Source: AGRyM1snYiA60E7PA3X5sboWAQcdEPJC9C+kSkDmQJU8rrOAMMQNcPrOKdgHUxsNNJsPIQ7f6RWt0Q==
X-Received: by 2002:a9d:2602:0:b0:61c:30c1:fa03 with SMTP id a2-20020a9d2602000000b0061c30c1fa03mr8030952otb.86.1658888437892;
        Tue, 26 Jul 2022 19:20:37 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id k11-20020a9d4b8b000000b0061cac699458sm6928301otf.38.2022.07.26.19.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 19:20:37 -0700 (PDT)
Message-ID: <b670b01c-4507-db90-55db-1fff6bcbbeb7@gmail.com>
Date:   Wed, 27 Jul 2022 10:20:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 7/8] Docs/zh_CN: Update the translation of pci to 5.19-rc8
Content-Language: en-US
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <d6b56714f443f13fed9ed6618fb0788fe7d3caaa.1658740151.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <d6b56714f443f13fed9ed6618fb0788fe7d3caaa.1658740151.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 7/25/22 17:24, Yanteng Si wrote:
> Update to commit f21949c14968 ("PCI/doc:Update
> obsolete pci_set_dma_mask() references")
> 
> 05b0ebd06ae6 ("PCI/doc: cleanup references to
> the legacy PCI DMA API")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/PCI/pci.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
> index 520707787256..83c2a41d38d3 100644
> --- a/Documentation/translations/zh_CN/PCI/pci.rst
> +++ b/Documentation/translations/zh_CN/PCI/pci.rst
> @@ -255,13 +255,13 @@ pci_set_master()将通过设置PCI_COMMAND寄存器中的总线主控位来启
>  
>  虽然所有的驱动程序都应该明确指出PCI总线主控的DMA功能（如32位或64位），但对于流式
>  数据来说，具有超过32位总线主站功能的设备需要驱动程序通过调用带有适当参数的
> -``pci_set_dma_mask()`` 来“注册”这种功能。一般来说，在系统RAM高于4G物理地址的情
> +``dma_set_mask()`` 来“注册”这种功能。一般来说，在系统RAM高于4G物理地址的情
>  况下，这允许更有效的DMA。
>  
> -所有PCI-X和PCIe兼容设备的驱动程序必须调用 ``pci_set_dma_mask()`` ，因为它们
> +所有PCI-X和PCIe兼容设备的驱动程序必须调用 ``dma_set_mask()`` ，因为它们
>  是64位DMA设备。
>  
> -同样，如果设备可以通过调用 ``pci_set_consistent_dma_mask()`` 直接寻址到
> +同样，如果设备可以通过调用 ``dma_set_coherent_mask()`` 直接寻址到
>  4G物理地址以上的系统RAM中的“一致性内存”，那么驱动程序也必须“注册”这种功能。同
>  样，这包括所有PCI-X和PCIe兼容设备的驱动程序。许多64位“PCI”设备（在PCI-X之前）
>  和一些PCI-X设备对有效载荷（“流式”）数据具有64位DMA功能，但对控制（“一致性”）数
