Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1CA335561
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708681; cv=none; b=OvUvpAD6rlmOXbECxBqryvMV3Fe+6PGKDZAR7N8s+Yv2LDDtx7hlnQwyGMLBEn1Gx7H0+mdNRochnhwrnb31PCq2THBwhXh2PcyavK0YeLU/AXbhqAmIkFMu+yL2YORxFttRwqvaWOVpBGEHq8+1mUdiOYdoy4ENnv1O2jKJ/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708681; c=relaxed/simple;
	bh=2+kl6Sx+b1b3jkOuwybxG1g4ZHfGj/c1Kxq/8N42b9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EbSQequhWmH6R6h5WstIQh+IPAheOeTAtIk2twZ4ZGKM434KJd0CVZ1cXedCVp+6rkCq6q10JoG3bQLSA48ZZMTeUl42wLoj/VkwL+qNe+9AXEay7KlelA9f9KKAfGuA5ohTjrkGst7ZuCCN7ZhLjvl/60d0YF1KSlZo0gXr4E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyW48fpC; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyW48fpC"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9489b08c211so250816241.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 23:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770708679; x=1771313479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFHY+kwDQdh2yEHJCYn420Oxm2P8lL33JJQBtOkv6/g=;
        b=UyW48fpC2HfTI8qN9lB59UKeB8T/AuMZN2NSAwT5TGXuuXZ8ypTrTpKU7LtZ/lM7xB
         yoKa6AZUxOMwG1KPhWFfgQGAJQhlEAfFiB/xTOqobNbanUeg1eBzp/WRkKj4EEiAHeXr
         iGzZbkfLIdIQNS/3NS+rE3Ftlj9faf9MGA1G6r1n5Ntpi/yJ1//JMXApvtUL06sKOjKu
         u/GhhybRKgW1DEQwrKguySV3KOT6OvUVJr+nBDSfU0+l1k9hGFx8cCqO5udSlzBZ6/Yk
         v5ZLlqjFEYcYTxvxRFi1z2Z0tGUm4eQoPkaWs5JIIA6Zs0SvJAjVtQJhswldLBoPEKoC
         BdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770708679; x=1771313479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFHY+kwDQdh2yEHJCYn420Oxm2P8lL33JJQBtOkv6/g=;
        b=R1vLN0tlAEYuhHzQhZMghASq3Qu0q3s/7/oSz8f56HIC8l+0PtLYOnCByKabdALEFb
         lmmphu1mZQpFsGTq+xOAMwLrC+8loXQfEcmuygQmfAyANRdwFV1Yjkm64TQ+lFZF+F/z
         YMeqd/s52b1SOkntUXmmmGR5KxlCKCIQGE6I3LBE2jcKtyztyb5GKs7ka51IgunAs9Yy
         Q8dhXmmy7xFIePSZdXv5Vbu8/1ncVFnyLYFzXu4aCx4xrIimp1FJwrtD2rr7+k0WbZKd
         p/LPgR/48W98R3S/T2aXLiow9uxo3ABPBIizYc7ZxQfQn4edU0ljZv6abHkzcmpv9I7F
         A6uA==
X-Forwarded-Encrypted: i=1; AJvYcCVSOyUadvGzLY2MbPZCzs7mChahvjf3XkF4IltyMolwboVLO5hGuMm3z7IjYStUfgDFb9X5woAaCOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+yO5seBAoMKy4G+dDNafIvFVkHjt9z6h46eSehUBLuW9AhANG
	Pq1S1ag9IeGjjdKOTU0HLZkOWo+gPSR6oyF4LYPwiFbnWzsy1MhMmbpt
X-Gm-Gg: AZuq6aIdGjSGxlKPnrO4bDcmq8uchM0itz2pUrqRCxj3htwSTFSMpW/oVVNRUIVBfwz
	SndzrYJwNXQ2WYO9/zvTTDfZhQtwI8dxHfFjV8yuIMJtHUZA7v5VkSlaOI82YrONdbbizZupvRS
	FFREuMDxg/x1H8MKix7LlhAUzjDQi7Aw5N4kdlw9MdBv+u7rJ6KPUKM97hGeAAAm7JdisoOwV8O
	jlPxI2ONW0JuzYMou2cNFly0tbG09h1ShGO3VFKMoQdhTIvbLepFgCWL5qC7t/mq8BSCRPZpfWc
	vGxMA3pNwpJI4W4Li6NBIH92diHcmic72toWD5bXitwBaSbxw8BNsPmJTzH933fGhyuV5qFWdmA
	dtKtC0nlJpWMl9Atuei78t1KH7z0R8KE6em2wwr+DY4LHUdmP/iRMgs3cl/tBwesM82BCxUqoYS
	Ky60M10RAmhblKtJOd2Bj0on1ozHD7kWvGMHhtoy2Y4ZnSwINHSQ5A8T9C7qtO7+LICz3Z0SI=
X-Received: by 2002:a05:6a00:770f:b0:823:b6b:4850 with SMTP id d2e1a72fcca58-824416f8d24mr11637215b3a.44.1770701888061;
        Mon, 09 Feb 2026 21:38:08 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:07 -0800 (PST)
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
Subject: [PATCH V5 0/3] Rust support for powerpc
Date: Tue, 10 Feb 2026 11:07:53 +0530
Message-ID: <20260210053756.2088302-1-mkchauras@gmail.com>
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
V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com/ 

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
 rust/Makefile                         | 10 +++++++++-
 5 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.53.0

