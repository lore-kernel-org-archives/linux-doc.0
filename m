Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05154654
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762629752; cv=none; b=h0g2aFbOVPJlEJCQqXGaE94IwizMyOOh3LVjtJoTcu81disuzZFOBQVSloBl8HOSDh11ViIrib0NJkJ7aDsmlkAyugT16nWpVO3qVT+CuaV3bfCRfAWaIbvkF0Bv/gbAk+EmRNVg0DfALjjIuhKm2FIxn+bIwEfqrAQLxdScuB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762629752; c=relaxed/simple;
	bh=up4+T+Vlgr3bfen8hI6CHhXyKacPmsvTPK5j8/l7Q4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KPgsoZ9GQ10DD/MDAaFzA3BWHwBDU38etGA5yoW6b8ARAiQ5ohBkGR/cjwEJjjaHNoTBaoa5qvQAYZHHDpPJkNZeGMD79rYOWNChbDiRfL3ckjcPFj13Og9t/CAHDpr8VuzTHv3lNGwBnDnfnlaPAnnmKOc5hRau24syV3BsEIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmyjTPiT; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmyjTPiT"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-433692bbe4fso3745645ab.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Nov 2025 11:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762629750; x=1763234550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=03K14G0YoonwYbFA43DX/6Sm2xq1yhV7AwclEvpudeM=;
        b=YmyjTPiTUoSn4eviA3N9Yu3CvnhJfQeQ6tvw/7Qdv99QzqjuE7h5Bke+hyinsidFk6
         EQCiDQm4xksFIvMur7ZMy6TR1NIh+JWNVb7Q4CyqOjZveNb7iSbILTX70NA9qvuGXmCe
         zVQjHnEG5uHy+xpV483tgsM6OW8FBD458WiCvNRQ1CSOCuSav6JmSegTSaPlfQdSTPfY
         PD8VchaF0Hll2ovm0Ft/TTk8ZBfsF6jH4iBgHyaGdzse0JekGRjxBeN8TygBBNq225kY
         EGVsS0tcs+wEk4Pe5vJXdF+NBbbp5YkCfJTMF8xnL6o/+l+lMF+40SjwYuIZ5rvF1NKA
         O32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762629750; x=1763234550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03K14G0YoonwYbFA43DX/6Sm2xq1yhV7AwclEvpudeM=;
        b=bGUW6A2wPOVEjms8Dw00K2jT/LmVe2arWFk6qd1F9TlOkuuNaEKPLHiyCX3JpjM/GW
         poclK4LA78uHvptpK5xOEHDkiUw0NsIOZKVAC9hO3Mtf0mvaCj709QXNUTWnYz4ddIbq
         rzUle3rGPbz36NuxO+un+iLOL80IXQ9BB5pgR+YzIbrIcWDJdNY/KezWFYNB35MYqXak
         T23I+/ypG5wB0N1Wwav5y39+EegqqffFzEhrL3x+TbqcTUpONel9vdLFb8aHmxVX8QWa
         sgM6qnMHUT1zV5F7xMJIfZIoriBUbrmMg7lsOfmOfpQ9GXoIfXsKOpurTb0Zmm1GunU6
         iqXA==
X-Forwarded-Encrypted: i=1; AJvYcCXTP3GctMxbbPMTudv1wY7bjwjjCxL/66gmvTEcB+LDoxGQoluMS93eg7W38XTFb9C8Qz1tI/sP11c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwtm6gvgCm9uJBLPrdMmy+3AhFhdWNAeT3bVxXcmYVANXGQA6o
	y0V/H79LrlUPJneRgPMqd01+BkrvEJFsRzRTl+72onXUfXNfAtG6uIss
X-Gm-Gg: ASbGncuBMzpsnto0qScJZ+ugN1T+KiTnCj+RrekshBwm7caOwtIW/XaDqWusA4KmgMJ
	pEwspFL2ulg4nGHq3RNcMMQ5Du6RDWRnqqTAqr1p7r05qwNvY6WNVlA2LqeWN3/eDjfr7a1TOvm
	+qYBqNFxXl/Jtbzhwz3v2WVKDSZBR5yK/r3SgYN0Q9XxmDetLQHQuNJtcVSkqeMcu0A866eEf+H
	EE0wsoW8zp3UB+SRvUVDLu91PaXq+0UDEckfis8gyCMevrPCx/sMcDxBOJzy/e3BgWk0LhpqWv5
	m7QwJN64uDng+ATHMI7q3S5ahObNoQMqOoKIg8y0eWWzyK7LbdZd/48g7JxO+1YE06BgrYe+8GJ
	pdG4RLjFzGpRKNaB1DvDmoFPNuFi9ryr0UnSCQsmsLaXbn7T2/lk6TRZgVDhmaJVGTX0EYJhLes
	79KgniOj7GMH7xqp2iwBaUYFizHobOc5ObZLPYOB3q4TLgUjKexFux1KYvS00Ssw==
X-Google-Smtp-Source: AGHT+IEz3FESVkX5elsfVenCRkFYCsyWww7qdldsgfZPcmJ5WrW9qgOug9eVK4qHiNMge6D5SMistw==
X-Received: by 2002:a05:6e02:3813:b0:433:330a:a572 with SMTP id e9e14a558f8ab-43367de5254mr54763635ab.13.1762629750036;
        Sat, 08 Nov 2025 11:22:30 -0800 (PST)
Received: from localhost.localdomain ([2601:246:5f80:2880:499b:78c9:9e03:a278])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-433796a9952sm1681465ab.28.2025.11.08.11.22.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Nov 2025 11:22:28 -0800 (PST)
From: pierwill <pierwill@gmail.com>
X-Google-Original-From: pierwill <pierwill@users.noreply.github.com>
To: tglx@linutronix.de
Cc: bp@alien8.de,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pierwill <pierwill@users.noreply.github.com>
Subject: [PATCH] docs: Fix missing word in spectre.rst
Date: Sat,  8 Nov 2025 13:22:16 -0600
Message-Id: <20251108192216.28534-1-pierwill@users.noreply.github.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects a missing word in the hardware vulnerability docs.

Signed-off-by: pierwill <pierwill@users.noreply.github.com>
---
 Documentation/admin-guide/hw-vuln/spectre.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/hw-vuln/spectre.rst b/Documentation/admin-guide/hw-vuln/spectre.rst
index 991f12adef8d..4bb8549bee82 100644
--- a/Documentation/admin-guide/hw-vuln/spectre.rst
+++ b/Documentation/admin-guide/hw-vuln/spectre.rst
@@ -406,7 +406,7 @@ The possible values in this file are:
 
   - Single threaded indirect branch prediction (STIBP) status for protection
     between different hyper threads. This feature can be controlled through
-    prctl per process, or through kernel command line options. This is x86
+    prctl per process, or through kernel command line options. This is an x86
     only feature. For more details see below.
 
   ====================  ========================================================
-- 
2.39.5 (Apple Git-154)

