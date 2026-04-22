Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A671624D5;
	Wed, 22 Apr 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870787; cv=none; b=W8jmVCTyTkMc7E2brHUIBCLBt6Pt6DW6FOs7UaDCf0nUa6kEZgXwKse12LSTijXkHHZfoyzpBOWTVolR74be58jC3BiFId1ihQAp6xKnNc2mCRrQpdDY1I/taLdwjRWYtNlbTvbk74cbB9xEIAgitThu4jXstsjyFXByJGGOPJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870787; c=relaxed/simple;
	bh=WDQjtfVm4zj/Vig9Dz2w6ywdnOiFMcv6pewQEVUZMI4=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=AgQauBLrdlwDb+KZYd+apCRsFBvP3bXgpNzRVe+RKYfZPluQxebWeMMYEbAHX6CTH2Pc2710/6fbtB/T8kup+m8acOSW2dMSe5CSQGFvq4n961CC8NxXYE85cIWWIEPG49tLK58igqIBEEZFG+TtE7IT+4i/ndNqRARisozCjJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=C1Cm/Lp3; arc=none smtp.client-ip=43.163.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="C1Cm/Lp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1776870774; bh=Y5DcVm/eGuMpyBHKegrITty4mu3Dzcw4Y2Pwvcs/9Yw=;
	h=From:To:Cc:Subject:Date;
	b=C1Cm/Lp3Ss+WAPd7xmSfpX7R5UIyVCuiXXtsfSrrRbzYIqOBcoY8nECWhX3MirANd
	 dVRbu3M5HAhvF+niO+4B4jQYMX8mTL52K7GRxZ9tN08XiO/nXgRM4gSj++VUEmIslJ
	 YgClqrKW/m0/gjVmVKGADHyBz6bT9W2CDTpQ9mEI=
Received: from localhost.localdomain.localdomain ([163.125.232.153])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 3340DE42; Wed, 22 Apr 2026 23:12:52 +0800
X-QQ-mid: xmsmtpt1776870772tqgeg5n6w
Message-ID: <tencent_654B91A551D6E7DDF311CF580D42E6FB8F06@qq.com>
X-QQ-XMAILINFO: ODQfruXGvXma3BfOqc9Mr04gOn54F5k07Od+/7JYRjDmpPrI7VeEwv4B28zAsd
	 S+VnLVrVfgO2ju9L/vZMXB3Euxi4EPO3kxTmLQaluC2tGz3a6HdR/++eW9U8BJop43JbvsB2TSmf
	 bkLQueXkijH3j9UQgzHMTTp7GHqjIwFMTYQnQjIPyC8jU5wX0pyBYRX1wfQTYjXG6EFQEV1WVP94
	 rp6eP3LQzfrlf+np/lodB3YWYNS2+jWcMQi3HUk4rWkL81YPdtrL8N3tF8kLhK6NlHxwXFdYLZmd
	 sqsns7SIridM7UrMQubJUZ/3mHkKDcNObMh6V2OeXp3697SZ6oBfkYgR36gCXWm0RG+tUNbHC1wj
	 hUOl+bgsWb2ReuXzQ6XyZ2DW2XIBLbygYzAwGBcvkM2csx4GdkHtOXvJTcb4bZNJLVX9cMrS4NvZ
	 WnmDERKjXm/ztCckv7AJErZeop1lQ0gEVSHmy1xsOxFXnU9aVCxbGHaYiod+r+2CtqrpZnTVDlAu
	 C3W0Fa3sdo13EOr9Vg/XbveHpM2YGR/pvs4FbyYn4GFLIovytwu08E6HLOAH8c7YY0wqAonNbuPE
	 aeysB5cztFmbt17Ex+MsGeYHkER2LODcqLUlOmYrRXXUmNw/hOZp7cC6wWdXkXNRRDPC0d2NSVUF
	 YlytDdLbRWMcuevR2HeGabF+V7iOg7MUYQFk3LkBsWLQOLzqFvjHVi7zFtsIyz14etus4QrNId7P
	 DF4+k0lxHlgRLzoeDmZeSrFji7CqtZI7XqHc5IwOPjDwmJ/ZCbGNUSoVcXbrr1fk2h41gi7pP2c5
	 wUjRK2Iom1UZISpdR2gDocwX4ckSnhUzYXnaHzzZfnh6xkgL6FOqWZHBujm/GW/b890ZNbDq0wQX
	 3bjP43UO3xeSQ46sFz+B/xLDRLy4JEFM5CAcW6hupYe6aWpynZX2JBj53OltqNoysDZ6LF0fBG4D
	 gKltQmwni22Vqlh1EA5kiI1JS9ovbQLBNLhr78gnB0uZpdo/xoZeGiCRRUDnlNw6cVKQKP+qUrqA
	 jBaKxRmL2u8w3dveWltpQ3CBwiUtEAlqnJJQviNDiVJjzYs2zk9Mf/feYK25Xg7smbeAg8Tf0FNr
	 BzQM6YAL4GWfgbp/Gq5M9VSF58pM9lIkAjDtHtdy82SOL4lP1fccrl7inT+Bax3NyJluoD/gDrPE
	 YwwgstTSoLYjsgtfvV+FSYJzuaOOvX83nzY+M=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Yan Zhu <zhuyan2015@qq.com>
To: seakeel@gmail.com,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	zhuyan2015@qq.com
Subject: [PATCH v5] docs/zh_CN: add module-signing Chinese translation
Date: Wed, 22 Apr 2026 23:11:30 +0800
X-OQ-MSGID: <b1cbf76181270b18337bb781c2fc3407d113e413.1776870436.git.zhuyan2015@qq.com>
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604182216.Qpd5KifK-lkp@intel.com/
Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
---
v4->v5:
Fix the format error of line 157.

v3->v4:
Add patch change description.

v2->v3:
Fix line 87 and 94 without tab indentation.

v1->v2:
Fixed the issue of some lines exceeding 80 characters and alignment.
---
---
 .../zh_CN/admin-guide/module-signing.rst      | 250 ++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/module-signing.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/module-signing.rst b/Documentation/translations/zh_CN/admin-guide/module-signing.rst
new file mode 100644
index 000000000000..b5671224f102
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/module-signing.rst
@@ -0,0 +1,250 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/module-signing.rst
+:翻译:
+ 朱岩 Yan Zhu <zhuyan2015@qq.com>
+
+
+================
+内核模块签名机制
+================
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
+数据选择）；ML-DSA 会自行进行哈希运算，但允许与 SHA512 哈希算法结合用于签名属
+性。
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
+请注意，启用模块签名会为内核构建过程添加对执行签名工具的 OpenSSL 开发包的依赖。
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
+``CONFIG_MODULE_SIG_KEY`` 选项中，并且将使用其中的证书和密钥而不是自动生成的
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
+模块通过 insmod、modprobe、 ``init_module()`` 或 ``finit_module()`` 加载，
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

