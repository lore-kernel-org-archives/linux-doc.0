Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C026A1DB
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954487; cv=none; b=RT7Th8y6/nhhfYD5l396G86VZSGsc6IsYJ2noRimXUxTZjwAiup75wlzkJfyl4+cfYiTwLFbxITVj1vxxRPsc6WP6CnStnkCRV9FT23zK3bbK1BHMbyhgG/6Kr+VfQlFur5t8hzi+2ja1jerpKPxGDyvYGEBB6i2SpJkvAbB7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954487; c=relaxed/simple;
	bh=6AgqMNboe7B8nPvHCdPBbiCcZOlfMl0j+JQ0fzt3kCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LfqhjctTtMklDv0QWLHfC29KRSwe21t8gj1k7bPVmOUPROBsply1QVN//DDfCDg9KYwoTqPnF8EtDJ8iQUkMeNkJ+H2cahVx13+hgE+GAUglLDBbhPjfjiq0e3Vs+hNM+w47im7Ti1JTxBefCgpK1TqGiJqlELiIQswj6eru5d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=M6579sxP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="M6579sxP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736b98acaadso1595609b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954486; x=1745559286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=M6579sxPU+NsgvFAaOf4J2OAcwSRleaf2ayPQCBbBmMlo/8PLUkoJbiVrGRjKlzMNz
         xMuNpRoGzE8HsDAeQnvF7Yd9+p65RYOT19mcEWIP2Ocu5CMqzxnAgkutMzVFnyCayNOY
         yjFzmWucInILlH+LCNtsPK5ckBv3hd36A9wFuYzVZL1Mr0sGINu5CNmUGg5JzeLk8x3g
         O4cErdt/t28bXHIWiu11ZfkAOHZSVmmJgLBqwMT3Tv5B90ZepTmyuHNAAO+Zzju8Cfoq
         E1HBG4JakyvVAKDVfkgInQB0d8s4tufhXnaAYIhH8u76o8GA8qNaqhX14YfGchAXoSki
         CpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954486; x=1745559286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHR6GhsJ93bX5ZzvrljhM09iosbdwKgwllH+L65tMJE=;
        b=dOdMk4lHs5RQ+L5OHVZB/wKP5D/UP2Kn6zK4l5FJtHEjFoymiKiDlMUJ/Wt5fajldz
         KtTyr0j8UaHV8FNVjORTZzLqVMpzCpvHg2afu5HdN+HArVFLBdVI44asalo+FEuj9Mto
         W71E2rg02d2dO+wjSQE0fbEy6xAD8rJLjbv7P/s+3PDdqgOa838y02/V3bsAbc9sjgqA
         sNtTua9V5NHiwMW6Lycdp/cEg8iWPNRaPQU5ByUvJOXVn/UWNZpNusEG27HCngQJRKU4
         lrUmwUPZ19oWIiH+C6+Hl7cncHHRGejxnqjEMOJ06DOlC/tEu/SfdC4zqlyFmJBCo3CT
         fsPg==
X-Gm-Message-State: AOJu0YxHN5s6kq8vomsLdFnxwblx3JRnXZnrMGzx2zNuvA5Lj4R58XkD
	191a1/YpRjPvE+8Q9dLaUE5PO2Ab1CRDmbdmjPnuJ/KdUYyevhhifUq+4AdjdYA=
X-Gm-Gg: ASbGncsqRdI/eWqblWI/vAloitOICWY5y2e32tEQj+x4Ds6BKMe3VEISYXLM/7MX4VA
	YyNvi5LlN2QuMjJuKyUw4ggkUNXz5VbSF35WN3NIm0K8vc5TsVYHWAIYQbdwbnVKiqmQ3FJRCYJ
	iTgC6O2eJjZAOOuF4N4ZZ7yGPNLiWWjuLW8ykFE6rvey1qDENF0zDkPFzW9PMK5uh96Z1rq7DJF
	1MpDFV9ZkjUSoYfl6ViFxp05r4SrvvmS37tvr06OrGVRUSFzMWPGgjg9uFLIdSOib7fydqj163p
	gFh7xFHuT5IuyDewV/WGm7kfoWULGedihVQCRgwZvu5yOfi/gYfMTOGNM0WPPV8NUHSwJ1+pmcx
	L2RWg6RTYH7g=
X-Google-Smtp-Source: AGHT+IE94GrG6NgY94ivBPu/h8Nj3d+BVoWj25z9GYvOP7uZPO9BGG//BTMuP3HCRMD4vlqRI/woGQ==
X-Received: by 2002:a05:6a00:4acc:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73dc156f96bmr1971764b3a.16.1744954485769;
        Thu, 17 Apr 2025 22:34:45 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:45 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:39 +0800
Message-Id: <20250418053239.4351-13-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hwprobe for SiFive "xsfvfwmaccqqq" vendor extension.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/uapi/asm/vendor/sifive.h          | 1 +
 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
index b772d4631284..9f3278a4b298 100644
--- a/arch/riscv/include/uapi/asm/vendor/sifive.h
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -3,3 +3,4 @@
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
 #define	RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF		(1 << 2)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ		(1 << 3)
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 2b9505079a9f..1f77f6309763 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -17,5 +17,6 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 		VENDOR_EXT_KEY(XSFVQMACCDOD);
 		VENDOR_EXT_KEY(XSFVQMACCQOQ);
 		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
 	});
 }
-- 
2.39.5 (Apple Git-154)

