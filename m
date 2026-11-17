Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884363;
	b=teNl9GEECICDhGnxuiv449qaMw26KCqvq8XEI1rrUVfsBXNHQXKTZnAXkrt3wUh6SW6M
	 4OYbrdMGn7FBfcUYmm6FAfanQUH7v3JNlEThvvWFTqLT5lG9ZZC0q78OEB3IXsUKCzHE6
	 /9OJPA//4embPndcXZhpZN2Cq42rbXgetjG2BvtpxZuUQWVdFb1EtfGriOXA9P87DFP76
	 l+9ghX/OlaVz70RyDUqlmKFaoCFdqnANSkl6yT5IlWRrDCr7G0SDoGasqQXtbVz2HEvTG
	 gRc3AyJOmLzo2ECW7WyJBoJs9Z0kQ/dG2TI4fhGTjGT6rQ1xJ3X7kMcFKSMDW/38dPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
	b=hZSv47FbM6UTU4umk9yH5nFvO1QbxMBmG0oY+zAoVBNywF1mZVfNo4dsDbjBup4RkhY4
	 Oyg6hDsyC31xVTjX8jg+CbFg5MCqo85KCN3dwa89lqqWxgxsklziu9Qa6e+Jj+9V+P2DL
	 z45jlyOQX862YSDsVxyQMEpHhZGeyOU6VHRiosQhTD0MUwNuq/uiAbHh/zwI+e+GTVMvW
	 2K0m4sDs6Z0vS6e6CoofXxL9zptqJPHydp4r9/wEtjB9pIsBSewTG+k587h6OBE4yUArC
	 llvHFJ0K4Cy4bCtgdhn6MrDDZ4UBXtHeEZuhXshZ3qJ7AR4XXpM7TIJQLW5f0dWw0Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37320606A8B5
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37320606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so10231507b3.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884361; x=1795489161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=oeuzk5Cai02QOkBVatxcY76kHfgc4cFvWlnpleAHdg9txREH7h9S63Rah3Hf8VA004
         rApn2ryC7wf3wixS2C5v9d+nxrdBRPFsqQVsMHYUW69bs1hg7TZzFPWNolRXKDZT0zpB
         zrPI97ay9iTjEeY7smrBvfuG1B6aSR0zGUUy7HPPSnMD08IctZxQr2n8499W6xc0mIUf
         Z0zjBDXEktA6Hx6B1eUYH8E+Bl22URiq+HnqD4lo5SxWvmebTSRBVDIm5qwat9HfrGOg
         7RnQTCAMl7JbXkSYpp51OxYee5NMgFK41YUFAPRxc64TzWSYKIbkAqI4ffH7HTTzDUnO
         54Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884361; x=1795489161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=PdtAOWzAlKJvbO0vPfQe0YJP/oWnwNU7lK0IPEdg7F9t8mYB4J3IjDUiApFFM8LDFs
         p4sQ6zrn09wUgfB0piBSTrP04r4glOn65cV+tGXHDaW6izdOk1Wt1g0LrBQz1j/e5yq5
         bB9rIFcb84GxLSI6zY4K36RNtbaE+3ZowD0ZFg2iV7AFjHdgm7mxSCyLHtcyc3/9siYQ
         e3DfmBHBTxBHxhF1disrhkC1kfYxKh08kuX0ZpuVGZCjaH0s1oOERQDzu5RUo8UGTW4M
         Iq4WvhBSwpSTYqUQ/FM0NeoiPnBoWZuBi+wWk3ic+I4hCiMe4wsuZhFc2BDhihHJM6PS
         aSww==
X-Forwarded-Encrypted: i=1; AL+hErHViR8NVsKfeJRHm3dWeC0tNNs37cDLuTCLhn2qAOTZVi4L9ZxF2MnHwNQFyrRqzTVkb/Ry0flf8AI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sVGur+G0lSDqyUWl85VIy31BgjLwgUxWmoO6udtEnANvKeiFJ
	aJogsWy2Q8ulpzwYWtqbalufV7RzlSrWqyR8xhXqvIGxaIb1abo2jYL1n7lD7vKDBY0=
X-Gm-Gg: AZFdTZdE6L0N+IMkr26nBbC7cPBbMefZoi8VJ8BA8ZE4eGayY6E32NOWQ2KnFGiAtYb
	aC0MWfUXrY0vd/QEzxCi2cgUBgyRrg1jBb1qvaog8LIAqAD6q5uoM9uZShD8vDhgHbklV1my6HA
	+FpAhs3IL2+1yp07984KdhSYw8seet0zKbvS2/TzbcCXPjBoVqGk0wBVYmP0iwTCBNQ+pNdqbTM
	7m79uBcVTuL7ROv1y0OCC7FmQ+71moJQMGD53bIqD0ENgSujWw0aO0MgeuBYAdBJ05fLMJt1Bdd
	vBSfU6COFulzRRukdNs83DzKtS66fh4GtnPNkay3v0tIETP1dpNa1tFg+7CZM3j0sLwMqBPZeJz
	8Fqn+b/A3ivbDc9XC5Ngug3lbU2z3hv5MvFU9eGkTor3HcHVtGh0IcwQQmdaSLbyrTH/C3Hjg4J
	6/faj6TKpFUWnwZ2CfBTody+vIBVBg0lrzE4/hei16mvynB1fNz/yYIxWZEF1QIVFLSLqvIUDhj
	2Vnt/IVSruvkhCa5Oee0Hvjb7pj9jQ+DdbRtyNTFCQgbVHVbyBfq2k1IO7tDZMe7fL731QZygAU
	N0CxeTp4leEgQSD6AP6/zOChXBSs8ogupTSDv9bFjcd/S5XKtDDmTnPod2LcRpyb7cGe1d2eKYc
	M4HzvQkTS7to8t/RqrdQve99jcix0Ss2Jm0nO1Q0A2qWacuLqo1dpHmUmDy1pMAQFMHtPe2ATKn
	9QwlbkPbtYDaZ4CrRxNnJpRWAf3zmd2K54u12TAZE=
X-Received: by 2002:a05:690c:4990:b0:8b4:d9d2:df80 with SMTP id 00721157ae682-8b4d9d2e1d8mr21916577b3.24.1794884361016;
        Mon, 16 Nov 2026 18:59:21 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4eb7f0530sm14639707b3.1.2026.11.16.18.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:20 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:12 -0500
Subject: [PATCH v2 5/7] alpha: marvel: register a platform device for the
 environmental sensors
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=5M8/bkKqDW1fR0jpsWeEFd603SI7R5txSS4IygbKcb0=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/rz1dCx72xPpqbywdN/3jC0WtSu4M80OLKmd/7El
 AgfxeiSjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmYj8jwxzzhKipG2
 N+O7z9d1t8U4jUYsULYuzvNq/rvj4tJ+ug4C9Ghh8JOjw2RRnhLwsj5R6/2iVcqOzztbHJa9uZr
 5vvnlHhYAIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 7525f3ed6b62..169a1df6adb2 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

