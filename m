Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C6157E60
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706641479; cv=none; b=UDwVq820j2Y+4b/rCoXxJzsfaVQPKCDqv8r0pRuyqMXcDeCCpC+0IHwOtb2TmdKzAzcwd8D4HP9iGq6xRW98pOn4Ph8DQZni/PH734nG3YvoiwC1i1QzgaSu4HBOEyZ1CSSKki4h/eKxxPh6o+Fg2btER7/vqzLo9ZNMN1SujyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706641479; c=relaxed/simple;
	bh=2lxtSNzBMdkYqwC90W41TvLPqjzE8CkjIf8iMq/P7L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEB0R2wonNPqexdLw6vJ0g3w+BfNE79+g11RVZjzTY5afRzacLynqtAdkEbijFaO7MsvvWNXOm7ZUbJQaaOEIUw5ieGiWAc+Mi4hjtGC7RakyfoErkIBIXNcZmxe6xbG83KbUOMviuc1QWDWz0XU4GCSOFujMRxr/Ew5e0zvsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PLyqFGIv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PLyqFGIv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29041136f73so2210396a91.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706641476; x=1707246276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=PLyqFGIvHAlPl4Yrl/jQ0Z16cIRm5QfhAS3D9eCjPLxVptJlGtb81Pga/JxrlKJWc9
         URW/m2V9zr333LLc8pY+lFQYY07kNpXDSwtiT8DPavJYsECUCIe6RuJ0L4pJxB3BCPps
         xorLihVSD5zMahpo1hVb9ZhFyoqZDyexOJ65pkCASDGJLuUPM8dhMmm6JVOuyEf/k7mt
         8SkQs5aPhgqq7F5JlTAfhdalcg1ZThijz05y3WYFL6rplywcH4bXGr0dC6Zrjxo9Olnw
         xMQWn5uAjVt5+lWdlMdPh8B8l+z/PG68ZmwswK7VF4qtIxzU/d8cqz7Y/2WiDT51NYvL
         dHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641476; x=1707246276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=b/J8iBX4I+OmD2eMGvzpQZWiDl6QFJ9d2KPrfJCoBdnKl8cJL3Yu+BuHBzZe2e7qzS
         aQGIO6GB9ubJLKC3V7b4kyV53Vfn4jzhup18p2mfK7WfQ9dIFm6gV4NTsc24OS0PkKzu
         va0UDIfetA4PH+nMxIn0bYWPMURk7OEO3Y0mucOFNCPtUm8dTQphl1vsEkBKymSDYE6O
         l3nNmYmco7OLzi2zdFmRRBcrMGbluD4c84ciVxYSXfHpKJuxKrnvP88AvWjLrm+JDeas
         KLR8E9/QzkOx6ZXvfSAzYSGa0s1dGfgqfc3AuJuLiILCqKDb97ASr9AwTmtwTqF0ponG
         s7Qw==
X-Gm-Message-State: AOJu0Yyycas5gJKVx+HRdLQH+/vNZXMzpQo+LeXMD+lVyrHU5hpRE2P7
	/LFSUZd7E5BVQ04MvkmsgvsZLV9tKOp+cg0EzrzGT6GCzVkzFlIULSIfFGiilb9igMSNOswSJyA
	c
X-Google-Smtp-Source: AGHT+IEVbIgYt6XNaKR6BtdW5/KffpCVH/pv+Lo7pyQOi/0UoKVRKbnu4oD2c+g6OjEIw8FcF7U3LQ==
X-Received: by 2002:a17:90a:3dc3:b0:290:6878:db67 with SMTP id i61-20020a17090a3dc300b002906878db67mr5117026pjc.9.1706641476461;
        Tue, 30 Jan 2024 11:04:36 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090aec8600b00295c3bb9318sm1196541pjy.54.2024.01.30.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:04:35 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 30 Jan 2024 11:04:32 -0800
Subject: [PATCH v2 3/3] docs: riscv: Define behavior of mmap
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-use_mmap_hint_address-v2-3-f34ebfd33053@rivosinc.com>
References: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706641471; l=1848;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2lxtSNzBMdkYqwC90W41TvLPqjzE8CkjIf8iMq/P7L4=;
 b=94N9u6Dy7xw5qCDQS+0vjMBDMNCSUN+BRd4o21tz6vC6lNovWVUFsgXKvGka/gJHpv0qpikoL
 uaW/c0J2VbkCXqP7svfJ7tYuinSlvY7wIe5t7X3qvAN/WmnM2V6JlUj
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Define mmap on riscv to not provide an address that uses more bits than
the hint address, if provided.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/vm-layout.rst | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index 69ff6da1dbf8..e476b4386bd9 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -144,14 +144,8 @@ passing 0 into the hint address parameter of mmap. On CPUs with an address space
 smaller than sv48, the CPU maximum supported address space will be the default.
 
 Software can "opt-in" to receiving VAs from another VA space by providing
-a hint address to mmap. A hint address passed to mmap will cause the largest
-address space that fits entirely into the hint to be used, unless there is no
-space left in the address space. If there is no space available in the requested
-address space, an address in the next smallest available address space will be
-returned.
-
-For example, in order to obtain 48-bit VA space, a hint address greater than
-:code:`1 << 47` must be provided. Note that this is 47 due to sv48 userspace
-ending at :code:`1 << 47` and the addresses beyond this are reserved for the
-kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
-than or equal to :code:`1 << 56` must be provided.
+a hint address to mmap. When a hint address is passed to mmap, the returned
+address will never use more bits than the hint address. For example, if a hint
+address of `1 << 40` is passed to mmap, a valid returned address will never use
+bits 41 through 63. If no mappable addresses are available in that range, mmap
+will return `MAP_FAILED`.

-- 
2.43.0

