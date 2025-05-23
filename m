Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FF227E9E
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995679; cv=none; b=KOZdjUtS9K/Ja7SuXhfU9u7/XQb7SJv6cyLpBga+p8Bk3rWAq2+Jbo7KYqS8znAX+D0U6LljO6qHxtmGDhUbySjbQmmjCfr5oBabJ2+v2RPs5E4HM7FAUwTs4hiaGEnWP3ifnLG1qYZTD7NAkMQDb7zFk+ie4VfaDa4JMOVWueo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995679; c=relaxed/simple;
	bh=wAx2RrhJgfovv+Ew3KxgsAkzj9v4q4meKm9RpW51ts8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEZlBS43ZYxvzgPcZO1LCAhwpZz+OmJ8foSTwbD8fytoTl8d154iYCS5E1CfbOYJj8/ToYGLASSy9FM9Xv8KHGIWw+WDIB0A91sNyEdara0vG3Ze9hmWrZxm69S3vf70AncYarttjng1t1OWB49gLt9b2kdN6caYJEHLqaEba+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yGDeLiDD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yGDeLiDD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c5f3456fso4571987b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995676; x=1748600476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=yGDeLiDDa6wSk1pwwlvkBwE1mZn96F1FIgH4aeYKq8ltXXvdr4RqhaE0zSSmv7DymT
         MV5Pls8HPxvbw7+VhlcX+yohkFW1BJ+7tl368LneIfWCNNpsSp9v++G1sIzP3xnFnsym
         jJ62jIAedWEn9nLclQHqSyVJN/OHm+ahHdsjFh6keODCA8BWGUZTi/UteeoDbMrsLREf
         pJQIoQCgQjw0YNScLMMNfxur8+dDqrueUcK/MSDbR5Vny6MKcTvRXbAA7xB79ztloACm
         e8GwNWcpJqZNYTKGbqUQlq2q7LpVr8QIPBF2QTwknT/u527CTovzOtxRmLvJwC4CL4iP
         ylQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995676; x=1748600476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=oXQMz0PpwzaW07kPwR2H/b1PCQZ39ljyv+dwxkQMeFVOwf5jMmnJ9OsCuOQAfoynBi
         y5JxmxwJG/6PPqbWMmUy31pPbvBPZ2GJLhEyTJkSEBtNJyLsn1OOg4b6sLvyC9NjTqac
         mQK0AyXuJL/qLCpvB4pd2Oh3AJ4wnhkzUP9quu2zF0IfB3pkXbA8xHVcoRAcc55lIWPU
         K3QC0E5GSnAx0Ds5Z9LEleFfVX6IlRbzQUdq9GFVW95LN7qlz5uLzNkVd48Dlx6SrND1
         Pdwf7bbex5FzT9pTEobJHqQB+f9BHL8Wfp87ql05pg/BbPR2wle2xlzY76KHzDHfoalw
         TNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUae5LjMu+NHtzdbmmwEEgsmAiKaHWHD5piDE77kHr36FOOWMhHsfaMNEWFrELAwDOVFgUvs1d6DhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjWANc24jocSkQ6tzrjFZRucLmdHXH1FTtDKHyoV6ZZI/3lol
	eTB1e2YwuJRLzIINnMwyjreuRLj7ant8TQQsm5pIbg/aQX/g85k/ikoLObdhwTAsUOk=
X-Gm-Gg: ASbGncv/jkFxFmA0bSNrTXhoTJea9a+BgNVDA/hDy9wT/xufZ6zrNtwdQRBGghvyET9
	xPSp6YGOZf8fOwG6ug2usF/WWpM23pS4oy4q9v7K/dBMrvt+IH9IQfMD00wgOFaFZAM+nyyMwGk
	E1HLl4gAwRoxqRLXj1JRCbwXu3X7iW2J3TJjV34/CEZwE1Z6j3lQsAlnycrNnjr5DUHXO6JrQiM
	EtraJvTd/0F3v8Py5PhomnU5tMS/BIFaJFnIzcVV+CL9DOXwshdepsTgppjCuUNQAK7w3W/OTP3
	88bPbc8kWF9hwIa0f1YZHwEY0YPgbCwK1/gYYNQuGjV6UWJp5NAV2Dv88NlURUY=
X-Google-Smtp-Source: AGHT+IHF69bbGfugVW1hk34muZ1UxkEhf/sMPEJ/BrKkaYgUPpqT3QpHbdDEt9j8Gh0ePOgA3f704g==
X-Received: by 2002:a05:6a00:98d:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-745ed8f5d5bmr3378167b3a.15.1747995676226;
        Fri, 23 May 2025 03:21:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:15 -0700 (PDT)
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
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 03/14] riscv: sbi: add new SBI error mappings
Date: Fri, 23 May 2025 12:19:20 +0200
Message-ID: <20250523101932.1594077-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
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

