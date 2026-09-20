Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDED3E022B
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933053; cv=none; b=Zbu9oi+VGEt6r8jodJxcwlTWUfDAEDZaHFt1B8PEvp/dCF68AOoENV+VsgCpyufR7rOXnLucsqhiVu9XTsKUK7Dk9tzWmXAt0kcb5MlASy6hCt4Vp8pem778pEH8seLOKBr8aik3ipxrWUIOmz/75Wa2rSPNNNtptoIimOehSX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933053; c=relaxed/simple;
	bh=xr/NZJKBK6CUnL1RnXkkMJeJUXfe0jmUB3ZL22elyF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZ7ZF2bmN8wyijP2Qe2rkd06wSkk5J/G5GD23tMKs64b+Un5qaPPZ1D6fOCZdyp1eGupeNiq+CXejdjDfMIXmiSHqQmt/3+1aMub1/fR6W6RKcntsy5XOWjzAIn3PF4JJwrZT0MymH0nQ+rhnxpO6Y/0Rg+hYduNKeLM+pEt73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SOBbeJIM; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SOBbeJIM"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aae3149so1690802d50.2
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933050; x=1790537850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qTv8uFL1FYxhccWvDyiinfq9K+eUMO7fyy31bgvC6E4=;
        b=SOBbeJIMCs38dv8ZImJY+/7eltfI47qWOWzjYQxzXxAdJlAv2v/CCIDUatv+1nqw3c
         hYSbqJliDWfpOL9Igd56oFok7OvotwogIUTZ60Opz/cuqCRWDSG89RZ8V94Oa9nxKrEk
         oisxF1VcLEp8aQSIx/YAhRABu9FnA1gKzIgUIhkYijeZl4FB+23WSEumOdcyJxgaAZf5
         zuba/cQuvFK4PZetvfUYfNB5BG4Y5OXfqehUeOz4HqVIy6JxMZT6UL6AAJRwUKk/O/2m
         1TK3J3fvo8FDuVlHM2vsFvNJarglOrI1XWtKsM/Xt3VM8jZ8ih2S43qvO1/Xxiiclp9e
         aQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933050; x=1790537850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qTv8uFL1FYxhccWvDyiinfq9K+eUMO7fyy31bgvC6E4=;
        b=aC1bR/WPdV7Qh9a/vRmW2UKQzXyJ1FQ239Jol+aa1NLma+KrCYhANp90p0NStV+dMd
         lZ8NxXIerbEHHbKiHj4OBBmV8JNivIG3JVrxdQ2Tbeanv/xdviKOKlJevxfhAIl4farU
         4r8UZB8CMLTTYUd+qW831r36cDDxOSQnxSS6cPCw5EbbcfEWMIrQl39N1U4S/2DgMGYw
         1qqTxbg7mYD7460YV6Ev4HRSA3sHZzg3uM79KS+1H5zaIRoadVIefwZExynCOZd8NjFH
         m6h56WWEdXVjmSTECVPiutZMCY5IqLzP2HCokkNaWRRC+m7Dzar7qo+gpKcSDkikhDr7
         UHjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJCN8Z6D5SX+MUjt8Cdzh7+RDKvXUTo8zMPLaQuN/LEMG5ZDGrWcyHWQ+/h6c4RxkddN0jQ7fuxKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lRngSDUkK7tZLtOlNB/dz2PulGZJBUCsaXAracZc4OxBAKgcwh
	nfFAoLFCVQmnEgKHbUZwZ8NSB0X7qRhrP+WGKVplVKrxsj5ZVshRBDQNyaM7df2/qGI=
X-Gm-Gg: AYBFou3fWlnoEvfhLM5rx1Z/mqzTyKyjGqzPKJtLR2jBx8L/nk4xNreJutPyTYh82WX
	7M9BhVEuhCz1sYnXs6T23rNUWK8X/F/w7Q3SmlFkuBd65ha8VWAgTrDJRG9nvCGci7dWo/DvaOV
	UAmt9CwJXhsceEeMkAUySGT7vLy7eMMq5GUuB88mSYA1IBLke5gxJYzWVwcaUZZB2MWS0N+/h/Y
	0a8TAx32glECyXws7ZcbxdAF9nExYIt3kt5to/at+3u9LR2Tb5NXY0kUhIsLoFQpBbNWxBCPuGv
	Vtl/t2DrU05plTQuw2HJ7npOkeCxDove+SF5vjD1F9aGg1B8He7piW5kLaesZeQ5RQGxJUA6jtY
	g69ksY7oTsGjbWKpv2bhxO8r5bE9cdNXyLrJfS16zh1x3pEqi+HGGXZUnljhB1wXgTERGEHlA2T
	p0Xa3BfLVgqcni/SVMB/c3Qc7r4s1y+62pmvwjlVytygS8rmQQhekUv0GjqwAyGtsMo8n8/86ne
	klHOTeZLakjfTYFgEAgkryuLlT2KN5etGCHp+VaiIN9WLk3jQrEfz8ISuVSXgRzAtCLqREl0Ehg
	uoyAi8gOjQMt6toqe7jO
X-Received: by 2002:a05:690e:134b:b0:671:70d1:d6e5 with SMTP id 956f58d0204a3-6717fe597a3mr2639510d50.87.1789933049997;
        Sun, 20 Sep 2026 12:37:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67298f64c7esm2656294d50.2.2026.09.20.12.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:37:29 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 06/46] x86/smp: Skip offline CPUs for REBOOT_VECTOR in native_stop_other_cpus()
Date: Sun, 20 Sep 2026 15:36:10 -0400
Message-ID: <20260920193650.3373435-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In native_stop_other_cpus(), cpus_stop_mask is initialized to
cpu_online_mask minus the calling CPU. However,
apic_send_IPI_allbutself(REBOOT_VECTOR) uses the APIC broadcast
shorthand when enabled, which delivers the IPI to all physical APICs
including offline CPUs.

Use __apic_send_IPI_mask(&cpus_stop_mask, REBOOT_VECTOR) so that
REBOOT_VECTOR is sent only to the target online CPUs in
cpus_stop_mask.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
index 985103cab16c..2449d15c6667 100644
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -192,7 +192,7 @@ static void native_stop_other_cpus(int wait)
 	cpumask_clear_cpu(this_cpu, &cpus_stop_mask);
 
 	if (!cpumask_empty(&cpus_stop_mask)) {
-		apic_send_IPI_allbutself(REBOOT_VECTOR);
+		__apic_send_IPI_mask(&cpus_stop_mask, REBOOT_VECTOR);
 
 		/*
 		 * Don't wait longer than a second for IPI completion. The
-- 
2.55.0.1082.g2b9226bbc0-goog

