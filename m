Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5216E555
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 00:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208237; cv=none; b=hS2fkWpBxarcjmiJbUf/8qPE+s0Y3VrKJyCzU0+5jWpFe1/909AK+SoM217+wIvqI6SPsCas5oCO4Rb1SMciN6t1j5q9gVNRWChTB6X53xAJR5K9SYo4alqUhdi15sVP5YTLMgx8Er7sj9lfyb+1RPrJiwoOHJX+Rg39UfSljHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208237; c=relaxed/simple;
	bh=iZPFZgQbgKdU/tvsRVLCVgrVInHLS80+ULscTo4g+3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfFFRRXppuNMLAhv08+3Dm8lNmMUQGy0dORHonF79KBvvnBqsaB3ZZQrSiSz0Jw+j4OfzaeV85IKMVj5U3KXajCsDnaW2PWrXHROq3azr0hOAF2Xu2lWqFSZdbXrIMRsMR9R5PUw1lI+5fi9ITCyv4/S7sSTo0VSHeCHQpu24GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mDl6+bAK; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mDl6+bAK"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d91653e9d7so131817526d6.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 16:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1736208235; x=1736813035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWCvp/kko+WPP0qjUKzUrB7Xv2NearCGyN4SJ89IJRc=;
        b=mDl6+bAKeMC3+GqaLot4jpfYOz/L8D2t+w8mKVjyM96revjNjm3C5zZgT6M2SknL7O
         tuM/2N/n0lKR9Yi6Hpojp1fm8gydKh7woW+6mWjFa8zj1mLY5Qwx55RvDkRaQG7ReR23
         TvzILPopFmsrsmmc+YOPJklI6hI8JW/ab+zAboT2QHWTeDAvWvge1QCYL+l3O8cjf3bu
         Sj2gnKF6vEpOpxwklhNJx21jWTlPP/ocA2uF0DkSpdfRgWz4lPQDTJAHKuGqykNSsBum
         1jA6LDH7/n1V+WAD3DTH8LLn9a3jYy6sOs/jbHtNJ2z+0CkJg9BuWO836RCR4nfHemd6
         L4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736208235; x=1736813035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWCvp/kko+WPP0qjUKzUrB7Xv2NearCGyN4SJ89IJRc=;
        b=hBCARi036QzSsQ0vcWn60tvcJsVPlSAit8wkwz5uSyMdUE/lCBBG4lJY5tQR1caBss
         KQ7B7y/Zdd6BKJpiq06eFHzgoipcm3gCew652GESfOg1AuaaVlw/M7ZKeH3TtBnbhmkX
         bIKEhMzPcize/gYWKsomujHgM/T77tCwoQNJ+0fAWJQ2jSbT3Utimt+YxwrWdA6FJ5V8
         2Owf1VPYEsP0E5dWT5XPnEKA82H9CmGXcM0uVoVwEirE2s7EzS1tximRmhBHnD7Jh+XE
         2uQzleMyU3LJwj6FCtgg6VC4AGlNR2TtiypUKGho0wWIhyaiGyp+7hej7saQDT/J83Y2
         u4zA==
X-Gm-Message-State: AOJu0YykZeNL9R/8qHTnqCbBgnBHCbYfjgyNtXcP9cHHBpYRGEn67Uru
	5LiXzr9BciOcl6y2m8e11tbT5Ui6wq8sCWky3k6eJcBq2qcuF8lVONe/xJOY7ew=
X-Gm-Gg: ASbGnctoVUfTmTRGUHWFLlw3NwI7e1mNhExKWmBnXHUawJx69zFPX8y8qNw1YWTg4P/
	bZ1X2n90ZrPj7FfrQXBC8Cb82CnE2I5oG3nYr42P76EXOGqhJb9VaeoL3ROBVGmAmBx3pd4aI1V
	zqpzQRmYmp/Xf7agkyCkVi+a7eYMpFBWhWkgFqZh/t0iYxeNGN4+yZn5Us/oxOLywhpTslSLlnm
	uNy1VhiYV7rZ1GEOOwVlcWcwX72XtVoSXqYCgD+9eKx7F/ukvjYD3DEm2E4wjNbX6fA7WIgsieF
	nQstYZqqdlFHygqiijq6c00QUu4DVyjlRb4rrUI36//J
X-Google-Smtp-Source: AGHT+IHrk99R5d/+390QkKolkyUXQWqv1/fjT8A0hpydPLDQYb+viHAXemLnF0B4ZPb3yXMDp4MjqQ==
X-Received: by 2002:a05:6214:c4d:b0:6d4:3c10:5065 with SMTP id 6a1803df08f44-6dd233a0527mr872530576d6.32.1736208234983;
        Mon, 06 Jan 2025 16:03:54 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137218sm174104476d6.57.2025.01.06.16.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:03:54 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	david@redhat.com,
	nphamcs@gmail.com,
	gourry@gourry.net,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kbusch@meta.com,
	ying.huang@linux.alibaba.com,
	feng.tang@intel.com,
	donettom@linux.ibm.com
Subject: [PATCH v3 2/6] memory: move conditionally defined enums use inside ifdef tags
Date: Mon,  6 Jan 2025 19:03:42 -0500
Message-ID: <20250107000346.1338481-3-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107000346.1338481-1-gourry@gourry.net>
References: <20250107000346.1338481-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NUMA_HINT_FAULTS and NUMA_HINT_FAULTS_LOCAL are only defined if
CONFIG_NUMA_BALANCING is defined, but are used outside the tags in
numa_migrate_check().  Fix this.

TNF_SHARED is only used if CONFIG_NUMA_BALANCING is enabled, so
moving this line inside the ifdef is also safe - despite use of TNF_*
elsewhere in the function.  TNF_* are not conditionally defined.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 9cc93c2f79f3..8d254e97840d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5571,14 +5571,14 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 	/* Record the current PID acceesing VMA */
 	vma_set_access_pid_bit(vma);
 
-	count_vm_numa_event(NUMA_HINT_FAULTS);
 #ifdef CONFIG_NUMA_BALANCING
+	count_vm_numa_event(NUMA_HINT_FAULTS);
 	count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
-#endif
 	if (folio_nid(folio) == numa_node_id()) {
 		count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
 		*flags |= TNF_FAULT_LOCAL;
 	}
+#endif
 
 	return mpol_misplaced(folio, vmf, addr);
 }
-- 
2.47.1

