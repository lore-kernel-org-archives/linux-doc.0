Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F57E2FFF87
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763229612; cv=none; b=JDPJJL5M4WFKMl9LffC61RSrKO86kzcWmK8AeAn/DoE5aq1jZLqTsfa2D0I3G9mOVrYAcFC9cZT0nVB/vfQilHy4+ObYCQlYlkO/MSX7GaOR0A4vytynZymrdDZoj8Drsm1z5jj7i3ehZSFbJjvG//xm/Xn+IYwiRpA6xbqeT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763229612; c=relaxed/simple;
	bh=CsiyJlXbyfRxrOzeK6gj/XnLGKhvmQyeGb9s4WTB7yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2qUyaedj+NxCLrpBZiDa8ClhlT8O7EdGs/YXincPVyzuLiyQVhk8g+oOZ4DAHLLs9KnMbkzAh6L4y/ZTn7URzqwh6tWBLM8sOOCzuz20QExEs37DGKui8RYwljbCQn1q5e03kisikOKBU1ykPb1QtG3u49RDxSVgCv/qgrHOGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8iR4oRm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8iR4oRm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297d4a56f97so31608125ad.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763229610; x=1763834410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXa39g3lX0uLafEymjfro1eQzu9oup1GMo1ewT5+ko0=;
        b=i8iR4oRmJdHmJADw1aB4TnoeBGxwOz21QAjm3+5KznGcQBoWq2CBWjmldBERRJmqpi
         xMTnBzxDucEhI7PJlsa5C/b7v/mToIBQGX/oYmz9U7l7J+YbMz4sBnoJfW0m0dWOIuvy
         38du1mBuG56Z7+g4QYwdGaS/lonudqvlwM14JKoQw0iG5D7avH5M8CCtc7s0MqYSmr7v
         dODLDGDhZFai0FK3HvudbgVMT4jK0AbA5Mp4a3sMirWyii64Hi10x6bjeRIOezzodFBB
         P9X8u1UvOi+0ICTe6NER82u1438EMlat2F/xxT6GP+70JB6jmocpjKaWdcsW+rbP10Mv
         SRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763229610; x=1763834410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXa39g3lX0uLafEymjfro1eQzu9oup1GMo1ewT5+ko0=;
        b=Pj3R44Vfm+u7C4Vo0uRKIOPX+oPYZGqzsk9CGylNfYaSwkdl9Qvp9ipIl8wSv7VbPH
         BztsGuvULHJ+q6vw7Kjt9Tp2Mwaz1Hr9w568A6782JGKg5sDiT+esfeX9RwR90EoN2XW
         9Z8DU0CMKu1rv5J3vTSl2VKe5eVb5e6nON9FtXcdzmRTL1cCm5eDujoCn9wYmsfiAk/d
         05t/dtjz3Ym4ejZVZKyPaHDgoZ41LQR+eLAYM8t68AUdfPonjt2Yp1xlBFItvO4S7qkg
         TSfQ0bm/8pjO4fhi39iO3J1348F+Zs+ol5sIs8cZZhDwMP+QOboNtzwk9WG7nRQ1ler1
         AnPw==
X-Forwarded-Encrypted: i=1; AJvYcCXSLtu+a1zliRoNCk09Ba3Y0881KmtI2M+OYx3iz6VJ03enweGNPlbvRRcU+3yt9sSCmBHoQcjxosM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZh1a4G1bm6w3adLj+g47UlS1TqCQw7gmfx/UsAhEC3v/nRC7
	I4iTTD76/Z47UyjINbLIzEXdwmpTCvUr6hL3tCMVp16kptj8Tqzw3hDaR5iwkWzUSdRsSKUC
X-Gm-Gg: ASbGncsbqWIdD+RGxMBSnNdtLWgTJHIrpM12YhxgAByPYj6T+158toeEyLfPkopzBo1
	ecayx5S00SOYd/zSbRKd6im8S/kGWu6KhiSr3TfVXgl7H4mxsWk7UpMnifnZ+ziB4AUSQucYeTN
	M9rXtZmDGPPCHKmOqw0IZyWjYMEsfqeqC6iW4e2t0OLcZWm+RVdhHr57aNjpfQLb/oloM6SoXnj
	oVnpx5HvJLXBfzprS0zdhUaupAJjKp0Vo1UADsxtpJDOUCro023sF81FyLDzVKHsRt0JU+WI8Q5
	vKupk95cdQ45hQvfVWER2MKl8P370QR4HQe4Md5TBHCJ09yCd9ezJ8Iz6q4b/BGek/KfFWVtcO6
	/cA16ytUvbtgQ0r8z/zHpR1Z9QO4amJtsZNwgIKgTmOblGi9rtQj/GV2Dv+zZKnNz9S8sapW0Mb
	BkMH32YGI=
X-Google-Smtp-Source: AGHT+IG4FNTrXxEatoXT8ZreRor8XQ6Hsv27jGeA7IqF3DhTphHxnwPLXI8stlzorRzzgwWkoU0POw==
X-Received: by 2002:a17:903:1c9:b0:295:2645:9f5 with SMTP id d9443c01a7336-2986a72cb09mr83050645ad.37.1763229610198;
        Sat, 15 Nov 2025 10:00:10 -0800 (PST)
Received: from hsukr3.. ([2405:201:d019:4042:982d:4536:f564:9a92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37731d21dsm7865756a12.34.2025.11.15.10.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:00:09 -0800 (PST)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: shuah@kernel.org,
	david.hunter.linux@gmail.com,
	Sukrut Heroorkar <hsukrut3@gmail.com>
Subject: [PATCH] fbdev/ todo: Remove obsolete line about VGA16fb memory region
Date: Sat, 15 Nov 2025 23:29:54 +0530
Message-ID: <20251115175955.203312-1-hsukrut3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fbdev TODO item  mentions that VGA16fb does not request its memory
region properly. This was fixed by commit 0be42724bf4d ("fbdev: vga16fb:
Request memory region"). Remove the obsolete line.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
 Documentation/gpu/todo.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 9013ced318cb..277b3e495726 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -424,8 +424,7 @@ Go through these drivers and add code to request the memory regions
 that the driver uses. This requires adding calls to request_mem_region(),
 pci_request_region() or similar functions. Use helpers for managed cleanup
 where possible. Problematic areas include hardware that has exclusive ranges
-like VGA. VGA16fb does not request the range as it is expected.
-Drivers are pretty bad at doing this and there used to be conflicts among
+like VGA. Drivers are pretty bad at doing this and there used to be conflicts among
 DRM and fbdev drivers. Still, it's the correct thing to do.
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>
-- 
2.43.0

