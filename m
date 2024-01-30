Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633F36119
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706575029; cv=none; b=e2HmgiQExE2IZ5PumP8m92whRz0GLUgRNJYt7/ibceSVSQzd5dWPHZpM/i0/2kQTlv0Kak+XuHxoC8HiSpx+eN5sy8P08VMec2FH3ypFHZrBO6ZisxqYS+kVya193U3IfSibJjbVHTUTIRHChFgdAKFbZj2PHEsnWseHaETlQ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706575029; c=relaxed/simple;
	bh=2lxtSNzBMdkYqwC90W41TvLPqjzE8CkjIf8iMq/P7L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d53mExzus5gUAIw3tDZJJlweJY8Z3YyZdZkJxAOw32Z2B0kWc+awIGWSk+TJv0aMvOR42zRz4PLUE8GdZY1KXSBrG76pOp2h2cLzIsfHnGBTKS1zMq9Hkkx6YojPM/cVJUYhKbLBr5Uf9f3mvJHhM8qr/vTS85hZbcCXukRk4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PLaCqzj5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PLaCqzj5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d8f3acc758so7605995ad.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jan 2024 16:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706575027; x=1707179827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=PLaCqzj5KKS80QsD9xfutVJAfGZdQuCFzhm9Gc2jtQ/2sWXLNdiEFBuaokF7WVBn6i
         54EIsCqvdaGz+fMdKrX6DJPDoqo2Zkckl9eW9ufk0FhmQPSZqkv8GlWA619Ztot1clUy
         wpDApZvJ5KTC+JYZ3ojBgowCahm4OKQaGYkkVoNdWYIk2+K+apfcEA15xLN3JA1MIRDF
         /Oiu6ftN4PCXxJC239+cbar7CCzHuTLhuEZOAmaHoGeuLSD1AJ97JQ/3/qFbGZbqCLd7
         PSB6A5gNa9bteCw3HZJVv+G8BsYWYSinfYEESfMO014wpz+9EWmDOtUJfxMxLq3Pk+8a
         n3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706575027; x=1707179827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=H5vPIgakylbFVQ+LbMBoBxpnIr8djxJ9IKlN4qZZ+I7qcz14lZfSS0Imauq+we408K
         pKN+AQO0zBu+l1W1bgjkMGkCmIqa+YrS4mJw7PGB4BHsAFGZ3MLAjMmg12TUxKALf9FB
         b9u4COAxcIP+L/RneEo+kUaUVkeeRImHRNmbyvz89IfmJo4TM8m3HfTf3UA957kF6qjV
         mQS6E7nhVY2LD16Rnct7iSBy4xpXRpzZXBljUsiZIAvUqvx5rXMmM0Y38tcMd5KYcra6
         cKf4/wswIitu/6mrvByZIRdH52RnNLtO/1kXm6Edia4NOcNnqXE6SLbgo8nYqYDNpKQB
         3ixQ==
X-Gm-Message-State: AOJu0YwoqIdLoJNQSfMhZZi+mUxE2optEWNe5PQAnnnmhTka5CwiZqwM
	1TFn2IfBITuHTT0yA6+40oxEB+Qd5XMvUKScf3f6kE/pC7RW2pBEP7P83i+gQUg=
X-Google-Smtp-Source: AGHT+IEZTlAiKexgxrGNCFYzK32fVsyUnQnSz1N1sNMTNGu+/cbpp6v2t6ZHXRA/nQr6fDW9mLkUwQ==
X-Received: by 2002:a17:902:aa85:b0:1d7:c27:2d3c with SMTP id d5-20020a170902aa8500b001d70c272d3cmr167643plr.6.1706575026971;
        Mon, 29 Jan 2024 16:37:06 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jb9-20020a170903258900b001d8ca3f5e3fsm3406375plb.295.2024.01.29.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 16:37:06 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jan 2024 16:37:02 -0800
Subject: [PATCH 3/3] docs: riscv: Define behavior of mmap
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-use_mmap_hint_address-v1-3-4c74da813ba1@rivosinc.com>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
In-Reply-To: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706575021; l=1848;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2lxtSNzBMdkYqwC90W41TvLPqjzE8CkjIf8iMq/P7L4=;
 b=QPhNUZqLeF06ra6K2PNPRoG2n2KtsSvNFDvTmTdvBMXOdHUuJmeRUi0njObakAeeuV1OfWo9q
 etNa+1gFzv1ASKXjUaBTpqtMsyWVZXNQhlsEPcntfZJU7CZKds0vnLR
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

