Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B4946C;
	Sun, 15 Feb 2026 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771177187; cv=none; b=hkMv5DudhdJ77+hRUYzdLP2AiFTYs7STyBTdXjs8eYHlWwXrVTy7E1G79YbrByEx90m8v3w3BGy80OP62eOXAjeTKxSAQdCdrhbQV9sQat1RK7DWxMY91aOq1TysckOW3jUesPX6QkQnMFfuzS3s99Bo3WhgKwMcPOLrUDIVWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771177187; c=relaxed/simple;
	bh=l33Ycp65CACdWx2WqacgidSqbewyIBYP11DWGz6olW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GEETzElnCC4HSuCCtBItu9CEoOOK1yZuhtt+K1xHyttOVR6j5cGxlUCHGRmTJdEJiG0z0S+UgQN15pxbSmXvtNwZ7WOZNgnDqCVP7EKUNJZ+zLMKP6HtfEX2D8iJjvGUI4+oMwZA0zoQ+jKz3C2x/ClCUt/Q4Ar+cMH3QCKa8Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=lUIdOqbf; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="lUIdOqbf"
From: Hans Anda <hansa@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1771177171; bh=l33Ycp65CACdWx2WqacgidSqbewyIBYP11DWGz6olW8=;
	h=From:To:Cc:Subject:Date:From;
	b=lUIdOqbfoC/U+MNsa7yfCQ3UMZi0gP9e3uo3QbM2EQuT6mKkO9ghtHO5oA3RXwCyZ
	 gjMUQZQwKslzqr+CCR7jj5hyRRm0o7IGetgwFk+CUwKR+xi6SUeN+VAB+KuaHzdA/o
	 1whDuR+j9zUxHGe1htgr9MzLcmOwBz9OhrOHodgtS7OqhH/H1bvXN9nakdLK7uQZcd
	 7UrkxZt0vcM/nercuD0hX4R1JkJYSv3IMpByrd0oM1ehGNNjCLSiuPTUNBcqnG7kLB
	 kfe+3wCbPfWpQ8uHwMEv6Bisqfbvrgrw0FN6+QUzUWvDgNWU5imDKK2LDoynaukOEu
	 UmDr009s0o1rA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Anda <hansa@airmail.cc>
Subject: [PATCH] Documentation: Text referrals -> Links
Date: Sun, 15 Feb 2026 18:38:59 +0100
Message-ID: <20260215173858.53653-2-hansa@airmail.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace text files with the content "This file has moved to *"
with links pointing there. The file /Documentation/Changes serves
as a model for this patch.

Signed-off-by: Hans Anda <hansa@airmail.cc>
---
 Documentation/CodingStyle       | 2 +-
 Documentation/SubmittingPatches | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 mode change 100644 => 120000 Documentation/CodingStyle
 mode change 100644 => 120000 Documentation/SubmittingPatches

diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
deleted file mode 100644
index 320983ca114e..000000000000
--- a/Documentation/CodingStyle
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to process/coding-style.rst
diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
new file mode 120000
index 000000000000..b4a9864269eb
--- /dev/null
+++ b/Documentation/CodingStyle
@@ -0,0 +1 @@
+process/coding-style.rst
\ No newline at end of file
diff --git a/Documentation/SubmittingPatches b/Documentation/SubmittingPatches
deleted file mode 100644
index 81455705e4a6..000000000000
--- a/Documentation/SubmittingPatches
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to process/submitting-patches.rst
diff --git a/Documentation/SubmittingPatches b/Documentation/SubmittingPatches
new file mode 120000
index 000000000000..ffff4a70bb54
--- /dev/null
+++ b/Documentation/SubmittingPatches
@@ -0,0 +1 @@
+process/submitting-patches.rst
\ No newline at end of file
-- 
2.52.0

