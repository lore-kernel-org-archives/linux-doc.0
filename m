Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC81ADFE4
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777502127; cv=none; b=bw056g6n51yHBV/8fNQfa/fYGLEyPQikPWA24xCmRRqLzjQVRkvnakgHZO8PvyXBSpvrjEfX/0QTYeO4nQMYEM0QVEDMFOCQj7k3F8EqR5qcBB2dCboVWHxVUET3Al6DUyRqxVsnoLqDHvQCEkXtQXonlCrMUPyHtA2oHH/2L9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777502127; c=relaxed/simple;
	bh=AFuGKVleiETKPsJHICMupK/vxE+XoZwboxeo9ANF7Ws=;
	h=Message-ID:Date:MIME-Version:To:Cc:Subject:From:Content-Type; b=G7a4Sj71UeoCyZfNxnLqkWIhljV/zlRO/LFummttVhjghOoR+gmVOG7qLE5zcvGiBEYyWdw6VA41tcsqMR9tOkBBhLboVEOEJSxYARVPZwba3k9Ce42XevT2ltCReaYfCQ2+D4T8MKobv6w97i4bHxJ6vRPOYadk2RhrKEs7igQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tennr.com; spf=pass smtp.mailfrom=tennr.com; dkim=pass (2048-bit key) header.d=tennr.com header.i=@tennr.com header.b=JM1EZY04; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tennr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tennr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tennr.com header.i=@tennr.com header.b="JM1EZY04"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ef45a6d9dfso32052385a.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tennr.com; s=google; t=1777502125; x=1778106925; darn=vger.kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+cM5bDOtup8kbf7WWvIOEk3VUCv6B35KmgW6pLVjks=;
        b=JM1EZY04f/DMwIC5PZ6kNikIlsV19bLgtfB57f3Z5IAS1XN2NqqCJGeRtw/V2nHUHG
         XlqJiQtHkQUPoUzgSClccYrKbsI1zvTxVvcfJhabLS7VYfLSJXnIrCIW41r0cTcz5E5D
         k82RH3xnKrRf2FE7VG7+JpREIYOQQW+vohpH9LrWY8BvudFdJDOfgX94El98Lc5WJw4M
         m2KVAy0qxuJPM2g+nQQqO5Z/1A0v9/S3ljQnck82OA4GCRPADQiERgqDtNAcaavyh5uv
         1S5pEYXaPC+UufoGINlHOD8YQI4V/N57XqDoAb6+EJYlSp/kDQBBQSBm2PmWybak/U1I
         cLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777502125; x=1778106925;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+cM5bDOtup8kbf7WWvIOEk3VUCv6B35KmgW6pLVjks=;
        b=Yk2Ei7IgAHgG1/2biuhR6xItHYCTS4iLc6qdK9tuXJJCKfmGRf8tBhVS5W+wpawSR0
         h6J/vjDsZKeUPyVDiTNxMUxopj9SCuJqwcL8wpx8aioATC2mn/TmiQQBs/DQGajjnSew
         tlBjh73TFvNZbSRiH+Y/xpD11wkewc70ZKDtc/v01k+kpM7WnBJjI6Ami75pmoUzn5QX
         EEZ9PX4d9bYFSOd3nZfHtKBYiuvMvrhFWjUWarIcd/gupcXUxPkQ9HG16PpF70J32FvV
         Z9iPhifmnNWSuaW0fH9wymCQF9XVzht2Y4unrzOaWO4JlqPSrF5rh3iIiwE2X4FzpVVk
         jnRA==
X-Forwarded-Encrypted: i=1; AFNElJ9i8pagWm/9akZJIvpAapLPWAiBhbheMEOaUu8hbwT+uvQyOxkHjCdWncgZLzP5+VIc84zN2YyGoJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP9Fz7akIVIPdYXLq1gEtQKEz3udQUXJWbmKz5uNe2wD57tNjM
	sdjyaPTNamrmAh/J1njP/HUEs8o+r0AGbEB5yBP2mmPmI/aAVvyir0mzqZBiUvQ96+8=
X-Gm-Gg: AeBDietfqWnyHS0iPUhFSyy847fiRe6XQx1dUj4c99i4e6hdfkDD8jd2gQceN1Kvcup
	G/lI2o3I87Wo8Z/DPJyGlD0XFKZpzcKgXEpmLD+RB6jVmciK7YbXHRqMTGMqcgdwOxDOzaCAa6m
	UCGnC/IXejvZhTAy1exesMFS6Xy69k7/YTzcsh8LMs3Yjkz86ifOrQNJCP9MXfJdgFF4D93cRhn
	3EH6MFUsCFI73PqnH7ixe7puRS+jp2+dhekSloaBGKrj5Bx4ctD9qyshnSgipcoxgyzYsRjqW7P
	G21tGZ8Y2Zzy5owRTLpLKs675ZHZwaWjoS/w9irbh9KQuNgWd0o0A4FnegBX4Pv7Zzprzh+CXI8
	Oakl8ZzuZumiGV5b6NwX95H0EObtwwwUUuaC1rANdHUGNQij2P9mh6dAqulsRuvQAo1Pr3qlVkI
	nuBLWMSCrhCLpATX8CGkyR2uO02oq4+MD5LM7SFB1bK/SZu3KsIQm8DqUrfBV1KRXB9kdDBGRXx
	DmT1L0ta2eglAUx2msyvd0yf7f89yPcHEJwG2LEzQzM7k4Q
X-Received: by 2002:ac8:7f08:0:b0:50e:6313:6e13 with SMTP id d75a77b69052e-5102ab34ed8mr5941171cf.5.1777502125036;
        Wed, 29 Apr 2026 15:35:25 -0700 (PDT)
Received: from ?IPV6:2603:7001:e0f0:ecf1:358c:7c1f:bb1b:654d? ([2603:7001:e0f0:ecf1:358c:7c1f:bb1b:654d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ae985e4sm27897071cf.27.2026.04.29.15.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 15:35:24 -0700 (PDT)
Message-ID: <391d16fb-5f11-45fa-8f3b-1debe095695e@tennr.com>
Date: Wed, 29 Apr 2026 18:35:23 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 corbet@lwn.net
Cc: linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, avi.radinsky@tennr.com
Subject: [PATCH] Documentation: riscv: cmodx: fix typos
Content-Language: en-US
From: Avi Radinsky <avi.radinsky@tennr.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fix typos in the dynamic ftrace section: atmoic -> atomic (twice),
pacthable -> patchable, derect -> directed.

Signed-off-by: Avi Radinsky <avi.radinsky@tennr.com>
---
 Documentation/arch/riscv/cmodx.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
index 40ba53bed..cbfa812a1 100644
--- a/Documentation/arch/riscv/cmodx.rst
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -21,13 +21,13 @@ call at each patchable function entry, and patches it dynamically at runtime to
 enable or disable the redirection. In the case of RISC-V, 2 instructions,
 AUIPC + JALR, are required to compose a function call. However, it is impossible
 to patch 2 instructions and expect that a concurrent read-side executes them
-without a race condition. This series makes atmoic code patching possible in
+without a race condition. This series makes atomic code patching possible in
 RISC-V ftrace. Kernel preemption makes things even worse as it allows the old
 state to persist across the patching process with stop_machine().
 
 In order to get rid of stop_machine() and run dynamic ftrace with full kernel
 preemption, we partially initialize each patchable function entry at boot-time,
-setting the first instruction to AUIPC, and the second to NOP. Now, atmoic
+setting the first instruction to AUIPC, and the second to NOP. Now, atomic
 patching is possible because the kernel only has to update one instruction.
 According to Ziccif, as long as an instruction is naturally aligned, the ISA
 guarantee an  atomic update.
@@ -36,8 +36,8 @@ By fixing down the first instruction, AUIPC, the range of the ftrace trampoline
 is limited to +-2K from the predetermined target, ftrace_caller, due to the lack
 of immediate encoding space in RISC-V. To address the issue, we introduce
 CALL_OPS, where an 8B naturally align metadata is added in front of each
-pacthable function. The metadata is resolved at the first trampoline, then the
-execution can be derect to another custom trampoline.
+patchable function. The metadata is resolved at the first trampoline, then the
+execution can be directed to another custom trampoline.
 
 CMODX in the User Space
 -----------------------
-- 
2.43.0

