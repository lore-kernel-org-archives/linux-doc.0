Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D02417C2
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768442785; cv=none; b=Lx9zHVpiepQ9rgvECQnkrxzMq3fRGDdGQ2y5ffbJVDBANSRpOfa9keA+9VTzpJFAabMpfonbyKhLI9iyBrr6I0zJKNt9irByZlqSyf13VHpcjPeUAcRanL+MpTxJ6w70Lj9EV91iwPHU+oroeo2cdV2fDNiCRv1y81K8yR4uUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768442785; c=relaxed/simple;
	bh=ivn8qt3qtOtcFgu+q0kk1YYIE13gmngy4cnYQWDGEK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXxd5ODv3//eonP+uR9laytvJsLuIcGWiCEnvBxzvzUWFnSKbo7s4MoWhej+0iTHZyYnnZuLaWQEJQX8/mUVaHefycQmcbMSxV1ZpqBdiwLG8QlaMTX2g8AfJqQI9iFMxqWSUwLerPkyalANcLYndQCU1lbWRDQrVK3rjP0yYzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YN3Lyrcf; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YN3Lyrcf"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c52e25e644so40768585a.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 18:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768442782; x=1769047582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puth6Wv7pkNXWqWqMPPrzQflQ0wnF2gVjRI6DfFw6z8=;
        b=YN3LyrcfwyQgOmhQzYi3V9mYjGizjWVdxdzi1ckXFcnVxoRgM+mYTnAK22I56upxze
         u1E8eBNyVdV/UK3PK3lTnaS6Jd1llheKx2lQcsNtAU22VJTHrWZKYdV0+fSs8T8937jH
         mNqpYxiyUSYqhFX8VYdHNh8YsRRMUCbmD6aLCq4TJNwiB38qnppuWa00/4X/GaQ1dmk5
         0OYdITyPZiYAP1KWVNrcu64qzMB3bFnjan2PbjlEBbb8f4W6W0cOn8tPH+fkVXXBJTEv
         //E18Ra/D5IzX6t/F/p0VIUDuKZ32U3o/6W3DbTjeiPo+OIljirq3idbBcEnN3ZZZsX8
         CrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768442782; x=1769047582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puth6Wv7pkNXWqWqMPPrzQflQ0wnF2gVjRI6DfFw6z8=;
        b=LZlEhCh5w9i+vLs5w7Woj+Kx11K78sXO6jHNTujkgTyctEPEcuqwb1+mCeKWMl8W9v
         jNROvcdfJmaa/xXc45glCE7ReOgf85TnfGgiS1KiCtCSX34Gj6x5g0dFrp/lijXWCWpF
         QkX52I+o58TQe8WUkZlJgPptKM9kV6nZMeKnjgCZo6DH7kMEa8gH0R8iFhtAOB+kpooI
         CKaW9CJneG2E5Egd3cZN7mVQMnEsOZ/gQv8UfwibS8Ki0Tq6/U4k+HC3GYG921L1WsEj
         LYzhap/7Bnr8TGARQ9sXhXO2heFZwxAJfGxWnILPEs2EKopKZompo1RzCqwsAgvHNUsY
         ZRyA==
X-Gm-Message-State: AOJu0YyukTBMW+/oOT/Pvt7BupBFBNgFOU+HkvmAs+EKd8AJptyYq1Px
	jcHN5AM4V6iJbshr4A+73xilqRtjQM+rM9MfyUust6+IVqp6abTYcQsi7iqtf0t9
X-Gm-Gg: AY/fxX5t65BuLpXJRzzTU2795gE9KlEVECepiQdu6gsCuDCYFgYT0Dc/1mj/VxRIBgv
	RZz0upDfQrTHkEm8m3E+6D4il68QLfEywkZ6QAblFN+zanIElNjPleR6X3bTAwGM422s4OJGV/2
	uCyokDGipUTe3AXVKzSKsUZqBrMUM6ODpnbn0WY1GhrZ+uILiRGVqzR7qiCBg6/IlgwtkSR5VRj
	iUs7W6pvg8a4QzmidUy4yByM0Kleq7gGZP2prrakydgfEB5Thbfr98m44UT6VTTVYoEFSINZq/u
	3I8ptNKOj3Mr6OB8FfMjCzCaVU916SIVbUC/ib7dEOvZBFSVL4EQE0kvY19xAR3b9cdQZckraM9
	UnLl3+R2hXcRDZ8o2kEoZy1wnfUEazoC7ZEZcz7wbK6IDO3GPd04IyJ00xJKPXDbco5nLKN3y9T
	1Wf2gpVicCXRUsysmgeRy8Na4xkaODgERgOCSXc9Q1ovFP+Ew/ztf3
X-Received: by 2002:a05:620a:4092:b0:8b2:7536:bd49 with SMTP id af79cd13be357-8c52fb05591mr737490785a.12.1768442782037;
        Wed, 14 Jan 2026 18:06:22 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.94.102])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530894ecasm313151085a.0.2026.01.14.18.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 18:06:21 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-doc@vger.kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
Subject:
 [PATCH v2 RESEND] Documentation/protection-keys: Mark as available on AMD
Date: Wed, 14 Jan 2026 21:06:20 -0500
Message-ID: <45127739.pHGDlbCDJk@daniel-desktop3>
In-Reply-To: <2728119.mhk5qWAgFL@daniel-desktop3>
References:
 <3647894.L58v44csPz@daniel-desktop3>
 <20251119215038.GHaR47rlpLKZlu-m0y@fat_crate.local>
 <2728119.mhk5qWAgFL@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

This is shown on page 78 of AMD document 55898 "Preliminary Processor
Programming Reference (PPR) for AMD Family 19h Model 01h, Revision B1
Processors Volume 1 of 2" for Zen 3.

I tested this on my 5900X via the program in pkeys(7) and
`grep ospke /proc/cpuinfo`.

Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
---
 Documentation/core-api/protection-keys.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/core-api/protection-keys.rst
index 7eb7c6023e09..59e7c178af4b 100644
--- a/Documentation/core-api/protection-keys.rst
+++ b/Documentation/core-api/protection-keys.rst
@@ -11,7 +11,7 @@ application changes protection domains.
 Pkeys Userspace (PKU) is a feature which can be found on:
         * Intel server CPUs, Skylake and later
         * Intel client CPUs, Tiger Lake (11th Gen Core) and later
-        * Future AMD CPUs
+        * AMD Zen 3 and later
         * arm64 CPUs implementing the Permission Overlay Extension (FEAT_S1POE)
 
 x86_64
-- 
2.51.0



