Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F181DB551
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 02:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779674731; cv=none; b=QH6JSheJQ8VzIKeqRmzIFKbDNwnUsp2e7RGNAmmX8RUQHPIPncmrYdD1PULKtijRjcOFdL79hexN4G3MhSVZrsCkd5dzz0xwJQ1Nbr+btDHxUjt8YRZkHkn8Jt0apRAuOH/StAXYM4WLfCPV48kYjUY7sycwb43mfAcnCUOFy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779674731; c=relaxed/simple;
	bh=60uL1EAd77dkMqJ+ReLfFWYgWr/SH/+UsONUBuWU3vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5RHdqfiNHgaW5mEMxTgO76XLjLPaqBpIgAnXhla+QXkOcOFggySznI+z8i38HeINDoURCnx+N8YrHXc5jVieBTP5/ZFeaDVe9Y/phSJJKzH8QlM9Lxz4m5+YnIOyGg6Wteo4GAL5vqj2SasnwwvTWcM50TUJIh/gWJ67W9gvDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdp4sgY5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdp4sgY5"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-83945063f70so4671748b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779674729; x=1780279529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7jUX/Rr8JLpxFAZIW/CZdht7Ee+xnPqCKmwzhxjfF8=;
        b=Zdp4sgY5TB8EnYbheelm+2L7Bz4yP/aRy043ReRdmNxS3lbQPC2QrETJgLQbw4ZKi7
         AaU+4o5dlEbpne9uwyHVg875QdoxoDHUgSJzBKZldufa4DfQVPh/48EWxTTE78pV4W9w
         Zih/dw7az5ixkQwuxPIORfelRPEnxkuycB8rsVJ2jmW8vhbu8Xi3Y1OBV2mFIrhZibud
         J/SmUCKWRENu7KuLncB1YkXrpbceljAu1wvEbYDgG2MocTsWCxNgPXqKNPWTTUf3Sfmv
         9TbA44GqCq4FnnIEOmkNGFvWDZ2TveUi775Jl4KpUKN68a1S9ix5CurRS9FjasXRsQB0
         e2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779674729; x=1780279529;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7jUX/Rr8JLpxFAZIW/CZdht7Ee+xnPqCKmwzhxjfF8=;
        b=FRMl+b61ipqN2+GdL7X4A7GHt4w32nfL2+KZoZSukWZzzoosrHM7+ULFy3El4PZMuA
         q8QW0Zhv2ENm2SmdjmHZ1hoPfC6va4nj2dHtoTAq1dLHGPWF5ZUATKAHkxmV01KSVACc
         VUW/JDRGihCBOy7QxbsM739/+oXkGVLIAfM7pWdE4VD1xBYT9GFnC6xNGkOT1o23Bjdo
         q2Aw2lmjLhGZkgDd8wsTFOEQLV3oxvG5v2qZ38hgUKgSiHXxY8agcTMNtxKfNOTZujPa
         GMCOHO6AOo34VFYZU+sHgf0eSlMeTjOpHSb6nl3XWSI7/u/YL783pOC3ttuVHoNqTXw+
         YQ+g==
X-Forwarded-Encrypted: i=1; AFNElJ8h7TNtQoo4Tu713xaFKlfTVAb44a6eLdZCxO/y7y7FK3fQiOk+99Q9Zq0EYoCs+OGrpkc6m3ZITcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB2+v5jTC53soEthzOZkr8Q07aS0w7jm8eDVInGqvMJEpzlUAs
	0Xa17Ej8rgRORGp1TrHiX3MqTmHc8KD8sjIBW9bu5VN+WpAKNJkM+qik
X-Gm-Gg: Acq92OGfPGlL+Kwt3VQidCqT8udFdb0OYu/jtvP7F6IrMWQ63w+iTOKriglGXuMfri4
	2doQ0lA719EK8AqQogc8pwsnJEW4hiYHuhsDvBjXHAsagu5r/trhBmkA6fdSgPOah0lbOMky4PP
	Lu/42jJ/tX0rRmTzLylBi18ud3nLnwAM/Rwy7dS95zXxJ0Jom0nBcKRKbWe2VEp9Rxc8DTXQjM0
	hVNUak1tGY5yMS5NyRG34SECQ36dy7kqeQ/fimhggpgfsosgHLXuYcgHv0Mv8rdtWLtrNyKYiHA
	J31MFjaXrARTmVbrj0+qTtx8x/3+w2sZDxn5lRgqS0Ewfe208Zd4TjaAyKE4jQlr7ZUw9XuuCBD
	gaYOSJAtkOsbF7IRURConSnptdAZwb86NwBgjyKZ1OgGYOkNo07yIxpvLm8iidSWWIynNyFQL28
	x1u+3dnEQxFbMZG8z5O43Axu4V2699xXLGdIoM3IeDJnEXXezkCViuBCi5oy3TwV3R4uRoxd8iO
	Xs=
X-Received: by 2002:a05:6a20:a10c:b0:3a1:785:a567 with SMTP id adf61e73a8af0-3b3297d027amr10105654637.26.1779674728937;
        Sun, 24 May 2026 19:05:28 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:2f00:658e:df8e:c08a:e98c? ([240e:38b:e68:2f00:658e:df8e:c08a:e98c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a337fsm6471118a12.8.2026.05.24.19.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 19:05:28 -0700 (PDT)
Message-ID: <a6752fa9-b15b-4b50-baef-53c36460311e@gmail.com>
Date: Mon, 25 May 2026 10:05:23 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] docs/zh_CN: Add acm.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, linux-usb@vger.kernel.org,
 si.yanteng@linux.dev
Cc: gregkh@linuxfoundation.org, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1779355170.git.baikefan@leap-io-kernel.com>
 <9f865599e837c90d3048b9a8004efd65b2e3f9d3.1779355170.git.baikefan@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <9f865599e837c90d3048b9a8004efd65b2e3f9d3.1779355170.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/5/21 17:55, Kefan Bai wrote:
> Translate .../usb/acm.rst into Chinese
> 
> Update the translation through commit ecefae6db042
> ("docs: usb: rename files to .rst and add them to drivers-api")
> 
> Reviewed-by: Yanteng Si<siyanteng@cqsoftware.com.cn>
> Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> ---
>   Documentation/translations/zh_CN/usb/acm.rst  | 147 ++++++++++++++++++
>   .../translations/zh_CN/usb/index.rst          |   2 +-
>   2 files changed, 148 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
> 
> diff --git a/Documentation/translations/zh_CN/usb/acm.rst b/Documentation/translations/zh_CN/usb/acm.rst
> new file mode 100644
> index 000000000000..51d6eb8f5660
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/acm.rst
> @@ -0,0 +1,147 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/usb/acm.rst
> +
> +:翻译:
> +
> + 白钶凡 Kefan Bai<baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +====================
> +Linux ACM 驱动 v0.16
> +====================
> +
> +版权所有 (c) 1999 Vojtech Pavlik<vojtech@suse.cz>
> +
> +由 SuSE 赞助
> +
> +0. 免责声明
> +~~~~~~~~~~~
> +本程序是自由软件；你可以在自由软件基金会发布的
> +GNU 通用公共许可证第 2 版，或者（按你的选择）
> +任何后续版本的条款下重新发布和/或修改它。
> +
> +发布本程序是希望它能发挥作用，但它不附带任何担保；
> +甚至不包括对适销性或特定用途适用性的默示担保。
> +详情见 GNU 通用公共许可证。

Hi Kefan,

The alignment means we will try use the width for each of lines, not 
just stop for each of punctuation. Please fix all patches alignment, try 
to expand the whole width for lines unless it's broken a word or unreadable.

Thanks
> +
> +你应该已经随本程序收到了 GNU 通用公共许可证的副本；
> +如果没有，请致信：Free Software Foundation, Inc., 59
> +Temple Place, Suite 330, Boston, MA 02111-1307 USA。
> +
> +如需联系作者，可发送电子邮件至vojtech@suse.cz，
> +或邮寄至：
> +Vojtech Pavlik, Ucitelska 1576, Prague 8,
> +182 00, Czech Republic。
> +
> +为方便起见，软件包中已附带 GNU 通用公共许可证
> +第 2 版：见 COPYING 文件。
> +
> +1. 使用方法
> +~~~~~~~~~~~
> +``drivers/usb/class/cdc-acm.c`` 驱动可用于符合 USB
> +通信设备类抽象控制模型（USB CDC ACM）规范的
> +USB 调制解调器和 USB ISDN 终端适配器。
> +
> +许多调制解调器支持此驱动，以下是我所知道的一些型号：
> +
> +	- 3Com OfficeConnect 56k
> +	- 3Com Voice FaxModem Pro
> +	- 3Com Sportster
> +	- MultiTech MultiModem 56k
> +	- Zoom 2986L FaxModem
> +	- Compaq 56k FaxModem
> +	- ELSA Microlink 56k
> +
> +我知道有一款 ISDN 终端适配器可以与 ACM 驱动一起使用：
> +
> +	- 3Com USR ISDN Pro TA
> +
> +一些手机也可以通过 USB 连接。
> +我知道以下机型可以正常工作：
> +
> +	- SonyEricsson K800i
> +
> +遗憾的是，许多调制解调器和大多数 ISDN TA
> +都使用专有接口，因此无法与此驱动配合工作。
> +购买前请先确认设备是否符合 ACM 规范。
> +
> +要使用这些调制解调器，需要加载以下模块::
> +
> +	usbcore.ko
> +	uhci-hcd.ko ohci-hcd.ko or ehci-hcd.ko
> +	cdc-acm.ko
> +
> +之后就应该可以访问这些调制解调器了。
> +应当可以使用 ``minicom``、``ppp`` 和 ``mgetty``
> +与它们通信。
> +
> +2. 验证驱动是否正常工作
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +第一步是检查 ``/sys/kernel/debug/usb/devices``，
> +其内容应该类似如下::
> +
> +  T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 2
> +  B:  Alloc=  0/900 us ( 0%), #Int=  0, #Iso=  0
> +  D:  Ver= 1.00 Cls=09(hub  ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
> +  P:  Vendor=0000 ProdID=0000 Rev= 0.00
> +  S:  Product=USB UHCI Root Hub
> +  S:  SerialNumber=6800
> +C:* #Ifs= 1 Cfg#= 1 Atr=40 MxPwr=  0mA
> +  I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> +  E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=255ms
> +  T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=12  MxCh= 0
> +  D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
> +  P:  Vendor=04c1 ProdID=008f Rev= 2.07
> +  S:  Manufacturer=3Com Inc.
> +  S:  Product=3Com U.S. Robotics Pro ISDN TA
> +  S:  SerialNumber=UFT53A49BVT7
> +  C:  #Ifs= 1 Cfg#= 1 Atr=60 MxPwr=  0mA
> +  I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=acm
> +  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
> +C:* #Ifs= 2 Cfg#= 2 Atr=60 MxPwr=  0mA
> +  I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
> +  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
> +  I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
> +  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +
> +这三行的存在很关键（以及 ``Cls=`` 字段里出现的
> +``comm`` 和 ``data`` 类）；它说明这是一个 ACM
> +设备。``Driver=acm`` 表示该设备正在使用 acm 驱动。
> +如果只看到 ``Cls=ff(vend.)``，那就无能为力了：
> +这说明你手上的设备使用的是厂商专有接口::
> +
> +    D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
> +    I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
> +    I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
> +
> +在系统日志中应该可以看到::
> +
> +  usb.c: USB new device connect, assigned device number 2
> +  usb.c: kmalloc IF c7691fa0, numif 1
> +  usb.c: kmalloc IF c7b5f3e0, numif 2
> +  usb.c: skipped 4 class/vendor specific interface descriptors
> +  usb.c: new device strings: Mfr=1, Product=2, SerialNumber=3
> +  usb.c: USB device number 2 default language ID 0x409
> +  Manufacturer: 3Com Inc.
> +  Product: 3Com U.S. Robotics Pro ISDN TA
> +  SerialNumber: UFT53A49BVT7
> +  acm.c: probing config 1
> +  acm.c: probing config 2
> +  ttyACM0: USB ACM device
> +  acm.c: acm_control_msg: rq: 0x22 val: 0x0 len: 0x0 result: 0
> +  acm.c: acm_control_msg: rq: 0x20 val: 0x0 len: 0x7 result: 7
> +  usb.c: acm driver claimed interface c7b5f3e0
> +  usb.c: acm driver claimed interface c7b5f3f8
> +  usb.c: acm driver claimed interface c7691fa0
> +
> +如果以上都正常，请启动 ``minicom``，
> +把它配置为连接 ``ttyACM`` 设备，然后
> +尝试输入 ``at``。如果返回 ``OK``，说明一切工作正常。
> diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
> index b4cb0ccaa39b..686e5b0a9384 100644
> --- a/Documentation/translations/zh_CN/usb/index.rst
> +++ b/Documentation/translations/zh_CN/usb/index.rst
> @@ -17,10 +17,10 @@ USB 支持
>   .. toctree::
>       :maxdepth: 1
> 
> +    acm
> 
>   Todolist:
> 
> -* acm
>   * authorization
>   * chipidea
>   * dwc3
> --
> 2.54.0
> 

