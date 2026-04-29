Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E403FB7D4
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777501499; cv=none; b=D/PRBu9KZmDAVCs5YcmNFh+hZQXQGlPxGo9YE/RAmzgTfUQmnc5gLly7ZVqjt9vB3j2PPves8nh9UoYzgXjV8w/h5J+32WovNWM3eSyv+d31zoN8nt6IgL5P40u7HPw30WC3MkZGpwTNrI9EWIQKvOx+hjc4DlzN+N9xAFIzLw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777501499; c=relaxed/simple;
	bh=ChfDAnV+gNNTiORp9BMDhqwNKvOwfPx1VbemA1Lc7Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W69OeGQId3Qjt9ozqXZSKOtU0szt9eWzkmQFbaEO/DTozG+NB7jJQzHEVDT6uHMwVBw444bCHtWFmvksxTmpO6HB50mT95NDg0hiOVwQE45trFgQG8FGxde31RD3jvRE5iLcHJFnWOLZ8AQkxTuCDq95fhU6CXWQ83VbGkU16Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN77G0fG; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN77G0fG"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8a210c813f8so2403686d6.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777501496; x=1778106296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFEOCdrdgYG4xDTicUeEAHKiDpKmbATZ3OF3dnMPf7Y=;
        b=ZN77G0fGIPtr0+xUzXcDOMuzmwaCT54bf9xbG0LKgCM5OBK7sB8h88y0htEIw+JAd/
         jSe8NSpYyLXly4yMtTKp9Rzw+UrpuEh6A5P1FVE22N7e9dELDSIfNJsl/irQMNSRRFzI
         lHYsR1RVfbw/GmmUwdYgtHd0Uqrkas5r+EHjnguOmCvJYcLbd8PEGi07CIebdZ+ggEwo
         /+hrXx1nTUpmaoVsPzAeLJJ3iilcC060+4yERnljC8w7031gMWB8tRZyksKx40rxewmd
         eetmb93zAftRn23Go54iXGBPXNh6llilLvG5YEkq7p4u6j8IHtOrCd46YAyk5K+B4mBg
         VFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777501496; x=1778106296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFEOCdrdgYG4xDTicUeEAHKiDpKmbATZ3OF3dnMPf7Y=;
        b=CxtiTXtuQvzmFgWDKmxiAKJ/oqxrHda35VI4g9PYXHnM8n1yYVwZPjnIj2DBFTRou8
         /h9lFzPS6nO4oNToDT9BCW0r2h6CQ938+nxhzK4ogOiyP0OMrVSsuKBLiQoQ7pICT5t5
         RHMv+JIx31FncnZJRyj7FBdv3MKtYYMiLtc8wFdM2VS/j6HAfy0T3kQ7vRpJwZd6FQlc
         68KSofoKehhM1hPRVpcxCEmc9lqCIBRhZxEeRBlJM8Q/z57ui77vWgnfCNjKsGMvo8XS
         hLX793GK3JYEULTyNO49kGYwthakSVI4nxCaeV55rmqAKcjkUgK2Q0/Yvn4LUCEfz1aY
         IjLw==
X-Forwarded-Encrypted: i=1; AFNElJ9x3ggcgdaHU71ca1Em7fxwKpvM8YEnEVdYmLClTJZwZbFgomXF0b+GuQ2yD8CPLzZJv3cA7X5Xbow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMcip6b6yh1Gn8kTwwciKixKHj3sPl2sqnkmbj9M897Uj25r3
	fqp0oAfQnkAq37SeJspHzYYWtZHExpqhFoHkUEy3BOGum8UOYEZF9zyI
X-Gm-Gg: AeBDies6Us8n8bIDDxMA/H2BBoo7UfsGdHtmXp5XNB9DAmrBQ10gkURdCM2xJftbMIs
	hlleKvu6sjngz5ktFQW6DtIh3E9vFFr7XCMmfXV1/3dgANCBskGhPKaplDQswMN+4uhGQ6Uuxsj
	5R2gMvFlH5GVM+OeHptQZ4WrRYInIXP62zqTZnMPnSpbcAOs4iWPaW9CApmMkacs80gzWW2rYSY
	aQ4G6Z6F22/8fmhosbDcx8OkCg8pUfwnULI6RCobjsMmlM49X0E+lt8eRBcByM5/BRhq7SeV8BD
	gnb9AA4oodMNhBZvDXuZTZBf+vP/DMMb04aVdldCzzBx9XR1IXaPGvhkrj51/u64REWmT8QYuET
	pg6sasdz++dKUb4mSHz7yWanBt2C4bDOXHgvJZYwjJlfsLHD2llfux33AX1grlMmmuwTc8llN1Z
	2t8vjsQAPjHO1ITyj08JBzLnjBiSWgZIsY3Vyz07I5ozK1zgLJIZCiKUHIpjt48zvecT2vsqs5t
	phk9fF7YuC/fS3gzjBYZcNEKPz8eTZNl0ZqwA==
X-Received: by 2002:a05:6214:459e:b0:8a4:db54:b3a4 with SMTP id 6a1803df08f44-8b3fe6e6661mr5975766d6.7.1777501495658;
        Wed, 29 Apr 2026 15:24:55 -0700 (PDT)
Received: from DESKTOP-II5SOJ2.hsd1.pa.comcast.net (c-71-57-251-204.hsd1.pa.comcast.net. [71.57.251.204])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff474d44sm1154246d6.41.2026.04.29.15.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 15:24:55 -0700 (PDT)
From: Miles Krause <mileskrause5200@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miles Krause <mileskrause5200@gmail.com>
Subject: [PATCH] Documentation/scheduler: Fix duplicated word in sched-deadline
Date: Wed, 29 Apr 2026 18:24:35 -0400
Message-ID: <20260429222435.2041-1-mileskrause5200@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SCHED_DEADLINE documentation has a duplicated the in the CPU 
affinity section.

Remove the extra word.

Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
 Documentation/scheduler/sched-deadline.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index 3ad93cd7b59a..9019b66f6a5b 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -685,7 +685,7 @@ Deadline Task Scheduling
 
  Deadline tasks cannot have a cpu affinity mask smaller than the root domain they
  are created on. So, using ``sched_setaffinity(2)`` won't work. Instead, the
- the deadline task should be created in a restricted root domain. This can be
+ deadline task should be created in a restricted root domain. This can be
  done using the cpuset controller of either cgroup v1 (deprecated) or cgroup v2.
  See :ref:`Documentation/admin-guide/cgroup-v1/cpusets.rst <cpusets>` and
  :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2>` for more information.
-- 
2.54.0.windows.1

