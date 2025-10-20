Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114EB2BEC5F
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 04:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760934089; cv=none; b=eApyH7aPik/FJOaAC3TFEFFoAKpfQPbvC1hvWr58qDq6fS+H+/cUUWifn2Lmt6z7Pv/fLBcBY+LggzRs11+l/O4fGY3XMM5Kku+T4fpPgQoPF7V+CsnA7BmYre67Fz/a9P+6kI3KSI/edecOMtWHFWDFM/S24qDrtFqNxHQJwB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760934089; c=relaxed/simple;
	bh=+YpuvhJCI/yShT1rtWNvOFpxGI7l/ehsFRhKIaNPItU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2wCz5DcrF3AocJMmHty76ESEHAMqDetw+8kdd3lfvv5dtZe48Fqpt5Hp2INalJakery6vcupDuPwbcwdDhcmRqJhEzAIR47IiqVbcMzJxQ46fDZDxIjZFapT8QIKKtcGIK0QCpQLNUCkfDtWXf6c1hLM9UqOGKruxyoOk8sBPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JAwoh/o3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JAwoh/o3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27c369f898fso57348605ad.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 21:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934087; x=1761538887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=JAwoh/o3l/iy2sFi1ugjUdmHcjBCKevt+8mUOi1sqitp2FwVzGYui3vaZBOuiytuPT
         e1QgVvpp8M5J2ent8fcwzPtqA7OxuFbUDUYhKVO4Kbhp96nSM5O5t+VXW7j/qC2NcDx2
         6xEbZ5nnhwBGTMxHfwBZjfhnuuljD+Z+WTzEz/o9N71R3A5ar1111AqE3jcJCEJR6AlT
         9QI0q9WlWcKyNqJSz5mApRiEwnVH2gndZhW/zopueiEBRED1jTgJchUZY93SftSQ94C/
         DDQVY/VCrnTGtWXCarpbGgVly96YeFbemv55XWqGgSmoTT4c0Cz0A2LCvcZp7DK+9Sc9
         KbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934087; x=1761538887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=ea4gueu83298ATnQq9Pr0wBSlYx+aie6UyA3xjJg4jgzvO8HoBhcYHjzQjYcgpdTi8
         TRt2A9bcglEaGR+kjzwWpFri58o5rtrASeNniZcVkUZNILo47lezsHOyI4oI2BFxmLp5
         9p1N0b0HiSuZP8qdLCHp86DSTywxOjYf0NZahVHCI0l+v7caUwxtTYzPRF26IDfK0EH+
         a4OeSCCv2oswpQdDqFwmeCJiYy1lUEZhCUuKcJ1Xts6RJxTDaoKaxr4japjtHcwOC2se
         qFISyjoLPPmiOjnaWx5K82ps9mzB68IF0s3WqmUqaAffRNR2iwteTmed9KsMVz3Inlxk
         4rBg==
X-Gm-Message-State: AOJu0Yy7Ew2YsMmZt22PoW3aa16F5rBna1IBOpXbd/pR8A8uznzq0ZCb
	tRrgPtlVZU1eJkKxnRv7W8mDbngCFl5j7x3dWiy2pwKpKcMfFP04xYAfKLqDLVQ+Q/Y=
X-Gm-Gg: ASbGnculpyjte/y+pfUqonYiVxj8M9A/W9UCiRdk0UxHysAUXqEQSPozE3fXOdWd102
	bn8ZialxOrIgIvt1e+1FW73xf0b4/bfknw9e4+YqNfIPicFLVDSQrPfVqign6Xd+3VrJoQWbHxv
	7eqpOTo+c+FCGrsyWRdnz5MPjrOIIuvFe56ix8POE2wSqOH+MU2wkeULq0e/Ip5t9OdaL9jzzeV
	n6HQbqOpNptQOhysF9Dqot5/eUqpCuoTbKt22eVDWXBGbOPPJ/0x75wWQUNBlsnLXf1Wg+t4eW6
	dTw8lm/BZsYG6GB4C5QFuF3Zz6phvMTZ3DUoKi63Y+qOShjkACTtLdRelh0Yywax6vwrGnPaO5m
	KqVB9+NO4rPPw/jKrfJOmyQTtqVelShE1lOJeDlWl0AkqKCsMdJ3Hf6El7aPQdO5kikJiKbY6wl
	EvNzUS9z5XWFVq7KGTLH1YFRGvMAgg1Q+99HPzB3NEd8Zpo02RBHBXDFOCPDGyk/4Z+viajzTtS
	Q==
X-Google-Smtp-Source: AGHT+IFwTwTOglfCAcnv2eeIJKbKLKoLeYRBKMVD09UkBscMOUOH5n7kgqBF6beeLtv4Tcs3gbZbaw==
X-Received: by 2002:a17:902:db0b:b0:264:70da:7a3b with SMTP id d9443c01a7336-290cb27af60mr170024945ad.49.1760934087485;
        Sun, 19 Oct 2025 21:21:27 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:27 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 02/10] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Mon, 20 Oct 2025 12:20:48 +0800
Message-ID: <20251020042056.30283-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description for the Zalasr ISA extension

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf534..100fe53fb0731 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -242,6 +242,11 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zalasr
+          description: |
+            The standard Zalasr extension for load-acquire/store-release as frozen
+            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
         - const: zalrsc
           description: |
             The standard Zalrsc extension for load-reserved/store-conditional as
-- 
2.20.1

