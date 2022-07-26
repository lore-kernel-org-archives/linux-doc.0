Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94545C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jul 2022 05:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbiGZFvm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 01:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiGZFvl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 01:51:41 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35F8275FC
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 22:51:39 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so10186263otr.9
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 22:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iAa+MRJPfZLbs/mdwSesD8sue0AKTHXkzsceUfUGDGk=;
        b=AlJIK8vxj+6RboxRQUdJ6mMvlXvXyvgWbTqsiGSLevGJrjDegtowxCCzyozZ/pT3J1
         maNpCAlL+RIKtI1NGAXp4RpXhh0iorH8FzPrPYh89uhY7TWiKt1rhuhCNKJtiuDYT8u8
         sf+uZj5gJTBFp+ZZ0c2QFhNyYBlDrKovd0LDJUytpt6TQ6QeTOc5F4nMJL1rxDjmmLqm
         qiHesM6N1TjBeMX+aPBFFGcL0HLv5fLkWzGv438RRNQxE+dmoNjQcNq0ottSIpEpFGVy
         kQwGYEz9EuXOssd8oou9u4U32l/jA7AB/2u/W7YQa8BTIIEVdO0uh00qQ1F7caIe0jy4
         hDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iAa+MRJPfZLbs/mdwSesD8sue0AKTHXkzsceUfUGDGk=;
        b=HLT/rBg6Igq6gG/fLr+ckW9Uv8+uRkNN2IWh5lGGSnIL3mS9dr/52ivkOyhBVbGGpo
         2yYYEgDGKz7Bz9BZ3+JmB5beIuwNOOih9zBpxSsrbwRL7THDe9RYdRvB9KTRD51sl+Jv
         rtcPSL3x8VmQIv9GKj3SZDLehGXdWT+CM4XhuX4Z+/mxG+ulQsg8LL6jFkD7Tq0QW7ZD
         7wVw9k6coX6GUg32Yf/CLSv1Zbx+wQGNdsy9nwOzcGtRx+/jwHlScPeyYPO+egNl96LC
         Y8+QBtJZU2+FMPP7ArLyWnFH3i4GaeQq6A4BhO/DyXkIJ066KmatZ5r3Y/1Kvop+y9YI
         cmtg==
X-Gm-Message-State: AJIora+byS38EQt0KRK4utHda4F0kY4gtYRA04NH8Pa0FaIBx7zTXT0J
        MMxcHszjLD3Ee8JJf4wAUwc=
X-Google-Smtp-Source: AGRyM1tM+gDTc9plPRn/RKmhZW0w9XwgAHe3hhPyouIZiU7WY6K5q5r8eG8Gmx67vpzMrZUpgdRyKw==
X-Received: by 2002:a9d:1789:0:b0:61d:403:5aa with SMTP id j9-20020a9d1789000000b0061d040305aamr1911043otj.361.1658814699087;
        Mon, 25 Jul 2022 22:51:39 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id s33-20020a05680820a100b00339bf4473bcsm5626137oiw.56.2022.07.25.22.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 22:51:38 -0700 (PDT)
Message-ID: <cd9a519a-9004-6943-120e-0f5f6e8b4236@gmail.com>
Date:   Tue, 26 Jul 2022 13:51:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/8] Docs/zh_CN: Update the translation of iio_configfs to
 5.19-rc8
Content-Language: en-US
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <0e21e41f54f83c40b96e35d89f47003a2d3a60fc.1658740151.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <0e21e41f54f83c40b96e35d89f47003a2d3a60fc.1658740151.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 7/25/22 17:20, Yanteng Si wrote:
> update to commit dafcf4ed8392 ("iio: hrtimer: Allow
> sub Hz granularity").
> 
> c1d82dbcb0a6 ("docs: iio: fix example formatting").
> 
> Remove some useless spaces.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>  .../translations/zh_CN/iio/iio_configfs.rst          | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/iio/iio_configfs.rst b/Documentation/translations/zh_CN/iio/iio_configfs.rst
> index d5460e951804..eccaf1c644b4 100644
> --- a/Documentation/translations/zh_CN/iio/iio_configfs.rst
> +++ b/Documentation/translations/zh_CN/iio/iio_configfs.rst
> @@ -37,10 +37,10 @@ configfs轻松配置的对象（例如：设备，触发器）。
>  3. 软件触发器
>  =============
>  
> -IIO默认configfs组之一是“触发器”组。 挂载configfs后可以自动访问它，并且可
> +IIO默认configfs组之一是“触发器”组。挂载configfs后可以自动访问它，并且可
>  以在/config/iio/triggers下找到。
>  
> -IIO软件触发器为创建多种触发器类型提供了支持。 通常在include/linux/iio
> +IIO软件触发器为创建多种触发器类型提供了支持。通常在include/linux/iio
>  /sw_trigger.h：中的接口下将新的触发器类型实现为单独的内核模块：
>  ::
>  
> @@ -76,10 +76,10 @@ IIO软件触发器为创建多种触发器类型提供了支持。 通常在incl
>  	.ops = &iio_trig_sample_ops,
>    };
>  
> -module_iio_sw_trigger_driver(iio_trig_sample);
> +  module_iio_sw_trigger_driver(iio_trig_sample);
>  
> -每种触发器类型在/config/iio/triggers下都有其自己的目录。 加载iio-trig-sample
> -模块将创建“ trig-sample”触发器类型目录/config/iio/triggers/trig-sample.
> +每种触发器类型在/config/iio/triggers下都有其自己的目录。加载iio-trig-sample
> +模块将创建“trig-sample”触发器类型目录/config/iio/triggers/trig-sample.
>  
>  我们支持以下中断源（触发器类型）
>  
> @@ -102,3 +102,5 @@ module_iio_sw_trigger_driver(iio_trig_sample);
>  ----------------------------
>  
>  "hrtimer”触发器类型没有来自/config dir的任何可配置属性。
> +它确实引入了触发目录的sampling_frequency属性。
> +该属性以Hz为单位设置轮询频率，精度为mHz。
> \ No newline at end of file
