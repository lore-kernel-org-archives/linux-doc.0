Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197A448BAB
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772381; cv=none; b=LgsCc+tyMrotXh6+OFQGx6N5QmpBouxbP1L+gc6psA0SLJoyXfnHJHKW+pCxfp//a+BnDM1IgFEV9/Grecy/5zG7pMClRAukBLUczQiMSLF/snRD6qdOYbAOY0BTDgdc6BneebDXawtHf/1lZ/PlZ2AhYJ5vX80mxhEM/1y2Vyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772381; c=relaxed/simple;
	bh=XvQtuQBIqVT6YauqvGvh+z0ZvixSJt29gwUp76mkmj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5yEnlvBvYCfitOuqmslYXVK064IKtTe0E4vHH33Tr81KxG+Ih+T4uabH+ZIPh6EFNmN9rsQ4ARjni/TzKHNQ1qtDsx2l5deDczE+t4T8PKLr9KCQ36V8i96lwR5Fbf8Cffw0MlwTpL4PHSEPqFkVnXhrNE/Arki+jUtRHvY62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmF6k/vw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmF6k/vw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d7195706f1so35424875ad.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772374; x=1789377174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5ZUfqeYp04pNo/Q4XLiHt5Wl2L6OXnuVp96rMiPgCo=;
        b=kmF6k/vwoDR7LBBiWcv+japgU49apLNUr89hHvy/5Zg0uytvAN3nZBQOYIE5lSVgmA
         3YzZJprzyM/+TWJJ6iFGMPcm9QpckatxT2Tu10JyRPtETmLsel/+P074icuTSOcV1n2N
         rjz8+oAWUdAHQ4ZuK7M9WhQDuUvhldiOX1MAQZxMgrz0grhH/L0Zk1ds1GqmWWjkXBvg
         RQvJZUCelLrvKKYKtTCjTKQ/acOtV+GafIbmQnJv1+T0cHDzW66g0V7LlcZqfRJXYMi6
         EaxQmnaABoo4JouIfwqch3XmJToa2mPTJeV+PuB5zHJNTe8LedQq09OozUZTlw0vgD3A
         L8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772374; x=1789377174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5ZUfqeYp04pNo/Q4XLiHt5Wl2L6OXnuVp96rMiPgCo=;
        b=aUI1zPsswAfYmGPGFhXt818U595qzv7M10JsPAZ3QkO/S8uLSix2ylwstDK9ipzcf3
         N+SEs3npS+vRQlSjRIGWXDxL+/dFfoAaDfCd7MmENKhjBvkq0dcpRf5F83KhTgShVszo
         rrJixBmHKQDz9m3D9TbjbuS0S1DGtz2ZtN0SmumlEVb7C6AR97BvE56nsT+h/8sk5wAz
         tMy/GPh2pebEDZE7JSAs+pgHNTIsm1AoFu6gVcI5cRplot5EYWla2hnIK/wHjPWAQzwh
         Msx7CukqvbkiXC3Wv5iAts2AnltkzFVzPIdKaPL3YBH0zojq5Tckf2JmpUtyOcauUKNB
         bLbA==
X-Forwarded-Encrypted: i=1; AKwUvBzqw7kIaFtjeIdZqRl5R+Fk30wCueKVd56u4LNEr4sT7KF6is2O9vwfFrK9gD4B7V+kz77+pFvLB8E=@vger.kernel.org
X-Gm-Message-State: AFuF++mP3AXeznED6LifgbIW+5NfYuj7Cd436/ECf3cqXYxnJxynqigB
	1yafsYVZZY1CKMlYRhg2GgRqiJT2gf43JJIPkRloM3l3sQQ2QR+lnJBk
X-Gm-Gg: AYBFou0yNHDkB8+u9ZIvEid6hSFkEVyvPzoI4nWNWdVi6kl/UpFRH/ozpgH62M02N3G
	klWjpIKEVyo7+qYSUCyfEgn0Zpgjax6aj43a7hbPtThtbp7cFeh74rTXXH8Gp+kIWx7POCmMUMq
	SJ5R6dSg9VEtLxzV6G54u9frpfo0mNHfurPB11LU/wi0LwKh66/NJFFNuxBWna8IUNGvpfbgEdO
	pC88gaei9kHNsv2h89Ea0iRIiOzRtVxtfqRfNB1R1YDPyF4qm5zjU+6pcyH3ONU17W8Yo85Tl4W
	jphaaj6j7JoRl9mCwADfqA8UEZyuIZXdUnppicC9Vw1wng/ZBGtazna19UUSfZx6Hfz/rFOPfDC
	sew3KWPwGsfkYV01+IVO7dEVCnfMJKBUQTBMGGePxLqy/A796aN+kfq+/WNNMbgcEO5enXHqxah
	D9p0CLJjewlLGk1BhEVz1vwOodBy/heB8t6MRXU5krzwvQdPK2M2b6FPDFAr1y8mOmhtsK+NSlv
	BpARErOz0R/Bw==
X-Received: by 2002:a17:90a:d00e:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39b262409e5mr34469498a91.25.1788772374311;
        Mon, 07 Sep 2026 02:12:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm25086123eec.0.2026.09.07.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:12:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: arm64: Fix typo "initalised" in booting.rst
Date: Mon,  7 Sep 2026 14:42:48 +0530
Message-ID: <20260907091248.31415-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling "initalised" in the arm64 booting document.

v1 changed it to "initialized", which quietly moved the file from
British to American spelling.  Randy Dunlap pointed out that
doc-guide/checkpatch.rst asks that both spellings be left alone, so
this uses "initialised" and only fixes the missing "i".

checkpatch.pl suggested "initialized" because scripts/spelling.txt maps
these two entries to the American form; that is addressed separately.

Only the documentation text changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..891fd22f7229 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -588,7 +588,7 @@ following manner:
 
 - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
   property in their cpu node.  This property identifies a
-  naturally-aligned 64-bit zero-initalised memory location.
+  naturally-aligned 64-bit zero-initialised memory location.
 
   These CPUs should spin outside of the kernel in a reserved area of
   memory (communicated to the kernel by a /memreserve/ region in the
