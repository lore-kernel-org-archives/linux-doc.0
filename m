Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD622E83C
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758408; cv=none; b=E+5ViQgVLfc3GmqTWnCdb3TVpGLBKeFrLQHXCMaqYNkViMrdtFdqFk3GnNlrpeHmorRQN6TwzGeqxsxUFDkWjfXHliWli55JEDCm+SLeoAu6xa6IyIXiOyCtyH9WmZUdXS3YBuLjCMD9qy1xrLQVVxAKwu1oN/vKXrWJP5/yTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758408; c=relaxed/simple;
	bh=PhKEoN+nITz3mq+Rxa9lTMFAzGT3it8i5Q5BhN3fi3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEdR6P3xahLC+2Sj8RYjOKKnAiZBZxn+DdYtFdK544Co2u+ukwNdPLGc25I3xRNieNZ4n+Ac0MBkCX+cVDSoGfqpUQFbdLVZse8nwTc4IxU3EzmGpvPTXGNXi1xFEIMEsV5FgrigtfkaJ7l9MQby1y+C/IjJKC6N1N82qaQ9SDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=E6GMCV5q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="E6GMCV5q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so3902307b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758406; x=1711363206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4G89K9j8VE3g8Gv9q5f0qrofTIdr8mBhI0SxEhSzJo=;
        b=E6GMCV5qMYTId+tYKWI8exj570tz/K+kdWfIyG8hjKDEryQ2Y3/Xvz1iMdv3aQb1RI
         1NkMfdVKEOG4UbhTTcrvtDlfBgx7dTBR7JrkqCrKd9tpSegL9CZZTrGQ9lZ6rKMqNDZF
         VxelemgD7MMiATpOpcZXGoMpucl8lBQzb5MfB46Uu1NRYJtmeI0MMJ+f8xGODsfO4Q6J
         RZr0JI8806X8uas3749VzewfbrZOq72ND8AWgRiU7nkNLJcQ/LaWvKafE1Z/V7lf6e6L
         n22LfHuX0Fmq6hJgx/VxZYu5OTatg3gbrR+OCsmH3teoVlgDMQxiH1PZEt8mhI4I0p3z
         NUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758406; x=1711363206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4G89K9j8VE3g8Gv9q5f0qrofTIdr8mBhI0SxEhSzJo=;
        b=C+pJnvIHRmiOr/3dJUC7OXyn42IFHZTjIadmzgfdBsiWY/LEjeSfQ0ZM4gLTDLgjgQ
         MN2ZQn2en7zqtCBtmm6jSbsbsEXbRCuBaxPLysJrf+q8WoY2TD6ELeaxd+gYJx8gyaHQ
         yfmd6wPiHEIV6gQ1V/D1S8VDs0CvomqtMZqoJKv/iKnxn/TxQR497b9gWcl6q8SOpmDt
         HOzIOLIL0oGAhFmyPChhF6bVSwmHJFq9PVynPGqBu+DkwGrDhPG8vlIUFmOd+Ec5iJJ9
         snJMGSsVqIJrEv87VXVZSWO2Ii71YYwYRZoK22z4DcVQwWtS1YJRKaD9+XogtKLV0Q1d
         jBwg==
X-Forwarded-Encrypted: i=1; AJvYcCXrB+1YGabgWD04WZfjmFx0ZCxiNGkNqAwGQfGzCNSBtex5YkKkao/uYCrLU2pfYfHbdtYZS9z6EI9Qs5WTk6wAdLg8c/FFdYFv
X-Gm-Message-State: AOJu0Yz0JM2foL3hEIUveropcZSsBHVwNGwVfJLsWU2kfBmpeQOIyBHk
	zJjaOu7TESVzn1RA6eXHWMia/wZVLQvFszVakg1JjGXUfGJvcZVywoteW1WaLrE=
X-Google-Smtp-Source: AGHT+IFqB79dONowSawpjuYLz5TiNWn3yO3qpKw7DuwQE8lzbZJr+AjO3CtY2R0Vak78UgOkSbTFhA==
X-Received: by 2002:a05:6a00:1813:b0:6e6:9c97:c712 with SMTP id y19-20020a056a00181300b006e69c97c712mr16121332pfa.22.1710758405008;
        Mon, 18 Mar 2024 03:40:05 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:04 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:39:54 +0800
Subject: [PATCH v3 1/7] riscv: vector: add a comment when calling
 riscv_setup_vsize()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-zve-detection-v3-1-e12d42107fa8@sifive.com>
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c

The function would fail when it detects the calling hart's vlen doesn't
match the first one's. The boot hart is the first hart calling this
function during riscv_fill_hwcap, so it is impossible to fail here. Add
a comment about this behavior.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v2:
 - update the comment (Conor)
---
 arch/riscv/kernel/cpufeature.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index afeae3ff43dc..db9fb90cb272 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -658,6 +658,10 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		/*
+		 * This callsite can't fail here. It cannot fail when called on
+		 * the boot hart.
+		 */
 		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but

-- 
2.44.0.rc2

