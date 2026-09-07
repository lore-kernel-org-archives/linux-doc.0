Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272E8374A04
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760172; cv=none; b=CYbiSOrim93SLG3DL/bNJPMnKt+WT3GwSGQx+0HQtOqi78HkMiJcgUdA5opD//RqWfsA3apOc2UC6NIO8F29l470Bwl+7Vlf6MsT7Dl8PQQNhEH0ay2Cojbg2WIt0P6Htlq2wIsYStNdOHqVyii0uTkgzLKU7qLTidE3z5xy8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760172; c=relaxed/simple;
	bh=qkLLrYO1wm0V5K+u4TzItu4MYjDG4vaouixDH+rGCj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJzXHL/jCZTh+aNz0trBrvnxcieQZNeaWObufQ4epjJx9Fjq6nnoHM0xn6MRVviuUeYTXmqOUksfnQT5KDWrgZ0oP9Jq9AQiOeFDzgYPwz1h42yhesHB5MvztB4zLAjtMnXLNgXr2oAJl+16aGyChN1YVzN8rj95djHnN2zWBPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUIazvvx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUIazvvx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso2792877b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 22:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788760170; x=1789364970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7EX7mOM/qiOwQlbURkZ/luFmBbIsDaxMuwCLWOzuHM=;
        b=mUIazvvxTU0+WyKTSxJ/11DP4Fceun/YsoWrbeZL8NKh9VKe2heZfOV4R71tQIlpme
         /+oE1nBBatg71h5L2TyjHdZDgzyxbg5wct5X43FfVBJIJQ7dVFk9L6jqoRLiQwzxLSgP
         7ER3zgalm2Tipo1XqndcdN+sdDW/9em80FJ/V4gq1jOKOI5ujrsmLIo2axFRwgspSdFD
         TtpzwNBUW5biUEH07FgZ9h2R6/rptU46JtRL8XjphXTKBdTn630keu+cO0AwkUV16ug9
         YJGS0nIDEoBxZ34+jU4JfK2eYHJ2urPsf25vxcjAtegtwSmnDJDSzSdER2V0EnbC5qcF
         b74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788760170; x=1789364970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7EX7mOM/qiOwQlbURkZ/luFmBbIsDaxMuwCLWOzuHM=;
        b=gz2elv3sl17+43BAxZbLI0pCx0A3tmTcZMt7MsXqZsIpiJZ07PPFPVavggi+Q09wTI
         B17IfcYpAy/hKWsaTm77lNrDUQ37OJkiVT+KuB93vr/ICiCAqEEFRFm7wy2n+NG6bf13
         lmamV2QsxfEmf18Ix6dOaYKMmeyGa8uLgYtJBLamXS+h6PVjrEA8Voa4fID0CtWx0Dsa
         uQHeOqrqMqFTyMdQWoqmzK2LR6gqcEojDK48Cv1NJQIrlef4r4Gus1hkYn+dSeFBuie3
         lNMEJZwAiSTTG/RpBd6UqSjPaoLK7LYphBuQe0nwZ8FWi1fhXXKYpnGv4nXpgJLvv9U4
         d+2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTLlr4mE1p8w9tdzvSbmOzQoJLhQp1QaDq7gyad6NsNTagkIAFdK6h0COLP+S0Bmza8a2SmNrYdwg=@vger.kernel.org
X-Gm-Message-State: AFuF++kXsOQsoiuUBuCvsOOLh5om9kQBIqGwAX9IJdeA8Q/HQblhceZw
	OwD0WVGtwQytlW/kDRHCOMg8+cGrZqnI63hIYTBQsfiXdY4bacfnmRxc
X-Gm-Gg: AYBFou1D2vcpVV/SkQl40hdXihZyEu05td+Wc1h/GSWIQjty6188PfiogsN4P5IIBxB
	umB5rzpWdcA/ACXmT9YeZObbqh1rb7OZ9ZoTzkQtTpwyAsPeuDc6NPKT7sD5z+BhEWySo0vgWhl
	2ztcZiZLiOaoYWq7QflDB5BZadF0aPAWalA1sKgU+Ce7hryOxAkCuFhLqsrqJhL+U1Q0oyzvSOp
	JqeAXVZcUJ7eV241zHcUUOPgmnHT/HONBV7nMZ8qtNs6KOfsm39gUbbiRrsVlKHAD8RMJpf6pCv
	udKm3uxLyNHD2WVKsH8hacAnm7rt08nWBgoZz7e5s6j7rPSqHSs0kgq/ahaxLzm4ny3GnqHbCeW
	EUElsIFgGdivFEKzbgADFC1yQGF57xfypciJCiX3GG6XulHOPYmlD9nxZZj86lSF3wl3jgUALEX
	RGtElNl4KjnavO4mQrkGNexGROMNA+8XmAVIMPHgZp3y1VN3HmIcOYc91t9HJpwS0b7DkYgq/Wh
	Qw49aUtTc8/wcA=
X-Received: by 2002:a05:6a00:f94:b0:857:72f8:dca6 with SMTP id d2e1a72fcca58-8619c87fcb5mr15788416b3a.12.1788760170262;
        Sun, 06 Sep 2026 22:49:30 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f873cb6sm3783716b3a.1.2026.09.06.22.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:49:28 -0700 (PDT)
Message-ID: <6932a51e-0b88-4db6-8e01-a6472d8e0968@gmail.com>
Date: Mon, 7 Sep 2026 13:49:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/zh_CN: Add configurable error injection
 translation
To: cuishuang <imcusg@gmail.com>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, skhan@linuxfoundation.org,
 wangyuli@aosc.io, kezijie@leap-io-kernel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260722123240.22979-1-imcusg@gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260722123240.22979-1-imcusg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/22 20:32, cuishuang wrote:
> From: Cui Shuang<imcusg@gmail.com>
> 
> Translate Documentation/block/error-injection.rst into Chinese and add
> it to the Chinese block documentation index.
> 
> Update the translation through commit e8dcf2d142bd
> ("block: add configurable error injection").
> 
> Assisted-by: Codex:gpt-5
> Signed-off-by: Cui Shuang<imcusg@gmail.com>
> ---
> v2->v3:
>    - Add the missing Assisted-by trailer to the commit message.
>    - Use "Cui Shuang" consistently as the contributor name.
> 
> v1->v2:
>    - Resend via authenticated SMTP after the original message was only
>      partially delivered and did not reach the linux-doc archive.
> 
>   .../zh_CN/block/error-injection.rst           | 63 +++++++++++++++++++
>   .../translations/zh_CN/block/index.rst        |  1 +
>   2 files changed, 64 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/block/error-injection.rst
> 
> diff --git a/Documentation/translations/zh_CN/block/error-injection.rst b/Documentation/translations/zh_CN/block/error-injection.rst
> new file mode 100644
> index 000000000000..63aac2fb38f8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/block/error-injection.rst
> @@ -0,0 +1,63 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/block/error-injection.rst
> +
> +:翻译:
> +
> + Cui Shuang<imcusg@gmail.com>
> +
> +==============
> +可配置错误注入
> +==============
> +
> +概述
> +----
> +
> +可配置错误注入允许针对块设备的扇区范围注入特定的块层状态码。错误可以无条件
> +注入，也可以按给定概率注入。
> +
> +要使用可配置错误注入，必须启用 ``CONFIG_BLK_ERROR_INJECTION``。
> +
> +唯一的接口是 ``error_injection`` debugfs 文件，每个已注册的 gendisk 都会
> +创建该文件。写入此文件用于创建或删除规则，读取则返回当前错误注入点的列表。

"读取则返回当前错误注入点的列表", could you polish this word? make it more nature 
in Chinese.> +
> +选项
> +----
> +
> +以下选项指定操作：
> +
> +===================	=======================================================
> +add			添加一条新规则
> +removeall		删除所有现有规则
> +===================	=======================================================
> +
> +以下选项指定 ``add`` 操作的规则详情：
> +
> +===================	=======================================================
> +op=<string>		此规则适用的块层操作。它使用每个 ``REQ_OP_XYZ``
> +			操作中的 ``XYZ``，例如 ``READ``、``WRITE`` 或
> +			``DISCARD``。必填。
> +status=<string>		要返回的状态。它使用每个 ``BLK_STS_XYZ`` 状态码

Incorrect indent. take care the alignment.

Thanks
Alex

> +			中的 ``XYZ``，例如 ``IOERR`` 或 ``MEDIUM``。必填。
> +start=<number>		此规则适用的第一个块层扇区。可选，默认为 0。
> +nr_sectors=<number>	此规则适用的扇区数。可选，默认覆盖设备的剩余部分。
> +chance=<number>		仅以 ``1/chance`` 的概率返回失败。可选，默认为 1
> +			（总是失败）。
> +===================	=======================================================
> +
> +示例
> +----
> +
> +对 ``/dev/nvme0n1`` 扇区 0 的读取，每 10 次中有一次返回
> +``BLK_STS_IOERR``：
> +
> +	$ echo 'add,op=READ,start=0,status=IOERR,chance=10' > /sys/kernel/debug/block/nvme0n1/error_injection
> +
> +对 ``/dev/nvme0n1`` 的每次写入都返回 ``BLK_STS_MEDIUM``：
> +
> +	$ echo 'add,op=WRITE,start=0,status=MEDIUM' > /sys/kernel/debug/block/nvme0n1/error_injection
> +
> +删除 ``/dev/nvme0n1`` 的所有规则：
> +
> +	$ echo 'removeall' > /sys/kernel/debug/block/nvme0n1/error_injection
> diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
> index f2ae5096ed68..4877432cc4ff 100644
> --- a/Documentation/translations/zh_CN/block/index.rst
> +++ b/Documentation/translations/zh_CN/block/index.rst
> @@ -18,6 +18,7 @@ Block
>   
>      blk-mq
>      data-integrity
> +   error-injection
>   
>   TODOList:
>   * bfq-iosched
> -- 2.50.1 (Apple Git-155)
> 

