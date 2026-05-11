Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDC4611CC
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521397; cv=none; b=gldp+oc4pHobcSLH7Xy9C2ssuLimbHNlhr6KE9REHNYxprg+gXVmuPf9iuTSVDtF1GhMDFLnhTY31HdLFlJE37f5B/NmYXABllr1GA298nM2yckLdZGYkZVntf1GApYkzfE2duqVSENoc6VO8snN04/ghM1iNLlXYr23D1xoEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521397; c=relaxed/simple;
	bh=CArFcwjTin5095cozOfSePPZOWMOInw10+50zRtmwNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbN/S6Dv36OgAJ7CzSg2YdvkxeHi2vcDOVK/yFFBq2Z5HxEQNTFYeBYg2Be/dVUN263DNq22Lac6YBeWRBV+Cwo/pQuVNQoh0r8c0uyPCfBAe7Xp+wgb3Qs8Xn8xqoiN8LN+crizftNbomBU+ngCMRxbcqj9tY82OxuKx6KRCsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxb5qkSI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxb5qkSI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so1984277b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521395; x=1779126195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ7LCTa9KTtIJAgxRtdGfVpbgkOkteisYlLfo08fBPc=;
        b=mxb5qkSIZBTkEhv28t/mHoiD4GnXLitDpTdurT0hCKNi2KncCgtqfRunabTfoZNBHR
         AN4/XXFLBwSt5do81ANgVvEWdKmPhQRSNlJ4djKe9Ce3SH3jVvBwnqRkuXz6sFqXeBmN
         6BpVl7BdXIc4MZtsTYdSUZIjjcQAQe0JMec1g/1EnADbz9GJAIub1Kp261qtyMrZ3uG0
         IuIh/TwLDhFOmARbpEmDLEaO/j1sH2CZ2wR7iByf1Ll0xD7SM9f92QQiW1VvVCsHfeUb
         ZjiKkYoBWNpNhfgALMBiDGmjCmKQT4ongrh4BJHzOQWEJlK7gLX8b+PzXt0BOZVwMzpF
         C1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521395; x=1779126195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ7LCTa9KTtIJAgxRtdGfVpbgkOkteisYlLfo08fBPc=;
        b=iHCbvWhz+0ls1TnfAFmcOWjUACcw/nqYiVQy724xnmwPaxr/3DlTDxhaMGuvsl8Mjr
         0zAi1AZ8hvBN/6WgS9biHFUYCZowXgfcfFOZ2N5ykpqk6Bk09zK4aDc1n9Tu5v3hTGME
         FP3qcxEHYMFgu8TmRmNrgjpYX2DGpLM+XK67IkOIa2hl8puo+sdxoW1mZ4uj6BRxHXy/
         eAHomaeI6n+NwLFe8Nh+Ynetzmq7xeDqDA04AQlK7mxmAvN8ZZ1PTiV7oS38zXHb/tNP
         RL95FE7wW6xUR5K5oOkZ6MI2Zf2pZuZBolDZUZatl6jKh22gHiZI+6hTRcFaKUnPLQ65
         yKcA==
X-Forwarded-Encrypted: i=1; AFNElJ8Ly4xtWPZ85fMkXEw6zxlDzqwSMH0A9Gsed9wyL7wOniSD1Iso5cCo2m8FRpEWbs4Ym4Dyezy9ct0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK3Tm+iNYFibFvVZpv3f26moQyejU2r+s9knnsvyDOU3uBefVv
	9eP0BZaXVW88eJvJKDNCwwAkcNVdqRP5EKOafPsR0c7WLL13p9+nR90K
X-Gm-Gg: Acq92OFQQAdKTck218f6UjsUXmTupefHU44hK+8bivg0+zMoHOZkioXPScTw22JoE11
	uEbp/NvN163+iK0CTcotKVyD82UkygXGIkuGXOupB23OVAKlXdzkY54Aoh5JJz7AlG451EYiHmM
	ztDtllwVsrItv9CBiJoxWBHpfZFuGwFfujkU4As/XRVgw4BVp3v3bFar5UwSSpfaAM9PO3Gl6Gv
	umFONeuO1D7k+sgCTWrq9lO+g3g0kNifLsOfB74Qu88n1TzVG7DT34A5Zo4uO+a7rxhtZL0QXCO
	YTQqu4WWnxn2q9+CnK8fx8RMOaFRbi5Cft0Im499mQY7Yq+zE7OSU6aAq+uG3Un6llnOfzVXjdG
	BPaAZ1v1S4KxDEmyqWTZ5qaksqxs049PFCEkv1Shw1X+f34ib/Wr/bT2zq0QLGxy0EUqqcpzxjd
	2uuGpsUl39wuIx75ZrGoEioSAxDD1/BOMqmN52mH62dmQTqiwAMUUoVYt5/QHtCAAY2u2E8vvFm
	+QXO2k=
X-Received: by 2002:a05:6a00:1f13:b0:835:a682:a6d7 with SMTP id d2e1a72fcca58-83cf4f75f4amr14356959b3a.4.1778521395343;
        Mon, 11 May 2026 10:43:15 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d34872sm21398723b3a.22.2026.05.11.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:43:14 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: pbonzini@redhat.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	seanjc@google.com,
	michael.roth@amd.com,
	liam.merwick@oracle.com,
	vannapurve@google.com
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: kvm: update links in the references section of AMD Memory Encryption
Date: Mon, 11 May 2026 23:13:02 +0530
Message-ID: <20260511174302.811918-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace non-working links in the reference section with the working ones.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/virt/kvm/x86/amd-memory-encryption.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
index b2395dd4769d..bd04a908a8db 100644
--- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
@@ -656,8 +656,8 @@ References
 See [white-paper]_, [api-spec]_, [amd-apm]_, [kvm-forum]_, and [snp-fw-abi]_
 for more info.
 
-.. [white-paper] https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
-.. [api-spec] https://support.amd.com/TechDocs/55766_SEV-KM_API_Specification.pdf
-.. [amd-apm] https://support.amd.com/TechDocs/24593.pdf (section 15.34)
+.. [white-paper] https://docs.amd.com/v/u/en-US/memory-encryption-white-paper
+.. [api-spec] https://docs.amd.com/v/u/en-US/55766_PUB_3.24_SEV_API
+.. [amd-apm] https://docs.amd.com/v/u/en-US/24593_3.44_APM_Vol2 (section 15.34)
 .. [kvm-forum]  https://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
-.. [snp-fw-abi] https://www.amd.com/system/files/TechDocs/56860.pdf
+.. [snp-fw-abi] https://www.amd.com/content/dam/amd/en/documents/developer/56860.pdf
-- 
2.54.0

