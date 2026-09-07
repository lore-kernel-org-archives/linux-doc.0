Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB5494A14
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781315; cv=none; b=LzaNp+xiS8wli8T0mL2AK6VV+KrnXvu4rnL8pGbTXfbttLt0D9+1e3w7FoYQNBV177gCjJwqMtXWoH63k75BQs1qddTAjyfJ/nVS2da2km34oZDB7Eiwspvan628Anfv6lFlcxbp3d26eHZmtKeMbxdGPW04uu6ib1EO4N4alK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781315; c=relaxed/simple;
	bh=2RsyHN1FTDxe5uxmUWd1eJ4IKM2azU5Um1bDIGCTosw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlULOSHJbPRn9LNzj5S8fAWLQxZewg92y2/GtJyRWtm6YixPfLbE/McFFB8ZIofnNEfnWn7RkoAD7CaEq3DpU5CgcZH2GEEG5pFBCwE+M8nGebftzqek7qTVbzFoQAS/15MjsheWivHpEpVp0obIFX81qINsxc3rTI/Zt36mfkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5kw5PWv; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5kw5PWv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso2769228a91.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 04:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781313; x=1789386113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TENsUGes5Z3fy2akncUuJKhJtn2jCzInwDk9YfRh4i4=;
        b=B5kw5PWvGH0BsouOl5PHTCV5Ra0PT6K9DG7hYq+RrAhCbui2wU/rpCCYk1C1Y16bRZ
         dsnixe6jrQH3ejOcXkF2gguZLdsl8Bk4UlD2//xSQ0TQ9D/G70Mlo2RNk/Lqfje8HF7M
         buhCONrQcnS/WruSaQDZBjam9o+vB4i6Ss3IMbbnMudcECDRay6qasKCRaiCuHnJHrBE
         qNKrRxjILIcZMLAd9hVT5Q90T6oPZ8HLYNr6+nGlAUVGQmqnGYqTaUCnB0sS5DqkU8wQ
         6XuoSOFCSzesmwPD3/MSmwKmjLbAX51mQpBMuywe1pOjp9/GRQ3r/DTKy4K/09JMHC58
         5m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781313; x=1789386113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TENsUGes5Z3fy2akncUuJKhJtn2jCzInwDk9YfRh4i4=;
        b=RZwxb6+3NTIOkKvbd9f9gdk12G4lPspPHRThx0s9wxjxXkENUbtSmEQDkZrUNNQmnw
         /BDiRyZ9bapWWzZ4KipQtovfgGsM9z9tavrKg0kpPmx/DedL5aQuh468mvvpKkv52aUf
         f97FvfP54a02O938yc6Z6r1Lfk5249cjCG6qdAVoDxmkqs+TfDq2v7lNdzBs7drwUgJD
         amlsn2rLqkCl2U2/E7w7abACLcVT0XTNIdc7TTR9vk/znCTWAtmfd4xiv1Pq1TCZshub
         1G6ZRFagjbZerLOhwDY/THDHmJzdzaC3yBHIWrM3jjsxDakFviWtehXj7YnFm2QiQaPW
         r6Sw==
X-Forwarded-Encrypted: i=1; AKwUvBw2EuuXdiRXo9j1C6a1kml7DB86ObuQBIXXAifQVU7UtZEno/thBxzhimm1J6oX9bqJF1orzq/+htI=@vger.kernel.org
X-Gm-Message-State: AFuF++n8Zete4M6InKKe+ljGuW/ZJ6etM/L6JB8jGdqL8IlLxajjJUoQ
	rSQlcD0hyJnW6oVa8UqyQuw5UDQ35k7oGjaFOz85Gby2lmhCbIli+DMB
X-Gm-Gg: AYBFou3l/8/TdbGFDd0HxY/y59hEORGxoqTwxG+N0F/ZkTT2YyLE8wUzzc/CCAeuWi2
	YMOLW8v8nJIrP0pS+zFlTGk8G4VzvEMr7OIOQ7ov5GKty5yiCk6d2TeI7y7GNvSUKkDEXGFFAtz
	6L8WNKQX4bJwewiKrMWNl9F4r26vk1SxUIzwR0qZO5rC/MA3MUj4WL+XFp6nPlVEYaLHnpBrLnv
	PtmdYWCeCtWtVXYYcRH2fHkzatMo4QVZU8iQYmp2Zlc5L2zkz3OSV4duwQaMHrmvDOQ9yAlGHm2
	kKzhTvyjN2KxUMW7cOVZsTIpRU1znV241tuqtQ/fpZycGCcFoaXKFO9yVGMbvwoQ6hrRFALpSuc
	JEPptAggAcpyO9vREJbROJfz0REAqVsIdzaJAiqR5gBrEFH4tL1qcoGOxK2g2WXywP0UjjPXNlD
	koAWfO6cJYabeBZDR2bvdU+2i8Bf43RaOmvUgtLFPqih8R/3oeF7+Q03awDVl7N0/ZGv1iDLUhP
	MqTfrsk/pji6h/qeZBobDTs
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr35731550a91.9.1788781313033;
        Mon, 07 Sep 2026 04:41:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm41100152c88.4.2026.09.07.04.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Weijie Yuan <wy@wyuan.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: arm64: Fix typo "initalised" in booting.rst
Date: Mon,  7 Sep 2026 17:11:46 +0530
Message-ID: <20260907114146.39715-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing "i" to "initalised" in the description of the
spin-table cpu-release-addr property.

The British spelling is deliberate.  doc-guide/contributing.rst asks
that both American and British spellings be left alone, so only the typo
is corrected, not the dialect.  checkpatch.pl suggests "initialized"
here because scripts/spelling.txt maps this entry to the American form;
that is addressed separately.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    Changes since v2:
     - the guidance lives in doc-guide/contributing.rst, not
       doc-guide/checkpatch.rst as v2 claimed (Weijie Yuan)
     - drop the v1 narrative and the redundant "only the documentation text
       changes" line
    
    Changes since v1:
     - keep "initialised" rather than switching the file to "initialized",
       so the British spelling is preserved (Randy Dunlap)

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
-- 
2.48.1

