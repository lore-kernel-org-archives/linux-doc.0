Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5854F276045
	for <linux-doc@vger.kernel.org>; Fri,  9 May 2025 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776842; cv=none; b=VFHqWhusd2P2ohiUa9NF5PHDcQshOA2hEwUERQJzgBEoN0NsmBc3HOkOxOFUApfxsf40ApWTGYWH7Bf5+CmHVGc+NoIIukILVFFXjXANW7Az8gnYsQD91ozy24rQomXhjjMwLYaQ2CFLnDNQPkQR3Qklm0BeN9zlXQPGZUvKndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776842; c=relaxed/simple;
	bh=kSKKgY850CX/ifrD5dVjlw2AkivsGza0IeGifE5IqhA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lOPfYNSt9IjyQILh2QDC0PhhV9L2rOmYdvSBVymokOOF3L8Em77t1vu2duYO/8tuo0yJWPsyZpXkI6jjgoPk5KDSMzyG/j5VOa9dK0UJNlEVKVWsFbRX2jvRiluaEVCOatATHpb5PRM9yZuJTlV7Hr9KUpuQ5wvBMQbJfVNCrxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DUmcRCL/; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DUmcRCL/"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af59547f55bso1114776a12.0
        for <linux-doc@vger.kernel.org>; Fri, 09 May 2025 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776841; x=1747381641; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTLAwJfpzTnDn2tZfb8KpMGtzN7vq08hC8THCvjwurw=;
        b=DUmcRCL/eY9FVGa9L2ee8C7kOWdNpbg/gcFN2GVVmw18LjLnNNkhdRvkHWBuPKz9rq
         F15bd2iFalMyw9jb5f7B6iV0/m6L/UlQZqCEtFcvPJjJjgwlry6HZGKeWpvhYiFHLHMY
         oS4FnuebRTvocfi+FGrAJE8JtobctZEs8Dm/+NMZzAArfof6o8pwHb2sRDtsx6B+YYS/
         mluEhFFkxDB6A1Xzk0ZZSQ5pPWbEMUzDy16OVjqvYtpGXSxnVwM9Qb+f6jwREkFTNnKd
         SnXqvELAjSj7j6dGt6hM/txNgtcxt/sU1pPFDiVxJ4I4Ss2NTbiueEwQFMiUPk/qRc8t
         M19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776841; x=1747381641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTLAwJfpzTnDn2tZfb8KpMGtzN7vq08hC8THCvjwurw=;
        b=YyQlbe6Io/ks1RDVgtmCno+90FtIk6BCzEC2y+kk6RnjPTDMXpH3dRxhq2UJe/2Cra
         zR1Q9i2JpaYy5C3rza8TCQVkcd38sQDyUT7Qepo9bG3IkrsmCeumYniC5KJrWgzWHLKD
         8u+oLP1kJYo/F7Qb+N4pqD+B7+GpNGj3H5044rN2hkTuZBk0u7ZV4hUGecFXPzs/M/O/
         6g/iIntIBSPNPOujCkmZzIEdak8OMOx8PU4gYPSJOLfQyxClPtlPQBXn7WNFPaAPzDyc
         p2zGY98+v2MlH/5cNP7/B6d9eJphXJj5sYfTyI8UiTPAEhU0GGzHiGLVSseL2uax1JLc
         /iww==
X-Forwarded-Encrypted: i=1; AJvYcCXiIgFEhY6QEvNQz3Zg83zw8D0QRJ489MtOd8/00cgO/w5O0oM0d3QZFhERIWH4uFifmR4oEjGhJ/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWb1rYlXTPHO5Cg0N/rpsbuEijaMjWKSct86mw9hwGy2Ponrn
	+KyI8DNcpzdvnT8GFgKIvW8h4GU3NvF7gMuuuEjaNJ9OR+ikaGwUBe2TKHUbQiGDnG1l0HBpvtR
	Z4jk5LCnMulm99rah0g==
X-Google-Smtp-Source: AGHT+IEztQLwT7ajncZsBNt/V8Xiws9Mgn93m4FZrCV2u6FrzGGzzz/PUz6yE5EWUGsiWeksHLXg/JFNc4GUnrxd
X-Received: from pgmw23.prod.google.com ([2002:a63:9357:0:b0:b23:6a88:a54f])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9004:b0:1f5:55b7:1bb2 with SMTP id adf61e73a8af0-215ababa2afmr3522816637.6.1746776840848;
 Fri, 09 May 2025 00:47:20 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:32 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-15-changyuanl@google.com>
Subject: [PATCH v8 14/17] x86/Kconfig: enable kexec handover for 64 bits
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

Add ARCH_SUPPORTS_KEXEC_HANDOVER for 64 bits to allow enabling of
KEXEC_HANDOVER configuration option.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6b..d1fb81ffdaafa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2029,6 +2029,9 @@ config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool X86_64
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
-- 
2.49.0.1015.ga840276032-goog

