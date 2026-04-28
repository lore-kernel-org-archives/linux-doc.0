Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C774611E8
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383008; cv=none; b=FRqMW9Qt4HbU9AFpYMZtsVScF1yIEffgq1uQUHiJv4quhBcdeuVsYdqvqyNWurhP0fRHGSkv6SYi7zfISKKCx5AaWJi/+COjOeYrg3vQCWEgu8QFATgWv3C6jG4KNKYoY93j2wIdl17m1Wt7Nq0KezpRgR9RwwXAOsAP+VkNRoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383008; c=relaxed/simple;
	bh=9yK3v9zH8UgDPb53CR/yGT07CWFKeF816m2d6kBsu2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eRmSRneDcker8Zg1mItm4hDfm1/tzXm1VAISY8v7B6RToT9sJt7LtMGAsiIb3XRAr68BdpD3rrbwk3eTGxOn3I+otf6Ndw8CXQTDJKZ6INeOHx35eUxhOcsBWGoRw0oSWiiXj4Uc6XEC1sEznYtyOzMuatzuJVWDhKwi1UmPjh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clZinBi0; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clZinBi0"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so8718375f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777383006; x=1777987806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9lH8xObJRXM9pSjbIssvHMZFWL9qCtbRDK/RF4gDf0=;
        b=clZinBi0YVpj9pN/sFHgKts3T+h6f6q1MLQLnq8Mm2WR6ztd5j4FLpkevRQhDJqq/8
         wVd0lIo0cmGD4FUnWPnKuTgI0Wgynrg0BWhCPfjTWaoV37cXtQu7HXxtYuLlHacYtO/j
         fXBbL/tZkvNmJyaAoX/L3imMDsiTUuABYfRqS+od5AOByVW5StMUuCwn5MzFlkZfwKdr
         D8d5FmibFt7BxQ4H+51z/i5LSzgpd5S+XOERoWxhq5H2i5OGxAyI/ma1uTKNn94T2TN6
         XvtqZkwTzQkivvjUBM9RdM07NahNq7gJ9c25AQ5ZxbBTiULm+EN/mEoSF56EvY2SwVT5
         Kw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383006; x=1777987806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9lH8xObJRXM9pSjbIssvHMZFWL9qCtbRDK/RF4gDf0=;
        b=ChUjnoOO3sI6ekgPsCZ5pYrOcMh8Mt5OC42ByZnF6czvSYes8zD8BAyC9v3doEWS4y
         Na8JOg4M49YVlBsNm2WxfCUHI9N3/HpaeYjOB/nRe2DXoUqYcZwCKuXzDtd62nWXMwAe
         lDhWYuTLASB4oJRwNkbZEWh0bHJW4SWxSD2CiB24RJyvtySi5NO1Zk4svBSn1ob57Zf5
         OVO57rKKyWage8AWQabCUy7+9NlYJCiI1V88VYFT+7HSavmpJPSVzhp161dy2n7Q8wav
         gUurw8PKqn5YtgEnJmf03orUgoOqmPZA+Bls9jKQThKBWL/0hDcxzHi7GX8PiJ5ZBXSk
         Bd4A==
X-Gm-Message-State: AOJu0Yzccez68CudgXbWbhgD33gMWxpZ86Y7k/es0OLBoPGO/RaIAYfw
	dDqDdXQBOUQ9BfFO27C0HKz1mhN0oaFz3mDw0/q6LrkL9AfWuBsofgwP
X-Gm-Gg: AeBDietnXo/NDJmfQsijr7K9yxh19kpztnjaVFIlAn80ihgnJnTX8vQah30i3ZYIERj
	K4STdmzuNgcW2CEwI40v/cNJ/iHUXA+JX9dSHsvXmZ3R5uSOWLLNhN88BEii6KglRmhGmwnuYcP
	Ct/Y295/dDJwqonyYdwmcWH1o+W7a9o9cRJrgDx4rwqRyJP8P5Io03uxKj03lhs61dMbrAKsHE2
	r4jJSEQ5m8SjjfNItb8VkFmHdBSBN2Qdf76033ik1vnl/72OlWQiWGtYupUD7X7AlEHRgCufTZA
	dsXfDxE28hATqDnFKy8DIv8F2RLfJ9J5y4KVFw0mvJuqDCw4P4nYGAosW2V9jkSAK5V4/zHhqxe
	b2MVr1mhccKdE0zw9FMKno4mdo8Bl4uhTDrmCmI66fSkx3saIHjPHeNTkWFuoJHkZUIZ1ryi/G+
	bzSNYadHCKyedbztAaJy2qBcFulLDSypLfN7S+fRbMfLG2TunYSmcjX4WKEnSAkKz8Plaa2FC8X
	uTGt8RXS+6uYYduj1vUIgGrjZqVm10=
X-Received: by 2002:a5d:5d05:0:b0:43e:a72e:ec5a with SMTP id ffacd0b85a97d-446487770b2mr5966453f8f.20.1777383005423;
        Tue, 28 Apr 2026 06:30:05 -0700 (PDT)
Received: from x250.speedport.ip (p200300c65f496da8f954fc28a74b8004.dip0.t-ipconnect.de. [2003:c6:5f49:6da8:f954:fc28:a74b:8004])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59e5asm6714024f8f.5.2026.04.28.06.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:30:05 -0700 (PDT)
From: Myro <mirademche@gmail.com>
X-Google-Original-From: Myro <myro@myromyro.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Myro Demma <myro@myromyro.com>
Subject: [PATCH] docs: proc: fix minor grammar and formatting issues
Date: Tue, 28 Apr 2026 15:30:01 +0200
Message-ID: <20260428133001.11384-1-myro@myromyro.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Myro Demma <myro@myromyro.com>

Fix missing "from" in "prevent <pid> being reused" and
add spacing in vm_area_struct range notation for readability.

No functional changes.

Signed-off-by: Myro Demma <myro@myromyro.com>
---
 Documentation/filesystems/proc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 873761087f8d..d828006bd91c 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -118,7 +118,7 @@ PTRACE_MODE_ATTACH permissions; CAP_PERFMON capability does not grant access
 to /proc/PID/mem for other processes.
 
 Note that an open file descriptor to /proc/<pid> or to any of its
-contained files or subdirectories does not prevent <pid> being reused
+contained files or subdirectories does not prevent <pid> from being reused
 for some other process in the event that <pid> exits. Operations on
 open /proc/<pid> file descriptors corresponding to dead processes
 never act on any new process that the kernel may, through chance, have
@@ -2199,7 +2199,7 @@ the process is maintaining.  Example output::
      | lr-------- 1 root root 64 Jan 27 11:24 400000-41a000 -> /usr/bin/ls
 
 The name of a link represents the virtual memory bounds of a mapping, i.e.
-vm_area_struct::vm_start-vm_area_struct::vm_end.
+vm_area_struct::vm_start - vm_area_struct::vm_end.
 
 The main purpose of the map_files is to retrieve a set of memory mapped
 files in a fast way instead of parsing /proc/<pid>/maps or
-- 
2.54.0

