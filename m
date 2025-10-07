Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BED2EA15D
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863372; cv=none; b=O4z/1TYooWYw3Xo+AfCd/ctXHv6G7A+UBWS10E+tt98NDl1i5UOtdnaJrixTXbv8hU8lDVQ057tGKDXyOSsi3m96YJMtyoVZArPE8wZ3cxWaRIYc7u1s4RLY0rLpQt5QFLXrGN7Kk/+VekpL4cJSziKSktirmS0wmsHg2/XqBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863372; c=relaxed/simple;
	bh=PjvGj/6WIMKxEW1Znvw9l4eMpfWYkHUzapNNIm/1GK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQjEGHPgJ9Z83vpeS/IPQyI9cxg6BDB1BnO9FzKsySZ1/kv1+xxBo4+1QULEPOCOxGwkhMCgtKbKkIC4bCY7TY+qfumbW2GHfkLV5JzmptBoJ9n1k1nNAUvAH93TyzzUsXjfqwq6FelMqrsgluldMCnjEAoDeJ+1+blN4ol0fzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VL7u0k8M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VL7u0k8M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-28e8c5d64d8so64882365ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863370; x=1760468170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUZ9lhN//CkO8fifdX7p4qPCDwEbbiKFsiRCmbfFYRY=;
        b=VL7u0k8MY/miTHsAuDoBQIlUZ5G9Ua0t+W1qosCwOkITpvfJaNQev+CqomIImReXC4
         p1S/E92bQC0g0mhOY3a+D/ydFfq8HkrSx5mm2qtQdEh7MWRZNNSS0e39jX9hnNGr5SVp
         zdPTc/kNQ7TGdxLMYEQiKw2Wu3/WVF1PHhjwttsUt93jOeOUgzI0Gi1BtczmAv7Bjf3g
         IK8/V7wm4o4TrgpqxFpQK6dOH3vbDMHOy9yulq0z9gR54OMnQfZ6ThokGyGXgbtvwdH5
         QYts2ltpPg1h3UukK9FfmQYdC6qacHKOAvv1CIUIhQmMpB+AINUqF+fc/Db5T6tp2rYs
         YL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863370; x=1760468170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUZ9lhN//CkO8fifdX7p4qPCDwEbbiKFsiRCmbfFYRY=;
        b=asKdRRRZklSIzp1LK/gYHbph0O8R42eqpoSwDZieP6psqNDaWbJKYdRPvSOv1IY9/X
         piHvQN8JKkCdKh2Gq5v5Usl4GeoQChKMvnibt0HPte9KSYj+b+B9pS5FFUgg/f2sBbag
         gGjIYP4rAh7Hkk3LMi2LdBEd2Pf9cFnsKsKwdMp5nqLlrTVfwagqCCzoHss9ZVbVVnio
         67CN9T1Scj1hFqRpluBHQq2xz07LN5pGVneTEP1K2r+wmB6dALqx45GoxYQuYcB41u4M
         t2WnZzwwjJ/3MrKJjnwVjPLflWolGASfG4jqaSXdkSHfl+AOhdMIYFy69WoWeoIdTBQd
         5RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZdBxO+cRW8Qt+0RkFP+E/3Hunwpj1m6Gsc2WW1wHdQDYunZpLz85G+AQ+Fhjb7ljNKhkyohWBDlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIeSGsccXnk69mzuWMBrWeVK54OA7HWMTJLVF2XuW26cMbRrD
	gFPhsn6B78KMsOj/ITX+JYXbkdAVlebAP7OmQyEbPTNM5bcgqPXFKNF+
X-Gm-Gg: ASbGncuntJYf5LSbZRa0oXT4dig4OY5gA4BwtzzjyFhl0wMxI7QM+e2W6c4aDgnkQOi
	a14GrzyGbFqv0C4B5LxoCiqRIaMSJwG2c3rFna3tOxLDwRig3Gs71xye+PjkEA2IUCfOoRniikr
	oKkqe65H6ARqmit7J7pE0V2ykDb1LopzNrzmiu1byp68tX/zEwPKgOO7v2bg7r5JVSYLzuhHZWY
	bm+8LLY3/7JE6eZ5wM1klxJwtFANpDBF7zfhSVvb4xlBgjsBer5VcZG8tZbYGV8mp4GzjEArf7G
	bkwE+cLE5fFtyW85qcJbKrApJR7zb1TIReROa+5ENF/PxRZOKdRqAi017fRjTfH2Z7Mki7BC7aC
	MbvqWC0iSA6l2/SZyB3S+KUqjF2QF4kGIjWXHFHezsUBRSZM8928TE3ivLvDXpJLNqN7Zt6csa5
	UH
X-Google-Smtp-Source: AGHT+IEnYwwHsTgb8eOLfuclxtTGN0ot15Hmrmno3ONRkkOazFE85QNijokyUfk/dnUFfALD7cwZbw==
X-Received: by 2002:a17:902:f64a:b0:277:9193:f2da with SMTP id d9443c01a7336-29027356c8emr9333545ad.5.1759863370227;
        Tue, 07 Oct 2025 11:56:10 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:56:09 -0700 (PDT)
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
Subject: [PATCH 7/8] Documentation/rtla: rename common_top_options.rst
Date: Wed,  8 Oct 2025 00:24:56 +0530
Message-ID: <20251007185508.40908-8-krishnagopi487@gmail.com>
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

common_top_options.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_top_options.rst to common_top_options.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../rtla/{common_top_options.rst => common_top_options.txt}     | 0
 Documentation/tools/rtla/rtla-hwnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/tools/rtla/{common_top_options.rst => common_top_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_top_options.rst b/Documentation/tools/rtla/common_top_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_top_options.rst
rename to Documentation/tools/rtla/common_top_options.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index 102654cc0c78..60a237de1e2d 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -31,7 +31,7 @@ OPTIONS
 =======
 .. include:: common_osnoise_options.rst
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
 .. include:: common_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index ea0e9f5a5c0a..8a852949df21 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -28,7 +28,7 @@ OPTIONS
 =======
 .. include:: common_osnoise_options.rst
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
 .. include:: common_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 32d33c792dcb..7dbe625d0c42 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -28,7 +28,7 @@ OPTIONS
 
 .. include:: common_timerlat_options.txt
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
 .. include:: common_options.txt
 
-- 
2.43.0

