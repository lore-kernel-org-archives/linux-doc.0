Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EDC4C0433
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714466; cv=none; b=DRWLncPEYlg+zKLtpLwo5V5iBdHfYYgaXI0eq7fX/AAoYQX/n7InY7xqvqud4QrVOCzkK/+b+bIdjgov84tUAtb1nFU+QkuAIXT4V0SZwqVEA5SmGl0HE+BNdYLASVO88ZAlVfU0OyEZ1C7RGPO0CZ/afgSzHQQn7KfDlu47/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714466; c=relaxed/simple;
	bh=LB6mkfpwyuV7L4MLYcj5izjMBkynXBMZovzmhJA5To8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lFeyBoCMmsTZ8vfVPDxGMWgosXpExE3Br8rIdQU3n4FkeATD+/3C4fYrhieIYFtA+QiyLD/2CiZqf1t4M7/8hgzVvCj4Fb8dpTQVONSATXBKCykKHHEHOt8fv82BJs/1nkRwVdA7Rr8sFQ3959Ybz8yVzI3Zv3AL/ISSBc+zRQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtRnVNsX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtRnVNsX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so11042062a91.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784714460; x=1785319260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2FLl3EYq5a8O1kn/GPuHEqJed81QF0dAjbrMIW2Jus=;
        b=NtRnVNsXufbSQEiIgYMkXWJGDil1rq/O3wkgtHbvcYIHnQA7zbF18cp9ryZQI1dRLe
         Ry33/oSE+Qd7Xy0rjmI4sSDT2mdNq6NFfJ52YDc81MON2icQfrlLyD6gN27OEVxvMuXj
         pUijKI13UcOjcOeHACiEGJ1BYKccZ0HmPwDARfS0NxHeeNQJ3mUC4bNjLxDzYnfja5e2
         w1OTsX1uokDA0Bp/BJvp2EJUMqTNJqSNWXLJpg+vJLzBSc/yVr9WTS2xehxEj6bUR6fp
         6CI15ch6eX2fjDDV1SHyRpKFYTEBSirY3C2azh/xcHGvila20Av3VSf7guQP/qUNAaaP
         LhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714460; x=1785319260;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2FLl3EYq5a8O1kn/GPuHEqJed81QF0dAjbrMIW2Jus=;
        b=WEvsN98+lH+FFzball6UiM8glJXFBDnZXxc/c4c/m11nO3t4EZgkZqvIRM9csz+jxy
         hue/PB0mK933kNydlsSZUhGTaDW6qYShyL9DZc4GI7F4TjNK7rNrUXWm9MeWQDun3/QV
         dm2d7uW++J7OEzWaI9ctljMNn5aMRTP1gx20vQA7wUuAjfOGybyKUUq+eyK3xR5HtB/k
         0RJNgkjOKHm56hRM65e8ti102k0DIAGTnQ3BrNXL35Au7AQXNDxIzYHlfoNNf1Qu7BAh
         koQLSXrm/upS7I+EzInhAuAWMunHhisBLNuYHHxXy2N3j2wOcy/1YJYsh0XXLq39n14J
         zT8A==
X-Forwarded-Encrypted: i=1; AHgh+RpGZkiHUmAGrlXWoFJUKStAlDVQJZpz4qTgkzDqVYStgYFNScRWChh1YK5l/w9XWG5e6mBDjQmvmXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6XIK3rER4TtgNHvVOEzEzXdI+KpoGitGsmovXlelcW6HDYtih
	8GmLORTXPVd3mtWRh6RjXI+ZG1sTvNWaPtxgmijtfEyTul8X4aoyZjpU
X-Gm-Gg: AR+sD11/ls3MwXH1Ca0HcoqOUzfnRFjJRT3yVh2mPbdoaXGvCo83opkQwGYSrgqUXOa
	T1xvDZ7UKzTVZqcHfjI5x7Hf/aBIWRwF2MJrHDsARDSTr21HVMgbSNDrCg6yorE0+zqtT9RSTpZ
	+xjFSUL1FU2Yj2ncS5nBgkOIoozv5zr00KfDSdszLARx+iOX7kfBo5ojz3pf5pwqGo6uS05ByZP
	er58OKoOfsc6N39gHSU+tan6ovat7ciW9Uvp14czRpqQPwxV7Sl6fpWK1xyhReV9tC1mrNIz7YI
	dXVegLbvEhMCBIQLnBvghP/XuPNVdzXuT5e+QpuY5zdZhlyafzzJUhM3zRsGE7fqx0xEOjrebhz
	Sx3BWFVRoYGiEuT8h4D0FGz8utkkWBv50GgcnFnY5/fvFzBDQKpy39UN5jFio/H12RKaUEVVngx
	4HryiP+NKcpjRss5bJVDNKrBnNCiUAq4zwyAaRQeOBfip3BKo6aj5TYxcVryZfzm8pIblr/fBPk
	yr7LdLZGnFyVetBQsQOE4VihvLYKrTL1X7X99BqBaXcr5iGDfM=
X-Received: by 2002:a17:90b:180e:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-38e97f0ab08mr5103948a91.13.1784714460027;
        Wed, 22 Jul 2026 03:01:00 -0700 (PDT)
Received: from localhost.localdomain ([240e:391:eb4:a950:4453:203b:e14c:36ea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38eb2eb81d4sm189514a91.14.2026.07.22.03.00.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 03:00:59 -0700 (PDT)
From: cuishuang <imcusg@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	wangyuli@aosc.io,
	kezijie@leap-io-kernel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs/zh_CN: Add configurable error injection translation
Date: Wed, 22 Jul 2026 18:00:53 +0800
Message-ID: <20260722100053.71691-1-imcusg@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/block/error-injection.rst into Chinese and add
it to the Chinese block documentation index.

Update the translation through commit e8dcf2d142bd
("block: add configurable error injection").

Signed-off-by: cuishuang <imcusg@gmail.com>
---
v1->v2:
  - Add the required Assisted-by trailer.
  - Resend via authenticated SMTP because the original message was only
    partially delivered and did not reach the linux-doc archive.

 .../zh_CN/block/error-injection.rst           | 63 +++++++++++++++++++
 .../translations/zh_CN/block/index.rst        |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/block/error-injection.rst

diff --git a/Documentation/translations/zh_CN/block/error-injection.rst b/Documentation/translations/zh_CN/block/error-injection.rst
new file mode 100644
index 000000000000..91563ea055ba
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
+ cuishuang <imcusg@gmail.com>
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

