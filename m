Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502425BEF8
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763249666; cv=none; b=RGbJNgcfibt4oOzOjkMJkIGt3iv46VFEnQCwyHqgQlyyarSvlYzaVWmR0Rj5XspiDM54I1PSmrM+JiUBJktDNHAjIBbPCyfCPfjJbEoWKYRxbN/rTyTm8ntjzcIaUJi03Eke5+Iaf44eDBlZP6K7JyCC6918dVXa8di0y2eHiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763249666; c=relaxed/simple;
	bh=E5mYrrro8NuMkC7HPDRevyvgCJvESo2IchKI5QmQD24=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2SUAQqWorvmlREnHx2E3EoGkjt4Ctdp0I9HXwS3EN194nwoFyhrOE5uGVIm+5Lul7wd8HwQ98WduvmmAjM3UddPQHvNJH7WpxHRju7Jzebee59B7d+eMNQwmS5r5FmA3is0a4CeVTzn7cGupVHpKRtyLaTNARf+O6pBVDTFWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Vv5M4s4M; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Vv5M4s4M"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63f96d5038dso2589026d50.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 15:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763249663; x=1763854463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffF6ShDH072kEeRsAneEmG7BXpD8z3YnDwKiTvXVzXs=;
        b=Vv5M4s4MbrZaPZzUnOkFJ76hhvkmuERgaGRqL1tIN8y5KepaYZOw/Tu+Xu3Edtl9t3
         25ZzhmpORqXbdS5edKlWEm8miyI4KHd7WrhVY/GlR5x9/Tfxa7Ehko7PnW0rhCYHMN9W
         2EByd+g5tDX+koAZ2B1VF+N7NYy39cMtfh0fgPezQ9fyndvKYl6ZhEVVAyTzRiT4yEoE
         m+4ZOebyBqp07E0dzUi/V23AdQIkp9wNWMusu9Jn+hD6trtyRonySzmz3T2beA5STHE1
         dnoMYv0YvAD3k9es+LFyckE4vVWCpJ8aJAPBjIbDNxvhtWIMmoIpAJbRL2RXb+kE6ELY
         Avrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763249663; x=1763854463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ffF6ShDH072kEeRsAneEmG7BXpD8z3YnDwKiTvXVzXs=;
        b=NfX1FeJVggteVWPYRHjKrhKdV7nP5oKrefNAIYjVRXGrIWarcqYe2AEdbwH3LYbH8S
         pPWgxuWU2+B+aOEW99cjdXaz0XJXsDANN5BVHa6L3xomDarqq4PlXHIBR0Iu9eDgabGn
         FfZK7su/GttKjqXo4yPxiAHsp0VZLReU8+2uU0EQ6e46UIjvRpzTRb7OuplR61ssX3sn
         E1vx21QMMQiwuzflXuqLQhMmnfEZfl3egVpkDlViHUP8b8IVNTCuaeCpOKX2PSEgYr43
         vgeL6h7wagkQQaBk6jhDcX5Qv0GX/Y3Z7Bw8Y2MabTwYwWXl8d0kvi/YV7NkoWOf/M/i
         TkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9cQLWGUpIRdj0EZnQLrBWH8lYY9bspjwCihIdzezZyhxFBkp8gB6qzOdYoBtMXo6iGPbfdpQq4CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAifa+jkaVrn7rsTWdlh3JfXVJlXzkvo5q1Wu2ogTureCsDyP
	S2LORU4+fx+OozgVmdqo8C5DZgKr7COpatm3D9HtF56gHXJoa5JP0CPPktN9SMt+q2Q=
X-Gm-Gg: ASbGnctNoE7K8LqvJ73uiXw9IUuW+ABWz4EyEZBthN6iU78XmYAxDaOxPBEdEAMqOwR
	ncV9zMlLm0AX1DxG+YheUNDKvYtJjHavUviLl+dlze2urlaQMzTUR0QtNyeFkx2DKMWnCma05eP
	emD/X6fMZqxmm8vjWJmu8o2Pp9MFYHdw7CbW6kIK7yB5c8cn0zAjMfFJPAwSBtb3PCSvMG1xmsA
	/XhFgLE8PV7MDj8DUBlbJKZzJQYHV9EyUTX7VVGF43u7sdINLhP3eW1LYdqtq3qxxKfdwHQFRez
	XLN+gjkOjIckBs2VSrRiae7ktFBb+/MRfwpzrElsSxjHbu06TVToJOk/WTPQs37XS9y8YMAxaTk
	EALuYeTYU4M21tMWDhkoLhc2nrdF+pEQZXjGEubOcxbkH2lQ4eVfL5uKLoltIDx44HA/sakv9Us
	dhBO8pncfGYE/ByCI4hy7xXMpwlwsQwQhJsjHue+riECuvGHirif3x3VNuO/YaqHOqhikNGkCSB
	E9yrUw=
X-Google-Smtp-Source: AGHT+IGaaou1T8IlNwnvhEGAvgtl5hmvWdjNxQr9knw88/sarPOBHEpKzr0vdGK9CACIRmLZkXd5Qw==
X-Received: by 2002:a05:690e:4366:b0:63f:b6a4:dcbb with SMTP id 956f58d0204a3-641e76b2c36mr5840850d50.69.1763249662685;
        Sat, 15 Nov 2025 15:34:22 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7882218774esm28462007b3.57.2025.11.15.15.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 15:34:21 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v6 03/20] kexec: call liveupdate_reboot() before kexec
Date: Sat, 15 Nov 2025 18:33:49 -0500
Message-ID: <20251115233409.768044-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
In-Reply-To: <20251115233409.768044-1-pasha.tatashin@soleen.com>
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the kernel_kexec() to call liveupdate_reboot().

This ensures that the Live Update Orchestrator is notified just
before the kernel executes the kexec jump. The liveupdate_reboot()
function triggers the final freeze event, allowing participating
FDs perform last-minute check or state saving within the blackout
window.

If liveupdate_reboot() returns an error (indicating a failure during
LUO finalization), the kexec operation is aborted to prevent proceeding
with an inconsistent state. An error is returned to user.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index a8890dd03a1d..3122235c225b 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -15,6 +15,7 @@
 #include <linux/kexec.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
+#include <linux/liveupdate.h>
 #include <linux/highmem.h>
 #include <linux/syscalls.h>
 #include <linux/reboot.h>
@@ -1145,6 +1146,10 @@ int kernel_kexec(void)
 		goto Unlock;
 	}
 
+	error = liveupdate_reboot();
+	if (error)
+		goto Unlock;
+
 #ifdef CONFIG_KEXEC_JUMP
 	if (kexec_image->preserve_context) {
 		/*
-- 
2.52.0.rc1.455.g30608eb744-goog

