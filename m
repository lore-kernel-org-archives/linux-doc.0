Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97CD345752
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598298; cv=none; b=HydAIdwy7Nv0s36O6dHdmJ6Pz/uDre0hp20JdbAlDGjQqE+9TE8HdzHdvnvycYI/wzMjzZkp6grqlSFIM2qoFCyp7wzncWHxHSxLHA2BHrZMlHZ0IX6WAaIxBg7NRaLCJYF+pF7Te4hszRJdTsswmIrJN1UHvUaz0tvUHyOn1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598298; c=relaxed/simple;
	bh=CQhe1Z5eog9pjB7wZf6ZBWCksLQQgSGbOD8itm/tSAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUxrY+mNc++Z6lhqy2gOxJyTgNVDMwfTBrTZpaDkTbGNt1skBi5Jy3rzNY0HwaiRKDOfbzdqa8A60NSvidYEW79GJsKVo1841cWIOrQjWQLMnXAGBU/S+knKoHAs8+4jY5/9ae1pIsjwDTk7ZIX+OeIvKLVO0uEXps7cshArVao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB2PMZSh; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB2PMZSh"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-835386ff122so5267646b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778598296; x=1779203096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRoRA1fygScadNd1UCEGzKs7mo1XTA2DV7l11WRYwAk=;
        b=UB2PMZSh5fDhMVqkORHfxyzp44Xj9b+jqNVIjwKL/jKwauzsT8Ab4LrUKuwfmpmuan
         BlYjNjslK+hjLCWnpzco3qSBomheGesIx+B++diSU5n0S43LzZGzdc6AYIwUuSw7GR+6
         2nNgbciRrwUw9c7qE5anoNINa7YqlNtjfoauSryQnX46j3IHTVs0cjB9kSlpVPmbMkeC
         XXHAIAnVdTi2u5r7S6lMR7TH+Ye9GmBqFT5N574ZlzFRieMmi0/wHXJVPKWOMUwON3Ng
         jgcKYJHlyblog6lb9vBCzdBwaVvq8uTh+l5p4pMFx7mX/j7jbXUzKTYdfr+k/mAkQPrR
         PNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598296; x=1779203096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRoRA1fygScadNd1UCEGzKs7mo1XTA2DV7l11WRYwAk=;
        b=IBaSPTrv5UtnEcsfoX+7mNUCxXEk/MYdj847RfobHtW2HJ9OQToWSoM9+DsA/aQ0Hi
         6HEmTc3utCNuQD2dk9Sg7qYrIF4ng7T16nkaEy0mQ48hFmTS/fMOnZkwIElAL/J2HETs
         4QpCShppcnVyI97bRC0S9y2ARqgOzfxiW/Cdg4Ymd92zaMMG98mCRuKS4gSEjAWVpIVu
         z6qp7OizFb7uaWl+pMD1flVcPb6vZC1tKtJ9Wh6zRnmGgc9nJ3FF+4ckcMC5WbutY0kJ
         Pin4UByGRsQZouJ8aMVoX37WgshZ9JeIjPSzlGxKo/VnYFuPFnkd8+sjDP3YymktRpyJ
         8A+w==
X-Forwarded-Encrypted: i=1; AFNElJ/0lB9mpmwiAsXysCwF46p9SrKyUZIsDZMXFj92AyvFaHVvyL4uvrVwhPG0bzODTmSpuvqoRCUJ84M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkgLKiOWSp2joyfttEYEnZJpZmcpuUFl4yqGlveTzcAFiUeEy
	DMTUQKL8gNbTCcCCRYQCP4o69nBcePyy27IUveK/dw9TWKtSzN8s0kfX
X-Gm-Gg: Acq92OE5HKU2FHXgu05UV6MBs5YtBK15PmML+eq3X7BYWP9b8iEgMOLSo4EayKt9RCp
	n6/JRUij+qoUDtqiy43TykvzTAEUI+DJGWetCuC8jcs1HD9zKsij8hOnzHULwk6XDRCCjOZ5Sg2
	Q3nDHR/iahujPzO3eNVabfBL11He8xPXl3d75N+C0XTRj4NYuaK9hdpqEvVRSyDkdsw4y+B6N7b
	HY2CG1coaDMX5ZokVq1zkJYbpb8wmLjOrLNEmQ/xxS3VhWiYkF7WGib+1nnB83f44/KJtJe6+yl
	4GPOxyuEWoumfFPws2aX0igSnLFbJW/v3JFKt2TzT2tvA2F4q/VLT4/xVrqMt70n7eSTScUpmjy
	1QDmQvhX7NLWtbR4aLAK7tS+lt9pYdEWltOfUt8uQMqron10wDGB5PTAcsvD9r5yTrwOqTBiePp
	pO+2VpdLebYZX9LLZ2xI78zD9gGafb28LuCBSp+Ekd/qsOdos8ZF1PFVSWpBgVzEnZtpR6e6+bU
	FfxtLYyv2NcrwdAxCp9SeqL9Mq4g27L7+rr5hJrK2jUqvLZfQzh3IfAV+OPD5Ve/gUfCzc6ahrR
X-Received: by 2002:a05:6a00:3905:b0:835:cc47:6ff7 with SMTP id d2e1a72fcca58-83eebfcd8a9mr3536583b3a.50.1778598295731;
        Tue, 12 May 2026 08:04:55 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682aba01sm23748865b3a.55.2026.05.12.08.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:04:55 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@leemhuis.info
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: reporting-issues: clarify advice wording
Date: Tue, 12 May 2026 23:04:06 +0800
Message-ID: <20260512150431.894-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A previous change replaced "these advices" with "this advice", but that
wording can be read too narrowly and may seem to refer only to a single
recommendation.

Use "all of this advice" instead to make it clearer that the sentence
refers to the broader set of recommendations in the paragraph.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/admin-guide/reporting-issues.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 731865b5e8ff..87dd874fffcf 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -129,7 +129,7 @@ After these preparations you'll now enter the main part:
    situations; during the merge window that actually might be even the best
    approach, but in that development phase it can be an even better idea to
    suspend your efforts for a few days anyway. Whatever version you choose,
-   ideally use a 'vanilla' build. Ignoring this advice will dramatically
+   ideally use a 'vanilla' build. Ignoring all of this advice will dramatically
    increase the risk your report will be rejected or ignored.
 
  * Ensure the kernel you just installed does not 'taint' itself when
@@ -795,7 +795,7 @@ Install a fresh kernel for testing
     situations; during the merge window that actually might be even the best
     approach, but in that development phase it can be an even better idea to
     suspend your efforts for a few days anyway. Whatever version you choose,
-    ideally use a 'vanilla' built. Ignoring this advice will dramatically
+    ideally use a 'vanilla' built. Ignoring all of this advice will dramatically
     increase the risk your report will be rejected or ignored.*
 
 As mentioned in the detailed explanation for the first step already: Like most
-- 
2.53.0

