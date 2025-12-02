Received: from mail-m49234.qiye.163.com (mail-m49234.qiye.163.com [45.254.49.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A83074A4
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663080; cv=none; b=Tf4G5yh+bRqKkhxUqv7/7DaG7sOdtbWeY+W/H0eUyL+0a/bPXhUT2tLZ8IWMeq9q8uWTvIl8h8mkNtg7wk+fMkzLdp1M0LA03QRmx+1NtkF6j5R2JlAwlnG8FY4C7BvNYyozfODyz3Jv2Qeob/dKribOzN883SCzmA2Yqu3CFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663080; c=relaxed/simple;
	bh=frs0+PE64z+ncKLYBusEVk1Ex9RqBVSIFYH5NvRaoiw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VslXQUmrJSLDE/W8s6OwBUuDBxS88Wj/ZrvUFWeWd7d+150FreAuFnVBqWZg/YOsu9WDMJfgmp75UilzyYXf1yRqCYmayr8n1aOawscCziEeGhP6AcQNrH3xYGYV+vSq3mbZjVFbSE0B5xNlk0anpbE0w96kFWM5oTEDUdzs5vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=k1BI9uy+; arc=none smtp.client-ip=45.254.49.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="k1BI9uy+"
Received: from localhost (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ba8a88c9;
	Tue, 2 Dec 2025 16:11:03 +0800 (GMT+08:00)
Date: Tue, 2 Dec 2025 16:11:01 +0800
From: BaiKefan <baikefan@leap-io-kernel.com>
To: Yanteng Si <si.yanteng@linux.dev>
Cc: alexs@kernel.org, dzm91@hust.edu.cn, corbet@lwn.net,
 linux-doc@vger.kernel.org, doubled@leap-io-kernel.com
Subject: Re: [PATCH v3 3/8] docs/zh_CN: Add authorization.rst translation
Message-ID: <20251202155213.00007c30@leap-io-kernel.com>
In-Reply-To: <343e5b82-e78a-483b-a8db-57bef4f447eb@linux.dev>
References: <cover.1763984424.git.baikefan@leap-io-kernel.com>
 <b4328d04b19ca0d16307aeaa3cc8d10ad2c01bdd.1763984424.git.baikefan@leap-io-kernel.com>
 <343e5b82-e78a-483b-a8db-57bef4f447eb@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ade1d732609d5kunm4a1b67b537069b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTB1IVkMeQ09DHUtKHh1CS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MSVVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=k1BI9uy+wB6iRtZoAQenFsoJyv2WtKjbHuDstK0My504/ooietRWzKawQaGYHdv5gDDb6dJAW4iRvILB4gIEg9M1jKRhKAUjQ7hJ6RQ6vhvC3XLcaAAQCe1zffd3e1AdtJIyGiHA6iGhEtH/7+4rbG/A5cHIS5ylRg7GyKZYA21f+vH8j8fXmhvWxK0Kcp66Pj1LVD01u8w7vXe9tAdubKULut4QiaV/0Mg6hk4fDMei+Rt7EroCSNo4pDVSGnYtKxQs+MDmt88WZDMclYB03ggkgpemKYMQKnMYp2n0iMYctMQ5p5TGtPTsnTimuMV7O4/GtMANOKndLX7X1vphvA==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=73mppzhD1o+ywc+fDMgawxphVDKpGRRkYNTSgNuvglI=;
	h=date:mime-version:subject:message-id:from;

On Mon, 1 Dec 2025 14:54:53 +0800
Yanteng Si <si.yanteng@linux.dev> wrote:

> 
> 在 2025/11/24 21:34, Kefan Bai 写道:
> > Translate .../usb/authorization.rst into Chinese
> >
> > Update the translation through commit f176638af476
> > ("USB: Remove Wireless USB and UWB documentation")
> >
> > Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
> > ---
> >   .../translations/zh_CN/usb/authorization.rst  | 125
> > ++++++++++++++++++ 1 file changed, 125 insertions(+)
> >   create mode 100644
> > Documentation/translations/zh_CN/usb/authorization.rst
> >
> > diff --git a/Documentation/translations/zh_CN/usb/authorization.rst
> > b/Documentation/translations/zh_CN/usb/authorization.rst new file
> > mode 100644 index 000000000000..2bcb3e9d4c5a
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/usb/authorization.rst
> > @@ -0,0 +1,125 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/usb/authorization.rst
> > +:翻译:
> > +
> > + 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> > +
> > +:校译:
> > +
> > +
> > +==============================================================
> > +授权（或不授权）USB设备连接到系统
> > +==============================================================
> 
> It's too long, please trim them.
> 
> 
> Thanks,
> 
> Yanteng
> 

Hi Yanteng,

Thanks for the review.

I'll shorten those overlong markers and check the rest of the
translated files for similar issues.

Thanks,
Kefan

> > +
> > +版权 (C) 2007 Inaky Perez-Gonzalez <inaky@linux.intel.com>
> > 因特尔公司 +
> > +此功能允许你控制系统中USB设备的使用权限。
> > +你可以借此实现USB设备的锁定，并由用户空间完全控制。
> > +
> > +目前为止，当插入一个USB设备时，系统会配置该USB设备，其接口会立即对用户开放。
> > +通过此修改，只有在root授权配置设备后，用户才能使用它。
> > +
> > +
> > +使用方法
> > +=========
> > +
> > +授权设备连接::
> > +
> > +	$ echo 1 > /sys/bus/usb/devices/DEVICE/authorized
> > +
> > +取消授权设备连接::
> > +	$ echo 0 > /sys/bus/usb/devices/DEVICE/authorized
> > +
> > +将新连接到hostX的设备默认设置为未授权（即：锁定）::
> > +
> > +	$ echo 0 > /sys/bus/usb/devices/usbX/authorized_default
> > +
> > +解除锁定::
> > +
> > +	$ echo 1 > /sys/bus/usb/devices/usbX/authorized_default
> > +
> > +默认情况下，所有USB设备都是授权的。
> > +向authorized_default属性写入 "2"
> > 会使内核默认只授权连接到内部USB端口的设备。 +
> > +系统锁定示例（简单示例）
> > +------------------------------
> > +
> > +假设你想实现一个锁定功能，要求只有类型为XYZ的设备可以连接
> > +（例如，它是一个带有可见USB端口的自助服务终端）::
> > +
> > +  启动系统
> > +  rc.local ->
> > +
> > +   for host in /sys/bus/usb/devices/usb*
> > +   do
> > +      echo 0 > $host/authorized_default
> > +   done
> > +
> > +将一个脚本挂接到udev，当插入新的USB设备时，该脚本就会被自动触发::
> > +
> > + if device_is_my_type $DEV
> > + then
> > +   echo 1 > $device_path/authorized
> > + done
> > +
> > +
> > +这里的device_is_my_type()就是实现锁定的关键所在。
> > +仅仅检查class、type 和protocol是否匹配某个值，
> > +是最差的安全验证方式（但对于想要破解的人却是最容易的）。
> > +如果你需要真正安全的方案，应使用加密、证书认证等手段。
> > +一个针对存储密钥的简单示例::
> > +
> > + function device_is_my_type()
> > + {
> > +   echo 1 > authorized		# 暂时授权它
> > +                                # FIXME: 确保没有人能够挂载它
> > +   mount DEVICENODE /mntpoint
> > +   sum=$(md5sum /mntpoint/.signature)
> > +   if [ $sum = $(cat /etc/lockdown/keysum) ]
> > +   then
> > +        echo "We are good, connected"
> > +        umount /mntpoint
> > +        # 添加一些额外的内容，以便其他人也可以使用它
> > +   else
> > +        echo 0 > authorized
> > +   fi
> > + }
> > +
> > +
> > +当然，这种做法很简陋；实际上你应该使用基于PKI的真正证书验证，
> > +这样就不会依赖共享密钥之类的东西。不过你明白我的意思。
> > +任何拿到设备仿真工具包的人都能伪造描述符和设备信息。
> > +所以千万不要信任这些信息。
> > +
> > +接口授权
> > +---------
> > +
> > +也有类似的方法用于允许或拒绝特定USB接口。这允许只阻止USB设备的一个子集。
> > +
> > +授权接口::
> > +
> > +	$ echo 1 > /sys/bus/usb/devices/INTERFACE/authorized
> > +
> > +取消授权接口::
> > +
> > +	$ echo 0 > /sys/bus/usb/devices/INTERFACE/authorized
> > +
> > +也可以更改新接口在特定USB总线上的默认值。
> > +
> > +默认允许接口::
> > +
> > +	$ echo 1 >
> > /sys/bus/usb/devices/usbX/interface_authorized_default +
> > +默认拒绝接口::
> > +	$ echo 0 >
> > /sys/bus/usb/devices/usbX/interface_authorized_default +
> > +默认情况下，interface_authorized_default位为1。
> > +因此，所有接口默认都是授权的。
> > +
> > +注意：
> > +  如果要对一个未授权的接口进行授权，则必须通过将INTERFACE写入
> > +  /sys/bus/usb/drivers_probe来手动触发驱动程序进行探测。
> > +  对于使用多个接口的驱动程序，需要先对所有使用的接口进行授权。
> > +  之后应探测驱动程序。这样做可以避免副作用。
> > --
> > 2.52.0
> >
> 
> 

