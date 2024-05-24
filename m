Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B94084D
	for <linux-doc@vger.kernel.org>; Fri, 24 May 2024 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716576988; cv=none; b=i84SnWEWN/4NOkeXTMHtJA7V3J0YxTrqk15KCX2j9rsRlgL/+vKUD7X2ydjGS9up6OvMdTt+98eelXvEUlibWQklgOXAbrpjbFXCn3rCWEcIo/EvmOX3EQyuB+F4k2lB9Qq6JbMaCc2sgbrZSI2l6x/25KBDQ7AwA9w5mF+Ol9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716576988; c=relaxed/simple;
	bh=EnRUwxPjMwARAQhkc9VptC1FFM+vVJDf4lE+8efMjmY=;
	h=Subject:Date:Message-ID:MIME-Version:Cc:From:To; b=m3wzQp/wTJjQaLJQeOsv39Q+tYM3ymfOEFMlm22nWjjYUkl3qSnYpHwAUWr6ZJMfzsRRGnK5va+9N4U3GhnRFLpshyDs6M+BdAggZhuVORj6bkU6kYGhThgmQyv9NUYmdvqQncdnnynj3fL9DLCfGHpPZ1SMV9B1Tu5Ri3Z91Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QsmUEuva; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QsmUEuva"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f32b1b5429so21514235ad.2
        for <linux-doc@vger.kernel.org>; Fri, 24 May 2024 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716576985; x=1717181785; darn=vger.kernel.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xLUodbpWlHV/m1Bt2U9fTwJmOlm4ytnN9TrwQjmnMvY=;
        b=QsmUEuvaApp4KX0juj4+Xy3f7J7Nx/4zsj9O2XA2CakDNg6ofjYhOc1s2dkwJrOwwa
         yoCZOr1FGiKg4niD//zE7JhhCWu/4l+BM7dp4VMYhtdco/7nPzj6MyiVT5SYCWTOteqE
         jkU1MuvyGd8EOvsLB/l5fet1aYRwFrwpk66cyQhLdrm+FeSQHsdcSAVNdUxrdQD5bMhr
         Pg1vKDsbr53SUl8HQsKMEjQ/Clq6DzOnjttyOr6MG3mxJ8eOA8ASlRdlO6jbIbd0oxgA
         MvEi3xVSj32lqATv5cqvUIwpfXs1Cwn8Y+4hAKQ7bpw/isPJ5GyRfkAojgHE64piNDXw
         sHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716576985; x=1717181785;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLUodbpWlHV/m1Bt2U9fTwJmOlm4ytnN9TrwQjmnMvY=;
        b=wbIVjTp6EBBQAIycaTT5he5LDiiI4SfYsVWzLfMpu8i+uJbnlkvwr7IazLGo/aJBbz
         Caunt2hVjFV82+2GcBYfeiAhCnVGSMtVtJPXrGRExEY3RrJSN8gT7Xrs/qKsMCa2lCYb
         mmhrhcLf7F1zlFWZObV20bWBroh0T8hgzSXqih4t7q/GZJmz4c8mGj/Vwa9eIjzXc2oF
         oIYHAA1ukk+h04PcKonnMQNK9wtwTUxzbe6ScwBZ5MKpMhkPWN5Lr/yhZ1fBB7WFW6ar
         5NVH7urIKzNuyx7xgoV0hQXh8io6VKcke6wqOBJMgfPQnuW5Scy6PLwEWHVX7vF0eS8J
         s8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUi5e+a6q+zFW+imgGdsZ7FGQ/owrMJ5uDvJ1EE3gzGRW7TmBMzXyM6WaXBuCZtoD/m83f1/Gom7ldjGUkOIPzazY+UIWuXBbtc
X-Gm-Message-State: AOJu0YzY/1id/Oior6dgfPu7zdvjSkC7ojRiIxVJBp2jdGDlqxVNv8cF
	K1gxbXvAEUfOhTpyEMtBd/dKBobO8oBuX1A0lbhpv7u1Gv2KNsswBjT5HTqEzIc=
X-Google-Smtp-Source: AGHT+IHmjdtRpnISU8MeUC5uHlVT+aFruq8xOMm5QCnc85cjYN6x/xbnArZ5Bph7B9WPdNdkHZeeug==
X-Received: by 2002:a17:902:e746:b0:1e4:3909:47c0 with SMTP id d9443c01a7336-1f4498f0d96mr42599825ad.62.1716576985229;
        Fri, 24 May 2024 11:56:25 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9c7f32sm17084505ad.281.2024.05.24.11.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:56:24 -0700 (PDT)
Subject: [PATCH] Documentation: RISC-V: uabi: Only scalar misaligned loads are supported
Date: Fri, 24 May 2024 11:56:00 -0700
Message-ID: <20240524185600.5919-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, costa.shul@redhat.com,
  Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To:         linux-riscv@lists.infradead.org

From: Palmer Dabbelt <palmer@rivosinc.com>

We're stuck supporting scalar misaligned loads in userspace because they
were part of the ISA at the time we froze the uABI.  That wasn't the
case for vector misaligned accesses, so depending on them
unconditionally is a userspace bug.  All extant vector hardware traps on
these misaligned accesses.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 54d199dce78b..2b420bab0527 100644
--- a/Documentation/arch/riscv/uabi.rst
+++ b/Documentation/arch/riscv/uabi.rst
@@ -65,4 +65,6 @@ the extension, or may have deliberately removed it from the listing.
 Misaligned accesses
 -------------------
 
-Misaligned accesses are supported in userspace, but they may perform poorly.
+Misaligned scalar accesses are supported in userspace, but they may perform
+poorly.  Misaligned vector accesses are only supported if the Zicclsm extension
+is supported.
-- 
2.45.0

