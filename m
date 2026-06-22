Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBB343D9D
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152358; cv=none; b=Gpq3ugzdA+piFG28a5HSfPK9eRw44kTuC++Ul8FyHeDSjD0l8iNu9r4eFhVOjjzwtrJersFOHEsnTEKVygWcWI/ajdv4V7+cuTF0FChXpuKdU4gGb5GB7fgzunmpKsc12fyLrw4yGBDnPqD42Gzm2BWunkUop8CMOftznH9bBcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152358; c=relaxed/simple;
	bh=vzQPa+wRfjDhzjoiFxTZzjP0OA6x7DAFKuq4lhacSEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cwbcyt6I4Cq+7zcL/EzN1IQ2FMu/P3N0u6vNTOMkoyfoUNmyiQ6S/UoHCNB8WdggafiHpds0uj6SH0wYQnnwlw3Juqp6vWQO078y571pIHoY/eyr6nOL42QoCbC7MJPvm+dIMIvqMOpFRizbyx1Jx4+8qAJh6SdL0mMVOakBkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMRXQClH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMRXQClH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49234dc0b8aso5998695e9.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782152355; x=1782757155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgXvi1kX5xT8KIfuJ99Kw8ogFdqkTxgMXnV5IEfIfG0=;
        b=WMRXQClH4NcC44GqDZUSbpmyl03Mq4FMZ2Ia5xti5r3eKOSd3sN68DMGq+hw0QCU9V
         M19BFmm96oDEST1aFK72rgB1m/t7n/zcjKZn2dKxDQtiGyZEp2vOy7WjLZzlRcDICZR8
         u5IeFWsxq7tGVX4Q6aAwdBBJY/UWPguujTUiiRImr/R1EbknG13qJdzvIYmbJ7XKjT1e
         cXRYZfbVR0HANNnhXfmCLsktKn+EmEWnaRTp9fbFN7oAku6HmQjtdsq8rYll+aTQ1caH
         MSVhnQSmPMiLvcbVFVV39+rWSXRfLvTLLpbf9KS2oeBB/pkyqxvSq1rckcXestRkyGg5
         nHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782152355; x=1782757155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgXvi1kX5xT8KIfuJ99Kw8ogFdqkTxgMXnV5IEfIfG0=;
        b=nZ+PtldXur3xU0JM18YVogacgMfzu2O4i3+23o9RsSmh39H3ktZgSi/csNoePSB7P1
         vLBCpznsMPzygj/bpusPZwVxtnE2BHFVOvMl5Xo1kO4qqmP/ZPRVXgGKx/ftqpMFmaE8
         fXyY368In1+dmPr+8YOqjuE0ZFNfqYl+MWYb0advsUSbZgmDBJa0fsr3BlyU5wfQ6hRl
         BLGWN3x4DOACyrCAlLE4Enaogi0ocdK19zaF3+PzY+ubw3LheXv9GiHD2lisfC5chzoq
         3TPvzEAeMC1ZmZ33wOeFQaUQcQ5Iina/AqXPj5cJY2ffr+GiwAhIrkhaH8tvMI5iO36m
         F1DA==
X-Forwarded-Encrypted: i=1; AHgh+RomPwMndE8xCSpLlIyyFUaSACmJ69rkTSHmc8fSI2BlRHf2+w9R2cKRa6RpHEcaVhIU8BW6rjKMqGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmH9wTNw+3X2cjYs4sLnqeC39ib9emPHLZidkGPEAUyo12dmUd
	Fl/dxde65BYJXRYPfE0Opd8EKdhv2hL8+yB/lSEpYtczSjDP3eBkzMBY
X-Gm-Gg: AfdE7cnH84b8unKW0segQUu7N/rCtgqyx3ru8ztr9LpAP4Eemq8EN6j1dT+BVBoHvnT
	grYZSzPkvuAdsBtmxZVIoSwbZdAZTNN0QNJcNcokcTHrAB2/wPiSuozJgxTXnB2lZl+4TW2kFzj
	kjVzqJH9+D+1IFNTfeKZrfOycnfX/y8exJ1K+tlxEsqQzmqcr2bljBEPJpSKfQY7+B4Qpyq18Iy
	tslkmFEh7LqAwcEdVLALimyVKwXEVcN8YXWzODScj1vTpkrre0n362RtdrC1Kum7EkD9+eJI1bi
	9PJUugu2OaraMwQR/xCzzVj31tGSgqvhHnYNHQFDzb9tTa7pjH3GENs33veJ+Ussi9OD0L4Ogkk
	O1yYtIud6qsv3FLyVcDso8yGRnYzWspT8XfG/FgXLEjBOREkvHwNMlojlUVL8FzOSadM5drQyFt
	I0P0GXr24jtCLshGDZcJwgwsgTWj/pVf9fWETmW+LBzkjifW37KnblwS4t4CX/zhvgegzx0tB8c
	WsTQqpAgne4mHeG
X-Received: by 2002:a05:6000:4808:b0:45e:894b:49eb with SMTP id ffacd0b85a97d-46a50422468mr1068627f8f.7.1782152355276;
        Mon, 22 Jun 2026 11:19:15 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm28288079f8f.23.2026.06.22.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:19:14 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH] Docs/driver-api/uio-howto: document mmap_prepare callback
Date: Mon, 22 Jun 2026 18:18:21 +0000
Message-ID: <20260622181821.1195257-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UIO howto still documents an mmap callback in struct uio_info.
That field was replaced by mmap_prepare, which takes a struct
vm_area_desc.

A UIO driver following the current howto no longer builds because
struct uio_info has no mmap member. Update the documented callback
signature and matching text to match the current API.

Fixes: 933f05f58ac6 ("uio: replace deprecated mmap hook with mmap_prepare in uio_info")
Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 Documentation/driver-api/uio-howto.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/uio-howto.rst b/Documentation/driver-api/uio-howto.rst
index 907ffa3b38f5..c08472dfbcfe 100644
--- a/Documentation/driver-api/uio-howto.rst
+++ b/Documentation/driver-api/uio-howto.rst
@@ -246,10 +246,10 @@ the members are required, others are optional.
    hardware interrupt number. The flags given here will be used in the
    call to :c:func:`request_irq()`.
 
--  ``int (*mmap)(struct uio_info *info, struct vm_area_struct *vma)``:
+-  ``int (*mmap_prepare)(struct uio_info *info, struct vm_area_desc *desc)``:
    Optional. If you need a special :c:func:`mmap()`
    function, you can set it here. If this pointer is not NULL, your
-   :c:func:`mmap()` will be called instead of the built-in one.
+   ``mmap_prepare`` will be called instead of the built-in one.
 
 -  ``int (*open)(struct uio_info *info, struct inode *inode)``:
    Optional. You might want to have your own :c:func:`open()`,

base-commit: 1dc18801be29bc54709aa355b8acd80e183b03cd
-- 
2.43.0

