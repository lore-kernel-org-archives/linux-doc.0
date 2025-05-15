Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF528AB07
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297430; cv=none; b=NFRyy2eKLqX1thvDMDkF9DqFd7Z9rFrF1oEenJwE2JreWUqpm5ojj87NWpZa/8RmRsni+VHPFsyIAX5Ze50N+qVbzFLhvy2y+omZmAVSrYopxbiZhQm2Bje1JfZBd8KnrrH5di/e2ARRul/A9Qd6XYmiADw5PO+XDiMEYYGdtmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297430; c=relaxed/simple;
	bh=wAx2RrhJgfovv+Ew3KxgsAkzj9v4q4meKm9RpW51ts8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OH7mDZVBX44i+oxSKilaJ/sr/dlTv0x9n6FWuW43xdjf6QTsKlSGWYL2mcMLwFV/03GeuWllaqH42rjaawhQaAQbDQi9zsEs/m4C88Oc+DgzCnN4b9gQsFpuVc7cthtqXn4Kr68pCjzvmUgvIiItnaQWLb2a6YNZBSRDeeZcpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CkTwN0U+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CkTwN0U+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so4148475e9.0
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297427; x=1747902227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=CkTwN0U+wXFIJP36JouWLff3HSYTCenGXDrB8sdRCoW2HMGRfA/xk2WKMSkaEXfhjZ
         agxuaLcwiDOsCX+V8iKW38ZOPFBY7sqYk4kBxkuVwestpDMHV5hwAoiYL6AjK+CskL8S
         5/4lr9k+NYHyOwClgtRZbS+CUUw0UAsK4CsiTo4TYRjSN/Ike9pJ3Svrbp3xWZ+fReak
         XcAjtwvavcxJ2fBo0504LTtxAZckRQqtJdMVi6EyggqCEU2vKOzFNx1b6qLI/Q7EXf8W
         vof0r8GhvLc/3j+ps12B81PUzTmqL+7eklowf2szelKr93uGFomLwZScdnpP46zGxVdg
         89Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297427; x=1747902227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=Sv5gO3SDMVop1Cov7gtl8NxiCu27yn/hbAkpyjiNgy3MQv4nx1to9b7lwNPktcLn31
         Ize7xQYsXYrVVslBd1KgLqaxx/dyLrDXqVuqWZ11dOh82QzXqewKmQtg+PxDKuNSpUPb
         0sRQvo6YewdiyhJ/Eu21XzEAe0tltv/ePHMUbEU9AKGfv7v00HDHQWQhjG1VNUUEoHbH
         1R9skCacTAIYdRIOIQEuKZ85q/G+zy6TIbJby52o2usRn9prvVXjOMM79AkzH2faF+tB
         Docl6aY1FmjD1gHO3qUaFIqUcjU/O37E2F/JmgneVIjsAfbkk3n8Bwgv5eK2C9jOqREl
         yLbA==
X-Forwarded-Encrypted: i=1; AJvYcCUed/T6+WI3Z44YthlCdG/KTRYPO9wkF2BJNTHuKJz+hX7axqMS5qLgcdgK0A6IlCzIn9NIRgszmdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrxk/WN5loG122iC1l6VdwZALbEziBQCWOiJ/e2axtmHDQ+pUx
	ZqJ6ZIYPvMJ4F+wHfUiu4RfMJflvFjGZOaSWFqhUCnFlLNypCRxL5qjCSirRkwo=
X-Gm-Gg: ASbGnctR/bI7EJZYKLvVzrZuHxtdrCgMjs/C9RTBgcB8WDX1+fAVaNEX5gqQOwOXV5i
	VGO/JuPrHiozN/4OaQuuwnquhHtug4HlKLouL1uEtK3vqZN7Ssl90q/w3ARg0t2g4NYRa1bAlNL
	unhFamGTP/uRMHMNzAp10AQEWLYZ72T9TQDY7l+UkGA33Wdmv4Lw1FF9/p6O6QFeY/zpNUiNVl9
	kqAth58mMyvyDsX95+B6A4Q4mpx3DfE+Tu0u06lbW8ZE4YctTrh0PKssfns+sja8YoMr8i1pgq1
	bzL9B8myTWNxWD4cKTPQn4AwEOcn51qNk1fH3+OtxTGu3z+EBfc=
X-Google-Smtp-Source: AGHT+IHkZNQbpAw1wphnseKXwk4yMRcZGss2iiWcC12RxGFa4TAsYttDPas1NVsjc2nqofvNADAfDw==
X-Received: by 2002:a05:600c:828e:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-442f850c4f5mr24840985e9.13.1747297427334;
        Thu, 15 May 2025 01:23:47 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:46 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 03/14] riscv: sbi: add new SBI error mappings
Date: Thu, 15 May 2025 10:22:04 +0200
Message-ID: <20250515082217.433227-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few new errors have been added with SBI V3.0, maps them as close as
possible to errno values.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bb077d0c912f..0938f2a8d01b 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -536,11 +536,21 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_SUCCESS:
 		return 0;
 	case SBI_ERR_DENIED:
+	case SBI_ERR_DENIED_LOCKED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_INVALID_STATE:
 		return -EINVAL;
+	case SBI_ERR_BAD_RANGE:
+		return -ERANGE;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
+	case SBI_ERR_NO_SHMEM:
+		return -ENOMEM;
+	case SBI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case SBI_ERR_IO:
+		return -EIO;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.49.0

