Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C61836165E
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 04:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785214701; cv=none; b=c56jVmMk2WBQ9tMY8kJ+0KYAk0L8XmhSGGnrQvts508C461fYQLmk91CSsSk15kw7E065uvKjmuUsz+fsioBQZe4YQsq2KPZ1IQpYs8n8k1fQs531DibLdsKgtVyPOGz2DBTLRpRU4Ku76/T8EjvPyJDNeGEKXhAhpJwQnv9Zyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785214701; c=relaxed/simple;
	bh=ISP610h0pIjGjDJdZJ9iKEDs9O+oLvjm3WkEqRp142A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTAxt0v6MiESUfc3WKKmsrClv4AH9Q6YqlX/xRRlGrp10aMOHrj+g+1yaOh6qb1tz8678LCPZEPYLKSKrvIEqlx1VfwRV36bBGgQ69oIOXeo0fH05hHN+960tiFQjIuQ3KVaeSCHNmKmfGKsFbrvbSbJ7K7LJpQqBZMHG0eGGls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jexUxzSF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jexUxzSF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc97653887so41713145ad.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 21:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785214700; x=1785819500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZfaESFDQ/TT+cWft73CT875+I8BWbYNhIvagQldErE=;
        b=jexUxzSF2IHF01HRtL3KgMFwuWYPLLE6NCOQvvOBu3meQyDUNtCEB4naSQbhYCtEzf
         kQ4I4D5aAxnXCN5l7wX/8H1+CTicqzZIiZniq82qn+PbuMpQmmbAsXgp8T5oxW9oA7Td
         EpSLfLWmOLgFEbZN+PoDzTjIkFVqzfKOoZ3at2qfd8AjFMci+Da5ldYXAgQfri6VZyyT
         flZ0NDQDaA8KD8Y+wbuGqi/zDvpJ5Ip+Hk7lEo1GPjBC9UOPKN2259oOAi/zzuOoCmVe
         4XKArr6cn4Z9mviSpjCuP5tB4BhcZoOR19lRK5PIkPEAfx9niBVAhVh7e3QIQsTNVnO4
         rZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785214700; x=1785819500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZfaESFDQ/TT+cWft73CT875+I8BWbYNhIvagQldErE=;
        b=HFkVISRSc4q/7atnnqdF2hmU/5qMHLZ4Pcf6noBf99Rep5b19d3QeHky1FuVVq5S7x
         SXRiA/d5TlsL+AHrkAB0lBSkWhDyhB1f99G0xcqkgIbAOukTmxj/szR3TZkz6ZQdBdQs
         4ky9vxO5rPdwV/O5PF7Sr+usqccA1yOpnbkE1h5I0yB3A9OQoHj/tV8N+qxX7nYXxYD2
         IEavolkvriXYb694Z0RzbRmlPHM9lrF0fQ7zP3MsN+lAlUhzQqa/vJzBOcNekYQs/4Ot
         elVubBb1vtkY6LyFDwvqKQ57ihWwEFMdiPmljlN1yjfcgvrYadLk1Ae5N0UPwcRlxUJJ
         mx4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOD+l35F/gBpHUnZoXSZhQWp7CCEpvk64GQlEMgY1C9/zc6ktKNWNSx7BQl6fBEeDVTekx97yiqCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCMElKiLktkDLa7VvPtjqMzmPEfGIo/zSjJm2RFU36W8EvnZ6j
	78W/T82V4o5YcNGEQkiAhNkuUOoVf8k63/nFIw1O+byrfm2i2cyXA2s=
X-Gm-Gg: AR+sD10EV1XMLW18QiMEfUGkNPs3bbP/y9Ppd6cN4hh3hL3ka57OV9lzFcuDaJ4HH+9
	37dpFv9AwJhJrC6kWPyuo0bgBwaH2IdqyI7wy0K9sgWy64By/TqEDIgZ11SvWl8d1Lpuz38onlW
	dbmA6ZYuL1m9fdhKCVNmmSMnwD8wJSNJxJOSb4h+v91kBP3S6pUPNbP/LhJOid/IieaeIiM3NHO
	VP+QloRU9JHDepA3853CHS4DNGyWgh1X2in1tRfODXSFzyUPul7Utxt4xZzwU5A8NAO14v6asvi
	U1od7QhMSJaMx08bU72R026/AnazlUVIPjxrOKYMKwUawco/09fOIl61VGE3acdOHHFPtswBzqP
	pmeOqafA007cQgaWSZcx6xzUti2MMHMQ7l48snEdDN94cIkOXIh2hM6n3DpxrJtt+prbuB7Ukrc
	5vfXte
X-Received: by 2002:a17:903:2ca:b0:2cf:7bfe:6043 with SMTP id d9443c01a7336-2d015c6db69mr9102575ad.19.1785214699707;
        Mon, 27 Jul 2026 21:58:19 -0700 (PDT)
Received: from localhost ([2405:201:8018:1843:4ab6:2030:c63a:e807])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm56187202eec.25.2026.07.27.21.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 21:58:19 -0700 (PDT)
From: Ayananta Paul <ayanantapaul@gmail.com>
To: donald.hunter@gmail.com,
	kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ayananta Paul <ayanantapaul@gmail.com>
Subject: [PATCH 1/2] fpga: dfl: fix spelling in sysfs-platform-dfl-port ABI documentation
Date: Tue, 28 Jul 2026 10:28:02 +0530
Message-ID: <20260728045802.9551-1-ayanantapaul@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "responding" which was incorrectly written
as "respoding" in the Document/ABI/testing/sysfs-platform-dfl-port
ABI testing file.

Issue identified using:
`codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`

Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-dfl-port | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-dfl-port b/Documentation/ABI/testing/sysfs-platform-dfl-port
index 65658267fcc0..40e555abca20 100644
--- a/Documentation/ABI/testing/sysfs-platform-dfl-port
+++ b/Documentation/ABI/testing/sysfs-platform-dfl-port
@@ -84,7 +84,7 @@ Description:	Read-Write. Read this file to get errors detected on port and
 		to clear errors. Write fails with -EINVAL if input parsing
 		fails or input error code doesn't match. Write fails with
 		-EBUSY or -ETIMEDOUT if error can't be cleared as hardware
-		in low power state (-EBUSY) or not respoding (-ETIMEDOUT).
+		in low power state (-EBUSY) or not responding (-ETIMEDOUT).
 
 What:		/sys/bus/platform/devices/dfl-port.0/errors/first_error
 Date:		August 2019
-- 
2.53.0

