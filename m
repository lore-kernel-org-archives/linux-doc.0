Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71739526F
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337062; cv=none; b=izaj607/JY7nMOYVbN9AusvOcVJg/0+/LYeAv//+ZnDpzrqInyaGcO5ebiRXqwd0sIHVfXrr+dB/dfmGEivPvL/TG8yEmj0idh2Q01DxQgq4III2YplBSrd0oVwk1tNLWpTE5Od2sw4+5XX/F3X+0duYXl8KQaB1m9w9sFWxWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337062; c=relaxed/simple;
	bh=dx2JxeV7vQvitEulWp7fWkUxzfdkpHiEsS/seVIJvJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCurO91UDkipZv9+QWPKZQNggA/jXsYF3n6lA5XPKBFVO8bVcQNsdq+CBM+3Sk3dxpDf+BbTNPHQAI5mkmHD4KPQC0jGgH3p62XM2RAic/UQUp+WnZkca8NVMDhEYMulUcg+ovreU/nADmI8HetknMF8dkXMgmwGWr815kR2s30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foTtg+P8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foTtg+P8"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1771031f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778337059; x=1778941859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dPtx1yevnqJHAzxs2NE10Y367hCs7udQ6wgTVshHCU=;
        b=foTtg+P8VA09gOtNzTluvnjMluY2is9v7ICczA4ibGT10SI2Yx4PdGl6OPqEVG6D/r
         wNdBw647JyHbIoZ8KwpoGyxCBBBKVS3gDtiltE0a/KjKIhIfBEvac7cDpxLxh8l9L6E3
         rtVhX2QqLWXGH+k8jayfcOOD9xhDDnH6V2DrAaPOBQsm00nJGpUX4TNOJFi2VugL2bMu
         gNaq3/HzrgP1BsYb1kc/x4ok+tPfs9EgkPdPhyJpf9cB4BNidRG2uMCbbIuqx51zloqL
         PvDkcKpuxMMnU8ejtkjVZqJylWGHZhCVnLFEh/tT/sLRG1lfp26AGSBUizfuPvAU3dIX
         VDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778337059; x=1778941859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4dPtx1yevnqJHAzxs2NE10Y367hCs7udQ6wgTVshHCU=;
        b=KZUBY1I+Fn90biMuEP+pmfwAFChRscxTXuUkUDq7762+LMxNNK+v0u9tVCI7TBhP2p
         znKnoSAfa4icJLAMRYMN0ylFaoNGeHHgU73Az2/bnKK6uEIgHHXHy05DvgWXoxdKy+tF
         H8ia3aexv4hy5Y6lFig+qimTJx7bfxa0Hgz+Tq69/OCIaO9uUb5Q6TEaK9lkAMAJ3Dgw
         2C+9OxumfDr5dZHnkwsZMTJUO0caSxzkpmxjX3XNjk7Ex3uOFAq+QV8azVNpJGi5cVCn
         3W8B2o500OkOT/EUtEXlJLkNxRljwtwdrY1p1lMgJfEPbJ5558hrsv2dR6+8K5icdcLI
         U3wg==
X-Forwarded-Encrypted: i=1; AFNElJ8xRmBlGS49q7YBvTC6aAOsh8w25yEb6T3mYfAWzTqF6+JEk6FYqaixbC/GDH/wMQV892nap2GkXSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBO/lSOqXiRrDXYh0mgSv3kQXnOXf2wHRXA/VdMK13QuG8p/4N
	yP2AXJwdFuwsD74itTNc2WeFiBDJFPMz2BgenuMEN8Hxv56TeZrnz4L03AWwtpOE
X-Gm-Gg: Acq92OFjtOwT8em1M4bARmmSENgl//1NyXP46e3YPkXiJU1UUEEW9rKYxiJupfs/yuD
	wLBAj9uxuin9UTCavHtXjidtuWs2DFVfUceePi9/kpzRFFZniZRuAxg9HPhtuNjc70ORQ6yvMH/
	Fg9IS3O0acCN+ptSRNtsi4NQwHZnlo9KjS6i6uN3uE0SxOb5n0f0jyydjzBGhCsrZjnZeViir3A
	JJSQ7hYDvIDcOfI0z/eaYic0J360iAMXiUKzkPDmIOz3QZu1vbJW079jnEBhUXAbIJW2O5M0DdW
	X/ZH8QBmd37SmRantuWc51fMGhvnKkslkfWMmTVPvbRzeiavsjBy47496g4WTqJVCDpK8XrMMmJ
	OPlS2imkJ7eWtphu2FefVW5xXJHlOUgdMvlJxMVsqLwKoSejf5gkQpB12e1pTmHRRePoMXaBFW4
	zaJsNwh7FALi2Vbk1T34un6GEq4BiJXytxSz1ma1B/TFA1rmArRBxQH+MG/QI5SK1WD51Yyysqa
	gmCGA==
X-Received: by 2002:a05:6000:18a6:b0:43d:761d:5423 with SMTP id ffacd0b85a97d-4515ad767eamr29737566f8f.16.1778337058971;
        Sat, 09 May 2026 07:30:58 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm11902201f8f.2.2026.05.09.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:30:58 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH v2 3/4] docs: fix repeated word 'as' in dax-hv-api documentation
Date: Sat,  9 May 2026 16:30:57 +0200
Message-ID: <20260509143057.16512-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508163802.16249-1-reynard.adrien.08@gmail.com>
References: <20260508163802.16249-1-reynard.adrien.08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove duplicated word 'as' found in three places in
arch/sparc/oradax/dax-hv-api.txt.

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/arch/sparc/oradax/dax-hv-api.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/sparc/oradax/dax-hv-api.txt b/Documentation/arch/sparc/oradax/dax-hv-api.txt
index ef1a4c2bf08b..6dac2a778ccd 100644
--- a/Documentation/arch/sparc/oradax/dax-hv-api.txt
+++ b/Documentation/arch/sparc/oradax/dax-hv-api.txt
@@ -485,7 +485,7 @@ Offset   Size   Field Description
                              the virtual machine to use when accessing this data stream
                              (checking is only guaranteed to be performed when using API
                              version 1.1 and later). If using a virtual address, this field will
-                             be used as as primary input address bits [59:56].
+                             be used as the primary input address bits [59:56].
                 [55:0]       Primary input address bits [55:0]. Address type is determined
                              by CCB header.
 24       8      Data Access Control
@@ -576,7 +576,7 @@ Offset   Size   Field Description
                                                      the virtual machine to use when accessing this data stream
                                                      (checking is only guaranteed to be performed when using API
                                                      version 1.1 and later). If using a virtual address, this field will
-                                                     be used as as symbol table address bits [59:56].
+                                                     be used as symbol table address bits [59:56].
                                         [55:4]       Symbol table address bits [55:4]. Address type is determined
                                                      by CCB header.
                                         [3:0]        Symbol table version
@@ -815,7 +815,7 @@ Offset   Size   Field Description
                              the virtual machine to use when accessing this data stream
                              (checking is only guaranteed to be performed when using API
                              version 1.1 and later). If using a virtual address, this field will
-                             be used as as bit table address bits [59:56]
+                             be used as bit table address bits [59:56]
                 [55:4]       Bit table address bits [55:4]. Address type is determined by
                              CCB header. Address must be 64-byte aligned (CCB version
                              0) or 16-byte aligned (CCB version 1).
-- 
2.54.0

