Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677E52E542C
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 23:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767741202; cv=none; b=J2di7WbjzI1nMgEqgoBwD7KflJt3/5W726Vqxn48Lo3UqAlsfVfrdN73KzKkIqYoFFrHbCSTyjf+V67PyOu70a4lLg67vkHDal+Zgnx3I2jOxtma47kN56xgpePUCcCUM2kRba7Gc+bSZwBKrzHrDSqiCsiEZLtuwE5cpIcSzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767741202; c=relaxed/simple;
	bh=9CHyI2pRp45iV0W3VBniLDgkxCChiY5HX21/tIYCbgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foaZuYrgzBXyX2Te5vQLw5v93XALqepSLnkUg7cPFoRkrcG0+dvfD3GjF+OWVmk2xf2qs2HfuFjF9pggo26VL0BKrSAzR3mlWJZTrgksecaWAFJZuRwM+/+QeQfcPY+vgI6R0uLcN7phmXXDElyLnVabUCt8zvEHQODNUpFay4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cNDe1Y+y; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cNDe1Y+y"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-459993ff4fcso654602b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 15:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767741199; x=1768345999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMjHThWHUMgczxTcrFQ6ZHafxGjW2B1HWPHNHaRjP/8=;
        b=cNDe1Y+yxUqkxFtoY7peRzwC+Z4yfcgM49ceeBo8zqZXRtOjNMqAf1YONMuCu9HuHX
         tsFwbQvkozO5H+qHgMnRNdAvgDxExnE3r378lOrQb4jsAdYgPAuhz5pUWVaNw3HaVovH
         MkmruK+L7JA30SZBRgp2/TzkHt0YEbsYN1W0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767741199; x=1768345999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMjHThWHUMgczxTcrFQ6ZHafxGjW2B1HWPHNHaRjP/8=;
        b=wcQTAG/Lb5DfvZeXdpXwhe1lOBkHv1DMeJwBPVrJkUrHt+Yn3nRZb2UB+a+WnEmixW
         VWjFlFBKk3Vj6RNLVFb+pFrUAJwhqEusyyk4L994hZMZepWGPafAtdxozEe6DC5Xva1d
         ppZW5ofQ3415WyPQTnEpiPj5I4UtQpgdqjBS8m4t88N8bTohMOURa4pXumR+oG0DIl68
         TUEl3e7ULc45bLXoEnoArM6ZBiHq5Skv8iGDtsPYtuQUdtBMKBrO11BxIuwvqIhiQj87
         cCvcF7/s0CSJ1Grx0imW3FWt1akSmAnXk6sT31gdLTwGjQ85jBB9WIQjPnjrqwzHlOyz
         CAHA==
X-Forwarded-Encrypted: i=1; AJvYcCUb2JiQgVx0zo4/g9pdNpdxjo+9BN/+lqVasbLu2hC7yGarrhzRcwMmmtCyH682E2c1cMCrQfY6Awg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/11YQ1kZMoeOeNBRAi370N2XIwiSFXyOxaFup64x2CZ7Jv+Zv
	w5O71shvv1vHM8nVrF8g+8ySnl45KsObPN0N1IX01XI7UsKlHF5tZbWJWW9Nufs8jN8=
X-Gm-Gg: AY/fxX5P5/3XmpTnvWd6CF/y8eCfGnCspcN1EdTrcGJooF+3BOK5TPdjOc/7UEMPNiu
	4sHZ5FdCPsQPnA3rjOMigF37kEKwycIHLPcA7XRRAg7InJN+saWCeYMuvQWudLZex+QnNs0CoA+
	5eK8GSHe5KjlE9ZXAmEXtZb8pM3GcOR1qYqaY4Vb4MFIGXETotV3juvYnR5J+4tdzZADE7rMNhM
	YspniKPWtIK37rGOH3hBq8jMh1D3MtycODHoYFKML7E2mbOs7+NV8MDS+O+Hc2oUBHuwI8NYThY
	PKAM8cdxuuOf5Cru6UDfVXm+fMUK0aVFzz9l8QhwQtbDvvkqXSGWlqQbweDgS0K8pr++z0cqco9
	0xlqFuvi2cJZ+hGZumQgWHnvxaxjS+zhv4dW2Xl241R6qh5dFwjw3U/I1JKZx4cB+Selh9XL3Yu
	dla2e8ZRsE04NP/gF92RGajqtHM3ePJZHKq6QloEeGjkWr51A=
X-Google-Smtp-Source: AGHT+IHKgiZWvhVAZMBp6bOvGi+khkzTXYcuDuYNjrB+zC8ZttZAHJFBtMRl7VMR4HQRCNUUVjd9qQ==
X-Received: by 2002:a05:6808:6601:b0:44f:e5c8:2902 with SMTP id 5614622812f47-45a6bd54352mr266806b6e.9.1767741199272;
        Tue, 06 Jan 2026 15:13:19 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2e8fb1sm1533104b6e.21.2026.01.06.15.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 15:13:18 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: corbet@lwn.net
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update for the doc subsystem
Date: Tue,  6 Jan 2026 16:13:14 -0700
Message-ID: <20260106231316.24474-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding myself as a reviewer for doc subsystem.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 765ad2daa218..960e254dc0a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7517,6 +7517,7 @@ F:	include/linux/dmi.h
 
 DOCUMENTATION
 M:	Jonathan Corbet <corbet@lwn.net>
+R:	Shuah Khan <skhan@linuxfoundation.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
@@ -7539,6 +7540,7 @@ X:	Documentation/userspace-api/media/
 
 DOCUMENTATION PROCESS
 M:	Jonathan Corbet <corbet@lwn.net>
+R:	Shuah Khan <skhan@linuxfoundation.org>
 L:	workflows@vger.kernel.org
 S:	Maintained
 F:	Documentation/dev-tools/
-- 
2.51.0

