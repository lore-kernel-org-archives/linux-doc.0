Received: from mail-m3273.qiye.163.com (mail-m3273.qiye.163.com [220.197.32.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0752989B7
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763884846; cv=none; b=ec6SNyEnktNl2Zjyb0gmENUuUDWL5JXk4B4GuNX4rE1+6HLfJ3dPsM+Vz8qfjM6HrM60528SzkYqkpOF8VfppAhXveA4xJC5bCdFOiQe/6xXjaMUEhNZmMPtIHXWQ7hSp/q4jTXaJqxVMVITm46ncVsewJpOi0vUleHv+jZblLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763884846; c=relaxed/simple;
	bh=l53QICStTxLZQLlCexeDsGTac90GbXNjDtHUS6TnNdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzvMcLbmpaxmoVrF/r9SmV5JMZxYgxdHh6ujmZ7RgG3hBwXaSwXoy9y1hfGHENSDOrwaalfs34wlA2sVDQSjbDVSKeMcuZxkBI+EqBSiahgqJ83eT/8EeAKG4SCx4SA9DUZVbhvHlMEhhOaWzHLhQs6DpSaj6wR+qnMAfLuoe80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=p9F5rFN4; arc=none smtp.client-ip=220.197.32.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="p9F5rFN4"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99c4;
	Sun, 23 Nov 2025 15:45:24 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 16/25] docs/zh_CN: Add iuu_phoenix.rst translation
Date: Sun, 23 Nov 2025 15:45:31 +0800
Message-ID: <20251123074540.34161-17-baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
References: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafacbcca09d5kunm0cca7198286657
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQhkdVkNKSUNMHU9JGB8YS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=p9F5rFN4zkJ9Z6JgPoC75w0xMnenDYGAocI5iJTb0VAfr7ZK5vwxabGRbdWsRn0fs297bdXu5I4jtqKttifLVZTxKcYpkN9KsgKnLIwSXgbTPn+cnjQbyqX4Hn15MSi5hTMunuYK2xkAmpi5TSFrN/beICeIoYSHZYgGifWkBjRaF5ZaVbpSot/tnlTfkyPaAiGsx49oSWqz4RjvRIXP3hyhwMc0uEIBHniQOPYo8aYQyr445jNtpUkP1KPpjM+iVWXdgZf9DBDMkmxGOt0aK7Bz3mUcFDwr93SzLMcepbCqhOTr8OKjIr7luk9aRsSia6DdCzjo86F0AguQ//RaUQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=mgCg0Spk0yFa/rcsmd6y0N+erb5tbw+wyNHOwv4/Zes=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/iuu_phoenix.rst into Chinese.

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/iuu_phoenix.rst    | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/iuu_phoenix.rst

diff --git a/Documentation/translations/zh_CN/usb/iuu_phoenix.rst b/Documentation/translations/zh_CN/usb/iuu_phoenix.rst
new file mode 100644
index 000000000000..f86eef3f16d6
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/iuu_phoenix.rst
@@ -0,0 +1,100 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/iuu_phoenix.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+====================================
+Infinity Usb Unlimited 说明文档
+====================================
+
+大家好，
+
+该模块提供一个串行接口，用于在Phoenix模式下使用你的IUU设备。
+加载此模块后，会生成一个ttyUSB[0-x]接口。
+你需要使用自己喜欢的应用程序来控制IUU设备。
+
+该驱动仍处于测试阶段，因此可能存在漏洞，你的系统可能会冻结。
+据我所知，我自己使用时从未遇到问题，但我并不是专家，
+因此如果你的系统不稳定，请不要责怪我。
+
+你可以连接多个IUU设备，
+每个设备都有自己的设备文件（/dev/ttyUSB0、/dev/ttyUSB1……）。
+
+
+
+如何调节读卡器速度？
+======================
+
+可以在加载模块时使用一些参数。
+要使用参数，请先卸载已加载的模块，然后使用以下命令::
+
+    modprobe iuu_phoenix param=value
+
+如果是预编译模块，可以使用::
+
+    insmod iuu_phoenix param=value
+
+示例：::
+
+	modprobe iuu_phoenix clockmode=3
+
+ 参数包括：
+
+clockmode:
+	1=3Mhz579,2=3Mhz680,3=6Mhz (int)
+boost:
+	超频提升百分比 100 到 500 (int)
+cdmode:
+	卡检测模式
+	0=none, 1=CD, 2=!CD, 3=DSR, 4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING (int)
+xmas:
+	是否启用xmas彩色 (bool)
+debug:
+	是否启用调试 (bool)
+
+-  clockmode 提供三种不同的基础设置，通常由不同软件采用：
+
+	1. 3Mhz579
+	2. 3Mhz680
+	3. 6Mhz
+
+-  boost 提供了一种超频读卡器的方式（我的最爱 :-)）。
+   例如，要比单纯的clockmode=3获得更高性能，可以使用：
+
+      modprobe boost=195
+
+   这会将读卡器基频设置为3Mhz579，但提升195%！
+   实际频率将为6979050 Hz（6Mhz979），速度比单纯的clockmode=3提高约10-20%！
+
+
+-  cdmode 可设置用于通知用户空间（ioctl响应）卡是否存在的信号。有八种信号可选。
+
+-  xmas 完全无用，只是为了你的视觉效果。这是我的一个朋友，
+   他很难过拥有像iuu这样好的设备却看不到所有可用的颜色范围。
+   所以我添加了这个选项，允许他看到很多颜色（每次活动都会随机改变颜色
+   和频率）
+
+-  debug 会生成大量调试信息。
+
+
+最后说明
+========
+
+无需担心串口设置，串口模拟是抽象的，
+因此任何速度或奇偶校验设置都可以工作（不会改变任何行为）。
+以后我可能会利用这些设置来计算boost，但这个功能真的有必要吗？
+
+自动检测功能使用串口CD。如果软件不支持该功能，请在软件中禁用检测机制。
+
+祝你使用愉快！
+
+ Alain Degreffe
+
+ eczema(at)ecze.com
--
2.34.1

