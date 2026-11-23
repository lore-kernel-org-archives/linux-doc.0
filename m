Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432046;
	b=etirqrd2B5YZYuqftLOSn6CEfzkTPTkCJq59yNcuiNaWHBuMnO1aKEmfb0WtcXqU7wbb
	 ehoAYGUxs3yHgkD1A2lEW8o3YQ8ERzZPmd2CbhMloJTgLeD7KmZeA/hYycR5qwM25hq/5
	 O5XFHGcJYgQTq1e6dZrJKV7xOW3kR8DH8qGoGjgmiiZB2Ha/09f7195wr56JV94EW2YhL
	 ATpWkyTPFj+3RELx7otIvbBX3WkSLepDYT2e7ChrDqFs3BJYgwcv1BXAebBUEsu2aSiiD
	 wio0JEiVI9luX04Rf9k7M9k4NIWY+aeW19mHFm9mv6tI7wL7p3zhyzmne3POZTBRCqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GXabR9ia41yS2QLE/mn6/LEDX+ZAw6/2EIiVuj5HhyA=;
	b=YiRgceypPLGPDo8t4THlgPmt4hxRCQrkU2V0tDr7QYo+AypMMVZ4cdRDxMkeGQ1wCU38
	 Hz9ir7bAyylDZFwX3XZ+C7dsEMMWueaqJAbp1wiCRdE2eIA4VLlgBohTb9y60VD+Cv2pm
	 +gUb1IGXwSSYw/4n0bCiGU9KhGt59SFu7GoVF9+CSCx/+TpdajpIwzkuZq42cC8Xt948W
	 GgF+pcYG7PwImj1Z6fwX4aOV0ZM85BWoBu5ibXFFpbPNYMHYT6hui3jeGLVymCsyApvBz
	 013a9rvQ7IWojJAIIs9v1A1GtVk++vWi182vO6KazFkSvmLBPVYJKiIBozq21j0UXGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLQfWydO;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A5606A6AA
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 280A5606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLQfWydO
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-384d1928a45so199801eec.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432045; x=1796036845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXabR9ia41yS2QLE/mn6/LEDX+ZAw6/2EIiVuj5HhyA=;
        b=JLQfWydO7Q+adrjdlX+JcZAU6jZGixSoQ1iQg45m7Zf1d4YR+50/D8UiEo39B+ASdS
         x58u0XfK0NBK/T54uSF2PEBrXQMecMo/CTd8+vEJsm/yE/gGkA2xQ21ftIB2VV9MP6Ga
         tKNA8lLcLpK4ZHzkR6Jk1qc9LaK1+mU1g8iWmbypoIjVkwedmCFlfOAx8j9lJVW3ASfp
         iYgi/kquS5604lWIvzjOB+GyPMiLtSgKHZbiKXxjst+omH6hpz66zCc4JSoJyIMZo1sC
         YhZ0sj4a7IMnvO3pz4/sycTFEYZ6c4uDfu1c4IYB1x8v4ofWsAEUonVZ//yPQs80xaAe
         ugnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432045; x=1796036845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXabR9ia41yS2QLE/mn6/LEDX+ZAw6/2EIiVuj5HhyA=;
        b=tH9O3SRPlTSlIk8nWLL6QRmvXd5vV+CcS99nHO6513+QMLR5x45Cc0mVUU+ZQ8EVTo
         JI2XNI2mNN5PfDO7m/HaHP4PZX6p5iZo20O2jnYBRMcGXoau49lad/xCOOKlTlKR/B/G
         K24J5Mnh+KXGPeqWc9mHOrt88ugFTvwgBCYJlxi+EMLWxvd59aC27HE6E/mrpwmkkwXD
         2vJ3pVk/c6CjDzagaElQq/+xsuFAz1Y1sBTGhvBxJ4bqCpYJwEoPJjyP9YeTsqnqb+zj
         rqva7Cg3kCRMmDflTodNzg5Ujri8bQ5NlzBVdd2dN1HPGAhCjTiBPTpQI1mhGSowpIr7
         kM2Q==
X-Forwarded-Encrypted: i=1; AL+hErHzzbLAV5BZh8+pDYRZQe+RbuBE6H4Y/zhOsKdkEK1j5XqZpWk5djbx0KG/dPpdDbSpJYVyM5r/bSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ATHSxxen8U3nIvOJt5zW5FhTLE0oyCPMgX4kUZiSza9ve/Oh3
	DAQz17n2y6PQDABeLGh083vxtGmrf2/mDsDkh6LWAvxZI6WwXZWnH0Vv
X-Gm-Gg: AZFdTZcbI3Q1+GqC6bQK99p7aYnd1a0ymKkb6aLeFcFB2H+KDVhO3WeTwWfSiJ1D975
	ZTQ7N4zYgPm9WYaulfcg+mR/DZu05EIvNm7qlb5+a+dOEtUC5kb1UhUmJasfAAtzU3TP+GpL6sf
	dGD390jzL9eDfMP1cJpLWsOMXeuyZKpejj7XIvItQu6Ckbo4KsQglPedMiFHU4cPuFvXZfLPOJM
	Kua+/oRhXcEu+8UBP0YI/OugOSuFTA3e2JUAUKCbrWz/gNkv0AM/PDSe2aZtnoseFIZiomi10GH
	VmqSy0edKQ7Iviox8fksEXWAsRWgjbEuyqTrPB3fP7VddZWH7iLLWeuvHKOrRh8R+WSQ0C41N44
	JPB7OoSvts83Upxf2I0Q63aC1aIKVryKNlTFDORVPbD71HJJxdSZPC84xVw5+mFZMHhIGSFXs9R
	kyZnIKmA83gT5M+953At1b+g9IeHF5BF0pi7GqBgI+AMvkHFIV8nDVhbfJihPKwN9ECZr9sWdWy
	irqsoNXFsGnxusRDsL8vlKhQpeGRQJDUZ9E9OmMEDS8iCBulk1law4ut5/pQFljq/C/H7FlDMGt
	u+qHKrQplO9HESlU3xeLODK24GZY48GR6zapqzt2oKQ9a1+TIsuzxZfxolQTsKnh2dJHOnoWu1u
	4geluaL5I80EUZPBZO18jD8mv
X-Received: by 2002:a05:7022:f516:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1b556850c86mr14214586c88.1.1795432045198;
        Mon, 23 Nov 2026 03:07:25 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:07:24 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 13/13] docs/zh_TW: process: add maintainers.rst translation
Date: Mon, 23 Nov 2026 19:06:36 +0800
Message-ID: <20261123110637.172045-14-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110637.172045-1-chenyou910331@gmail.com>
References: <20261123110637.172045-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation/process/maintainers.rst consists only of the
maintainers-include directive, which renders the top-level MAINTAINERS
file.  The directive cannot be reused in the translation, as it would
define the maintainers and maintainers_table labels a second time and
duplicate the whole maintainers table.

Instead, translate the descriptive header of MAINTAINERS (the section
entry descriptions and the note on the maintainers list) into
Traditional Chinese, and point readers to the English page and the
MAINTAINERS file for the list itself.  There is no zh_CN translation
of this file to consult.

List the new file in the toctree of process/index.rst, under
"Maintainer information" as in the English index, and drop it from the
TODOList.

update to commit 45a92c0b91d7 ("docs: maintainers: add SPDX license to
the file")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
 .../translations/zh_TW/process/index.rst      |   5 +-
 .../zh_TW/process/maintainers.rst             | 125 ++++++++++++++++++
 2 files changed, 126 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index e5eb5a276fb1..9ff8932760a2 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -104,10 +104,7 @@ TODOList:
    :maxdepth: 1
 
    maintainer-handbooks
-
-TODOList:
-
-* maintainers
+   maintainers
 
 其他材料
 --------
diff --git a/Documentation/translations/zh_TW/process/maintainers.rst b/Documentation/translations/zh_TW/process/maintainers.rst
new file mode 100644
index 000000000000..390c57fee3be
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/maintainers.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/maintainers.rst
+
+維護者列表
+==========
+
+.. note:: 英文原文使用特殊的 ``maintainers-include`` 指令，把核心原始碼樹
+          頂層的 ``MAINTAINERS`` 檔案整份嵌入文件中。本譯文只翻譯該檔案開頭
+          說明各欄位的部分；實際的維護者名單請參閱英文原文
+          :ref:`Documentation/process/maintainers.rst <maintainers>`，
+          或直接查看 ``MAINTAINERS`` 檔案。
+
+各節條目說明與建議順序
+----------------------
+
+``M:``
+  修補程式的收件人（*Mail*）：``FullName <address@domain>``
+
+``R:``
+  指定的審閱者（*Reviewer*）：``FullName <address@domain>``
+
+  發送修補程式時應副本（CC）給這些審閱者。
+
+``L:``
+  與此領域相關的郵件列表（*Mailing list*）
+
+``S:``
+  狀態（*Status*），為下列其中之一：
+
+  Supported
+    有人實際受僱照顧這部分。
+
+  Maintained
+    有人實際在照顧它。
+
+  Odd Fixes
+    有維護者，但他們沒有時間做太多事，只會偶爾加入一些修補程式。
+    見下文。
+
+  Orphan
+    目前沒有維護者［不過也許你在撰寫新程式碼的同時，可以接下這個角色］。
+
+  Obsolete
+    舊程式碼。標記為 obsolete 的東西通常表示它已經被更好的系統取代，
+    你應該改用那個系統。
+
+``W:``
+  提供狀態與資訊的網頁（*Web-page*）
+
+``Q:``
+  *Patchwork* 網頁式修補程式追蹤系統的網站
+
+``B:``
+  回報缺陷（*bugs*）的 URI。可以是含有詳細回報說明的網頁、缺陷追蹤系統的
+  直接連結，或 mailto: URI。
+
+``C:``
+  聊天（*chat*）的 URI，包含開發者通常聚集的協定、伺服器與頻道，例如
+  ``irc://server/channel``。
+
+``P:``
+  子系統概要（*Subsystem Profile*）文件，說明向該子系統提交修補程式的
+  更多細節。可以是核心原始碼樹中 Documentation/ 底下的 .rst 檔案，或是
+  一個 URI。詳見 Documentation/maintainer/maintainer-entry-profile.rst。
+
+``T:``
+  原始碼管理（*SCM*）樹的類型與位置。
+
+  類型為下列其中之一：git、hg、quilt、stgit、topgit
+
+``F:``
+  檔案（*Files*）與目錄的萬用字元模式。
+
+  結尾的斜線表示包含該目錄下的所有檔案，以及其子目錄中的檔案。
+
+  - ``F: drivers/net/``：drivers/net 中及其下各層的所有檔案
+  - ``F: drivers/net/*``：drivers/net 中的所有檔案，但不含其下各層
+  - ``F: */net/*``：「任何頂層目錄」/net 中的所有檔案
+  - ``F: fs/**/*foo*.c``：fs 任何子目錄中所有符合 ``*foo*.c`` 的檔案
+
+  每行一個模式，可以有多行 F:。
+
+``X:``
+  排除（*Excluded*）不由此條目維護的檔案與目錄，規則與 F: 相同。排除規則
+  會先於檔案比對進行檢查。可用來排除特定子目錄，例如：
+
+  - ``F: net/``
+  - ``X: net/ipv6/``
+
+  會比對 net/ 中及其下各層的所有檔案，但排除 net/ipv6/。
+
+``N:``
+  檔案與目錄的正規表示式（*Regex*）模式。
+
+  - ``N: [^a-z]tegra``：路徑中含有 tegra 的所有檔案（不包括像 integrator
+    這樣的檔案）
+
+  每行一個模式，可以有多行 N:。
+
+  scripts/get_maintainer.pl 對於符合 F: 模式的檔案與符合 N: 模式的檔案，
+  處理方式不同。預設情況下，比對到 F: 模式時，get_maintainer 不會查看
+  git log 歷史；比對到 N: 模式時，則會利用 git log 歷史，一併通知在 git
+  提交中留有簽名的人。
+
+``K:``
+  在修補程式或檔案中比對的內容正規表示式（*Content regex*，perl 擴充語法）。
+  例如：
+
+  - ``K: of_get_profile``：比對含有「of_get_profile」的修補程式或檔案
+  - ``K: \b(printk|pr_(info|err))\b``：比對含有 printk、pr_info 或 pr_err
+    其中一個或多個字詞的修補程式或檔案
+
+  每行一個正規表示式模式，可以有多行 K:。
+
+維護者名單
+----------
+
+.. note:: 閱讀此名單時，請先尋找最精確的領域。新增條目時，請保持條目依
+          字母順序排列。
+
+完整的維護者名單（依子系統排列的表格）請參閱英文原文
+:ref:`Documentation/process/maintainers.rst <maintainers_table>`。
-- 
2.43.0

