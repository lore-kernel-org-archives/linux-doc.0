Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D9AC00144
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 02:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240064AbiG0CTP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiG0CTO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 22:19:14 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA7E3C17E
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:19:14 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id w7so14929781ply.12
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XdtxV5PUc8mqpRLGH6OcFCqXOP3hCqc1bBEBO57LxXg=;
        b=E1L32aZuBzUgZVTRhRREzRz51hkeKXGJU4xy9XKdli52YgdkcRhPZ25OAqqpYwfW4q
         GfstfZ90mxzIC1R2BRcd57ZBDpeJ6XSz+VHtqMVNi3+LWbCCNAmRECwF597ru5lIjhUK
         Cf5N2TwLLFOtLYXGAAApYAY3teL+1xfSGVWvDXLihCJfpLNNYp90+2hG2NwHxe/HN+Dc
         Z6aF7mRUuDO+9sKfeW9NlC6ZUi5d8dUaEb4EQLmzsuUXDoE9qFfdXDJIUFVXyjvh+3Vy
         qHIdcA1qUbduxuIgtdCjhbyCFnXbJp4JdS9WmXMmjCK2ktgVRIrvxi8KMUtraN8KZ2Ub
         5Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XdtxV5PUc8mqpRLGH6OcFCqXOP3hCqc1bBEBO57LxXg=;
        b=DdSVe4grBEWv+JZMQ+X6KkVLNiHH3EGWTEfyWfhpc702wNu6k7VCwDwzD99Gj7WP4I
         VzQJFt6J/976C5HEEXnP/3rAY2h91Wm7+ryU8RSs4q3Zc8vWMnVK2GbCfgHOetjdy/UN
         7WW4unXZBBReyTOtSfIokktu0sv9bKqqoZe6+sEBvXYvzYSGFyyTZnhAhnazzxKv93oq
         9UHGAzflrkCu9sjYgwcfXP0mC3pD0vNf53d/oBli4gsqjdMltDHedWUD9xLmsAvN4sz2
         udZiana01DnVbG6LbWVvQG5a0FwPuinG9hBxb6iywLtFCcQCyb7wGWIJS3bqN1COjoKd
         qOTQ==
X-Gm-Message-State: AJIora9MBzebcAnQMPCelUxtosNdVoDhFK4IbPIRAs6G5A3NP2+AwSln
        59JMOowknNP7ZEeBHkimux4=
X-Google-Smtp-Source: AGRyM1tj85CmQyN8IjuNGedjgn1DA3Jwd5PvY6f7RMUaDgw3AcVWSqNhXdHSKtyPGKpNgO46jngVXQ==
X-Received: by 2002:a17:90a:1c01:b0:1f1:bf54:67ff with SMTP id s1-20020a17090a1c0100b001f1bf5467ffmr1982919pjs.172.1658888353756;
        Tue, 26 Jul 2022 19:19:13 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id i67-20020a62c146000000b005289fbef7c4sm12638512pfg.140.2022.07.26.19.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 19:19:12 -0700 (PDT)
Message-ID: <dc6719f9-e41b-8a4e-7cfa-fe9c6f53537b@gmail.com>
Date:   Wed, 27 Jul 2022 10:19:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/8] Docs/zh_CN: Update the translation of pci-iov-howto
 to 5.19-rc8
Content-Language: en-US
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <e235ea1d60809647971b5d3e89aa44e30d212336.1658740151.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <e235ea1d60809647971b5d3e89aa44e30d212336.1658740151.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 7/25/22 17:24, Yanteng Si wrote:
> Update to commit 4f23bd5d09af ("PCI/doc: Convert
> examples to generic power management")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/PCI/pci-iov-howto.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
> index fbc83dfdcead..fb023ea1374d 100644
> --- a/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
> +++ b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
> @@ -123,14 +123,14 @@ nr_virtfn'是要启用的VF的编号。
>  		...
>  	}
>  
> -	static int dev_suspend(struct pci_dev *dev, pm_message_t state)
> +	static int dev_suspend(struct device *dev)
>  	{
>  		...
>  
>  		return 0;
>  	}
>  
> -	static int dev_resume(struct pci_dev *dev)
> +	static int dev_resume(struct device *dev)
>  	{
>  		...
>  
> @@ -163,8 +163,7 @@ nr_virtfn'是要启用的VF的编号。
>  		.id_table =	dev_id_table,
>  		.probe =	dev_probe,
>  		.remove =	dev_remove,
> -		.suspend =	dev_suspend,
> -		.resume =	dev_resume,
> +		.driver.pm =    &dev_pm_ops
>  		.shutdown =	dev_shutdown,
>  		.sriov_configure = dev_sriov_configure,
>  	};
