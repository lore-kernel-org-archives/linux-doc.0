Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344A1AA1DA
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231292; cv=none; b=LXW7U1WF/tX2X8KD6GU0LTq9AhSw57wLiIpwFrk6ipOfr3IOjLowvjfFDtpqPj4nBQC+8mMwO78vcZLSGJD17w21ior+TgG/dsYxP4AFRH6y8iZMSUPkF75OQ0bUse3QzQkM2LWN8Q70mJb4hE0pvhQTwB6puDNZUWGg74NajGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231292; c=relaxed/simple;
	bh=EqhrCUXSdf6zw+zQLcTnzOZbj5bYjW5BfE2OxtlTOLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azBy+BjQT5GOSr2gN/HNdKJRowHZyUU0DldYoFju2W6tewmGvh4yyt+depNsWyAybmGmSbrEq6rnwAquHNUBblw9oDheIMdvyw2jBMfqarSBSgth349W+mCpL1RopAEZhjJBullh7u8tNEz1YarSBl7fSWveFiVzqc0jzCG1fuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=G9r4nN38; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="G9r4nN38"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so24286295e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231289; x=1742836089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMypehTPr85TSV6ycxYis0bFMGhRtQvpG8E21HWF2pk=;
        b=G9r4nN38XyH2HTtuBkVy9W+NwDz8Moo4aI4gGr+EwLsKq9NWxXkoYdQ9ubj4p5jFR9
         xe1kaDy58L2wL0ItOboKlW9kEIKc63BTQBcyKin+WJl/61p8w9QXJqJaREw4yv7XGf64
         xHqKGDaai+CyTVAOqD2Yh3URz1TITAzSfRn3eI2zrw4UyIVafIBi9hZOSgyfoT0Kk9JC
         xd9tvfVbZUu+8bM0foI7EsfzUIcddT1VcjI8HYvuxKbNWo0k6GhuK+IXNegiOImnCaBH
         qtL1yFi+1QxvIqRqJmc5h9Lr3749QGvWMym2uKi6Ne5EVrtEv5/oU3mVVYSlHlVUwe36
         9x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231289; x=1742836089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMypehTPr85TSV6ycxYis0bFMGhRtQvpG8E21HWF2pk=;
        b=qJFomA64EojzY5ag0R/G6f3V/Sp5Py2rS92l7yGx6GqMOgBfzxYAB3sG23zM4KyVAk
         IHewACoxrSNDokWSJfmd3/foKx1aL5d3EukogOjr7/abHxkALuIfHEFAbm89DoHlpcqK
         ciCPAX2i6mQ/Pbal6WdQ2oBh8r8qWRiduTaNhN76eYrkrz08F/k1P94OQEFjjN8ZpJOJ
         tPXuchNu5ryC7M23y7HtFPcYjXf+UnDI9NNhv29NKZylLM1nAJQ1CeDzkIs102pKx+4x
         6BZLp3jcwl/KIWacopyy6KOcK37TjvN41Sh/1a2UVVWc5UtUWS8WerOhEZ2qH9sfts3k
         duYA==
X-Forwarded-Encrypted: i=1; AJvYcCVXkph9CX9UXyOL4XzszPt6kn4FYLah1FJ9zzpUU9C82MgpEgpFsXVh4ibktSkexY+YODClrlpHADo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4euRL9a97nNjrJtDOPqTTqhNLtnszbUTjwFimJQdyfm5nbGSC
	pIEqTTTqky79SDtvxoZczCMyadQH/on6erZUpPbKc4OLfs3dySRL4mfpeSVlNU8=
X-Gm-Gg: ASbGncu7iFbOJXsvENFDql3QDzNXunyCTyhZn81hCOkd794jrgk+tOo7TB/9mC08pS8
	wKmoshYVoiDReMihddIM1i2Of1RQ8E3wQEsSiTkaZbsr9RA7N7bShembvZulXc7RE/e8/JrI5q7
	GKFBWcEkUNOJgqluUVkUQq4wMkDWe1ik7jKJ3gWjMVoxFtR8qAcVOHfU2qz5vloU2R9nGQGsmEW
	2IZceTqym06V5WooS2ZCv9v0WYdFSi7+VtXOkozLc1SF0ieCePTh1aJA51P24gPR5f+eN3wbG6z
	L5xeoGwBWn3xK9FdIotz9cfZkSQSOyagj0qNGQPQIUK9Sg==
X-Google-Smtp-Source: AGHT+IHUEfWy8vRElctY1RJYRY/dHWRIdTIpUq+PBDo9gX+Yv3PK1rGyecjDgc1lfv0PGC4CYGx5Ng==
X-Received: by 2002:a05:600c:1392:b0:43c:f4b3:b0ad with SMTP id 5b1f17b1804b1-43d389d441dmr5431565e9.19.1742231288764;
        Mon, 17 Mar 2025 10:08:08 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:08 -0700 (PDT)
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
Subject: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
Date: Mon, 17 Mar 2025 18:06:08 +0100
Message-ID: <20250317170625.1142870-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
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
---
 arch/riscv/include/asm/sbi.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bb077d0c912f..d11d22717b49 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -536,11 +536,20 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_SUCCESS:
 		return 0;
 	case SBI_ERR_DENIED:
+	case SBI_ERR_DENIED_LOCKED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_INVALID_STATE:
+	case SBI_ERR_BAD_RANGE:
 		return -EINVAL;
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
2.47.2

