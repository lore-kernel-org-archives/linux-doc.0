Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B903090C6
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779745557; cv=none; b=JQ0hgnqdWbiKemgWWNuTEyeoGeJjkM8HJILd8OvBZ8igkiahLuKHm3/rsD2DNii+esunEXmZ2e5AwsG+97wEsKgqUFyvLD1AX5CHICY/4p++7I3+pHoGSD2Gy7hgIVKAcJJYWS2ZtAGv8P4mLtpjzhBe3o8KLvQ2FQuVtXIf0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779745557; c=relaxed/simple;
	bh=AQQc+qsxFBmnys3V8GWVjQdTd0RDLs3yktTX5na2/k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ItoQEsn+a3zPNBrdpWDfn/6UzBSp2wFcv91jCrApIvnobnPPYOEiJnGGitl8ctPNKGqDIIlVbrSE1FOoRmh2gFXrjy1f5J1ZFsDknfb1cJ16dy47/qX56QL5rb1Kvh2ZTU4f7nOVEj/qrwDy0L3O0Sck5dka8RSnLrPKemFzQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YF09pfjb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YF09pfjb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a044cb827so7492825f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779745554; x=1780350354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9ASn79Z31lGY6tK17tvuDN4xRduSs5lbhIs7+bqaYo=;
        b=YF09pfjbyaZfdI4ah7VBEJdbrJaXiq1JQz6KHRzFHP8PzV64c7+nBhlWMYadf0x8DZ
         Oe2Mxs5y8CvykuvuA08DvzvQqalo84jDKvRQmEMpd8BYrHVkKX3Nv+Z8xtYvUBBUBc7q
         DUhsj2kFjwhCwKNsapNT9pR6a4NuBNbfOYzjof9WV432jTzG8NVCzGNaFxXNe8tv3sZ9
         OWTPJJJNViJ91ChwgleY7/M58UWJPdc6rM2E6Eb1/x5UwvU70VWCkn7U0rnCYbrudWdz
         nUsva4PSxLi/izQWFTgEXr2VYO7lT0XE5C7SiLOdVEQ178xXN5SyW0KMJxt64hvdwftc
         SIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779745554; x=1780350354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9ASn79Z31lGY6tK17tvuDN4xRduSs5lbhIs7+bqaYo=;
        b=BiGNFsyIkYQoJ2fMcLPkYdAafLVPHn3jr1fkdg3D8hhF6xArXN/d/QsrKcE+z3OgiO
         hEu2tEFPgzo7hpsgN0ecywI5CBtubjU+VPBx6uihjOi2Cn2jCFLXg4dm27dKdRI7IZcM
         mJkYLRGIbaKrhFlVIis+0UxWB0/85aIJ4dowjFo3gDHW8iiAD2Iu+rfmwuuyTcy3m7P/
         rL6ZHB58l+XrBPYSpkgH1ZBkqqmf/C9JPwDB8z1bHQ3Oza6mSY47H8uzMNaHYGQsI3og
         QP1qPzLFxpe3Fzp9erMybsfkqEmUUlVuWVaFTFR12abcufqrno05y3x7mDs5LyxymofB
         FVLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fvCAI27yeThKM1EBukg5wh0P+mjtZraGyreBj2Hxfl1f4ek71hP+Ah6DXJWC21IRHFyG0jlLOjhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMAgAquQhTjp+jCouTzy0rxoIo/EQ2znnfZGPLJSM8AE7EeENq
	OAqGQnXTPJ1Wh5szcyYjGtmKW/FGz4tPIMerYeKwaZZNT7MRosFs9QMNcX0T+7SR
X-Gm-Gg: Acq92OHcxuqqqc+vEDHHphZBbe7VCsNWSXoy0/78Q3tC+pAipUOaaA+5Cm0aQhUmwbh
	uwyr0RHwdO1LW9qR4an32mynX+Ky2VqevMhOQtMc+oInGQulEIRUDHn77oOEAdSoFf6k+tOlOG9
	aU1oXLgzyp6l7Glj8nz1xJfTAWGrAG1q83KBDe+XVbBhEmYqFZGGuXUMsNG0Ghm0N0LqgTk80iD
	mBqFb6clCZJRoFH8Ieg5LpDGz4in0E58UF+QWTj6/okTDyqRsrHY7n14V9wnlJ+AhhIgnjahYi2
	+xLaGHbXCF0HOA1Az8r4zc0a/jzV1EZaT9AeHyr1JoNQi/hzZHZ/XDmyfH2iSzK+k4xB25ElIk+
	kc9l6hEu7yuhcN+H/4g+J0IZBY+XXdw2uG9do94iiGSUvI8YfbrbCEgO+9o5s27IkPQK0K0+vDf
	2RMe0E/+iBvuDKldsUX8ZvIE00WUnF/rVxzaMLbsfTSJ9Z/oUTVUxfkwqcc4H91qKpReb+wctLb
	CEaLCXeaCuDUZ/Uokak7Ai7HvNOUASoNLU6wHonUkQoa8uTM97c+rFTMw==
X-Received: by 2002:a05:6000:470b:b0:452:d03a:7aad with SMTP id ffacd0b85a97d-45eb38a6d8cmr26646552f8f.36.1779745554073;
        Mon, 25 May 2026 14:45:54 -0700 (PDT)
Received: from localhost.localdomain (156.red-79-154-145.dynamicip.rima-tde.net. [79.154.145.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5ed84sm29384627f8f.31.2026.05.25.14.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 14:45:53 -0700 (PDT)
From: =?UTF-8?q?Miguel=20Mart=C3=ADn=20Gil?= <miguel.martin.gil.uni@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Miguel=20Mart=C3=ADn=20Gil?= <miguel.martin.gil.uni@gmail.com>
Subject: [PATCH v2] docs: md: fix grammar in speed_limit description
Date: Mon, 25 May 2026 23:45:53 +0200
Message-ID: <20260525214554.2196-1-miguel.martin.gil.uni@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace 'This are' with 'These are' in the md sysfs speed limit
section to correct grammar and improve readability.

Signed-off-by: Miguel Martín Gil <miguel.martin.gil.uni@gmail.com>
---
 Documentation/admin-guide/md.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/md.rst b/Documentation/admin-guide/md.rst
index dc7eab191..003fd34f7 100644
--- a/Documentation/admin-guide/md.rst
+++ b/Documentation/admin-guide/md.rst
@@ -734,7 +734,7 @@ also have
       They should be scaled by the bitmap_chunksize.
 
    sync_speed_min, sync_speed_max
-     This are similar to ``/proc/sys/dev/raid/speed_limit_{min,max}``
+     These are similar to ``/proc/sys/dev/raid/speed_limit_{min,max}``
      however they only apply to the particular array.
 
      If no value has been written to these, or if the word ``system``
-- 
2.43.0

