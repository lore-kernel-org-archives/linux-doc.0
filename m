Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997F32D441
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764089958; cv=none; b=fssOKLhDa9J1H2LKxdQKrZ2/FMTuxpRC3akfZa8xXqq95aNX/IVZr8GleIfuDG+8EEBrjbQq6jv4BYbb/Xh4GBEq5FVX/B9i7PGqxQa70DhaeAS/iBCgoMuLzWGh9kbcchQx6E4IvTiEtcVVGs061glMBSGLoBJHBlcr8J5nU54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764089958; c=relaxed/simple;
	bh=rtE+Ceb6uvxsJ0lAv2S8AcwD3k610VK53wkRvQDM1Hc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnk4o6i83hC44jP3vQVaaWVaDbN9ZKD12S6BOh7aNrWHoZo+pqcXMXkLoTRqg0ZNHrUOm+HiZdmZdT1oU+D4ZciLPlCIyPEalimhzwoza6GNTR5esnUrFk2orBPIKFL7rsiAgTao26nYEsseNIoWmIT93YGeQOIdkgojRwsxieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ZnbNAtt7; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ZnbNAtt7"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78a76afeff6so58534047b3.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 08:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764089955; x=1764694755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2VZ/uSTE9rekrj+aF+jwkex/aSDTyF9XJpHnZs+90c=;
        b=ZnbNAtt7KY+wWAuqReoR2RU9F5Ma3kWXG5zsoZkHcnNSfQZKMB/3hC9D3dSkFO0VhE
         dJy8Dj9mMLwDiIA0QdIQCYl/jPGvqqlVMJHKMvv9PN5Y/yd9M+uOXNUXnQL+Q6TBTJrM
         BYEWSJCK9Lv50BX48dq1nDOYVxPZJFdLdYRkC0F5nxKb7cqbzoaNZsaeSLYj0pVsn+8/
         ktOUlFYKrl+Hl2/xFPou+GGkkv3nk1P0q8g9vWm5dVUB7sGH3AfD1xO0SkM9MztzJ81O
         bwKo7ppBP6V1aNqe+mIKt1B67oEK2t4AcDapv3I+b1vAemUHDCsraUHzHaRDf0fyPDvR
         PqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089955; x=1764694755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n2VZ/uSTE9rekrj+aF+jwkex/aSDTyF9XJpHnZs+90c=;
        b=YiG58WtnwxXQTlIStO3HD9IsN7jCvt+zQ3dhgn98ZaVUTkPsUj1fx91wVIaABDeBb5
         yzDRAlHf4fGRfWM8WG5961KhxiFGysLL5J6cZDnlZ2QOeVVv9QXYIH4TNv0cn8YKKWBN
         CEYXaqG+8pxN7bsKtor03oIutcqDWd1oHCTcM7SBU1t64oBZccTydBNHdHQtEjMr/azk
         7XI9ceJ1bk5LdMpjmkIZZn6lVJE6H8Utnfvpiaxw49tyywqGrCkCeqXW4drt4u/f7PKY
         PCkzVVKCeb3bDZAGi2fSyUD/kCUwy/SnL+nzVpzAaBJiI1qYBfK2q7dlKEjfa1ubiWh4
         8Jug==
X-Forwarded-Encrypted: i=1; AJvYcCUgGESGDgYByaeCCALqtnR8nJVj2RqeVTGYmNpdVzqnQOiShwKCgkEfOTsX2r0XNdb09NsqbYb2dqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/XbnBmZF1AJ3qUfqVGzY+fyJN3Yf6W14c+UQrGOn7PuCWS5ik
	AcPl5TSNh7PwQcAmMJ5WEy9sRPvnUgD1/Te3SVxQF4ZTuPsex0+YpNDXMnAYuQXPJrQ=
X-Gm-Gg: ASbGncs4HFCvZ037AL3ar01L+9n14dTGL9Bq/tB9aEDOzh4LO6qmcTnx0LD2rjZJP1N
	0DAbCvAqiZTb56ycFI/ja8hQlNtFAo7U6lqDgE1WkUMgTmQNAkl+ndVUNBxoVoy0YCxJK8cc+xL
	pIfvLTL5T23yqMejquTsnHO8+bEuxXsyJLlTMqPXqNzwZGUOzYrryuXfT+uR4RihkSatVxljp9D
	gt63VFvouPM9ZuFDHjzw/jAEaN+Pa8Fj7Ag83Z76gawXn0cBBPrLCAB2hmhG44pl5VI3S2bnmgz
	mtIXYZ4vjlsrKiN0NYxyS1zqhobU37A+jc0BtJwqSbpSFq4WlepJx+t5zcxMUY5fTJf78Qxw6ZY
	S+zTAoBD5DjeP42A6G+JXG9kUF/o69BLsRGAeZDdlnuzSlC+vMNH+ibWy1wNgZei2jWM4U9+hPM
	Znb14n8i/WCV2QMzR7m1+90qEr1TWnd3JWR78AJRuTLm4AbkKnD6CJnp8b/JkIfHuDJLUBKf4nK
	p0oUv8=
X-Google-Smtp-Source: AGHT+IHp/uLRINC+2mEmiuoSxBmCL/SWIZK6CY7B3JageMUTar9wmfaPytTKzucTyEwNZIYxmxjOcA==
X-Received: by 2002:a05:690c:61c6:b0:786:4fd5:e5dc with SMTP id 00721157ae682-78a8b53925emr120116757b3.36.1764089954718;
        Tue, 25 Nov 2025 08:59:14 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a5518sm57284357b3.14.2025.11.25.08.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 08:59:14 -0800 (PST)
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
Subject: [PATCH v8 09/18] MAINTAINERS: add liveupdate entry
Date: Tue, 25 Nov 2025 11:58:39 -0500
Message-ID: <20251125165850.3389713-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
In-Reply-To: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS file entry for the new Live Update Orchestrator
introduced in previous patches.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b46425e3b4d3..868d3d23fdea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14466,6 +14466,18 @@ F:	kernel/module/livepatch.c
 F:	samples/livepatch/
 F:	tools/testing/selftests/livepatch/
 
+LIVE UPDATE
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
+M:	Mike Rapoport <rppt@kernel.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/userspace-api/liveupdate.rst
+F:	include/linux/liveupdate.h
+F:	include/linux/liveupdate/
+F:	include/uapi/linux/liveupdate.h
+F:	kernel/liveupdate/
+
 LLC (802.2)
 L:	netdev@vger.kernel.org
 S:	Odd fixes
-- 
2.52.0.460.gd25c4c69ec-goog

