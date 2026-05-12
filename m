Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585838E8DE
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592693; cv=none; b=RYG6eD9TFIsDMOv2NKz6FadykUycZ1UEGT0dcoet6achzqGGxqc+k8WzSd8vfrv/1hK/TXsK/nKA37sLehFNPuDOyh9mwhbBlbVz3Ex5Ba6Ee1X3eeitd51gRi8nBIj23ylw/mMuYpMzLUtKf2tLgdU+m/KZT0rf+2M5rAb99o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592693; c=relaxed/simple;
	bh=R45r9yU7MMX7pT+++mCU8H39a39mlzYwFvuPyP+hqQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBNTznpmFrvbTR8xb//cZSlU0jCoPR8Q9uH3R69cCP8Xz2fpy0V4DwcnGSWgeigsD7aYIM7You2bJk/B1Q7HTOFNzq6qWFktRPApH0X3QJzyknFjTDspQmAor0BiztubBBzEGYkh4K6AQsM/mgQlHV2Vbf4IOxC02iEIT3AJiZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V78pH50R; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V78pH50R"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bab82d75fdso30313125ad.2
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592691; x=1779197491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDYkhHfQmXQhrZX6ApB+iupAaO7l8zpahGGh7xZwSNQ=;
        b=V78pH50R1sM1uE0bPuqXiOmAzERQZq5XSzRjG5OI8SH/nhpM2aSgyNzMoL0/3nYwzL
         KAZraVLizlUAEbxVYf0fSGdiPbnM7B9R7qqQDyCfRx1o5H+Pf98at0LvKhsxRniJ9wVB
         VlACJJ1iBLpatNMrsmMCy90Jag78SwTEpmkdgTCXMyf7/ruei4PPiJUl8DAs3GXT2fJ/
         8IaQb8xK1eRVrrEJIqeihCvLJ1tZPs37PktGSy+PFweWe04TZefzr2ylc1CZ7YuBzRL0
         yi/o7he43lQyWQvI2FIYKckhgzxicPjLcwIV+W/QnmxbNAQqkd4TQxVHWiBMnT1hMJc3
         iwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592691; x=1779197491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDYkhHfQmXQhrZX6ApB+iupAaO7l8zpahGGh7xZwSNQ=;
        b=TeVeDTVJYr5w5amaval7YGuiIZp6kikBXRI12yUzOiwzFZILeV3bb5ZKrp7XBxe8v9
         puQKkXXGCHTQTjQwjEMJxWDUYRSrsl1TQqNdNJA5FKbn1E3SstzOpbdM07MbXC++WVfV
         W9bBl4tAGsgfpS/X+sRyKK51BgK3CyzEpOQXPHPo3Pvu3Q8Qet3gVQbGOsst2kZE2Haj
         R3u6cnQJzjZBInHr1IGHtRYZCrZjDC5Irjvtzqv+d7Bx8m4BOB6g3BhIO2xE9bVbs9g8
         FgAuizt0ybWtJD7/pKOJzCr979N9uXgeikrgXDdZvQDiEGjwzFc/fF94HAtEEaf9pr0g
         LTyw==
X-Forwarded-Encrypted: i=1; AFNElJ8vIyHBw7T7kir+T+VRcd8YPdQu8QXsnLmMMWPItOYuRFOPdwHhejw/Yj2DEVAPcA7pGbu0SskPa0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz86hWamqVoGnlTNnnsfl88vasH+Q02NPxAm1gp6pq+TV3d4HyM
	3ES0MBstF26GFVY4FpZ9idfwbCJlqWsL9yrNq0Q9OB0nbveplYAIwIxd
X-Gm-Gg: Acq92OGSMQYgD7ry6YMqxBtEwZiEPYuCHs+LInwcFe5voce7LtDG0YXdXh8+bsGLBuV
	4VGaqmd+Mpr0SN94J+Vbkkhu2tuGgiCfTh8rrrSZ5I2uZfmHLCA7tTedLr9wZNnUN5OG2ky0sdA
	+2VdZOQsXSbJYtAJi+R95v4TyirQnNz7to3BrErCcMOA9C7F+qTJccWDI2DQtfgZTdpMlODBdTZ
	hXLMuMPexzv98oWC+P6fgvam0Xus/+ceM+hEcjWlb9hA7g8u16QlKQeP4gz9hwiqUn2o0xYdonF
	zLB+P9LAKOgs9KYoDJV80kpqwK4nDZ/digZSfpJrJBT09h3/7rwVjayQNfCV3nwVQcX+Czcuk1z
	v+RMfh8lK5ClXe4r13pNbzSPAjEBp2eRWR7+yeO/KEGbFw8T+44e+4vBoVp9a63LsAoP7C1N6iG
	G71CEvQXbtirRUVrtgIBGLdlhm7YZWeQI0tXA4OCBGLjN3s4upN8rNyXCr+18QrQ==
X-Received: by 2002:a17:903:1ac3:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd07caea66mr26778545ad.29.1778592691438;
        Tue, 12 May 2026 06:31:31 -0700 (PDT)
Received: from r912.lan.4v1.in ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2700dsm139967095ad.2.2026.05.12.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:31:30 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] Documentation: networking: ip-sysctl: fix typo in tcp_ecn_option
Date: Tue, 12 May 2026 19:01:25 +0530
Message-ID: <20260512133125.1772658-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"regarless" should be "regardless".

Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
---
 Documentation/networking/ip-sysctl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 2e3a746fcc6d..4c6a35d07a08 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -489,7 +489,7 @@ tcp_ecn - INTEGER
 tcp_ecn_option - INTEGER
 	Control Accurate ECN (AccECN) option sending when AccECN has been
 	successfully negotiated during handshake. Send logic inhibits
-	sending AccECN options regarless of this setting when no AccECN
+	sending AccECN options regardless of this setting when no AccECN
 	option has been seen for the reverse direction.
 
 	Possible values are:
-- 
2.54.0

