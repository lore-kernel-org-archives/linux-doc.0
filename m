Received: from mta0.migadu.com (out-167.mta0.migadu.com [91.218.175.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9CF30F526
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787498021; cv=none; b=EtPPXw48ObsvAp2zSJQ6TiujuIr9T2vlvuOfyHcZv3v2LkZ6O9K2NBfcCWIhX6MINZCCvxM5yqvUa1xYc2TTyFQWUgU1Vqb4NUGCvkjph5RThreeIR7SUSyEhkkFzmHLd3Lr8k3tDyXznLTn+7pxVU28mJUi1UgGQ3DCnerSJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787498021; c=relaxed/simple;
	bh=2M0QRvtfvFMUeBwd9Ss6zo57jCKj/Jz/kXzCVsW9mO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FL9G8/zMaJHb6mBotdDaIIP4vaLO4Z1w2yqJYQX/Gpbn1GV+4RhfTNl2G3g6NpykG0HrxrKV+mIh8Ukj1oAMyVL0AC2Ppj5i/4dEPK5dXLpMl+ZTccDCRIOZ6kenwSo2TtAE6a5Dit8nmfZhDhJ88o42FhjyOJEYjAO8Er1+A8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=tRP6yc9k; arc=none smtp.client-ip=91.218.175.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="tRP6yc9k"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2M0QRvtfvFMUeBwd9Ss6zo57jCKj/Jz/kXzCVsW9mO0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787498017; v=1; x=1788102817;
 b=tRP6yc9k5q/Qod3V40KJtospJAHbsft/vgTJWlyPOrnSyHObnuCsxv27csVYMUCLTAGHBN1t
 Yqj+ypnDt4pFixZyxjjeZT7s8cNDzN7ugdlX8DL3jTNCSpmcxIJe4gZmEGC/5uVO5lP8B2a8qgj
 GmiPYNdkTl76DcdVltnHxAJJbHfyo9m0cBbZpN+XuNX4qfOFd1PKpNV0Z7xCio/M/gibppg1LBL
 BmsAA+kpgFOTyIDYDokVtv4QYfCSfWVecCJLKGoFU/UfWJGuYIJRzxMNKNBUdpHyFjK/CuDVq0k
 MWj5T7SX9EAfForE7sf4oAT2bGPkgG/g+4ia1ep8Fi6jg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 62bd571366acaf64;
	Sun, 23 Aug 2026 15:13:27 +0000
X-Mizu-Trace-ID: 62bd571366acaf64
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Sun, 23 Aug 2026 23:13:12 +0800
Subject: [PATCH] docs/zh_CN: update maintainer/configure-git.rst
 translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260823-configure-git-v1-1-3c65eefcc585@wyuan.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avErBPMSKqrRAu10aaFhWYE0d2zW
 r7F/xdEDIQR+uKCgAdFWn1GVRZgZuUdMpqyQXAheStqZlZvyaWAzNHOZCsVKt5p22jIzRbQ0vn
 9hvF3THpBs78TuO8HlcVrA3EAAAA=
X-Change-ID: 20260823-configure-git-686aea09bf5b
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Wu XiangCheng <bobwxc@email.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Upstream documented the common 'git tag -s' workflow and cleaned up
unneeded RST markup. It briefly updated the automatic lore Link: hook
for Git 2.41 and HTTPS, then removed that guidance because Link: tags
should only point to useful additional information.

Add a SPDX-License-Identifier.

Remove a useless top-of-file label, as Jon always tries to do.

Update the translation through commit 944df7a31452
("docs: update the guidance for Link: tags").

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
Hi Jon, I added a SPDX-License-Identifier for this file while the
original English one doesn't have one yet. Should I do that? / Is it
"legal" to do so? , if XiangCheng would be happy with what I'm doing.

Also the same concern:

https://lore.kernel.org/linux-doc/20260823-maintainer-pgp-guide-v2-3-bea33b2ece54@wyuan.org/

Thanks.
---
 .../zh_CN/maintainer/configure-git.rst             | 50 ++++++----------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/Documentation/translations/zh_CN/maintainer/configure-git.rst b/Documentation/translations/zh_CN/maintainer/configure-git.rst
index a45ea736f73b..41a1fc0ae884 100644
--- a/Documentation/translations/zh_CN/maintainer/configure-git.rst
+++ b/Documentation/translations/zh_CN/maintainer/configure-git.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/maintainer/configure-git.rst
@@ -5,58 +7,32 @@
 :译者:
 
  吴想成 Wu XiangCheng <bobwxc@email.cn>
+ 袁维杰 Weijie Yuan <wy@wyuan.org>
 
-.. _configuregit_zh:
+配置 Git
+========
 
-Git配置
-=======
+本章介绍维护者级别的 Git 配置。
 
-本章讲述了维护者级别的git配置。
-
-Documentation/maintainer/pull-requests.rst 中使用的标记分支应使用开发人员的
-GPG公钥进行签名。可以通过将 ``-u`` 标志传递给 ``git tag`` 来创建签名标记。
-但是，由于 *通常* 对同一项目使用同一个密钥，因此可以设置::
+拉取请求中使用的带标签分支（参见 Documentation/maintainer/pull-requests.rst）
+应使用开发者的 GPG 公钥签名。向 ``git tag`` 传递 ``-u <key-id>`` 可以创建签名标签。
+不过，由于你对同一项目 *通常* 会使用同一个密钥，因此可以在配置中设置该密钥并使用 ``-s``
+选项。使用以下命令设置默认的 ``key-id``::
 
 	git config user.signingkey "keyname"
 
-或者手动编辑你的 ``.git/config`` 或 ``~/.gitconfig`` 文件::
+也可以手动编辑你的 ``.git/config`` 或 ``~/.gitconfig`` 文件::
 
 	[user]
 		name = Jane Developer
 		email = jd@domain.org
 		signingkey = jd@domain.org
 
-你可能需要告诉 ``git`` 去使用 ``gpg2``::
+你可能需要让 ``git`` 使用 ``gpg2``::
 
 	[gpg]
 		program = /path/to/gpg2
 
-你可能也需要告诉 ``gpg`` 去使用哪个 ``tty`` （添加到你的shell rc文件中）::
+你可能还需要告诉 ``gpg`` 使用哪个 ``tty`` （将其添加到 shell 的 rc 文件中）::
 
 	export GPG_TTY=$(tty)
-
-
-创建链接到lore.kernel.org的提交
--------------------------------
-
-http://lore.kernel.org 网站是所有涉及或影响内核开发的邮件列表的总存档。在这里
-存储补丁存档是推荐的做法，当维护人员将补丁应用到子系统树时，最好提供一个指向
-lore存档链接的标签，以便浏览提交历史的人可以找到某个更改背后的相关讨论和基本
-原理。链接标签如下所示：
-
-	Link: https://lore.kernel.org/r/<message-id>
-
-通过在git中添加以下钩子，可以将此配置为在发布 ``git am`` 时自动执行：
-
-.. code-block:: none
-
-	$ git config am.messageid true
-	$ cat >.git/hooks/applypatch-msg <<'EOF'
-	#!/bin/sh
-	. git-sh-setup
-	perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://lore.kernel.org/r/$1|g;' "$1"
-	test -x "$GIT_DIR/hooks/commit-msg" &&
-		exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
-	:
-	EOF
-	$ chmod a+x .git/hooks/applypatch-msg

---
base-commit: 66fb95a521110da673090294561844c9f76ebe64
change-id: 20260823-configure-git-686aea09bf5b

