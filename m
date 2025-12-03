Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B323770A
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 02:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729002; cv=none; b=PV2IOhRW95Ucz/79wOzIIv9C6qJv2ZyltO3u9JRqOm4cYUkwK7q/pusknhYo94Sz3m42oTN5x+gx3u9Lscos5Uf8/13V44Kc1hczuhE/fw7Os+aedrNiyGL8/+DFGt86iMuwxtlY6C08c+bMB0NaQGNg8+T9kdJlxJ8UvtZqnM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729002; c=relaxed/simple;
	bh=KdiYEwjhAYiZgfWgtgdTp7GLlr11/3ZSvPicViqwV74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmQqNXA7CvsG4L7jZc1OC/6oSdhCLReDeJPLTe2pEYd9k8ELxBmWEFxisfRzrkZ7KV9b+wtvn2BDeVsWivQnpdQUs3UymBaKWe5G4G0wJMh21vMduXGZx9ih8Rjmcdx7rC99iLwLWRZYeUUrnmV3r2Re6fQ3aOSnNk7z/feEfQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RA9a0KXf; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RA9a0KXf"
Message-ID: <ad316354-5e82-47fd-973e-b83774fad938@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764728997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YU06anglnS6noaYdHj8/cC8E/J1BLC1MmPUUCgk38+U=;
	b=RA9a0KXfkrAJ+3dZWZ9/sdQD0CaSR6SEb+QPtHH825mAKQ1ki7qlYlb9zbrDL26T9MsSSs
	iZ7RNV0Z6OtgvXsKQJuckhSPLYlaMaOv/aqCdt+vB2cEqGrECxiHIDft3ZTUTLs/SCmTZw
	FmxvqbD1KkQAvBS9urCTK4Pp9DfsXaw=
Date: Wed, 3 Dec 2025 10:29:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/8] docs/zh_CN: Add authorization.rst translation
To: Kefan Bai <baikefan@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
 <27b59f2a2490a704241893df5ccbd4c127a5719c.1764674650.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <27b59f2a2490a704241893df5ccbd4c127a5719c.1764674650.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/12/2 19:56, Kefan Bai 写道:
> Translate .../usb/authorization.rst into Chinese
>
> Update the translation through commit f176638af476
> ("USB: Remove Wireless USB and UWB documentation")
>
> Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

> ---
>   .../translations/zh_CN/usb/authorization.rst  | 125 ++++++++++++++++++
>   1 file changed, 125 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
>
> diff --git a/Documentation/translations/zh_CN/usb/authorization.rst b/Documentation/translations/zh_CN/usb/authorization.rst
> new file mode 100644
> index 000000000000..4a8b743480ae
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/authorization.rst
> @@ -0,0 +1,125 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/usb/authorization.rst
> +:翻译:
> +
> + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> +
> +:校译:
> +
> +
> +===========================
> +授权或禁止USB设备连接到系统
> +===========================
> +
> +版权 (C) 2007 Inaky Perez-Gonzalez <inaky@linux.intel.com> 英特尔公司
> +
> +此功能允许你控制系统中USB设备的使用权限。
> +你可以借此实现USB设备的锁定，并由用户空间完全控制。
> +
> +目前为止，当插入一个USB设备时，系统会配置该USB设备，其接口会立即对用户开放。
> +通过此修改，只有在root授权配置设备后，用户才能使用它。
> +
> +
> +使用方法
> +=========
> +
> +授权设备连接::
> +
> +	$ echo 1 > /sys/bus/usb/devices/DEVICE/authorized
> +
> +禁止设备连接::
> +	$ echo 0 > /sys/bus/usb/devices/DEVICE/authorized
> +
> +将新连接到hostX的设备默认设置为未授权（即：锁定）::
> +
> +	$ echo 0 > /sys/bus/usb/devices/usbX/authorized_default
> +
> +解除锁定::
> +
> +	$ echo 1 > /sys/bus/usb/devices/usbX/authorized_default
> +
> +默认情况下，所有USB设备都是授权的。
> +向authorized_default属性写入 "2" 会使内核默认只授权连接到内部USB端口的设备。
> +
> +系统锁定示例（简单示例）
> +------------------------
> +
> +假设你想实现一个锁定功能，要求只有类型为XYZ的设备可以连接
> +（例如，它是一个带有可见USB端口的自助服务终端）::
> +
> +  启动系统
> +  rc.local ->
> +
> +   for host in /sys/bus/usb/devices/usb*
> +   do
> +      echo 0 > $host/authorized_default
> +   done
> +
> +将一个脚本挂接到udev，当插入新的USB设备时，该脚本就会被自动触发::
> +
> + if device_is_my_type $DEV
> + then
> +   echo 1 > $device_path/authorized
> + done
> +
> +
> +这里的device_is_my_type()就是实现锁定的关键所在。
> +仅仅检查class、type 和protocol是否匹配某个值，
> +是最差的安全验证方式（但对于想要破解的人却是最容易的）。
> +如果你需要真正安全的方案，应使用加密、证书认证等手段。
> +一个针对存储密钥的简单示例::
> +
> + function device_is_my_type()
> + {
> +   echo 1 > authorized		# 暂时授权它
> +                                # FIXME: 确保没有人能够挂载它
> +   mount DEVICENODE /mntpoint
> +   sum=$(md5sum /mntpoint/.signature)
> +   if [ $sum = $(cat /etc/lockdown/keysum) ]
> +   then
> +        echo "We are good, connected"
> +        umount /mntpoint
> +        # 添加一些额外的内容，以便其他人也可以使用它
> +   else
> +        echo 0 > authorized
> +   fi
> + }
> +
> +
> +当然，这种做法很简陋；实际上你应该使用基于PKI的真正证书验证，
> +这样就不会依赖共享密钥之类的东西。不过你明白我的意思。
> +任何拿到设备仿真工具包的人都能伪造描述符和设备信息。
> +所以千万不要信任这些信息。
> +
> +接口授权
> +--------
> +
> +也有类似的方法用于允许或拒绝特定USB接口。这允许只阻止USB设备的一个子集。
> +
> +授权接口::
> +
> +	$ echo 1 > /sys/bus/usb/devices/INTERFACE/authorized
> +
> +取消授权接口::
> +
> +	$ echo 0 > /sys/bus/usb/devices/INTERFACE/authorized
> +
> +也可以更改新接口在特定USB总线上的默认值。
> +
> +默认允许接口::
> +
> +	$ echo 1 > /sys/bus/usb/devices/usbX/interface_authorized_default
> +
> +默认拒绝接口::
> +	$ echo 0 > /sys/bus/usb/devices/usbX/interface_authorized_default
> +
> +默认情况下，interface_authorized_default位为1。
> +因此，所有接口默认都是授权的。
> +
> +注意：
> +  如果要对一个未授权的接口进行授权，则必须通过将INTERFACE写入
> +  /sys/bus/usb/drivers_probe来手动触发驱动程序进行探测。
> +  对于使用多个接口的驱动程序，需要先对所有使用的接口进行授权。
> +  之后应探测驱动程序。这样做可以避免副作用。
> --
> 2.52.0
>
>
