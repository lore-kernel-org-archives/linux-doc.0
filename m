Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com [220.197.31.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646A136E3B
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 05:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737611642; cv=none; b=sA1teUfL7nMI7jOtiLijzEvJyYiu7A5eJst9QQpReXP9YxNgJPJAdtJTcdMrdQ3kE41oUIcUtQ2AWFXnTfuGjRRiNy6a5esgOKl9zKy702OUetf11jsIdnRLB465Rv4hCgb4EJcMsSloHla0fKegQC9xjBxnApoogOC3gXlFlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737611642; c=relaxed/simple;
	bh=9Q7FF9CnJ8EmVeQ2B2wyefgqt9hngsjWg4bIHjB9bwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZE3ILfxBLLStGDlqymRJESCwMVb7BDNdLKdAiCjGaexTN+oUIyO46GliufFgFI4rvbHMdVJ8U5002gQZdOaItysFLhG1Aipz0xKw8GTGC5fGuzgZPUGGR7WzSwps+nXpaPCWFkcHMpq+6JM1vDD3lxs7TuDx5nIMB4xw1CvelCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=hNMqLwvJ; arc=none smtp.client-ip=220.197.31.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="hNMqLwvJ"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 979244f6;
	Thu, 23 Jan 2025 13:18:30 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 5/7] docs/zh_CN: Add tpm tpm_vtpm_proxy Chinese translation
Date: Thu, 23 Jan 2025 13:17:43 +0800
Message-ID: <f9798eaec76b27cc02fa47970bf623879377d422.1737603330.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCT09DVh1OGh1DHxgZSkNNSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a949198fe5b09d0kunm979244f6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pkk6EDo6FjIQHi0pMBhKSxgc
	I0owFA9VSlVKTEhMTUtCTkpKT01MVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUhPS0g3Bg++
DKIM-Signature:a=rsa-sha256;
	b=hNMqLwvJcaCk7T6ltO2ycTlThXg3No9JzcS3gOHYf4dJiJHUUqvrqxi+t5LTKz3nmdsrv+NgPF0Chz1uNj4loL6s6cSX5MTpwjZDIV1mi2Fdx+tkgoTPGTdIIG9IWBJThymJLqZE5r8GBaO7Fcv8hGOvVbf5f+O7/WfOeJPBN1E=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=bBR9gV1n0H6Bv+46rqxXTjFURNjwYRky+PIaNzKKsd4=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/tpm_vtpm_proxy.rst into Chinese.

Update the translation through commit 799a545bb938
("tpm: move documentation under Documentation/security")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst |  2 +-
 .../zh_CN/security/tpm/tpm_vtpm_proxy.rst     | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
index 4ee8881a41a4..dd80816f8af8 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -15,8 +15,8 @@
    tpm_event_log
    tpm-security
    tpm_tis
+   tpm_vtpm_proxy
 
 TODOLIST:
-*   tpm_vtpm_proxy
 *   xen-tpmfront
 *   tpm_ftpm_tee
diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
new file mode 100644
index 000000000000..bc92cfb684c3
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/tpm_vtpm_proxy.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+==========================
+Linux容器的虚拟TPM代理驱动
+==========================
+
+| 作者：
+| Stefan Berger <stefanb@linux.vnet.ibm.com>
+
+本文档描述了用于Linux容器的虚拟可信平台模块（vTPM）代理设备驱动。
+
+介绍
+====
+
+这项工作的目标是为每个Linux容器提供TPM功能。这使得程序能够像与物理系统
+上的TPM交互一样，与容器中的TPM进行交互。每个容器都会获得一个唯一的、模
+拟的软件TPM。
+
+设计
+====
+
+为了使每个容器都能使用模拟的软件TPM，容器管理栈需要创建一对设备，其中
+包括一个客户端TPM字符设备 ``/dev/tpmX`` （X=0,1,2...）和一个‘服务器端’
+文件描述符。当文件描述符传被递给TPM模拟器时，前者通过创建具有适当主次
+设备号的字符设备被移入容器，然后，容器内的软件可以使用字符设备发送TPM
+命令，模拟器将通过文件描述符接收这些命令，并用它来发送响应。
+
+为了支持这一点，虚拟TPM代理驱动程序提供了一个设备 ``/dev/vtpmx`` ，该设备
+用于通过ioctl创建设备对。ioctl将其作为配置设备的输入标志，例如这些标志指示
+TPM模拟器是否支持TPM1.2或TPM2功能。ioctl的结果是返回‘服务器端’的文件描述符
+以及创建的字符设备的主次设备号。此外，还会返回TPM字符设备的编号。例如，如果
+创建了 ``/dev/tpm10`` ，则返回编号（ ``dev_num`` ）10。
+
+一旦设备被创建，驱动程序将立即尝试与TPM进行通信。来自驱动程序的所有命令
+都可以从ioctl返回的文件描述符中读取。这些命令应该立即得到响应。
+
+UAPI
+====
+
+该API在以下内核代码中：
+
+include/uapi/linux/vtpm_proxy.h
+drivers/char/tpm/tpm_vtpm_proxy.c
+
+函数：vtpmx_ioc_new_dev
-- 
2.47.1

