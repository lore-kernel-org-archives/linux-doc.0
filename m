Received: from mail-m4921.qiye.163.com (mail-m4921.qiye.163.com [45.254.49.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F980306486
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991236; cv=none; b=sdHx8xfq8RXZ9ktvp2KMBeM09NWtzLOwHCmERr88Xw2hm5E8kKAl4nPPxYgSfdpsp0U6zIieLTHbEKPbk+jCyyfYQmQAeK0NLWkkviQrOQF3cK8ARRiEnFAYnMlhE7xl7jA3WNsykhNUPtxbGPq/qR6F/40ZBXEL6fjQQrDgqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991236; c=relaxed/simple;
	bh=Pcn/T3wX6msr69WKuxEOQO7GRxKuoT4jDwo8TAlENno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CSKD85rP8iVnpRU8P8fk74Z8qef34Zq4zLCzqDSZMSonAwzd6+qH0oO2XxAXNkrL0gMW+RHgq4H5chGZjltguz+v0ULeQXn0M11HAS1AQAnRO2KpYNG7fMA8e8+++i1sHlloZpRSrxuUv74k3Lt9Adf0QhEN2Y/TGz/NKF+mmC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=cUbVsEe+; arc=none smtp.client-ip=45.254.49.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="cUbVsEe+"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ab2e035e;
	Mon, 24 Nov 2025 21:33:45 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v3 3/8] docs/zh_CN: Add authorization.rst translation
Date: Mon, 24 Nov 2025 21:34:07 +0800
Message-ID: <b4328d04b19ca0d16307aeaa3cc8d10ad2c01bdd.1763984424.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763984424.git.baikefan@leap-io-kernel.com>
References: <cover.1763984424.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab612037b09d5kunme2b32dc6369cc7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGBhMVksaSEpLTUJDGU8dS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=cUbVsEe+/P7NJQczsTLtAg84RxyWRnEZeHDyO0ZIbcSgnrsLAjb/q2qfxT2ztT3Ly6VZ1nk40DHFhmj0wjpikekd/ViS21Hv6IlZsy7Vyfbwimf0BkHju1Azbx+E7i3yPBRCkZ9eL6mpeWmgwp8FyhdJGrf3MPCzNdh5osWscFh9fCW0EWbtmyE5r2OlMjKdaYvmSbTeMSryCN00YjUEDFJVC0y5F1f3rHgONkNSrpRfbTFC/zeNOOOK73A+HBvycwbW7xheNI8dV7AFZ0yCf1+K56q7RH2tTlLp1AS8SscSaoKHwPYiQfi8iz/UhyFHo/TlC2XgjIrsmIZdJOn9jA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=YSpdAAPb57usS1ZNhOsIEJfGW8oZf4l88YcyjZidKcU=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/authorization.rst into Chinese

Update the translation through commit f176638af476
("USB: Remove Wireless USB and UWB documentation")

Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/authorization.rst  | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst

diff --git a/Documentation/translations/zh_CN/usb/authorization.rst b/Documentation/translations/zh_CN/usb/authorization.rst
new file mode 100644
index 000000000000..2bcb3e9d4c5a
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/authorization.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/authorization.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+==============================================================
+授权（或不授权）USB设备连接到系统
+==============================================================
+
+版权 (C) 2007 Inaky Perez-Gonzalez <inaky@linux.intel.com> 因特尔公司
+
+此功能允许你控制系统中USB设备的使用权限。
+你可以借此实现USB设备的锁定，并由用户空间完全控制。
+
+目前为止，当插入一个USB设备时，系统会配置该USB设备，其接口会立即对用户开放。
+通过此修改，只有在root授权配置设备后，用户才能使用它。
+
+
+使用方法
+=========
+
+授权设备连接::
+
+	$ echo 1 > /sys/bus/usb/devices/DEVICE/authorized
+
+取消授权设备连接::
+	$ echo 0 > /sys/bus/usb/devices/DEVICE/authorized
+
+将新连接到hostX的设备默认设置为未授权（即：锁定）::
+
+	$ echo 0 > /sys/bus/usb/devices/usbX/authorized_default
+
+解除锁定::
+
+	$ echo 1 > /sys/bus/usb/devices/usbX/authorized_default
+
+默认情况下，所有USB设备都是授权的。
+向authorized_default属性写入 "2" 会使内核默认只授权连接到内部USB端口的设备。
+
+系统锁定示例（简单示例）
+------------------------------
+
+假设你想实现一个锁定功能，要求只有类型为XYZ的设备可以连接
+（例如，它是一个带有可见USB端口的自助服务终端）::
+
+  启动系统
+  rc.local ->
+
+   for host in /sys/bus/usb/devices/usb*
+   do
+      echo 0 > $host/authorized_default
+   done
+
+将一个脚本挂接到udev，当插入新的USB设备时，该脚本就会被自动触发::
+
+ if device_is_my_type $DEV
+ then
+   echo 1 > $device_path/authorized
+ done
+
+
+这里的device_is_my_type()就是实现锁定的关键所在。
+仅仅检查class、type 和protocol是否匹配某个值，
+是最差的安全验证方式（但对于想要破解的人却是最容易的）。
+如果你需要真正安全的方案，应使用加密、证书认证等手段。
+一个针对存储密钥的简单示例::
+
+ function device_is_my_type()
+ {
+   echo 1 > authorized		# 暂时授权它
+                                # FIXME: 确保没有人能够挂载它
+   mount DEVICENODE /mntpoint
+   sum=$(md5sum /mntpoint/.signature)
+   if [ $sum = $(cat /etc/lockdown/keysum) ]
+   then
+        echo "We are good, connected"
+        umount /mntpoint
+        # 添加一些额外的内容，以便其他人也可以使用它
+   else
+        echo 0 > authorized
+   fi
+ }
+
+
+当然，这种做法很简陋；实际上你应该使用基于PKI的真正证书验证，
+这样就不会依赖共享密钥之类的东西。不过你明白我的意思。
+任何拿到设备仿真工具包的人都能伪造描述符和设备信息。
+所以千万不要信任这些信息。
+
+接口授权
+---------
+
+也有类似的方法用于允许或拒绝特定USB接口。这允许只阻止USB设备的一个子集。
+
+授权接口::
+
+	$ echo 1 > /sys/bus/usb/devices/INTERFACE/authorized
+
+取消授权接口::
+
+	$ echo 0 > /sys/bus/usb/devices/INTERFACE/authorized
+
+也可以更改新接口在特定USB总线上的默认值。
+
+默认允许接口::
+
+	$ echo 1 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认拒绝接口::
+	$ echo 0 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认情况下，interface_authorized_default位为1。
+因此，所有接口默认都是授权的。
+
+注意：
+  如果要对一个未授权的接口进行授权，则必须通过将INTERFACE写入
+  /sys/bus/usb/drivers_probe来手动触发驱动程序进行探测。
+  对于使用多个接口的驱动程序，需要先对所有使用的接口进行授权。
+  之后应探测驱动程序。这样做可以避免副作用。
--
2.52.0

