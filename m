Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278DF14EC73
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773480114; cv=none; b=s2/RXq2qSjVln4lk530bQcnz2mMocM4apB60WwzBDWFONiEpGG7uHXMKIfwTlAo/pYWdOMfuRdnz8NIQ4eSvzgcNTpCMC3CRVKPwA/LeFeo3Z2ThmD2cHQvQrDGPneWZu/i89VybwWyMj4vnvP5/GJdRmdh6DABc/gY5X5mDuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773480114; c=relaxed/simple;
	bh=mShEPgqQ4gwpWXszIVcZwkGp+DapTpAMp+A7Ak/Pw/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mUJVOtwhZqVuJWzNwaZp5cXBQzjuDPVxKHk+2V59Cex4CLKu5yN8k0lu8/+YQYJ/k8FM+eSZElXL33lYKhozcrrOk77ztXG1OFhm4erh42s1s4khb6dXHdltgLck4I7kYpqgVyj2RctGfD0XRjMlTBE97y3Ida2mtQ0fSRzRSLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx5J4UIA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx5J4UIA"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ae3a2f6007so22376065ad.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480112; x=1774084912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8UyqgPfbZdaAqDYqS1YD/8TcYT8kvUB1s3GvokTCwQ=;
        b=Gx5J4UIA7tP4s2DoNjVeu5s/n5Z+9HIxA9yZWiUoJPtrCUKLaQWXvExr/u2QmY0g9y
         GM+cq0XPb5vZ6zXGFnTeGVvKMCLkJO36YXagR3lDJo/oMWC3oLl/45QviRs/dmDZZCC/
         yNzXTZVq9+FwmgHbXd5lM/0b9xdH8XOUsNdWEnTJCfAaaOV4T14vmJZqlN5j5K777fQc
         mcu4XZ6m+VR/BwjJ3XgVnkVk8/8yOvAcRBFl6l3C1jVbfPOXbZVVZ52qis0614edneNc
         dxnzh7AmlpW1rVpgjgyyuJEukTeiBY8hF7I/q9L/oJ2JY47PSSqHLKFIkblh0/7fneab
         8MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480112; x=1774084912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8UyqgPfbZdaAqDYqS1YD/8TcYT8kvUB1s3GvokTCwQ=;
        b=rb6aHIq68e3Pgag7peuV6ih67vm4ZVfU0cTbW0vQIAlcn5pfJ4vq4IxC4irhVvbrnb
         kUtFPmp4OGYoUCUSkldZqM06KFHhR8/Raee+pBfVpB2cpEEiuN+MyqLkFLg18llxiUO5
         D+IPL/EjkYtdg30m4YR0j4hEOE7hYB6wYxy/1hQuhCNenUWrfTBGgEhlANQDbx0M5Z3C
         E/asOGlHoNqL2oYbtInSL0h3MoZLRHAZv/+6jWKJkns5jeCdjHavGl5PV2CdsnE/R18i
         0QkS6QfdHYNTdsbwdGFe00Au57yiQ19FB5ACjnGY5RjDDBDpT8uJEc1cAafX/rr13khB
         BTtA==
X-Forwarded-Encrypted: i=1; AJvYcCVSNlbNoqLSqMJWbn2w2XHk1i96TfsFH1j5Tg9xortytX3mmAL3cmMtuMCQZ5AAQsIsVnl5ufTRT2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YznMI5H3x/E4zPln8bG2h6w6RWDJzuwrdRLgJBYoKikulDFqXp1
	vC4PXCsAjqjsP8/QERrPqqX0LVxLLP1zEiwBKp5DlIM78P5QZWCbD4xwzT7NqA==
X-Gm-Gg: ATEYQzxX9mmVt3yStyvN2qmhkoY1uh2l8VxlzxjYDDatyvqZiOss8BJcQLonyWySkxW
	39nX3rZvmZENIdodWRUzIpeVUX18vtOfyp/USPi3tk3tNORJkf7gORQFKD+7XIONoMnzTafkt58
	CrIzk9H9Pa8AQTummH0xByyl/OsjGWNMJuv1KxHp3dyPBV759YLynm+5fzK6620uzhrVyxbZW3l
	QokFpTonYhw8zc1212NZHevmGjKrQHVoCLl36oKpUoB7HGWgE5f5C2rCsKtxRBOyVrGGu33t5Vc
	09M4Y51WEN2NWYIAeDzudkBGo/VaPZtzrzY+gA2AFieV+5/hmaf7LcDn3ad0HCGhl8eVORhLnS2
	Go2cSy1DjNyueCFjM7G5nVpQNv923KAr4E/2xRx+SRhydC2O9ilqr5lJm1iNJ/jgtZzOgzLjXoR
	EI5G3muJoZZlNURSJKwEfVKnTXsUeLGcQvn0xMiQt/UGlsSZaRlO/Z6ogo41e68w==
X-Received: by 2002:a17:902:db05:b0:2ae:5eee:7a5 with SMTP id d9443c01a7336-2aeca9a9d72mr69364795ad.12.1773480112336;
        Sat, 14 Mar 2026 02:21:52 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:89d:b6e6:2613:d00e:127b:1c64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c4f9sm47907385ad.38.2026.03.14.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:21:52 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH] Docs/mm/damon: document exclusivity of special-purpose modules
Date: Sat, 14 Mar 2026 17:20:22 +0800
Message-ID: <20260314092145.7496-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section in design.rst to explain that DAMON special-purpose kernel
modules (LRU_SORT, RECLAIM, STAT) run in an exclusive manner and return
-EBUSY if another is already running.

Update lru_sort.rst, reclaim.rst and stat.rst by adding cross-references
to this exclusivity rule at the end of their respective Example
sections.

While at it, fix a Sphinx syntax error in the "contents" directive in
design.rst (missing space after :depth:) that prevents the table of
contents from being rendered on docs.kernel.org.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
Link: https://lore.kernel.org/damon/20260314002119.79742-1-sj@kernel.org/T/#t
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 5 +++++
 Documentation/admin-guide/mm/damon/reclaim.rst  | 5 +++++
 Documentation/admin-guide/mm/damon/stat.rst     | 5 +++++
 Documentation/mm/damon/design.rst               | 6 +++++-
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index 06a46812a728..0198dfe87f4d 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -353,3 +353,8 @@ the LRU-list based page granularity reclamation. ::
     # echo 400 > wmarks_mid
     # echo 200 > wmarks_low
     # echo Y > enabled
+
+Note that this module (damon_lru_sort) cannot run simultaneously with other
+DAMON-based special-purpose modules.  Refer to :ref:`DAMON design special
+purpose modules exclusivity <damon_design_special_purpose_modules_exclusivity>`
+for more details.
diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index c5b4d8a1b001..a37ce6fdff05 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -331,6 +331,11 @@ granularity reclamation. ::
     # echo 200 > wmarks_low
     # echo Y > enabled
 
+Note that this module (damon_reclaim) cannot run simultaneously with other
+DAMON-based special-purpose modules.  Refer to :ref:`DAMON design special
+purpose modules exclusivity <damon_design_special_purpose_modules_exclusivity>`
+for more details.
+
 .. [1] https://research.google/pubs/pub48551/
 .. [2] https://lwn.net/Articles/787611/
 .. [3] Documentation/mm/free_page_reporting.rst
diff --git a/Documentation/admin-guide/mm/damon/stat.rst b/Documentation/admin-guide/mm/damon/stat.rst
index 468c122c4259..46c5dd96aa2e 100644
--- a/Documentation/admin-guide/mm/damon/stat.rst
+++ b/Documentation/admin-guide/mm/damon/stat.rst
@@ -45,6 +45,11 @@ You can enable DAMON_STAT by setting the value of this parameter as ``Y``.
 Setting it as ``N`` disables DAMON_STAT.  The default value is set by
 ``CONFIG_DAMON_STAT_ENABLED_DEFAULT`` build config option.
 
+Note that this module (damon_stat) cannot run simultaneously with other
+DAMON-based special-purpose modules.  Refer to :ref:`DAMON design special
+purpose modules exclusivity <damon_design_special_purpose_modules_exclusivity>`
+for more details.
+
 .. _damon_stat_aggr_interval_us:
 
 aggr_interval_us
diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 0a3b77ec458f..3694c541e65a 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -5,7 +5,7 @@ Design
 ======
 
 .. contents:: :local:
-   :depth:2
+   :depth: 2
 
 .. _damon_design_execution_model_and_data_structures:
 
@@ -960,6 +960,10 @@ more detail, please read the usage documents for those
 (:doc:`/admin-guide/mm/damon/stat`, :doc:`/admin-guide/mm/damon/reclaim` and
 :doc:`/admin-guide/mm/damon/lru_sort`).
 
+.. _damon_design_special_purpose_modules_exclusivity:
+
+Note that these modules currently run in an exclusive manner.  If one of those
+is already running, others will return ``-EBUSY`` upon start requests.
 
 Sample DAMON Modules
 --------------------
-- 
2.53.0

