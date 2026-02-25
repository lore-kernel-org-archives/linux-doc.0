Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF43B9600
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026212; cv=none; b=ZAuvBcoCKdIXfeDnO2kK2aA2a9fE8nMPi2Uma0dTtBHpnhsxCQhjXp5IiGH51HATLPrGnCHaU8lNsbp1FNJx4AL4ixiQJC+7EuPVxnzwtKm0oLcLLdRRHNUHazqQ8rPAMwdFDj/zku0J6yyGeejWpm03g/1Kr1C4rLlN2elBFKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026212; c=relaxed/simple;
	bh=gHdj8z1Ix9woDAerFqOFuS6Wnzwu2BM1MpTyHSSg5S0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uhU0kMI3562orJe+TKfYcT7GIIPcX6iz4ewxs5HPVgIrzxPFJ7x04EP3JPKEkZGZjPV3+DywoXBJwrbyIvg8uucEONjS6QvFQKB5iPXYxrD4bie1lcFmfzo7JWxbYTzNwCZcfbHfI7/OwVTAhvjh+bAqYwGJFIxMTvT4VuGUk/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnnZaTB3; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnnZaTB3"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824b32875e7so3270667b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 05:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772026209; x=1772631009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhh6QAfKKTjEbE7eB5GmrSEBN9nF3F+rYR9Ew8n6uFE=;
        b=FnnZaTB3/UXs/vnFB2u3buYfxd+0winvk6ZFYAgtoz56sFy+w7PB2dXAwWVKvZ1dZ+
         ugAfzI4C5+d900ZYUiQM4Zkhf7LQpN9Tm0P/gpSXJwoFMSiicarxovP03SEt4h1LsloD
         0Fa3FBC2Wzls5OyRHa7hrGueXAmOvixmcoClOfaNe6nVgYe6ajHRDrdKCF6Vkna3nd26
         sA94g1ivya22/NqSVi8MXVC3DP/oDjjpPh5+tevJwE5ZaRyPGTaolS0fwKRg2a8ABO2S
         Qr0e+EanWhW3ZDz/AV4vS0VGbFhCDRUFUbvgBX1tesHll0Pf4klBxkqTb9P+20V2rgpo
         7LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026209; x=1772631009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhh6QAfKKTjEbE7eB5GmrSEBN9nF3F+rYR9Ew8n6uFE=;
        b=Dv+XlOOMR7rapLDNe5frv8CjUIZ3OaVboeEPAWLTmkZg8l8nAEDDxIdnKaaYlqZ475
         OwUB4mAXSgyi2hsPc48Zr8q5PTFBdFGTas2W5LpYJjgqqXsD9tE1msYMl9cpni87XTsB
         CcYdWPfRwN+fd1JAqxGTrkRwqfK1yiXBKJJ/ab//PCJ3dHD43Cs/KT5Oe/HpBWFYVYhG
         1HC60wyrT7IF31UtpDdy2uh1HRS73/csu1RA1lsyFPWXcsJUQ9tYpk1pMZB0IW63xFUs
         gGecdK+zbVWb9RxrO4YXlCU5W5nwVsE+eE7FqVy3OF2zYdM1jluqsPFC+WMMIDBM31Fk
         6KUQ==
X-Gm-Message-State: AOJu0Yx2gciE+9dRgXtjetgFCxlQgghkxFf4LKytvm3soakvprHcw5hC
	/NwAgt6Hpbh0StoKrtQ1IRVoMM0A+5b1VgECLKMhDupKvr0aIgSM93ig
X-Gm-Gg: ATEYQzwTdXtoaoo4wh6J4RUOzzGaVfJY0keWCUfvSuEju8uS5hLMazxwPcRFlT+VVYY
	kSSljYWC5XMIncYFwVae1ghybjmTZkDAhrxucU1f/GFLMA06L70QhGSpDzuJMSz5fe361FVTMS6
	ogY3TCVx/S2QaaUtdcLHb2DE9qRsMRPTPzMN2CAqwTJIAYUvfG6GIxgb8N0il636LzUCUBZfU6j
	Xr9Yb422CneCZbr7SdqID0blBv8ZDMv370tmo2bXumCf0VTd7K1wS6Cllnoi4I/pl+GwISaAVBu
	tjdR2pTPFm+vun2ko9SNRe1Twb41IQpVbGry79PwtKNyNsn0HOvrEA6UW1GtJ5k0iqb2SpEDKWf
	6DN6F/OwK07Z2o6jPpx/8/YRUZak8l/lEJlpUTP8O+b7YzJfAC4iJN0y+OgoTbcKMEasQwvuZa9
	sH6MTsjNNp6BTsi03JU35faTbtd396Wj34YZ/8785HOxI1zjV7ZlcDues7Mk5RjzQ8FIDSpEAWD
	t+qQ33XyceO
X-Received: by 2002:a05:6a00:4f8f:b0:824:a8f2:7de7 with SMTP id d2e1a72fcca58-826daa8944dmr13646933b3a.60.1772026208953;
        Wed, 25 Feb 2026 05:30:08 -0800 (PST)
Received: from pranav.. ([47.247.29.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd64111csm13697587b3a.6.2026.02.25.05.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:30:08 -0800 (PST)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH v2] docs: kernel-parameters: Fix repeated word in initramfs_options entry
Date: Wed, 25 Feb 2026 18:59:51 +0530
Message-Id: <20260225132951.36624-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the duplicate word 'for' in the initramfs_options description.

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..c3460c920f84 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6733,7 +6733,7 @@ Kernel parameters
 			Default is 'on'.
 
 	initramfs_options= [KNL]
-                        Specify mount options for for the initramfs mount.
+			Specify mount options for the initramfs mount.
 
 	rootfstype=	[KNL] Set root filesystem type
 
-- 
2.34.1

