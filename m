Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9108C2E9EBB
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863343; cv=none; b=UIkCu22MMsklc3heUi/OMBtsd9pi/1s8UcdANn63QDSJeL+fwdQspN2cOnIywEQkCrwDKO9tJm43lNXwXzWkTjU1+4hGvkpiyWpNrYwjIjEtZak+nTEJ8KliDBC25mEwgNs6P4w+cRffSxUG/FzGcDAEEpCG702doiTVVZjdfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863343; c=relaxed/simple;
	bh=Yj6qFGpRJNJDFP2ncNEzgdlCNrxdDvojcj05gRJtzaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqkepuVHvJ24wm4FHIuvqdLfWTgrD+ijqU/bE0gtzlIRP84Q6A9s7+M3bwMObBrp5EX7UVpmW0blpGPrJdOLWV01KXty9rL/mm5dJ5GUCzwqEtRKRRVIZWozN/S/hYGt+Ay+IdgKlmbxRy4mO2O2vLwvfljq/3t8uwVOwBl7/yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bhekp05x; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bhekp05x"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b63148d25c3so130914a12.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863341; x=1760468141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoECoCP08BHgzCQ48qCknodyteaa9PDghFpXIE55+JE=;
        b=Bhekp05xjipuzolMaDss65bhEcl/85WOuwx8le4i6a8M0UwA0BqtKnZ8k3VnankSG5
         ueJXBfvhpKifVAmqT3KcFTHmnR5Mt0/LSLYk2xRlvOSUZr8Gopdshf70AYyZajGTcZdW
         fyTwu2qSw/pdGSg9STsn8jktJYZOOJfdgqtYXj5d5PijDyfd7Ga4zNP3n9A94ri5dh4J
         GJyA3haSaSPxPKsM0sRNWUnv0UnxJK5Eps/3g3ttyrZoVQw3f59X1TeF5fJgRMTm/al2
         7YWf3Nq4FiFNr7qaHhH4gmu9CQMclcHZFJ2WepXJxpuVww9Y/ao2EuSAQ/T4KorlVucL
         1sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863341; x=1760468141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoECoCP08BHgzCQ48qCknodyteaa9PDghFpXIE55+JE=;
        b=Qyc/SZBq8iTejf6eB7H4SvFhK8CFIP2kkQky8pPDcYAFhCVUUuEE9uoun3LvdvO4+3
         +53xOyNSHlXqUEl8EfeXxZrFOe1UlQDmRZJJ8ZM1emGMvZ7D4ignCho30uc3LyBiU3Pc
         0vPy82hdwETGUorkMw9K0wBYY6prHPmYuQyHxwGWIDu+Qq93O21LWNRPmWMCJE8y311T
         a1zrjiN8GywiOCF3drCSuYDN+Qv/8kOgEkP0DrpK9F3Y5lvfL8djl1WDN+dvXl949heF
         w31IF9QsPF5HfsZZAJoP/eOxRzx/2ewSqQ3jn+PXHYT3khlxuJxKPDSZBz2fpYNmmm0h
         6YQw==
X-Forwarded-Encrypted: i=1; AJvYcCW4KTjmPj/BGv/7u89VxjzGvhV4ppZSIGUpbJTrHu9E4Up0wAvxZgfIFcBOXN3qz5krqTBeKgmCwkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOrmf7kZ8lfoI+Dz20oAbWMQ8THPfS0Var9CSXoP0J9SVELaYO
	l0S0yB1Tzq/C5A5X6TKxaMaBXEu0/9Q+r8xb2YxVZ3Pjm38UDOXS/Sqh
X-Gm-Gg: ASbGnctxd7ianRj1qzxU0JGu+V8rvwxsfKFheEjFhHlCcR6HOQyTQEcTj1eC1eD/Rn/
	3SF8twWcax0IOu9YONzwzppyreRRaA1q0HC+hZBXuJLpCNZpDAwpLZMdIrB3hNx8h6Fn8FXKcuR
	U2Wnvnn5TIRSdzDv7BwU3ZxynuofuoEJPxpl22gA2oNr55C4YP1moYhhLYA+isbkvqh86yYfB4E
	2SZKe2UTMlU66sCCLgNJPDHBf2fyMo/EDH7UPl8L3tR8JrjfBMB/fHXpP2EAyKwF/D62JhN1MLZ
	ItT0AuYS+x7eE5t8DdozfK3xwiNEOVTtWVRlt51pvxUEI57mjTLjC7+GxMGznVAA0eO1tWrbm1R
	8o3t1YiD5y1or7uwbA4CqZD83fAQjtXrneGDndRaDAmNR/SXfB53fe4K/ueZVBEQ51A==
X-Google-Smtp-Source: AGHT+IFJamQeAOOdQ9dqsKsLUKxoiyUO82ESK8nEp/zyoxNnQPXrmUGH61Q/EWQgGDEZfqVMdB2aHA==
X-Received: by 2002:a17:903:1aa3:b0:24b:1585:6350 with SMTP id d9443c01a7336-29027e78f7dmr3818745ad.11.1759863340793;
        Tue, 07 Oct 2025 11:55:40 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:40 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 2/8] Documentation/rtla: rename common_hist_options.rst
Date: Wed,  8 Oct 2025 00:24:51 +0530
Message-ID: <20251007185508.40908-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007185508.40908-1-krishnagopi487@gmail.com>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

common_hist_options.rst is intended to be included by other rtla documents
and is not meant to be built as a standalone document.

Rename common_hist_options.rst to common_hist_options.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../rtla/{common_hist_options.rst => common_hist_options.txt}   | 0
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/tools/rtla/{common_hist_options.rst => common_hist_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_hist_options.rst b/Documentation/tools/rtla/common_hist_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_hist_options.rst
rename to Documentation/tools/rtla/common_hist_options.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index 991c11d6210d..a39285817566 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -26,7 +26,7 @@ OPTIONS
 =======
 .. include:: common_osnoise_options.rst
 
-.. include:: common_hist_options.rst
+.. include:: common_hist_options.txt
 
 .. include:: common_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 20c1315c21c6..43f99bf0f1d7 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -27,7 +27,7 @@ OPTIONS
 
 .. include:: common_timerlat_options.rst
 
-.. include:: common_hist_options.rst
+.. include:: common_hist_options.txt
 
 .. include:: common_options.txt
 
-- 
2.43.0

