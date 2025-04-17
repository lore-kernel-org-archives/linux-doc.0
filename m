Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63023ED5B
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892659; cv=none; b=Rcn0882yBgrikVvoodkQbjwpJ2Ux+u5LtV9RgFMStup1TcTjjEcTbEDP9Y380cSYh5k06ZzJ1H394kvNBxjqRmb+LO0oYfc8JHcHUgow7k2MNgjKSeNhbyfID/UzKl8E3jLSWhHyRXpqeXt2r+hhgBzpTNAct9OasyqGcvaM2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892659; c=relaxed/simple;
	bh=I8q3a/r8sIPwl9ULO4heNHCAxh6RA5hJvMvMHg5vqgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWJ+gfoEXjK+y8YFOIZaSkeO5W1OGxptFYcGEaw5kp83Gx/6I6GNd2tHgPPKR9RNzdM9b0QkQsVwNHPMOY3CNUPvtFgxn7+0FUmK7U8B8ZGKtBkHVyxTcDbfWf0z6Jf+33IAPBaVktlQdpc2yequslHkvkta8H9+7ps/MKqHSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YW0Pekvc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YW0Pekvc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-225df540edcso19426785ad.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892658; x=1745497458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=YW0PekvcepDEL3CNBicFspmuytgnbXMVpYVkMaHix670fEShFT+lc/mMY0iZaPCPQ/
         yuULSJXL6H9WfDpXS56vKkOXAN4jcZcLjPzuK9xue0TvhToXId5IztsN0w2bwF76Lwx3
         QeEHZPVkkKogjpcIp4MybW89Vi1RQaz+2xvecAH19RpZWagG4Eq7HSoTomUxYB05Z3Pi
         6rcLlbwTKsOadpEq4J4yLGQYSYWMa/0yWkEd/lqrQu8tyJaLiWXAjgcR+ACWhkQXIDQ8
         p5zBgLCLZJZqGUbZPKgeUjC2pIMq27dMoJ1XtTQf6297sUp5umm3RoEEbl5L0XvNXeqr
         5ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892658; x=1745497458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=bXUEVyKcAxxMjPjTzjAauUbi+VOdn2H1fduICnrGyd1Hnct/IlJJqewMxCeDBlJhmY
         njXf6NBBjV5DiLBIxsyP039tT5h4eOAZytDIKyZV3yM5pL1/F2a/CL6uJe1SiM0IMyPu
         f4nqrJZvKvAJ0gLlDFwTqkxAj9DU1SBfaN20ZYbmqXNePD29Av/JxkVTEtSlzrmfSLAA
         Go0t52UrkeAGSZwAX06DJ6z83N7Nh4vecKcoDco8Od0mihdgvLMWMuNkJ0UD1AGxLqFQ
         hpSmeKpoG7xz7KOmeVnAbKzV0t+jdNYGxjwqE3tS0I1qIQYcCKbq6lEcnjsvmiztNhsw
         exrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ic5ZWUOgZfstwb6Y0F1km7waf0d41kNBfQ6ilGjs58NxRF385qgIKasFe+ekNfR0vLjnQ1FdtPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyADkivP8Db9gyv3JaSMRraonA1E5dZt5GLHUYCr8UL1WX6JCw9
	1KvRAr2f0rR4lRMUUO2WphROqAgHNgZd5eVTqbFaWnvEyoSPl2SaYMO7W25OqOo=
X-Gm-Gg: ASbGncsZ3QKUG392yqFsEWmfGNnOMl+S55sVKoTKHT3LFaXBZgGf5lR1xvAIT3t9Dqi
	CHL8/O4B7sYYc0R5pLmrHcPMfJAg1UW/6Sfz3t8YGHIs7tw+kYh9JwpNPFfwsZRYPR7IXa540+k
	uL9k4cHxosumzcL/nDTIE5gFXlVmzRISh34cg/X4WCQUmPEZq7ncu9pUjRtX9zl6PmzBJ92F867
	e2zT8lleXd7IkyLbwFqN4G4mDx3uavT1TK0msql2eZFUvpEYS1z8Jh6B18wB8JlpjQK8CH28gAM
	Sx1KZTr6fpZBuOdHZnoAD6442jW0a/l4hxi67M2/HA==
X-Google-Smtp-Source: AGHT+IE0XjCz5TtIm1U/KycHsULkn93MfV8ZJ4DCUOeKjh64BtT2X4MD7ZC1hijUVKkaUKvQHFj5ag==
X-Received: by 2002:a17:902:f642:b0:215:9eac:1857 with SMTP id d9443c01a7336-22c4196f564mr40963855ad.5.1744892657640;
        Thu, 17 Apr 2025 05:24:17 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:16 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 02/13] riscv: sbi: add new SBI error mappings
Date: Thu, 17 Apr 2025 14:19:49 +0200
Message-ID: <20250417122337.547969-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
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
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bb077d0c912f..7ec249fea880 100644
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
+		return -ETIME;
+	case SBI_ERR_IO:
+		return -EIO;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.49.0

