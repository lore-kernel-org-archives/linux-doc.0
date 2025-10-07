Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2772E8881
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863337; cv=none; b=I437naBBQT3fKC9MZMzXpllK6mP519dE6zx2G5iNjFTQ8/7uZOMfQPYvirhF0TY22q7UBduArFi7qKKMskQNN5dzmFwMnZXMoTJspvqeI97xoLh32CnAlbEnMH4dZTfLYSllho6Mic+YaksGJXDFk1MUl4NjBHv1cxywzfCELH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863337; c=relaxed/simple;
	bh=KWXkMIAyDYXJL9ZYFoRhKKia2rw51cLLtwlRksRSZ8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRj6vMpTPkFlDuVzoFiRxuGbwJ0vxllExP4qvlX0i3ewKuDbWewZStzfY+dbZZ+DchyF6F4L7fxWI9ZzUtaGGIyrOqJg5zvgsEMiu3VwwRqW+rB3zPKscQJS/BzFMoVKCIr02MEZE5a0LutiCftEPzQV7E7Lb/tIVPjaMs4y2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/FJqmx5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/FJqmx5"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so2910558b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863335; x=1760468135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiI8ma/H7AR+p7UC+KuFxeAt/GicErH37Q1yChqPrPA=;
        b=T/FJqmx5OhgQKXHuf5oRZb0KHh4ZXA7VOkFavBchSF2pjlQAsGGknYn3r+Ws/buU7y
         uDGwCvfCoQrf5H13vZfvupS/PzhXYb6hUwauM2zuO9KFt/6X1lmDg+WiXaLKZK2YWDV7
         4R1Y0Ih/R6v/01SCfTn0uwEddsLFdtthD1+FUVVCPNKcBToAdLzOGkuYu9Vzqsh8ivp9
         qx5skZjYao8qwO6TBXgWU/5jOksNmF2OIXkduEHm5R37J1VXf7Ot9Iv7bxFOxDpoG9U0
         IgdOLghPvZfSXwq2IKETUsHHkRFvVFukBlRNRaEb7F5GqWL+prTJ94KE0CMKBgGUGOvB
         JxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863335; x=1760468135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiI8ma/H7AR+p7UC+KuFxeAt/GicErH37Q1yChqPrPA=;
        b=clS7pi83ULzwShCPZatTYBLyotyx+6H74BvOLVS8rEV3gpNYgXQGzxQJdNkumwiwTo
         iWY+vgLOWwrDVfN13Mhh2Ju0yJif1bM32M2Rk0ObEslb7qMsO3Z/bJ2g8ggnTcvU0+OJ
         12voNaeHgFcOooGoRKUlyR6KgJo6/opzDtGju+gu9QsUJbsLecx2ehGOOFjW37dlY/k5
         TcAAnkHhSOx7Qcv6Si+yCDANAq1lvWXUitmNC0dO12SqS1z5/FUxQIHin/CocbSxWGKM
         WFbw3JCBACKRA3Y9gv0TKi7RLlgAPakZAqRwv0AdcqNx2az3GLLO3ru4yu+jclBvod/g
         8UrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2HEbBbhPqJPa1OXqnnULnJUAYwWQlNxVbkm/SLCbfd/hNYe2dCrNzMrYCvtMScv2TM6F6Vz7eic0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxudKjLj9WEHU8iFf7F1x1/QIR9quQUJ6QDiseR6EMBosbU/uCb
	Pe7L5VlW96Ug5AWb6rvsk9uEhR813fb/H+Ceu20bMBQiS3b1WEOLdiQc
X-Gm-Gg: ASbGncsDRa/9b5AIDr3SISx6upev2bXZUjAMukJBqMGMT6FKxFXQFSHuYa1co/NSxkf
	lXjUgvbOtE7hb0v+Zj905+cMvLAGL8ldWZlMhYRCbPGIwBFYDoa4aqsllsqtQ/Z4flYxssjDxgl
	XtQMZZt/310ApRXPkBpgNLmBxfs/G9KbpvgqUMp+dz2j1VYhREjkHiNk8PtW0/PGT9lNd1jm9Oe
	5IQ6goyUdYj0NZXYapGgO5c3aRbLTN3BKcRH2Dd5HQ8rpeaGnjRQG2Rf6yesQeZzDdeZ11s/zX3
	dQrtq8c/xaBXbzojTt1kUSduLDTT4WOzqmOnMecJcQiy+vlGtrQi/QBxPOOZ2miDV3rnCVmDu2R
	vutJbZetVfuvkMTO8n0kWMuVBf5bUj8I8Yj75DJKkjGSbMu4tfLCJaJGXNatqJFjWHw==
X-Google-Smtp-Source: AGHT+IG2yzS46KJ17xC1D58qrOL2bjUkWL0tVGQSAERrzK3lQkukSFgqqZhPfcQE1JCH0nzmhBPy4A==
X-Received: by 2002:a17:903:8cd:b0:269:8d85:2249 with SMTP id d9443c01a7336-29027240d03mr7980115ad.22.1759863334954;
        Tue, 07 Oct 2025 11:55:34 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:34 -0700 (PDT)
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
Subject: [PATCH 1/8] Documentation/rtla: rename common_appendix.rst
Date: Wed,  8 Oct 2025 00:24:50 +0530
Message-ID: <20251007185508.40908-2-krishnagopi487@gmail.com>
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

common_appendix.rst is intended to be included by other rtla documents
and is not meant to be built as a standalone document.

Rename common_appendix.rst to common_appendix.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../tools/rtla/{common_appendix.rst => common_appendix.txt}     | 0
 Documentation/tools/rtla/rtla-hwnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 Documentation/tools/rtla/rtla-osnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 Documentation/tools/rtla/rtla-timerlat.rst                      | 2 +-
 Documentation/tools/rtla/rtla.rst                               | 2 +-
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename Documentation/tools/rtla/{common_appendix.rst => common_appendix.txt} (100%)

diff --git a/Documentation/tools/rtla/common_appendix.rst b/Documentation/tools/rtla/common_appendix.txt
similarity index 100%
rename from Documentation/tools/rtla/common_appendix.rst
rename to Documentation/tools/rtla/common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index cc2721315552..102654cc0c78 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -106,4 +106,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index a11c485f127a..991c11d6210d 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -65,4 +65,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index c7bc716b2899..58321322d24e 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -60,4 +60,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise.rst b/Documentation/tools/rtla/rtla-osnoise.rst
index c129b206ce34..997a981fe397 100644
--- a/Documentation/tools/rtla/rtla-osnoise.rst
+++ b/Documentation/tools/rtla/rtla-osnoise.rst
@@ -56,4 +56,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 547dfc7ace58..20c1315c21c6 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -110,4 +110,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 3740fd386ea8..c620ab16f849 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -133,4 +133,4 @@ AUTHOR
 ------
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat.rst b/Documentation/tools/rtla/rtla-timerlat.rst
index 20e2d259467f..e66d2588a416 100644
--- a/Documentation/tools/rtla/rtla-timerlat.rst
+++ b/Documentation/tools/rtla/rtla-timerlat.rst
@@ -51,4 +51,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla.rst b/Documentation/tools/rtla/rtla.rst
index fc0d233efcd5..2a5fb7004ad4 100644
--- a/Documentation/tools/rtla/rtla.rst
+++ b/Documentation/tools/rtla/rtla.rst
@@ -45,4 +45,4 @@ AUTHOR
 ======
 Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
-- 
2.43.0

