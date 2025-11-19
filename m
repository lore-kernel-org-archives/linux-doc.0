Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210E21B9C0
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560897; cv=none; b=ab363J+rOdnlHVM8kDJ1vDKYf9Jt0Mhxkox7ssg8g90EY2YwE+66wfKxPC2R5lmf2LV1kwXjP3v1FPSbmgvnF3mtxgiTwa7cWlWfylw5AUqu/ZBVHbSdw0a6UBP0ZfxvB6StioUzT8weeSXV9k4ouRBthVNoWn7FVsLi4xLhIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560897; c=relaxed/simple;
	bh=OuZ6ozE1WXKvkY9LkF3cm9qhd9peC8hmO4n0pL7jDJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H8FCH2ObtYTc1lx87euWJPWzS8LXpoqXyaSOM6F5ERMZuCVh5pMvPFfc1hFpUcBhShmbUqEiRPoLQhGljCN3d2zUuQR2N2h/BogbqM8N2yV+TEZJWQsxZN0f2ZneuhcK0hp4HOSuIpQ0dx5G0WhrEEITqN5m2eB9dFA8G0gbXUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGruDlpn; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGruDlpn"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8823e39c581so94271696d6.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 06:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763560895; x=1764165695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrx3GYWcqj3ObDyAOoPDpCRJInvypwClojUC/Jmlkws=;
        b=nGruDlpnOtpGEhAbq1SlBi4YB6NhcI5mJ4jVddVIa4VP8EfJPWvXG5KW2o6lAtoEP9
         VMyyJSni3Tl7ozav47OJYYHQTKmaENARTXLzj1wGfnsg+GcXrz1QocH5NkSvdZtpTcF/
         PB/ijm/lzZoyMMTv8MDCR4WgVfQRYSITtfceWo0Zlv8Wf1qgJpU+SS6CVx8Me/skB2N/
         9G1M8+G2G/Vtz4+qzRIbmMX564dtzenvH9nx5r1Vd94xLNHg0gAHsybhRpDxH7y0I6j8
         1VTUauZkGKgkWnjyAsrrv8sfG4iFVYbQO002CjIO4qL+jU3xQDnnuaUTx2SEtSMRHUzx
         7uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560895; x=1764165695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrx3GYWcqj3ObDyAOoPDpCRJInvypwClojUC/Jmlkws=;
        b=EmIJXCEwv96yP4QIgS2fD6CY0KyB1DVge5ehJusfNZrzh8p38lJbX/NKZx0VXCdZrV
         xoO0YFpb4ETl3DRn1Vm5mw3CnssEyS3xw2FJrETAfRYcu4m685u/AbxhuMHEw4YfO+Au
         ite8XxnfFXgUioFzcSsjeReE4gYSWWcvhG86HkbhlWkzKvzCAkIFI+EiWAs2e860LcX9
         gWXFezmFDMdS6yVqWnyZkH+y/lR/RrT15gEiL221onTqmosI1fI00pyNk4R9IrSBnb8o
         zk98Ex1fY90w2DOk28LJyYGPdBaBSNrJpDlt1frGF0GnNHlnM1vpv1dkRbBl5mVdQhKq
         SFSg==
X-Gm-Message-State: AOJu0YylhHqKZuwBhvesDz+b8yq5aLId0kdPNMDgyc8cnsO4vW5Mhx8g
	nYp9JV5lrYa4oI7jVDDbhTLiy6osA/6z5zZhgYUMeEdokakoIKq2qzn3+GuB94Hc
X-Gm-Gg: ASbGncsOKOAW809YRK/x/bIxxRBJErt4V44ixCZWG1GxYhtMjE5IlH/iGkbtz2whq5j
	gN05Av/haCM64DMXySlq/gjVHJIKva+Vh+7qJXkm8IVQ6smXj8hTMwnuGhaWXTisC8ovt0dF5CR
	cf24ofZoijcLbXxK5m21OhL55USBe+/2j4gmGh5aqqAuV9ou1YU/vYaxGKJVz+raoJITaCkzv61
	9jWsnEU2U5EVBuc/yaKpoor1k+AZJt+tAUQMIuGLX1H1csmUouU4A4v95FQsybdouXS8onKXHdH
	uTq9d0pAuf3LoY4Inrb5k6IlJ6chcbarOqVXwAZ2BKh6WKuV89H0wDPgWXK008L7IRcDiW1/fsP
	fvWcobdokGeDwMRtcg0alRqopWXIp98ks+IUPAPL+Io6jLkkqrA3ECHqksP5tJjUq+7TQmBdQ/V
	BefDik9PE2zNnJboXsm/rp0pu5bTJvbrmc/ZVwUUAHaQjgHV4Ti3jjLA==
X-Google-Smtp-Source: AGHT+IFGTtG9DdIXRbKQOIerqoLzK8JItSpGBncIDfiK6DYARGCzBCEYyAzQEJAXldCDH5IplagBUw==
X-Received: by 2002:a05:6214:4705:b0:880:498e:a63e with SMTP id 6a1803df08f44-882925be06emr259100106d6.2.1763560894449;
        Wed, 19 Nov 2025 06:01:34 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.77.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828655f8f2sm137991276d6.41.2025.11.19.06.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:01:33 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: linux-doc@vger.kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@suse.de>
Subject: [PATCH] Documentation/protection-keys: Mark as available on AMD
Date: Wed, 19 Nov 2025 09:01:30 -0500
Message-ID: <3647894.L58v44csPz@daniel-desktop3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

According to https://www.phoronix.com/news/AMD-PRM-PCID-PKEY .
Tested on a 5900X via the program in pkeys(7) and
`grep ospke /proc/cpuinfo`.
---
 Documentation/core-api/protection-keys.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/protection-keys.rst b/Documentation/core-api/protection-keys.rst
index 7eb7c6023e09..59e7c178af4b 100644
--- a/Documentation/core-api/protection-keys.rst
+++ b/Documentation/core-api/protection-keys.rst
@@ -11,7 +11,7 @@ application changes protection domains.
 Pkeys Userspace (PKU) is a feature which can be found on:
         * Intel server CPUs, Skylake and later
         * Intel client CPUs, Tiger Lake (11th Gen Core) and later
-        * Future AMD CPUs
+        * AMD Zen 3 and later
         * arm64 CPUs implementing the Permission Overlay Extension (FEAT_S1POE)
 
 x86_64
-- 
2.51.0



