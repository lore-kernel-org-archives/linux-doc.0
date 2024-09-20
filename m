Received: from mail.bmwiedemann.de (mail.bmwiedemann.de [188.40.142.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F013BB50
	for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.142.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726816338; cv=none; b=uM4iK16Nvo6yvtVGZOp73RHfbTTLiZ7mYEosKAMWqapg73cGTS+53D06h1QKzWBrwAA/+dnL2oikLcy/FpDw2fSEL9ijDZNskYLIntcr5Yvyt32lB1imObortlgs0PzPhznRNTa5VHekBIHOT5BMdzbMrvDgvt48/sYDKnxNdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726816338; c=relaxed/simple;
	bh=ApiwKMS8mRc8y2NHRt31498ga+FkSurvAhh5++s12KQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7vtv8BRMz5lXrwtUyjYAwcyR9ECmIWtz+9/g9EjV/8IbnsORIMTP/ha4FjzI6L9E98J/SvhKB49PQr+N3R8uFEaoz6hiZ7r0BmW1LkqFOEovp4NtNeKUrtf2DfKrNsGgGgNgHCk7sj9pGSYrTgF04qngNJohaIgiEkIyWtC6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de; spf=pass smtp.mailfrom=zq1.de; dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b=kqOdtBPT; arc=none smtp.client-ip=188.40.142.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zq1.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b="kqOdtBPT"
Received: from mail.bmwiedemann.de (localhost [127.0.0.1])
	by mail.bmwiedemann.de (Postfix) with ESMTP id 65E8916C3;
	Fri, 20 Sep 2024 07:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lsmod.de; s=202205;
	t=1726815712; bh=ApiwKMS8mRc8y2NHRt31498ga+FkSurvAhh5++s12KQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kqOdtBPTsKiJEXoKhuQi0EuhOY7MWyj4f+aJ8GYJvq9MV2YpGQ+c/cTTHhTjOQGrL
	 jjxjtcCybX8qW9fLl9f5UiVfDnmXJ8pSvoEOgt8jfdyk7rm75PxZnY8HG3MoIw3DKr
	 Hqth/4yByzcdKCmsqhJ6liquzWHklACTIefQN27LkzosM05dMEjYij4b6dfp7JD0T5
	 ZpwKcHytDW/uLmwuBbiBrlAIebF+PPBha/yAyhDiSYve44HawuvCkDGzAGctdu+ICn
	 cK0StINm2V4OXKeBKLoGLcLrC7gvE8PB4SkFhfPRjl++1n0mPqFhZD/ko5Pd1IAYK0
	 iD6VjezCNWcQQ==
X-Spam-Level: 
Received: from zq1.de (unknown [10.8.5.115])
	by mail.bmwiedemann.de (Postfix) with ESMTP;
	Fri, 20 Sep 2024 07:01:51 +0000 (UTC)
Received: by zq1.de (Postfix, from userid 1000)
	id 11F001A083F; Fri, 20 Sep 2024 09:01:50 +0200 (CEST)
From: bernhard+linux-doc@lsmod.de
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Bernard Zhao <bernard@vivo.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: [PATCH] docs/zh_TW+zh_CN: Make rst references unique
Date: Fri, 20 Sep 2024 09:01:44 +0200
Message-Id: <20240920070144.26947-1-bernhard+linux-doc@lsmod.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>

We found that sphinx parallel processing would randomly pick
one or the other
https://github.com/sphinx-doc/sphinx/issues/6714#issuecomment-2362212754

Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
---
 Documentation/translations/zh_CN/dev-tools/gcov.rst | 8 ++++----
 Documentation/translations/zh_TW/dev-tools/gcov.rst | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/gcov.rst b/Documentation/translations/zh_CN/dev-tools/gcov.rst
index 3158c9da1318..ea8f94852f41 100644
--- a/Documentation/translations/zh_CN/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_CN/dev-tools/gcov.rst
@@ -120,7 +120,7 @@ gcov的内核分析插桩支持内核的编译和运行是在同一台机器上
 如果内核编译和运行是不同的机器，那么需要额外的准备工作，这取决于gcov工具
 是在哪里使用的:
 
-.. _gcov-test_zh:
+.. _gcov-test_zh_CN:
 
 a) 若gcov运行在测试机上
 
@@ -140,7 +140,7 @@ a) 若gcov运行在测试机上
     如果文件是软链接，需要替换成真正的目录文件（这是由make的当前工作
     目录变量CURDIR引起的）。
 
-.. _gcov-build_zh:
+.. _gcov-build_zh_CN:
 
 b) 若gcov运行在编译机上
 
@@ -205,7 +205,7 @@ kconfig会根据编译工具链的检查自动选择合适的gcov格式。
 --------------------------
 
 用于在编译机上收集覆盖率元文件的示例脚本
-（见 :ref:`编译机和测试机分离 a. <gcov-test_zh>` ）
+（见 :ref:`编译机和测试机分离 a. <gcov-test_zh_CN>` ）
 
 .. code-block:: sh
 
@@ -238,7 +238,7 @@ kconfig会根据编译工具链的检查自动选择合适的gcov格式。
 -------------------------
 
 用于在测试机上收集覆盖率数据文件的示例脚本
-（见 :ref:`编译机和测试机分离 b. <gcov-build_zh>` ）
+（见 :ref:`编译机和测试机分离 b. <gcov-build_zh_CN>` ）
 
 .. code-block:: sh
 
diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
index ce1c9a97de16..39ac3fff44cd 100644
--- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst
@@ -120,7 +120,7 @@ gcov的內核分析插樁支持內核的編譯和運行是在同一臺機器上
 如果內核編譯和運行是不同的機器，那麼需要額外的準備工作，這取決於gcov工具
 是在哪裏使用的:
 
-.. _gcov-test_zh:
+.. _gcov-test_zh_TW:
 
 a) 若gcov運行在測試機上
 
@@ -140,7 +140,7 @@ a) 若gcov運行在測試機上
     如果文件是軟鏈接，需要替換成真正的目錄文件（這是由make的當前工作
     目錄變量CURDIR引起的）。
 
-.. _gcov-build_zh:
+.. _gcov-build_zh_TW:
 
 b) 若gcov運行在編譯機上
 
@@ -205,7 +205,7 @@ kconfig會根據編譯工具鏈的檢查自動選擇合適的gcov格式。
 --------------------------
 
 用於在編譯機上收集覆蓋率元文件的示例腳本
-（見 :ref:`編譯機和測試機分離 a. <gcov-test_zh>` ）
+（見 :ref:`編譯機和測試機分離 a. <gcov-test_zh_TW>` ）
 
 .. code-block:: sh
 
@@ -238,7 +238,7 @@ kconfig會根據編譯工具鏈的檢查自動選擇合適的gcov格式。
 -------------------------
 
 用於在測試機上收集覆蓋率數據文件的示例腳本
-（見 :ref:`編譯機和測試機分離 b. <gcov-build_zh>` ）
+（見 :ref:`編譯機和測試機分離 b. <gcov-build_zh_TW>` ）
 
 .. code-block:: sh
 
-- 
2.35.3
