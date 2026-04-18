Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DABFBE5E;
	Sat, 18 Apr 2026 04:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776487534; cv=none; b=qxlePuzQo9DCSIzlGSwI1blaQjrDSElwU7Mnc+lhskSLQOPOIPRUKItSjTXf1VQP0To3nIqEcv746WT2udWOxkMnYp1vGCum1WAiPcFWkNjaiHM4VMzrl207vlkUzJBAAAJm1VUJa15nfHWYvPg15jvpUmj0AtyixATe3meF370=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776487534; c=relaxed/simple;
	bh=7UPRQOJvmySRVgCNDNcQSJmzWK2mLqvLdApY3ixLPBs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=DjETbR3+9v4iGvd9mTcb5y1OhkdcFiBE0+o9m2kJjTy4HLX0lJ7+R/kQILrxuKW48GJ1BbN9q7qR9NGMXjTQ1iWZqEDtY5dGBolvXQaBhiyoQEZxQCTzRJY5+IOb8s0PL+5jvlsn8ERAmCnlXlqpr7DnhI2T5aEfWDp2+8/YfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=d9c1TcOC; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="d9c1TcOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1776487520; bh=uvTI3AQuIDKjeCiff8BQPAnMQ7N7CK5QvOVDatfbp+w=;
	h=From:To:Cc:Subject:Date;
	b=d9c1TcOCjErwDIuVbDkA/wlsPcNqTlyKtkbl+3mxykR9MM+fiNSSTtsDBrwLmYQUh
	 PSRjeogJbGzuVIJozTCeoeFUiOmesFs7gCkr5sZ7lwu1Pts9Jt5QvILDJEpv9NEOcs
	 zyT9m+TFRIEq5AUIO67B7ejoOQ5lMI2H4ugpvGGU=
Received: from localhost.localdomain.localdomain ([27.38.232.147])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id B50B868B; Sat, 18 Apr 2026 12:45:16 +0800
X-QQ-mid: xmsmtpt1776487516twggn3c90
Message-ID: <tencent_99B2EE128E02C6CC1120DE135D4A2DA5B309@qq.com>
X-QQ-XMAILINFO: NUaRPsENHoCK57kIHMStElvsgIlNEN916X9ndn9yyXszlc6Ck4HZGmyBftmjF+
	 prsyKmk/OVZ4PNWDKJickf3inrRrE52nrHJEHa7+Bn3I2U2YgaCjaMwtUk16DkPUURfvRazt57E9
	 jQR0s6AxOtpg+S+HUX8fN04ILIlnWxF6nLxUoyXRbEliZ0beXy6c9ZwJYVJMgKDsGzCUdKvkEzwZ
	 01HJzEq6JK+vjXIb1K/hH7gMtQQn7krB/XiRP6vq0t2uZsFszDGPw04iMCKprBBOTDIqUAOQOChC
	 ANORHRv79z91VrEP9PMmNqOWb+XqEhW151bBYSZ2Dj9Mirl4sDuTLOq3kTLN8y4yUnTNJxRerXe2
	 1C9FLm+SPa+brKfqb/nIO+CMSNeSItM8WhMt2jWWcBIxLGYFuh48asXaWchwQktQ1RZkcRrOl42e
	 VWGh4ef4yEPgPD5Y4AFcsqrWvbmfM+Zyl51wSDeMKPTeJFLKHyfsfuBmvuX9P7i67a7/Cdla8aSI
	 mYjz12wP0AQ1A5X82NgG3aet/MKpdsaU9L+FRDuUkglPNKgUMYaK31d9v/Ouiq4pNO6emqE/V4n1
	 7A3rwyya8LeAFPchc+fV9Uo8oKAuraoLc3i9DlhW3YU84kXqUZwVx+2qWjdAOGY/uAR7CZ+hdpXx
	 2Si5Wu+5flfZ47HyZNFbCSRWarHmG2HAKQ+1AISdFZQUltNX445VGCUjcisQEDNb4t6fnSqjclCR
	 oq69bXBc8a6+nl3HIhowoxByvPdJqZVeFznFUX9zgR6jyFo65/1M+nUNXR4W13kNZzc9faSMm9n9
	 9jCDMfrLE5vnZDXZdhX9yqKgmPO8RxgheVX/ZCGezHLb9q5QYf+bQtbU3cPFet098F98l+QLOaIU
	 0Cnx4S4nyjgT+Xh8GxkgMnkC87+dPn2h2BhHr4IiJpmKr+DgZTDgvZcN+8IZr/C+TLMfO/lkxwIw
	 F+uHALY3V+zlrXcCH3qHxKS2HanaJDF+f0wAzzyG+6R3kJvIwKuPoDHNnD9hByriURORwS0Ww/iM
	 5nR0eabJMTvrYXF1+uwHZptZvY5yTycpGib2F0TP1Eiv8AlqZSl42v6dIR1O6gybDCcGcQ4Iit3K
	 YbTmCw
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yan Zhu <zhuyan2015@qq.com>
To: seakeel@gmail.com,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhuyan2015@qq.com
Subject: [PATCH v3] docs/zh_CN: add module-signing Chinese translation
Date: Sat, 18 Apr 2026 12:45:13 +0800
X-OQ-MSGID: <d5a67db2b6fdb02397066348f22ed4626bc3b1f5.1776487443.git.zhuyan2015@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate .../admin-guide/module-signing.rst into Chinese.

Update the translation through commit 0ad9a71933e7
("modsign: Enable ML-DSA module signing")

Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
---
 .../zh_CN/admin-guide/module-signing.rst      | 249 ++++++++++++++++++
 1 file changed, 249 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/module-signing.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/module-signing.rst b/Documentation/translations/zh_CN/admin-guide/module-signing.rst
new file mode 100644
index 000000000000..04b0f1cbafd5
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/module-signing.rst
@@ -0,0 +1,249 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/module-signing.rst
+:翻译:
+ 朱岩 Yan Zhu <zhuyan2015@qq.com>
+
+
+==========================
+内核模块签名机制
+==========================
+
+.. 目录
+..
+.. - 概述
+.. - 配置模块签名
+.. - 生成签名密钥
+.. - 内核中的公钥
+.. - 模块手动签名
+.. - 已签名模块和剥离
+.. - 加载已签名模块
+.. - 无效签名和未签名模块
+.. - 管理/保护私钥
+
+
+概述
+====
+
+内核模块签名机制在安装过程中对模块进行加密签名，然后在加载模块时检查签名。这
+通过禁止加载未签名的模块或使用无效密钥签名的模块来提高内核安全性。模块签名通
+过使恶意模块更难加载到内核中来增加安全性。模块签名检查在内核中完成，因此不需
+要受信任的用户空间位。
+
+此机制使用 X.509 ITU-T 标准证书对涉及的公钥进行编码。签名本身不以任何工业标准
+类型编码。内置机制目前仅支持 RSA、NIST P-384 ECDSA 和 NIST FIPS-204 ML-DSA
+公钥签名标准（尽管它是可插拔的并允许使用其他标准）。对于 RSA 和 ECDSA，可以使
+用的可能的哈希算法是大小为 256、384 和 512 的 SHA-2 和 SHA-3（算法由签名中的
+数据选择）；ML-DSA会自行进行哈希运算，但允许与SHA512哈希算法结合用于签名属性。
+
+配置模块签名
+============
+
+通过进入内核配置的 :menuselection:`Enable Loadable Module Support` 菜单并打
+开以下选项来启用模块签名机制::
+
+	CONFIG_MODULE_SIG	"Module signature verification"
+
+这有多个可用选项：
+
+ (1) :menuselection:`Require modules to be validly signed`
+     (``CONFIG_MODULE_SIG_FORCE``)
+
+     这指定了内核应如何处理其密钥未知或未签名的模块。
+
+     如果关闭（即"宽松模式"），则允许使用不可用密钥和未签名的模块，但内核将被
+     标记为受污染，并且相关模块将被标记为受污染，显示字符'E'。
+
+     如果打开（即"限制模式"），只有具有有效签名且可由内核拥有的公钥验证的模块
+     才会被加载。所有其他模块将生成错误。
+
+     无论此处的设置如何，如果模块的签名块无法解析，它将被直接拒绝。
+
+
+ (2) :menuselection:`Automatically sign all modules`
+     (``CONFIG_MODULE_SIG_ALL``)
+
+     如果打开此选项，则在构建的 modules_install 阶段期间将自动签名模块。
+     如果关闭，则必须使用以下命令手动签名模块::
+
+	scripts/sign-file
+
+
+ (3) :menuselection:`Which hash algorithm should modules be signed with?`
+
+     这提供了安装阶段将用于签名模块的哈希算法选择：
+
+	=============================== ==========================================
+	``CONFIG_MODULE_SIG_SHA256``	:menuselection:`Sign modules with SHA-256`
+	``CONFIG_MODULE_SIG_SHA384``	:menuselection:`Sign modules with SHA-384`
+	``CONFIG_MODULE_SIG_SHA512``	:menuselection:`Sign modules with SHA-512`
+	``CONFIG_MODULE_SIG_SHA3_256``	:menuselection:`Sign modules with SHA3-256`
+	``CONFIG_MODULE_SIG_SHA3_384``	:menuselection:`Sign modules with SHA3-384`
+	``CONFIG_MODULE_SIG_SHA3_512``	:menuselection:`Sign modules with SHA3-512`
+	=============================== ==========================================
+
+     此处选择的算法也将被构建到内核中（而不是作为模块），以便使用该算法签名的
+     模块可以在不导致循环依赖的情况下检查其签名。
+
+
+ (4) :menuselection:`File name or PKCS#11 URI of module signing key`
+     (``CONFIG_MODULE_SIG_KEY``)
+
+     将此选项设置为除默认值 ``certs/signing_key.pem`` 之外的其他值将禁用签名
+     密钥的自动生成，并允许使用您选择的密钥对内核模块进行签名。提供的字符串应
+     标识包含私钥及其对应的 PEM 格式 X.509 证书的文件，或者在 OpenSSL
+     ENGINE_pkcs11 功能正常的系统上，使用 RFC7512 定义的 PKCS#11 URI。在后一
+     种情况下，PKCS#11 URI 应引用证书和私钥。
+
+     如果包含私钥的 PEM 文件已加密，或者 PKCS#11 令牌需要 PIN，可以通过
+     ``KBUILD_SIGN_PIN`` 变量在构建时提供。
+
+
+ (5) :menuselection:`Additional X.509 keys for default system keyring`
+     (``CONFIG_SYSTEM_TRUSTED_KEYS``)
+
+     此选项可设置为包含附加证书的 PEM 编码文件的文件名，这些证书将默认包含在
+     系统密钥环中。
+
+请注意，启用模块签名会为内核构建过程添加对执行签名工具的OpenSSL开发包的依赖。
+
+
+生成签名密钥
+============
+
+生成和检查签名需要加密密钥对。私钥用于生成签名，相应的公钥用于检查签名。私钥
+仅在构建期间需要，之后可以删除或安全存储。公钥被构建到内核中，以便在加载模块
+时可以使用它来检查签名。
+
+在正常情况下，当 ``CONFIG_MODULE_SIG_KEY`` 保持默认值时，如果文件中不存在密
+钥对，内核构建将使用 openssl 自动生成新的密钥对::
+
+	certs/signing_key.pem
+
+在构建 vmlinux 期间（公钥需要构建到 vmlinux 中）使用参数::
+
+	certs/x509.genkey
+
+文件（如果尚不存在也会生成）。
+
+可以在 RSA（``MODULE_SIG_KEY_TYPE_RSA``）、
+ECDSA（``MODULE_SIG_KEY_TYPE_ECDSA``）和
+ML-DSA（``MODULE_SIG_KEY_TYPE_MLDSA_*``）之间选择生成 RSA 4k、NIST P-384
+密钥对或 ML-DSA 44、65 或 87 密钥对。
+
+强烈建议您提供自己的 x509.genkey 文件。
+
+最值得注意的是，在 x509.genkey 文件中，req_distinguished_name 部分应从默认值
+更改::
+
+	[ req_distinguished_name ]
+	#O = Unspecified company
+	CN = Build time autogenerated kernel key
+	#emailAddress = unspecified.user@unspecified.company
+
+生成的 RSA 密钥大小也可以通过以下方式设置::
+
+	[ req ]
+	default_bits = 4096
+
+也可以使用位于 Linux 内核源代码树根节点中的 x509.genkey 密钥生成配置文件和
+openssl 命令手动生成公钥/私钥文件。以下是生成公钥/私钥文件的示例::
+
+	openssl req -new -nodes -utf8 -sha256 -days 36500 -batch -x509 \
+	   -config x509.genkey -outform PEM -out kernel_key.pem \
+	   -keyout kernel_key.pem
+
+然后可以将生成的 kernel_key.pem 文件的完整路径名指定在
+``CONFIG_MODULE_SIG_KEY``选项中，并且将使用其中的证书和密钥而不是自动生成的
+密钥对。
+
+
+内核中的公钥
+============
+
+内核包含一个可由 root 查看的公钥环。它们在名为 ".builtin_trusted_keys" 的密
+钥环中，可以通过以下方式查看::
+
+	[root@deneb ~]# cat /proc/keys
+	...
+	223c7853 I------     1 perm 1f030000     0     0 keyring   .builtin_trusted_keys: 1
+	302d2d52 I------     1 perm 1f010000     0     0 asymmetri Fedora kernel signing key: d69a84e6bce3d216b979e9505b3e3ef9a7118079: X509.RSA a7118079 []
+
+除了专门为模块签名生成的公钥外，还可以在 ``CONFIG_SYSTEM_TRUSTED_KEYS`` 配置
+选项引用的 PEM 编码文件中提供其他受信任的证书。
+
+此外，架构代码可以从硬件存储中获取公钥并将其添加（例如从 UEFI 密钥数据库）。
+
+最后，可以通过以下方式添加其他公钥::
+
+	keyctl padd asymmetric "" [.builtin_trusted_keys-ID] <[key-file]
+
+例如::
+
+	keyctl padd asymmetric "" 0x223c7853 <my_public_key.x509
+
+但是，请注意，内核只允许将由已驻留在 ``.builtin_trusted_keys`` 中的密钥有效
+签名的密钥添加到 ``.builtin_trusted_keys``。
+
+模块手动签名
+============
+
+要手动对模块进行签名，请使用 Linux 内核源代码树中可用的 scripts/sign-file 工
+具。该脚本需要 4 个参数：
+
+	1.  哈希算法（例如，sha256）
+	2.  私钥文件名或 PKCS#11 URI
+	3.  公钥文件名
+	4.  要签名的内核模块
+
+以下是签名内核模块的示例::
+
+	scripts/sign-file sha512 kernel-signkey.priv \
+		kernel-signkey.x509 module.ko
+
+使用的哈希算法不必与配置的算法匹配，但如果不同，应确保哈希算法要么内置在内核
+中，要么可以在不需要自身的情况下加载。
+
+如果私钥需要密码或 PIN，可以在 $KBUILD_SIGN_PIN 环境变量中提供。
+
+
+已签名模块和剥离
+================
+
+已签名模块在末尾简单地附加了数字签名。模块文件末尾的字符串
+``~Module signature appended~.`` 确认签名存在，但不能确认签名有效！
+
+已签名模块是脆弱的，因为签名在定义的ELF容器之外。因此，一旦计算并附加签名，就
+不得剥离它们。请注意，整个模块都是签名的有效载荷，包括签名时存在的任何和所有
+调试信息。
+
+
+加载已签名模块
+==============
+
+模块通过 insmod、modprobe、``init_module()`` 或 ``finit_module()`` 加载，
+与未签名模块完全一样，因为在用户空间中不进行任何处理。
+所有签名检查都在内核内完成。
+
+
+无效签名和未签名模块
+====================
+
+如果启用了 ``CONFIG_MODULE_SIG_FORCE`` 或在内核启动命令提供了
+module.sig_enforce=1，内核将仅加载具有有效签名且具有公钥的模块。否则，它还将
+加载未签名的模块。任何具有不匹配签名的模块将不被允许加载。
+
+任何具有不可解析签名的模块将被拒绝。
+
+
+管理/保护私钥
+==============
+
+由于私钥用于签名模块，病毒和恶意软件可以使用私钥签名模块并危害操作系统。私钥
+必须被销毁或移动到安全位置，而不是保存在内核源代码树的根节点中。
+
+如果使用相同的私钥为多个内核配置签名模块，必须确保模块版本信息足以防止将模块
+加载到不同的内核中。要么设置 ``CONFIG_MODVERSIONS=y``，要么通过更改
+``EXTRAVERSION`` 或 ``CONFIG_LOCALVERSION`` 确保每个配置具有不同的内核发布字
+符串。
-- 
2.43.0

