Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C524111A8;
	Sun, 29 Dec 2024 04:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735446489; cv=none; b=LsiGE5IXLT7+VOMHSgztOYsW7bd9XPbwbs6VKcv0VmQHMToL/McdW668+H6qoAY85AEYyOR3n7FKG+RQyFALEl7UngPKBmnYldTispsZ5LkeK/CywOlqdq5MhrO+yNho3+cu6B6vV8N9WEbj1zGceHt6pdr1i7RoTZWn1L7tRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735446489; c=relaxed/simple;
	bh=VHsAOBTbo2aTuia/HCDkJys3h5kSfLDolbkTJ8rotWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WHf+IbqwE8kNI/G2kZtHQQCPKKSJAvBAKGN2iubCS/Yzokzjp9ZvIndPQsyleQb+5EbXbbnSh1ybs27Fu9EebkRr+xSu1w4MxAmkIjeUbCDrMOUyzAWOmpEnGWz54Nhr+1fv76zdwg2VgYrM8FlfINtVOEvO1Ql1swn+WHotgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUp3mWWn; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUp3mWWn"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-2f441904a42so10988691a91.1;
        Sat, 28 Dec 2024 20:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735446487; x=1736051287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oBrWL7GllNsi0LAiNro+Jy+rbseWxtpto9r5kXiY8ZM=;
        b=RUp3mWWnnL5Qdd9qG8tim110m1ATheZER73tcgAEMwV1hN/iEA/t6ii4T2wC/HwaEx
         uMm0R3/jtaJidMnt8wbhWtiYCfN9XQ9lAuiJnTIiar6LYUwwpZqG2cLgviJFBDIpXdsP
         0IZbpAgxpQfhX34FqCpy2jOjqdORfi90A3xpQIoNilj8q8owDUxZxdKjHtCpnKF0jTme
         +WDHbo7n/AcpOEOasDjjhDskR4k7VeSKc3VmykQ0tOB4gAMxXAixizRC2hGpDEv3E+3d
         /DDalqGB5+CactCD/Zix/i3rEW+GvHVfevbjiy6TTHSOoadO4dj5Y/01VgO/qL8DbS7d
         bSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735446487; x=1736051287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBrWL7GllNsi0LAiNro+Jy+rbseWxtpto9r5kXiY8ZM=;
        b=gspnY/V9pMotomoBprRvpGXRkJiHN/r5TUKb8su0+TvTBKzcp40mVmhO62IZzBjXAl
         NGurNWa5ULMHJVDL0ZmV/mLCh1ndrDSJ80DpUWUgaBZ2IyOCW+VTNlacsgYtTwk/74Iw
         3/fDz0Yv+1atL5qOb58tiq0Cr9g+t8tAzo3Fb/xDeBZ+E6SDhyrrx6PLRMFvWGKoMRYN
         XbNvcnfcEp7z2Q8S5sPFNvur1EFFc0N70Bpf3UyrlaH8plT13I2xvd6TCPeufQfm81FH
         ufjOxjvBWLARUl91x7EZVikeiJTc1Ktc0AY8/euZS7L9ApAWbKtmwjgfFOp+RfAim4Uj
         YZWw==
X-Forwarded-Encrypted: i=1; AJvYcCWBfGeAzRlO2BSH8jld2tHIXG4IpRuXV+0/2GWvs3OORCv4VFedbHAtp/OltMEBOJJIOEm6XVCK71c=@vger.kernel.org, AJvYcCWF/tC5WRD87xLMZa52TuCgVkiq1DubPqN1DfMNOpgD1xJ9DX59JVcq5VtMUBwT8fUeQNSosT8pwn7mg1Wq@vger.kernel.org
X-Gm-Message-State: AOJu0YwXN0mIybSnrN41hZYeZp0tw47+nUuTSV11ebAnwBsWCfPxg/th
	0v1FOZjQK9g6TG0TedXnHYBnh/OLw3QwULBEqetV2zNtWDDImbDb
X-Gm-Gg: ASbGnct1gsBV6vmPVmzNR2z3qo9aAB7Xc/yAbBa+2J8uO1kmeRMgi3Zw198MLSFCbMr
	TaVtSf7LOXKSbk9XsSW/5JSJdt3n8W/R6v83PSK0N/tLut96HpwsX5vLBhivvUVQxtiMyVMtX9M
	c7lmA4rpaeP5NUo9vymrwP496YkEYrxuWeGEQdelbJ3dprYfr5LLkt/NaeYruO9FbA31pCldj0J
	SSV4/X75V2i4mJzHOVa4SLGLN66Yd5NgkC62iihh+wBOSg85Ur5wUzzxwANX/Q8/bsd
X-Google-Smtp-Source: AGHT+IHgUdW+0UmloENQn+1Zkn7yQW144gDP51T6HntWWBf+b3N+bM7oD5Wj4FfS53Ad3kkuvErKGg==
X-Received: by 2002:a17:90b:2f45:b0:2f4:434d:c7ed with SMTP id 98e67ed59e1d1-2f452e1cc5cmr47887421a91.16.1735446486853;
        Sat, 28 Dec 2024 20:28:06 -0800 (PST)
Received: from shilearning.. ([180.109.90.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f47b3349a9sm10924394a91.5.2024.12.28.20.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:28:06 -0800 (PST)
From: Shi Xinhe <shixinhe6@gmail.com>
To: minchan@kernel.org
Cc: senozhatsky@chromium.org,
	philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	linux-doc@vger.kernel.org,
	Shi Xinhe <shixinhe6@gmail.com>
Subject: [PATCH] Documentation zram: fix description about huge page writeback example
Date: Sun, 29 Dec 2024 04:27:58 +0000
Message-Id: <20241229042758.163842-1-shixinhe6@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected the description to accurately reflect that huge page writeback example.

Signed-off-by: Shi Xinhe <shixinhe6@gmail.com>
---
 Documentation/admin-guide/blockdev/zram.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 1576fb93f06c..48ba192e667b 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -343,7 +343,7 @@ To use the feature, admin should set up backing device via::
 	echo /dev/sda5 > /sys/block/zramX/backing_dev
 
 before disksize setting. It supports only partitions at this moment.
-If admin wants to use incompressible page writeback, they could do it via::
+If admin wants to use huge page writeback, they could do it via::
 
 	echo huge > /sys/block/zramX/writeback
 
-- 
2.34.1

