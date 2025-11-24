Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C62814A8E
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 06:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965040; cv=none; b=cW8QeAPkC/2+ejcNHYJeGYKGOMdhvQh3oex/Lgj9O5zccEzeJjeMASaJj8pEXMvFHZfef32dX12FhkkfzagdkkWOvXDs6B1HDkMUca9njqFjGPxMgZaj0teWPJZqOth/CQV+Rz70lrxniFH7FrBiPLPyBZcUCJsTIpsczbCtFEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965040; c=relaxed/simple;
	bh=FC/Ooz/Kl+Qkgo9zyVOD3QNhBw3k2SJ7lSoE2WgT9bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mS6E3rrltkm4gTaQSuKV9sXhXbv3xqFFKulQbDUyCn+Hx9ldrSIgP6/NsCN39t74913tqpglLyDebtC+xCXMI44fwDREBaQt6JWrOB3GXZhEL+lyLzqH7kNg20/DQPURZhsHchhafBZburDTV2W1eFDewSvgRn29LhSasaEbZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luDRgQuG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luDRgQuG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso2898178a91.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 22:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763965038; x=1764569838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNrahWAQn7rzfqfJkdCkuLQA9svUkLcQa/1rHmgkHtQ=;
        b=luDRgQuGtWqIkvbpjGFT1a/5V1pA9oo+QDUvi+bxjYJo6l4Nysz2/+ivMSihjCACur
         4qFo0DLrOvVAxajCN3toYu++PdvZn6gLpAKdyR2LfcfDCgK/6l68lb57QArmvmS6yrPn
         9LvCpg0mgRJJtAxfaCwJXJ4tPdDmmnekpYlFt2v23fpxP2E985fvcJvVmc2Ff8SpJBky
         pchB1PrvImm9P57nCKzDgfZLsaOJjp/VxIgqh58i+WbH4FQecrpekKHW+k9G78wUthPh
         GAe39l8iZb5SUm2HoEdGMS4lUg7ZAUgWDb7W0/SrXGSBq5oYi34nPj5Dx6dPSG9xORph
         xCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763965038; x=1764569838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNrahWAQn7rzfqfJkdCkuLQA9svUkLcQa/1rHmgkHtQ=;
        b=rqaUGKNUP1sKy46STH5V7t1QCgB3Y5F3j0dQbmQb1MM+H4Lv5VF6f/WLGnSOWcXcjz
         alziGYqsgf08AmlrE4wERhZm52pyAVslsOl65pPasMci2HGoo8nGSIwPwB4I8gu+E74E
         IiF5ErNLDBPJznNLshQbWqmMC6dtx936Kvgp4i7jw0t8AyfyrQbeq5BO75vZhEZ3Btv0
         3BmK6hiF7cYjr96RzgWzVHZnVurTNdQPIYAm3DW/dPxfk2ibPIzCfGOjv72+7nXWzl44
         lvMmsLudAw/PM6fW/oRihZNOJNGATRz1M/5sbUOx4WxvFKVgU+/5/yO3N3RxpgFBsx0u
         iPkw==
X-Forwarded-Encrypted: i=1; AJvYcCVO5N0nh9C4gNP9dQ8/ALudgLX7rHQdpSO92aP2SCC3P9RBINBtawbKxavPmONvy74Zujl40/dMw/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm018BkrwT16lNua65xpza/LgZVfA8mVoek33g30z1gryKH7Tv
	6Stq7ZrEQKX1Y2xgLzNBRpr4hM4K6OFnedl2vTjNzn+J1BjNaN9RELZp
X-Gm-Gg: ASbGncsrNbvEuwcsCI+HcejeoJWvKHxQs7qTWux/lijuYIge71AWiJPaDqjhgLYa6Yh
	/FJKZIttDUOQG7HBYfLv6LUe1QVS1VTahAvH6257ySp79H7Y4Hjx0vycYt5as7b8OoGoP6OSWhs
	EBQHyTCZ2JwGw5yepxDyZYo5v33Zef+c7VgnGL3+KVV3Uv28iIDCuvm6uFRV1gXSnaWTMM80IPI
	3iEjQfudgZSJUzkmG3SLwkoVIZkvWoVQ60OUiGzz/MFr1piLz2XRRswJK4uRhksN/uDrYS0z2Ix
	t83T2rgscvFR2PPl4e3habzNJGs1F1upV5ve7f94a97oyv0q6xTv+3L5pHd4mpssFpg7n3z9uGi
	+FxV9SL+BcgDumJWZSAYrxfcdHomzkHT9S8GDEGvp7Uc8wauUGKQVaIVmf5mptgBmdeoV/ZNZr9
	ixXNvx1mY4
X-Google-Smtp-Source: AGHT+IHc00dtwcM4qeMT7YrDyqTz+CNDq+8KMy4nxxOBXxBvjjseGYLcAbGcSE57ZtT2caiLbY56Ig==
X-Received: by 2002:a17:90b:5826:b0:340:8d99:49d4 with SMTP id 98e67ed59e1d1-3472983a03dmr15386317a91.1.1763965038310;
        Sun, 23 Nov 2025 22:17:18 -0800 (PST)
Received: from [192.168.2.226] ([114.92.45.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5178esm12411913a91.16.2025.11.23.22.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 22:17:17 -0800 (PST)
Message-ID: <9d08e5bb-7cbb-4117-a132-652072a68024@gmail.com>
Date: Mon, 24 Nov 2025 14:17:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/25] docs/zh_CN: Add acm.rst translation
To: macrofun <baikefan@leap-io-kernel.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1763897036.git.baikefan@leap-io-kernel.com>
 <951c3e0f1d98e0adb604835e418d9c53768c216b.1763897036.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <951c3e0f1d98e0adb604835e418d9c53768c216b.1763897036.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/11/23 19:56, macrofun wrote:
> Translate .../usb/acm.rst into Chinese.
> 
> Update the translation through commit ecefae6db042
> ("docs: usb: rename files to .rst and add them to drivers-api")
> 
> Signed-off-by: macrofun<baikefan@leap-io-kernel.com>
> ---
>   Documentation/translations/zh_CN/usb/acm.rst | 137 +++++++++++++++++++
>   1 file changed, 137 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
> 
> diff --git a/Documentation/translations/zh_CN/usb/acm.rst b/Documentation/translations/zh_CN/usb/acm.rst
> new file mode 100644
> index 000000000000..974654410344
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/acm.rst
> @@ -0,0 +1,137 @@
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
> +======================
> +Linux ACM驱动 v0.16
> +======================

Hi Macrofun,

Please check and follow the RST syntax to fix your patch problems.

https://en.wikipedia.org/wiki/ReStructuredText
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html

Thanks
Alex

> +
> +版权所有(c) 1999 Vojtech Pavlik<vojtech@suse.cz>
> +
> +由SuSE赞助
> +
> +0. 免责声明
> +~~~~~~~~~~~~~
> +本程序是自由软件；您可以依据自由软件基金会发布的GNU通用公共许可证第2版，
> +或（由您选择的）任何更高版本的规定，对本程序进行再发布和/或修改。
> +
> +我们希望本程序有用，但不提供任何担保；甚至不包含对适销性或适用于特定目的的默示性担保。
> +更多细节请参阅GNU通用公共许可证。
> +
> +您应该已经随本程序收到GNU通用公共许可证副本；
> +如果没有，请写信至：Free Software Foundation, Inc., 59
> +Temple Place, Suite 330, Boston, MA 02111-1307 USA。
> +
> +如需联系作者，可通过电子邮件发送消息至vojtech@suse.cz，
> +或通过纸质邮件寄至：
> +Vojtech Pavlik, Ucitelska 1576, Prague 8, 182 00, Czech Republic。
> +
> +为方便起见，本软件包中已包含GNU通用公共许可证第2版：参见文件COPYING。
> +
> +1. 使用方法
> +~~~~~~~~~~~~~
> +drivers/usb/class/cdc-acm.c驱动可用于USB调制解调器和USB ISDN终端适配器，
> +这些设备符合USB通用串行总线通信设备类（Universal Serial Bus
> +Communication Device Class）的抽象控制模型（Abstract Control Model，
> +USB CDC ACM）规范。
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
> +我知道有一款ISDN终端适配器可以与ACM驱动一起使用：
> +
> +	- 3Com USR ISDN Pro TA
> +
> +一些手机也可以通过USB连接。我知道以下机型可以正常工作：
> +
> +	- SonyEricsson K800i
> +
> +不幸的是，许多调制解调器以及大多数ISDN终端适配器使用专有接口，
> +因此无法与此驱动兼容。购买前请确认设备是否符合ACM规范。
> +
> +要使用调制解调器，您需要加载以下模块：
> +
> +	usbcore.ko
> +	uhci-hcd.ko ohci-hcd.ko or ehci-hcd.ko
> +	cdc-acm.ko
> +
> +之后，调制解调器应该可以正常访问。
> +你应该能够使用minicom、ppp和mgetty与它们进行通信。
> +
> +2. 验证驱动是否正常工作
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +第一步是检查 /sys/kernel/debug/usb/devices，其内容应类似如下::
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
> +其中以下三行（以及 Cls= 'comm' 和 'data' 类）非常重要，它们表示这是一个ACM设备。
> +Driver=acm 表示acm驱动正在处理该设备。
> +如果只看到 Cls=ff(vend.)，那么很不幸，这是一个厂商自定义接口设备::
> +
> +    D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
> +    I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
> +    I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
> +
> +在系统日志中你应该看到::
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
> +如果以上都正常，请启动minicom，将其设置为连接ttyACM设备，然后输入'at'。
> +如果响应 "OK"，则说明一切工作正常。
> -- 2.52.0
> 

