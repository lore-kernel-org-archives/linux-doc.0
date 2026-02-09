Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBE3368290
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634508; cv=none; b=J6vk6oBv363tFWl9+4yUiBtImR65SjdmjTaxFYK/AzovgxfERkgm1gfzIDKCuA43Ljh6YAhBMDqr0h4WdBqgxHMUOTbjg/PMAq7SUMwvhCd6VCJO2NfH5duQA4Ul6RbBb21KFXbOaQJj2tj5ZyNGYkerAY0Dtvfv3rjOk37Enmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634508; c=relaxed/simple;
	bh=1eLU8G1BLPMcyqLdbIe/q+DIa1xk84N2EQx0B+Jda2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gBlDWMN64omW+U8U4jHgmitAZHg+3TPg6ssxVYfjjfgNjmARKUDtHViEBP4vngx+NVXOE7moTMsfgqRLHoYzJdsUL5B0CIvbe7c0xmnyQWlbKiVjDp5HVdRuH0oqJvy10+YT9Z3XPBeaqF3H6m+JxyVzuoVwpn4Z+l2IG84/qTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjWBdGuA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjWBdGuA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso3245885ad.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634508; x=1771239308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNqlTbhyZ28IS/AUv7WMI6I0SLBfjfBNRSCAUq4S/FA=;
        b=BjWBdGuAl6GBQUWK6A3v3iwrldwbNszaCSBKk5DfGqvao2biDc1UdyaGpL0SjFVq1+
         Sxt3ySwVDgQ0XMPmQRTKz7ucWB9CCi+jItJdDsMfRIFbKmoIFnh81fS7+GygBMDtqZ18
         pqTLV4eXxND4EHxMpO9tBjK4dxNMH0LedVUi8yeHNI80e6AxybPdvcLumX+aGeUIRDEn
         VL2dt0196n/2AgZhTLsZC/lRhp8OysuGP/oP46jAHzRTxW6m+leV9nCTnn1mH4QJOfZ7
         bDFDE/VO2uCPdd5QGulqHgpQEC9Cq8RbwqnUBw8dzrvh/W/nixre3/ahRSdp7LkvJnhB
         9f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634508; x=1771239308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNqlTbhyZ28IS/AUv7WMI6I0SLBfjfBNRSCAUq4S/FA=;
        b=xNVARCp7Vv38HuImeDJ6FlwtC/+nz8Qes1+ML8yrxOTsJF27c7oThlRazgvkBqW3n0
         0i7MzMbNeC7TrEGeAX3cTCW8Ye0K2OPff9javEcqvMYA2MU1tY/pC2qZYHONTUpfU+gU
         PEEuQScVFE9IoUyfrPrZ1baw4mKhus9D8GCVNrsdl7q2oENmV3buRLBdfV4m5LFcYZiw
         mTefs/PTcUUw7/PuoDjT3pIyzgAMN3DvnCRFsLB4be+JqastwsGeCStoGGaWgwNnpcth
         N0tT9f3XABYoaUrpnImtSz9Drd71S3D+irIfaK6DxEKsEQYmBDmLDEhmtPOQfujgdJDT
         syqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWitAV99xhH8IwCr4Y8rIDMaE3Wvy+Y2iqBsboeEdS39QZGibHVNrQclPMktW7AfmBg4SsJBdzzzRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHc7h9mWY1Lhyazu62yQDIq0wkU0rG1CKIWpzs6UYm4bX7C1LO
	0/rb7+lgn5HGrNbh7x3V3KZKP+dmpcwSYcvAOc05aW4eBpiZIpgj79qv
X-Gm-Gg: AZuq6aJ5GTmGi3VKTj4urRwwmxWUQd6liralMAlno+cUzy0MqmG5vPeDCklF/R5MbYJ
	04vHKUmETmCvX9TWJBtgmmRYfZOvq8CkFiEcMR5CRiDg6E7wDBdm/Ui9AutHlJPT77nxhP7yC9S
	1rkmJ7yLv0FGjzmVe5tnJSYFfMQGGe9ZS6flZljwMyu3QvZH/VLa3GuiXhvrk8fTmnr2IQ7F1LO
	aTlhAC7KWAWiJ2XcDMQAeOzFuQNoiV4cYd+gW8K01PCFuJixKy/dMxT0zTpauO2WmiyqfWimum3
	KOyFnVRjpaeyZIPtOCQWC9nN5Ojgc2h7SyHTZ3I5e/KiGSIrCwV39p021p84z4lbQLt/C1Gpxbd
	FhLSGtw4WvqfyKQ8znFGFifDPdI3Z8s8qoJcvxK5GRrjqPZRxqoKEmR0gHj60kvvVpQizExE9JF
	aNegNNb/M+x1stwW0yIDxhPqqmApFfkSIV2Qoy+ZwdV+U8jxAeicw9QKqZIeQ=
X-Received: by 2002:a17:903:3c68:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2a9516d5821mr101672885ad.29.1770634507668;
        Mon, 09 Feb 2026 02:55:07 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:07 -0800 (PST)
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
Subject: [PATCH V4 0/3] Rust support for powerpc
Date: Mon,  9 Feb 2026 16:24:53 +0530
Message-ID: <20260209105456.1551677-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
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
V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

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
 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  9 +++++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 12 +++++++++++-
 5 files changed, 36 insertions(+), 11 deletions(-)

-- 
2.53.0

