Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB63207
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 05:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764739877; cv=none; b=Mq2rnykOB+SzU9upqQiQGCkF+7TD7xOnHOiIsBzp+w0iHjPlmEGHS3Y0XrMmJRQk8RAe0y4mTj+S03t7XCN3P8DM9qCLQfZRz6OufYu8H+oWDC7wCCKs1PjCgYOeCuGt0pQpDFqKKiWgCYtG7A+vgUQYqtxWpCGFJ3hZm0xILDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764739877; c=relaxed/simple;
	bh=dDz0/bargQwKZIgO/zfSFA7ElLv7/OhfjQkfWiOMkX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYY3RPVA7d/iqDHndem0BKdObOrUMLFV7ZkC04jLEt7jz9jcUfNUHNPkvFI8ssBnWPO7aEMMTSuAxVcXox6If4RJRIIbQrSkSyVzkuTOquiGOYiPbGjm6xUTZT2bATIqEdKv216P3L+e2jJ0ELYeGwre9I7jTmndTwCiyatagFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jkUbVhU6; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jkUbVhU6"
Message-ID: <83858465-202d-4370-9a74-eb9cefc1c6be@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764739871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lczXtplLM2mB2q409k8WH4KMRomcQKxCDBOIC1W442g=;
	b=jkUbVhU6lTXe41g6C+9g8QTza66iQBCqNu1kko66XQ9g7zwliCjWewZhHz9DTTX0K8ImFn
	Gqbu8M/30d2RukAJMbcVzF2jMv0r6IzuLdI2jwtfzGA90c7R8YpObH0vsIEAXOwk3bEYXx
	FlR9WSP/KglbIAwU6AbDKidbeUbkwx8=
Date: Wed, 3 Dec 2025 13:31:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/8] docs/zh_CN: Add chipidea.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
 <cda019bbda46d4c0e52364fc8d9c723e614aa8c3.1764674650.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <cda019bbda46d4c0e52364fc8d9c723e614aa8c3.1764674650.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/12/2 19:56, Kefan Bai 写道:
> Translate .../usb/chipidea.rst into Chinese
>
> Update the translation through commit e4157519ad46
> ("Documentation: usb: correct spelling")
>
> Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
> ---
>   .../translations/zh_CN/usb/chipidea.rst       | 142 ++++++++++++++++++
>   1 file changed, 142 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
>
> diff --git a/Documentation/translations/zh_CN/usb/chipidea.rst b/Documentation/translations/zh_CN/usb/chipidea.rst
> new file mode 100644
> index 000000000000..88f80489fe57
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/chipidea.rst
> @@ -0,0 +1,142 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/usb/chipidea.rst
> +:翻译:
> +
> + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +
> +=============================
> +ChipIdea高速双角色控制器驱动
> +=============================
> +
> +1. 如何测试OTG FSM（HNP 和 SRP）
> +--------------------------------
> +
> +接下来我们在两块Freescale i.MX6Q Sabre SD开发板上，演示如何通过sys输入文件
> +来测试OTG的HNP和SRP功能。
> +
> +1.1 如何使能OTG FSM
> +--------------------
> +
> +1.1.1 在menuconfig中选择CONFIG_USB_OTG_FSM，并重新编译内核
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +重新编译镜像和模块。如果需要查看OTG FSM的内部变量，可以挂载debugfs，
> +会有两个文件用于显示OTG FSM变量和部分控制器寄存器值::
> +
> +	cat /sys/kernel/debug/ci_hdrc.0/otg
> +	cat /sys/kernel/debug/ci_hdrc.0/registers
> +
> +1.1.2 在控制器节点的dts文件中添加以下条目
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +::
> +
> +	otg-rev = <0x0200>;
> +	adp-disable;
> +
> +1.2 测试步骤
> +-------------
> +
> +1) 给两块Freescale i.MX6Q Sabre SD开发板上电，
> +   并加载gadget类驱动（例如 g_mass_storage）。
> +
> +2) 用USB线连接两块开发板：一端是micro A插头，另一端是micro B插头。
> +
> +   插入micro A插头的一端为A设备，它应当枚举另一端的B设备。
> +
> +3) 角色切换
> +
> +   在B设备上执行::
> +
> +	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
> +
> +   B设备应切换为host并枚举A设备。
> +
> +4) 把A设备切换为host
> +
> +   在B设备上执行::
> +
> +	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
> +
> +   或者通过HNP轮询机制：B-Host可以检测到A外设想成为host的意愿，
> +   从而由A外设触发角色切换。在A设备上执行::
> +   或者通过HNP轮询机制：B-Host可以检测到A外设想切换为host角色的意愿，
> +   并通过A外设对轮询的响应来触发角色切换。
> +   这可以通过在A设备上执行::
> +
> +	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
> +
> +   A设备应切换回host并枚举B设备。
> +
> +5) 拔掉 B设备（拔掉 micro B 插头），在10秒内重新插入；
> +   A设备 应重新枚举B设备。

Del space?


Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

> +
> +6) 拔掉B设备（拔掉 micro B 插头），在10秒后重新插入；
> +   A设备不应重新枚举B设备。
> +
> +   若A设备想使用总线：
> +
> +   在A设备上::
> +
> +	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
> +	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
> +
> +   若B设备想使用总线：
> +
> +   在B设备上::
> +
> +	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
> +
> +7) A设备关闭总线供电
> +
> +   在A设备上::
> +
> +	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
> +
> +   A设备应断开与B设备的连接并关闭总线供电。
> +
> +8) B设备进行SRP数据脉冲唤醒
> +
> +   在B设备上::
> +
> +	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
> +
> +   A设备应恢复usb总线并枚举B设备。
> +
> +1.3 参考文档
> +-------------
> +《On-The-Go and Embedded Host Supplement to the USB Revision 2.0 Specification
> +July 27, 2012 Revision 2.0 version 1.1a》
> +
> +2. 如何使能USB作为系统唤醒源
> +----------------------------
> +下面是在imx6平台上使能USB作为系统唤醒源的示例。
> +
> +2.1 启用核心控制器的唤醒::
> +
> +	echo enabled > /sys/bus/platform/devices/ci_hdrc.0/power/wakeup
> +
> +2.2 启用glue层的唤醒::
> +	echo enabled > /sys/bus/platform/devices/2184000.usb/power/wakeup
> +
> +2.3 启用PHY的唤醒（可选）::
> +
> +	echo enabled > /sys/bus/platform/devices/20c9000.usbphy/power/wakeup
> +
> +2.4 启用根集线器的唤醒::
> +	echo enabled > /sys/bus/usb/devices/usb1/power/wakeup
> +
> +2.5 启用相关设备的唤醒::
> +
> +	echo enabled > /sys/bus/usb/devices/1-1/power/wakeup
> +
> +如果系统只有一个USB端口，并且你希望在这个端口上启用USB唤醒，
> +你可以使用下面的脚本来启用USB唤醒::
> +
> +	for i in $(find /sys -name wakeup | grep usb);do echo enabled > $i;done;
> --
> 2.52.0
>
