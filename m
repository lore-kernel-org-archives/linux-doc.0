Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209B1E0B6C
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728376152; cv=none; b=pOozfAa57I1nOkyKdtZIXx8uOHkfo/pbA+6/zQ5bYAEgkokoCe7rH6qJUFxyOuicLu2d4UOUivLzCZHdsDtHbvEUQQO3BvMWOcXhnnSNrsmhbqLfn4SbTTisYSM4jSXZeRM8prI6DRssEjRzvzsy+3KEKRDSeAcwuNLJlZiAOb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728376152; c=relaxed/simple;
	bh=2kUlfzx24uSNRplKYF1sda+86294BesT58Y2Li1gfnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJHXRSnQHpTp8gwhNpgWlO283umF343mLAbTkjtalDPAN6/j4HJb0U4KyJCPr8klmVRlSIRRzymcxB3crOOK6UOQPpQyJabjAnAQaZLSB/9Zt5+MSsU1gvpTuYe2+vHcsO0ZvBFql05/ZJJh19VCEuC7tpq61akAUnHVv9ILLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lEu5KSVj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lEu5KSVj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20bb610be6aso59513615ad.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 01:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728376149; x=1728980949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPEjAdZAdKM8As8ooV00IBm7Qnjs2K7rlCo6iukXXxI=;
        b=lEu5KSVjJ1S1xQsRCRGSE1K2hb8dnQ9fmdkR5iUK2lUZC2syZeiChEU8hzcG1mnSLM
         4goeOZNHoSPriZA1gFSGt6tKEFDJfKQ84T9v2gMzi3/9mH0VIwgODZGrjuHRWGSiyfOw
         k3Ds1ESljZNoeZ8Ui0e91x/UlDlb+DeN3tyBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376149; x=1728980949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPEjAdZAdKM8As8ooV00IBm7Qnjs2K7rlCo6iukXXxI=;
        b=NKAPPGe5ChQmdV1GBEUVqaZ+CB1PY3JvjvW3lXwBjl7IMuIMNe1QdHgFV355CNSn4Y
         drngy8rzuGAJixsz9ztarHBAv2WUo1LMrn4cEv5eIzIuhfb4GCULIbVp1YJUG9AbfFiC
         Tlg5BSfFrE4Cnb4sCNraMVRmm1CH97N68EwnAjEnXmp302V/huI6g740JvCWS+Gu44bT
         mtYfKPnnLK/cueRae6/w36i/8nVmkTLAEjRY1npY6OQnnTaEaYE7TbEODy3GRxZ5QPxp
         6pwvOqnUUeDmPZ2jVTWjZrs/DCXkmt7pV18Fw1UjA4lWE8yqIo6rwH5yY/bIHCvBnv7C
         0w2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvMkvhsiRG5+TOmVNAZmlCNdC7p/XisYMXF/hIo7SlidY9af+qKek296FTC0Kd1YOlXOvNSwiGenM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+m73GzBzEtYtdCga4kfiqZadoHjYvTHdzekIKtAWdRcEpvAA
	1qp9wATvH0Oolrg5MXplZEPiUUPecM0avtgdxZDifEdNiNqQ9wPDApT3Dn78pQ==
X-Google-Smtp-Source: AGHT+IH56nKMsGdXXZPfM/++yBwGdaVnxpD6SPm/wRK5S73jh3n0gu+4M32NRbck9Xml9CGHgDT7MQ==
X-Received: by 2002:a17:903:1d0:b0:20b:5be:a403 with SMTP id d9443c01a7336-20bfde64ff4mr196014945ad.11.1728376149374;
        Tue, 08 Oct 2024 01:29:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1398ee06sm51069965ad.288.2024.10.08.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:29:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/kernel-doc: Do not track section counter across processed files
Date: Tue,  8 Oct 2024 16:29:04 +0800
Message-ID: <20241008082905.4005524-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The section counter tracks how many sections of kernel-doc were added.
The only real use of the counter value is to check if anything was
actually supposed to be output and give a warning is nothing is
available.

The current logic of remembering the initial value and then resetting
the value then when processing each file means that if a file has the
same number of sections as the previously processed one, a warning is
incorrectly given.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Found this while improving and checking the kernel docs for the
regulator core.

 scripts/kernel-doc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 2791f8195203..c608820f0bf5 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2322,7 +2322,6 @@ sub process_inline($$) {
 
 sub process_file($) {
     my $file;
-    my $initial_section_counter = $section_counter;
     my ($orig_file) = @_;
 
     $file = map_filename($orig_file);
@@ -2360,8 +2359,7 @@ sub process_file($) {
     }
 
     # Make sure we got something interesting.
-    if ($initial_section_counter == $section_counter && $
-        output_mode ne "none") {
+    if (!$section_counter && $output_mode ne "none") {
         if ($output_selection == OUTPUT_INCLUDE) {
             emit_warning("${file}:1", "'$_' not found\n")
                 for keys %function_table;
-- 
2.47.0.rc0.187.ge670bccf7e-goog

