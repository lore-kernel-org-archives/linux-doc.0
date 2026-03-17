Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB43A4500
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749183; cv=none; b=QdNYLEWquHb7VRDw2uRFMvNH1/K0tSa7lzS6kJGPM5S/ytcPLGRvOUMSDSet99IHxDWMJYcJCN/uRUS6MdOK/fe2fPzQ5gUV6AM+iDYK5d5pFDcWX8J5+gfa88QubiwyqPKc+RgEjAX5iWbrdlPGz6P3UJRiX9YPA8IjwUMpGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749183; c=relaxed/simple;
	bh=vuBUXXx5vMozwnr+IisLYxoyOajWMh4DtThx+hbfOeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giihSZgI2WZgAWC5NYRaeMrAvu2oTE7GcH0eT4x3ZATgCELAIQivWfy3TlHJh58udm/nHapubyhNKqJ4S52nB/oZypkvDdNQCY6/40dXm36SaNlg7SOisfG3K5kV/bTxzdT6lJgZX50ZnbcUHOmwjsNHtO8cDMUx+4uTmQ0CAv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+eem3Fo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+eem3Fo"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-829abaaa92bso3666564b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773749182; x=1774353982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=peL4C0FfafTZkyUoqeH5wx0M8Gc2BtKH0IqNYSYENdg=;
        b=N+eem3Fo80p2eFmTNtUok3vu31IwZvIFWrJDbiB2qheiHknvb1Jr9iZRjDR6WM3oV9
         3/vFgfTSBh1+k93RF6MC5Wo09lek1Hq7mg3nVXNkcPOfHfOMT+6JARkdT9lVW2I5AXuv
         wStkafu8eevGSWjEpHB25mjO5d5b1pR/oMMaTUnZoxd3WMHZ7QBQ8pIsqQ3pT7k8rPVt
         nx7CSTgOOtjQFyHAE2KKrGVoYM17YVU99+VEajiMc1lMRNh083qdBPpbzEjniW+OLdSa
         /xjP6bbzp5jH71ARJB1hMWTEKsFSPtisxjv09B0C9ctW8jmAmMyAzSUDvFlde1ZMqLor
         8cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749182; x=1774353982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peL4C0FfafTZkyUoqeH5wx0M8Gc2BtKH0IqNYSYENdg=;
        b=Zjt1nNnptGDnWneMaO3gPike5ZSmEcuekkvyi7JnxzHVHaQPtkHHwQCxsW+FupiCmT
         b6QsXzHd+yjSmVS2scB5BLnClNZ/gfYN3L8tLcmft9015uT/suS+g63jQ1lq61xMIVBP
         BaPCMe7Ub8K7tF08RmY4QpqggkZ3qMa97+zrC5BsvYP/zfnWrCu/JrhUU04Myp7qyYjH
         PyXqzOzFN20x90APz5HbAxgCRQHC/b6FycoQNjuGWk1k44Qcr8DLZMASDxj9x5vAAEBq
         f3KzsIChXRw43v18JjzXKkzMKefqBr/uAtl04JBHIhZ9pz7Ak8XYKBfgC7VzlHN90LxF
         2Rpg==
X-Gm-Message-State: AOJu0Yx4GImv3a3ieEkHXAYug7v03kyyVhzrKCNAaYfZrlpdj68sPVOS
	mUNGVSsjGsRbWAshsdqbdXFM+J2Ssn7A+X4etcP6zyI+RCghR9Jk5aYYoeoLLBaw
X-Gm-Gg: ATEYQzwRwfMno3Xx8ad6SiAvt9g1O8KO5jRJjY7fYguDx74YZurKZlp7caVkVphcWJw
	11NT2me9SkvA4OPfkTIKGs8MC2ukwflWm1lz4QXfOWhn1znBqNnGgJL9lIlJgEOp9ZQDsC+r+Oh
	NpPmfAF71UiqVENcXxI+Pvj87O8Ofy5Nt1BU5i3ZJhHqaCl3s5uYqsMfKSBMnHON2bVUnc9ObfL
	Ww5NT+Qe6CMoCW43rijK2I1y5YI2f1mK9Hup2DmT8LV++ljT7KpMPiaiDeE4F2IgUNzhXs+oG14
	MsLM5MCmN4ub0xYVAvb2zc+xxz571uKOdfhw/MGCDvchNXSn6mHUOua7EqwqmyG6v+GgPMGi7N/
	SNobR+0GcGMpOcxzciBcTPVkZin+jkyvsM04R6n37EP8W1s3RdE1eMgAkXsGBH26+s6yv8NOn+P
	6fNQxgwqL6Zq7Xh8S9q31uMqQ5lckcuAcYKR4=
X-Received: by 2002:a05:6a00:a803:b0:829:7f7f:cbcf with SMTP id d2e1a72fcca58-82a199237c7mr14888312b3a.56.1773749181843;
        Tue, 17 Mar 2026 05:06:21 -0700 (PDT)
Received: from localhost ([220.247.131.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07370353sm20102374b3a.51.2026.03.17.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:06:21 -0700 (PDT)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] Documentation/mm/hwpoison.rst: fix typos and grammar.
Date: Tue, 17 Mar 2026 18:06:13 +0600
Message-ID: <20260317120614.51046-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/mm/hwpoison.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/hwpoison.rst b/Documentation/mm/hwpoison.rst
index 483b72aa7c11..71b4b45c3505 100644
--- a/Documentation/mm/hwpoison.rst
+++ b/Documentation/mm/hwpoison.rst
@@ -38,7 +38,7 @@ To quote the overview comment::
 	for the mapping from a vma to a process. Since this case is expected
 	to be rare we hope we can get away with this.
 
-The code consists of a the high level handler in mm/memory-failure.c,
+The code consists of the high level handler in mm/memory-failure.c,
 a new page poison bit and various checks in the VM to handle poisoned
 pages.
 
-- 
2.43.0

