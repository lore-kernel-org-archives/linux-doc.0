Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D933470E8A
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519086; cv=none; b=Iz2NMgFMJkrHPr8zwieH3iFZ1/4Kl0Il73Sc305Hp845jcoaKpDxFlBR5PP3rDeQYyqdNhXIEL1Y+DrEZjkY34M+kMxuv1gG0k3+YSQ2BQqRxWtwcYAQa85ZYoc+IyPY6d0HpA11Zo3XOP/dHake59iP1/q6dydfkQvx4wruTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519086; c=relaxed/simple;
	bh=feksAreTs+RnNAhgntYRHeIi6G7ugiPQR09TgoYF87w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b215CNuyBTWStonf+nHkzcwv8Jiu8WtP+9kLU+UvfMNXo0rgM6XfGcVP/9yh1Y6GWN9xKNFPKbd54Hnfk14tFi41ok5v5x8gdpYFQki47X5LZL/JjWY45GSUjSFHy7oU2UuFK+2qWZDZGUGod3UqxwBHMNmQXbCDIyRhiVYiJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2RM+Vt1; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2RM+Vt1"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so719812a12.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519083; x=1789123883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9N98bRx6q7lXxVKSULoDokbYLr/zTNPxFyy1davZZZA=;
        b=B2RM+Vt1VlH0HlEE7TYPosVpqolVbYwzFkB6wSbO+8NR2T1vov6miw1NNbVK3xpxCf
         bKV0UyAjYKXKyBh5U5efZmwanbDHPj3mO38MjJGWlpBa0vOnNTT0mDVFkur/CiZeIJea
         PPTurbbfRPJ0lOKGuVEr8Oi4VdsjqXnCitHWb1oibWvxQlW0yp7Fz3i48Wez0lyag9ui
         rnyNO6oXxjcaqcGzjKzpvRwZbeGo7oZ7jYBiH31yE0LS3Sw9KSy0dAHRtghv+LkxwTSS
         H/FurSCAl1k5lOI/2LGfqJIm8BdI6cgPjdJwZHRBgQcobuELptSLqDAE19MNMyrai60D
         kMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519083; x=1789123883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9N98bRx6q7lXxVKSULoDokbYLr/zTNPxFyy1davZZZA=;
        b=PYEl6pNVFkZMddVc/HytqJv7oRs/Vj/fJ6dUShIc3JZaAKyFR0U+x6+uRWK9x8gOt8
         FZu8LjbJABm/dfCG61Kd/ltohCHy33dEsuU5SEOYVzrfCd0F3Ap5c2mryU4y4W6R0z9k
         gcVRvVTXYhKASHdBEhqoIao4SE2PMKoMLovQle7ARBfV/TqP8s3oKe2jjZgn4mpirA59
         vvndEWMUIzHffIbVhGIGMDX35meCL/dD339QV5ULwao/bFAaWcNXr2GWaeVeacXv1mpn
         uARmtwoRyJjYezbW97+iL8T+0M5O/SrkhH0NUeilczNZ3/ZWTzY0zRRky9aqW2zXQMY9
         kEsw==
X-Forwarded-Encrypted: i=1; AKwUvBwmwMN0HatcIZTPfieh+VEQIf2mT0fGehKpVXanYHdtWnn0D5ZZAjYfu20ha9kRvKIUHPQuNcXU3FM=@vger.kernel.org
X-Gm-Message-State: AFuF++ns9BMJXzf769BCno7ggLc7J7A1DcI8f/YBJAYCrcMBfnV58NO8
	kvAmbTmm5bCFjNz8AIer/p+/G0Lse7b3poHgj13zeMdxdh3P4se+E4nT
X-Gm-Gg: AYBFou20qW/fr/q++V5xpRxdiseDQwzzgo3RtWVhgJBZ1tQiLu93vduHyL1aiesp114
	GChW4kXCJa93mag14upCE8Vg1trO1KB+NnLJCfWxSbHRc6tcIYeY6+sAM0oMBVbTLLpUTVTAA8o
	MEE+rqQaQCuMjx4q5Dx4hHyRI451Mvl72tbgkOzD9afX1MVjIPQjK3R/ZEYHsnREtohEoZwkGEh
	1GHokWQ2lZo7g2v8uHTPef9K08dHLMb5fZUW8XzTKn03FJHNuSP3PppaAvv3ggAzqRDMHLTuNff
	NlR/BXPlmMFJ0EJvQ1WLBssHokP5PvVpBNoLoLDgQum1sgueEVggRcyoNGUJEE/WCpfDtf7vn61
	9Fz5wzasb317l5RAr3yZOAeZriBc5pz2eCpjn2jaO2IMgUQ6/zkFkTf6iUsaG6rhfN5S/qOF+U8
	HVoF8+0kET+Li+4cavfNQ3qSvDMijt85Z7J7oGWrWEApEOYIB6qRQGF6NoEurng1TFaM+smzEeQ
	tuIxqCT01NDOcU=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr8131337a91.16.1788519083168;
        Fri, 04 Sep 2026 03:51:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
Date: Fri,  4 Sep 2026 16:21:07 +0530
Message-ID: <20260904105114.29474-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "initalised" to "initialized", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..0d5f8709a5f5 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -588,7 +588,7 @@ following manner:
 
 - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
   property in their cpu node.  This property identifies a
-  naturally-aligned 64-bit zero-initalised memory location.
+  naturally-aligned 64-bit zero-initialized memory location.
 
   These CPUs should spin outside of the kernel in a reserved area of
   memory (communicated to the kernel by a /memreserve/ region in the
-- 
2.48.1

