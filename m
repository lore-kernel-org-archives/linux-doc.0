Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BE73502BD
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878684; cv=none; b=S3F/EOiXTpAVXd6gWZ003MmjEqnjQsr47Tk1WvJrPCL/jhPBr5B8YdUeJKbpao3csaw84KdSJuaz3/VycX7oA5QfzPBE/mvAOG01fJHVieJ3ecbS81gOlViDbZ+ZITWaCb1yrY8HIKsDK1109sd9jkyoig23Njv+qYD+P0WWDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878684; c=relaxed/simple;
	bh=o+mupBbwLM9S2HS2KmSc2gYbDSK/gb3i74YBTExGXIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBv2InIgWyrosmKZSLCKmbwXJ93R0CWSvKa2JOqQlKJ/lN3waQn4pcWn5gNHMMihdIm6bD4QKc0mpN6uiXKrJeuDgWA3KPC8xB/TZKoBORdk5ISpu4AtwsqOIpDCjC3KjjVKmaDNGvg4ujchnaOiZ6Da2RZoYXnjBIuqudqTmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=McIF2QDm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="McIF2QDm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-295548467c7so15680735ad.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 12:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878679; x=1765483479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=McIF2QDmlMmRS6IiK5z+fC7KEpPH2atdMt9l1wAsasOvh8Pq+fd3xz6jp6kN5tiznB
         JXPad+wxfW/wbhqbrKZWetkW+tVet9nXHaRtlQvcJtEzt5C/9hK7U1n4l0n+uo/BYedv
         tM5Io9J8Y3Veydq/wyjcXHKpBOSG17jqignomYMrRwxanUhnuZ+S6ciNKJj9zjiVEKND
         GAvNE5PtM+ySINMzrt7jx5jEcCrC8G6VuTiOlOFX7+S4eJ3IPCtElhMZXFW8eTPxcA3Q
         lEP6yfVrv5jRYlQs04qinAPaznWX5/8PeWmRTkRtEt0KxK/ERHbd8jeyzZASIpsz5RXX
         xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878679; x=1765483479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=caVRo7M49OcsqhffOXnqYtJLXHun4v2kvB6IB4MWH/w=;
        b=BlNyalRW5KA4ly3Ix5l/vX2jClz43G1HG2YqyXw4nguiscEVGBakwTBTqWgnvOozcV
         Fvw27xabbIv/wy3aLF6whbrxxgzdWvIfC2dH26EQVD7Qc4MytTUY/mR8X+QeUQlfr55f
         CRkIM8Emi0x8d0B2cIJ5aOe0O/lPTEEzs/oSxIHgQ8hqO5tz3C37Ta6uGtuyxMoNf7BQ
         E674i+rN1rs8zpJK2rVRLE9Cd1OA2tuW1gLBLSU1jp+dCx+SffT8Zyw0oellZ+ilZNVo
         aMQ23eZ8oupoSb2VDhGyWhdv3zy9ergOVtrFG9THfx6XRdZ86jNfLqCJ06N9w97v6/ZO
         crGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYVnu6DGf9ODEAJ9eojF+BD+xI615rI/mNdbdBlwjn982RKqlZg6G2yw7yO9RzjU5k8H7SWbe6iCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iwtJHH+Bm7KYbnBwi4NFXvYn46Myf0KxpY44G9hhNrGT6O6X
	JP2omK0G0h+qlLvjpwr2VZ45akDeC9iV2AD/k2KAnAuBQ0f65V1bX4NmIuKvS+mnIkM=
X-Gm-Gg: ASbGncvPRVVKQfC6UEz/4PEfO+fkN16IRv84JFRl5pcl5R0+xEujuz1vLKSFd9Lx0MH
	55drkkaP/mdZMGwvLXZ7FmhpEV8TIikuM+4uk2o/ZmXWUtFV7SwlER3T6E6Dn/YRZQhClQYCFYx
	18DsMNbYvwY/UPWfMxtsUVmAIqszbswqfclavPIcdvYV+WMsvsCR+YeLmzPdN34uEyhXRSQBaNC
	aGaPfe6Y30+HXERXfXaZyUNUFkBt4XIo+K2Q2hTcDQBF4m5hZf/EILQNXSxR3+alr6zyZd1RmDX
	eIqZAS7ZMbWJHbAnrlxyJD0b5CSjkM8nkld2URkjwaT9F32HU15yGaF/rYKrhwipz4mgGdkT0B6
	6fq2+q7CgSjxO6HHsPrmDidzX0BS6SolwloEvs6MtN7ALFNyZg2w1uaFBVT4VgBQCcgaL7usaN/
	P+j+5oXEB+gxIQd8CeLXZV
X-Google-Smtp-Source: AGHT+IH8WfNOBR0WYTIAjC7h4KWRD4arxZjj56t6ot/oIQda4VPJ+vPnGe9pfxDTosFlvlQPrVkwhQ==
X-Received: by 2002:a05:7300:2d06:b0:2a4:4e38:9a39 with SMTP id 5a478bee46e88-2ab92e786eemr5009491eec.34.1764878678491;
        Thu, 04 Dec 2025 12:04:38 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:37 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:09 -0800
Subject: [PATCH v24 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-v5_user_cfi_series-v24-20-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=1494;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=o+mupBbwLM9S2HS2KmSc2gYbDSK/gb3i74YBTExGXIE=;
 b=2TL36FQBTxYHJECnsPKiEOH953BZcSJpF1TPScxWirFZpsiwieknY9HPgz7ctQuE/tNNnQFHX
 qay7b5jPJ7wCN1QiFJshFM+JS1yjoWqf4sTvAxW/wwYUz2revUqCcLB
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 5d30a4fae37a..0efc9c7d1199 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 59)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 60)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 000f4451a9d8..d13d9d0d1669 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -114,6 +114,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);

-- 
2.45.0

