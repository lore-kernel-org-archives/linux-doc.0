Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96181C5F37
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531094; cv=none; b=GWvK/ySeIQVcFv5fgicl67arBvuxhFs/rFJNBHfbf1aVJATKZQKoYjtYpi0Jy9tymIkZGr47RD3XY9Cx3j46AHNi1/9obkpCv7MFIuu1w8/dhFV7QEs1AMSapu3mj/c8a18HSnq7VT1u36yLB3IwLCam8OFw8jbN6u3hrgCJc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531094; c=relaxed/simple;
	bh=7U4lml8t8oTaVKuCLMpzN1Wuy07LH0AEtgZI7ZnzuAo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMaD4vCrxv0PYI1STEo3qx31dA4+5DhypRkyf/gcKznjeYdTULYVHqI5jZMTI9jY93UpAVN7FZ5I0yhEDDR6+GkAbTj6afGEPv4FKah7C+S7GXQBZk5NB6/r4qaJKplKSmbVdQ0Wzzo9XvFVQvMX/Id2U9yLka1/hFut5iwvupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=jGhRq5J8; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="jGhRq5J8"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-707453b0306so5567726d6.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531092; x=1755135892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaESzk2f6ioxFaB+zOVCWa3oEolQrGNRo6YQh6Uj768=;
        b=jGhRq5J8VB7lIKnNpy5IKMw8o759Wi8rvUO67fzgAAGCCCNNALGWGFCvUy8qIR2/LT
         DXGxW0APa9sdDaPeZEwdzz0T2lICen0AXKPPnAznTYEJWRHZQTfte+Svh0/PKYE1wN/E
         Hw9FP6Y83KNEBd3R+497m3ThktAMJAxFcsnbHwhRHmebFfa7+opf19X8RXLo+BdSY3gw
         vj1YvsosNm64zjFspN5YAkjdnqvhI7zj2WOgFRuA2hBLMN2h7r3WUF31CD2F4GR4hOmR
         qf6OOUYSKXEEXnkxZcjMDk/tFAuea95bcYCzFRjAcDrsVywYcGTLqOzHgv1pcuTLGqrI
         F8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531092; x=1755135892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaESzk2f6ioxFaB+zOVCWa3oEolQrGNRo6YQh6Uj768=;
        b=UUMicEKtxiYpnMFGaK8HDBeFiGgcIH5XqqbPs/3idbRjR4wUfuYfqLwPTrottaYaZV
         XpvV3px+ah/oLyLo80WztWmzodxDa549YB7FP2ddOll1g0Su93W96RGTT4AAy2BA+lF9
         1AFnT7mwJ1qHPAAXxNOZpXbyZM8r8erZqFJf569c4cfED9OrrHkCN93tP3nKNg6gDJdi
         CLRV9mIdvETcbBSew4m4Br83mZqESx5VgF76D7cHvAFAZCvSu2NLa0kR9j9tvG+fGgag
         Gx1bWFpYXoWFpl1eH7gwb+iXptZ+QrwjsyiNYpB6m+RG7CErUQDKGfzIDY+guoEDr39a
         jTvw==
X-Forwarded-Encrypted: i=1; AJvYcCVlwPGa9z9aWEl+c73eB3fLhBKfMv33MXe2FmV2ULR+S8DWYp0TNDvD7P1Rhit4sG8ZgcOa9dfcXN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YytdH9ODQhG07faSR6o8iFzOSMIZ6xhJqwAq0Un+Vs3k9nabetN
	yCJTo1qUjJ6LTiIOTT26NlkL3vPTzW7UQt0wAr8NgVyKaAV0Y4+KOp9G+HkGPnSOOZY=
X-Gm-Gg: ASbGncvPsYEEbrsfg+ycqC40+cIkuevWUBDemIsyajx/HnhH0XeJ+19BDzlLnhPl1CD
	GdwDV+b9tlcB4i6LT4JesI7pTdtM2bLKZi0kKCoBOV3wz3C8P7DrGAPsTLhdyF7KuY8r3Nqjqbj
	fdIW5V2jZ/3kSyiXmOVQs7ZSf8uR7BH59koVzxAZ7L8aP2YNP2BeOx8nbyzTRmfQ3zb5/6F28y9
	yj1AdlRr5Ieg177cewDQyj5Q668fnh5o05eRJXV9H6r/oc8xvvu7/f8w2TeLbYYGzaN1TMCwLjt
	jIUGbJeiiEP8LrklFHnBxnwaMS8cB3IlRM/JtmNyqNld+jyH3BSkburEZ8Ewo/j17nSUpHhSdze
	UImmmwEvtJRFzvTLof22ppI47y/m0s7EyPAV+vTknBaNtWSQ6o4cvDZjwtvJ7OJBJgudF+oBwJ4
	fca09c78pdeZeP
X-Google-Smtp-Source: AGHT+IEyWMvTBlOM62kNmVMKSSB8JNc55ip6AvkaRw6dwIN2X5ATQTWFGGBA3z7kK5RTd9pgC648bw==
X-Received: by 2002:ad4:5f8f:0:b0:707:4daf:637 with SMTP id 6a1803df08f44-7097af1440bmr64537216d6.29.1754531091759;
        Wed, 06 Aug 2025 18:44:51 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:44:51 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
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
	zhangguopeng@kylinos.cn,
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
	witu@nvidia.com
Subject: [PATCH v3 03/30] kho: warn if KHO is disabled due to an error
Date: Thu,  7 Aug 2025 01:44:09 +0000
Message-ID: <20250807014442.3829950-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During boot scratch area is allocated based on command line
parameters or auto calculated. However, scratch area may fail
to allocate, and in that case KHO is disabled. Currently,
no warning is printed that KHO is disabled, which makes it
confusing for the end user to figure out why KHO is not
available. Add the missing warning message.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/kexec_handover.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 6240bc38305b..c2b7e8b86db0 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -565,6 +565,7 @@ static void __init kho_reserve_scratch(void)
 err_free_scratch_desc:
 	memblock_free(kho_scratch, kho_scratch_cnt * sizeof(*kho_scratch));
 err_disable_kho:
+	pr_warn("Failed to reserve scratch area, disabling kexec handover\n");
 	kho_enable = false;
 }
 
-- 
2.50.1.565.gc32cd1483b-goog

