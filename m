Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9FA3B7B96
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783169730; cv=none; b=kweShzkRaNOnluVp/yADGJEXHTVDjub3NR9gjjoNzGfssncK1Gd/XukGQo74DJEp1hNJEIPeeYGLHHOdLEbbwg7N5WotkM/qNtinTAZTXOMUriP7VC2ecLCnbCpjY70Esiv2oRbQS/gU1N8gpFBDfHPOne8ABvL8Th6YLFKdoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783169730; c=relaxed/simple;
	bh=TfSvNkj88SMASukNDGfI1axuHBi0mfALdOBWxxiy204=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g50EVaicRDmxzysFEWnXj2G8v6TaVHjCGKNcEsYzW4H+yZa8FCyElx4yDsHjriEazvXHYg9hSnDDavlLMZBUW/W4JdhhmZUrMqE4yHSUPF0p83GM8JnBcJPqirvieiIFuGQNFNA+WLFfOEIgrNax3K1gzy0ZHV73uMNJKp2GHE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qU/JApL8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qU/JApL8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b1710405so8213945e9.2
        for <linux-doc@vger.kernel.org>; Sat, 04 Jul 2026 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783169721; x=1783774521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eblQv5ca6SGoXkljG9ZnkDdABmDkB1WE2yXMG8f0RgA=;
        b=qU/JApL8ZgZeyMrEo2bhFTEMei8JUKNJF+YETGzXYi0lD3fmFHK8z+8XleToGSU8tY
         cpzqS4cT8NG/tMCZzUtDbYwr5Pr9k4zsOCf+lFK3+Sz2rHq/DiomhhGCsc3EbMSPCaqO
         oOVDWq/MNG9bFVzjCpPJ9D1CPZE97X7IFVmrGcOtNGbj/SxTy/TRtbRRmrInzpAnvnZR
         QxkJNLZmrI/Dqnd0VWixBJhvs1S7TRpNogtU+uGVxfTMcYBAW9JpAiEMDw5zBkKiNdp8
         6fDX7kW0ZnM2Sjmj5IYTQ6uQpXTtzE/yG+Ys8Bgq4y3Un/1Z6ywCRvwPihQi+yDr/JIX
         YjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783169721; x=1783774521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eblQv5ca6SGoXkljG9ZnkDdABmDkB1WE2yXMG8f0RgA=;
        b=MgpqH3Mfebhp1nVy3TUOJOWwJ7zrOAbRZ9v8+b2w3Zw8HojnsveswISzUoX6UZjYSu
         WyMiKUf2SD2HdEeIoiIuMk3adJxzgvzLP4S6m/fShazWpI3Ynq7LQRUm7QV3cXzf0gwo
         0olUBWizFSvpTIulqpegtY+TAiWoyVCvvjmIX7zT5ktSGiOx9tFfDyulOb/ied+If5w1
         34QYh8dcPJxaIz0CTYLfigdyJDL6NocLygi3MGkmnwuBB7npiKvPfkK+3YV3wYPj06Mi
         EPok6Y/CPqiBSeDcwgnTUZp1riKikUq2nRwTzRNEte+8LfIF1VTFkOyoNWE0jrzGpBqN
         g6Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+UXwWGBj3qdCQbRqH0LaSm0VvBP5YbxYVUOz97OL70cQ65WbESoc1lhMEyw8yQdYIgBcBrjI7rEIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9A79KNh+FS0YUfuaEfHwj7raZS4+tMqmYxVxzuFNpJldhQpYe
	c+lc1nhDsSDiofr6lcsZrXhRREabf/NkYkOtQP/StFORVrynl4/cTnw=
X-Gm-Gg: AfdE7cknXnCnfKc0sPkeY8WeWVgttOu2EgIK3bwTWzmXsGnfKP4LfhoxBiHrHXFWIqv
	Y8lvOom2fwXOYl8GIYL0sTPsofklt/l3jk7SQNP8CJ00tM9AMRbgPdH6zw8b3hkKxtjML8AACgf
	ZTGo++A16DBeCNp0Mz3VExwFdgUR4MRys4WqZRp1D2IgoPIJQOoMOV3HX4maZ/b0BNkTV6kMk6K
	D1Djnsc0x/cqFzvDlej783D0ygZ6+4q5OaYvUm+QOfqZ0DQ0QfoUqrYUTxlXhqjUCYm1IUQ2Gk6
	pGmf9S3VietXi4t6crVgy/B3sx6Ll1YM6WOoKQgOxwWhnHEu/Vzxpk9QFH8IRYA6jNN/O6vnPEw
	FeqG0/z9Jn3wFTxnJtBFLGB2ERxxU1+FGeZDhZ9XLvOdylyIadT8VGQBZ3K/knYeD+3PcjbXwSs
	1YZHP5/tcunRCVCY3SMNehagCP16WRfYOO1DgBY3mNHJ6KATX31dLosadeq6ngHV0Z+Kq4maQ4+
	iyRfgn4WAvPQROeOsOyLA==
X-Received: by 2002:a05:600c:a00d:b0:493:b764:ff98 with SMTP id 5b1f17b1804b1-493d11d66c5mr37354465e9.11.1783169720765;
        Sat, 04 Jul 2026 05:55:20 -0700 (PDT)
Received: from localhost (2a02-1811-371f-3300-5ff3-e509-432b-2e8d.ip6.access.telenet.be. [2a02:1811:371f:3300:5ff3:e509:432b:2e8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm361195465e9.7.2026.07.04.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 05:55:20 -0700 (PDT)
From: =?UTF-8?q?C=C3=A9dric=20Hannotier?= <hannotiercedric@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Hannotier?= <hannotiercedric@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/arch/x86/amd-memory-encryption.rst: Fix typo
Date: Sat,  4 Jul 2026 14:55:15 +0200
Message-ID: <20260704125516.49944-1-hannotiercedric@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MSR address has one 0 too many: 0xc00100010 → 0xc0010010.

Signed-off-by: Cédric Hannotier <hannotiercedric@gmail.com>
---
 Documentation/arch/x86/amd-memory-encryption.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/amd-memory-encryption.rst b/Documentation/arch/x86/amd-memory-encryption.rst
index bd840df70..92edb26a5 100644
--- a/Documentation/arch/x86/amd-memory-encryption.rst
+++ b/Documentation/arch/x86/amd-memory-encryption.rst
@@ -53,7 +53,7 @@ CPUID function 0x8000001f reports information related to SME::
 			   system physical addresses, not guest physical
 			   addresses)
 
-If support for SME is present, MSR 0xc00100010 (MSR_AMD64_SYSCFG) can be used to
+If support for SME is present, MSR 0xc0010010 (MSR_AMD64_SYSCFG) can be used to
 determine if SME is enabled and/or to enable memory encryption::
 
 	0xc0010010:
-- 
2.54.0

