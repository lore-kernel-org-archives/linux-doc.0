Received: from mail-m15593.qiye.163.com (mail-m15593.qiye.163.com [101.71.155.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3C423F405
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898968; cv=none; b=ty1AAUOrBI4S25k1b0PnR+6nHKye54jnGlAHyaVbR0sFgNRtLIZO8YVlbgsnVCF2iC1Kdf1aKXjoa+DpVKwWxeBEdBVF7/QEIyE5wHWjM1mcb5CW3ADZyAPaKHYLeATO03V2zzI9qYfsc+hlXDXIZEnkxgxosB4IEA5faYkcQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898968; c=relaxed/simple;
	bh=gx5HjG3/Bs72/hKL5rzmTgc8K7fVbh7NCoNyXzKUT44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVHlxSsgiFmmyNkzUKeWpXPyq6pk4a3pNhbzlmgMix6eI+rc5pEZO5qnK0tL620woctakp/pdFYjXCfxU1D+K3J/2HSEjZVvTwjo361kzgf8mRMG8eVr930ns+SFY3bplq1bAPuiyCUpt0NdImGA6wYjYoMJdsjz/ezokutkmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=LOFdd2v7; arc=none smtp.client-ip=101.71.155.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="LOFdd2v7"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a90290f2;
	Sun, 23 Nov 2025 19:55:56 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 03/25] docs/zh_CN: Add authorization.rst translation
Date: Sun, 23 Nov 2025 19:56:01 +0800
Message-ID: <e8b70f993cb7356ea80e2979b64596d218240afa.1763897036.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763897036.git.baikefan@leap-io-kernel.com>
References: <cover.1763897036.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab0921c1a09d5kunm2b5c8c0429ad8d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSxoaVh8YHUIeT0JNQk4YS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=LOFdd2v7oIAgu/OvpBgcZBigoA1mnDfw5I3YXcOuJnCKm7pqBZxf3dr8fWnyi3pfei8h3NhwMemGybf/RuE5i/YeD3xNR5mFDvfCYHsWweLQ2RaMY3ulqX/FJtQV1bIi4DAzQtf1mP0r6IiqkVJjgku3C3OJexXB2AeOSh/mnZ6Kqyl7KyT06bRtey//YSgFGnU0WH6AFs199zKXJ5Yr/oTR4qd4c8EiMKrDilBp8ROy+YsJ3QdvejADk6SheJvcSn529Nk1fJCcshQA1UT0q9eEa3r7tzQSBGgq3CPn5r6nzJJoqQCf2tRWMB5KxkggrQtJCpOPPP2k264ffGk88g==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=dU0K6YdD7thuGhUZqQUje/Np0RgCMShp7U5FXoOErN4=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/authorization.rst into Chinese.

Update the translation through commit f176638af476
("USB: Remove Wireless USB and UWB documentation")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/authorization.rst  | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst

diff --git a/Documentation/translations/zh_CN/usb/authorization.rst b/Documentation/translations/zh_CN/usb/authorization.rst
new file mode 100644
index 000000000000..6d5569f3f419
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
+目前为止，当USB设备连接时，它会被配置，其接口会立即对用户开放。
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
+假设你想实现一个锁定功能，使得只有类型为XYZ的设备可以连接
+（例如，它是一个带有可见 USB 端口的自助服务终端）::
+
+  启动系统
+  rc.local ->
+
+   for host in /sys/bus/usb/devices/usb*
+   do
+      echo 0 > $host/authorized_default
+   done
+
+将一个脚本挂接到udev，用于新 USB 设备::
+
+ if device_is_my_type $DEV
+ then
+   echo 1 > $device_path/authorized
+ done
+
+
+现在，device_is_my_type() 就是实现锁定的关键所在。
+仅仅检查class、type 和 protocol是否匹配某个值，
+是最差的安全验证方式（但对于想要破解的人却是最容易的）。
+如果你需要真正安全的方案，应使用加密、证书认证等手段。
+一个针对存储密钥的简单示例::
+
+ function device_is_my_type()
+ {
+   echo 1 > authorized		# temporarily authorize it
+                                # FIXME: make sure none can mount it
+   mount DEVICENODE /mntpoint
+   sum=$(md5sum /mntpoint/.signature)
+   if [ $sum = $(cat /etc/lockdown/keysum) ]
+   then
+        echo "We are good, connected"
+        umount /mntpoint
+        # Other stuff so others can use it
+   else
+        echo 0 > authorized
+   fi
+ }
+
+
+当然，这种做法很简陋；你实际上应该使用基于PKI的真正证书验证，
+这样就不会依赖共享密钥之类的东西。不过你明白我的意思。
+任何拿到设备仿真工具包的人都能伪造描述符和设备信息。
+千万不要信任这些信息。
+
+接口授权
+---------
+
+也有类似的方法用于允许或拒绝特定 USB 接口。这允许只阻止 USB 设备的一个子集。
+
+授权接口::
+
+	$ echo 1 > /sys/bus/usb/devices/INTERFACE/authorized
+
+取消授权接口::
+
+	$ echo 0 > /sys/bus/usb/devices/INTERFACE/authorized
+
+新接口在特定 USB 总线上的默认值也可以更改。
+
+默认允许接口::
+
+	$ echo 1 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认拒绝接口::
+	$ echo 0 > /sys/bus/usb/devices/usbX/interface_authorized_default
+
+默认情况下，interface_authorized_default 位为 1。
+因此，所有接口默认都是授权的。
+
+注意：
+  如果一个未授权的接口将被授权，则必须通过将INTERFACE写入
+  /sys/bus/usb/drivers_probe来手动触发驱动程序探测。
+  对于需要多个接口的驱动程序，所有需要的接口应先被授权。
+  之后应探测驱动程序。这样可以避免副作用。
-- 
2.52.0

