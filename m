Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310D322B9F
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469318; cv=none; b=QVCoGV7GEby3H2d9lWhjpxQvynmVef5/y95/qhjVNS3dgPpxoptH76YZzJ9dxZnMGFkDFARYdBVyH6PfGqwINZ/V8HKVy3JNE3gjZBgthOIEooLh7nhK0saS4UPs/xAjZqaiTsQcV4rqN3CLT2QK2wwzEVdFxiZTI5+mskWdEyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469318; c=relaxed/simple;
	bh=txxZTQ/rkXaaSw8R/F+6uoTfgKzdEf2ewU2tWaA34b8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MmJvbiGoAcW47SMkDj9isGsBudFQ7D1SS6O9yGcH6XCTibcLotpnIpE+SFr4Hd4wucJfIdQ0c/kkjl3ErZiIWCgeF6S/cbTzfKAjMJz3Zf8pxpIFNiTuVRJQPh0Lw2p4xZmFgPb/9JCfgYjIYJjXsMJ5hIguBzSzBdpZDGhJx8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=jKXlSCBl; arc=none smtp.client-ip=91.218.175.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="jKXlSCBl"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=txxZTQ/rkXaaSw8R/F+6uoTfgKzdEf2ewU2tWaA34b8=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787469312; v=1; x=1788074112;
 b=jKXlSCBlGYhZH3XLYTxRe1Mt5EG2g75d9bPZTmhoNPnzA9TXMDg0bi+qb/CfQWbi7SsapH/S
 cQx0ZUMFK3x5nIuqVXArA2yxcK2dMfg3auT1LYvLaLMt//hAhrw8Xjb354YDNHfknKlPrt44JYE
 wRolaDr3iE+6g0/tyAKCXgDPWj2bjzfy0n+3UaKzTHG8rI/fAatsE60TJHqSflX0jxAZQM4wzw/
 zLB9ceXM5YIFg73h0q/39ud8YjEmNIKYBChoqsuMvOJGjKocP5pHEbFixVL+Leb7oTtMNleuRzl
 3CjpguSPRxZwAjjPtdhRDOQxrT7i33IKPwFDzeoo5jpNw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 628b2688a4d786c5;
	Sun, 23 Aug 2026 07:15:12 +0000
X-Mizu-Trace-ID: 628b2688a4d786c5
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
Date: Sun, 23 Aug 2026 15:14:56 +0800
Message-Id: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf8X07JptxQY9+R+GQy3bsiYW0gJKC
 P9uwXjzMIeXzMybRaLIlMRlN4tIIyduQwa13wnbmOAJuM4sFCqNpUJ4Gg59DkXofAd+4JrASXf
 WUhfWGSPytIvk+L3d3qovp+H+INuvX2uj4dS3cdq8o1x7P4X8rxglIGBJJzpqVBaL62saTDi00
 YtqWZYPdxlzpcoAAAA=
X-Change-ID: 20260820-maintainer-pgp-guide-f1f96164cfaa
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

The script says:

$ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
[1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
[1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
[1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
[1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
[1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
[1787244823.779522] 4 commits needs resolving in total

So I updated this document in chronological order, created four patches
based on these four outdated commits to make it easier for you to
review. Hence, you can freely squash them when applying them.

Tested with make cleandocs && make htmldocs, no warning or error made by
these patches. (Hope my eyes work fine this time :))

[+To: Konstantin, as he is the original author, thanks.]

---
Changes in v2:
- Fix the label with adding a prefix 'cn'.
- Add Patch 5: Remove empty proofreader field from maintainer PGP guide.

There are currently many other zh_CN documents containing an empty
`:校译:` field.

Is leaving an empty `:校译:` field intentional, perhaps as a placeholder
for future proofreaders? I would prefer to remove it when no proofreader
is listed, since an empty field does not provide any useful information.

- Link to v1: https://patch.msgid.link/20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org

---
Weijie Yuan (5):
      docs/zh_CN: update maintainer-pgp-guide translation
      docs/zh_CN: clarify free Nitrokey requirements
      docs/zh_CN: update maintainer-pgp-guide kernel.org link
      docs/zh_CN: add kernel.org trust repository reference
      docs/zh_CN: remove empty proofreader field from maintainer PGP guide

 .../zh_CN/process/maintainer-pgp-guide.rst         | 154 +++++++++++----------
 1 file changed, 78 insertions(+), 76 deletions(-)

Range-diff versus v1:

1:  92e17e712630 ! 1:  ff5d9c87f839 docs/zh_CN: update maintainer-pgp-guide translation
    @@ Commit message
         Update Documentation/process/maintainer-pgp-guide.rst Chinese
         translation.
     
    +    Add missing labels from the initial translation.
    +
         Update the translation through commit f44a29784f68
         ("Documentation: update maintainer-pgp-guide for latest best practices")
     
         Assisted-by: LLM
         Signed-off-by: Weijie Yuan <wy@wyuan.org>
         ---
    -
         I used LLM to help me quickly locate where's the part that needs to be
         updated, as well as what's the suggested diff for it. And it helped me
         with some translation wording stuff. Well, I have to admit that LLM
         knows Chinese better than me nowadays. ;-)
     
      ## Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst ##
    +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: git 仓库和 tarball 都带有创建官方内核版本的内核开发者的 PGP
    + - git 仓库在所有标签上提供 PGP 签名
    + - tarball 为所有下载提供独立的 PGP 签名
    + 
    ++.. _cn_devs_not_infra:
    ++
    + 信任开发者，不要信基础设施
    + --------------------------
    + 
     @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: git 仓库和 tarball 都带有创建官方内核版本的内核开发者的 PGP
      则就是假定基础设施的任何部分都可能随时受到入侵。因此，管理员特意采取措施，
      强调必须始终信任开发者，不能信任代码托管基础设施，无论后者的安全实践有多好。
    @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: git 仓库和
     +上述指导原则正是需要本指南的原因。希望确保通过对开发者的信任，我们不会
     +仅仅将未来潜在安全事件的责任归咎于其他人。目的是提供一套指导开发者可以
     +用来创建安全的工作环境并保护用于建立 Linux 内核本身完整性的 PGP 密钥。
    ++
    ++.. _cn_pgp_tools:
      
      PGP 工具
      ========
    @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: PGP 工具
      
      配置 gpg-agent 选项
      ~~~~~~~~~~~~~~~~~~~
    +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG agent是一个辅助工具，每当你使用该命令时，它都会自动
    +     rc 文件来删除旧版本 GnuPG 中的所有内容，因为它可能不再做正确
    +     的事情。
    + 
    ++.. _cn_protect_your_key:
    ++
    + 保护你的 PGP 密钥
    + =================
    + 
     @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
      
          $ gpg --quick-addkey [fpr] ed25519 sign
    @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将
     -    你的打印机可能不再是连接到并行端口的简单哑设备，但由于输出仍然使
     -    用你的密码进行加密，因此即使“云端打印”的现代打印机也应该保持相
     -    对安全的操作
    -+    密钥仍然使用你的密码加密，因此即使使用与“云”集成的现代打印机，
    ++    密钥仍然使用你的密码加密，因此即使使用与“云集成的”现代打印机，
     +    打印也应该仍是一项相对安全的操作。
      
      备份整个 GnuPG 目录
    @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将
      
          $ cd ~/.gnupg/private-keys-v1.d
          $ rm 1111000000000000000000000000000000000000.key
    +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
    + 完成此操作后，请确保删除过时的 ``secring.gpg`` 文件，其中仍然包含你
    + 的私钥。
    + 
    ++.. _cn_smartcards:
    + 
    + 将子密钥移至专用加密设备
    + ========================
     @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
      道密码）。此外，每次执行 GnuPG 操作时，密钥都会加载到系统内存中，并
      可能被足够高级的恶意软件（例如 Meltdown 和 Spectre）从那里窃取。
    @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: USB 设备插
      
      请记住将更新后的密钥发送回密钥服务器::
      
    +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: gpg-agent。
    + 
    + .. _`Agent通过SSH转发`: https://wiki.gnupg.org/AgentForwarding
    + 
    ++.. _cn_pgp_with_git:
    ++
    + 将 PGP 与 Git 结合使用
    + ======================
    + 
     @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的
      项目的完整历史记录，包括其所有标签、提交和分支。然而，随着数百个克隆仓
      库的出现，人们如何验证他们的 linux.git 副本没有被恶意第三方篡改？
    @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: infradead.org
      “ ``pip install patatt`` ”从 pypi 安装它。
      
     @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: DKIM 和 patatt 签名，例如::
    +     Patatt 和 b4 仍在积极开发中，你应该检查这些项目的最新文档以了解任
    +     何新功能或更新功能。
    + 
    ++.. _cn_kernel_identities:
    ++
      如何验证内核开发者身份
      ======================
      
2:  6af479825464 ! 2:  e75297c007f6 docs/zh_CN: clarify free Nitrokey requirements
    @@ Commit message
         in MAINTAINERS or have a kernel.org account to qualify for a free
         Nitrokey Start.
     
    +    Also translate the Nitrokey link text and fix its RST reference markup.
    +
         Update the translation through commit 273aa250f138
         ("Documentation: Improve wording on requirements for a free Nitrokey")
     
3:  e11c9967c042 ! 3:  f25ed4748812 docs/zh_CN: update maintainer-pgp-guide kernel.org link
    @@ Commit message
     
         Signed-off-by: Weijie Yuan <wy@wyuan.org>
         ---
    -
         The SPDX identifier of this translation was added at its birth, while
         the SPDX identifier of its original English version was added this year
         2026. Although it has been added, I'm quite curious about whether it is
    @@ Commit message
         the English original does not have one back in 2023.
     
         I know Jon has been a little bit careful about it, so I'd better leave
    -    my thoughts here for furture reference.
    +    my thoughts here for future reference.
     
         Thanks.
     
4:  fc948173fa5e ! 4:  0a4ac21594bd docs/zh_CN: add kernel.org trust repository reference
    @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: SSH 的信任
      
          trust-model tofu+pgp
      
    -+.. _kernel_org_trust_repository:
    ++.. _cn_kernel_org_trust_repository:
     +
      使用 kernel.org 信任网仓库
      --------------------------
-:  ------------ > 5:  85427bbca5b0 docs/zh_CN: remove empty proofreader field from maintainer PGP guide

---
base-commit: 1efa3bbbcc2dc6028e833d6d4f1bb23b8fe88c06
change-id: 20260820-maintainer-pgp-guide-f1f96164cfaa

