Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A3152CCCE
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687440; cv=none; b=U3uZY5yVkyJQYFx9RvVN0+6IiqHB2eDEv5LXX/Gom/o0HJap2nuynABs0+O4raTa5CJnEZiK55RFZbb1aDgHXohYaz7zsP4BNpgb1O7ub1DmaECoja5pMkq0hA02xVd4wYMboCkeCDgVTevC2tszb1EMxTyAwrnyqONSL0D0gTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687440; c=relaxed/simple;
	bh=zBKbG0KzM6OQ4o1N5qbkrX+umxPxp6lGncnT9tGExsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grbXrd9Fo1KgTfx69C//1r+V8/wpc3kJWubcE5B/sIgYW8s8cLPq6g4gVbF5Cb02xIbnnDP98uquE+2MsquJ/PpmMIDbK6PxZino7mdnddf0bhGc+FS0Kyw4YpZiA6+BGN3lTkkJtwiB0PhxHLSjsIblokGjG7T/H6ibIXgd5KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgGMMs8P; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgGMMs8P"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2ce6690b7so204465ad.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687438; x=1791292238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwBwKsXF/v6mM3m6KquI3cOCMBSzFiWq5kCFX5U77BA=;
        b=UgGMMs8PiKrW498PqhP9qQz5Z/D4TYbyDDcGyy1D+ikasf3AvoUHDGb8JP3/szGz6H
         AMpaZuB4QcoQ+8d+MuY90d1dTUtzbCiLTDQu8D5hvBwFAGiX8iOcu0Q36gPxL3y/k6Bg
         oJhCfYn5iE74qDNZCoi6o5a+domHOqlYVSfi5kkgr6dM7wWuPRTm8R99C3I4q3Ap+JK2
         yq9rP0RvIQddtOXo+n99XLApCVSuJ6cyjzV8JKZ/ljtZUMwDTMi01AoVBS+/vQNnNoRV
         K5wYi89qx/0vaKRZDtbBWNOhQIlv+3WWCtHXCQEgsRVrpVaAUHtuJDsLyxa6d0NHO3dM
         /OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687438; x=1791292238;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwBwKsXF/v6mM3m6KquI3cOCMBSzFiWq5kCFX5U77BA=;
        b=17R26TXu+/r9jRbxeZ5JmdStzUOjUwfBw6YcHPTCDniDAUrQwxe9keez3+DxqnQeZ9
         lWM7S/5T9rpfu/iXgeN6629fZp1yn8G8lcILhBnpKyBm24/3D23rPiBccoIcaM7wwetk
         PJWnR/Vag2ZgTYaw0UHHEU8/7ygyaJzL0SCrs0cb0RVi+BnrzV8/Sy4nRbeDlWBX7ZfE
         RUoI/WnA8tvhWuoZefr4tQsB19S7hR3AYj7WeiubN+2X4K4mAn+WRYD36whWRPOF178Q
         3taGmm2Lj6jRvom8kVV+wocxLgc0Vpg2OlLKp0CnTPVuNVC2VINIsCcRkW64s8dHSFh+
         pa+g==
X-Forwarded-Encrypted: i=1; AKwUvBxSsCZ21uvfULnaGkF+4mMU6E0lr3Y/vsO3ymhj0Rr8RDZVa9yY6MscHHuFwXRsOsOho+TAUe3wE+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWm1ihEonR9lpBLwNI7ACl/1iErd4+SuD5P4sR9hNo9kk1J8fl
	xyUKCjf2c2xXNp5kWj7s0plOwhd6zmW8Qoyij7fUhQ21TpRsSqahHUwrKIXgwQ==
X-Gm-Gg: AYBFou0VZupono0Xxmz0gQjQ/cMD5URSOa4ikHUxfKcngNPEt436BugvHQ/VEXFOE1a
	X95oeR3NM0L/uiGMeFbTT7vU9DzoLKw/ZI5oWRSudJ/qFUyELwC57+o/9RtCE2eQS917SqtXOgB
	FAdMUsjENyOXxcoTcKxInSf3goSjBvTsm709mlst7fyEosJPojOoEHBITGWqSPCQHnZFaT5NETd
	GOk1BCosQ69c3JL/S6IDP7vvycMNOgAVJk4MzACwM6gmA5PyOKceSbPhX7BhEZ3eQ3QWDIoKd4m
	brS7gPcfGBgtKRiR6pWQPP510L3EuGHeCG/AOLo1xmsMS/SP9dxlkYI3qyHl6jb1lEKkr+elIAk
	09gMq+flYywoCwYo1X+QZ+4cWk3ZfgGkealzqazlJWqPCai4R8xS5ZBNxSLjRFqn0Cz2MK/NjvI
	bbUWJ0qTTFqZEDrn/TSo2SMzq310hJvCGcH6y8L60mfJXDqmAe0GsAPN7BgDvLlmIyjUZojf1KI
	+6P4Wd+4RDSmhOco/X27T1poAxZYeHqI7IudthovA/cxRdyAzEJ73Useg==
X-Received: by 2002:a17:903:32cc:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2df8e71892amr163485735ad.3.1790687437771;
        Tue, 29 Sep 2026 06:10:37 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/4] docs/zh_TW: move gdb-kernel-debugging to process/debugging/
Date: Tue, 29 Sep 2026 21:10:17 +0800
Message-ID: <20260929131020.266120-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131020.266120-1-chenyou910331@gmail.com>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The English original moved from dev-tools/ to process/debugging/ in
commit d5af79c05e93 ("Documentation: move dev-tools debugging files to
process/debugging/"), but the translation stayed behind.
checktransupdate.py locates the English original from the translation's
path, so it currently reports:

  Cannot find the origin path for
  Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst

Move it to match the English layout, and fix the relative path of the
disclaimer include, which is now one level deeper.  zh_TW has no
process/debugging/ directory yet, so add an index.rst translated from
the English one, listing the guides not translated yet under TODOList,
and link it from process/index.rst in place of its TODOList entry.

The baseline needs a caveat.  The translation lacks
commit 6b219431037b ("docs/scripts/gdb: add necessary make scripts_gdb
step"), which went in before the move, but checktransupdate.py does not
follow renames and cannot report a change made at the old path.  Use the
move commit, the oldest baseline the tool can see, and record the
missing change here instead.  The tool will list
commit 09e1d93a421f ("scripts/gdb: update documentation for
lx_per_cpu"), which already edited this translation, together with the
one later change it really lacks, commit 7f7f468548ce ("Documentation:
Provide hints on how to debug Python GDB scripts").

For the new index.rst the tool will also list
commit a592a36e4937 ("Documentation: use a source-read extension for the
index link boilerplate"); that change only removes the index-link
boilerplate, which this translation does not carry.

update to commit d5af79c05e93 ("Documentation: move dev-tools debugging
files to process/debugging/")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/dev-tools/index.rst    |  1 -
 .../debugging}/gdb-kernel-debugging.rst       |  2 +-
 .../zh_TW/process/debugging/index.rst         | 70 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  2 +-
 4 files changed, 72 insertions(+), 3 deletions(-)
 rename Documentation/translations/zh_TW/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (99%)
 create mode 100644 Documentation/translations/zh_TW/process/debugging/index.rst

diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
index 915449762d1a..fafebd092a3d 100644
--- a/Documentation/translations/zh_TW/dev-tools/index.rst
+++ b/Documentation/translations/zh_TW/dev-tools/index.rst
@@ -26,7 +26,6 @@ Documentation/translations/zh_TW/dev-tools/testing-overview.rst
    sparse
    gcov
    kasan
-   gdb-kernel-debugging
 
 Todolist:
 
diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
similarity index 99%
rename from Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
rename to Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
index 8faa87f26c6a..a9ca1156fea6 100644
--- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
@@ -1,6 +1,6 @@
 .. highlight:: none
 
-.. include:: ../disclaimer-zh_TW.rst
+.. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 
diff --git a/Documentation/translations/zh_TW/process/debugging/index.rst b/Documentation/translations/zh_TW/process/debugging/index.rst
new file mode 100644
index 000000000000..4440aa6a97e2
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/debugging/index.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/debugging/index.rst
+
+============================
+給Linux核心開發者的除錯建議
+============================
+
+一般指南
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   gdb-kernel-debugging
+
+TODOList:
+
+* driver_development_debugging_guide
+* kgdb
+* userspace_debugging_guide
+
+特定子系統指南
+--------------
+
+TODOList:
+
+* media_specific_debugging_guide
+
+一般除錯建議
+============
+
+視問題而定，可用來追蹤問題、甚至用來確認問題是否真的存在的工具也各不相同。
+
+第一步，你必須先弄清楚要除錯的是哪一類問題。根據答案的不同，你的方法與
+工具選擇也可能有所不同。
+
+我是否需要在存取受限的情況下除錯？
+----------------------------------
+
+你對機器的存取是否受到限制，或是無法中斷正在進行的執行？
+
+在這種情況下，你的除錯能力取決於發行版所提供的核心內建的除錯支援。
+Documentation/process/debugging/userspace_debugging_guide.rst 簡要介紹了在
+這種情況下可用的各種除錯工具。在大多數情況下，你可以查看/boot目錄中的
+設定檔，來確認你的核心具備哪些功能。
+
+我是否擁有系統的root存取權限？
+------------------------------
+
+你能否輕易地替換有問題的模組，或安裝新的核心？
+
+若是如此，你可用的工具就多得多，相關工具請參見
+Documentation/process/debugging/driver_development_debugging_guide.rst 。
+
+時序是否是影響因素？
+--------------------
+
+重要的是弄清楚你要除錯的問題是穩定重現（也就是給定一組輸入時，總是得到
+相同的錯誤輸出），還是時有時無。如果問題時有時無，可能有某種時序因素在
+作用。如果在程式碼中插入延遲確實會改變其行為，那麼時序很可能就是其中一個
+因素。
+
+當時序確實會改變程式碼的執行結果時，用簡單的printk()來除錯可能行不通；
+類似的替代方案是使用trace_printk()，它會把除錯訊息記錄到追蹤檔案，而不是
+核心日誌。
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index de99156324df..bd638264bbe4 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -88,12 +88,12 @@ TODOList:
 .. toctree::
    :maxdepth: 1
 
+   debugging/index
    security-bugs
    embargoed-hardware-issues
 
 TODOList:
 
-* debugging/index
 * handling-regressions
 * threat-model
 * cve
-- 
2.43.0

