Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C637AA89
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770238928; cv=none; b=JdhZKlGu4v+zNhYOrpIVLoSxUHglfp70C2/6QCMnFurWCSJGMeoGhir6Tgx1DCaYiTklfiMuQJu3aMq44Z0g0Y2GvCWxe00DmjHCTsLEQHmAgc/JkeveMrU2J9A7D8JijcBl9GxVjrGUW2kthmRXyGM5+BCGcJ4T+txgqbwsxM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770238928; c=relaxed/simple;
	bh=p8JSze9MTbaCaWUpLefLyVZDUMvthf3o2UfG/zdocXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I4BNLJC165ebjNBw9wV9Bf91ui0xVOk+H07uBZjSfdYfOC0gAStF4pAU66WJIkRwjgJDJOlLLq7InOM1U0uKIFrf8ylLHt7C2UpC66GzUz/6UyblObgf/0JKBR7SiNWHhlnPJoMqLzq2oxbuRGXSlBc6z/F5uaU7LT7ahuu9rcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giqwvfU1; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giqwvfU1"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c551edc745eso62289a12.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 13:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770238928; x=1770843728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2V/4lpM1tyoivo3E/+Mz0tbhlWt4A1di3YB0XAjK7Lg=;
        b=giqwvfU1rJfocNW6dm8YXTDnxgSDxA69I8fAWLsGKpDOK9F2JXd1MN4TFaLsEfL+f5
         gPepSxDh+EzroNYJjpwWutCkYlsK5oZkfaD+sQ1CK2AKEPPcAeTqBmB0CXXljHCPDv+/
         sqUKHL/l7mElMAdnUC4zh6I+sHd/LtoGaUyYfvuloV4yi4tmjIqvLF669wcoBxiMrmN8
         xkN+tt3PTxDTPMgEgRfd8/DP1wVzhy4sPhNAuquhTdCV2lw93WZSV2Jrci+tEyBYeA2f
         LAQGyue3zrwHiJi6DuwyYcYr32pvXy84LWAi00mQP9hVUJDgE41VBPOA5OKcz/KG9WGq
         tzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238928; x=1770843728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V/4lpM1tyoivo3E/+Mz0tbhlWt4A1di3YB0XAjK7Lg=;
        b=LAGU5FteOViIqwXlK97a0L7AWlghbM1rBA6FF8+4ZWEuzA73uK0TY7BGkaxReWzMRv
         tKfCpEKaOaToLPVdaPddWiRRxVPsCvD0nduS2VKVvqi+u1Q5Q6hVVkdOiCmb+gAG4eh9
         FR4QYcpeffWHRaZDbNr9+jaE0Soq8TjkItQ83RlgA0U9p9Oreu+0LXl8vO8FususPDc0
         XdVp/jfVGURJZAG+kShEWK0u4rJq9GKwUpWg1p50xpFPd4HKAbaD35mT+V8LTlGOpNCM
         WOdL52OgOq0thoZGhC4kUWC/RA47hEh0jBf1fpsCpP7mBNA0dgVnXNDA7MO/YIDZ7L+M
         2uJg==
X-Forwarded-Encrypted: i=1; AJvYcCUjQx6sHpFuqb4PLcEWCacqfOwbj+CgjvyT3LOnEuy25Yt5QeYuZneE6H9JuvYVI9Kmtf9zYpuNqlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXF6+oBN8RKOwY6zuHw/p+XNYQIiRIzvNgDm3pR/oL+mwHY5sH
	9pIzvZ4DS1NhBgfI5J84r4wbdKbwdunejJ+zfaqaXu/DEzV+g3+pGuHV
X-Gm-Gg: AZuq6aKhdh01CV0aBArmpeq//t/zL3494ovKt0wv5svxGAxr74bY7JEFdX/Zws3xPJJ
	hXEEdWwfW1nW7Qol7tYEBJDMpp6CV22vVsfz20nAbw179One2WYcFgLHAxD23HIXrbMlltVFS05
	aLfVuvuVYoTD8rGXlRdw+Gk6M4WB6wFydQfRmK8icAYBU4TDVT8IFadXkoeRO9ATYCQuh3CbC1c
	7HUDjGuPCnBaeD02jo6114Xpcd9pBbcAH52OZHgbSVyFMpZR5jqhscOFRS+kICF+3rIBe8sHhxA
	WE90Xq0URZPt/GsaLb5iJEIZm89xS6ImdMHJkL/P19VgnWAwwqOVys4jBNlOwcV8rDOr/kk1mOi
	IQ9gfAW58MIs7LhcAW/TQrRw4srioGd2d1k8KWRbipa98r8vR7KXkYFwSptj1Ay8WcJKi13qETD
	tgKBL1Ix/DH5WTuZnxd7hGles2KvxGgeGCrKeTRjP9KMYmnDPOTg23S9Lw6+P4t8Mw
X-Received: by 2002:a17:90b:350d:b0:341:315:f4ed with SMTP id 98e67ed59e1d1-354870eb613mr3795120a91.10.1770238927704;
        Wed, 04 Feb 2026 13:02:07 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:07 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V2 0/3] Rust support for powerpc
Date: Thu,  5 Feb 2026 02:31:22 +0530
Message-ID: <20260204210125.613350-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been 
merged over it. ppc32 needs some toolchain fixes mentioned in the patch 
`rust: Add PowerPC support` and the discussion for that is done here[1]. 

This has been tested on powernv9 hardware and power10 pseries qemu. I
I request Link to test the ppc32 part as i don't have a hardware to test
it out. 

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 Documentation/rust/arch-support.rst   |  1 +
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/Makefile                 |  9 +++++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 11 ++++++++++-
 5 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.52.0

