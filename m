Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964995;
	b=kSUgRMev91Qh6BSpV/v95Gue9RqZeAHSMRWY7eMBVCbQMc/vaR6w9rGsSc5BZ/gv46ZY
	 BHL3QEA1PVuFPh5knBWSpLNS9E/EsE9sB6lsmzjHb9nDSWz0CEp3vfHxrabW6s83anctU
	 WBwSHUFNvWaCpoqyyjptfC3W1531A2FSmJSyev2o8LqF5301EQAsrPzuGMiymCh+FCGCn
	 OT9o288Sb+8ddll1uZ5ji+CSFX1Q4zDdrU/+c6OA/qSbP+0wYXLbZ+EaS0+j4kRtGWRvf
	 8H6Kkalgl1DibEzUhgpGNACqxVLcVl6r0zofgvEvxe9BRYPuZ0oZJ3r1zXiuMe6m2YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=84LN+yk9SHs1lNdtGDMF3pv5mILXj5e9lWibGv9y35Y=;
	b=TiBKvQXKzlYLx6Ev08h2/zkMhGPCdIBjrliZv+OKHwPctkP7AHMIE/SWYM92Eab1wAho
	 qL86xwkBEcmBTIDwnvIR3mceoPN2hmXJXqcygZJFNsWNGQOciTcMGAU06iR8EIzKq2hBX
	 hpUtyNXBHYTqhkG/iVwr3/rZAzdWoHFcmMlq0ceYOl4Bcx0fHz7Ph8bVmyoPaOo6/VthT
	 RAgNcTGQe2mAQoQiq3YoahqGLsiQfJkqgDk518t+5IgmZ0qshvnoPS0yRMF9+4MB/RC/W
	 3sy1kBwvrZX0ho0izNpTEBOgGlQ4xdctiuQOkOVACo7gapViqT4H6IgtI/PP/isUAmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Cqv2/m52";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7660A263C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B7660A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cqv2/m52
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso88220a91.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964995; x=1794569795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=84LN+yk9SHs1lNdtGDMF3pv5mILXj5e9lWibGv9y35Y=;
        b=Cqv2/m52yC6nGWKQQumuSErXZZ5jlLXg/4S9Ymj9l2ojx5/TNnQODTozLoicShXulc
         2pHXjLZzPrrWRO5OcX4jMBT9/oMaTAUpCxSGXRV1LX25GBrDpsxC1Xc2EXZtSUtGsKob
         uHuCt9PIwwOt7uhOa1D4pYwHdGJ/ennXOYr3I60ocpk+YAdR+fFo+ofj3QWaL/3oKnQL
         U9obip4zvMD8F27o4C36/0wbEhmMeHGktp/X36KZGFJenjbBlbIE/WpZL8oiS+HxZpE8
         DfFcUiy8PgNUF5cmRMoRLvqxyqtS4pwO83/A5z67u8wSCIXJ0fUxk+suPtEb54xuRMjt
         tjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964995; x=1794569795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84LN+yk9SHs1lNdtGDMF3pv5mILXj5e9lWibGv9y35Y=;
        b=157zp6utRFuN4zaMcFMFErUETPCPJk7bSGLzAXqow/yHAUQnovL8usKA9Vm1EcyshP
         /ycTTVdQWdSitmBNQLHrrQMhxTi8UH+Ua/0Lj/d/qEgP1GlieUQMnb2ScSVKCjJeSizh
         0xEkflULzZXZIs2SoaPwqUBR3Ftkzkcq/c6nMDDVSozPMGB6UaKCN40eZgNgtQTzj0ju
         s4R2gLCtAiUS/680Nbn39rlD4XffyNQmbRuK2nbChFw2uNs7zQi0+FEFfmXfBTkc/Nhl
         cQ38Phag1rDK47m7/6RhC/afabb6siN9nn4mOKkepTeJqdamJDJbk1AcuD4ApxFzSnZG
         9ZWQ==
X-Forwarded-Encrypted: i=1; AL+hErFwIo3LgwZIKClmLEffAIE8RNofysC6EWXFQhS8zuOv2W6mAIuveKJg5ilc7WP0SkhTDIMliflds+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fF2eEslLdDXRD1o6xSEud8nKcf8wwg0ga30r5jwI+HRfEGnoW
	vvkj9FFO0LZV5j3arGMrJEyFdJDLPqch94JejL8+PtEB4pIxWUZkIobE
X-Gm-Gg: AYBFou3kKzC/SjfZ/VxL7LACO4DR4zUtTiPVNrypwf8ajBU3r3rjCYGm3CmJ5jFYRXe
	r+TeRRy03tX4IMzSpEVrcRTVoRQnfTnsv+w6XjyKdoiPssiQ/8+AFSKiE+T6OD43s0hujPGPzix
	R/3UF2X/5ru8VICylnxLS7RRjIXRwR1qhli5EtoXrHPsBr2U1i9UP3M53iI3GbOQd7XmPO9KcN3
	oazNMltG9yCE9DxLh49s8gwpdcfZ7lxMHe2II3iQksBwu/1XLkhLeAqU1t1ozYjPN+RMOUxZWKk
	TDLmIDUPDZK2ksL2bxejaP7MAc/sONyn7QbfT0IdCEXin4mIkpkYy+N689NmWlv+VejHhqmhcsA
	bIP5y2OSssGfJelneYBLGgpaQVXE4D2cZhCuqklV/AoPKkvmaJAZLc5Eu8R+soYBkHeOPp+pdrK
	dExcVMg4kQLdwnU+JDOfVPbGdgJBfw+4bUeHpAS/n+IK5/ziG/qT6FOgDLVmvpH4F6rAAYxZbfA
	BLiCoZzOCUe/t/Fhfp04re0sfekVZICFRV2//9cvAqra8oHj98NAQdVM8O3HT6gkAQj8N8ZN/H0
	ZlfPpx0eCtZ7/790GRbXYphtCmMo+QHRhW1uWuDq7LdSzlt1T9EvwePeI4qnefg4MVq0YlgOdaZ
	8b5Yad8NI/Ns/PeypXl/NmhxS
X-Received: by 2002:a17:90b:1e4f:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b0db62690dmr3773754a91.2.1793964994803;
        Fri, 06 Nov 2026 03:36:34 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:34 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 11/13] docs/zh_TW: process: add conclave.rst translation
Date: Fri,  6 Nov 2026 19:35:42 +0800
Message-ID: <20261106113545.708896-12-chenyou910331@gmail.com>
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

Translate Documentation/process/conclave.rst into Traditional Chinese
from the current English text.  There is no zh_CN translation of this
file to consult.

List the new file in the toctree of process/index.rst, after
researcher-guidelines (generated-content and coding-assistants, which
precede it in the English index, are not translated), and drop it from
the TODOList.

update to commit 102606402f4f ("Documentation: Project continuity")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/conclave.rst   | 35 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/conclave.rst

diff --git a/Documentation/translations/zh_TW/process/conclave.rst b/Documentation/translations/zh_TW/process/conclave.rst
new file mode 100644
index 000000000000..e237b84fd3fa
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/conclave.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/conclave.rst
+
+Linux 核心專案延續性
+====================
+
+Linux 核心開發專案的分布非常廣泛，有超過 100 位維護者，各自努力讓變更在他們
+自己的儲存庫中持續推進。不過，最後一步是集中式的：變更會被拉取（pull）進主線
+儲存庫。這項工作通常由 Linus Torvalds 負責，但正如 2018 年 4.19 版發布時所
+展現的，在有需要時，也有其他人能夠承擔這項工作。
+
+若該儲存庫的維護者今後不願意或無法再承擔這項工作（包括協助交接），本專案將
+需要立即找到一位或多位接替者。完成此事的流程列於下方。$ORGANIZER 指的是最近
+一次維護者高峰會（Maintainer Summit）的籌辦人，或以 Linux 基金會（Linux
+Foundation，LF）技術諮詢委員會（Technical Advisory Board，TAB）的現任主席
+作為備援。
+
+- 在 72 小時內，$ORGANIZER 將與最近一次已結束的維護者高峰會（Maintainers
+  Summit）的受邀者展開討論。這些受邀者與 TAB 之間的會議（線上或實體皆可）將
+  盡快安排，並以能讓最多人參與的方式進行。
+
+- 若過去 15 個月內沒有舉行過維護者高峰會，本次會議的受邀者名單將由 TAB 決定。
+
+- 本次會議的受邀者可視需要再邀請其他維護者加入。
+
+- 本次會議由 $ORGANIZER 主持，將考量頂層核心儲存庫後續管理的各種選項，且所做
+  的選擇須符合「能最大化本專案及其社群的長期健康」此一期望。
+
+- 在兩週內，此小組的一位代表將透過 ksummit@lists.linux.dev 郵件列表，向更廣大
+  的社群說明接下來的步驟。
+
+Linux 基金會將在 TAB 的指導下，採取必要的步驟來支持並執行此計畫。
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index ae63704e3794..d9ac35e0660f 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -72,12 +72,12 @@ TODOList:
    stable-kernel-rules
    management-style
    researcher-guidelines
+   conclave
 
 TODOList:
 
 * generated-content
 * coding-assistants
-* conclave
 
 處理缺陷
 --------
-- 
2.43.0

