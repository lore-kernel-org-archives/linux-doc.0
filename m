Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC9229A0
	for <linux-doc@vger.kernel.org>; Mon,  6 Jan 2025 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736143376; cv=none; b=X8PqV3u2AuCzX1HbjtdpUFf007quna3MSF0UHG1zJNWxJBdXGZXPnnpBIiUv/Laincc6WEf7dqiTLo+/56f9BPpe4pT/lAZ94jLnjH2KnOSl7qViUIn8M2GbL5l/qGEotT4LZy10ZJD6lOf31F0OvggH+hnXAJwUoBSRq1YfUGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736143376; c=relaxed/simple;
	bh=TiQFKobWq7mCkU+a6ihAY8oDaUFZfA4F++bcXrA84cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+FAR1ppDC16wkRm4ZklpcbqjEN3mZMWOgar96ra/YfL4Scnqr5REqpChzXAEqo16MbDbZ0TQG8LbIST7QYioJ2+rxcxhLKA96PfNPjkqIGYdxkq48WdoNivEur6DsS0V+8a8EkCONJexLuJXQjbwxmXyX6oxtWWHw/lpht7ioU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Us95MoJt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Us95MoJt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21661be2c2dso181035855ad.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jan 2025 22:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736143374; x=1736748174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXgHKeSyhVdfqRWIb+uzSgRHHoVMew1Eah1o2GAAvD0=;
        b=Us95MoJtlWggY0mr4PcSovcdkVQG4C5P6gX60YsePucmPKUfoUYH/PtaicE+Rc52Pt
         t9Vf3RAkZZbX+ixre4wddWqwBtOHHZtTAqzDhExoHMxH9d0ur/a9bCePn2yxh7PcF8vF
         yl0LxXPo8yLHM6Rd3Okm+gubi+ET2WRumI+RFsaKUfbOdlJPgrVMXnfI8mkvCEmscoQJ
         KHsS9vT4Q49ZZ3ksGKBTTTrE36dveRemdrfWN27ka6Kl9qN8b5rVQ+e04I4iwV64afnn
         NN9eO9dNWyZjd4/mpsCZ21yH/NRlGAlxPhPTcXZ+5woMhe2XcTKLoQCWY1dJDH+zz9Vp
         7NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736143374; x=1736748174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXgHKeSyhVdfqRWIb+uzSgRHHoVMew1Eah1o2GAAvD0=;
        b=CRVwt+Kv7iMpRLat0Nhs4IdxEh2uUbpq5xvPugGFyn0N6Q3bH/IVNEXKJ+pu0NatAE
         3AdNFS/ou6D7JpWr0bWdU6PSz47s4KDl7KWznFz1Yk0/K7OakxpKRKqcoXHV96IMcqKl
         myX4XFj0PW6zHVTlXzPe1IsceUsChtRl+BXS04VOoT20bkadww9dqV2FYxvngNVD3pXv
         OBnd6ktwLPjQQw8L1skeq2RvqRkIHLMiwBLIQzhT8PFDUskeB4IFnhEacTYgQhQuGoGi
         qZSy9fu2EX1eNrna50MR44q0HT2uqGMsoddHPOXESALViSO3TXcwEhcuC+9WpPb+KxIq
         D5aA==
X-Gm-Message-State: AOJu0Yyqa+onficYH9OkdTEXBp42m7peYcUH2GBU2C7Mg+PFNGDvpycM
	lD2T6Qe8pGxFpf3AZHj6avvZjIwWC5TBTbVoYtTHFeb9FbX5IIKwX/zJmwj2kTakrg==
X-Gm-Gg: ASbGncv+KwBvYxQY079lMkhYcZwSt3Z3A9yrLx9ds/6jhUI0ol8S6k418kcDQQTT5G2
	djv343anDve0lARmL6UQm81P4/KgomBlWrtpdU45JlCgPNqKP/5+OBNG2FXIeeMD3zfLta4yZ7W
	jA4gR40srmTJo+MwkcKF8CSQAWd+HAEEXAUCZyMo0RfxpSqEt5MJS2QFVhogTgj1+ft/BhNeh19
	8Hxc2uIoEXLtVcFxQIrqtn1DPaCPsxYc5vSdceenSTOdyCZFWERZme+PJlj
X-Google-Smtp-Source: AGHT+IFEDnTaBmC4U6Tjutdwo9k6AdjUVnBJT7Q5wUQEQ5/McsWkv0v3KU7JfpKd961/QlC05cmayQ==
X-Received: by 2002:a17:903:94e:b0:212:68e2:6c81 with SMTP id d9443c01a7336-219e6ea0223mr916519115ad.24.1736143373795;
        Sun, 05 Jan 2025 22:02:53 -0800 (PST)
Received: from VM-0-10-ubuntu.. ([43.154.209.214])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02888sm285324495ad.261.2025.01.05.22.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 22:02:53 -0800 (PST)
From: fillorkill <cateful@gmail.com>
To: linux-doc@vger.kernel.org
Cc: trivial@kernel.org,
	fillorkill <cateful@gmail.com>
Subject: [PATCH] docs: bootconfig: Fix typo in admin-guide documentation
Date: Mon,  6 Jan 2025 14:02:37 +0800
Message-ID: <20250106060237.470838-1-cateful@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a wording error in the bootconfig admin-guide documentation.

Signed-off-by: fillorkill <cateful@gmail.com>
---
 Documentation/admin-guide/bootconfig.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index 91339efdcb54..7a86042c9b6d 100644
--- a/Documentation/admin-guide/bootconfig.rst
+++ b/Documentation/admin-guide/bootconfig.rst
@@ -265,7 +265,7 @@ The final kernel cmdline will be the following::
 Config File Limitation
 ======================
 
-Currently the maximum config size size is 32KB and the total key-words (not
+Currently the maximum config size is 32KB and the total key-words (not
 key-value entries) must be under 1024 nodes.
 Note: this is not the number of entries but nodes, an entry must consume
 more than 2 nodes (a key-word and a value). So theoretically, it will be
-- 
2.43.0

