Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF233F59A
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060602; cv=none; b=YtiiOWpHrF1rU/7lWdb+FCiP5wUkOZaV8SunkYqGhj6wTr4EIjF07bbFGUCbus1kTDol5uEQ9Ku1HcR3QKWUjIG94p08k9zaxZUHuFmUkzHPQqQkjGwVycRnwMqGCuFcS+Qe8kANb8+gqg5/ry7hNlC5yMYOUFv8dTSyqIIZgM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060602; c=relaxed/simple;
	bh=1oqaa9bELSRKW3Ogntg3bC/zWki6imZPjxfFvD10X4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXj03lU2QMnokQViKVb79y8VWI36OGllqspY1gamUNJVV34nK3VGpw1CkHa3Y5yz90Am1VdppK3BG/LVCYVWPt0lkjL5h24IvR6xNRy6grz9UYEM5WDokrbfgF/rsfx9enN8AKt8TjVuHehHtuWQD813T8N/SQtFAcePPEzkFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQhFtbZh; arc=none smtp.client-ip=74.125.224.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQhFtbZh"
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-66e56a1fe8aso2093840d50.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060594; x=1789665394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/4KB/W5umJ2NwhZ9AnF6tdCnGIfxiKJfL3QRGzZeTE=;
        b=cQhFtbZhBkH+P6H7sDufFJv7GnhZcvhjQ9PiLspOLecNGTdrLeldLUa7fxqP/HQHTI
         mJExILobqzBSvfV4gMWS0qqz3K7CxmUtt19zjweZRz50Krd5ntwUkKwY0Gb8cr/8LSQ4
         gnVE5AfYIv/z8fZi+Fn3vOGAGmQCYDDxa8IaNNK3b9Az6fDPlloIMNvc3Cf59tPebCLR
         9huvyLQ/mVtjXLLwDAWhdy6dFMSfjb0SDtN/vhkSJZ9cu2fGVuFiDBnBalbIXLXZlZAW
         Jcog1riM5hJaBc+WD1HwbX01g9DUKtmcjNmeELBbj6RrdI8FM1VEtIicJSFW3tkp0162
         sHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060594; x=1789665394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/4KB/W5umJ2NwhZ9AnF6tdCnGIfxiKJfL3QRGzZeTE=;
        b=BAoMxcZS9BlpPV5KhqhOhNV1qXnxlPG0YCs3qqDUd0GBjjhY11DJx9Xwfnn0g01Bia
         zmYsH2jOqLVjBNB7LDeQR8KNbA9sL9Yw7G6KdYAyl/DFTdjcjxQ4IFVSDDCv2EGn+8zR
         924kmYityPz4g8BA9JXOy3wtpv92+igmYBrsjoCedQNeSXw7RI3QP2xXPPxjvutLOX4d
         8UQWX+CDrRDAStWjtWKKSj2DFgJA/3Qji8dk1JztN6f9rKRILNV6SlTlQkoQa4yDFAXL
         Xb3lNl3JL8M7ibYHMOZR4d6dMGrIHtGTewYESLOoEBZyEnfPOQjPQ99c/catIYuedeXK
         8i4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYojlhwvQcJcYujRHMQ+SSKlLlKkh1Xvs0IQ2UHQl6D6EYrcdW6XGGX+fzaD4nNhVUMcf4lK9TIIo=@vger.kernel.org
X-Gm-Message-State: AFuF++mbLqoFaMCMc+Iqy3jUXns7P/tAVPzxtYXDYDXtq9gurgQXvP3C
	FACS6DJq6JWU4wsXPe+Z9w/NLYpWU/PqsDGYqs8DMhRGIF+IJm2d5lA=
X-Gm-Gg: AYBFou3LVuAez58wlYLUDC2a4lBc3+kZCs/dLjdfIxwz4ZeWKBuhRGhHFKBEKMzfWFi
	UsasiI+wT6XgqbuYMrfZu+M+SPCM2XL+ssa1XYdVLn0ULrVHc2pVUVpg6L+W4msduP+ahTM72GG
	r1/f64jJvfaDirKf812BybHUjcLl+unJ7zJggyog9oUluXCjg3hmdmC2v90gVIe6RCssQL82YbS
	kF3BQtlxCFFjNWWK65gsFelcyS93MwwMSVBJRNttoWlXPjgX1nCYju8wD6K48U3mL9fnr0Wc9PG
	GTBJJlgIuGfcEJx+f4P5Bl01cDTfqh5z4+7M3UK62kqn0IScbeeYZxetD/cAvsGK3xtJOh6k+XI
	hwyYMP1WM5mBUvfRTzPm7u36fB8vNTFTkBp2tsQ3/4sb7SSPLXdr5zVsNQj82hQFlq6E0i+iM5J
	nJY9hq0XhZb9bbGDpopP6v7HR9nGl7umXltEncntHB/e4rvMs6v9mFzm7MB/q0OtvitytsoOZqB
	D2r0dzEK4kEWV/AJQK6jtICHKav/KqD/uGDgZK31/c/rvYj6smoh0b2GXpr
X-Received: by 2002:a05:690e:4503:10b0:66f:c1be:84c6 with SMTP id 956f58d0204a3-6712473ff01mr113462d50.52.1789060593948;
        Thu, 10 Sep 2026 10:16:33 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm14291862d50.9.2026.09.10.10.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:16:33 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net
Subject: [RFC PATCH v2 3/9] mm/damon/paddr: lock the folio for the page fault primitive rmap walk
Date: Thu, 10 Sep 2026 10:16:17 -0700
Message-ID: <20260910171623.6638-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rmap_walk() requires the folio to be locked for every mapping type it
walks, and the page fault access check primitive takes the lock only for
file-backed and KSM folios, so a plain anonymous folio reaches the walk
unlocked and the walk does not install the marker.

Take the lock unconditionally, as the other reverse mapping walks in DAMON
do, and release the folio reference the lookup took on every exit path.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/paddr.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index f4fa7c231e551..5fcef3005c536 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -91,21 +91,25 @@ static void damon_pa_change_protection(unsigned long paddr)
 		.rmap_one = damon_pa_change_protection_one,
 		.anon_lock = folio_lock_anon_vma_read,
 	};
-	bool need_lock;
 
 	if (!folio)
 		return;
 	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
-		return;
+		goto put;
 
-	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
-	if (need_lock && !folio_trylock(folio))
-		return;
+	/*
+	 * rmap_walk() requires a locked folio for every mapping type, so the
+	 * lock is taken unconditionally, as the other reverse mapping walks in
+	 * DAMON do.
+	 */
+	if (!folio_trylock(folio))
+		goto put;
 
 	rmap_walk(folio, &rwc);
 
-	if (need_lock)
-		folio_unlock(folio);
+	folio_unlock(folio);
+put:
+	folio_put(folio);
 }
 
 static void damon_pa_prepare_access_checks_faults(struct damon_ctx *ctx)
-- 
2.43.0

