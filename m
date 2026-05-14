Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4623DBD4E
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747310; cv=none; b=sd6cdaIIfGT7F1p2RWYTlwZPTbS6/9tvxF3HU1+3nKeo7pIlFH/CPOp3BbONmS9m80dLoocOZs+kb5HWMR6EQrO4VarGoqCTq5qkTCM4sWLLBU1+tiQ53Ut9eGgfIttn0KRX/CzpYUHUQ+3467Et6iIMnSAkyoqxikO8A6yAi5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747310; c=relaxed/simple;
	bh=nXaOOzJkTLhG/p27fSbEVs9qHWkJrPWzL6Ua18IW7SY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5m4crfyX3s35PLajUYLtjjz7ihaua8FgCt4lJAzUtUOlARmRYNcCjUP/4lr7q0k47+wHWQ2u4DTUZgH53+NmOnyDwVOVxqT/LNRHJ9HUiTPxEyCevn1g2H5DGJNHw7Aq0nMkyD6/MEE9BoU8+yAvmar1GuO/ran7NZbuVxIlAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ3pX4mP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ3pX4mP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba21d32776so52135435ad.2
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 01:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778747306; x=1779352106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwNrt5Tzlp+Dlu2kCOBgvN4x56K0A/w5lS8Utkh2cuc=;
        b=eQ3pX4mPR5HqG30E6yTtJ2Q54bo4lrQQJZaPG8NRxiixG7rncAixRfljVv70BpnQvy
         wEo3AvmIMl4ujCLrZ2JdZ+Whs8EPSS+Ge2U79AhEHP4SdHLNZuxrmFHy0HGN37Gy2xJJ
         MA0LaaUC6oNlbk7Q3K2g9YI3sXGTHGEqcQ41yETHJsGXWhUFvU/p13pdwHhcHuUbntQK
         ylKnZApZB45LGUIaJGLDkslZC8SoPSDQVtiI+4NWzUWvRcg54lY4NLukNv6lwt2Bscd2
         qyeVl8L3F8t59EtIzn1ZainjMez3LCDlsJML9tczAu4LreH7lXL29goDquT0ICxDwxWL
         kOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778747306; x=1779352106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwNrt5Tzlp+Dlu2kCOBgvN4x56K0A/w5lS8Utkh2cuc=;
        b=IwbuKvMSGP2917mjrVkjk5Nbvd64glMyCDxESBUfKnI3yNx/0Tvmp6vSuvtWG/J6uT
         gd67SiFyzQ2b0rQASVJU7yuv9w3vWexXOI+ihUlk/ADjkcu7f3xC7B9Bv5g9jFAMAM2o
         fwzkzN0S172nlTGvQbRxoW9BmtHhHUim7uT7OJDQXIZbF345b5JE84Hgy+bd1bauQ15d
         crWa8G+B6b5KVfUzLZxcnSVAyH0vIlCHBluyPwSK9NF+KDleYjm420A5cucHKswt/yoL
         FwvrkmhqhSptowVY55bh6Cj4yuTQ493+5Y9iNx37YDfcnO0hgx4Rgvf+zDvSDbEOabT0
         ttvA==
X-Forwarded-Encrypted: i=1; AFNElJ8GNNKP5I1rWXCSr46fIO4OOyWlqPtKMIKHVJm+3n7bCVgBKUGc7WA3+Kch5NW5x+JJp+swG1aHwP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf2FR+PlJZHE8cmJxn3cjSEg5jDQ/AUf2pjuvGV/K5wo3sdbiP
	o5yrQo7AgfUQFkMXNi4D+U6ZqUDqFmh9uFCwSBPNW6NMyVP7KVUneUPDLsGeBmRK3xE=
X-Gm-Gg: Acq92OH9AXQZErHErsksH/k75twGvHE1M+x68NxcHlwczQ63/mBfWl6vn9AD4TiXdPY
	WjiGdd+3H0NQ744WqklzNCnepEgcLcmLIIx9DbazurgYKOkGjGVdP+lPVdVWrPE1W+YNNQ9XG0H
	G9M+xmbZY3mHUjTZXwfeyDgNwt8NxHbLdP+LdPSDknbUSB+qwdp2D/V1whg7F+n8xc7D1kDG2EZ
	rsoYeaU5i1cPvjCLs+88FW4AceO60NnumdXKX2x3y2eoA3CCvKQQ0NBlh9yOP7P7hRYtzstrou3
	W8CSrIi8u0/Zdch1mrN9HxSy/B9ko7NWocZ1CcsZH1CVoSdzCe4SVXcqRMz6Xv6PprLVg7mKB/N
	FqFMFrNoJEyUFBQ4qeCew6U5QWriukkTifF4k2KpEyp7jMqh9xs92CB6TVnB6RwoWoMlzt9Glln
	KEM1SoXUViSkCgdoXQZJj5q9H4rCGRHpDJNBMCWnZlWBJ5ID0YMxMRj4PfyFr6NmKwcS4OT5iCV
	U9BRVdsQqIpPSAJ0OzgnWhS6HFFUH9k2MsZsoB7wxAzOdQpzHMUqpi1DpmCK1SomuHj4Mjsgltp
X-Received: by 2002:a17:903:f8c:b0:2bd:147d:c712 with SMTP id d9443c01a7336-2bd27133c75mr74193975ad.1.1778747305732;
        Thu, 14 May 2026 01:28:25 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc60sm17757755ad.9.2026.05.14.01.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:28:25 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@leemhuis.info
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH v4] docs: reporting-issues: replace "these advices" with "all of this advice"
Date: Thu, 14 May 2026 16:27:33 +0800
Message-ID: <20260514082808.655-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Advice" is an uncountable noun, so "these advices" is grammatically
incorrect.

Replace it with "all of this advice" instead, which keeps the sentence
grammatical while also making it clear that it refers to the full set of
recommendations in the paragraph.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
v4:
- move version changelog below the "---"
- send as a separate thread

v3:
- resend against the original base as requested
- replace "these advices" directly with "all of this advice"

v2:
- use "all of this advice" based on review feedback
 Documentation/admin-guide/reporting-issues.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 16a66a1f1975..87dd874fffcf 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -129,7 +129,7 @@ After these preparations you'll now enter the main part:
    situations; during the merge window that actually might be even the best
    approach, but in that development phase it can be an even better idea to
    suspend your efforts for a few days anyway. Whatever version you choose,
-   ideally use a 'vanilla' build. Ignoring these advices will dramatically
+   ideally use a 'vanilla' build. Ignoring all of this advice will dramatically
    increase the risk your report will be rejected or ignored.
 
  * Ensure the kernel you just installed does not 'taint' itself when
@@ -795,7 +795,7 @@ Install a fresh kernel for testing
     situations; during the merge window that actually might be even the best
     approach, but in that development phase it can be an even better idea to
     suspend your efforts for a few days anyway. Whatever version you choose,
-    ideally use a 'vanilla' built. Ignoring these advices will dramatically
+    ideally use a 'vanilla' built. Ignoring all of this advice will dramatically
     increase the risk your report will be rejected or ignored.*
 
 As mentioned in the detailed explanation for the first step already: Like most
-- 
2.53.0

