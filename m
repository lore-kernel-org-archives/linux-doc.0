Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6AD205ABA
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 07:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753341658; cv=none; b=tcVxKlOoxu+I+U4bBrNXRF3qUdU/5a3qthntti4oHrss+tvnrdOVsS4/xZ/Fx0DPv+KJNCpUR/brTJAWRhMBUbpO2cbx5KDdOPQfjXvIKhysgRYQBlNeglJbx3+J43kEjmwfVuiPzBVrfEVRPNY7LdP9cew+iC9a+Emv+zFcYxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753341658; c=relaxed/simple;
	bh=4NHFOrnlJxQrpWKVDw/v6IQ1txu4TtPqma6pCCMo7x0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0GptT4rfYYN6UcUB4lpKoyqN6oMi3CN3Gkaf+fxDJJD/1p9v4jSchhQuQbQ7Fsn9DarJf2wP3gohxA9mAaMeXuyYidOjFvWqrUbWkhDD8zqqaV5ZYCj/YOR8ZDagn4omgLyPyIiMqRaGAFgDH2seKiRCd9X5nacUQs3cKfQsUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=s8jNm+X1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="s8jNm+X1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4555f89b236so5659725e9.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 00:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753341652; x=1753946452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6sDyX31bMtEXVDsFLGoanfMyP7wfjYxyF/aDso/gRs=;
        b=s8jNm+X1lhGTKwKpyoL2ZYDc2ZfEldwQCKHTBf/VTBLPW3cs6UNLK5FzJELejo2c7Y
         OT7vKjw/h6BPBpJlE7GpFPV8exrOBCv2wfdQDv4FE7xg0XeR4+PBMsa8Q3Qc4ar7fEgL
         ltWXoSNji4J3RJpn3EoBYAD2pMJYlncIIBYrCqu45lzxe8AeFjtt2hmNIXNDqLc8FdxO
         hU1/6oDZKyh3GLaKIihVy4tm+vk1tdjZ5fDgEpaYcukPha/VQhAMCMri8EyWsLVjkQnj
         wYPYeUU7mZ0WEHoXEEHJ1ROmSXF12bbhfcHlEHSLc4vMqk4DUQjUnuX0JZtpSdfZ08kR
         azuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341652; x=1753946452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6sDyX31bMtEXVDsFLGoanfMyP7wfjYxyF/aDso/gRs=;
        b=JXug3G3xAGmQz0tSVS6kC8SwKMMtozCnbdCaaGZpqyPWf+GzfucxtwdePa6MSvfVO8
         AUF52OuBQtzkhtODy6u6Pn0BGQIwE5Ee9OJPvByMNif6REMM4zcsuX6e86K6O/bJE9kI
         KwTNM/HddbRvFdJGrefoQ0Ji6W6JbgRerIXtqhvfHcIfC7JjjrcG+G+I8uqMDYkUSCmp
         oKT7vh0QlbzSEJGPWYf5imdwrMW8zBEC3U0gtm6WcBs94jj6eegWVXcbPmmvQUmQ8dEH
         qkkNgXL8pgv5LKhmtfzz1DjdkoUAeQknFdTPGxzDbnOA6LytTrmitkSaHZUgepPHGf1u
         1VDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTp02T2Dy579NIOYuT6QAxdPlVv2+GsAwrYzimCXso+uw9ymfxKN7WUy24B9efZIJsbluyPRXAUYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtHxkWxYXa/n918JhYN6hbb12hIALXbseUMeWPiSLsdqfYvAu
	jP23RlTHblWFQj/k9i73zTBhNPqA/8VP6u20JtU4kLDAc3O7bQo+ayJYB6LGvh6mLAE=
X-Gm-Gg: ASbGncsp/OPu+NwQfNl6z4JJWkXjvGTlDyRrvHlkSXV/aMga7qk0Daelk/9s5OEep95
	mTWzU6+yc79eA6XdJq9WrLzYkP/YjdjFvOVWdCV2avNY9TJzx85sEKYT3aKh23lhNasD/T/q0cf
	J6wGlmjMeiDOFzoWT7zfoTvg5bLoNSAJIL/YOA/MBMD6FX6VskDmyp03+//DJQ5lByRIs4E+23Z
	UWjDTYbFWGgDtujv7mriPvIfWcRGH75ZHBRZiLdyOx9kBupQ9O+a4kQQ12y66gHIlZ/oK93MPz7
	c81m75oUiO3/pFdlRm9StDs6/N4VIsjayDYXQGyHMI153mYhYkS3EbX//fMucw3qfi6Vo0hllvF
	oS7vTDh+cLXFNugYNyLJc4zi/2gMPr5PSV4uYCEYjmDdFfvmqFA==
X-Google-Smtp-Source: AGHT+IGtoPxWfQ+wEpGjs7bUDWFQ1oeDB2sB8phuc/KoP2/+fvLeJ4l89nxhivkNTcUZ5qQxIwrrZw==
X-Received: by 2002:a5d:64e1:0:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b768f079a1mr5008877f8f.46.1753341651795;
        Thu, 24 Jul 2025 00:20:51 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:871b:95ed:fb39:f517])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc6d32dsm1253844f8f.24.2025.07.24.00.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:20:51 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	joe@perches.com,
	corbet@lwn.net,
	apw@canonical.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] checkpatch: validate commit tag ordering
Date: Thu, 24 Jul 2025 09:20:32 +0200
Message-ID: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modified the checkpatch script to ensure that commit tags (e.g.,
Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
correct order according to kernel conventions [1].

checkpatch.pl will now emit a BAD_TAG_ORDER warning when tags are out of
the expected sequence. Multiple tags of the same type are allowed, but
they must also follow the order. 'Link:' tags in the changelog are still
allowed before the tag sequence begins, but once the sequence has started,
any 'Link:' tags must follow the ordered commit tags. 

Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags # [1]

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 Documentation/dev-tools/checkpatch.rst |  6 ++++
 scripts/checkpatch.pl                  | 40 ++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 76bd0ddb0041..696b42bf4ff5 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -599,6 +599,12 @@ Commit message
 
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
 
+  **BAD_TAG_ORDER**
+    The tags in the commit message are not in the correct order according to
+    community conventions. Common tags like Signed-off-by, Reviewed-by,
+    Tested-by, Acked-by, Fixes, Cc, etc., should follow a standardized sequence.
+
+    See: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags
 
 Comparison style
 ----------------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..267ec02de9ec 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -661,6 +661,24 @@ foreach my $entry (@link_tags) {
 }
 $link_tags_search = "(?:${link_tags_search})";
 
+# Ordered commit tags
+our @commit_tags = (
+	"Fixes:",
+	"Reported-by:",
+	"Closes:",
+	"Originally-by:",
+	"Suggested-by:",
+	"Co-developed-by:",
+	"Signed-off-by:",
+	"Tested-by:",
+	"Reviewed-by",
+	"Acked-by:",
+	"Cc:",
+	"Link:"
+);
+our $commit_tag_pattern = join '|', map { quotemeta($_) } @commit_tags;
+our $commit_tags_regex = qr{(?xi: ^\s*($commit_tag_pattern))};
+
 our $tracing_logging_tags = qr{(?xi:
 	[=-]*> |
 	<[=-]* |
@@ -2712,6 +2730,8 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	my $last_matched_tag;
+
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
@@ -3258,6 +3278,26 @@ sub process {
 			}
 		}
 
+# Check commit tags sorting
+		if (!$in_header_lines && $line =~ $commit_tags_regex) {
+			my $tag = $1;
+			my ($tag_index) = grep { lc($commit_tags[$_]) eq lc($tag) } 0..$#commit_tags;
+
+			if ($last_matched_tag &&
+			    $last_matched_tag->{tag_index} > $tag_index) {
+				WARN("BAD_TAG_ORDER",
+				     "Tag '$tag' is out of order. Should come before '$last_matched_tag->{tag}'\n" . $herecurr);
+			}
+
+			# Allow link tags to occur before the commit tags
+			if (lc($tag) ne "link:" || defined $last_matched_tag) {
+				$last_matched_tag = {
+					tag       => $tag,
+					tag_index => $tag_index,
+				};
+			}
+		}
+
 # Check email subject for common tools that don't need to be mentioned
 		if ($in_header_lines &&
 		    $line =~ /^Subject:.*\b(?:checkpatch|sparse|smatch)\b[^:]/i) {
-- 
2.43.0

