Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF832D660F
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915948; cv=none; b=g1i3n1ZqkSmasyWPRBbMpjCZBmaSdnlgr2B4XSej+0/4sHgSax5nYjgPwzz8ZAc1SmaUhvgQXCjpuTp24IjTlI7s3Ut7u4j2/RhZ0y+OrwVaH3JS0xhTUA+scwRtcS+qEJMwMBTyHNnPlEo4Yl6bd0htTsyuxdRmBxm1+ElX0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915948; c=relaxed/simple;
	bh=JELGV9uxYb771JQzUxfbsoM1pDEUVMvV4KIKwkr0cto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0VEsFK8JTNMpL0q+aibUrtIT6gMgGbe1ebLn14zXWcHKSD6PC/IpigKwHpCyisWxbIQDz/BPdQUEVTfMoXWx1jRp3+KgnM5IJ/RB5tB64CtzQD6Dv1v8s0OH9Ha0KEK5JAC79Yye6mflQo2QohjhXsZKyjGZiW0ptSA9mRBm/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9z7qH8U; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9z7qH8U"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31eb75f4ce1so3746184a91.3
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754915946; x=1755520746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRfeZ2wULaO/ukbbSK7auYzt6Gdpx1wOukQWQfpAB+Y=;
        b=F9z7qH8Uli+9IlYionfU6DCh0JWk4Kr8FklfDWjQYGg1b8Hy0SMwCViJj790qHYvJD
         WtoxCndSTQX+zHciY7hh/W/9/hAS78Sxg7DD4NooOyFC1rtLeKjYZep65msM3oYfhFz4
         DjaAY1qserhrHI3TMjSLupDqyn+DOOrrAlVDFxS8kJr4lb0Lt9RQjXAu856iXKCd6nMr
         s/IhioN9854yQcPUDffJta2CCegWYFZcHXt+K6MV9V4OuxAcVBxbcqaGhvbW7hms5qLr
         9uoAU6wh/YJ9rx9ORS7xTJYlh0MsL5juXFrJN5IXmytU3Jaj8DQF4X0q1/4S0qJ9LEhn
         ZLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915946; x=1755520746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRfeZ2wULaO/ukbbSK7auYzt6Gdpx1wOukQWQfpAB+Y=;
        b=D0ANQpDdehaIUYtmENeZ65ZZLo476Ok+HTaUnO5sK/FNj2NoC5b53FhfUeysFY5WLX
         4atC58J+xit1CqxfTTRbh9zywm5GBK1mKxLsrr05QM8Exe0oXYHDHcwvTgYySnbxq3kW
         Cadw6Cj5WRkzjCizo/F15CQA8xEL6MdyDVbPZ25Ya1nMugTJfFh0BiR6LlodODNCcAuh
         awahQFLRn8CJV91Z6c9xtAFd2oeMFSC/bhGHtc/0+we8RY4ttDqqSZ6PN7YbOODaRkOX
         hbaSIsAdydrNqc7DaJWj7UyKqZxVFLsMlWyTGpiPi7COZZXmqIvF1tUiv+ixOTRnAzUC
         6PFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBjYKv+RVTO88mGHYmBQU4jp/OBQql6U8AJMWMNiyq9efRvtWzaDdZcFXcjYme9QRFbIY755+fFGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9HtudOVKlxgAQtVTcw0fzWl1+BlofniVw7E4/9GT9GkeLDpUR
	k4HiTfENZfoED6VTJbGcXIrgTrS1nOm7lhqGvdJHrzFijXXHIUsb/IY=
X-Gm-Gg: ASbGncvztxqBk/ONx0qyn5Ne6+9GXTQTISjigSGwxuCUnrjFqMMoy+9a3DSkV/tXv2V
	tBBkmKjU2vPNv4YkiFN1P4+W59973NZ1xXj9Z49o/UHRXa26/5WsL3goB0UP7W+tufqk9S4T9u0
	36dmzM3gjvc2akjOESspLZYRBv7DFyKWANKFG2tkd/cu1bFxIPQhPwH1T58MfuHE0asjKhPFw2k
	MDqDuE3PHaZoPEXCtnZ+bXc+z5o4QHoJM6MFUpXuLNaz9v+Mfgm4b5K6VwmKxy+94PEEUUc0OCT
	pMRRa1PAz0+J3Ic3Co6ylSh6cKvUs8EWt7t/h+ISi+IfRvPd1rLxda0ofp7iGHEUG86NIbpSiIC
	WzYDLNAZZpxUzfnsE6L2tNcygZkAgigBdkfVFGGsB
X-Google-Smtp-Source: AGHT+IGr5GxVR+NNUc51sa7zH6pRSzPgZdTCS/mxkTxWL2PvWVdssdSaJyl1ykfwlZ0rhlI4ggtQaQ==
X-Received: by 2002:a17:90b:558e:b0:311:ed2:b758 with SMTP id 98e67ed59e1d1-321839d9dfbmr18229202a91.3.1754915945476;
        Mon, 11 Aug 2025 05:39:05 -0700 (PDT)
Received: from kerneldocs.. ([157.51.80.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216128ac08sm14731699a91.30.2025.08.11.05.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:39:05 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH 1/2] docs: timers: Update dead OLS link in timekeeping docs
Date: Mon, 11 Aug 2025 12:38:36 +0000
Message-ID: <20250811123837.4378-2-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811123837.4378-1-snikilpaul@gmail.com>
References: <20250811123837.4378-1-snikilpaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikil <snikilpaul@gmail.com>

Replace a dead link to the OLS 2005 Proceedings with a working
version hosted on kernel.org.

Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
---
 Documentation/timers/highres.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/timers/highres.rst b/Documentation/timers/highres.rst
index bde5eb7e5c9e..24dcc32f8dcc 100644
--- a/Documentation/timers/highres.rst
+++ b/Documentation/timers/highres.rst
@@ -58,7 +58,7 @@ merged into the 2.6.18 kernel.
 Further information about the Generic Time Of Day framework is available in the
 OLS 2005 Proceedings Volume 1:
 
-	http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf
+	https://www.kernel.org/doc/ols/2005/ols2005v1-pages-227-240.pdf
 
 The paper "We Are Not Getting Any Younger: A New Approach to Time and
 Timers" was written by J. Stultz, D.V. Hart, & N. Aravamudan.
-- 
2.43.0

