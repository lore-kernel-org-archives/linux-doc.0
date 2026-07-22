Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3311D63F0
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723569; cv=none; b=VB9qQuspJpXVZ8+4aktpCb4wfexP9Qa1/x5qVlJOc2A34CAoNxEaaMRDut/w73bx10EL7seGWq9DmL1mPkay1auhqWS1FK7PN32lTFbGe5co9oeIoodgXIzNu75br+AzyykT8AI7Gi59Jstx+EwESfrYUYeDiomTOoINATTEFEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723569; c=relaxed/simple;
	bh=aQJgPOFPZ9JoQML28absNKd4L8mV6PpZA3gD6v063Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WbYnBgPsTmxQYCvpazMb9jJ8qjljk7ENVz2/LtvtUWZ6XbWa70J2WakxacH0/PeQ9HLXtbly7zcqQM2PZKdo1WdGoVxU0AqMHuE5nqYg6wgX1fmo7m9VpVJwMlljN9Vv1dxX9IIprvUwz2EK41aH5rcP9eHR4OwN0Kyc/r1rZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlg+KBBg; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlg+KBBg"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so11654741a91.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723568; x=1785328368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CK2ZLWyf+muvl8psJScyhh6NfjeFwxv4Xz+rzjTylvQ=;
        b=jlg+KBBg15wv1VblnOjdFi1Zdyu9zOWy0J3RFv6tIVJkso6D99z3bMp3gCm+XVI+z0
         3MbePdIzQ0aKEh2ZnY8FzWv811X1gdc893ay5ktql9D897qJhrClb0sv7XiPLIR9ZiLH
         2NE8nyIXndAJrVa164q9IillPmEyilAmqkwx/ZocZDnGF2xwStwgup9vUtrXRwcAayU3
         cWODRFLGvmyDvPagy/R0geM5pmKHMZtZRLaWzzBLMwFT4eBngxOgNwMht5ziufwzng2R
         mET3FY0DuNe2NZFxlrqTkdg4rk7Ve8UNLTwUMIkk8efIkzRo0GY+AonsUmXVeWFJnPMj
         0oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723568; x=1785328368;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CK2ZLWyf+muvl8psJScyhh6NfjeFwxv4Xz+rzjTylvQ=;
        b=U39ZkDsfC84CpastNhoMlAMdT85yrVBdS6pXvrUgsSIPo/0zteymJqjayg03MyCKj+
         5biP8CcmxE5cfk68RITd6KJCO7ESgRK44rg7BviojpDN57eG8aVJpSP/xrao6qjHjdql
         evUceLSiWMP39lP0fEmk9uLfeLBM2Edifo03hW8xS7oK4QNJK8TCMuF+JGNAi/e1yH4t
         OgaKXpHRuMynJt7LYMZENHLPEM6JHLmAtE3cD8vuxIoZXddGWJfsWU+1clPZhfqAjJL1
         hZcgWaWnqV8Lk76BumdHTOix1cT1RDumAn9X6qZv9p0dqctMOPchHDo40QJr4G+4kdUs
         yvCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp40RxS+Pp00LSDPW6oPzBjoOIM4oydZQlEQPg9pw2YHRpnMR2YCmcOqqWtb9PNhwxSYW7bhYRmdAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLt9ChuG3PQiTpBHGCxg+0HDw6yqXawt32H7J60VckGI/f36hU
	SrYl9YrFBVaa7zFDfNSvHaDuBSsg7m2Q2R5sEnLUN3ZIxUwhmKNfRCpsS6KvV+0s
X-Gm-Gg: AR+sD11kjcUsxCmzH5T9bUQZ7lu7vMQuwqzTg/Q4SE3MxaYJViz+xbFeOzGoi3KieKp
	D9xYNV67LYapzep10TZxAcwIYnujvJWXprYGfxCe/GK4K/cjI5cnQUF3o+kKErEzDo/tZm7FI0A
	GZ0el/yIBozWLJQeahMMqy/7XxAh3yXN7kUKmMvFiNhcAQ6mHB12R5yzW0rMxy5UqhnEdtfP0Mb
	azwkSYs77lEfz51rrd7PKHqGzgEKKsbFKqh1oawgRZCWX5QAtZYSALSP6mWs+L1cZ19QFOg7Sjb
	RBFUahwr5oElNMz8OML5hII31MZY4kMytw+f5gyXk7+ZbVlXb4hyMnaSIqK7DioXKsdZcKXNPfz
	WkeYZpZ9t0PIKRohClrWxfIkimofWcmo0hQJ6dJhgWvJccXDDOWDI+GhNQdIZGTwMG/1bxyqhBd
	tw5WDqhyWfWRR7vmkfbdBPQxGAgMN08KL24Ey81/Y0lhSPaQtrDq10TsLCf7XMBu++KMgVaj57U
	P1UcQN9NHlWhNBBOThA4yimMTCO3R6kNLFhR0vuR35jpw==
X-Received: by 2002:a17:90b:2703:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38e4b53898fmr22746726a91.26.1784723567659;
        Wed, 22 Jul 2026 05:32:47 -0700 (PDT)
Received: from localhost.localdomain ([240e:391:eb4:a950:65e6:ca6f:2b58:5ba8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38eb016cffcsm503692a91.2.2026.07.22.05.32.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 05:32:47 -0700 (PDT)
From: cuishuang <imcusg@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	wangyuli@aosc.io,
	kezijie@leap-io-kernel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cui Shuang <imcusg@gmail.com>
Subject: [PATCH v3] docs/zh_CN: Add configurable error injection translation
Date: Wed, 22 Jul 2026 20:32:40 +0800
Message-ID: <20260722123240.22979-1-imcusg@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cui Shuang <imcusg@gmail.com>

Translate Documentation/block/error-injection.rst into Chinese and add
it to the Chinese block documentation index.

Update the translation through commit e8dcf2d142bd
("block: add configurable error injection").

Assisted-by: Codex:gpt-5
Signed-off-by: Cui Shuang <imcusg@gmail.com>
---
v2->v3:
  - Add the missing Assisted-by trailer to the commit message.
  - Use "Cui Shuang" consistently as the contributor name.

v1->v2:
  - Resend via authenticated SMTP after the original message was only
    partially delivered and did not reach the linux-doc archive.

 .../zh_CN/block/error-injection.rst           | 63 +++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/block/error-injection.rst

diff --git a/Documentation/translations/zh_CN/block/error-injection.rst b/Documentation/translations/zh_CN/block/error-injection.rst
new file mode 100644
index 000000000000..63aac2fb38f8
--- /dev/null
+++ b/Documentation/translations/zh_CN/block/error-injection.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/block/error-injection.rst
+
+:翻译:
+
+ Cui Shuang <imcusg@gmail.com>
+
+==============
+可配置错误注入
+==============
+
+概述
+----
+
+可配置错误注入允许针对块设备的扇区范围注入特定的块层状态码。错误可以无条件
+注入，也可以按给定概率注入。
+
+要使用可配置错误注入，必须启用 ``CONFIG_BLK_ERROR_INJECTION``。
+
+唯一的接口是 ``error_injection`` debugfs 文件，每个已注册的 gendisk 都会
+创建该文件。写入此文件用于创建或删除规则，读取则返回当前错误注入点的列表。
+
+选项
+----
+
+以下选项指定操作：
+
+===================	=======================================================
+add			添加一条新规则
+removeall		删除所有现有规则
+===================	=======================================================
+
+以下选项指定 ``add`` 操作的规则详情：
+
+===================	=======================================================
+op=<string>		此规则适用的块层操作。它使用每个 ``REQ_OP_XYZ``
+			操作中的 ``XYZ``，例如 ``READ``、``WRITE`` 或
+			``DISCARD``。必填。
+status=<string>		要返回的状态。它使用每个 ``BLK_STS_XYZ`` 状态码
+			中的 ``XYZ``，例如 ``IOERR`` 或 ``MEDIUM``。必填。
+start=<number>		此规则适用的第一个块层扇区。可选，默认为 0。
+nr_sectors=<number>	此规则适用的扇区数。可选，默认覆盖设备的剩余部分。
+chance=<number>		仅以 ``1/chance`` 的概率返回失败。可选，默认为 1
+			（总是失败）。
+===================	=======================================================
+
+示例
+----
+
+对 ``/dev/nvme0n1`` 扇区 0 的读取，每 10 次中有一次返回
+``BLK_STS_IOERR``：
+
+	$ echo 'add,op=READ,start=0,status=IOERR,chance=10' > /sys/kernel/debug/block/nvme0n1/error_injection
+
+对 ``/dev/nvme0n1`` 的每次写入都返回 ``BLK_STS_MEDIUM``：
+
+	$ echo 'add,op=WRITE,start=0,status=MEDIUM' > /sys/kernel/debug/block/nvme0n1/error_injection
+
+删除 ``/dev/nvme0n1`` 的所有规则：
+
+	$ echo 'removeall' > /sys/kernel/debug/block/nvme0n1/error_injection
diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
index f2ae5096ed68..4877432cc4ff 100644
--- a/Documentation/translations/zh_CN/block/index.rst
+++ b/Documentation/translations/zh_CN/block/index.rst
@@ -18,6 +18,7 @@ Block
 
    blk-mq
    data-integrity
+   error-injection
 
 TODOList:
 * bfq-iosched
-- 
2.50.1 (Apple Git-155)

