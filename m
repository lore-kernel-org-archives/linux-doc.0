Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406027EC9A
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 05:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349916; cv=none; b=SvQnmtckI+wQaTxRuEq8vNARKrWprT95IEcGYNqKKJVpNF/pcqMspgYjtIsGEa1wgGmf90gDSEn2SUuysfwPCl9JgoLCnykxhbUI3VpEC+jhFcNBkkl7DXd4DEGc45IZADUh7Krp6IhvuF4bim5fUxl7rac5d4rC8VaFfItFqU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349916; c=relaxed/simple;
	bh=P7C9GqpaZJrvS6hxF/Wmcee7Yst6sesv5bGQXCO5egc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mU46JLppNXwFdolykJzvW2L6M5I1EYY6JJ+jqVKiAyJrMYewhVWa3DHAJ65/JPk1nUzdGz99G1EzW4FpguWuOzJT4OlOydz0HtMl6ZRh7nvWhEYNZzKtW97rJ6O3/xoZV2fwnaYRfflRlMpYGUnuGw58gO5m09MlnG4ryQDDpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DCmYmBt5; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DCmYmBt5"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-72e26093f05so590761a34.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 22:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349913; x=1744954713; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+F5ZVtp8VQ2jTtukTzm1g0sjnjetiGa2oNQPDhGJdk=;
        b=DCmYmBt5fSVsoSj4vnC0CtDVZ2EgHxetG/s/Aorm4bm8JAgKEJG1OUdouKOlDVTyTE
         0iKfHjHVpx+fcBpvF+PK2gz31RxC0FyW9IUtgbWovceCsYgY5v+r69fkhJqRALFq5Jij
         +pVCpC3Q/V+D/XsKQPf4d2rIdbDw6RcA/+zrHuUuYXHpVdgsvbX4w7b47kp9W4S0JmJt
         3nJh4Oz9tKgrXuF1qsTpMJhZZiEc17tL/mWcuLQpT35AIGcay5SfEuiEbNnLqXD9ZvHZ
         Up6ox9MQx9B3mC8TnLVjkXItNZLIA5HsKNU10o4yWBVMsn71YFJQ4hApnQ2q3PtsRbEl
         LqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349913; x=1744954713;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+F5ZVtp8VQ2jTtukTzm1g0sjnjetiGa2oNQPDhGJdk=;
        b=kH4K+ZIMexKfpW6Abg/7jsmk+d7Ili6LxictFlC6G5QNmIAnXUzfqEUxnqDjDnrcWH
         XqCc9xnhkdrSLt+Dt4fq4xn8K90uROtj31yWtkebUnYZHl5+ZpPcE80ghIcg9uYM3n7R
         j1ARh+IIVi+q0R77ThaE5yhrumZ8JA4r4rgYtUz2YFAAJKPfHosO4vlFFnEus/UuRz2A
         scAiREKVgd4Vw6wXu2PhvFNZ4F+3XxmRN96UmAO4/ncOzuVCxZKVA4iu+6PjMH8bjuhH
         jt+VWIx/4/24itLaU2LIKpQyfztz8rommopPf5aOx+Ne557iNQnjaiXVPUuUs6FR3KVF
         KxHA==
X-Forwarded-Encrypted: i=1; AJvYcCVLi9lw+UYk9kyl2NbvbHglh8ZlntPWwqTJlCGKDgGFTmZsLrqM/SzWlErPF4SZEZUmVASfkoYLF/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZ0SyqvK73dBjqbi/x6VG6Z85UFVStZgqh1w3dXqUK20KSnq/
	w31AQMlJPWhUrasGLM8JAb8w7IwWhJWTh1O0jVtjQGgL2vHe2bWF+VHkXhEnmGOzzKRKmY0mK6D
	E649NAmrichhF0QK7Qg==
X-Google-Smtp-Source: AGHT+IEjpGd8eC8T8F34QaHuVI3jNyHvNCtvTu5MIil37ui6UPNb1k9rZZ5tsoZfvaAkADx2c261Byn0pKs5T0Sn
X-Received: from oabwh16.prod.google.com ([2002:a05:6871:a690:b0:2c2:13d6:cf76])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:7a8b:b0:2c1:650b:fc86 with SMTP id 586e51a60fabf-2d0d5c2ef03mr764210fac.1.1744349913649;
 Thu, 10 Apr 2025 22:38:33 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:39 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-9-changyuanl@google.com>
Subject: [PATCH v6 08/14] kexec: add config option for KHO
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

We have all generic code in place now to support Kexec with KHO. This
patch adds a config option that depends on architecture support to
enable KHO support.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 kernel/Kconfig.kexec | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4d111f8719516..4fa212909d699 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -95,6 +95,20 @@ config KEXEC_JUMP
 	  Jump between original kernel and kexeced kernel and invoke
 	  code in physical address mode via KEXEC
 
+config KEXEC_HANDOVER
+	bool "kexec handover"
+	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
+	select MEMBLOCK_KHO_SCRATCH
+	select KEXEC_FILE
+	select DEBUG_FS
+	select LIBFDT
+	select CMA
+	help
+	  Allow kexec to hand over state across kernels by generating and
+	  passing additional metadata to the target kernel. This is useful
+	  to keep data or state alive across the kexec. For this to work,
+	  both source and target kernels need to have this option enabled.
+
 config CRASH_DUMP
 	bool "kernel crash dumps"
 	default ARCH_DEFAULT_CRASH_DUMP
-- 
2.49.0.604.gff1f9ca942-goog

