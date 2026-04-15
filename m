Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D77D3D649A
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776275556; cv=none; b=F10S4y/9QcyG0Kmp81SiHjeNbdZNqoS+f8c9BcUSRqdWGWpDYigW6HayGgl4benYcM1kx2T8GGbhpSurSzWkideEeb4PAAJ6uwhGPuyryAcL1VVmH9w4RV+7IYICAs3DDaurXzxWAFh2OkYeWz4raMD773zXkZieLrOpRNs9F94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776275556; c=relaxed/simple;
	bh=CEoIN4hbWHsWs2fIH831NCYDbaWcyrpV6r/hS58ZGD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJf2pwtxYj6SVmLfBhE9bJh5eMg7r8RJ2B2EHCL9I6PGDIAutQytvjjJHDbB/9l0o+nDMHCSRFzzZkBAA2Cqz7C5EyODRM7sB/lhSZjncyvwT3g0cvGBGyaYDicGOrViEKs4P8Dsgsrkfcp4WptnksuJb7CiAh86B2sogyYUQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HT4gbV7x; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HT4gbV7x"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d70b3e159so1798376f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776275554; x=1776880354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdjcD7zkC4Ffs3/NLQJC4RJdZibISgd8Xa7t12qdRuE=;
        b=HT4gbV7xNtxcyW3ba0gVogPQUOPnekDbPGLslkFNgkEIJNepk4bqUBKSei7OFlCUU7
         rTSFM+U6OJDk9yghK5GijGXQxIdXtRSqcjzu1+/cZv9o868PRw1AnW/KArE3Bv1EDSDi
         N1kIymOORTc5zMuYVJBt2mQkSlezn4fhDrFEzscqUXqVzNWTE+ZhZV0CXAMyGR4UzWEr
         va7h+CI/B+aRYyN6feYFxuJyn/FkytuCfKl0FMWjuJaFeJVIS8ZFnsvs18MPRCrdkNZU
         Qjh8yIgHaSk7Bk/tBbGebkbKkM/W2gfZemhnxTpCYwZUHHiuflPnSuU/l/AmtxMD2cHM
         W5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776275554; x=1776880354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdjcD7zkC4Ffs3/NLQJC4RJdZibISgd8Xa7t12qdRuE=;
        b=iHNace7eRrMi8FCN0FVZgQNMC9ohfR6XIVfP35y7xwWrUSLbE7YYHtYxdy3Dq6llp/
         1/ygAxF953Jht089m1tuIGPdC91JKISATK39TcYiM/UTlvUA5U7LxYL8RKXPqXNLFMcd
         z90/gjEXZhAIu5OE7/mgxE7SkVjofn0IlRwzCzPfr5k79H536JteYJRRmHLz7PAjoe6O
         +4m4ZZ2sKpcOF1ZEfZu41s1O3NQdmYT82dsFRbWXrxVAbrJ/3FpJJtIuwlXEfao+bJn6
         UAuKjwKAptZQ0B0JsxD7Qi8mWsGX/g+m0irzMz+gzPjxUpJFbOufAUpVkdTmZFRFFWW+
         jgaQ==
X-Gm-Message-State: AOJu0Yzj1hXWt9o3mO78v6dEM4ZgeAzCthScGst+KJNRvtyKeApdCtvc
	5/t1vcQcvrnv/Hcp0WfN8D2cDADLW9F25w7R/hV9Z2GSL/r1dEFLifQIXNAS0w==
X-Gm-Gg: AeBDiesQ0iDbFSqdFMnyfXO/k47CWkgT8bK8UXTPN7VWXMjc7QRCcJNoJUh9Q5gs84Z
	s64uURaBSdBve5yXzdztDx2oskxpHSjXLtazoyTR89/iXOxPacEgKNqVjR/+GkJxRH7XfUuBmhY
	rwl2vJ4BBK8Iohpncm/OtnbAIkdiQk1cpnmLwFOMoiShQYtOSYpCogSwjc0KGx2wnpg0dAZv5XC
	pMPJIlB0nbmerIocZ4kmfJn7tvjTU8y7lAAg1OCv18gvmNzqnSyPzs7lO466F82k9MzMoYCa0E9
	yVNYzez+w/IPP26qpOVSedZBRJXXt/7wLJKHE9hJO5NRRWNTWZZpuxvZnTCUDjnOgwdhHTLPXS+
	nZjHpmofxM1tEH2Y04wlYsPnfRuO5xdFYB1p139Ju2HQ6lyhPQZiyOqObAxrA8j5Jy1Q589AISk
	RyOKT/VqhX3IkcW9h4lEtLEO/wuZbsqAV2pS/OVRZbM5YOOhGGyW1K1AwfE/SDtyFVjdLy
X-Received: by 2002:a05:6000:18a6:b0:43d:77c6:be6e with SMTP id ffacd0b85a97d-43d77c6c5demr21547074f8f.31.1776275553408;
        Wed, 15 Apr 2026 10:52:33 -0700 (PDT)
Received: from x250.speedport.ip (p5091f01d.dip0.t-ipconnect.de. [80.145.240.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6d3sm7166741f8f.8.2026.04.15.10.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:52:32 -0700 (PDT)
From: Myro <mirademche@gmail.com>
X-Google-Original-From: Myro <myro@myromyro.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Myro <myro@myromyro.com>
Subject: [PATCH] docs: proc: fix minor grammar and formatting issues
Date: Wed, 15 Apr 2026 19:52:30 +0200
Message-ID: <20260415175230.46721-1-myro@myromyro.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing "from" in "prevent <pid> --from-- being reused" and
add spacing in vm_area_struct range notation for readability.

No functional changes. :)
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
2.53.0

