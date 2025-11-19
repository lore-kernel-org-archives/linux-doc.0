Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C202D24BF
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567128; cv=none; b=ns03b+B+k16HAwOdFGGUAB/f1XLOHbOMD327q4R0bWivEI5ONoT3Umy/0EZ73vgQkTCGFnXZE6UpGsAaNucpouSuOjbMrIHIQbOFePRiTSXd9LhkRgCIW1o1n27oUIkmQ2evMckWASVUDde3yaV+JR+U5o4e0AeoYIoadjB0n+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567128; c=relaxed/simple;
	bh=xVX5vMoWLhUppTQAzGqUyciUL0HvTWD+fRU1g1HFtlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUCInn1eiu7vxa6HDff5IPY1MQ74LZgxbINfHQ7N6JhpTVfIs3XtwA5aQT1sX6BrurHkOPmjqTqoDQErglQQZGBijgasZb7xqGWaagHBBBB0KdyGubOmDXGeaL1kcxo9w90m+qySKtk6hVOnHg33jVUZUIFGrj4nAk3Cvi6TRRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s77ePi5V; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s77ePi5V"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477549b3082so56837745e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567122; x=1764171922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=s77ePi5VwhAc5RdCjyAb302P4Ka1p3s03BC0V2FspdVUm4i7WYiQ2/MLytX6QDfaGN
         kK0mUXAjWAWky+BcR4OpUoRFi0GuLC8Jj5SFvNrkKqqTO0fWekjRVtmOv5IQvQfdHEQK
         TgXteXNfAy3vUVfU4mt5qaDa2qJFDh+l7TG550TjqEsNBBo3aCcHsKC73Ycok+9pbhk4
         4qiYo9F/ku0uKX/a+S6dfpVvgv0UCLbmIZ6q2Z3sPsILWyDBj5OUEh6kQHBhCPh7EmVD
         hwar1tExtLfqrIQdYXQl1vj4KnszoQmpLBQ0hyx18qnEvaC6g0olZ5w+plmslpAGCUNT
         kFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567122; x=1764171922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=sZ1StBLF936jI//4sF9TETnZ09bIQF9pCxzJ9GMmbSWS6dwaeHDlIxNYm0+49NV8Fh
         qvI/LqtQUjNXoRWVlxxTWBDtity9PQI0lp9CXoArDSdUVFhnXx92sfwq2D/Tt5G1U69V
         wb8OVfWnybUFWBkJVvkznITo5e7L+ZkiVdNmelGlGY5kTpH5ma/0NNbqPPrP+nmWLXqk
         ZQZdvdDiDMwHX/VT6rV0a6WOMwAdv50q0LpKUaL7vx95DkQUZIgjk5Khv8RgdZDa2StR
         lbj+huUke78GR0J7aSY2FaGUAVr66RfzRnJM7WYhhY/721Fxy7CqHhVnEz1OoM3vhT62
         ywnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDnHnttWFSukQq9DANrxUfQFZtJSriRmOZ8taSiPsLaNaHHA8xB7j3nVISoHKTAz2z50lyqq+gwHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzczcBaAiOPZrCCPleZoXu24viT/bVr6YV0uQCCv4RExv0+UmN8
	tVWYl53x970wLsCuElUfR3FdmPr/EnPIEnUvMRHZe3YcxY6ZmWtPqrmxvH0xaR00xls=
X-Gm-Gg: ASbGncvYjITxuHsSoJdMtuP8XBi1QR6lE4nlDfJLX8l9f9RBOzFmP852rP/LvQH/VeI
	DB1t4Q3xj31J2x2qKrMFmFIBJzeIeGlsmFNUt3rcngwObDEjDQwOwn8MpDVyhFbjnnCx9HksHyn
	w2NhiyXxJPurFmtHYo1q86dWPf1vVPYPWnZw3nLacirZDm0O4qt5731Ww9J6Z7SgPeRllMPHj9I
	4ENEunuuPOUu8LjsTqkAYsy1cDQekhYK0HK/Kio9HZKjIq1dZcvlYvtdtezngPMEcGw73YnVG1A
	uH1H/5g+fYnihw8Gg/BS2ZuYbzN3FHXbbDRHs0jp2rkrB20FEDEvkDHeq5gBXEDDHqb4SsJcwyS
	8ABDRrC3Vt1yZH4l/l0eMws7U7rsyf2uQ/uWLeC1ZOBvkjoLtm5nD4X0jYuukAwkczz9uo604Yz
	fBfNAov0dZtdDhybwxjVc=
X-Google-Smtp-Source: AGHT+IEf0A8SfCPAIU5Y+01ECXL2jbadglpozgNAZPe+3fJhQYPBk8r7h45IbtadEb3Wt583O3k4NA==
X-Received: by 2002:a05:600c:3587:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-4778fe522f3mr209598755e9.5.1763567121930;
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 03/26] mm/percpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:04 +0200
Message-ID: <20251119154427.1033475-4-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into meminspect:
 - __per_cpu_offset

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/percpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index 81462ce5866e..cdc5b30f6a99 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3346,6 +3347,7 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *
-- 
2.43.0

