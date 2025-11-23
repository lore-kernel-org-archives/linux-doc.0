Received: from mail-m49224.qiye.163.com (mail-m49224.qiye.163.com [45.254.49.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6774A35
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898976; cv=none; b=fIVNdoMyZfpV6J05i3ZOrbdLKDXByYdSaSerrSIsd5RhTLYzyxq7wBZv/JzM2Hyh/+tyctWtfnhuoPvhVfajEsxWf9kOIjB63Q7t5azTwFyJK1HcT2TGJniwObsrbxR/jpyYDFk8U9qypes968/kcMkV5h9MYl2RcxE547FCN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898976; c=relaxed/simple;
	bh=k+dki6aLl8ur8Jy8UVhCWa+mnXgFjI5i7tL9MW4gj3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lFtWXjgofeA1PrfVeWbdfuMn4/7RdzieQVlfJBer8y5JreaDOpw7qEiWQ2DyIVBdzHk3rjk63+GZTjtcqYtM0tbog27cusxpD873hFRD0BqAbuNkpkJzhLcNVsGMnyPkS7ZFj7YF1+gkBtM0wEhuDiwgSf6glL66fd83aiYZ7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=nByss7ZO; arc=none smtp.client-ip=45.254.49.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="nByss7ZO"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a90290fb;
	Sun, 23 Nov 2025 19:56:03 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 11/25] docs/zh_CN: Add gadget_multi.rst translation
Date: Sun, 23 Nov 2025 19:56:09 +0800
Message-ID: <1138630f7d4ce34d2f7df481b2df08fbec342bea.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab09236a609d5kunm2b5c8c0429adb4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE4eVhpLH0lOTRpPSkJMH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=nByss7ZOACVUoU57MaMh6n7VBIg5OT1z69Te1IPHFk/l8xaKG0LXqXpjNQlBNBEb7Bd6SrUs7y8yZSU7HsvrrKBNWGPHs/jOsfNJOsIHOi8ReXwTGsHBs94fvphEdake4Mo9iLV3us7g5zZFBGlQPZpFkIlcHU+QkhTPD9/4Ttn2F2q88Wh7dddPHs61ngooEvYBaR/w1BvulikLDy0nMaOy+mWPHSJbO8PElB4m81HEZ0wgAIpLaX2l7bDk7V6JWi7D+N1ABIzwlcAb6KpO6CJxB1pfjxeqbjuplxnGdR1rlBUc4Y6I1FILL9+p0yW0HsvCX5SF1k/bIaZZGjLRlw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=bh6Mkwx+dsM8ptYAfdX7IqQhQusuaqdvwtvjPebRk4c=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/gadget_multi.rst into Chinese.

Translate .../usb/gadget_multi.rst into Chinese.
("Documentation: USB: correct possessive "its" usage")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/gadget_multi.rst   | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_multi.rst

diff --git a/Documentation/translations/zh_CN/usb/gadget_multi.rst b/Documentation/translations/zh_CN/usb/gadget_multi.rst
new file mode 100644
index 000000000000..cff16e89b9b4
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/gadget_multi.rst
@@ -0,0 +1,154 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/gadget_multi.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+======================
+多功能复合 Gadget
+======================
+
+概述
+====
+
+多功能复合 Gadget（或称 g_multi）是一个复合 Gadget，
+它充分利用复合框架来提供多功能设备。
+
+在其标准配置中，它提供一个 USB 配置，包含 RNDIS[1]（即以太网）、
+USB CDC[2] ACM（即串口）以及 USB 大容量存储功能。
+
+通过 Kconfig 选项，可以启用 CDC ECM（以太网）功能，同时可关闭 RNDIS。
+如果两者都启用，则 Gadget 将有两个配置——一个带 RNDIS，另一个带 CDC ECM[3]。
+
+请注意，如果使用非标准配置（即启用 CDC ECM），可能需要更改厂商 ID 和/或产品 ID。
+
+主机驱动
+========
+
+要使用该 Gadget，需要在主机端让它正常工作——
+否则 Gadget 无法发挥作用。
+如预期的那样，具体操作因系统而异。
+
+Linux 主机驱动
+--------------
+由于该 Gadget 使用标准复合框架并在 Linux 主机上显示为复合设备，
+Linux 主机端无需额外驱动。所有功能均由各自的驱动处理。
+
+对于两个配置的设置（以 RNDIS 配置为第一个配置）也是如此。
+Linux 主机会使用带 CDC ECM 的第二个配置，在 Linux 下通常效果更好。
+
+Windows 主机驱动
+--------------------
+
+要在 Windows 下使用该 Gadget，需要满足两个条件：
+
+作为复合 Gadget 检测
+^^^^^^^^^^^^^^^^^^^^^^^^
+首先，Windows 需要将 Gadget 检测为 USB 复合设备，这本身有一些条件[4]。
+满足这些条件后，Windows 会使用 USB 通用父驱动（USB Generic Parent Driver）[5] 处理设备，
+然后尝试为每个接口匹配相应的驱动（大致如此，不必深入细节）。
+
+好消息是：大部分条件你无需担心！
+
+唯一需要注意的是 Gadget 必须只有一个配置，因此双 RNDIS 和 CDC ECM 的 Gadget
+除非创建合适的 INF 文件，否则无法工作——当然，如果你提交了 INF 文件的话！
+
+为每个功能安装驱动
+^^^^^^^^^^^^^^^^^^^^
+
+另一个更棘手的问题是让 Windows 为每个独立功能安装驱动。
+
+对于大容量存储，这是简单的，因为 Windows 会检测它是 USB 大容量存储类接口，
+并选择合适的驱动。
+
+RNDIS 和 CDC ACM 则比较复杂。
+
+RNDIS
+.....
+
+为了让 Windows 为 Gadget 的第一个功能选择 RNDIS 驱动，
+需要使用本文档提供的 [[file:linux.inf]] 文件。
+它将 Windows 的 RNDIS 驱动“绑定”到 Gadget 的第一个接口。
+
+请注意，在测试过程中，如果 RNDIS 不是第一个接口，可能会遇到一些问题[6]。
+除非你在开发自己的 Gadget，否则无需担心此问题。
+
+CDC ACM
+.......
+
+同样，[[file:linux-cdc-acm.inf]] 文件用于 CDC ACM。
+
+自定义 Gadget
+................
+
+如果你打算修改 g_multi Gadget，请注意重新排列功能会改变每个功能的接口号。
+因此提供的 INF 文件将无法使用，因为接口号已硬编码（不过修改并不困难[7]）。
+
+这也意味着，在实验 g_multi 并修改提供的功能后，
+应更改 Gadget 的厂商 ID 和/或产品 ID，
+以避免与其他自定义 Gadget 或原始 Gadget 冲突。
+
+不遵循此建议可能会导致长时间调试无果，最终发现 Windows 缓存了某些驱动信息
+（更换 USB 端口有时有帮助，或者使用 USBDeview[8] 删除虚拟设备）。
+
+INF 测试
+........
+
+提供的 INF 文件已在 Windows XP SP3、
+Windows Vista 和 Windows 7（32 位版本）测试过。
+应能在 64 位版本上工作。
+在 Windows XP SP2 之前的系统上可能无法使用。
+
+其他系统
+--------
+
+目前尚未测试其他系统的驱动。
+考虑到 macOS 基于 BSD，BSD 是开源系统，
+理论上应能直接工作（读作：“我不确定是否能”）。
+
+对于其他较为小众的系统，我更无可奉告……
+
+任何测试和驱动都欢迎贡献！
+
+Authors
+=======
+
+本文档由 Michal Nazarewicz 编写
+([[mailto:mina86@mina86.com]])。
+INF 文件在 Marek Szyprowski ([[mailto:m.szyprowski@samsung.com
+]])
+和 Xiaofan Chen ([[mailto:xiaofanc@gmail.com]]) 的支持下修改，
+基于 MS RNDIS 模板[9]、Microchip 的 CDC ACM INF 文件以及
+David Brownell ([[mailto:dbrownell@users.sourceforge.net]]) 的原始 INF 文件。
+
+脚注
+====
+
+[1] 远程网络驱动接口规范（Remote Network Driver Interface Specification），
+[[https://msdn.microsoft.com/en-us/library/ee484414.aspx]].
+
+[2] 通信设备类抽象控制模型（Communications Device Class Abstract Control Model），
+该 USB 类及其他类规范可查阅
+[[http://www.usb.org/developers/devclass_docs/]].
+
+[3] CDC 以太网控制模型（CDC Ethernet Control Model），
+[[https://msdn.microsoft.com/en-us/library/ff537008(v=VS.85).aspx]].
+
+[4] [[https://msdn.microsoft.com/en-us/library/ff537109(v=VS.85).aspx]]
+
+[5] [[https://msdn.microsoft.com/en-us/library/ff539234(v=VS.85).aspx]]
+
+[6] 换句话说，Windows 对任何用户输入都未作响应。
+
+[7] 你可能会发现 [[http://www.cygnal.org/ubb/Forum9/HTML/001050.html]]
+有用。
+
+[8] https://www.nirsoft.net/utils/usb_devices_view.html
+
+[9] [[https://msdn.microsoft.com/en-us/library/ff570620.aspx]]
-- 
2.52.0

