Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB4A256C70
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764815354; cv=none; b=i3W83/Y2z5cMzwkUsfshhSZ/G4QM8qsfR6dZ4/UdfjBWPGszJu7+rwO1cdPP1hQ4olIzlloPEMhRIMM8KHy8eTevI1iPdC+ue0cZoy63SKxrHUD/DgowNdI0Hq9gwpDP8ZAxxu8H89t760u6DNEKPS2ywafXQR4B6OV2e55xhjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764815354; c=relaxed/simple;
	bh=/+C9cN9dfyePNj/Ojl6F1Z2PuqSXfhF23WLn7ms4M60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBVbMmqFwAH7zEL2NL5Ki2BYZC67RMUvz1p+Ap89J0XKKfmlXDpyo5hFI/UZwPiARSnLdJSy0kDz6nDp+9i6crc4eahhKLtXlJWtICpTHaiDhmf8Hisb7wvZFbFRu3f3j1O9bJ7znkLSoZ/EcE8uJVq7IdPRwzmf2lx+6qnYL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=em8PkNh9; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="em8PkNh9"
Message-ID: <734e0a88-11d7-4871-a52f-d567cd970f63@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764815349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVRkQCiIKXBi1EGOJkHHnB+JiqoIlFfVbOzHraYfBFQ=;
	b=em8PkNh9AcOpst+2G9mn3yUhbHoBL0o2qnkf5wL4Yr8mr5Xm2zmB+4WP87MKUCLXMl8RYe
	Zs3NlZx0S+D9D82tPNfFucAT7/mCLZjt3EIV/vwZ5IBNrNx40JL/LkN8WsxNknf8LdCsGA
	xWnZyVSIEI6hqRuX4VfeUSYdruc0AEs=
Date: Thu, 4 Dec 2025 10:28:51 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 5/8] docs/zh_CN: Add dwc3.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
 <f44f47ede4b63979b608b6d5c058442b1b5fa8d6.1764674650.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <f44f47ede4b63979b608b6d5c058442b1b5fa8d6.1764674650.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/12/2 19:56, Kefan Bai 写道:
> Translate .../usb/dwc3.rst into Chinese
>
> Update the translation through commit ecefae6db042
> ("docs: usb: rename files to .rst and add them to drivers-api")
>
> Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>、

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

> ---
>   Documentation/translations/zh_CN/usb/dwc3.rst | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
>
> diff --git a/Documentation/translations/zh_CN/usb/dwc3.rst b/Documentation/translations/zh_CN/usb/dwc3.rst
> new file mode 100644
> index 000000000000..700aee545559
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/dwc3.rst
> @@ -0,0 +1,60 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/usb/dwc3.rst
> +:翻译:
> +
> + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +
> +==========
> +DWC3 驱动
> +==========
> +
> +
> +待完成
> +~~~~~~
> +
> +在你阅读时可以随便挑点儿东西做 :)
> +
> +- 将中断处理程序转换为基于每端点线程的IRQ
> +
> +  事实证明，一些DWC3命令大约需要~1ms才能完成。
> +  当前代码会一直自旋等待命令完成，这是不好的设计。
> +
> +  实现思路：
> +
> +  - DWC core实现了一个用于按端点解复用中断的IRQ控制器。中断号在
> +    probe阶段分配，并归属于该设备。如果硬件通过MSI为每个端点
> +    提供独立的中断，那么这个虚拟的IRQ控制器就可以被硬件真实的端点
> +    中断所取代。
> +
> +  - 在调用usb_ep_enable()时会申请和分配中断资源，
> +    在调用usb_ep_disable()时会释放中断资源。
> +    最差的情况是32个中断，最少为ep0/1的两个中断。
> +  - dwc3_send_gadget_ep_cmd()将在wait_for_completion_timeout()中休眠到命令完成。
> +  - 中断处理程序分为以下几个部分：
> +
> +    - 设备的中断处理主程序
> +      遍历每个事件，对其调用generic_handle_irq()。
> +      在generic_handle_irq()返回后，确认事件计数器，最终完成中断处理。
> +
> +    - 设备的中断处理线程
> +      无
> +
> +    - EP中断的处理主程序
> +      读取事件并尝试处理它。所有需要休眠的操作都交给线程处理。
> +      事件保存在每个端点的数据结构中。
> +      需要注意：一旦把事件交给线程去处理，就要注意不要自己再去处理它，
> +      否则可能会导致低优先级的事件先于高优先级事件被处理。
> +
> +    - EP中断的处理线程
> +      处理剩余的EP工作，这些工作可能会导致休眠，例如等待命令完成。
> +
> +  延迟:
> +
> +   不应该增加延迟，因为中断线程具有较高优先级，会在用户空间普通任务之前运行
> +   （除非用户更改了调度优先级）。
> --
> 2.52.0
>
