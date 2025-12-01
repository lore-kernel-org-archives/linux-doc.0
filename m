Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF60327FB25
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764571503; cv=none; b=nDj2CP6cUbCkWzb7x4wS5Ra4yVCPIkb1mRHkOtqfRdeo13cnCgypuHwVKY6HHzPvZyy0T5eExaXx6avZvfDU+M7mSypUgSG/CTSkKHNQud6BFFGYXiGoBbJXSIh/QYYHMQWIZluYWPN9GmenXa1NKm05mwicv35giTo93opBnTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764571503; c=relaxed/simple;
	bh=MVO9AYfSApxY08uGyurjv+/S5b7vV19f5LSpGSPRIl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgDQO1oNp7e/nZsNDmPmuepHh8amuSRHIC24QPJVDXafpB+EWJi7mhEq7KAPuFRPN6B7iYDUsHssNXK5V5gOv1Nr4mka4zsInyEYzUxvAVHWxqg9NHGFB9JxFJnZ80bRuiQTlZvVyFgUWizQt/X4CvBzl46rOkm26qqU4dKZXpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h4FIQSAg; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h4FIQSAg"
Message-ID: <0e3c9840-8c6f-4806-af03-ca889202ecd5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764571498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOnLelWChT3zNpmRty58iLL5g3q6iURFat2Y2VNbFeQ=;
	b=h4FIQSAgmeudR+bD7w5aEhOuHGayxXEPPmi6/3IGwneRTAmwOLSEGGdQFMvCVj9tG+gUc2
	SurCnEAmOpo5+OlCOcuhQwEIbvG3f73J04tdNWA73cGLpGyxMBFhLff1R/F07ddKjg3968
	WG7DbODPTNAbs1b159KXuIRMMaPnTHI=
Date: Mon, 1 Dec 2025 14:44:51 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/8] docs/zh_CN: Add acm.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763984424.git.baikefan@leap-io-kernel.com>
 <17f3f62c3dc75f0260d2965df3cc39179f601f5c.1763984424.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <17f3f62c3dc75f0260d2965df3cc39179f601f5c.1763984424.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/11/24 21:34, Kefan Bai 写道:
> Translate .../usb/acm.rst into Chinese
>
> Update the translation through commit ecefae6db042
> ("docs: usb: rename files to .rst and add them to drivers-api")
>
> Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

> ---
>   Documentation/translations/zh_CN/usb/acm.rst | 137 +++++++++++++++++++
>   1 file changed, 137 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
>
> diff --git a/Documentation/translations/zh_CN/usb/acm.rst b/Documentation/translations/zh_CN/usb/acm.rst
> new file mode 100644
> index 000000000000..62299f62f947
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
> + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +======================
> +Linux ACM驱动 v0.16
> +======================
> +
> +版权所有(c) 1999 Vojtech Pavlik <vojtech@suse.cz>
> +
> +由SuSE赞助
> +
> +0. 免责声明
> +~~~~~~~~~~~~~
> +本程序是自由软件；您可以使用自由软件基金会发布的第2版GNU通用公共许可证，
> +或由您选择任何更高版本的许可证，对本程序进行再发布和/或修改。
> +
> +我们希望本程序有用，但不提供任何担保；甚至不包含对适销性或适用于特定目的的默示性担保。
> +更多细节请参阅GNU通用公共许可证。
> +
> +您应该已经随本程序收到GNU通用公共许可证副本；
> +如果没有，请写信至：Free Software Foundation, Inc., 59
> +Temple Place, Suite 330, Boston, MA 02111-1307 USA。
> +
> +如需联系作者，可通过电子邮件发送消息至 vojtech@suse.cz，
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
> +第一步是检查/sys/kernel/debug/usb/devices，其内容应该和下面这些类似::
> +
> +  T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 2
> +  B:  Alloc=  0/900 us ( 0%), #Int=  0, #Iso=  0
> +  D:  Ver= 1.00 Cls=09(hub  ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
> +  P:  Vendor=0000 ProdID=0000 Rev= 0.00
> +  S:  Product=USB UHCI Root Hub
> +  S:  SerialNumber=6800
> +  C:* #Ifs= 1 Cfg#= 1 Atr=40 MxPwr=  0mA
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
> +  C:* #Ifs= 2 Cfg#= 2 Atr=60 MxPwr=  0mA
> +  I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
> +  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
> +  I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
> +  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> +
> +其中以下三行（以及 Cls= 'comm' 和 'data' 类）非常重要，它们表示这是一个ACM设备。
> +Driver=acm表示acm驱动正在处理该设备。
> +如果只看到Cls=ff(vend.)，那么很不幸，这是一个厂商自定义接口设备::
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
> --
> 2.52.0
>
>
