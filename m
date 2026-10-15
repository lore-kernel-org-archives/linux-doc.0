Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD112367B8
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 02:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029800; cv=none; b=OFA9LZSCstJN09WZi0ePsagiqJTyMcV+w9NB7BLOE3eqFItAIPQOUSHr1KnMlytQ3knUOX7pbSiKWop/NQKiJgDGLVov7gjg7ddfJt2Er+KQYOcJjuenrNRfOPItJ9iN4hLsvcRRRCb8kVuDRm4Mz5wkNVRk67pnk378KzPPufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029800; c=relaxed/simple;
	bh=2QaBfjgy+OjyNrWT8jTp9HBMm5x2DeO/63S3SR1N5qs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=X91ymkm5UxCNn0PpEs5RWqy4LdaQMSBdx+0GxBA+lKrUihbzVxTGGQBk6DhvwFnwJP46sXZ5iGn0Vv2Buw6atzmM/3NNaw/FEPk9eSdXzFShQscFeu2ZAK2ISNFNeyiJtzoylPzibawF2CC+G1lhGYCN2Ko0lRI/4B6uH+CoX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=C0FGkXs7; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="C0FGkXs7"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5e78346891fso3683552e0c.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 19:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792029798; x=1792634598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUNOoS2iIKhfEq8rmR2m7meaweAbFoUqZ53SZ4RiyMU=;
        b=C0FGkXs7xBtMFgHKq1nQ2DdPQ4QLe1pxKi1CkRm5gP4Cw4ND1rwYTxQGjXBbwCApgV
         5zXuhpQ1NDKzxLYXooX+tpnU8iey5PXcEeAlmrybwOnznI6lQLhYKySSDAauqFvn9JJ1
         My891HEwVlFWYPfmgKnJfNLw6+2QGAqXzGV01BFhsKOlxDyUL1Fa8O+GArBtHVqdh63v
         VEP0iUOMrCPS6tj56Gde5vZmI+U+9MBkhrIsDDYqjD/Y/kLl/5prZpZDFM5HvOrKL+iT
         qct4PPsKU1wJna/JdIFiwuKsBj0RnsVugJCLzybAB9IUR588chQJ0u6n3Yd0AhPa7dxS
         Z+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029798; x=1792634598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NUNOoS2iIKhfEq8rmR2m7meaweAbFoUqZ53SZ4RiyMU=;
        b=yDXmKvUFPCAX33+aIf+Q0z3TSHWNcE+2xuGpt++n5duFgIDp4ldK1LX6fhWgOgI0AX
         RW6uDnznepQtbd/AKOuEGlVBFaF/mNDfTaXf3zJKmnqWMfje8YOiLQpzfRMne7sqWJLY
         IN9OtG4ELARiWOyKGMSRSZ05pdyifXDa5fRXmbmQ3hq8JCVI7S6Q//R7eX97mCZMa5bn
         hqganXUWlKfioTjYzfOhDYc/75Ht6gj52Cd+h89WCFrhB/T2yOqpvI2Misfl2cA43ELR
         KETjC8ECwHLeTxBxo1QlfSDk4xx7/P/RzHoqjmO4+z930HqKLYuOBtV77IHDhK0S1nCh
         Ys1Q==
X-Forwarded-Encrypted: i=1; AKwUvBws2Hannf6cQZrfhsjVGBAZPYMND04oMqhgPkN4x6xj/+JdWzwYGEZPfIMC3+LcuCbeQ125p5pb+k0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Bvn4FsSSBsrfTrh3QkVHpMeB2SsYIxV6DEvzG7UVVWGaIITk
	2wkAk4zQsZcOvKE15pDdJyjZx7P1RTBnUBc1z4DShmm+oFY+2/6Lut22JTm90FAb7zotwuWOqBY
	BQBcelR0=
X-Gm-Gg: AYBFou2h4EP1dEjeiLoop4jEE7HGTscwivU3w2k9I+C8XE0WEe7vy6sPdTO3XHon0BN
	u0gYFNupLNuDpERn/FqMpwyHI8grAtjFvyqFvXciOzFKSah56mKF0T6sub6mb6eeMF1VWBmgtBl
	VM6a5gbjWoxapUY0fYYI+NBn8Dw8zm7pVQeoVAKGs4eijQXEiJijNf7YW2ohZ2FQi+dz13geiJr
	uBqBLyyKSMqL3S3SZ3Sla/FnSUhPX5bwcxPTOPT0aD0k9nDigqShZnh0H1iOVvvUSmVOFw+yPYV
	SpJYL50EI1Nscccdu1o1NL6SWhvZyoSDj0G5WR8eR9Wbgm+rd7zsY2jUtnzhyBdcjOhVoxulpkj
	lLJUvjvNyJOrEUpZP3i0kwaVIHs/Pyb3/R6WyPGcvdSa4BEnBh22RrPeGnRt97sd9o5H6JoDZkL
	yk4SbXOeUlBP9wG5oQCccd/+kle8E+OKIB806QSLZC0km5Y2b6KfQ3/OE+UodABk41D/oAXvyGp
	AnGBYX8UFcWA1eqfrBh37eH0saIcWZ4EwIMLlmGIwCqtsa+ljH6VNx+LNGAqum9xMw/BTQ8VYZH
	qY1AiqFKlEu7GBJO/D+CqA==
X-Received: by 2002:a05:6122:e213:b0:5de:655e:4056 with SMTP id 71dfb90a1353d-5e91f3f5ff1mr6177997e0c.6.1792029797642;
        Wed, 14 Oct 2026 19:03:17 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cb3e435sm12477115e0c.10.2026.10.14.19.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:03:17 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: rppt@kernel.org,
	tudor.ambarus@linaro.org,
	mchehab+huawei@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	aleksandr.loktionov@intel.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org
Subject: [PATCH v1] docs: xforms_lists: Handle DECLARE_KHOSER_PTR() struct members
Date: Wed, 14 Oct 2026 22:03:13 -0400
Message-ID: <20261015020313.946940-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KHO ABI structures declare their preservation pointers with
DECLARE_KHOSER_PTR(name, type), which expands to a union of the pointer
and its physical address. kernel-doc does not know the macro and does
not see the member: it warns that an unnamed member is not described
and that the description of the member is excess.

Translate DECLARE_KHOSER_PTR(name, type) into "type name", as is done
for DECLARE_KFIFO_PTR().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/lib/python/kdoc/xforms_lists.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a537..e81d8a7702cbb 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -45,6 +45,7 @@ class CTransforms:
         (CMatch("DECLARE_HASHTABLE"), r"unsigned long \1[1 << ((\2) - 1)]"),
         (CMatch("DECLARE_KFIFO"), r"\2 *\1"),
         (CMatch("DECLARE_KFIFO_PTR"), r"\2 *\1"),
+        (CMatch("DECLARE_KHOSER_PTR"), r"\2 \1"),
         (CMatch("(?:__)?DECLARE_FLEX_ARRAY"), r"\1 \2[]"),
         (CMatch("DEFINE_DMA_UNMAP_ADDR"), r"dma_addr_t \1"),
         (CMatch("DEFINE_DMA_UNMAP_LEN"), r"__u32 \1"),

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: 557b4f406b7530b8be07d3e3aa6015ad89ceaa6d
prerequisite-patch-id: c0430a4f0096e4be93a6200aa4e8a1d392238ca5
prerequisite-patch-id: 524c71eab38a9175f9920f38717c8ed3b157299f
prerequisite-patch-id: 61cfc274edef2fb23a1b867c9e0d063578387c45
prerequisite-patch-id: ac022b05628f8e495a224216352aa037a022aae4
prerequisite-patch-id: 50668baf257da9873190d08f21538ddc453261a8
-- 
2.56.0.385.gd3acb90ef8-goog

