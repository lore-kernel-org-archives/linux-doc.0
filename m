Received: from mta0.migadu.com (out-53.mta0.migadu.com [91.218.175.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842C1242D9B
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246036; cv=none; b=bmKaSDE0q0sEkLd4rT51/QaL+6dDEPRDy3EuidClZmsYNkGtEzjdyCqQ/7EaeKR+paqu+f8acDnouDaEI940WwMtShNIfMlufKYwNq7Pb2ygOPkGjo5OSZ3ULecF6Ynx4HP1ZBh2Htc9g8YtX7yqnuO5Jlsggw3W8wresVmS/q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246036; c=relaxed/simple;
	bh=eYUsJtdN4zve74Ej18OSUJUVfzN5+bH/lnsvQKDRdsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuQX1YjVUHYxw6KnPadNE6H9udoOm5VO+COv+ByvUTjMOBg4dMw0HtNFsqm9ZVez0yrt1lhryNxlDCaLgiQ9BL+b1/Oa2DKc8etJ5sARNgMSgSeA74iEvXtN+t9PfRJhOd0XRYsBHvHHSpAnN2TV/acgysbTYgCU5DJZg0/GbZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=EKzv4DMM; arc=none smtp.client-ip=91.218.175.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="EKzv4DMM"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eYUsJtdN4zve74Ej18OSUJUVfzN5+bH/lnsvQKDRdsw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787246031; v=1; x=1787850831;
 b=EKzv4DMM97SVmpgQiBCiknNLa1+fxl4bq8OMlFoLajJ4EZFr9kPHH/F1q1Lz8QjvzCQZaVsO
 AHxdGvuzLELGL7O8E/ZD/a7SGebZhCAGhEPY8FgOTV5deyymvXgA3lwxNodpU517n80VTYCzfSF
 20mIsv8iqEeMZ+ALVunzvQOXieWu6TX+HMAEUDcAxHQKcnoj6gzL0JxFnpeA8FC+wf8FJ6uCgdm
 bSC2XRkOW/ro/1yP9irMQLglTrIeWDw74Jys9U39GUcHIiibl19of5nNXbhCOmdSN47F7rVneU0
 TY4BpMSVn/tFYUwc0A6ngyXUyED5S1NP4PsW5UtT2mVmA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 802ac0fd50ff39c3;
	Thu, 20 Aug 2026 17:13:51 +0000
X-Mizu-Trace-ID: 802ac0fd50ff39c3
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Fri, 21 Aug 2026 01:13:20 +0800
Subject: [PATCH 1/4] docs/zh_CN: update maintainer-pgp-guide translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-maintainer-pgp-guide-v1-1-08e5e3602c04@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
In-Reply-To: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=19277; i=wy@wyuan.org;
 h=from:subject:message-id; bh=eYUsJtdN4zve74Ej18OSUJUVfzN5+bH/lnsvQKDRdsw=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqx20z3nOMTa/90/tkk0t8d46dqt4ruDj5c9lM5i4Otfc
 SBiy7H1HRNZGMS4GCzFFFkU855f4HIP2DttRcR5mDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6XA4jw+SnE3ROczhuZ3qX1dIqYvwzxTuEPWSy94S6J/bBEpr3XBh+s997k+a
 5fo8+p8WFIue7cfKWs9yNfa/Ne5ch/3Ui38JHnAA=
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

Update Documentation/process/maintainer-pgp-guide.rst Chinese
translation.

Update the translation through commit f44a29784f68
("Documentation: update maintainer-pgp-guide for latest best practices")

Assisted-by: LLM
Signed-off-by: Weijie Yuan <wy@wyuan.org>
---

I used LLM to help me quickly locate where's the part that needs to be
updated, as well as what's the suggested diff for it. And it helped me
with some translation wording stuff. Well, I have to admit that LLM
knows Chinese better than me nowadays. ;-)
---
 .../zh_CN/process/maintainer-pgp-guide.rst         | 130 ++++++++++-----------
 1 file changed, 61 insertions(+), 69 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index eb12694a4c59..fe0a78576f43 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -47,14 +47,14 @@ git 仓库和 tarball 都带有创建官方内核版本的内核开发者的 PGP
 则就是假定基础设施的任何部分都可能随时受到入侵。因此，管理员特意采取措施，
 强调必须始终信任开发者，不能信任代码托管基础设施，无论后者的安全实践有多好。
 
-上述指导原则正是需要本指南的原因。希望确保通过对开发者的信任，我们不会简
-单地将未来潜在安全事件的责任归咎于其他人。目的是提供一套指导开发者可以用
-来创建安全的工作环境并保护用于建立 Linux 内核本身完整性的 PGP 密钥。
+上述指导原则正是需要本指南的原因。希望确保通过对开发者的信任，我们不会
+仅仅将未来潜在安全事件的责任归咎于其他人。目的是提供一套指导开发者可以
+用来创建安全的工作环境并保护用于建立 Linux 内核本身完整性的 PGP 密钥。
 
 PGP 工具
 ========
 
-使用 GnuPG 2.2 或更高版本
+使用 GnuPG 2.4 或更高版本
 -------------------------
 
 默认情况下，你的发行版应该已经安装了 GnuPG，你只需要验证你使用的是相当新的
@@ -62,8 +62,8 @@ PGP 工具
 
     $ gpg --version | head -n1
 
-如果你有 2.2 或更高版本，那么你就可以开始了。如果你的版本早于 2.2，则本指
-南中的某些命令可能不起作用。
+如果你的版本为 2.4 或更高，那么一切准备就绪。如果使用的是更早的版本，则该
+GnuPG 版本已停止维护，本指南中的某些命令可能无法工作。
 
 配置 gpg-agent 选项
 ~~~~~~~~~~~~~~~~~~~
@@ -173,39 +173,32 @@ GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
 
     $ gpg --quick-addkey [fpr] ed25519 sign
 
-.. note:: GnuPG 中的 ECC 支持
-
-    请注意，如果你打算使用不支持 ED25519 ECC 密钥的硬件密钥，则
-    应选择“nistp256”或“ed25519”。请参阅下面有关推荐硬件设备的
-    部分。
-
-
 备份你的证书密钥以进行灾难恢复
 ------------------------------
 
 你的 PGP 密钥上来自其他开发者的签名越多，出于灾难恢复的原因，你就越
 有理由创建一个位于数字媒体之外的备份版本。
 
-创建私钥的可打印硬拷贝的最佳方法是使用 ``paperkey`` 为此目的编写
-的软件。有关输出格式及其相对于其他解决方案的优势的更多详细信息，请参
-阅 ``paperkey`` 参考资料。大多数发行版都应该已经打包了 Paperkey。
+创建私钥的可打印硬拷贝时，一个好方法是使用专为此目的编写的
+``paperkey`` 软件。有关输出格式及其相对于其他解决方案的优势的更多
+详细信息，请参阅 ``paperkey`` 参考资料。大多数发行版都应该已经打包了
+Paperkey。
 
 运行以下命令来创建私钥的硬拷贝备份::
 
     $ gpg --export-secret-key [fpr] | paperkey -o /tmp/key-backup.txt
 
-打印出该文件（或将输出直接传输到 lpr），然后用笔在纸的边缘写下你的密
-码。 **强烈建议这样做**，因为密钥打印输出仍然使用该密码进行加密，并且
-如果你更改了它，你将不记得创建备份时它曾经是什么 - *保证*。
+打印出该文件，然后用笔在纸的边缘写下你的密码。 **强烈建议这样做**，因
+为密钥打印输出仍然使用该密码进行加密，并且如果你更改了它，你将不记得
+创建备份时它曾经是什么 - *保证*。
 
 将生成的打印输出和手写密码放入信封中，并存放在安全且受到良好保护的地
 方，最好远离你的家，例如银行保险柜。
 
 .. note::
 
-    你的打印机可能不再是连接到并行端口的简单哑设备，但由于输出仍然使
-    用你的密码进行加密，因此即使“云端打印”的现代打印机也应该保持相
-    对安全的操作
+    密钥仍然使用你的密码加密，因此即使使用与“云”集成的现代打印机，
+    打印也应该仍是一项相对安全的操作。
 
 备份整个 GnuPG 目录
 -------------------
@@ -219,13 +212,12 @@ GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
 例如在会议和峰会后更改你自己的密钥或签署其他人的密钥时，你还将依赖
 这些外部副本。
 
-首先获取一个小型 USB “拇指” 驱动器（最好是两个！），用于备份目的。
-你需要使用 LUKS 对其进行加密——请参阅你的发行版文档以了解如何完成
-此操作。
+首先准备一个外部存储介质（最好准备两个！）用于备份。你需要使用 LUKS
+在该设备上创建加密分区——请参阅你的发行版文档以了解如何完成此操作。
 
 对于加密密码，你可以使用与 PGP 密钥相同的密码。
 
-加密过程完成后，重新插入 USB 驱动器并确保其正确安装。将整个 ``.gnupg``
+加密过程完成后，重新插入设备并确保其正确挂载。将整个 ``.gnupg``
 目录复制到加密存储::
 
     $ cp -a ~/.gnupg /media/disk/foo/gnupg-backup
@@ -234,10 +226,9 @@ GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
 
     $ gpg --homedir=/media/disk/foo/gnupg-backup --list-key [fpr]
 
-如果没有出现任何错误，那么就可以开始了。卸下 USB 驱动器，给它贴上
-明显的标签，这样下次需要使用随机 USB 驱动器时就不会把它吹走，然后
-放在安全的地方 - 但不要太远，因为你每次都需要使用它时不时地用于诸
-如编辑身份、添加或撤销子密钥或签署其他人的密钥之类的事情。
+如果没有出现任何错误，那么就可以使用了。卸载设备，给它贴上明显的标签，
+以免意外覆盖，然后放在安全的地方——但不要太远，因为你偶尔还需要用它
+编辑身份、添加或撤销子密钥，或签署其他人的密钥。
 
 从你的 homedir 中删除 Certify 密钥
 ----------------------------------
@@ -260,7 +251,7 @@ GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
     请参阅上一节并确保你已完整备份 GnuPG 目录。如果你没有可用的
     备份，我们要做的事情将使你的密钥毫无用处！
 
-首先，确定你的证书密钥的keygrip::
+首先，确定你的证书密钥的“keygrip”::
 
     $ gpg --with-keygrip --list-key [fpr]
 
@@ -284,7 +275,7 @@ GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
     2222000000000000000000000000000000000000.key
     3333000000000000000000000000000000000000.key
 
-你所要做的只是删除与证书密钥 keygrip 对应的 .key 文件::
+只需删除与证书密钥 keygrip 对应的 .key 文件::
 
     $ cd ~/.gnupg/private-keys-v1.d
     $ rm 1111000000000000000000000000000000000000.key
@@ -322,17 +313,17 @@ GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
 道密码）。此外，每次执行 GnuPG 操作时，密钥都会加载到系统内存中，并
 可能被足够高级的恶意软件（例如 Meltdown 和 Spectre）从那里窃取。
 
-完全保护密钥的最佳方法是将它们转移到能够进行智能卡操作的专用硬件设备上。
+完全保护密钥的一个好方法是将它们转移到能够进行智能卡操作的专用硬件设备上。
 
 智能卡的好处
 ------------
 
 智能卡包含一个加密芯片，能够存储私钥并直接在卡本身上执行加密操作。由于
 密钥内容永远不会离开智能卡，因此插入硬件设备的计算机的操作系统无法自行
-检索私钥。这与我们之前用于备份目的的加密 USB 存储设备有很大不同——当
-USB 设备插入并安装时，操作系统能够访问私钥内容。
+检索私钥。这与我们之前用于备份目的的加密介质存储设备有很大不同——当该
+设备插入并挂载时，操作系统能够访问私钥内容。
 
-使用外部加密 USB 介质并不能替代具有智能卡功能的设备。
+使用外部加密介质并不能替代具有智能卡功能的设备。
 
 可用的智能卡设备
 ----------------
@@ -340,14 +331,13 @@ USB 设备插入并安装时，操作系统能够访问私钥内容。
 除非你的所有笔记本电脑和工作站都有智能卡读卡器，否则最简单的方法是获
 取实现智能卡功能的专用 USB 设备。有多种选择：:
 
-- `Nitrokey Start`_: 开放硬件和免费软件，日本基于FSI的 `Gnuk` 。
-  少数支持 ED25519 ECC 密钥的商用设备之一，但提供的安全功能最少
-  （例如防篡改或某些旁路攻击）。
-- `Nitrokey Pro 2`_: 与 Nitrokey Start 类似，但更防篡改并提供
-  更多安全功能。Pro 2 支持 ECC 加密 (NISTP)。
-- `Yubikey 5`_: 专有硬件和软件，但比 Nitrokey Pro 便宜，并且以
-  USB-C 形式提供，对于较新的笔记本电脑更有用。提供额外的安全功能，
-  例如 FIDO U2F 等，现在终于支持 NISTP 和 ED25519 ECC 密钥。
+- `Nitrokey Start`_: 开放硬件和自由软件，基于日本 FSI 的 `Gnuk`_。
+  它是最便宜的选择之一，但提供的安全功能最少（例如防篡改或抵御某些
+  侧信道攻击的能力）。
+- `Nitrokey 3`_: 与 Nitrokey Start 类似，但抗篡改能力更强，提供更多
+  安全功能和 USB 外形规格。支持 ECC 密码学（ED25519 和 NISTP）。
+- `Yubikey 5`_: 专有硬件和软件，但比 Nitrokey 便宜，功能集与其类似。
+  支持 ECC 密码学（ED25519 和 NISTP）。
 
 你的选择将取决于成本、你所在地理区域的货运便利性以及开放/专有硬件考虑
 因素。
@@ -357,8 +347,8 @@ USB 设备插入并安装时，操作系统能够访问私钥内容。
     如果你位列于 MAINTAINERS 中或在 kernel.org 上拥有帐户，则你有
     资格获得Linux 基金会提供的_`qualify for a free Nitrokey Start` 。
 
-.. _`Nitrokey Start`: https://shop.nitrokey.com/shop/product/nitrokey-start-6
-.. _`Nitrokey Pro 2`: https://shop.nitrokey.com/shop/product/nkpr2-nitrokey-pro-2-3
+.. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys
+.. _`Nitrokey 3`: https://www.nitrokey.com/products/nitrokeys
 .. _`Yubikey 5`: https://www.yubico.com/products/yubikey-5-overview/
 .. _Gnuk: https://www.fsij.org/doc-gnuk/
 .. _`qualify for a free Nitrokey Start`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
@@ -529,7 +519,7 @@ USB 设备插入并安装时，操作系统能够访问私钥内容。
 如果更容易记住，你也可以使用特定日期（例如你的生日、1 月 1 日或加拿大
 国庆日）::
 
-    $ gpg --quick-set-expire [fpr] 2025-07-01
+    $ gpg --quick-set-expire [fpr] 2038-07-01
 
 请记住将更新后的密钥发送回密钥服务器::
 
@@ -565,8 +555,8 @@ Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的
 项目的完整历史记录，包括其所有标签、提交和分支。然而，随着数百个克隆仓
 库的出现，人们如何验证他们的 linux.git 副本没有被恶意第三方篡改？
 
-或者，如果在代码中发现后门，并且提交中的“Author”行表示它是由你完成的，
-而你非常确定 `自己与它无关`_ ，会发生什么？
+或者，如果在内核中发现恶意代码，并且提交中的“Author”行表示它是由你完成
+的，而你非常确定 `自己与它无关`_，会发生什么？
 
 为了解决这两个问题，Git 引入了 PGP 集成。签名的标签通过确保其内容与创
 建标签的开发人员的工作站上的内容完全相同来证明仓库的完整性，而签名的提
@@ -586,7 +576,7 @@ Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的
 如何使用签名标签
 ----------------
 
-要创建签名标签，只需将 ``-s`` 开关传递给 tag 命令::
+要创建签名标签，将 ``-s`` 开关传递给 tag 命令::
 
     $ git tag -s [tagname]
 
@@ -596,7 +586,7 @@ Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的
 如何验证签名标签
 ~~~~~~~~~~~~~~~~
 
-要验证签名标签，只需使用以下 ``verify-tag`` 命令::
+要验证签名标签，使用以下 ``verify-tag`` 命令::
 
     $ git verify-tag [tagname]
 
@@ -614,8 +604,8 @@ Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的
     # gpg: Signature made [...]
     # gpg: Good signature from [...]
 
-如果你正在验证其他人的 git 标签，那么你将需要导入他们的 PGP 密钥。
-请参阅下面的":ref:`身份验证`"部分。
+如果你正在验证其他人的 git 标签，则需要先导入他们的 PGP 密钥。请参阅
+下面的 :ref:`身份验证` 部分。
 
 配置 git 始终对带注释的标签（annotated tags）进行签名annotated tags
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -628,13 +618,12 @@ Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的
 如何使用签名的提交
 ------------------
 
-创建签名提交很容易，但在 Linux 内核开发中使用它们要困难得多，因为它依赖
-于发送到邮件列表的补丁，并且此工作流程不保留 PGP 提交签名。此外，当重新
-调整仓库以匹配上游时，甚至你自己的 PGP 提交签名最终也会被丢弃。因此，大
-多数内核开发人员不会费心签署他们的提交，并且会忽略他们在工作中依赖的任何
-外部仓库中的签名提交。
+也可以创建签名提交，但它们在 Linux 内核开发中的作用有限。内核贡献工作流
+依赖于发送补丁，而将提交转换为补丁时不会保留 git 提交签名。此外，当你把
+自己的仓库变基到更新的上游时，PGP 提交签名最终会被丢弃。因此，大多数内核
+开发人员不会费心签署提交，并会忽略其工作所依赖的任何外部仓库中的签名提交。
 
-但是，如果你的工作 git 树在某些 git 托管服务（kernel.org、
+不过，如果你的工作 git 树在某些 git 托管服务（kernel.org、
 infradead.org、ozlabs.org 或其他）上公开可用，那么建议你签署所有 git
 提交，即使上游开发人员不直接受益于这种做法。
 
@@ -642,15 +631,15 @@ infradead.org、ozlabs.org 或其他）上公开可用，那么建议你签署
 
 1. 如果需要执行代码取证或跟踪代码来源，即使是外部维护的带有 PGP 提交签名
    的树对于此类问题也很有价值。
-2. 如果你需要重新克隆本地仓库（例如，在磁盘故障后），这可以让你在恢复工
-   作之前轻松验证仓库的完整性。
+2. 如果你需要重新克隆本地仓库（例如，在重装系统后），这可以让你在恢复工
+   作之前验证仓库的完整性。
 3. 如果有人需要挑选你的提交，这可以让他们在应用之前快速验证其完整性。
 
 创建签名提交
 ~~~~~~~~~~~~
 
-要创建签名提交，你只需将 ``-S`` 标志传递给 ``git commit`` 命令（由于
-与另一个标志冲突，所以它是大写的 ``-S`` ）::
+要创建签名提交，将 ``-S`` 标志传递给 ``git commit`` 命令（由于与另一个
+标志冲突，所以它是大写的 ``-S`` ）::
 
     $ git commit -S
 
@@ -667,7 +656,6 @@ infradead.org、ozlabs.org 或其他）上公开可用，那么建议你签署
 
 .. _身份验证:
 
-
 如何使用签名补丁
 ----------------
 
@@ -683,6 +671,10 @@ infradead.org、ozlabs.org 或其他）上公开可用，那么建议你签署
 安装和配置 patatt
 ~~~~~~~~~~~~~~~~~
 
+.. note::
+
+    如果你使用 B4 发送补丁，那么 patatt 已安装并集成到工作流中。
+
 Patatt 已针对许多发行版进行了打包，因此请先检查那里。你还可以使用
 “ ``pip install patatt`` ”从 pypi 安装它。
 
@@ -720,8 +712,8 @@ DKIM 和 patatt 签名，例如::
 如何验证内核开发者身份
 ======================
 
-签署标签和提交很容易，但是如何验证用于签署某项内容的密钥是否属于实际的内
-核开发人员而不是恶意冒名顶替者？
+签署标签和提交并不复杂，但是如何验证用于签署某项内容的密钥是否属于实际的
+内核开发人员而不是恶意冒名顶替者？
 
 使用 WKD 和 DANE 配置auto-key-locate（自动密钥检索）
 ----------------------------------------------------
@@ -760,14 +752,14 @@ HTTPS/TLS 世界对集中式证书颁发机构的需求。PGP 将这一责任留
 用户，而不是由各种软件制造商规定谁应该是你值得信赖的认证实体。
 
 不幸的是，很少有人了解信任网是如何运作的。虽然它仍然是 OpenPGP 规
-范的一个重要方面，但最新版本的 GnuPG（2.2 及更高版本）已经实现了
+范的重要组成部分，但最新版本的 GnuPG（2.2 及更高版本）已经实现了
 一种称为“首次使用信任”(TOFU) 的替代机制。你可以将 TOFU 视为“类似
 SSH 的信任方法”。使用 SSH，第一次连接到远程系统时，其密钥指纹会被
 记录并记住。如果将来密钥发生变化，SSH 客户端将向你发出警报并拒绝连
 接，迫使你决定是否选择信任更改后的密钥。同样，第一次导入某人的 PGP
 密钥时，它被认为是有效的。如果将来的任何时候 GnuPG 遇到具有相同标
-识的另一个密钥，则先前导入的密钥和新密钥都将被标记为无效，你将需要手
-动确定保留哪一个。
+识的另一个密钥，则先前导入的密钥和新密钥都将被标记为待验证，你将需要
+手动确定保留哪一个。
 
 我们建议你使用 TOFU+PGP 组合信任模型（这是 GnuPG v2 中新默认的）。
 若要设置它，在 ``~/.gnupg/gpg.conf`` 中添加（或修改）

-- 
2.55.0.822.g20453c30eb

