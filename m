Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359261E47B3
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531102; cv=none; b=T8uLKGnUYVAELTfGT6JK+ADQGzi9Ai1P6udBErpBTdSQg/LiRX/cMwyoEOOp471DLn5zbNyYQHNTMJH/qUQZk+cDJ/yCube3BGhA5o+lf9Xio7tEJ42/Kkag61y/AqIlOqVfIFRbb5i/mXCsYFtz/xn+AzrCt1XlxrsUBM/f5WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531102; c=relaxed/simple;
	bh=vVfONrVyjedFUgoOJUn6GW1APtTwOCiADsyg5cO0faw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxxPmP9w9cKkX+QeRmmQhPav4bYzlvqhMaZr0mjnSwNQvHegKLK8qPEFhXGYpT/++yrSNT3lalkOIZy8VT4yjFeU0el0YBt6eJgaZUM58LqfE0zKnEWPcUF24zgQgN2LG3M6gj/vDmYIJXcoPD11wwzWaNaMNLcs+3UT/3sR6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=IQdmmI+C; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="IQdmmI+C"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7074bad053aso5410306d6.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531099; x=1755135899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7G+m/ldx5Lte6prj7fLyPcxxJI86crKx906ZhMWQQk=;
        b=IQdmmI+Cv+zDt/QzpCqEFU+RsJufI9UrlJanooqH41E/pSGh2xBX94CkOdyOKWaTE7
         Bmfm0FqP5g2LTu+YVfYqUjdv6aCwkxI20wKMnNTgpJ05adCDLYJ/C9qFtb973WX3Fmhn
         tJx02/qy0r90B+GLvXJluBS2j+PwRGuaGT+AHB8wqAkuRZEzhbmn+cN0vhz0y4kS+dl7
         6m0zEJLm/8tzaLdZN8ZNea5IuCPxRf/aQMqzOltWNW+mkVfprHfbV7Rudb1IJatZGWeQ
         vIPQO7P77to93JH+NOFLHZZa304TZHzbfoauEnSih7VdITG783ffpWOlvKUQmDazuXzT
         FJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531099; x=1755135899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7G+m/ldx5Lte6prj7fLyPcxxJI86crKx906ZhMWQQk=;
        b=HT/EdX8jVbsuNn8FDU9cJ6uLDP9YfbCzTwdCpOZZCHT0j+8iMVfehI/Ak03KAIZI6o
         Z5S+IejUhofW26szCwiiFfRJKG0GHwZw+n2fVBY9lDoP/AHUkx+Xo+jXy+3qvZ7rXseP
         RnLbH+Ma4FX3jdvMnsKx+ZOhJv94kfzUU44TItDnzzttQrmEE1f+46cBTDQykFI/odtf
         siQWjnUsgAZ2J4P/43jUQ8bUfCd2xWxL1JZgQLtAWVuU81FV1MZwuYKwOCDtwOFOFelU
         qDHEcfTwHoO+AGLV9DHa81MdSskzBxYSSGfJPxF0avZ4bOQQdMI0i7oMqOTLMrH/5uXC
         meNA==
X-Forwarded-Encrypted: i=1; AJvYcCWJvM2A1Yxi3u5xcJO/Qjmo+5LaurDAj9ZBp5NWh94+z/tWmpmEkcgZMzktgSsEXBFgdb+UO2PeAf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZPpeTFu580oyWb1Cv/9qxGOK8ROmS/yuTzjQw8ln9YFX4mZOi
	W3Aai1Kbc6piBHpIapL5/RIDMgIVZra4WH1TObJ7DgL++yBvZwlJ68OPmfCnh3AHWOc=
X-Gm-Gg: ASbGncu6RuusbSmJr6oS50HudHkKHqmqsPniYmRTCcVgKhAkn+rV5IQnVW/6BLVy+PG
	94OB3WlCuKBjAmYzDgBSlFOxQAJDz8jc5paIPMnPYJh4xKj6p89SchB3yenl/C7FIVL7cWzEyDW
	VkxEWH6c2ztYia4ZNRdl7BCg6GD5Ys1wncjQI3bJgVrTabrSLsERxm2pNa44L9lh/jiU877AJ51
	qH3nvjmD8jlhetGf1edJ2phTHcLV5K0gZxjxbDs5LA6m4K9ZWJJhkvtV8IrvkBbp3DZV7UdUwUk
	su+NUxTLH/McNLSkscMdB+QY/sLkCFRP5nlaedFwnmYbxx2tOz1bc4jcAuuLYvRqm7uWpbZ6oly
	hA9m1cAYLxFqdH41nyruLJIhZe2KDqzRlNXTfS5DcnsAM2UlAZXt5vRdCCLSrY9p3wgkKH+LQsV
	8SU2unKnD7tfGR
X-Google-Smtp-Source: AGHT+IFrm+HnX+DKqjrzyDEzZevUOzkckUB98RzWsO6EpAjPOvGPrTYO1ThdZbbOoF0JmkLR1SS4uA==
X-Received: by 2002:a05:6214:c62:b0:707:43a1:5b0d with SMTP id 6a1803df08f44-7097964cf4cmr68796306d6.41.1754531099046;
        Wed, 06 Aug 2025 18:44:59 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:44:58 -0700 (PDT)
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
Subject: [PATCH v3 08/30] kho: don't unpreserve memory during abort
Date: Thu,  7 Aug 2025 01:44:14 +0000
Message-ID: <20250807014442.3829950-9-pasha.tatashin@soleen.com>
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

KHO allows clients to preserve memory regions at any point before the
KHO state is finalized. The finalization process itself involves KHO
performing its own actions, such as serializing the overall
preserved memory map.

If this finalization process is aborted, the current implementation
destroys KHO's internal memory tracking structures
(`kho_out.ser.track.orders`). This behavior effectively unpreserves
all memory from KHO's perspective, regardless of whether those
preservations were made by clients before the finalization attempt
or by KHO itself during finalization.

This premature unpreservation is incorrect. An abort of the
finalization process should only undo actions taken by KHO as part of
that specific finalization attempt. Individual memory regions
preserved by clients prior to finalization should remain preserved,
as their lifecycle is managed by the clients themselves. These
clients might still need to call kho_unpreserve_folio() or
kho_unpreserve_phys() based on their own logic, even after a KHO
finalization attempt is aborted.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_handover.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index b2e99aefbb32..07755184f44b 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -778,31 +778,12 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
 
 static int __kho_abort(void)
 {
-	int err = 0;
-	unsigned long order;
-	struct kho_mem_phys *physxa;
-
-	xa_for_each(&kho_out.track.orders, order, physxa) {
-		struct kho_mem_phys_bits *bits;
-		unsigned long phys;
-
-		xa_for_each(&physxa->phys_bits, phys, bits)
-			kfree(bits);
-
-		xa_destroy(&physxa->phys_bits);
-		kfree(physxa);
-	}
-	xa_destroy(&kho_out.track.orders);
-
 	if (kho_out.preserved_mem_map) {
 		kho_mem_ser_free(kho_out.preserved_mem_map);
 		kho_out.preserved_mem_map = NULL;
 	}
 
-	if (err)
-		pr_err("Failed to abort KHO finalization: %d\n", err);
-
-	return err;
+	return 0;
 }
 
 int kho_abort(void)
-- 
2.50.1.565.gc32cd1483b-goog

