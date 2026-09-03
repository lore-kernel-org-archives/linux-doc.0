Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A963031352D
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 05:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411864; cv=none; b=SaL1Vv6/neUaTrZnJdKnxkcmaQjYuwcRq2meAiYA/qHwx7Zt4ueUDE62M4fRY+nlSM00XSmgTv/pHsSgAZ4dR9NukmHkgOQk606F4DJz54duma7n4oxT5STd9ftdiWgt2r/W4QJtUWbz88d/vUMJ/k2LFbKIKjW8F15q0UWNOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411864; c=relaxed/simple;
	bh=TxSug8GaIvkXasGJIWsbCDvuwZipb/MbKAObHtXieQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QB4Yeua30StzyT0HYnuw6JVrSbVELiVb+VClh5P8PUepkyyXVJYCj22KkF1PmkK1bcjnDQuDPwqF903/98Kr3oFCWYAwlln2eFJLsOWlwfhNgh5AfWDbU2R1Qvz07jVOJDfsiLMmHoc5DWXaov7qg3VH2ZCVXHGqs1cTloK5yL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o562Uhz6; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o562Uhz6"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-43bf9548df4so1595286fac.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 22:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411861; x=1789016661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzA1LripjTBwtxcTu8BftK9JlapIwYmZXXSesBCbuM=;
        b=o562Uhz6/wqSuwLsp4M6601aalFnVNrtTzI5ffQcSKerHuLmIMvyNpMad3yPAyvABl
         8V36SGw16EWMUY2kQb6VoM6+hl1hQhhalTXOBb5GufEby5mFsIultLUE1ynCoXapgk+U
         PVflQcNpeLL6/nfM2AUe3qzlR/7UFIRLu6FFdt+nC7IXtpGKJ/b/dBWWULEgWSzBm9AZ
         N/DvsMW9aZWYaAzhQseG6Si7pN5TD+mRfcrQHcb6vHpj5/B39bo01WoITXTPgV6UMsgE
         yUN/2zvQCFqxZJRITlmxHy3zQXyCFc3YsAKZqdZ0u/4179qtaqEI9MKO7Hm8PaRtzJWU
         naHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411861; x=1789016661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnzA1LripjTBwtxcTu8BftK9JlapIwYmZXXSesBCbuM=;
        b=WaluuIqUIaBUC8QlwOTGLBFrPx8tOdFUWCS5lupjMsUGXhk+pgCktHrBm+bRCA4DKE
         rbgEbPooUkKNYBXQkCqhuCI8DseN8vlY6hfZ9j8ngDY0FXtCwFm14sbpAnkElfVUP4Tn
         3AWkLAVCKxmTI2DTH4DHZwOaytl3BJK/Rcnds3T0KMEELX12AEIrmn32Gq0EiQxecP8h
         seG+VxDn9jK6tCCB2DoDN+imBu3mCMzM1/pafZtNZL6wpiRTYj8TRG0SHEfUE1O6H9Wp
         MDZ4FePwwl/CmWVMORs0inJBx1VtjncfQQKIwxhXuQ2DyN42QUipEne5eb6hC/q0892o
         h8xw==
X-Gm-Message-State: AFuF++mwS7NqyCPT49oBJlWISQbhA9ysS74hB98KrzeccNcZkZFVVewx
	xLAEjj03hJTwaiV0gaaYb3r63bk6yvM16yX9eNDe+/cDODIpy7rwQKFaiTGt8w==
X-Gm-Gg: AYBFou3ijTII9gWaLoQWm8FYnQiPsXMfOELt+SvaymmOC3qL3stKlshynw4Y6cY+x6q
	fR/SfJBRA946xRmbV0gF6xcYHX8NaUnTyDPug1N5GLjH2dPi8NWmBT1ARI7++If9/IKVOlzScHu
	JtG3YZePt23xldXxVvtdBZkaz7ejNO98cXW98rx3N1+0c3plh+SMPZQAcWqtRrsm6OcR39stgZh
	jGPm6eiNMkfUt02Gvkm+bS/FGkMTPHZ5JxgOhLVKEKw3XePtKhSmh8264E8Tkxumr5LNSKehhi5
	yiPuUfqvSvvS6Rb2Gq2yQH0PyKoTiFqoAEEurRpigOCxQkpxf+nsBJSAJN1BM6iw4rWt1kLVZOk
	EK/z9HngbmxOgkkfaXffHlHeys5MqnmqAWvX/rS5VYyMGzmLgTYhra1Tj6XLxO+ytXrODRPujae
	lsdZxENPDrgM3bb2wf3JP2YBw3xCuSiLgreNjYkOxiFf8Ik0YERh5LA0yCW7rr+TlXqVZFX5T/N
	e+HDTM0wLnm
X-Received: by 2002:a05:6870:31ab:b0:46a:8e29:4a03 with SMTP id 586e51a60fabf-46f8732871dmr8938507fac.13.1788411861435;
        Wed, 02 Sep 2026 22:04:21 -0700 (PDT)
Received: from cachyos-x8664 ([177.245.224.138])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm6394986fac.6.2026.09.02.22.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:04:20 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org
Subject: [PATCH v2] Documentation: arm: nwfpe: update stale document references
Date: Wed,  2 Sep 2026 23:03:44 -0600
Message-ID: <20260903050344.7104-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903025115.43333-1-diegomancera.dev@gmail.com>
References: <20260903025115.43333-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetWinder FPE introduction still refers to README.FPE and TODO,
which were renamed to netwinder-fpe.rst and todo.rst when the
documentation was converted to reStructuredText.

Replace the stale filenames and fix the accompanying grammar.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Changes in v2:
- Use explicit .rst filenames as suggested by Randy Dunlap.

---
 Documentation/arch/arm/nwfpe/nwfpe.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm/nwfpe/nwfpe.rst b/Documentation/arch/arm/nwfpe/nwfpe.rst
index 35cd90dacbff..0136c7260d22 100644
--- a/Documentation/arch/arm/nwfpe/nwfpe.rst
+++ b/Documentation/arch/arm/nwfpe/nwfpe.rst
@@ -33,9 +33,9 @@ double precision and extended double precision formats.  The port of
 SoftFloat to the ARM was done by Phil Blundell, based on an earlier
 port of SoftFloat version 1 by Neil Carson for NetBSD/arm32.
 
-The file README.FPE contains a description of what has been implemented
-so far in the emulator.  The file TODO contains a information on what
-remains to be done, and other ideas for the emulator.
+The netwinder-fpe.rst document contains a description of what has been
+implemented so far in the emulator.  The todo.rst document contains
+information on what remains to be done, and other ideas for the emulator.
 
 Bug reports, comments, suggestions should be directed to me at
 <scottb@netwinder.org>.  General reports of "this program doesn't
-- 
2.55.0
