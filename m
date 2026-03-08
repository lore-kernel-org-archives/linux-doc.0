Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66293603E0
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772993398; cv=none; b=YCDYeNpCJNJsEYZ9tT9aHUsD5evCa8Fz1iW+h0uff9kaWaTKfzHQUpHVZ7o+81JZDszLbXqai6x5S+IFM6PN5izOsCumwDwux/s2LluMYaSLeoplCZQ4k6dtxt1Ydi68ngF3meDTYrqguBE1I5tClM9cU/TbeHQt7ZYklTwvVrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772993398; c=relaxed/simple;
	bh=XmsYEmCoXNT/C2GWn7qZw2zbifEAERePDgg8h4oumeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sSd8MvfYSbWbC8QZzjZ+M8zjvp8SWDPqBJ3IgaEBP7nICVqtXK1Zpa1yc7bnsE+PrB7XLhvHb5WYdSE7UvHG5GMRfZRHxDKUjbidFzyeruGtH+AutTceSkdm4hFzbcpQqpZ5xackPzgc+uxvkSeDqtFzYHz+g/8eVik4bWN18GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtDHfvUJ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtDHfvUJ"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899fb030812so105872256d6.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772993396; x=1773598196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iqw/4Eli0nG5osMBUIJSgBSBQi9kdXgUAruDyKaARRE=;
        b=dtDHfvUJ1WFF2sTZDvvFrFtg6D81PCInwoXsetZzb5DpU5b3C46gcNb79o5Bru/Q2e
         t82TkAz8NFOBBK8c4sWkeDrJhq/shnd6ZHBo5stpeKkGZ86evX39vddEBS4WyH3Erskk
         HW3yyKcL6vGKkd8tptIHDEFdMnF6QS6AEXs8XqbgHWgAIRkvgkvHOUzKRJxt9e8VzEBx
         LvwqFoA0NIsM9J1/VyEVYgsblRNp5ES6seqgiDcZ99Zalj+RSMVTVSjGB8mnJ7vWhGby
         S8lNiRDdpGqNLr0GEKLz9Wv8hgOi/6BNMfPkiJRt2jauNJJmnQW3BKcaPTujmSyaDQ5R
         oA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772993396; x=1773598196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iqw/4Eli0nG5osMBUIJSgBSBQi9kdXgUAruDyKaARRE=;
        b=qfrSGoky1sO2bT+BrCz4SnhbBWJLu/u6OlyJrmRCUZNLTEWX5CYmYe+rq4DNWtkevX
         xT1145zMGEPQPwHulYP/va4W2k8DCTs56tE3krltEFP6DDUeL5yR25Fh+30jlQFQJfrD
         mnpgjt0pjbe3F8QAuVAtWBXPSAiQIHonXSfk4VGZbKTzRHdrTUqwnRnIa5v9L0rjLPpO
         zLvauPdNlBNhiku2N1bfox7Vwd/jAAbJxbsvdm754nt6tDouzXq4129KNC9/d+j1Ms1H
         ZrC+HTFcx8SVxkveZlxNoQczIttEk+dWO8YeJnwzJiY0uiI/TRf2ssu3IlOMRI5XjY0U
         HoWA==
X-Forwarded-Encrypted: i=1; AJvYcCXYm9rASQbQjvXnZRB4KXdB6QTPFNn58lTs/3xXJ4D8VFMeE3YA12O0nsWNpjaS6QgmIhwgCKrt4FE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DHeRgjUY5i/jpNi5KyXApAXQreLjFUMwLEwj1ZEAKO+G0nut
	qy21iBiZrWAtfWLxvqd5NK1jgXPENiLFoQblrQDS7glPF7nu6k6QZWn/
X-Gm-Gg: ATEYQzxy5Gr24wo5myB18Ll7Zfgo8vDmk9DLlTpFcFnjZ7UL24rAzIKJwLYOufZxFtj
	k3jUWDBQgCM0yNQ5RXeENCj9Ld408NAc6Wbqbvx8I7QJ108qMFkWQjliWSBPpMe2ACiJYkiQcBP
	ANLpAulOOgvT0gsiXXEn4kEy2eiQBjFizPah1SNyYweg9g0z6W6HeYo7InBvAqbTEUQujgQuYaC
	WFQdq2qkX1crQcrnkjA11ixkOSCRkvCYshGtmHPdWo2Ky3s4jyj2g3fAuuGhymF9YIItnfGQsxH
	1CZZ1CoFuK5JPWnILc0j2X6C3/bq46UAVOmcoHZA3xxvtVUd1Ig27XH8qOT9vLdb8PebTUlHvVv
	K7YB4N8GdUFUGIrAY0cU8M14gW4kQrugY2IEOisYQuntRJOsvONFFlQWinHyMJJ8qaaVPFmMwVC
	4K0wfrkUgbfmdWPr7t5pA/elz1gm4QHvni6uekQjLzaRkjCdVZsEoXqh2lz9M54QrGcw==
X-Received: by 2002:a05:6214:c2a:b0:89a:1536:2529 with SMTP id 6a1803df08f44-89a30a31b87mr120367666d6.15.1772993395869;
        Sun, 08 Mar 2026 11:09:55 -0700 (PDT)
Received: from Ecomp.localdomain ([163.252.225.68])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a31719574sm63773696d6.48.2026.03.08.11.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 11:09:55 -0700 (PDT)
From: Evan Ducas <evan.j.ducas@gmail.com>
To: wufan@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: rdunlap@infradead.org,
	bagasdotme@gmail.com,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Evan Ducas <evan.j.ducas@gmail.com>
Subject: [PATCH v2] docs: security: ipe: fix typos and grammar
Date: Sun,  8 Mar 2026 14:07:34 -0400
Message-ID: <20260308180734.5792-1-evan.j.ducas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several spelling and grammar mistakes in the IPE
documentation.

No functional change.

Signed-off-by: Evan Ducas <evan.j.ducas@gmail.com>
---
 Documentation/security/ipe.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/security/ipe.rst b/Documentation/security/ipe.rst
index 4a7d953abcdc..5eb3e6265fbd 100644
--- a/Documentation/security/ipe.rst
+++ b/Documentation/security/ipe.rst
@@ -18,7 +18,7 @@ strong integrity guarantees over both the executable code, and specific
 *data files* on the system, that were critical to its function. These
 specific data files would not be readable unless they passed integrity
 policy. A mandatory access control system would be present, and
-as a result, xattrs would have to be protected. This lead to a selection
+as a result, xattrs would have to be protected. This led to a selection
 of what would provide the integrity claims. At the time, there were two
 main mechanisms considered that could guarantee integrity for the system
 with these requirements:
@@ -195,7 +195,7 @@ of the policy to apply the minute usermode starts. Generally, that storage
 can be handled in one of three ways:
 
   1. The policy file(s) live on disk and the kernel loads the policy prior
-     to an code path that would result in an enforcement decision.
+     to a code path that would result in an enforcement decision.
   2. The policy file(s) are passed by the bootloader to the kernel, who
      parses the policy.
   3. There is a policy file that is compiled into the kernel that is
@@ -235,8 +235,8 @@ Updatable, Rebootless Policy
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 As requirements change over time (vulnerabilities are found in previously
-trusted applications, keys roll, etcetera). Updating a kernel to change the
-meet those security goals is not always a suitable option, as updates are not
+trusted applications, keys roll, etcetera), updating a kernel to meet
+those security goals is not always a suitable option, as updates are not
 always risk-free, and blocking a security update leaves systems vulnerable.
 This means IPE requires a policy that can be completely updated (allowing
 revocations of existing policy) from a source external to the kernel (allowing
@@ -370,7 +370,7 @@ Simplified Policy:
 Finally, IPE's policy is designed for sysadmins, not kernel developers. Instead
 of covering individual LSM hooks (or syscalls), IPE covers operations. This means
 instead of sysadmins needing to know that the syscalls ``mmap``, ``mprotect``,
-``execve``, and ``uselib`` must have rules protecting them, they must simple know
+``execve``, and ``uselib`` must have rules protecting them, they must simply know
 that they want to restrict code execution. This limits the amount of bypasses that
 could occur due to a lack of knowledge of the underlying system; whereas the
 maintainers of IPE, being kernel developers can make the correct choice to determine
-- 
2.43.0

