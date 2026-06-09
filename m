Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5C83D8133
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988793; cv=none; b=qYXPyU3kWRyDjCOx3ajHZl+ZhHbsvuQEYTaR8a1xQISwNxut/bymUvn1FsuvwnzQVY77mL/tovhoGJvck8IXJIZLkgY8CJm0qdXLNSHGEQlpsT9SsqacA8Cz7KniB85r9koaNGGKl64nlfJkbSWE1aG/PWryy0YpyhP28alrtW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988793; c=relaxed/simple;
	bh=oiwe4QBq6VsQVpn3uQZgFrq/tbccq0J1WUKXppa+c2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGK8/ULGg40U5IR3p3TJbKuZGBwnPbsbISMrk4tWw9KAfXAOtcAe+OIBcu1aLDB7k2frLUgYvdQ76G5JTf4nixj66V2KxtzzaI/X3fwfni1CIQhL1iFi3WohlMaMEMyKzGJFZI0V/AmUbEBRdtR0lk4qi0XAidMzOVeIOjDyfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=lkmSll5m; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="lkmSll5m"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1382533d428so122822c88.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1780988792; x=1781593592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXLnE76qQ2OPpZ1q0Fv0oZK5gappsBSk6RXxc1BFu/U=;
        b=lkmSll5mwbutS9nj78t0oL9yOXfvw2FmOdxDqpQzuTPQ45yzHk0fGccqnQe1op/k1Y
         0phvsPwspWRTHUdFBkyFeBSq5nJnmITElzipo51YVYyvpW/ruvtL5qoe5r+6WP6OIjPg
         Boa5TyJM21AbmNvc9C50Jgg90N61tV2NdGdraBxYwR1eFJTx+BA0XjQnq43jcuIjMZri
         ClcwVMu04cybnqOaChgqY8EhPPPVSWvAs2Wblj2RZkvyOW+DCUf7VZ8KbkD4CyATul1P
         kiidoFGobxX8ZncQ4x8TTIbKvWMXVWGBWpB6AHWaToDaI4Y+6D9pr5GZQaJ1zXu0GMUJ
         MgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988792; x=1781593592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXLnE76qQ2OPpZ1q0Fv0oZK5gappsBSk6RXxc1BFu/U=;
        b=d6T6vGMlgD2n3UlxvZTbyfoTf4fqRlU9gDNdSPsIzJiVi+XFBT3xmKWaA7DQ7WmlnJ
         bMpjWeFHxeetiiNBNhyYKmBBs9xyvMvQMuah7XcSr7QaLQMcESIOrxwjCXo4+f+/e/lW
         Z3n2am5oRZpYhIZLgpCMhAlaTIozHPlND4+w+Ui/Ja54DL2DMsd59f4/EJSqmIMBDnSO
         2ZHknuYAeefVYpOnV60gh6IOXiJxqc5ywsy6SQ/6vp2YJOqxstxuHBUmm8HdrSzg9s94
         kT8yEw31rk0BUlbAIxYnwrvtA9fSmodj2rgAaQHLVmIqLKQceeaqCJUiz9goayq24Mo5
         EFsA==
X-Forwarded-Encrypted: i=1; AFNElJ++g2Z9hSqdVFR2DtMashHDZVihoPUo8FeTwrz0dSaJE2Rjin3n7k1oKnqNrdqzIlUqqO/IYVrySuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGWA9Oibf/KQojoY4xbx1Vya3jJeeCeUHw5o3di5r8D9mK+82
	jx1FRGIZahlPlQYJzgqRUYPgqmN2NAMjnxotACc78qg3AMtZeJ0zVhO7BWNpuZJ28T4=
X-Gm-Gg: Acq92OGpUd2xuZwApIX4b6QZMTS63f4cOZz1e82DvlCF2ukJRLElW1SLZeyr7eKurul
	MbmtR94UNIKINihlivFUcFJS7MyZRw2oTTf0uynw7pyD1T83YfAJhSiDtYncRZCLm5vyEN40HgM
	8/FcsPTS8xGEICodvyyYq+W8JEn0S3rlltPbd3fabdkEii7jCAklO0hN1hp0tzaTTC9gXyNjEiB
	qNwgrE8JL1G6BqHsKpFbF5nfDfwbKImq84lTwubURuigp51jNOSIgfZsL7c9t0ESafX3AocfHnV
	58OkgfN7TAxe3XmsE0TE8hPtzQNrbgCfr2TIaAKC+ZPr2cSIDhHF5q9NgOGFAvI27+EHsirViBl
	nwvfNlJ6+58pFIyKCjhg3/GCNb9/sA/V0qgfavNgNwF6/wCp8XoLheJPCUEujOOKIdF5j5D1hk+
	N0PGxhxOcP1rthHpC7ZHs6oi+Q7QUEX1dOEANeE9rrIfT3zNQhTpqgFJlti93Hhw+HcWufN+bfC
	CVtLaI=
X-Received: by 2002:a05:7022:e0b:b0:137:c0a7:8d01 with SMTP id a92af1059eb24-1380670bac7mr9919440c88.23.1780988791563;
        Tue, 09 Jun 2026 00:06:31 -0700 (PDT)
Received: from brighamcampbell.com ([2605:fb40:0:c09:9ca9:e0fd:b7cd:be76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f53f06c4sm13989084c88.0.2026.06.09.00.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:06:31 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION REPORTING ISSUES),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2] docs: Fix minor grammatical error
Date: Tue,  9 Jun 2026 01:06:17 -0600
Message-ID: <20260609070618.12566-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix minor grammatical error in the administration guide.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

Since v1:
* Drop pedantic line re-wrapping.

In hindsight, I should have guessed that reflowing the paragraph was
overzealous. Thanks for the guidance, Randy, Thorsten. I'll remember it
if I make minor doc fixes in the future.

 Documentation/admin-guide/quickly-build-trimmed-linux.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index cb178e0a6208..3432dc8e1a85 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -217,7 +217,7 @@ again.
 
    There is a catch: 'localmodconfig' is likely to disable kernel features you
    did not use since you booted your Linux -- like drivers for currently
-   disconnected peripherals or a virtualization software not haven't used yet.
+   disconnected peripherals or virtualization software not currently in use.
    You can reduce or nearly eliminate that risk with tricks the reference
    section outlines; but when building a kernel just for quick testing purposes
    it is often negligible if such features are missing. But you should keep that

base-commit: 738bb6e6c8d992f33335b3cbcce051ab118a33dc
-- 
2.54.0

