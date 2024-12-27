Received: from mail-m12748.qiye.163.com (mail-m12748.qiye.163.com [115.236.127.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACEF154C07
	for <linux-doc@vger.kernel.org>; Fri, 27 Dec 2024 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735289053; cv=none; b=Fkgubx858EkrxqcH5ZHjffQJdsL4E6u2HNh/qxM82EtMr319gnF2Uep1zBGB0Qj8iwFl/ftCYZYJbRw4HFL1+JJxVwxGVbE3tSJ2Mv+KqQNQhEnAjjL1aO+Ik1XEYi/ZRig1bpOTi83Qvsl1LQs9XpYlXnDUlAdAKXJuZM/pzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735289053; c=relaxed/simple;
	bh=6sCxE+m9I4hJIg8EyGrMQRtUSzsM/aJ1HrVdoiLHxRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iB9NxgY7z84X469iqGlb7mMRMz8fRGrCV08W7RLfgv8fQzRuExF8yDnit/0jbtac1AjkkMZwnAEG3MiopoTOPJD4vgYA+E9sG6yxRxSDa2p41e56u+ZsD+ltAdMlXBkT5qbIcJpFKiN7VmDKvilNVGHJsS5MROn2jiNTwQbAIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Hgy9W2uz; arc=none smtp.client-ip=115.236.127.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Hgy9W2uz"
Received: from fedora.localdomain (unknown [1.198.31.205])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6fd327f9;
	Fri, 27 Dec 2024 16:28:42 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Subject: [PATCH] docs/zh_CN: Add security digsig Chinese translation
Date: Fri, 27 Dec 2024 16:28:18 +0800
Message-ID: <20241227082836.16078-1-zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRpOVkNITUoaQkgfTxlOTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCQ1VISlVJS05ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSExVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94073b6bf209d0kunm6fd327f9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORw6LAw*KDISFzkJNBITGUs8
	OA8aCgtVSlVKTEhOSUNDSklITUpPVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkNVSEpVSUtOWVdZCAFZQU9ISkk3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Hgy9W2uzByULQwf+74yoj4hm7DujGwnsm8XZpINqulqg5fsOL+8Eo+GQZdtYRsXHDPhWCHUdfi4rcY7qWUngdKe/Y5fE/7cFJKcIJkpJcrcT4yr0RlQkMYXcrGgFpy02DdYCYececSbnkhyGo5DspcFxkc2ENuwP4vCYeUUw49o=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=2MX2+jhGysQkPZ9R3Qy2iiG9T+Vk52b6Hlj3J78y4as=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/digsig.rst into Chinese.

Update the translation through commit d56b699d76d1
("Documentation: Fix typos").

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/digsig.rst    | 100 ++++++++++++++++++
 .../translations/zh_CN/security/index.rst     |   2 +-
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/digsig.rst

diff --git a/Documentation/translations/zh_CN/security/digsig.rst b/Documentation/translations/zh_CN/security/digsig.rst
new file mode 100644
index 000000000000..96560d52859e
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/digsig.rst
@@ -0,0 +1,100 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/digsig.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+===============
+数字签名验证API
+===============
+
+
+.. 内容
+
+   1.介绍
+   2.API
+   3.用户空间工具
+
+
+介绍
+====
+
+数字签名验证API提供了一种验证数字签名的方法。
+目前，数字签名被IMA/EVM完整性保护子系统使用。
+
+数字签名验证是GnuPG多精度整数(MPI)库精简后的内核移植版本来实现的。
+该内核版本提供了内存分配错误处理，已根据内核编码风格进行重构，并修复
+了checkpatch.pl报告的错误和警告。
+
+公钥和签名由头部和MPIs组成::
+
+	struct pubkey_hdr {
+		uint8_t		version;	/* 密钥格式版本 */
+		time_t		timestamp;	/* 密钥时间戳，目前为0 */
+		uint8_t		algo;
+		uint8_t		nmpi;
+		char		mpi[0];
+	} __packed;
+
+	struct signature_hdr {
+		uint8_t		version;	/* 签名格式版本 */
+		time_t		timestamp;	/* 签名时间戳 */
+		uint8_t		algo;
+		uint8_t		hash;
+		uint8_t		keyid[8];
+		uint8_t		nmpi;
+		char		mpi[0];
+	} __packed;
+
+keyid等同对整个密钥的内容进行SHA1哈希运算后的第12到19字节。
+签名头部用于生成签名的输入。这种方法确保了密钥或签名头部无法更改。
+它保护时间戳不被更改，并可以用于回滚保护。
+
+API
+===
+
+目前API仅包含一个函数::
+
+	digsig_verify() - 使用公钥进行数字签名验证
+
+	/**
+	* digsig_verify() - 使用公钥进行数字签名验证
+	* @keyring:   查找密钥的密钥环
+	* @sig:       数字签名
+	* @sigen:     签名的长度
+	* @data:      数据
+	* @datalen:   数据的长度
+	* @return:    成功时返回0，失败时返回 -EINVAL
+	*
+	* 验证数据相对于数字签名的完整性。
+	* 目前仅支持RSA算法。
+	* 通常将内容的哈希值作为此函数的数据。
+	*
+	*/
+	int digsig_verify(struct key *keyring, const char *sig, int siglen,
+				  const char *data, int datalen);
+
+用户空间工具
+============
+
+签名和密钥管理实用工具evm-utils提供了生成签名、加载密钥到内核密钥环中的功能。
+密钥可以是PEM格式，或转换为内核格式。
+当把密钥添加到内核密钥环时，keyid定义该密钥的名称：下面的示例中为5D2B05FC633EE3E8。
+
+以下是keyctl实用工具的示例输出::
+
+	$ keyctl show
+	Session Keyring
+	-3 --alswrv      0     0  keyring: _ses
+	603976250 --alswrv      0    -1   \_ keyring: _uid.0
+	817777377 --alswrv      0     0       \_ user: kmk
+	891974900 --alswrv      0     0       \_ encrypted: evm-key
+	170323636 --alswrv      0     0       \_ keyring: _module
+	548221616 --alswrv      0     0       \_ keyring: _ima
+	128198054 --alswrv      0     0       \_ keyring: _evm
+
+	$ keyctl list 128198054
+	1 key in keyring:
+	620789745: --alswrv     0     0 user: 5D2B05FC633EE3E8
diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index 92e2d8a7dec8..c73cd289ac3e 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -16,6 +16,7 @@
    :maxdepth: 1
 
    lsm
+   digsig
 
 TODOLIST:
 * credentials
@@ -28,7 +29,6 @@ TODOLIST:
 * self-protection
 * siphash
 * tpm/index
-* digsig
 * landlock
 * secrets/index
 * ipe
-- 
2.47.1

