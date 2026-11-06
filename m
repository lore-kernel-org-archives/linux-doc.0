Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965001;
	b=b202fvADWK30o0SWkOO+KztQvM37LNulMwBn9kb2S7RNcvwYAJFOFFlPUErvm9ZaOpJM
	 lOMAoyYFRNjwAcZ7tIPCtIF9f6avNYt0q/0dLIUOtXMyPE7VduRQfS5NK00+xViO6vhPn
	 BM+vLmmYZgSMuyoYcJH7prEX62xWBmzQDh7yM+6lOFTV/ZFC5aRjkg1iEqs3w3vrM/WQj
	 GYiNdI+KolP9Z8/OaUb3PxJhJ3tYLeeda/vPLTY9tZf4eZyZQeG9XTAK/H2yXqIZolzKy
	 FED5RRfKA91PaGV9ZrrrXgdVQWc9RmMmtUUM3K1fh+piwmXqlTkVKAxmUzKd+xxAb1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=izHqOwhL2z8wx4Qpnodt2553sHWWc6u2gGQnZJlajzc=;
	b=D2GttmotcfapjwnJg1cyZHTjfzbvzj2UoAVnY2J+niGgYDHHw6aUiQ9yzO7gyKUCaeV7
	 G9x1lbjvcAWhHvLFmezQVDzqFvKUOI8XyjtUtDBoUggxb08mBhA4gPys1M6GDshzqrbHl
	 NbsYMhPhjPaXssKTEOShQe5ILKcOu1VVRgrHrt/tncbaX+zifnu/exRwju0az7g7t3C1M
	 wHusJPvWPphrR4dPyuvXwDY3JuBakZydfvzzqmWdtw37KpEW+LuwrfWwN/ylJhHVhKhU9
	 g6SS9IJqNyduyyasLMLkMjFALZq7wKxNK0twYHsbAq5+a14K0CbnnXUfDuT3po1+RgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqAoM35A;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559160A6F78
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7559160A6F78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqAoM35A
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d0f38abdso67217a91.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793965001; x=1794569801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=izHqOwhL2z8wx4Qpnodt2553sHWWc6u2gGQnZJlajzc=;
        b=lqAoM35ABbgtoGNNHPXav+FYQuq72rmIQoURX4SZz7LUMjhku1xd3UhHvzeOt/S394
         gc53DP8MhAoB5Zzbn3u9SSraDKzOxOPa7vnWaFWBS/JHHIx4oaYcSZm5+SRU5OY6CP2j
         nZ96A5GZKkD47ipddyrdlpyXh2I+qYY85SToVXfXrPq8yetyQqrJ/CwcR0UG9/jgShKX
         /uD4VAEKAKK27ysb6BICav2bnHNBC4pZSdjvDpQnpIcUUgnDlrefIW8WUKmeqIDqjkFW
         /i5PdlT4KM/zloborSSA1RqMVqHtM/LchPE++y57y5SmqT8fFdVBU0tdTTBlRvo7Lbls
         UBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965001; x=1794569801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izHqOwhL2z8wx4Qpnodt2553sHWWc6u2gGQnZJlajzc=;
        b=nAf9FWHTRMehJeogC/PCOUt6wngVsEq2kSIawrtk8Y+B0dc+uiJKVQvH4FePc++fz4
         Wrw3Ou82bAy4nThE1X0NlX/fWzSisvYZO8dTH3a2uF0hBwpwozaKJ+Dby4aXF1JImEQm
         QzsW58+JaHQ1xB9c7AME50Ppmp3RYFpDXzWVKi8+9LJxEdYAYhRaW6hvMxuqcpnERQW5
         4XlaPLkhJpbMdsIbDNxLhbQxmK2zpnBCpwz3GLJyD6+2Yqlz8nyfI3B+4GHns3+orouo
         WrvVUj6zJFOhGOGlpTVtWUSDyNgggp3tM4kjg9il4qutC/PES7gDO4VRdbvx0ZOOGHyk
         DiMQ==
X-Forwarded-Encrypted: i=1; AL+hErH68RL2pa6yQZrYkhClAiEPj2vCzpyeDSbELAOuHgKQCxCMgm62snbBu38TiYGI/l2qdqIjoVnL2hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bshGMkZ0Q7Djm1kuzjLTMGmIDgborrY75orYJIhYnhYf/fhBS
	2wsNX/icrm2QOWc747r8HUT702bRGKL8VvKR2VoL05TdTpQEoHH5YmRe6TxXKJ5I
X-Gm-Gg: AYBFou36hVdkdwHV4XWscvu6fyYaAcpupalDY3HOBOOhxlcsIJ8YkJSKkIbbnJ6g270
	44hicL97Yhs6exvYv4uo7mAjNi8SIcHCnSBpHVEvQSatQup4g09GZG5NEzTo+AVyMnkxrSD5LLb
	aYUIx5IyFolM5sPYmpmWL2bhHrP28DJlPPscaB2RgdtYpWG9h29odIbGyeVfZUaY6Xa1NQzcEl2
	ven8jYUlYoZj4DPIxZYlmqQXJNjfIevPIqQbrvLuaF6tTZ44MkkGcNZmpzOYgXenLiKOGItw9la
	vgAKKRYn7hh1RbyOR6nyysne4w/YKmwfchK7shJ5cYBNYKjyXffZuECpMx8xNRgpYoF+KlND4FX
	6Tc9VqpKomMOp78rzu7JZ23HkI/NMJT80KGNg3JsvVs6YQqNbkhJ9EaAcXplKepEgh76tDbGMNo
	9mV9YfHSGNvid+fNRpBcjOFJnl3Me4onuaxL24cM++ORux5jQ260BvsLg/S0atw2/0zYghO83/0
	iD3g/v8GpfkpJVXKcwNtvBl5APrTiX/2EDQ1Sv0dLQC4WfPI7L0Tz0rWr1rxUFfOaqexyIGv/MJ
	g3Y6vvQqd/PnCbw7agbrb+cVr3ZzPwvcDqceeBaZ+sLqq9CS9aMxFgtTHV0LxemQcdOfLtDcPL6
	nljmW/Rq+qgeVzgnoO8OwQjxo
X-Received: by 2002:a17:90b:2b46:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b0db7349d6mr3505266a91.6.1793965000909;
        Fri, 06 Nov 2026 03:36:40 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:40 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 13/13] docs/zh_TW: process: add maintainers.rst translation
Date: Fri,  6 Nov 2026 19:35:44 +0800
Message-ID: <20261106113545.708896-14-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
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
---
 .../translations/zh_TW/process/index.rst      |   5 +-
 .../zh_TW/process/maintainers.rst             | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+), 4 deletions(-)
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
index 000000000000..9110241d8a2e
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/maintainers.rst
@@ -0,0 +1,127 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/maintainers.rst
+
+.. _tw_maintainers:
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

