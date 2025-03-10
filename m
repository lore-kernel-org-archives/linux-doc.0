Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2251022DFA6
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619628; cv=none; b=VSPHV+4PUTwCD1dzALPbXXyhJEBp6Wo7ufPWUwvV3zhXAxALNv3ZknBurtFA8RospfEPx5RgXW3jAmr6serGNuxi8DCXkSBQuU800gdrOK3fHnFpnRlOCS0iHKZcce2FW/xDaJ+McW3g4fVpaXOfUmSS3eUKK2G9RT0VlVTTKDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619628; c=relaxed/simple;
	bh=H3PXCUjUDQNq8xHh3lVfD9Ld90vm+7TqlKnnpyNaoKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i56PCeXAkpo3hYV0HuJ8aB6Xf+HK6OY9h3Ypvnx8RONjzSlIlSDW2UxYQMIBwtXCgeCqT867QjKn8+2mZgBtGqs1GeBDVppsuz2NJA6SJt2ZsETwZbJac7EwOFsDkveFhV0EmXiiAC6dIVzU7aPOJ+c/JXNKYBCIPQtsW4sn+XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=B6DGJh1z; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="B6DGJh1z"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224019ad9edso99843565ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619625; x=1742224425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCBi+dVMU97ACIzU1KLcK/YVJVSSJGwq4MBxilXjNH4=;
        b=B6DGJh1zHetrwu+X5n9C9trKUGkqoYM2zJNlCOJDqQ0fsOHKobJKOYLLzDQolAt+mI
         itNOoNKYpmtMa56vK1qoaCNOz6IP1J7VRYaUSCVOkiAkKvZgSeod+A9rxQSl75cIWx5M
         J4oOgLL9KVHZD49YUc7aTpbRYgjdVTURzu/c3UW1K1WhmdO3Y69BgV89eqppxOJQ9zMr
         0XZHDj5Su2qYNg/0fMUGbLFJauOKFPwf6uF8cm0lt3LztsrTunpdchDxLUOVPmPKef9X
         bQj9VYaEkOm9jCtpcM4AXfNY/vJq9Fi+vEGaToqvJEVmDbbH9nX6eid3nEFvhlMnk7rv
         34MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619625; x=1742224425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCBi+dVMU97ACIzU1KLcK/YVJVSSJGwq4MBxilXjNH4=;
        b=pQeK5+SwTgysZcCjeRLagUpasuigTyLx+s5ueeqG5FBnse7DtJpkP5GTlnOFplLKKF
         w+gDcRl+EpEMNdXm2ia/kbKClIP+YXAJYeCO2fE5sIHtr1ph3znEBN4Gsp9iZC+m05Lp
         3tf2ERPoKpeW7TR33ljmno/ILY31Frb5MOy1R4O3M3YLXp7gPudyivBYh9COKJssXcF/
         jTMXbGlkwwGnZ7V44LT0+rLQh4wa5Rlg8cJaAdBk5i94qj3fpAUiRezMlosDutxDL4ne
         /0Nw/3tTVdGwgUbw8xasxWuXiN6XL1WUZecV8Z4WnK1WfCB+MBt9yvkidtiolkCSI4HO
         OFRw==
X-Forwarded-Encrypted: i=1; AJvYcCUox4iU+gv6vgEDMslhtYk4yaLNY+OmVs5wygosw19J453vamltgeRzKtpab4jwXZff+VLVIW3ZdYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFp2ZhLn5saEpVPdPLhiOQH4WXbaTJl9siGK2a32d8rgCD58U7
	x9UBtFK4rGfyKTzms8ax1i4eY2c9e/pYW57izxqnADuwxkpuORCQ92gRaL5RRag=
X-Gm-Gg: ASbGnctVIFGOLmkGnwKFGkBKdWGSdsHqLIta1rng1tH+zH0GS3wEWhPD3PEJQzrPeK7
	VCA0tOW5cADZwlG+5ePdvsXgUpxAg2KL2ghD2qyqKpwMdoCmTE23bSj5WGYRINIupmXV+3ILQ5Y
	gCAhHnB3DQKQDIK2KPqmY5y6uHpZtrOxSHbXE0T8hLv6hUTDhkP4iXV9oIFl0fMiG+WHbH624rx
	SffxW/7YxHQJuukwvi/DRUZGpoqMuc95tGPxpxmMovbqtun9Xnn3NF/+IwGXiO+2+fcbZFoO/Tb
	5XmlD4XUv4kONzAsqOotfACEAsLbSAZ3w++7VUbFze4SeA==
X-Google-Smtp-Source: AGHT+IEfHZuAa7IrsxCaNkSR7EwHAs8m2MJ5ac0OEsbyXjAWI9w4OglgcFN0I6P8WNfULj+ZAYb2cg==
X-Received: by 2002:a17:903:283:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-2242888ab0cmr237920295ad.19.1741619625536;
        Mon, 10 Mar 2025 08:13:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:44 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 07/17] riscv: misaligned: move emulated access uniformity check in a function
Date: Mon, 10 Mar 2025 16:12:14 +0100
Message-ID: <20250310151229.2365992-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that check for the uniformity of misaligned accesses
performance on all cpus from check_unaligned_access_emulated_all_cpus()
to its own function which will be used for delegation check. No
functional changes intended.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7fe25adf2539..db31966a834e 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -673,10 +673,20 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 	return 0;
 }
 
-bool check_unaligned_access_emulated_all_cpus(void)
+static bool all_cpus_unaligned_scalar_access_emulated(void)
 {
 	int cpu;
 
+	for_each_online_cpu(cpu)
+		if (per_cpu(misaligned_access_speed, cpu) !=
+		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
+			return false;
+
+	return true;
+}
+
+bool check_unaligned_access_emulated_all_cpus(void)
+{
 	/*
 	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
 	 * accesses emulated since tasks requesting such control can run on any
@@ -684,10 +694,8 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 */
 	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
-	for_each_online_cpu(cpu)
-		if (per_cpu(misaligned_access_speed, cpu)
-		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
-			return false;
+	if (!all_cpus_unaligned_scalar_access_emulated())
+		return false;
 
 	unaligned_ctl = true;
 	return true;
-- 
2.47.2

