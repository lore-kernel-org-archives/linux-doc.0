Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D792A31
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 00:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208235; cv=none; b=XvHXyqyYVULDmNwwFanJ5F2s8K52Fwm7pSB6mNdPFBXeC9BXbDdIX3meHX2kWmAN7qw0tr8xANuz10aJJv0ahZXI2pMY21lHX/A+a13lFxOFNmquSwfpuviZlAs16cXiWtQNSuAPCBEsySi7ghxhHLvqwc+QLHPR3TQm1UuBsYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208235; c=relaxed/simple;
	bh=sr4xiFO/OeAU4kQmM80kwE5+AMwERA8/98I7K3AzPM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSvy7i8ptzqClaElUYVolawGrqXZxTJb/Tizow4YHmhPolhxhUoTZt5RU8PMhhWn09w1RhN8f0s6AI7AB7wS7UNR4KslZHerGkO208cLvlOOJh+tcm0YfAPa2CcOUADm4GjJ96n31l7VJUE5klVVc9qJsMr3cj6/mAp6nHMYDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mBAL1xPj; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mBAL1xPj"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d8ece4937fso98593266d6.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 16:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1736208232; x=1736813032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+k7/fZDgwShiWAnDxVUmiJM02Oc5NicKXchGCm3s6Y=;
        b=mBAL1xPjH/XFw5wsGoElXbk5voD4/qRS4S/rRUsRbdHKZkJnbvJl8hd9qOYjRCC5IH
         HaRGXJwXzOEO8EA5qHoUslyAiCxwjv86l6weJoiPX9vfNTuA7v+vAy53Lz9R6wd1jXy4
         oJYGF1nXsFSDwRhyrnGBSyk/OKscapmCElVr6KbPO0HeWjLkcTwHUPlvT75iNqVzjuGE
         5w8I6NFT7LddIfu+evSib/s9IXWq/0cP6sjlgFEBlARKMaI8BCxXBJ054WS77wC0efvD
         ESXKUXF0b9sRSU3Zz5TLOiZYoB+MHMrlEOK0/iei0Ghnpp8JcMF2dgmPlyuo+HEtVCBv
         IHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736208232; x=1736813032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+k7/fZDgwShiWAnDxVUmiJM02Oc5NicKXchGCm3s6Y=;
        b=CxdbgTiMZMCmulf4Aah5QFfpm1WaOx26tfADFcw3t4CXV778CD33KrFTVWfPdP1oYg
         XOEFVPoVg0MJ1unHohxieiEEzrON4LU1dsBntPZDNJi6ktoOWSeuyGOnBy2/ACjIC9ZL
         UoNfQMGGDtiw/RDqqct37YgQaVk0OVhAtV7CEdnCw5YE0jT7kc1XVmk2B5y3raKWsI15
         jyQUPR33GrZOVrIRCiYLivDT2ui/umkPjyG8Sx/IBtieSQK1k/EPaN8UXpaJGow563rb
         7v5akuwvaATLYt4f8Bd6ciJyrcqZrX1ZoDEOZgnD4mn+1LkmixlEmnV9KzqxxRdoLnpZ
         d6Zg==
X-Gm-Message-State: AOJu0YzT2Ce9AG8Fvpt4cr2LcuCBSKjRRExAF7cG5EK0lQwgDHXFxhZz
	E2wJLgQ3TiGaqvCtTa1UoObEwD+9djrW1k4csKh8mW70sfkbMWxT0JxdMSib5z0=
X-Gm-Gg: ASbGnctpOhLm3T1kAyd3EeJs12Uj0loC6q2E97bWvwaWgEG9eJ0+ykRovzR3Xcw1aBo
	Kqm1tIMkeSvtLIIgtOjF5HECTYtbHHoRdi8x41WEvPKXrDMBymNaijhR7jlFinAb84sV98N7Z3s
	0Fy2HJIRgH4ZaKjSKvwioTnSYXJ6Gm2g6F0/lTTy5AD0sM4Qy/T7ltk4QBBK+61XJWlIrqP71PM
	AS8eX0DOGveA46mIbKTNqeApciPQeWnrJbzKQwLlu8QM3nS7jLzbeHf4scbjkRxDGUT9bKIgZyQ
	xoyx8vzPr6SYJBKHyYNJA+P3knGrHSH9DHnmIDKF5D6j
X-Google-Smtp-Source: AGHT+IHOqKIeQ7ampwkkS1JPMTLmaW/686eOaPbp3AeW5D0x9/M0zZRBfxMo3FbicJmEkXL/0K0/aw==
X-Received: by 2002:a05:6214:31a0:b0:6d8:81cd:a0d2 with SMTP id 6a1803df08f44-6dd233ad8e3mr1025601246d6.41.1736208232286;
        Mon, 06 Jan 2025 16:03:52 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137218sm174104476d6.57.2025.01.06.16.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:03:51 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	david@redhat.com,
	nphamcs@gmail.com,
	gourry@gourry.net,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kbusch@meta.com,
	ying.huang@linux.alibaba.com,
	feng.tang@intel.com,
	donettom@linux.ibm.com
Subject: [PATCH v3 1/6] migrate: Allow migrate_misplaced_folio_prepare() to accept a NULL VMA.
Date: Mon,  6 Jan 2025 19:03:41 -0500
Message-ID: <20250107000346.1338481-2-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107000346.1338481-1-gourry@gourry.net>
References: <20250107000346.1338481-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

migrate_misplaced_folio_prepare() may be called on a folio without
a VMA, and so it must be made to accept a NULL VMA.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index caadbe393aa2..ea20d9bc4f40 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2627,7 +2627,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		 * See folio_likely_mapped_shared() on possible imprecision
 		 * when we cannot easily detect if a folio is shared.
 		 */
-		if ((vma->vm_flags & VM_EXEC) &&
+		if (vma && (vma->vm_flags & VM_EXEC) &&
 		    folio_likely_mapped_shared(folio))
 			return -EACCES;
 
-- 
2.47.1

