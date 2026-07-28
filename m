Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E03B2FF7
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 05:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785216306; cv=none; b=TV+F02JfcdaumGGXVrZCi/i9LrGluJdcSpwaoEb/3IniaeNEWJ6b+hOKeb902AeZSQmirfmMXF8u6ZNs0smJQjFRr8SB3DjzeZYNeB+YqJCUknDY7ogNt/9uu6JsbbsOLs5Tq/Or8n9Izq0SUTE0ifeBNQEsg51vam7hlQHb+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785216306; c=relaxed/simple;
	bh=/59R314bV7u6J/Q1dvT6ZHgghOW2ELDIohu1mKc79A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F62e0DHffYaFbPjW4GrGEESmf9XycX+Ou9AhWlTf3/WnyaGP/m1rcVgoNo5xIYgGvuE79uDB4G2JsKcI3TtJ7SoO5FCu3sSwxiWCm/HNUn60Cbbm+70BLpt3fgrlxyk8cYLSqRi/CBNWfyLG4RrjNhJiHCfKFmmdpS0lC6Ebr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh62n61O; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh62n61O"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44caeb973b3so1900700fac.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 22:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785216302; x=1785821102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RViZYt3H1G9bUgjeW/M7ulmxBOpprcrBPJ5sg941ehA=;
        b=Zh62n61OeWIv8XNOyZI0PhUYNCa7jq1B2IXjAU2Czmt3XPLT/jgcDk6gPU0MvjjAKZ
         aGVo/HptCJxYRIY1Cz7RBkJP/3h9s0vC48KOLrD8b2cQnnlR2/1SUcUXy9bAt81IpU2q
         o/y12W2MNAnGDkv9ExRvq8SwEgxm/N8f4CljMfcmfBGNttkaRz1sNhuCiTujGENGUSvJ
         jowEO7ozFAGibBrRMMLDRvCDRHlEwaBBwjf8ebcRljQH2p6u/92Bezqxn5+c/k1iMXbD
         a8WgM/awD/j4cg9iTIbWpVay49Y3eBU6QcVDFkkrw9bLmTU/cH9BhAoRcy/na8ov1inz
         i5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785216302; x=1785821102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RViZYt3H1G9bUgjeW/M7ulmxBOpprcrBPJ5sg941ehA=;
        b=Om1BAIbLN/4QC0WQaUtM7ZqpaH4/uK6Xt9BfG+uHYSOd/qUbyx6vwlLl+zgz7OdmH6
         URdN0bJ343+espll9b9fO6bO9NLL3XCoYSi7EUOuVD0u73uytZngMG1KAZEwUP7/g+Q4
         Ws/8FYpFlOeF9casP/oLe+OceKdqeG1o1Y78A6w3u1cPwMxuZBXiqJyJuoRZ8KS/ZiWY
         4G6+WbhQmhh8CzXWZ0YOaifw1/sOUOxTbBn4UOnkVfVCKenXlqRLHUDBN+QqUvDuw3lW
         qRprsvenuo9FvT71rCppBG6CvddBWddWMspAkMY6MJVnjsZf3sg1jP4taJvT2igmZq4g
         vfrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHwfEwptydQ1IhtvEzWv/NM3zogD9qt23vdJlzXck/UBobSns96mWqu0PoTQb5Ah/JthBGljI8mEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEQLU+hzq5TUyUOJfxXUV2EcVDDjS50T65OT2zr7beheHUXDsV
	9KjZCZKrV5U9FpVygmV1oG2wEo0G9tE78ccNed/8tcelkFSQAjz+7BPI
X-Gm-Gg: AR+sD10dpVNMJMYnftlYtXij02k2n3b6LnNpy4TSlmOq6CvmpM9NzV1bWmtA3MDl4sc
	y8IgeKjCVZ5aG+/yio532++AUyKOEl32sE9K1hkarE2kF2OmmnIaL68DNtlFVgrrFrWQPeAg3Y8
	Gxa2uAbtklvebPooM0d3SO9eLWFv5rCecl74EGMZV4Na1bzQlbcMCZcYVq2yVDExfCcQVp8STpt
	Cfve3u8mm3I6SAGYH3RY9UsXZGHA7lhYZ53rc+n3Uki4CHybqLqrlNijIHcbg8a42Y4E//7qoOi
	4hZfl/kouoZrb9SzSxG060kT8rb+T3+W9lVXd99jQTIXgf30c+3JCWyY6qF7FWmHaZSaA5X4LG7
	7rhfgbpziKh9MbyGdcydvjIG3L/6BuFHFmN7O7TmGSWz+jzZY7FcnIFDcf4JVsq3Vt7pbFwk=
X-Received: by 2002:a05:6871:c91e:b0:448:c1f5:90f7 with SMTP id 586e51a60fabf-4586c8c1af7mr705437fac.19.1785216301583;
        Mon, 27 Jul 2026 22:25:01 -0700 (PDT)
Received: from fedora ([187.170.33.67])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45767488299sm18014036fac.16.2026.07.27.22.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 22:25:00 -0700 (PDT)
From: Cihan Karadag <cihan.cihan@gmail.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Cihan Karadag <cihan.cihan@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] checkpatch: warn about possible missing gitignore coverage in selftests
Date: Mon, 27 Jul 2026 23:24:41 -0600
Message-ID: <20260728052442.626076-1-cihan.cihan@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per selftests documentation [1], every generated test binary must be
added to gitignore to prevent leaving untracked files in the kernel
tree.

This is an easy mistake to make when adding a new test. In fact, a
search of selftests history turns up dozens of standalone follow-up
patches with titles like "add missing gitignore for <binary>", each
needed only because the original patch adding a new test
didn't also update gitignore.

Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
whenever a patch adds a new file under tools/testing/selftests/, the
same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
moved, or deleted file.

The warning fires once per patch via a $reported_selftests_gitignore
guard, even when a patch adds several new files under
tools/testing/selftests/ at once, mirroring
$reported_maintainer_file's per patch dedup for FILE_PATH_CHANGES.

Link: https://docs.kernel.org/dev-tools/kselftest.html#contributing-new-tests-details [1]

Signed-off-by: Cihan Karadag <cihan.cihan@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst |  7 +++++++
 scripts/checkpatch.pl                  | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 6139a08c34cd8..9201d1cda0d44 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -1293,6 +1293,13 @@ Others
   **PRINTF_0XDECIMAL**
     Prefixing 0x with decimal output is defective and should be corrected.
 
+  **SELFTESTS_GITIGNORE**
+    Warn that, if the new file(s) added under tools/testing/selftests/
+    generate any test objects, those objects need to be added to
+    .gitignore.
+
+    See: https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html
+
   **SPDX_LICENSE_TAG**
     The source file is missing or has an improper SPDX identifier tag.
     The Linux kernel requires the precise SPDX identifier in all source files,
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94f..a4ead4677e3c6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2701,6 +2701,7 @@ sub process {
 	my $commit_log_long_line = 0;
 	my $commit_log_has_diff = 0;
 	my $reported_maintainer_file = 0;
+	my $reported_selftests_gitignore = 0;
 	my $non_utf8_charset = 0;
 
 	my $last_git_commit_id_linenr = -1;
@@ -3492,6 +3493,15 @@ sub process {
 			     "added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
 		}
 
+# Check for new files added under kselftests
+		if (!$reported_selftests_gitignore && !$in_commit_log &&
+		    ($line =~ /^new file mode\s*\d+\s*$/) &&
+		    ($realfile =~ m@^tools/testing/selftests/@)) {
+			$reported_selftests_gitignore = 1;
+			WARN("SELFTESTS_GITIGNORE",
+			     "Added file(s) under tools/testing/selftests/, if they generate any test objects make sure they are added to .gitignore. See: Documentation/dev-tools/kselftest.rst\n");
+		}
+
 # Check for adding new DT bindings not in schema format
 		if (!$in_commit_log &&
 		    ($line =~ /^new file mode\s*\d+\s*$/) &&
-- 
2.54.0

