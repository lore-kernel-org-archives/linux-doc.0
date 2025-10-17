Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D6F29B77E
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724159; cv=none; b=urqrP21OYLm92kvrY5KSRN23uk4kkV5q3uE0L2PHyX3g1ErU1Zzbk4K5oCxVYV+koEPtBnELeOhl/BkaT/ziTed1F/zkN9m3pcWOpMdokr7YVpLXrJrbZfzsymwYObFkBVQIYATKlpwvmKSOexDI4z0r+xbgElekqUKaAt/UlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724159; c=relaxed/simple;
	bh=jwRvVCNYLGeSa+0leHMXF7EXzjGL8SPjU5bfAoQyeFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unANbdvsxHifSDGCDb5nWooS7wwY3kQrM0xDrW6rQ1v5E5jqAa0k7xGQI0/v20MMyVi5CSCJ9vi4I7QS51iuwtILCtOt79/t5Zf8DHI73m9GGUdT/nNG0NC8sQ2ODKDfr8S7wm4Jt9dVaHbdSWl0cbqkzfqOVkKrL8A64pRnNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=npRBgRq3; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="npRBgRq3"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7811fa91774so2072806b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760724157; x=1761328957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ukAYWQ0T+S/AD9w3VhmapO1quF1wQBT8B5YkcopmuU=;
        b=npRBgRq3dkB+a1KVrRA/IjdAauC0zH/CrON+lsaBqe2S+v1U/f2DnAUjRupS95b+0s
         HQHqNO92ARYR97LAFks467282SHj2Moa+1crMV+J4Q14rMuADcsGJTDG+u8rmnGvVGyZ
         SkGy9hMu4MIJPwBn10UmdTR1hr3d04tL6hQiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760724157; x=1761328957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ukAYWQ0T+S/AD9w3VhmapO1quF1wQBT8B5YkcopmuU=;
        b=bLW64/yMrd+5bRa8BQsxW8o+8DqY0btGa/TQs7QdO87YFlXPEDjF5GZ4ziK3oV7GxJ
         0l59TLuh58r5RmwZOKz4essM/9LSGCXGgYQNYBC7d15InUqJfHYK9n10c2dH7QDQ9umq
         qf0k/SoDyJmSQfRnzuvi7zo4okFL9fjkfp8gYxqkIuLGpUqfRG+MZnN6r/CldXgxScOY
         UoyUSrjZR9JwkG61wZY9m4b1TKUyDv2bZvCz6V1P44/jU7pyck9EZj/iwfkY1yhJA0Y6
         JvvEmvIDhVe1wowBAbAdopx5rb8sPHUQKLAJgPNYhEc78ey33/IBHqU/ArSNr07LUgO8
         OjIA==
X-Forwarded-Encrypted: i=1; AJvYcCVopYFQIoMXL/m+I7KpwnS8lURxoJwPJgms2Dv9TRek1w50n7psZDq+fVtu+S4wCU+XT36xhUbY92E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnpEyefox75ltTfhFjOrSquogFZ0Vsgvc4yHm7wDnA+CC/++I
	UpbCKKhjlX5CiEEnKOMeEv07Z1zJQtl/rk85YNLowHj8I9/9xQgqEtAkAUYTr0UK4A==
X-Gm-Gg: ASbGncuD0zl1Ifb6++AH+jrHUFDFAsQmF/B6joKZYRXZyQKFijZE+HwYT7RshPo60wL
	XniHwYptWz2iyiiA/Ns0nq0t+MkTzOXCOb8tVszJ4liGqe1cqlCF+J3o9ufDiy+f0ov/l5S9Tyf
	mU1c4/gweDIM26QQoqVwakzGDk8N2dKX0odemqk9osZjm4w5et75iMuJBywT1I1SN7RS5UaTxZC
	HhqxGdTkbavLgXbT62UBUxi5Ef3fKS3Q4wG9ANsOTtHlt97A3xFodtjliLomvjF9iD99/yuAtsu
	9H+gFGQQlqXIPTsthTjSERiYDQdmnzh2gXyFXjFV1aIaAScE1eGyqfCgAGR2c6V2Zmj1reLFP2m
	6vuL7m1yq815kDR3plURXuTmY4QLrlCkcd4UHP6WY5iMt1lYMVU1GIFZq9QrjZbgBubHeRPOJoJ
	Bois8FDbqwkzdhASbhqMRYqgYilnChHXcJd8gvZjrZQgO8+gNC
X-Google-Smtp-Source: AGHT+IEY+KGbfcrrIWW9UFIVstpKYMq5DjhrzNx35qx3JyQw0vx6QrYeoAPZjdoiMrwc8TIfDGRpdA==
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id d9443c01a7336-290c9c8a738mr59262805ad.9.1760724157127;
        Fri, 17 Oct 2025 11:02:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5ca9:a8d0:7547:32c6])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-292472193c2sm1227785ad.104.2025.10.17.11.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 11:02:36 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] docs: checkpatch: Align block comment style
Date: Fri, 17 Oct 2025 11:02:19 -0700
Message-ID: <20251017180225.1489398-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ironically, the block style comments in the checkpatch documentation are
not aligned properly. Correct that.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 Documentation/dev-tools/checkpatch.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d5c47e560324..d7fe023b3080 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -461,16 +461,16 @@ Comments
     line comments is::
 
       /*
-      * This is the preferred style
-      * for multi line comments.
-      */
+       * This is the preferred style
+       * for multi line comments.
+       */
 
     The networking comment style is a bit different, with the first line
     not empty like the former::
 
       /* This is the preferred comment style
-      * for files in net/ and drivers/net/
-      */
+       * for files in net/ and drivers/net/
+       */
 
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
 
-- 
2.51.0.858.gf9c4a03a3a-goog

