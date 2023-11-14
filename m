Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C34121C
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="r4MsV3pU"
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9A6173A
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:49 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-779d0c05959so55569585a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971228; x=1700576028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CepaQtX/sdwhUbmZetc41QOoUE9LfFVWHL973vxJ7UQ=;
        b=r4MsV3pUqHlMtM0U0eUSS3RLRXCYYDZHJuKDGcFHaMw6qb5hkSX+dJIGYacyH1qhAh
         Lhg7kY7fmo2pXm0T5kuc+p5Nxy3ncX8VwjG/UvNOBQ44lNkFhMfEjZis345yXfojY5zC
         eUDDdqtxnfQruhys9TYHAikQs8daWK7PeU5lNEVjFlg8bu6ZzyDlu6PSwYgA1D/fJ9Dj
         Fn7GFezFPsTYE6UPDwzBUUw4XNnF2MHpYMpJLxkJPy2bXEpZvEvu2TgA/2eaSGOaRoH7
         E/rWYgYy4e9Yru13n67l7byzQaopoX2AJUO0jRSYhtw4cAKkNCo8Wk/Og09Kh6pEh9AC
         pk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971228; x=1700576028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CepaQtX/sdwhUbmZetc41QOoUE9LfFVWHL973vxJ7UQ=;
        b=CjcvJ/xaOEF9tIfvkmIiQ+cMQvobfgS7XHDEp75GT66T8pXo2ziMB9gOsEivDLe0X4
         GLKgZ+3F1NtHP8GRlUEpC0Vn5ngGobXmgEzShs6AGYiFF1h7xkVUIXu5F+JQDphBWJ3r
         oTXo7gGeceT4uh5rw/ioKpShqeYt/wK2IbV795bVsHrk+PZrNUuvQ06AArqy5BJpalrA
         Mxe9jWLR+T+rO3PTq9+NfmnZhKgBK32KCgWijyJf31ljWgL6579UwlJI5mI0kl92JOfs
         CICOO3Pet5mSrCCEW2dP4F0HS4EP9VB5em0GqaIImKa4euSGmjVb7oUc0Yy85tp9gL3u
         BLAg==
X-Gm-Message-State: AOJu0Yz4fgLewRk3BNZ7FlZFlrB0mjNeSQ8VkA9D2ZRozOPmFnedaAG6
	IaiTHh46D5opuoLmOXWJtz9qOw==
X-Google-Smtp-Source: AGHT+IF7WevyrXd//n4lH0ZEXB0TDnFlHM3i203ryiy76OKa7Bcf589Sc/lKHJHt3RYWXfpjbdBHtw==
X-Received: by 2002:a05:620a:31a8:b0:77a:69a1:b6a3 with SMTP id bi40-20020a05620a31a800b0077a69a1b6a3mr3097387qkb.1.1699971228077;
        Tue, 14 Nov 2023 06:13:48 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:47 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 12/20] riscv: add ISA extension parsing for Zihintntl
Date: Tue, 14 Nov 2023 09:12:48 -0500
Message-ID: <20231114141256.126749-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parsing for Zihintntl ISA extension[1] that was ratified in commit
0dc91f5 ("Zihintntl is ratified") of riscv-isa-manual[2].

Link: https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view [1]
Link: https://github.com/riscv/riscv-isa-manual/commit/0dc91f505e6d [2]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a6ee93a3c9a..97d106fa0f54 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,7 @@
 #define RISCV_ISA_EXT_ZVKT		65
 #define RISCV_ISA_EXT_ZFH		66
 #define RISCV_ISA_EXT_ZFHMIN		67
+#define RISCV_ISA_EXT_ZIHINTNTL		68
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7182cf278b1c..e73ee4cfd84a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -256,6 +256,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
 	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
-- 
2.42.0

