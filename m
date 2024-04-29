Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF0C2941F
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386515; cv=none; b=qFs+kUN3+FAt96ers6jb5KEKkbCj+PI7aPCdKOOpXS37RZ3lEY2h1LwxeUhVUKcqjTbW84RY7ubjIJ62ltHFdrd5VpW6rxO2Z1TZ+GCXQ95TlscmvIMKrPKRCm0FmDk2hLFBJ+kBPQzUCdmi+FIOfhM0MPuEF7P7wpHfGrbUA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386515; c=relaxed/simple;
	bh=Or7T8y1l9kv6NqO5f0HQFQcSVJmz6JnnFms2xd9rafU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYJs1mW/Gqq+GoTwlBjQ0aDFvxeEaYYQAQzb4u7ksSPCcFJGaFs4ycFezZXXcL5Fx4tzOYmdSpI8w67dO77kpklYBSW4IG7O0kWbBgXBcXVEjgWN3aud08E2VQcNHsCStr4I3xQ4micJUo1n7P4WqOKuxUdpsgsORX+0yZMDKC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JGYCPWp1; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JGYCPWp1"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5724e69780bso4330055a12.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714386512; x=1714991312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqIqBz6Y02C/839EpmWphKSVTMKni6vPtbW42hvmKzg=;
        b=JGYCPWp1sOMfJaPM1kksgeNoqVhW3d39sqByFXKxp9ZEN2h/o4UNJgIuSMeE+V9Go4
         459iyzPWoSNjwmZtjVujUoYbKFAwrGb4EQ53kSqJLdNeR9TCHgDs07E2nnb12pA/DbfE
         jgC/fULkrKeObVJcellvQ4QTJGB1tJOAAlicq/mldZNcNFPhF+7xQ3m5CnKgAAbjb8N4
         FsDi18Yg+KNsKopRh8Lsszt6IiMuaSjvPONO32dKyUMSqn8psmfVsDUjPzX1S0XOS0RB
         QpquJsyNHOdreIcVUXjpB7p7k7rMnKLw8ic9F53LyX4UQt61weaMR+2F/h6A9KE2+quJ
         cubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714386512; x=1714991312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqIqBz6Y02C/839EpmWphKSVTMKni6vPtbW42hvmKzg=;
        b=E8EOzDBS6tQMga7j5NCRtzdXEXKDIYa5jUnAj3bcgFBxSNYfGhyK93TlI/lMz9/F8E
         7uvC1pScpNt0WyAnvSMyBKPkQAOBoFoNHG6kE3DTPApTOVhO5EuPZQJCKo5v0NMwPt65
         XTrYjqHjN0b9Wwpy4XiCHvNRKVRZ93lhelo4h3Vk4sVI1M2I7yrT8vSRLCuFJoUKULdD
         slLSMVa/v5D+GEZbC+dxjfIB5bjAevbZgeGSqcAStwQMgIm5KsicFueOW+ijsIT/uIbo
         mrEDYKwocD0Ffrfd6iDdZJ6f0ba22QI9ncUCNcV1JhHaiSUbhBUM8lpZjAjGfp2slKT+
         /leQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNTrPoAY9B897MMyIScHnwJW5nOKPLuFtx/7B3FIGEasuABkhNrMs8FkSUreoemTJxCQviwXHQlw9OiuxT92NDQs/IlL+ICwSA
X-Gm-Message-State: AOJu0Yyw+kqOy4ZgFVjyT+Ym4PDEHSHpbEXaxLLRkUKrY9u15ACWCc9s
	5i3A2CbEXz/RS6DL3Z3GPD7WALWokYWaGn681iYlPC8EcpxQmQrz3opmW9E7XX8=
X-Google-Smtp-Source: AGHT+IGk7poBJDqxBC8RIuhWEuhiH8SNVgCaNVYIu7mFxCZ/jUnMw1jEU82V7gWgsKAPZAtmNfZW0A==
X-Received: by 2002:a50:c344:0:b0:572:8b30:bef7 with SMTP id q4-20020a50c344000000b005728b30bef7mr118088edb.2.1714386511758;
        Mon, 29 Apr 2024 03:28:31 -0700 (PDT)
Received: from localhost (host-87-1-234-99.retail.telecomitalia.it. [87.1.234.99])
        by smtp.gmail.com with ESMTPSA id x7-20020aa7cd87000000b0057270606829sm2283249edv.85.2024.04.29.03.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 03:28:31 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3] arm64: Add the arm64.no32bit_el0 command line option
Date: Mon, 29 Apr 2024 12:28:33 +0200
Message-ID: <20240429102833.6426-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introducing the field 'el0' to the idreg-override for register
ID_AA64PFR0_EL1. This field is also aliased to the new kernel
command line option 'arm64.no32bit_el0' as a more recognizable
and mnemonic name to disable the execution of 32 bit userspace
applications (i.e. avoid Aarch32 execution state in EL0) from
kernel command line.

Changes in V3:
- idreg-override.c has been moved to arch/arm64/kernel/pi/
directory, so this patch revision adjust for that change.

Link: https://lore.kernel.org/all/20240207105847.7739-1-andrea.porta@suse.com/
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index bb884c14b2f6..3e70963599df 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -431,6 +431,9 @@
 	arcrimi=	[HW,NET] ARCnet - "RIM I" (entirely mem-mapped) cards
 			Format: <io>,<irq>,<nodeID>
 
+	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
+			32 bit applications.
+
 	arm64.nobti	[ARM64] Unconditionally disable Branch Target
 			Identification support
 
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index aad399796e81..48c1aa456af9 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -108,6 +108,7 @@ static const struct ftr_set_desc pfr0 __prel64_initconst = {
 	.override	= &id_aa64pfr0_override,
 	.fields		= {
 	        FIELD("sve", ID_AA64PFR0_EL1_SVE_SHIFT, pfr0_sve_filter),
+		FIELD("el0", ID_AA64PFR0_EL1_EL0_SHIFT, NULL),
 		{}
 	},
 };
@@ -223,6 +224,7 @@ static const struct {
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
+	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
 };
 
 static int __init parse_hexdigit(const char *p, u64 *v)
-- 
2.35.3

