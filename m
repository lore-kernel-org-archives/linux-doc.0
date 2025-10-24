Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4B531A558
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303628; cv=none; b=e2qaVjkXGw9sD3D1vFYWVgqbKuINDmcQ3dFBzEcYMNnoMTcIRPv4+zIpSdEcqS6jd9bw3Mo3Mvep4YeyZGgTePPYa+yIwnKZiDsMZOAFQVyddQT0dDPXoLc75ZixKpDPGqDxyOZAbDvgzbhi0q9xLkAY8l4lBiM1EW/w+XgCjmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303628; c=relaxed/simple;
	bh=UUJma3mfHxdsACo5jvuRAN7LQ2A/mwBLWD+dCqbrfSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N8tRGI5Xv+BI/dwn8ytkMxLDihlM0irYRGObvG5fDIiSW0pkZl42vcrQHgyj/IW7uoUWuAxJoXhphAZU9aX4cNdNpnaff0RB3fus0Cp4ZZE84I98IaC1NtOTXDw4Yh36ob66HBHPkPmS5R6SvW1AGj3ie1lr1j5t+mxd5S9ICIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap67KMXa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap67KMXa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-471b80b994bso27057195e9.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761303625; x=1761908425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNwQqBemATmxjXx+rJAEDdWPHTVfdvUDQPF043XY79I=;
        b=Ap67KMXayItpma341b9u0JMZE2ltybepOBM0JUzocHH+JuTxnzxnOH6Vy/Q7ksyBy5
         7AfvUUT81x20FG7C2z92gE7K3/JOfa4K4wCR/XhtzHyCW6qjeT2IWJR0fsgByWQZ5I0h
         h11oFyDXSEg6lOrajGSyknpOSuR92cHPNBQvQQ/j2EZDu1YBnTyrgSKXrykCXkKBtRiA
         dj43w1QKY2kYZ5jI2TUob44WZmkdQlYy+CKCBgDuc4frhi/qWTsSfMbOAfvHZG3sAdqF
         QWAIGF6AcwUMYcxWseaECz6/zigYsHNFoMdIurQpatEFWE5Ir/IQUuZv3u2e/ZeBkiic
         FiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303625; x=1761908425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNwQqBemATmxjXx+rJAEDdWPHTVfdvUDQPF043XY79I=;
        b=ZsFL8Sd34lxGZzzhl8NirYrvehpqBopAw271w8Y+NFQvF7TfvFud/vWxt6BXDgJNT5
         1YTqvHpVuFh8MEDOmJ6oUs0+EPyVu5rSlrzXHT6QceOIICFVKpitMNeTSN0qItWLSMwF
         TPLHbWLZJfTPG2Q7FfxiR2ab4b4axNb1oeDPS67cbGDOfxrp47pD6cHUpCiXI62rGK73
         NFJWHpO0MbkG8IJdwGVmNntQTFcHFN/MJmvgveiPmUM5KH+0mFHqvHfsol28EGp6Zt9U
         0m/83McjRf+H7ZRwzzPdqtchNUAs5oS4jm12xJk6AZb8kdkJ9+25XnKZkH5a79IsHqGW
         cH3g==
X-Forwarded-Encrypted: i=1; AJvYcCXKSa8R3ys2/nmJpozXorm7aTFkVVM3JS2YoqILJM/qm3+zB10veRmpt+Qi1pCu5V07aZ6qfzsxBBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJtl0o9nfAEXOayLoFwCTT6LC9ty78z2pNp5orYw23Bxn18qP
	FgF3XLT0lc09U16UaW6wM2LWQlQv04wt1DyZPG8w9T6QLdmplbDRy4gZ
X-Gm-Gg: ASbGncvZWASt/YmmUN62YyBeNp0W6sxGQxisXhOB+B0gcEF/5kpppMHchcu+wxOA0Kx
	ir2B2YgCW8nk0yejFE8T5BkgRPj/MqJFBTU8VmnhvKa7L9u/d3i4u9JvHAVj4gG6Ll7mi/opNhw
	QIRNFEwFGNCYpb3PQOWt3NUKaMtdu5tAwZLuwjA1a+nBBNYzCQM3Yc94lwx60/FsiwAlh7X5R2F
	dByyz1e1IoyuXSJ/ZNeE9ZfW4PGnY8R1k7MUj7EMZ1XKhF8l+HwJcw8ajyxSgCNqqSyU9t5oluN
	rU2PyE5mOZ33f7h/AIL+AyBNGH0a8DK6OmsJeBuMsFFcW96jt7BPavKRiN0t43ZMdOf7iuAE+Gr
	QbLqng7Hw1WgFSR2ffLpi/KWnapbVudcHQyU50v+U+/fnwrXvsS/hcDVaduMe3xziz2yVbm+P+F
	XMkrVTB19KNg==
X-Google-Smtp-Source: AGHT+IEbRG42e1LgV+3nLNHGYb8yQMIxPTGoVR+OKvME7EdNaQHnxt1RF9GQGXBtioq1FU6OLJLiTw==
X-Received: by 2002:a05:600c:468d:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-471178b14acmr208423095e9.18.1761303624680;
        Fri, 24 Oct 2025 04:00:24 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae9253bsm82484615e9.1.2025.10.24.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:00:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] drm/vkms: Fix run-tests.sh script name
Date: Fri, 24 Oct 2025 13:00:04 +0200
Message-ID: <20251024110014.4614-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script is "run-tests.sh", no "run-test.sh".

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 3574e01b928d..d8c445c417b7 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -161,7 +161,7 @@ To return to graphical mode, do::
 
 Once you are in text only mode, you can run tests using the --device switch
 or IGT_DEVICE variable to specify the device filter for the driver we want
-to test. IGT_DEVICE can also be used with the run-test.sh script to run the
+to test. IGT_DEVICE can also be used with the run-tests.sh script to run the
 tests for a specific driver::
 
   sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
-- 
2.51.0

