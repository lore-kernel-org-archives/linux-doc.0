Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD879241688
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937002; cv=none; b=gQo3YsXImpEnSIpU5QkO8NV0InwVvpRY1TnaE3R6MLOr1yhvbMuIIk5vb3IXCzCzUjvWcqYMofsIKbZPWFDARIifpko3d0Ew4QX0K/UPYI+0eZ3M/+5uE3zVPGxvbOtVqdAPcaObVJtPBCDKgWYGOaAk1txHQtfZouNAOSnFaig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937002; c=relaxed/simple;
	bh=dhtXRlaYMv9+3vcb06NZHC06q7d9tWaiXXCjLtWYr30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RS0BFPX4ipEduM8ER7fGtMYDSJYAu9hkx1DArbFqytJ4XAeuohmA/d8B1WYRyadI/Cb1dP8nT2n28M/x1uXKSuyFpWdMUJMvD8mSGvy52wehi6iwYsj9c8Wdf1ts4Ln9nbjYqmR3DhNqCO75JnyUbmvg+8zVn4F7FGNpWZDcHLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f+kdmbf/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f+kdmbf/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166360285dso115564695ad.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 02:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736937000; x=1737541800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wla9sc5fcu+bqbR8lfrtmNCFTk5H4wEvmZAOtzLNAVk=;
        b=f+kdmbf/ZnqKXrWvtRRtMc3FOOLcVfvcFx+LykE+3ZRaIPoFYlfDbJuVrHfneqI2Ek
         5pfwYJQdn6550ilc9Hnbhb9V4VpxsL7m7z64kRZBvtIoZqDr9Ug9Plt/p5PTKOgdetMH
         ss1bOskwL6eRUNV/bwrcEdS7eVZR9miiUvhuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937000; x=1737541800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wla9sc5fcu+bqbR8lfrtmNCFTk5H4wEvmZAOtzLNAVk=;
        b=cfFm1BhNRDD5aTjJW0Ubpqjih8oyqgXxabtOwCaS30vl0Khw+0GmaB+GBj1xWtUYNh
         GcFiKUmUqU7bexoQiY/c39MBXuBZqXf0n6CJn0scbRK7rTrwoyuGNTkQQk8ASy/nOGt4
         buXQV/cF0PV+YrXZMKZIdkIsXCCG35MTEiu1z/MRJn5lfdT4BWts/e71EirQvMRRWEDt
         Q4P4I812RwbyTTzB0MxEWOigK+vZf+6U+RarmOqPaelF5EdCKngNE0Scs90L7D6w4nbq
         6NjKJvQifgQsSqV+4XmjVA5r+IYtx/Gl+nOPncbNTr02yGW7Jcg/T861L6FTENY65TZX
         vn+A==
X-Forwarded-Encrypted: i=1; AJvYcCV/ppdNiTu5TfIvWkb4ywdLkdnMSmD1lOYwXekKkIEkr0vv3hLdHTpCRP1BoiyiOS4pufXKiyjFsoI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9UTohrE4lB5oqAtpRCBuTQj6xo62BPDCwrkgl/nZqE5dFwQ3
	FIyuwASzoBoIq7OKTpWAlY6iRyBLgtwXmofCtJBpPEgFYZop1DDLstTZviWDIQ==
X-Gm-Gg: ASbGncuyk54RuLSGic4RKGxN0J4k32kcoZh4+t8KfV++I7j7VTJGJWS3WxD9Kog17jc
	6PjtDjvG9hUByLukPlz28WoAq4giVb7sf7Kr36dKbnz/zFYMretDzthiJ6iVa134Z2UBExnP/rX
	iOWbQaE21JM04D3A9q86wtFUAXtLS5V7LNnD0m5r2mwMJpotWbuGlsWSqkQy9OI6yGNmINJlOW7
	r3Z6+1d+9zHiS4b6gqMWKtDicIFD69cKSGbhRZ5LlEq36xmGBfvHs58IkwrJH6KnTrrfTmFW+Hz
	J7mR1gtG5QwZCG6qEy9ycACdvt1g6VF8QA11iNQ8c+d7rQ==
X-Google-Smtp-Source: AGHT+IFELcOP89VvVTz21l4LIeLc6IKyzpVksH7aQGXYFzhWweTpfk1zJ3wHzBSftRMK/m7yogYrtA==
X-Received: by 2002:a05:6a20:3d8b:b0:1d9:18af:d150 with SMTP id adf61e73a8af0-1e88d114f9bmr45237308637.21.1736937000050;
        Wed, 15 Jan 2025 02:30:00 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (134.90.125.34.bc.googleusercontent.com. [34.125.90.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067e591sm8835195b3a.126.2025.01.15.02.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:29:59 -0800 (PST)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH v13 1/3] tools: ynl-gen: add trampolines for sock-priv
Date: Wed, 15 Jan 2025 02:29:48 -0800
Message-ID: <20250115102950.563615-2-dualli@chromium.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
In-Reply-To: <20250115102950.563615-1-dualli@chromium.org>
References: <20250115102950.563615-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

This fixes the CFI failure at genl-sk_priv_get().

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Li Li <dualli@google.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index d3a7dfbcf929..9852ba6fd9c3 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -2411,6 +2411,15 @@ def print_kernel_family_struct_src(family, cw):
     if not kernel_can_gen_family_struct(family):
         return
 
+    if 'sock-priv' in family.kernel_family:
+        # Generate "trampolines" to make CFI happy
+        cw.write_func("static void", f"__{family.c_name}_nl_sock_priv_init",
+                      [f"{family.c_name}_nl_sock_priv_init(priv);"], ["void *priv"])
+        cw.nl()
+        cw.write_func("static void", f"__{family.c_name}_nl_sock_priv_destroy",
+                      [f"{family.c_name}_nl_sock_priv_destroy(priv);"], ["void *priv"])
+        cw.nl()
+
     cw.block_start(f"struct genl_family {family.ident_name}_nl_family __ro_after_init =")
     cw.p('.name\t\t= ' + family.fam_key + ',')
     cw.p('.version\t= ' + family.ver_key + ',')
@@ -2428,9 +2437,8 @@ def print_kernel_family_struct_src(family, cw):
         cw.p(f'.n_mcgrps\t= ARRAY_SIZE({family.c_name}_nl_mcgrps),')
     if 'sock-priv' in family.kernel_family:
         cw.p(f'.sock_priv_size\t= sizeof({family.kernel_family["sock-priv"]}),')
-        # Force cast here, actual helpers take pointer to the real type.
-        cw.p(f'.sock_priv_init\t= (void *){family.c_name}_nl_sock_priv_init,')
-        cw.p(f'.sock_priv_destroy = (void *){family.c_name}_nl_sock_priv_destroy,')
+        cw.p(f'.sock_priv_init\t= __{family.c_name}_nl_sock_priv_init,')
+        cw.p(f'.sock_priv_destroy = __{family.c_name}_nl_sock_priv_destroy,')
     cw.block_end(';')
 
 
-- 
2.48.0.rc2.279.g1de40edade-goog

