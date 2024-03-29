Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87B94AEC0
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687596; cv=none; b=e24Hc/cSHVG/wG9tZC24ZHxL23XZ6I3bRmCF9ZFVKwZZHb80WZvXYEpKGLXkmHtn06U3zrmYfESdDm0lCMO5PpN9G1SeXbC7AFa3kQZaqvyaaNTptgX42Hi+IOUT+iGjqrABUl1/h2o7DFNIUiyq+oRASg5Zd9J3oqqFuk/CLxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687596; c=relaxed/simple;
	bh=BxMiKZAn7nexIEVdbUrwHq2R7AS30kNvg2GFVKZkxlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rxEcNUFU73n1iNR1Hs9+bsmzJZ3i0aAPgaugb6CMwbznn2sIG1VdKHWgrmOdy6r+ATD9mKef2gOwPF/dYjIwft/Pc0O4NqooNGZrlBnDCAhw77NZ7X98jGW+bqMS4CLJU6FWL5VLND3qINywgTqd8mVh83eF9K4pKpxGYKGACwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RhuS1yCQ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RhuS1yCQ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c3daebabe4so1045817b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687594; x=1712292394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhhwcNmyZsW8Rn+io2bmrU6vZaKqFl7C8RSpnBjD5D4=;
        b=RhuS1yCQo3LoS/e9OShjymC1U5pu+nEXid57ZNcVAxgWCKiiIkRI4loC849NqqfiUc
         YTuusflSCf2h17bZWyEyt+MTKqMinsXezIojroAoFiIAT3YaV3U9EafZqdLS19Z6o/8t
         RZtNf3OdzDAibokGqhQXoHSWqMKRa1mJc6u5rXPLwP3C1NWN5oeaN4I2AkeoiRn1+VPG
         ixhJ4PIdRK8/OFPbd5Tz0JgMHY0adgr68HFeWxEffiTVr0McAgCK6g/Gu4ZOwwAnLgbQ
         BmdonAIPces254wAwdSrP2/PfjFnqXJ7wi4P4tPtz9tFDnPk0wtGuOjM2iG0Boda1PZv
         wrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687594; x=1712292394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhhwcNmyZsW8Rn+io2bmrU6vZaKqFl7C8RSpnBjD5D4=;
        b=EskTzXyK6fwC7bx1lmpFc6dZX0KCDAPMtYPhp4nuZFcFxjVQ2+m7x0lA9wM2vrNlqn
         M4cj8gK8g/2I0jdsDtcicipLgMrLJbawCSHrAtur2hpAjf29gtI2pp4Kg0REwHjXJzDF
         ZGDd0FC9TjowUfIKPORSpgULd+VjVCa3F79xI++9zpwPq3tXmM0NUs22Y0i95RlKA2td
         eIWeaFS30BHaopJ/KRRhEV82zgPA9ed6MGi2y/E6FgY3bM+5nmeAN40p0SV1ngovnWjG
         LuzTCc9HP0Vc8ZHEP9Bs6ZXz0Nl1lGRhdVuLVwUtVRRvZz72ZCE3Rcm9XKUi4HjbkqIr
         6UjA==
X-Forwarded-Encrypted: i=1; AJvYcCUjkQWGyUfEcZcBIZ33OwoBmAKjYQpvWM/MqUbgcdHyz6tKn4QkeAhTwlfXONw0FWlFcTZ3dj7S6xg6d+AK0m5GEuHcGjLX4dOR
X-Gm-Message-State: AOJu0Yz/nP97fS5YocAeF0K6qHR638nMsNPhFOFMox35ih2cn5Zh8bhY
	P07OAHSYo2jSHFqyloZgyy07aLu6Ld88NNdWzDp8n+LEalyIs/rav0dFnRMvrmc=
X-Google-Smtp-Source: AGHT+IHzCsJ/EULMJ2X0/zuKDOZ5gM2wFJf32HTwGAn7YaJ1oTsNWG5xRVVZi9OrlqC1Skwk/hVE2A==
X-Received: by 2002:a05:6808:2d4:b0:3c3:d6d7:e57e with SMTP id a20-20020a05680802d400b003c3d6d7e57emr1229439oid.15.1711687594157;
        Thu, 28 Mar 2024 21:46:34 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:33 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 15/27] prctl: arch-agnostic prctl for shadow stack
Date: Thu, 28 Mar 2024 21:44:47 -0700
Message-Id: <20240329044459.3990638-16-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Brown <broonie@kernel.org>

Three architectures (x86, aarch64, riscv) have announced support for
shadow stacks with fairly similar functionality.  While x86 is using
arch_prctl() to control the functionality neither arm64 nor riscv uses
that interface so this patch adds arch-agnostic prctl() support to
get and set status of shadow stacks and lock the current configuation to
prevent further changes, with support for turning on and off individual
subfeatures so applications can limit their exposure to features that
they do not need.  The features are:

  - PR_SHADOW_STACK_ENABLE: Tracking and enforcement of shadow stacks,
    including allocation of a shadow stack if one is not already
    allocated.
  - PR_SHADOW_STACK_WRITE: Writes to specific addresses in the shadow
    stack.
  - PR_SHADOW_STACK_PUSH: Push additional values onto the shadow stack.
  - PR_SHADOW_STACK_DISABLE: Allow to disable shadow stack.
    Note once locked, disable must fail.

These features are expected to be inherited by new threads and cleared
on exec(), unknown features should be rejected for enable but accepted
for locking (in order to allow for future proofing).

This is based on a patch originally written by Deepak Gupta but later
modified by Mark Brown for arm's GCS patch series.

Signed-off-by: Mark Brown <broonie@kernel.org>
Co-developed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h         |  3 +++
 include/uapi/linux/prctl.h | 22 ++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9e6a4fbfccac..5ea49b9232fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4209,5 +4209,8 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
 #endif /* _LINUX_MM_H */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..3c66ed8f46d8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,26 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+/*
+ * Get the current shadow stack configuration for the current thread,
+ * this will be the value configured via PR_SET_SHADOW_STACK_STATUS.
+ */
+#define PR_GET_SHADOW_STACK_STATUS      71
+
+/*
+ * Set the current shadow stack configuration.  Enabling the shadow
+ * stack will cause a shadow stack to be allocated for the thread.
+ */
+#define PR_SET_SHADOW_STACK_STATUS      72
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+# define PR_SHADOW_STACK_WRITE		(1UL << 1)
+# define PR_SHADOW_STACK_PUSH		(1UL << 2)
+
+/*
+ * Prevent further changes to the specified shadow stack
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_SHADOW_STACK_STATUS      73
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index f8e543f1e38a..242e9f147791 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2315,6 +2315,21 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
 	return -EINVAL;
 }
 
+int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2757,6 +2772,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_V_GET_CONTROL:
 		error = RISCV_V_GET_CONTROL();
 		break;
+	case PR_GET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_shadow_stack_status(me, arg2);
+		break;
+	case PR_LOCK_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_shadow_stack_status(me, arg2);
+		break;
 	default:
 		error = -EINVAL;
 		break;
-- 
2.43.2

