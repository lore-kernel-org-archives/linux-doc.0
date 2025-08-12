Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710312DCF5F
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992140; cv=none; b=IE/yMrI12C21FTg08CGLXJfvdlJhULvOiALNJTQXoJNPdNTXvg3SVqzR03Z1e/CV/iYbNqIKbT8DpJQmYvTkHWk5d485pNyzalaIc3bMEo/CtsTiiZAsv6LLZrnJ9ZjfvL66qyRUZyUa9DEh26um1SJpyRyHkuUSk58ADGy+WLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992140; c=relaxed/simple;
	bh=IqM9Egqj60sPQY75Jbo8X/0aXh7vHx4YyPcX1CkbW1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AxRU2Mi7lDgYcursUQcwoJqyKochWQEiXPfVtSWpAccNv8h2xUuCesUBCRtl1UU70iRfBTaMG1n9l1rsBovwU3T+rSE1Fm+8VA3thy2BA+t6U8292FBO4PcZhg5WnoL3k9i6/zxbXHOLw5b7tVYoyqmGDPZYldUiAL9IsDjn/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1qylGGX; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1qylGGX"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76bddb92dc1so6605905b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754992139; x=1755596939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoiwOB73jcXX9IhnQQ+H5JUTDd+HhYY1cCM/SuflF/E=;
        b=l1qylGGX09WqAzsRRWLDd5ZwViYe3BV4JGsJIsOSpta8s83LtjHxx0ukJL+ky1rGA5
         GoOohQOEmW9JZZZHIuc71SdSpSwfGYYs4Y2TYetjQgXwJ8Y9YS+rBxZMNyrejUte8uYy
         FKHCE2fAXIvwd09N4kSpG/VvYfjsXrC9zeCLTk+lImKHwjSGyGM/u8dqAuTeLKrhM4TT
         NixvEfFLO2G90aFF5yG7ZeB8be2YumBdGXFBf4pdFD+0kfG/nCaYsY8UsvgouZAwLSFv
         9uJluSyUFRYdDkfRy9xAPj4NilBuiMMcGRW2Uz7xnwusussrNJu6z0X6ErFv3kHYlAJM
         tzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992139; x=1755596939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoiwOB73jcXX9IhnQQ+H5JUTDd+HhYY1cCM/SuflF/E=;
        b=XqXfQBa5gWZ9oJbjDlntOQlz24rgklbMgwVtrme+hc6ohPLGo5I74kkHlrPlKakvFc
         eiq1jRChi/Zbvog7/tXwyegBQ/O+IWpnfqSvoaOAOEJvms1EgcWob6boQir/IPiG15Ch
         syuQl4k18aCET1WFvHfM2A3Y2TztCdoCpSAmYMk2k14dJKiaP1655OVqwjQnmh/g9/gz
         0magZPh6pwFz87XkaMha8jgRao+HRy4otRe+jBLYkTxh9IeY5lnl8hKm5PBmZ30jdNfK
         T6AkLsTeqpdoP6ykrArqLT7j6KPGTJ4wNmP0D+TGWK0o7QXj+aImnMLpCxYzAuwd6c/E
         8/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGBcG9Z0OBcqss1MhYD9+YcxIxSlpzEXrbbJ6CYKohkRpa4N+BnGj+ycRXncB+KXX/f5dmAZ2BmnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9pmb3xskMAc5fYqHuC9tBw+W44lUw1ErWWy5N4WtxA/X5J3M
	O7XbadNhblpD/8fg/FLkPm0gqbQcUD796REofwWNCmqhl0u766l61i4MfXTRbwYto6JLwJY=
X-Gm-Gg: ASbGncsgpokefAiuigPvlrylWXwMp7nGTlMMyJrSZvY01riyiM9waIAHFzEYKZE/JNX
	Ym3obDKCg4iSiJe3h9QEk1fC2YKP4ubqHJfBUXC3HjrL7MhehfcnpsYeOCWzQx9GV86MsKY9PEO
	8X16MaCAMXxqDucy/RPsi6JzBMstsrGPLZhAInYcv/H3xIhtetqrID4OGnV5kLkynoIbcdMnNm+
	bHXXc7PCTSN29AaBySMGl0KXB4jD75mITl0gnrhX24nMjW9yFK4XT/GGIZF7Z1srLXlbSbg+79q
	mRL7MsBImRbQuDNKqTrxRETnW/127bAkkV1ETYtPS72jERFyOjcJn34qa4RVdcB2K04uzKTBLg5
	qmznV4UhYQ/PdV2YW4y3mL6KGDI16LfW2ofbHh4bhFg==
X-Google-Smtp-Source: AGHT+IFk5gkRYuZgrPrI7adUC3TaYSMJYP9VlEaIs890Cz2OO0izXYMskNXCFzGuexyVyMXyp2sHyw==
X-Received: by 2002:a05:6a20:3d8a:b0:220:aea6:2154 with SMTP id adf61e73a8af0-2409a8920f5mr4985976637.17.1754992138519;
        Tue, 12 Aug 2025 02:48:58 -0700 (PDT)
Received: from kerneldocs.. ([157.51.103.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4371980668sm7029833a12.30.2025.08.12.02.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:48:58 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH 2/2] docs: rcu: Update dead OLS link in RTFP.txt
Date: Tue, 12 Aug 2025 09:48:24 +0000
Message-ID: <20250812094851.3770-1-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikil <snikilpaul@gmail.com>

Replace a dead link to the OLS 2001 Proceedings with a working
version hosted on kernel.org.
v2: Added missing blank line before Signed-off-by: as suggested. 

Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
---
 Documentation/RCU/RTFP.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index db8f16b392aa..87b1c97c3ec3 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Month="July"
 ,Year="2001"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
 [Viewed June 23, 2004]"
 ,annotation={
-- 
2.43.0

