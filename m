Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B1A394
	for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 00:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713312915; cv=none; b=Iw0BAlbgIozlaBcsb/iiRhlFErrAxkTh6PPMZguomt/5mQR3HjHqQhoMdsNPqjKlbG5Ps/29C1Kukem3Ff6jDWaHjr74L8rIl6rjCT4FiJSvX1hNgKI98kZAYtjvKW1ug5IoIauqOku2B+Yc5QUMNZzEwdEiLwD4GutJ/THnots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713312915; c=relaxed/simple;
	bh=AacvfWgUXUIENBNEnwfPiB1vP9BLM+sOUlSbsxnKkKE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XeymD7tvMhp7SVKWsN27l64HJPz6uIfP4Vx0OWWNVR1PYTOvhkkySmd8EMnZWF/N7Bl5pOB3S7K9zWTiU+Yn6CxSstCvTGO9mTnp1PNdJxaFSsIMgVmQhDon2/Ju99GX8FWODmTvKCsCkIDEgi+ngIpv0XkAvx2Ecd6GzdBaie0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RNyrZRwk; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RNyrZRwk"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc74ac7d015so6354401276.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 17:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713312912; x=1713917712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m9VfputrxLnVngbwQFKyRzwQMY5dHXwAcsvKFnPKLMI=;
        b=RNyrZRwkUL+bfRFbIaog45oNyBmvXY3r9tAP82PtSnGv1o7cu6uOm1rnyRxlYgCvEw
         r8mxybDZ+LAEnL2cMMy36DsjgfVCDgZQhihVTamO764/oj3XTHWddAkDNQ4w64h63e2n
         4CHjF5NeA3P1t+vfUNY8gTBBlxUxf9MBmgv6n1rYzrfDF74tEw9V/Mz5fIuPLx8Qeyop
         J4oWITpf1Sr3a2vWqgjvUgu0HVURLPje0W8dQf9I49N0pPExSSPItdF7H2XgmBvjzyg7
         5OCahzws77hAgo5IQMOo6Xxdcnm8S+Xaz4XZl9G51ATHhZuuGf4cc6pm8eDMvu+MrvZb
         T6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713312912; x=1713917712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9VfputrxLnVngbwQFKyRzwQMY5dHXwAcsvKFnPKLMI=;
        b=TFKcIgoQB6L1ITb7WtF5t6SuG8SjZGvBP1opaHlf08JbBIkMyxxLJVJftKyVU2XHIz
         64oonl6KxpkdVSZZRAxzCl1HxXWEznRoqG/bEntZPDNEc7vea/rsi1G8KuuggtDE9WF1
         v87hAOpisMKO3fqTOFd5jtDbM1efNyoIPdqlFXRttKRDVQjufTnV8B7zh6semSQRS0zY
         C7ca+WGYGoBSz0Bh7weSbfRfdhuMGRofWsyUn6wv0ETFPNr/xxbJJ6OallRcxlk9yzK9
         aGN9Bu3cDSklLOuanWCb9uiAoGDJoRT1yCAemkefm5KL+XW4b+DCOgzgw6p9XGTvrg4H
         RHKA==
X-Gm-Message-State: AOJu0YxrUwgiAiG3Ds8Nc0EMeBjhg0TjSHiKzZyHpBC2pWv2KhPIc4DQ
	OsyaTt4NpBqZh6Yl4+fjqZDi8Dehx0bhDZaj+QZISmbnZ47ZtyfGBE8G02g9B2copqjlcBOhNXt
	rqA==
X-Google-Smtp-Source: AGHT+IEsD1OB0gpWHFEKLasEXYUSKqQne4naFc8D53c4PKnQiTM/HxL97vSCDZ0CgKo+9+oF+XItMkUdtiU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:c0c:b0:de1:d49:7ff6 with SMTP id
 fs12-20020a0569020c0c00b00de10d497ff6mr1198221ybb.7.1713312912168; Tue, 16
 Apr 2024 17:15:12 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 16 Apr 2024 17:15:06 -0700
In-Reply-To: <20240417001507.2264512-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240417001507.2264512-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240417001507.2264512-2-seanjc@google.com>
Subject: [PATCH 1/2] cpu: Re-enable CPU mitigations by default for !X86 architectures
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a generic Kconfig, CPU_MITIGATIONS, to control whether or not CPU
mitigations are enabled by default, and force it on for all architectures
except x86.  A recent commit to turn mitigations off by default if
SPECULATION_MITIGATIONS=n kinda sorta missed that "cpu_mitigations" is
completely generic, where as SPECULATION_MITIGATIONS is x86 specific.

Alternatively, SPECULATION_MITIGATIONS could simply be defined in common
code, but that creates weirdness for x86 because SPECULATION_MITIGATIONS
ends up being defined twice, and the default behavior would likely depend
on the arbitrary include order (if the two definitions diverged).

Ideally, CPU_MITIGATIONS would be unconditionally on by default for all
architectures, and manually turned off, but there is no way to unselect a
Kconfig.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lkml.kernel.org/r/20240413115324.53303a68%40canb.auug.org.au
Fixes: f337a6a21e2f ("x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/Kconfig     | 1 +
 drivers/base/Kconfig | 3 +++
 kernel/cpu.c         | 4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4474bf32d0a4..a0eca6313276 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2490,6 +2490,7 @@ config PREFIX_SYMBOLS
 
 menuconfig SPECULATION_MITIGATIONS
 	bool "Mitigations for speculative execution vulnerabilities"
+	select CPU_MITIGATIONS
 	default y
 	help
 	  Say Y here to enable options which enable mitigations for
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 2b8fd6bb7da0..dab19f15fa57 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
 config GENERIC_CPU_VULNERABILITIES
 	bool
 
+config CPU_MITIGATIONS
+	def_bool !X86
+
 config SOC_BUS
 	bool
 	select GLOB
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 07ad53b7f119..bb0ff275fb46 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3207,8 +3207,8 @@ enum cpu_mitigations {
 };
 
 static enum cpu_mitigations cpu_mitigations __ro_after_init =
-	IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AUTO :
-						     CPU_MITIGATIONS_OFF;
+	IS_ENABLED(CONFIG_CPU_MITIGATIONS) ? CPU_MITIGATIONS_AUTO :
+					     CPU_MITIGATIONS_OFF;
 
 static int __init mitigations_parse_cmdline(char *arg)
 {
-- 
2.44.0.683.g7961c838ac-goog

