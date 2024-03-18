Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3CD37162
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758419; cv=none; b=ArjuwZehBu82cXeDJYmGMKH+G40zLCv307gZQ0xyqibLbGE/ry2SV0uXY+Cl/tNj0zPu0xxbI8NnDkc6lRh0f4CA+eK+a9d5mlByxY116U8VNp8f00Ty+ijfm3uXc3u1Cya+PiTycWLpB7AQa/Hg9HX33qYSxi/l1vSLTSherAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758419; c=relaxed/simple;
	bh=3S9fzgrhpr37e6u603MyEzK4ZDEnNNexKCWCZt2/GWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYfGsla+2dy+fbcjHfe/E3KJI+LFM6QbHpNIJbqGQ0yxsH9zV0/VC2hAoYvR03JPhxIXQKCISqmIO00rf26wPwv9nnKnqUS6gcoJdqz9S3a30Qo0Jb22bGGbgNBCLCGng11leAl58ikCp75Vkw1NBuf2QHxBmpFcjH1SSXfEQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=C7Vpf0UA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C7Vpf0UA"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so3129906b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758417; x=1711363217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=C7Vpf0UAl332x6//PdJikgLnr75TqvS43a7IDWNmdLHZyiVfUYebtRmgjg9kQtUclq
         E5Cv6Rnpwg/szC2X7JmoKN70SfJBkejc43XdsFzFird/UKdX9VG7+nXKvLm/mgsVhXZ2
         fIwg/oeftG/dsRZmRnjF3qQxZyxqfy9ttYSsq3/doh7IBVsEen51mqMf94vWn08bkWxf
         whRcLwZG11nsYR6sYCD57KpG2c6u6sEzMtrs4fciyMvp6Wl1he8CKsTkJ+VIRlpaIzeI
         bwLaowqAsZsPYMkp5BCz2oQSlTP6RFk6kRjgUmDaO/1hiuPJpN+nx+IOZw7Rpv6aLFZm
         ukbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758417; x=1711363217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=uB4sJBhNDxfgiZMU4BVnWbfoqLhnl9T/0DRaKqZF+w5fKOvI/NA/yL6CYd38eKuqIJ
         XRDoTxkQ1adxcHt++rMMQTxlIia8XU1j4bKw3cufz6rxDH+aNRGPlE2x5W9fLpOVQHoZ
         XHtzXR9v6CnFc1QW9aD39LhkKV+bAch3cT680nlvk70lItlk5Y+J7f0MuCzWSYkFnHqu
         7dki+Ex/cviFcknGssf0/Kb6x3ITY1WalX3Masqtghbazg6j2pd5d7LYDgNmV2emLjus
         4c5otvIRWf7kmJ4fgG8d5411Sy1UkeHOqDzQDcYn0ckmHkEu9eimf3hKFJBw2o6yW+DQ
         X2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWfHkFM+wlvfP8coD7eJBvkiEw8uG5/FtZx5fGagjJGhzxA+6ntJ4vniG550x3M3pCt3iXK+Xw19FD0PBQF+lwJE3ptUa7xZcF
X-Gm-Message-State: AOJu0YxQ0jVYdi8TMng+d/1VacmTXtq/+ph4XzotC5RXbTdJAVuC+U1c
	EzdkixYQg6hk7qMz1Jr2OXKkzksc047DtQY24pl5wvRmdUFy/b6+gT/oAbwYfuU=
X-Google-Smtp-Source: AGHT+IGA7ENajAXygIvHMDvo3jrNxFzvmQ16iQc/gXb9EOfl1njFlKoIYWJx4IXelaDE1hz5NLCwCA==
X-Received: by 2002:a05:6a00:1491:b0:6e6:a3b3:923c with SMTP id v17-20020a056a00149100b006e6a3b3923cmr12692171pfu.6.1710758417599;
        Mon, 18 Mar 2024 03:40:17 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:17 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:39:58 +0800
Subject: [PATCH v3 5/7] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-zve-detection-v3-5-e12d42107fa8@sifive.com>
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

Add description for Zve32x Zve32f Zve64x Zve64f Zve64d ISA extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v3:
 - Correct extension names and their order (Stefan)
Changelog v2:
 - new patch since v2
---
 .../devicetree/bindings/riscv/extensions.yaml      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..cfed80ad5540 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -381,6 +381,36 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zve32f
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve32x
+          description:
+            The standard Zve32x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64d
+          description:
+            The standard Zve64d extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64f
+          description:
+            The standard Zve64f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64x
+          description:
+            The standard Zve64x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
         - const: zvfh
           description:
             The standard Zvfh extension for vectored half-precision

-- 
2.44.0.rc2

