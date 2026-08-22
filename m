Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4D43A4F26
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401029; cv=none; b=SW9HRkF4BUVo2Ptc6iK6Xrf/MPrXBlXYLY2yIcv0aRDTsG3m1jT7yKrODeqv0NE32ODTuowWhB93Z7KbHZTb/OGx7O7DCf0CC/wwnCG8M7QUmG43Izd2hcrwWCWlUk3axgZMsg9P1HQr5QU86z4fZUJdgylqrDZKMa/hOXn4uWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401029; c=relaxed/simple;
	bh=1fy1LurvBpSQJ0IcnuRbBQ6HFaqNycpADyEu7PtWEG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E4c2lW1ldGiUcDI5VOxYLDt7r9lYcZ3kc4oGdnvei+1Ny7AB/C9IvQrCAuUUsVa+JMqTAqh81FT0/n0RN/YjQOn7V+Smof5eEs2MPWHR68SAft0ij7IGWAu/sDGWOsgsS1QRBmV98Hy8zPk7FORfbzEWWzTXnze2WUutXSczqlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEpzgvXU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEpzgvXU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso5233049a12.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401026; x=1788005826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdgDDmcZIE8pZ9Isk6EdPIHs99JVC5TC+2vV1P6Q/oA=;
        b=cEpzgvXULn4lJxEFcirFmyR+SJymgM9OGfy6GxAtanB09ra8Hpywp9hfU0jkJrrm9E
         swgtecsy655AXOwKzqi1oKIDKA8+FrJ9fACUQHU4ul1s/yP/VOu9CltQcRONhT0H3QUU
         aWor+pour6xObDbZ5g0ozs/9YjI14HaBOUijBlY0O6hERDqXBc13V+7UdNVpqzLs/Amz
         SZkodg+fkQTWyVuaIkhSp9nSmYSTEz6tapNGcMkUgS/TjLgSbxQHfW2BPCPDfq2kl83j
         4FiDWpUUjQSM8eUzyxhHK0F/j3I3Ulc19v43qVoBE/+LzDcZpP26q7QGFKqndU1SbpDl
         a4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401026; x=1788005826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdgDDmcZIE8pZ9Isk6EdPIHs99JVC5TC+2vV1P6Q/oA=;
        b=aE3FX+Z4sZ4xnz9uaEPg//UrgHsRHPa4GgFqebTBlFXNSbsrydVTACpAZvXFMYNbYG
         DzkhpIp8z1U66e7EpeeqwJiFJmSO2pYzWan2RibadCqRYmC88UvMS6AUOokhsp+njsjW
         QsYA5zWaMjYnHfV+HtLmdR0fufr8fhif3m/MhNGUL85tIs1v28G+q/WkhHaM4NNypwLT
         TdcGY160r1CetSUDHe2a4Dod6XEU3lpnsRcYZFYJPGzgNAY88Nuv9/g36CRmZzNfm0eG
         PcsEOG+vC4fUxZYrVZe28PxctHCsp5kpM2+lyql47SVRLbBuSToDYq5PujvE3epXvPRx
         FGcw==
X-Forwarded-Encrypted: i=1; AHgh+RrgpjFWue23igJQQWctnsqVZ4lJCgUzCMHI65BAG8+++zgjsDQlXgE5wgt/FWUqSCizy1TV3ESCZUg=@vger.kernel.org
X-Gm-Message-State: AFuF++lRqLumMpc00/YmarsaOmL5H1N7cmaw8FflJTNogrZve4Kma63N
	WlYVrnWoDh26qBT0dYMv/1vfzObkiA3d5Z0ZKIWfn0GQuuKJV43FgNBO
X-Gm-Gg: AR+sD12lEhheDYH5/+4NtRbJRp1JkCsMrMVEx4mWTXKBjOKGhtH2v1KEM3N3bj7xaEB
	z+poBd7f09ayKNKsSHqma6Bj/JY1CjjkR2pg6dCtY/MXi6ckuxojZShK7KTJYFtfjEP0hMiqzNl
	RJBPSMsJn5Wo5MK06Vsc291CHBF4Iik5k4y2FSImzihLPXL547XOmWu+nsOP6a7tSuoI22FuMqm
	kaDH348SMvLrCci2t1/aB3L0+OL628bdU78K4Ua3jOguqf3kCIOB0Iwu/mHI5Hssio2odYnIgyA
	kXGKP6CG06IOrOjEyly7Zu+f/Fwe40MXwfOMExipEWJ517nvE2zhvfilfJi+jsA5yPx84U91HaJ
	3xJl0+B/KiEdFrME/h8D9D7FK7mZo9eJWBLsGpUkgw5XQhJj5pEal6FZuFvN/6t3aYrjcL/KWOM
	Mdm1D8lBE89zdNUxp+ZhmkIg0sZ4PrHaNkA3cqHtzfk3v9e++7VwtF0j1jRSf4Nm4OpyDIsrj8A
	4mjMkjwg2nQleoFrzz0J0g3vmZEPC2FftufaKeVOvVwJOzHh9Gau82i5fbpLokSHXQKY8zUZ5FT
	UXusyG9xOk4/OXMvOO3lqAjLnOHRq8KjZPRwiJFzJtMbKldxIKm12zteidvwnMmYxWAi
X-Received: by 2002:a05:6402:e93:b0:6a0:584f:454c with SMTP id 4fb4d7f45d1cf-6a42f28ebaemr15388763a12.16.1787401025799;
        Sat, 22 Aug 2026 05:17:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm10998322a12.7.2026.08.22.05.17.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 05:17:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Petr Tesarik <petr@tesarici.cz>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Michael Kelley <mhklinux@outlook.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] docs: swiotlb: Fix maximum mapping size helper
Date: Sat, 22 Aug 2026 14:16:48 +0200
Message-Id: <20260822121651.1559-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822121651.1559-1-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA helper is named dma_max_mapping_size(), not
dma_map_mapping_size().

Fixes: c93f261dfc39 ("Documentation/core-api: add swiotlb documentation")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/swiotlb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/swiotlb.rst b/Documentation/core-api/swiotlb.rst
index 9e0fe027dd3bd..303999f09ea03 100644
--- a/Documentation/core-api/swiotlb.rst
+++ b/Documentation/core-api/swiotlb.rst
@@ -107,7 +107,7 @@ A single allocation from swiotlb is limited to IO_TLB_SIZE * IO_TLB_SEGSIZE
 bytes, which is 256 KiB with current definitions. When a device's DMA settings
 are such that the device might use swiotlb, the maximum size of a DMA segment
 must be limited to that 256 KiB. This value is communicated to higher-level
-kernel code via dma_map_mapping_size() and swiotlb_max_mapping_size(). If the
+kernel code via dma_max_mapping_size() and swiotlb_max_mapping_size(). If the
 higher-level code fails to account for this limit, it may make requests that
 are too large for swiotlb, and get a "swiotlb full" error.
 
-- 
2.53.0

