Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66761DF25C
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 01:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761183685; cv=none; b=eH4k9KeS+0Mt14MEs6NnmP4KX7sEifWWxdhW+54fuhUXrZ7H55S7vSpMZE26o6HsgaAMrxiqMqZKtrRtYPCWJkC+8H85B2hEHlpAWPzaOg0XKOQ6T6pLVXgerFYTwkfvuDiBTUjVauj1KX4jCJvDpWbtitJVg1jtPPmvZvEK718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761183685; c=relaxed/simple;
	bh=3DPT2ECsqKwSg7ut66ATTn1BaxmhelGSo8EQZCwNbgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qe2ivr534WL550z36BmbPGcB4vd8UgaTQjubA1PFZcVkmZyYGWsR5gZL7XVVoBpjcOc/lZaIzMxu6KBuCywlfmOsPkh+Fe2dfTzGI9P7phORYHz5+vT+0r3P3Kg4DsQwgWHqvH9Gk7quAMY63iqjWSz4WFeNrsYgk0VZcnYkHiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqDyfHpu; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqDyfHpu"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33c4252c3c5so281586a91.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 18:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761183683; x=1761788483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzb/oNr7wFTg3J3xnm5Y3CrcceSpW2kAmCmptqc3yeI=;
        b=XqDyfHpuooR3x++ZQSBr1J31EcP/WamdJg9K/A2UQKrYKP7bxyJ8DrxBXUmNm44P9q
         0aSoZp+xMb0OWvC42IS67IuxrMKDxM12OX+WBV+lBwaw00163q/lnz8oP1ZACDbjv9pO
         O5MJR3BxnlwQV8Sz2BadAp5ukfXrNqbXcKcK4Ayz7hRaxblAmlfxQcqJ0JBQKmjgbKS0
         FxYCSl0J3fRAR04UaCTs6/yvDyvfnKpopbr2aJ0JUQVN1gv/DmOjZe/vyKIJty9XPN9i
         c8vgBm1ctz+ic5q4yXP4yvq5CEZPAuH2xYT6TL7zPnjWLEtIbKtXELXupgZnBQv23EMa
         iWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761183683; x=1761788483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rzb/oNr7wFTg3J3xnm5Y3CrcceSpW2kAmCmptqc3yeI=;
        b=g8itILLY/LBEKpUQ135ezOHHQP+/7o6ZZpK0+HG76xoKlD0czrmMgcmCH/R4u58bM/
         Pz5gMoMLlX949Lemzz6Y5KNUEbXrXV5p0dRa2KEOHqP3URSbiqT1iBWARaf8H7gNvFUY
         BlAZYhvMrlnXPgtfVAhHAJij47lpi83sFlUu5wNJEP0Em9TBKgMbY27SynWa5J0IiqJ2
         mUlw84wNOj8XsxpLHSjClJ6GiZdsi670f6MbRsZ5wc4PV7HN1IGHQQgBVq/DQHpkYWx+
         JBV/xlDMlAcL9Lnea8onT7TciLGnxFgZD/TWtHIzlcktPRrGNn0FVa/yRgQmO/1Ai89Y
         ak9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyINq2MTSc44LVktzSwSTdI9odpY9uOAyXrNE+x9h+n1HODITBW5MhPc1Ti+oKx5CoWFYnfCAuUK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsY+jzWkRZtjLfURAYZ2GxjQKZTE/ErwcW0nbphzv71vm+WKf4
	fUqY1a3xLmW9il3dQGdrSoYEaccTHaPfGpRbS57HsKfxFX5aSZUJ96ed
X-Gm-Gg: ASbGnctwnRJNUQLDXpWmGPGoPBprfLsTrysjbzeuFAUuZj4gYLlKSv2CI1qaMRSgrfF
	HFWQVk5diRou5xU7k/K9KTeOnasEYAk2rjmhGvTrEFbQjy+tD0MJKqeFuHzA3H4BOk/xQtjajRl
	h0FAaP36R6xGJMDjpvVNMbNDALnednxHQoiY4q8AOkjPGsDrPCi08+iRRnVKhPQ5H6LTKGCz9Be
	mxzoJiCI6UkShRzip4mGH7nj1w1XXKSmu37VY9dqFeHH7uK0m1kbYAkC0+ZDuxC5m8BVX7y9RQG
	nyivNVbDTsB2VJkYT82FE+2IGaIX9o958WiYV2QhoprzbwArrtEfeOt6MRnwvIutxKaXwQRTdpd
	ZiC/jj1KljBtXR97beKk+gXS36p3qRVghNSBaIrs3Jcpb8HdDT1PTkyH1CjRwMmugbWT3vq1YKz
	3vg8/t/nr86+SmdA==
X-Google-Smtp-Source: AGHT+IHyIRvXdVYrV9i1IVQ4yrLt8Zz4b5Hm+8BXHKO49Yornhmp/WfuLPUMpzo6U7zGSqIeB8W5IA==
X-Received: by 2002:a17:90b:1e08:b0:32e:f1c:e778 with SMTP id 98e67ed59e1d1-33fafb9755cmr1009728a91.3.1761183682871;
        Wed, 22 Oct 2025 18:41:22 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff37c14sm570651a91.2.2025.10.22.18.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 18:41:21 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 486D3424180B; Thu, 23 Oct 2025 08:41:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Serial <linux-serial@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Cengiz Can <cengiz@kernel.wtf>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Anselm=20Sch=C3=BCler?= <mail@anselmschueler.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] Documentation: sysrq: Rewrite /proc/sysrq-trigger usage
Date: Thu, 23 Oct 2025 08:41:02 +0700
Message-ID: <20251023014102.16777-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=bagasdotme@gmail.com; h=from:subject; bh=3DPT2ECsqKwSg7ut66ATTn1BaxmhelGSo8EQZCwNbgE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBk/211kX76SnvR916miWyZ/tkj95O0t+uypJyp4usrAu tDwZ9rVjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzkgDYjw6dzlhqiFdpOd44n XA9++W2B8643hTMc3qVPVCiQO2H5QICR4Xz0QtUjU0W1Pzun6xx6fXCZxZwbffv6e911nOSVV5w /zgcA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

/proc/sysrq-trigger usage documentation (in "On all" section) states
that it is not recommended to write extra characters to it. The sentence
may imply a contradiction to previous sentence which writes that such
characters are ignored.

Rewrite the description.

Link: https://lore.kernel.org/lkml/7ca05672-dc20-413f-a923-f77ce0a9d307@anselmschueler.com/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v2 [1]:

  - Keep /proc/sysrq-trigger future API change note (Tomas)

Anselm: Do you object to the rewrite?

[1]: https://lore.kernel.org/linux-doc/20251016103609.33897-2-bagasdotme@gmail.com/

 Documentation/admin-guide/sysrq.rst | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 9c7aa817adc72d..a88266b171aa17 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -75,16 +75,15 @@ On other
 	submit a patch to be included in this section.
 
 On all
-	Write a single character to /proc/sysrq-trigger.
-	Only the first character is processed, the rest of the string is
-	ignored. However, it is not recommended to write any extra characters
-	as the behavior is undefined and might change in the future versions.
-	E.g.::
+	Write a single character to /proc/sysrq-trigger. E.g.::
 
 		echo t > /proc/sysrq-trigger
 
-	Alternatively, write multiple characters prepended by underscore.
-	This way, all characters will be processed. E.g.::
+	Only the first character is processed; any following characters are
+	ignored for now, which might change in the future.
+
+	Alternatively, to write multiple characters, prepend them with an
+	underscore so that these all will be processed. E.g.::
 
 		echo _reisub > /proc/sysrq-trigger
 

base-commit: 0aa760051f4eb3d3bcd812125557bd09629a71e8
-- 
An old man doll... just what I always wanted! - Clara

