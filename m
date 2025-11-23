Received: from mail-m1973174.qiye.163.com (mail-m1973174.qiye.163.com [220.197.31.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEBE4A35
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898983; cv=none; b=DUwYoGsTwuqYb8aa960AHbevlllm2oo4E2h1OcBjDss3JA4Cv2/QZXYD27bcfI8IzBZlLLUeGdizgVA+rkq5f9GSwMOr0/AXuR3rHdOfi4fIFoLmJIJ8xiRt8XTxg3CtKkAjf1IjvnHmI0wy1JtOB4Z15m9OQ4S/6mC7mG19wao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898983; c=relaxed/simple;
	bh=SD7vTJlaToGF3qr0EUmN8YsIHuwEKJitF+wZZd+nWc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TtKBSz2IGoIn6jWfv1sai0t63rAaCWUYqzE5WgsGkOj+JEXb1KvOO8eIyMTG5EYdUXcU5OqiHuoUXCDU7SFGHTaLBLYSuKYJmK4QyBn+J5vyboJv2a5sVmIs4H2L3B9MsWOlUP0muPz0HuC3mij+S+Bg/X9wOH3lwg+HFkrKldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=Y5xR5Z9d; arc=none smtp.client-ip=220.197.31.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="Y5xR5Z9d"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a902910a;
	Sun, 23 Nov 2025 19:56:11 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 21/25] docs/zh_CN: Add raw-gadget.rst translation
Date: Sun, 23 Nov 2025 19:56:19 +0800
Message-ID: <9ff959e88374d21d8277f71b6201f434381c4b44.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab092570d09d5kunm2b5c8c0429adde
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTElOVkJCSRpNTB8YSkgZGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Y5xR5Z9dUpMwu7aq2vlWup672WSOTpqA+UPQI7mpjSeYsudtzjaxd91ipjJYkQ3LuqTykdZPG+l0hHavVwzU2Vp8ntVkOvOi6wf3JfNzcy1BwtQVxcWEuCy/4pyrXh77Q2iKPR7Gg29BaQbvFoSBY7r8Ard9MQCEXNBXu/sCcIY8um26lVplIwvTrzP9xdHPjqkzfoXbi8aqVtGctqD31N7c15KH0pFpRX5SdhxT+dVT0jpm+25JSPF3wCebE5m/mzBQIXmz9/Zu2FjFzEPOHWm+g+o0qWfvv9nrlfXRCX6JPsPtW/PlrkyzfaAg2buYeBg6HkNLb4cSubveyCyrvQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=u9qg/h/An4kfdMAMKYhUeRooNR5uzSD6U56VUDEDygY=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/raw-gadget.rst into Chinese.

Update the translation through commit 68a1317412e1
("usb: raw-gadget: update documentation")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/raw-gadget.rst     | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/raw-gadget.rst

diff --git a/Documentation/translations/zh_CN/usb/raw-gadget.rst b/Documentation/translations/zh_CN/usb/raw-gadget.rst
new file mode 100644
index 000000000000..33ef5e10c27f
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/raw-gadget.rst
@@ -0,0 +1,91 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/raw-gadget.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+==============
+USB Raw Gadget
+==============
+
+USB Raw Gadget 是一个gadget驱动，允许用户态对gadget的通信过程进行低级控制。
+
+与其他gadget驱动一样，Raw Gadget通过USB gadget API实现USB设备。
+与大多数gadget驱动不同，Raw Gadget本身不实现任何具体USB功能，
+而是由用户态来实现这些功能。
+
+Raw Gadget目前严格用于调试，不应在生产环境中使用，可改用GadgetFS。
+
+通过配置选项 CONFIG_USB_RAW_GADGET 启用。
+
+和GadgetFS对比
+~~~~~~~~~~~~~~~~~~
+
+RawGadget与GadgetFS类似，但为用户态提供了更直接访问USBgadget层的能力。
+主要区别如下：
+
+1. RawGadget会将每一个USB请求都传递到用户态以获取响应，
+   而GadgetFS会根据所提供的描述符对部分USB请求进行内部响应。
+   注意，UDC驱动可能会自行响应某些请求并且永远不会将它们转发到gadget层。
+
+2. RawGadget允许对USB请求提供任意数据作为响应，
+   而GadgetFS会对所提供的USB描述符执行合理性检查。
+   这使得RawGadget适用于通过向USB请求提供畸形数据来进行模糊测试。
+
+3. RawGadget提供选择要绑定的UDC设备/驱动的方式，
+   而GadgetFS当前会绑定到第一个可用的UDC。
+   这允许多个RawGadget实例绑定到不同的UDC。
+
+4. RawGadget明确暴露关于端点地址和能力的信息。
+   这允许用户编写与UDC无关的gadgets。
+
+5. RawGadget使用ioctl作为接口，而不是基于文件系统的接口。
+
+用户空间接口
+~~~~~~~~~~~~~~~~~~~
+
+用户可以通过打开``/dev/raw-gadget``并发起ioctl调用来与RawGadget交互；
+详细内容请参考include/uapi/linux/usb/raw_gadget.h中的注释。
+多个RawGadget实例（绑定到不同的UDC）可以同时使用。
+
+RawGadget的典型使用场景：
+
+1. 通过打开``/dev/raw-gadget``创建一个RawGadget实例。
+2. 通过``USB_RAW_IOCTL_INIT``初始化该实例。
+3. 使用``USB_RAW_IOCTL_RUN``启动该实例。
+4. 在循环中发出``USB_RAW_IOCTL_EVENT_FETCH``以接收来自RawGadget的事件，
+   并根据需要实现的USB gadget类型对这些事件作出反应。
+
+注意，一些UDC驱动为端点分配了固定地址，因此不能在描述符中使用任意端点地址。
+然而，RawGadget提供了一种与UDC无关的方式来编写USBgadgets。
+一旦通过``USB_RAW_EVENT_CONNECT``（
+通过``USB_RAW_IOCTL_EVENT_FETCH``获取）收到连接事件，
+可以使用``USB_RAW_IOCTL_EPS_INFO``获取UDC驱动所具备的端点信息。
+在此基础上，用户态必须为gadget选择UDC的端点，并在端点描述符中相应地分配地址。
+
+RawGadget的使用示例和测试套件：
+
+https://github.com/xairy/raw-gadget
+
+内部实现细节
+~~~~~~~~~~~~~~~
+
+每一次RawGadget的端点读/写ioctl都会提交一个USB请求并等待其完成。
+这样设计是为了在覆盖率引导的模糊测试中，让一次系统调用完整处理一个USB请求。
+此特性必须在实现中保持。
+
+潜在的未来改进
+~~~~~~~~~~~~~~~~
+
+- 支持``O_NONBLOCK`` I/O。这将是另一种工作模式，
+  在该模式下RawGadget不会等待每个USB请求的完成。
+
+- 支持USB 3特性（启用端点时接受SS端点伴随描述符；允许为批量传输提供``stream_id``）。
+
+- 支持ISO传输特性（为已完成的请求暴露``frame_number``）。
-- 
2.52.0

