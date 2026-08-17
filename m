Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E643E4A1
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975867; cv=none; b=V09r9L3RzCXaByTDk019d0bNFZonLNZa0fRB8lRimT1kcVGFqkmZRZwT11gzh6+H/BRCNqTQ+WVeDq/oK35TbSTgYF7jUjOQ4/s1V6qlEIXZ/vFDBAeoy2omO81b0WbrrwJFGc8n1zTlqc9YZYeqjXFTB508hy5MdyJ9ICsLTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975867; c=relaxed/simple;
	bh=2nsRKq+MZMB/fcm4FS98S6MC32XeeYuTRlO8wiSCnhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOhUya/nj9Dktv+BjkhBsymf8YS0V2jcW0z1/drx3Rs83TpECzqAS7VPG/WESr2LQ5RN7T0xB/bVDyn44DToB8TNQfiVwddddbFMj5JNJTQxrrZLBHmQBK6UpPdtvRq3QVA/jXwzCn/4nQfSkzIa+3tg/gXgV/iLoRh0fKofWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Wfsv9c9c; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Wfsv9c9c"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2nsRKq+MZMB/fcm4FS98S6MC32XeeYuTRlO8wiSCnhQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786975863; v=1; x=1787580663;
 b=Wfsv9c9cyd3/dVdCbHrhVPUYlKbmnyCb/EKXjhuu79DBhCDHsNS+wRuIHZSxyqXXF5Id9XJq
 FCVH5FB2OqvaVvzqEWoj6L4s2gCXHxFTm6SGpaghP1VGu2wNPVr0exM+IaufqqQB2NZMzmYY4vi
 wc7dzP46sL7qYPAnuDVmWXRW/In+g6Rq5IcVelRE2giGmjAuro1VKtM0b+bYiE81CZWQoDJbHf5
 LhHfTGHKOjOzJxuP8skKzt+VZufRflxkmw2y+DoECAUhujv2QxycYB769kRaEzXEeqezjokNqoF
 jq3vu5Bq2V00TMHBFRt/iOUtdO6oYqQfEJ36i7ORtAnNQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.127.in-addr.arpa (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 3054c1980ab72533;
	Mon, 17 Aug 2026 14:11:03 +0000
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Mon, 17 Aug 2026 22:09:58 +0800
Subject: [PATCH 2/2] docs/zh_TW: link to Traditional Chinese
 applying-patches translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-apply-patches-tw-v1-2-c182c1c425ba@wyuan.org>
References: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org>
In-Reply-To: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2965; i=wy@wyuan.org;
 h=from:subject:message-id; bh=2nsRKq+MZMB/fcm4FS98S6MC32XeeYuTRlO8wiSCnhQ=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqxmsSiGBm6hPS7tjFtLHFtepXYoTtTXT52w9fRvruV5z
 f75qe4dE1kYxLgYLMUUWRTznl/gcg/YO21FxHmYOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdAx5iBi1MApnpyAsP/SuXfKtPWdp+6Jza7QfCT0bInyo7fXsndqOGvW6yao7YxjOGfzr0ah7N
 yd71Vc3eyn7gV47+8uzhiqp7UvWUzLt6eXpzFCwA=
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

Now that process/applying-patches.rst has been translated into
Traditional Chinese, update the references in zh_TW howto.rst and
admin-guide/README.rst to point to the Traditional Chinese
translation instead of the English original.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_TW/admin-guide/README.rst | 3 +--
 Documentation/translations/zh_TW/process/howto.rst      | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index 9be4915ae420..d32964f2c307 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -86,7 +86,7 @@ Linux內核6.x版本 <http://kernel.org/>
    補丁，則不應先應用6.0.1和6.0.2的補丁。類似地，如果您運行的是6.0.2內核，
    並且希望跳轉到6.0.3，那麼在應用6.0.3補丁之前，必須首先撤銷6.0.2補丁
    （即patch -R）。更多關於這方面的內容，請閱讀
-   :ref:`Documentation/process/applying-patches.rst <applying_patches>` 。
+   Documentation/translations/zh_TW/process/applying-patches.rst 。
 
    或者，腳本 patch-kernel 可以用來自動化這個過程。它能確定當前內核版本並
    應用找到的所有補丁::
@@ -292,4 +292,3 @@ Documentation/translations/zh_CN/admin-guide/bug-hunting.rst 。
 更多用GDB調試內核的信息，請參閱：
 Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
 和 Documentation/process/debugging/kgdb.rst 。
-
diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 8466f6af96cc..176506c52402 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -146,8 +146,8 @@ Linux核心程式碼中包含有大量的文件。這些文件對於學習如何
     有助於核心開發的外部文件列表。如果你在核心自帶的文件中沒有找到你想找
     的內容，可以查看這些文件。
 
-  :ref:`Documentation/process/applying-patches.rst <applying_patches>`
-    關於補丁是什麼以及如何將它打在不同核心開發分支上的好介紹
+  :doc:`Documentation/translations/zh_TW/process/applying-patches.rst <applying-patches>`
+    說明何謂修補程式，以及如何將它套用至不同核心開發分支的實用介紹
 
 核心還擁有大量從程式碼自動產生或者從 ReStructuredText(ReST) 標記產生的文件，
 比如這個文件，它包含核心內部API的全面介紹以及如何妥善處理加鎖的規則。所有
@@ -498,4 +498,3 @@ Kerrisk和Alex Shepard的評審、建議和貢獻。沒有他們的幫助，這
 
 
 英文版維護者： Greg Kroah-Hartman <greg@kroah.com>
-

-- 
2.55.0.717.g61afef3e37

