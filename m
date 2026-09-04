Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5A34749D7
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521591; cv=none; b=MEH24fN2JP/G2FGl8lPl19wUfK5BdN2WLTyYbYjtbwyVyLHg/m98MHgMMfAXlllWInYNz7HApPQfZu7/jRSk9k/XfjTLMHNsyETv2WugVkgn21KpLH66ia76fZnz5MsYX8zPeLukimn0+Muz4AlE7UrCuC5aci7P3cyLNTOLxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521591; c=relaxed/simple;
	bh=7PDPqTJeVpY7sV80mv2Dt/DZ2OUC0Kw0gnHDFrloR9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zf29sP05HpXB+rnODCtj2m7FNFFIxnQszX+xvc1qBVzbFw28n7ZpbUz9gHigyTH/qDXnPWPgOolqBpbgZj+MLuzrQN+hSI+bhvOMTGjlM/giEzeDAG7lo7gAwIjklBkV/UiiOhQ4Yo8h12qpSKvhYQj0/kpeykuBF1OdVkBIdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANhjfi3J; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANhjfi3J"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4af173320f9so623725b6e.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521588; x=1789126388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikztmPTNBMqsUkOsnaMhukEmaEOjEaj+FkA+gBzLwdE=;
        b=ANhjfi3J22Gtg/85NohE0UvzxNCUKWOFYwEj0iwXGGOIiWOF+Q1RzGf9akG/hFOZwH
         3COCHHfp+OrRZBDnO49oYOX99sPZOPNMhuNktxYZ/v70z5GHZtIyzUXzd8Jka4t7G4LX
         gApFAef/QiMEmd4+1Q4hHrMWzDpiNlFG2y6+ctMKVcZ20HqhGPTHAGmx+MxWu442MyaK
         CspUfoRTu48O3I1ihIWEZ4F6d+pKbEKpZya0PnYjmfuIYhoTm334Q8r4Ny9ucKuj+6YU
         nWcV1sIWicX8pJrUUmZ0DnN7OyQNbAgIriGiRGo8b5ytjvHVAAPGuwVm070zkK0N3Lpj
         DdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521588; x=1789126388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikztmPTNBMqsUkOsnaMhukEmaEOjEaj+FkA+gBzLwdE=;
        b=FJEJfXZxkwifwlK15A0ZIUYX8AsqgZNpnVwuNNElv36Ni4jm0llRm+Io7A5oY1NSPM
         WGq8qv7tM9ExnlDO/pSVWf9O3ngNJ9l1p4jecrFRAeZzJ73VJZF6mgPu/1PK+Zdh3vFk
         EDV1t9VKM0QI3KjlmzWIVauTMRleyVn/ogteAIOfh0IVCu9lloMIPx9YJNtUPpOjABkp
         I7tAIlL07UrXjPcSZyYxMXhrG5qlNDx5nhYzHTB+p2PiY9bG7G4APa9ElRHWDjLutp3q
         +tLUcDUM8i9/RxFlgIb5FWUg3WYDtbFrO03v0k6pluYr4tpiJxSsuc+yJT/IHY0Rm/c7
         N5Gw==
X-Forwarded-Encrypted: i=1; AKwUvByrobiQ02XXICPCmiN5k+KSPihy115brSTuZadSFkg4+xV8/VX9dEqflah4KoD927POmQoib7XNPoc=@vger.kernel.org
X-Gm-Message-State: AFuF++lJpdBbgPTEKQd2PKPjylwLmYZhQwh3hGTv6zwCp5j3O9uez0iI
	7dPFAxgmf9fgtol+N3UjiHhKB36fTkgLVxLefx5zIuJtZO9l/k3DoQnf
X-Gm-Gg: AYBFou3VGTToWqZk543U1v6BpKWqkzCBxhJbarV2Engzeh/e6+uybmbWJS8BE8SAz5i
	cEdemXjqdi8mBX3RhckWLEdRz4WE0fYC6WsE0F3b4zZiQQs3Bhh6+ia2Cxoc5Fk3WDi/a8k/tgn
	P2YWABpllrzY/ObOJ8J1U4Pj0/M1hRiC0+DVbUnz7+rYblCsO01SaFdfsZZcqPXvA4N5YEUjKkd
	iVOnvDTmKAZ+ywCZ1XHV+o3u7pIojIvHjomT5uPTkuUf3Zfk2F+Mvg/HYDNxSVOLHb3MqpcWEiC
	WjWiAZXUUZebfVsDd4IbkUk6GOT4X1pOM8xy9QXCyFiLLtbWzT6xrrNWrfEAySxfR1oiwM190gl
	dmJpPTd8KUcnPSKqjVcDOSBm9kIMaYQ2OfQpQzYCfGkDFKK6d4OHeLRHOjJLkM6kDtpNfuP3bjg
	85hIe+Twfwayl1OPc6Vpka/rLl/tmz2wHczKkdnE6887/5Isb0OXPuZ5Siity8QAKmDIRckE3EI
	abGEpD8zVUjFcE=
X-Received: by 2002:a05:6820:8118:b0:6b7:8415:d78c with SMTP id 006d021491bc7-6b78415d913mr1302066eaf.55.1788521588529;
        Fri, 04 Sep 2026 04:33:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6469759eec.8.2026.09.04.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:33:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] tools/lib: fix typos in comments
Date: Fri,  4 Sep 2026 17:02:56 +0530
Message-ID: <20260904113257.13594-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113257.13594-1-hemanth.selam@gmail.com>
References: <20260904113257.13594-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/lib/python/kdoc/c_lex.py        | 2 +-
 tools/lib/python/kdoc/xforms_lists.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index cb95f5172448..efbc23c01abd 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -68,7 +68,7 @@ class CToken():
 
     MISMATCH = 255  #: an error indicator: should never happen in practice.
 
-    # Dict to convert from an enum interger into a string.
+    # Dict to convert from an enum integer into a string.
     _name_by_val = {v: k for k, v in dict(vars()).items() if isinstance(v, int)}
 
     # Dict to convert from string to an enum-like integer value.
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..423e2bab7667 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -53,7 +53,7 @@ class CTransforms:
         (CMatch("__attribute__"), ""),
 
         #
-        # Macro __struct_group() creates an union with an anonymous
+        # Macro __struct_group() creates a union with an anonymous
         # and a non-anonymous struct, depending on the parameters. We only
         # need one of those at kernel-doc, as we won't be documenting the same
         # members twice.
-- 
2.48.1

