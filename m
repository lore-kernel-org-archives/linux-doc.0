Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0553477288
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933159; cv=none; b=E37ACrrMORZAr0DwwKipGTy5xpeka6pcmswodyBqbJfS14tZaecfgU5WZOte0T11iEbX87+b89tC1Gwj4/NUwroC1kjfk3e+Vg7fUS1TXAxMfvL36shTpb9Zk+tbenW13LtP3begyZRsXRxdIOcCfFiYXSIv33e2mvqw2AsuOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933159; c=relaxed/simple;
	bh=ecMTvF3y9YX9wt5R/rOdU59+hWMsUmT0QbE/UEYrczY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQc+8/9LgDouDCy69iKViXXMMj2ExRHyvCDnhD5jm471wih834+tdoC9/PBw3/ATkF5ix+fhJCOhc79f30M8aV0+Fq7npAVepI7uqaMKH/4mfDLGt9+BeNW9KN11mm/xiMgAxKM4giUT+Bp94zHtzwH813p/IQU3Fpe1eLyYV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=TW8caZte; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="TW8caZte"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d440939e3so14291697b3.0
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933157; x=1790537957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GOyD94xneAEU7+yzaxi3P4vCBB/CkWgVuLYMi+o49fI=;
        b=TW8caZte+uentNlNiIUgcIPNJ5uG6Cc6Crp834ckEcz7g7LD9NK7GzNe9yo6YV/SU5
         yDJgHg2Yo3IMX0Y0jnXZjcKL65l8Xaha6fgt79Kb9NBkJH1GaKYd6CFTSrAN5IHXqKYS
         xedgK4h8Mvb3Wl1x4DlT9M7qnFUQ30DXSV4hLAAx+edJW+1ObpcgTYB4OUTRFq3q/ZeS
         8SZ9Y8C4+yARAFWl/0liVXdl7TmyIeo1pRgHd5qi92IbizWSEJ5QFTVgNh5DCRkBcyYQ
         dIvXOzhjRMANr0dxZReK3zhUvwV9GYenAZh+sqLeSRT24/nDM77BNXDQi4ugq0hm5daq
         gBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933157; x=1790537957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GOyD94xneAEU7+yzaxi3P4vCBB/CkWgVuLYMi+o49fI=;
        b=1VA9I3yKLop/W3N/Xmbk5CQpTQ+S0aS+uSf2g6QjF9puT7L1G27gd6mNGqhge/1ghZ
         IFD7rTjVHUD84i7Dv/9Vq42JPaX6wIehNj92B33TcwEFbUqmk3uI0FMQ1Wdj5auoSDVa
         tnTs43i71nLb4cxmtkiJizP/pExMGunZE2/YXdJ6v/dpofMvZ4UDJE6DpUHkgCfCotTR
         jjnBVYi/UUlDUxWUv9KeGie7F/Q4BQCWluG7PUDkzd46OCoANcYxyJS+9slQ805FQiIa
         ROI/JWPXdiaBUZLkArdk209gmcOH/TfIhDOcvh9pzSD2Xht2Vs9SQIy81RZjcFlolRCD
         bhsg==
X-Forwarded-Encrypted: i=1; AKwUvBzpiiVeQpe5Q9nQrIV74vaAQ3U+m63pHwFvlmSxHmgcyz48WrmT3AtPSShF4jOqQ6HTPo/7cNcWGtk=@vger.kernel.org
X-Gm-Message-State: AFuF++nzzTgrjNl/sSl0aeFuLbVDxV1slQgsMTOKz61vRtO3qLieA6Ce
	1Ly0B/8HUfy0+AOSW2b7VIjHq/dxKxj/roMQfEaO+9yo0mTYM29bEo7cfPU3qutQtJA=
X-Gm-Gg: AYBFou3hqkc9A+peLbkqX/tpuj/ct/ZrMP0wFUXbZMxpxGkhkXKX54f6pz/jKwY1sKe
	s1/Z90MxeMKz13lonAdirKFTDDHX79R3/SB9FSMaVtwDy/9SFklGVlF8fKsgzOGhhTbq2ySIYh6
	NW4hvGi6j7Ebii4j7XEpXbKx6z+DOuYN+xbTuDehlGkxDqOGPreCkMVYCjjhWg0O0vxs92VjTI8
	zWLUZCJL70Ouu9LRkeW/3VgNuDe4RdW294xRcJgcixqOq7i+JA8VlRo5bonKZOZp/Ehrc/JmZPY
	HzZKIUeCK/K4X553KQqwntxBJKwzcRnzvlfbv9OSnap10zdzRhXvUmQTwnd+aDMre3qQPEgnp90
	BIFktq6BahvFeRrtpBM+XMR6456/6nIgdi/ei2cZ+WBJJLL55JqwMKDb8pEN2+agSaa/VfiCfhW
	IMo64KVBl6EvXex7TJgu4PTnEPt0BRs4PoLkE2YoY49Rfr9cj+3Q/itZSmg504/B+WpWxccGBpZ
	LkoTSsCp90PY52OIQdONgz+8uosyB6y1kdITSMen3MwjZEXhyeI3ONN0OZmPnzU/3eAQrffgN3/
	6kLNQOQuSLQz4lMBrCQ=
X-Received: by 2002:a05:690c:e3cf:b0:845:ddf4:a399 with SMTP id 00721157ae682-897308f89e5mr31680887b3.11.1789933156801;
        Sun, 20 Sep 2026 12:39:16 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a4761747asm18686667b3.30.2026.09.20.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:15 -0700 (PDT)
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
Subject: [RFC PATCH 24/46] MAINTAINERS: Add entry for KVM Caretaker
Date: Sun, 20 Sep 2026 15:36:28 -0400
Message-ID: <20260920193650.3373435-25-pasha.tatashin@soleen.com>
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

Add KERNEL VIRTUAL MACHINE CARETAKER section in MAINTAINERS covering
Caretaker headers, architecture backends, and core execution files.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 23f332cfbd16..86806245041e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14296,6 +14296,17 @@ F:	tools/kvm/
 F:	tools/testing/selftests/kvm/
 F:	virt/kvm/*
 
+KERNEL VIRTUAL MACHINE CARETAKER
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
+L:	kvm@vger.kernel.org
+L:	kexec@lists.infradead.org
+S:	Maintained
+F:	arch/*/include/asm/kvm_caretaker*
+F:	arch/*/kvm/*caretaker*
+F:	arch/x86/kvm/mmu/kho.c
+F:	include/linux/kvm_caretaker.h
+F:	virt/kvm/caretaker*.c
+
 KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
 M:	Marc Zyngier <maz@kernel.org>
 M:	Oliver Upton <oupton@kernel.org>
-- 
2.55.0.1082.g2b9226bbc0-goog

