Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70892368289
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567141; cv=none; b=sevwaMu5nKeR274YbKM7Y1yFV1pXUxo/StMFBjeWE2Z+Skzch+GZ5kVizdOe69l3sRF8eozsttCkgFDEm781rWsi7eyStPN1HGUKNg0H6rA7PmJz5ln0Qj8c+eneOtXD1+7tUx01lMv/7MXYkhLWMHIK7wiPDAPeA4J2ftr1X5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567141; c=relaxed/simple;
	bh=+VK7KRl6+Lq6c3QG0QoLNUfpAYwW2X9fA09G/NfS6uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlmaIfwB5tulSXuh4ouSwY196zwRbdnZUhk/x+kpxxZv9fNbtkbOO4fZ601Mkkxf9qtGoFuQmQNZr/2G9cEVQIQow7J2abOgcgYZglA7GunQyJ7ctY+LndSqvmOEZpt/GLkrqzrpFHcBPBy0lC1Y1zATlQIKwA+tpXWqPEFBwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j6sLEfh9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j6sLEfh9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so606808f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567134; x=1764171934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuFAdi/dQ7TYcP6kPKC/D+o7MTxWjWW8Ku2RD10GvbQ=;
        b=j6sLEfh9uv7+dsvFnDqDQa6anzRkocsy8dt+OoGqRNipZTLpbhM0kN8gp+hG0HbaBs
         MMBo7xYfGVPH43vHvKGRCgch64x3w+5gOHyhKTn6HQ+sYqIorf4m52B2SrG4bBRx89Ci
         k7s7HPQsG+hLYQe0dBWwwYUE3j83EEMt+amQKWLX6AugMw0fo3ZbbVB5M+piJ6Meo17+
         DvU/V8qk2/79vb7SU4ODsNiDcw+a5f4qtSc80/uGNdJXinhamtY1cOT2Gtifllx8JCIq
         7cY4R9Y0192OrEL58Af8mu4tpPfVY0/Be+sl7rGwPj7IfS35Td5zUv2USdiF44V8DV8K
         PVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567134; x=1764171934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AuFAdi/dQ7TYcP6kPKC/D+o7MTxWjWW8Ku2RD10GvbQ=;
        b=VO/ZHl2q5tOv8IFmoPuLSeG+q8vgnRj2JyX1X3tNszkvPRGCJCVaFc9jEEJ0ryhxQ0
         1uhTrdDPdgujO2FIvuQyOrxZx3sWn+hI/gM89HVbGStmHhbdtS1feDwM8/hfU9d2b220
         Et6CJfByf/q+31f7tF793PavhQcUMy1dhAS6wzUgSpIMi9YgtEMwiu7sp72K4LNc9uje
         H5YsT6YPdEQ52IYPybgMelTyzjZF6agqKkFZjZ3z6bH/FZkkAb6hhb3TB5QFDKg91CPq
         nz/XvNV97WoBbA1ey0cL213h003nHOZg47KupbTWGA5X2Ov/7Qv5P90RML8m52mBbGUz
         QltA==
X-Forwarded-Encrypted: i=1; AJvYcCWxz7wTEiRO4mCJgAdmdenXcqdqxrf6hRBPm0gE8Xf0r1AZxsxnnP7AL3jykYVDKLwXx0dMBhtU+8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIQ+w0A2nsH27Zfj740L6ftWTlkXP4bXj9T1Ks6pmAQy+pBzxA
	6VjWdOZm9IoEgvALpB8P/pzfcnujubKbWMiMsc5VPvYWYAChqYUtwUptlZgdaAP2SHM=
X-Gm-Gg: ASbGnctN5Gnp8LVZkUkLhEp4gJICYZUX333SeHljn2Jk493gG5lRUir883c5INvmF2b
	mZ6mj2tp/zOzOArZ6rtH3nYTsdbJCStdyC+KOHj72tnRdk8BmAJJxtQpsy2R0+UVyBnrKmW8mrA
	ZHBb6OXyFDZlACa7qx3cAHApQa/M1lYa2CXrpQ0zidovmSOWWYlQdyZ35AORmJmymL+CP/v/i9O
	MazJb6mUTeYHw7lVJpXZylXgA4ece09zFG3k/xMJo972Aw2/8kyNqvl5oGrsS9X4ET7ZEKD7TA5
	NMdDzenmgLMpZ7WkpKOOVkSiEKOSCbUf1x6QyzePf4Js4ejq37FnFXYrjAwpbBg78smsYJpbDFB
	BC/4a3SFwnKv+UFOAukSz8+Hg8v0ukQQEGsTaLxwNVks8rjF6HWMwSekFfuAU0n2/r4Qb5bPbjT
	+wZCyfpOjMtqMaBjpc/Lhum+CF/L2Vlw==
X-Google-Smtp-Source: AGHT+IEEW1UNe8+i9pRkQXcVi1K6qHmkkggtbzPn6ocK+c8Bp9XYSPJPKkUMg9h5XQagLem1rvsEdA==
X-Received: by 2002:a05:6000:26d0:b0:429:eb80:11f5 with SMTP id ffacd0b85a97d-42cb20e4a02mr3468125f8f.26.1763567134112;
        Wed, 19 Nov 2025 07:45:34 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:33 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 10/26] mm/swapfile: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:11 +0200
Message-ID: <20251119154427.1033475-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into inspection table:
 - nr_swapfiles

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 10760240a3a2..ee677be19041 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
@@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
 
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0

