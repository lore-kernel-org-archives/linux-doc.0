Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D84525A8C
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687516; cv=none; b=UwAh16xWOemryB838nraUrSkE78avy1q8j9hysDuJdvWgHHWaEzkD2SSGeWHfPfHps2BvMPkGLzaM1clcZDiZi4yV0pDSpZMjt87zN9fqqHPu8gM1Yiwy/boUPP9iPKK5oqk43EWm+HYxkTM8L5r2RPVH6Af292wg7ze5nlf++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687516; c=relaxed/simple;
	bh=f9OWPjywnn9cieTQadkrLXGaYCUgFX+jTUi1OC4QSDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFSO0yMrN288WtxzItZKgusgL4LitbPDTTF0+v1N7yGwbJQXkpAKMr4rt8wOt+Ssjf+9AEAvDv4Oear3HskJ4IG3kRqTpbV7ofDpxVguouWtvSKYxGU98IeAl58ByNY8sYizuIVfcL0wIV+Bsz0oroj7iMxyDmEzp2s2EFIYrGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTsXFcXJ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTsXFcXJ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39666bed444so442957a91.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687514; x=1791292314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XIcMA9FcwOdRmoFTj6kPSo7KelWNNXEGT3aOLQGVOS0=;
        b=gTsXFcXJWkhW/r8hgmP9EgYlEW0aMcpTA9aA8jd5X4WB0aIAChlYNwR9O31WDZ0hOW
         3S0VEAgQ6sVTOkBkqhvgMqvcVM4NlmI6UYwSM2IFDQN4zyL8CsoYBsSkspRMv43UBNL/
         1JwAoNYfKtCJMY6+sxGtSOGtH50dRbB+XoQ9C8PoFyEEHpIT2iW5Ti3rKNqQPalUyEMj
         Hm8PCxRwYCLaB37c128N4vskr5H3hFYp8ltqFuIgqeo6gixEkm4kc9hVGR6efBTmzmeH
         qtRTrzt0YuGoES7IfxlYOzUYIEBSITo79h12qQ76jrRdeqvV2iVeY/pdYVyidGUfScEU
         RYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687514; x=1791292314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIcMA9FcwOdRmoFTj6kPSo7KelWNNXEGT3aOLQGVOS0=;
        b=FtoLZ5OgwwqJuwqw5ZLHy69h6Re+s1Q+VchheA+nEiDx5rAEwrwMtDbDcFgILbev19
         X0VNKx9IgyLdH82AT4SAoh8rYR1wPWXyN+cytX73aOee8E00B3TMuq50RqEJ1XQ9ryJ2
         DvalY975TA9drvJO2XysZlkj21jS2b8MnVNnwUHSJvyXOCxYFeFoNKic2GH0zWVLMHpJ
         bEsXneBvwtHK1kt2i1IKx98QOb6lmwF0vEQ91btJCHeU0qPvg0I3zRz4mcUOXLpJp6yp
         IYv7o5CZxTNQd237++AUzOJgwVfWe0t+j5z3K1SNFLGMStIjp1OdxAiqX23TMhev1FWT
         CeUw==
X-Forwarded-Encrypted: i=1; AKwUvBzoScwsDpNpynKolAixp1JMqT846De1R/lzj0TK2ZiV5iL1TxdKz3ochvWtAn2q7OTPxO0IaTpBs1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw5t2vW5CzFFFxI1NhVH4rX4YNj7yK+7GmPrTTzFtkSFyqBIQ9
	IYwlty2ERCG6Z3nurD3pYZ+ueAJcf/BgTuDwQErQo0elhCLgax7fPdme
X-Gm-Gg: AYBFou22M0mv9avgn8oF9UpgfTUYWAczONsXKcuGFJGatICAsltQWqX9orqmSfUfOVH
	PYxTTlYb55iOM1iYmA+RLiDZRxlZkVqPxOV9UVd9LpgZIALH7rCgb+c/DYIAkrZElkz5Klwg9UW
	BbpR6PRCJ5hxDhgkdn11CXyWKisLwBKwyx3RIIggRrRPRE3Z+dSpKTLLOTQkFjYW86j+uY/RL1z
	dk0+CgBJVm5/OxuR9qFm8ydbHnHM4xJriDqHUH9Kx9fNE1FM5Nz7EVZMWB9mjCylFaqWFtz5/0J
	yfyjAM60d1ocR1ISkJXGxTd0D54kupFu4UatUHDmsFESyAzzoWpDtOCSMS17V+Q2jO3JAsSGeFn
	lR4RIVvmdElFIZkvUJcjZ2ufrpgqYIfLgo3hjFTgamUFTDZAbGT1F3Hzco2antLOhUjrLJ28mhQ
	AHiTO8+yICXUoDUUsLKlS/IIeQ/R0YwIQ8ndscGj/T+VcLkasVoF3SZUQbtO2FebUh8sZ65U6HB
	PHaytRTe1WNir5Drw9PVKE/uvGEJc7aqGGRPaa+5YdNFkXC8jJS+c43yA==
X-Received: by 2002:a17:90a:157:b0:3a0:bcc8:1549 with SMTP id 98e67ed59e1d1-3a0bcc8160dmr10751630a91.6.1790687513525;
        Tue, 29 Sep 2026 06:11:53 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fed22sm5582137a91.9.2026.09.29.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:52 -0700 (PDT)
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
Subject: [PATCH 1/3] docs/zh_TW: add a notice for translations not kept in sync
Date: Tue, 29 Sep 2026 21:11:38 +0800
Message-ID: <20260929131142.266819-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131142.266819-1-chenyou910331@gmail.com>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As agreed in the zh_TW scope discussion, translations that nobody keeps
in sync with their English originals should say so in the file itself,
rather than leave readers to find out.  Add the notice as a shared file
included at the top of each such translation, the way
disclaimer-zh_TW.rst already is.

The notice carries no :orphan: marker.  Included after
disclaimer-zh_TW.rst it would not be at the start of the document, and
Sphinx would render it as an empty "orphan" field; Sphinx does not warn
about a file that is only ever included, so the marker is not needed.

Start with the two files in process/ that are not in sync.  process/ is
the part of zh_TW that is kept current, but security-bugs.rst and
debugging/gdb-kernel-debugging.rst only moved there with the recent
relocations and have not been updated yet; they carry the notice until
they are.  The rest of the tree follows in the next patch.

Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
Link: https://lore.kernel.org/linux-doc/aqFPBQxq5asHzvtn@wyuan.org/
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/debugging/gdb-kernel-debugging.rst        | 1 +
 Documentation/translations/zh_TW/process/security-bugs.rst  | 1 +
 Documentation/translations/zh_TW/unmaintained-zh_TW.rst     | 6 ++++++
 3 files changed, 8 insertions(+)
 create mode 100644 Documentation/translations/zh_TW/unmaintained-zh_TW.rst

diff --git a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
index a9ca1156fea6..45f178c0bf59 100644
--- a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
@@ -1,6 +1,7 @@
 .. highlight:: none
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 
diff --git a/Documentation/translations/zh_TW/process/security-bugs.rst b/Documentation/translations/zh_TW/process/security-bugs.rst
index 76a78746ca4e..783d7c77b5fa 100644
--- a/Documentation/translations/zh_TW/process/security-bugs.rst
+++ b/Documentation/translations/zh_TW/process/security-bugs.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :doc:`../../../process/security-bugs`
 
diff --git a/Documentation/translations/zh_TW/unmaintained-zh_TW.rst b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
new file mode 100644
index 000000000000..4b4eb63d749c
--- /dev/null
+++ b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
@@ -0,0 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. warning::
+     本翻譯目前無人維護，沒有與英文原文保持同步，內容可能已經過時。如有
+     出入，請以英文原文（見下方的Original欄位）為準。如果您願意協助更新本
+     翻譯，歡迎將補丁提交給繁體中文文件的維護者（見MAINTAINERS檔案）。
-- 
2.43.0

