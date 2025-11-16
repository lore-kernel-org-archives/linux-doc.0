Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40084207A
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763304799; cv=none; b=tyGuEfsQ9EsKYDxTriLGMLDjOs22d7lOYeMQezsBJWT3yCvsYfDqkC364gdrGvHfC9iDB/lKMFbPr9aXLsJzQvy09irKjb5wSIqDsJDB8a4EdrdDsm2NPDcrVyEeXJ2xfwRh0MsoRvsn9zehMbCZi64Qeoizi14/TabZvLix3Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763304799; c=relaxed/simple;
	bh=0AW8S5qFROQZUAOynGCUO2r4Z3PpT9+FfiBPsbbKZZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KnY3X+ZUNEBo551D9I/XShvyQiEC4pfbMYFQUYB8i8MygeiVzoD2B03bGlJR5CrOw6W8vVGA+a8fEsfbC0c32JpccQg2HJm9zMLKm4zpZmU4K4JCoa0nI9rPGcbmBGDucK6z7FUbv+Utn8HTIGFoWv3NgN7Sak0WKQyi+Hdovcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOIvKQG5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOIvKQG5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34374febdefso3625692a91.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763304797; x=1763909597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzQbj6sIVzYVIzGBKc5nizFuf/mCVeM8J0t7zES7FqQ=;
        b=UOIvKQG5T7CuVS0Xh9ys1nqF7s/ZY9tWNrVFafAhFjd06OsqODOQhrbZWnIkUE7n0J
         W/Vls4EQn1USbLF4Q7lpomY/tlc3VzXOvdkKdUDzS5Rycg/6FbLLC32s4ozGTTRvT7EF
         sxa01RuAOojM0AthMJH2YvARpCIFEY03H+uTdxgUa97DiRwL2En6V5gqBG9fqNHAuP4D
         pnsAGTVi+kZnnCzmnSh/WxfkC1ac/OS7tWgYVX5g/DBYiqtZrEU+W/eZc8iQOvQYyfIl
         ZuzHakM6MoPMoMhAT+aQ8bi0AbNDBC1ivCztJMrOjrUfTY2l5WwQQ6l12gtCp6VlzJ7S
         FKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763304797; x=1763909597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzQbj6sIVzYVIzGBKc5nizFuf/mCVeM8J0t7zES7FqQ=;
        b=au3nvLuW12uk+OMnIvHXj8CgDi072VAL2qvYnTdi+RHWaXLQjfjtDEHMSLgbxpxLQl
         SA3OfnfHF10j4D6kj9Y0oe5WRS2pcq0LZLGaO9AzFmMScWUxjsIfLTgOWvea2IFwjSd8
         qzVulV/YBsL/RuofxVA3bNFil9fT0YK3WMzSV7uwb95cJcoYznRje5366Ul2o5K840yN
         /wTjcsRAlt4n0t1z/U/scoDfcL114/EeCXmOvUmCVbxSTrNuPPnkxRIe7ysdHlAjLIrk
         aoHHON/jzz4vwT/hE6axrwIy9F/sdORy9K75e3E/qPbDuA2Yh9donZ1xO3zb2denf0is
         VJ4Q==
X-Gm-Message-State: AOJu0YxJ7H8s74V6aZ1Urex0AZvI2aCeDo4zHs7OMdF23Q1pnV4GvGKJ
	cvaqYrzw8qlQcO4vqIc2Wckd+8hpG8KajvdXDBcOrc6IGJVHelnYMN93
X-Gm-Gg: ASbGncsREFaUbvke9q8ojgKy+hSdE/zzaIV18iaSheGPXQ6AHr7sGwODoXnwUFq52Xw
	Nv2BNGiOnyIAFTAo0SpSFEA5YkDgQZYDUAxXAC186KeTBstHXBPVKeHsTOeq6v/AnGD6GX3Rq0W
	AYEcCcHfvFB/4TK8xksUZEZq+6Xh3oMdLdrGQlNlLR6jkk28iSJD1L+1AEoCmZvFcoat/ImdV8c
	tITQyxK/Qrw0jKXsutvplXLbzKWpswkyegPEJqTGeyfsv5kNwFO1r42Qu4S2SAb043sjoPlbVOK
	AWFIR4ivN70vtbUcRsQmCWB0Q1scEacyEI7UQb4sUSdKUBFNK1ggvadVtnoh9O01BQap4z4Xcpw
	ndcEVUSRzi27+yzEEy4puuDKsBBQ7forefYC+MNuvgwCHJcnO+ptL0vCTIG1hc/oqV0zPnaARzP
	URkD3LhLFokUJeO8aKBdUJMX8M+B1XY6IqpPs=
X-Google-Smtp-Source: AGHT+IFe5QgESx/F19/pFQ6mXRk/f1tp5vXZHZDwx+NNTjGl4DJxM9Mc9z7SxENMidr5mfQxZIVTFw==
X-Received: by 2002:a17:90b:3a45:b0:341:2141:d809 with SMTP id 98e67ed59e1d1-343fa74b235mr10914824a91.26.1763304797053;
        Sun, 16 Nov 2025 06:53:17 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ea711edesm4963575a91.5.2025.11.16.06.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 06:53:16 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: corbet@lwn.net,
	akpm@linux-foundation.org,
	bp@alien8.de,
	peterz@infradead.org,
	mingo@kernel.org,
	pmladek@suse.com,
	paulmck@kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	feng.tang@linux.alibaba.com,
	kees@kernel.org,
	arnd@arndb.de,
	fvdl@google.com,
	lirongqing@baidu.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	alexandre.chartre@oracle.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH] Documentation/kernel-parameters: fix typo in retbleed= kernel parameter description
Date: Sun, 16 Nov 2025 22:53:02 +0800
Message-ID: <20251116145302.3681-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a typo in the retbleed= parameter description, changing
"migitation" to "mitigation".

Fixes: 7fbf47c7ce50 ("x86/bugs: Add AMD retbleed= boot parameter")

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7e8af24c410a..a857e42d1d48 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6420,7 +6420,7 @@
 			that don't.
 
 			off          - no mitigation
-			auto         - automatically select a migitation
+			auto         - automatically select a mitigation
 			auto,nosmt   - automatically select a mitigation,
 				       disabling SMT if necessary for
 				       the full mitigation (only on Zen1
-- 
2.51.0

