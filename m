Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881ED3043DE
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778065459; cv=none; b=QD89DIRUXt/5VDk8Ad94XtCCRevmsbvtVHUQWGFwMN6YIB8fqKVzgxNCuAolkjZR1NrfSrTNbr4HRfeqTpAbVs5NS8RVYlBOPkKoZTYrtItQEYDsrVUBP8fJr93GyEs8oJ7BaYA/EEJgql9nLUglEjMs9iBCqln9t95cVOGR1Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778065459; c=relaxed/simple;
	bh=iXDLwNu9nO2bWAjc5u6p4s9RSDwMepAwVA9DZhNtcew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eQaPCW0MECW4bbVsLUK2dMsV9+tD60dhRiotIXpEXuL8L8VYtwYrqr1GNAnTX8yP+sgXckPturK48dwsS8BagAlQL2jZ7zewjMwm++okp++18T6pmQG9hUIrBP4N1+EXwVaEm91bWVe8NgBkMoP20tJm2V7XY1LYWSvjnsKp87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NoEwzf4v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NoEwzf4v"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48d102471a4so30245815e9.2
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778065456; x=1778670256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SecJtaa/94NbrUg2zXVMpkghDsLJXP3FycQnhFxHBw4=;
        b=NoEwzf4vLFDea+U5HOHrKy7XSW1qElerzawPrPr0/Hjzol5GPGARXaRF/QHyqCxch9
         CCdJJMROmB8pOAmEVdrnk+3LiBlr2FquxlU5fIL8Tv57/uqxale9fZoZi1EIt8NEFGBw
         9KPkz2nKDuonduapouPC8iqaGNDZABqSmW8xWm7AXWaahsWVHCM2/W2OEMQys7mOWXgF
         Ee3v5H522hDO3osok6L5VcJTs5mChpUkz+soyt5pcBB5HvW+LRAQwPjMAB1CwAfVienE
         1KVBz0U44cYxq7i8gBiUUEShET2gw/yZTyMSVYho6R6iiX/tt42hlizkVYMz69iQQCgP
         fXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778065456; x=1778670256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SecJtaa/94NbrUg2zXVMpkghDsLJXP3FycQnhFxHBw4=;
        b=CYv6FiSav7FZXX94kenMuKEWlfQHGFn7N7DqfMyanddGXgW6XGHGR07rcLM4hqCj7U
         POoDIvbjRiL8L2CS/B0fVQehm4F9KHUPsNsRM9wYD8BGJ9a5sGdb5QgyVZl13Zg8MA6u
         sOZ/0DrxPdv9/4vLtcNXXS65BUOyZfje45l56hfXjWR2K5386x4Vy0BStVIuX0xPNvcI
         kZAkgmQmrBS7//wQKoYJmfpX+r7FTiaOkP7ftZX8vAtMU8w+vctGmoDp5LxBOg3pQRIS
         O8tT4k5qb4fB5uwlWbtwNJgNqhRc4wz3kZCgq5KsMys0CHI9oYbcob5VmVrv0ICVXt7z
         /XFg==
X-Forwarded-Encrypted: i=1; AFNElJ9Byzu97cIJnNFvQh02dq3HKyuCyUxg0q8L6nO+74CxsKkSaNn8J+qMn+8qO8gUQM7xy6xhz6KxZcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4dCUEvoBhGqlyGQmRvEI5bAJoCvGub772BsnCqOc0z9DeCcA0
	KTJtqfXBmMWKQLAiCaKKmnm+SfY8nbQuKCtdZKXNTKKBJlee3dHds8/RXexsrLA8xZw=
X-Gm-Gg: AeBDieskpTYvQzYtnDnlTwEnBurbuepsD5FjTm0V7yand77IaP6jqq0wh7X1grveFd8
	VeLw4vhpZFAF+VhjmusJQuCL7tL+1hE6r2S736NP2ci+7HiTO5bYrfSZc1RlHTsZhiW8tCFBBbI
	2Zn/0KlrpuF/PtwS6+aDdBdgfhHj35kr3G8/Bw0chvvjszGPs2G6LMltsZGeyy+uwCIzY8ak1dt
	1zGriNHe8GMNWWULNMqrFxdgHS3INIBhjZsbAIQ3h7hZulss1mAYrGlYz3TgQ2sWgPZzYOKZD5d
	DO8xqa/SgRyJR8vjiI5NIggC6nQHbWxf1G251tY/Tv1NplPTC9MmddTl33pDbXXIe87vmCyAFue
	cF34e6P7bDKsvLBmib+MednAQejzxOaTgxGVvP84BT1RHZj8eZOxi03mK8glrX8bqzc0SXt/Tt4
	wDQBVj177wmomQznL8zulvfdD9H3thqe/nzAKKJYWssZ4VOh1tD/Un0Io7tGNWKoj/kC7Qddby9
	7YqnOpZDdY3eSPDjg==
X-Received: by 2002:a05:600c:4f53:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48e51f4456cmr50856805e9.20.1778065455968;
        Wed, 06 May 2026 04:04:15 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312de76sm14072305e9.21.2026.05.06.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:04:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:04:12 +0000
Subject: [PATCH] docs: kernel-doc: python: strip __counted_by_ptr macro
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org>
X-B4-Tracking: v=1; b=H4sIACsg+2kC/x3MQQqAIBBA0avErBPUyEVXiZDSsYZAQysK8e5Jy
 7f4P0PCSJhgaDJEvClR8BWibcBss1+Rka0GyaXiPVdst8EwrU24/IlWL68+zsgESq5c54Q1Amp
 7RHT0/N9xKuUDCqTfGWcAAAA=
X-Change-ID: 20260506-kdoc-__counted_by_ptr-1e206f3f1dc1
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-hardening@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, jyescas@google.com, 
 krzk@kernel.org, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778065455; l=2198;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=iXDLwNu9nO2bWAjc5u6p4s9RSDwMepAwVA9DZhNtcew=;
 b=DD9qRHf57+HpkJB/GiRWD55KAmJqAW9s0RITiy7nGE1BtIfdn/pW6yuj+d5U8vwgV6dByu+i5
 vb7MQFHQAIpCMPtU31zyXQarbcpZKsJDSS9/wbvt1UlWtG+rFRusEQj
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The `__counted_by_ptr` macro was recently introduced [1] to extend
bounds checking semantics to standard dynamically allocated pointers.

However, the new Python implementation of kernel-doc does not currently
recognize it as a compiler attribute. When kernel-doc encounters a
struct member annotated with this macro, it fails to parse the variable
name correctly, resulting in false-positive warnings like:

  Warning: ... struct member '__counted_by_ptr(cmdcnt' not described

Add `__counted_by_ptr` to the `struct_xforms` regex list so it gets
safely stripped out during the parsing phase, mirroring the existing
behavior for `__counted_by`. Update the corresponding unit tests.

Link: https://git.kernel.org/torvalds/c/150a04d817d8 [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 tools/lib/python/kdoc/xforms_lists.py | 1 +
 tools/unittests/test_cmatch.py        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index f6ea9efb11ae..118156ea8cd2 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -29,6 +29,7 @@ class CTransforms:
         (CMatch("__aligned"), ""),
         (CMatch("__counted_by"), ""),
         (CMatch("__counted_by_(le|be)"), ""),
+        (CMatch("__counted_by_ptr"), ""),
         (CMatch("__guarded_by"), ""),
         (CMatch("__pt_guarded_by"), ""),
         (CMatch("__packed"), ""),
diff --git a/tools/unittests/test_cmatch.py b/tools/unittests/test_cmatch.py
index 7b996f83784d..109141cd2ab8 100755
--- a/tools/unittests/test_cmatch.py
+++ b/tools/unittests/test_cmatch.py
@@ -320,6 +320,7 @@ class TestSubWithLocalXforms(TestCaseDiff):
         (CMatch('__aligned'), ' '),
         (CMatch('__counted_by'), ' '),
         (CMatch('__counted_by_(le|be)'), ' '),
+        (CMatch('__counted_by_ptr'), ' '),
         (CMatch('__guarded_by'), ' '),
         (CMatch('__pt_guarded_by'), ' '),
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-kdoc-__counted_by_ptr-1e206f3f1dc1

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

