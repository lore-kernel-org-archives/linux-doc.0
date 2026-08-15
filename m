Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E3331EB2
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 22:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786831266; cv=none; b=MyGZfOSaRSB7t1J+fWHBa7Z5dJBljp7ewdMFWxq2AV3pyJRkUDEVtrw0DLKr1j+cyHFV/vSaDdpa/AfeCB5IHIkZEZaVJ/7GA6R7AwzJ5MLFfrVCXG/JryirMYEmLwggoH1Aml1ZIqnnBOMsUn2qgHg7vz5XfdOB0W+ggTcGaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786831266; c=relaxed/simple;
	bh=PG4MIE2W12sOR4QIFtwBGIizXLfGQeSxCLRQu27ohHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+C1Be4ZwP2vK+QQ6qdI8sp+DnpKYRI/e4dmkTZP11FF3+LKCYj+0DbixRlCv2DhtK7DLWh8xMmW6f4L5LAFIsQh4C/hw/8s03LyTCR4hyISjx3//D47SNQOvcQas0XPHfREfeJXs5LtNBPjLzhsPGh9lfEb9vrSQ1prdLchps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhkeX786; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhkeX786"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20172295e9.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 15:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786831263; x=1787436063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PG4MIE2W12sOR4QIFtwBGIizXLfGQeSxCLRQu27ohHQ=;
        b=OhkeX786chHO3sGgDfGPEhOD0Eq0r54lWiYWLCnJlPmOGHTf+zRUpIhyJ2DQL92nwv
         TjoW7M0IP1Ed96i26IWG2+3XwT9knTpyf7ASjTYwfKyHMrxooAiWSRxL/n4GjJ6IiUjm
         pNFBDp0DAMExtFJrplWTIzpuOqLr5nyS+g28A8vHMQt6m7TXXu91OIqEfUfFqMlABg9w
         3g7Jl4w08cBk5ryV31wDguRzY+lHUQa/SGYO5wdPDerkIf6aFpyMKPOqNm3hux9J4Eio
         t79IbUa+jzLPkjK1QLfwh8hl/XU3230ZLZ8sGClIEQ8S7VA323hGb2bZOgnH+osTVR9a
         ZDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786831263; x=1787436063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PG4MIE2W12sOR4QIFtwBGIizXLfGQeSxCLRQu27ohHQ=;
        b=Mq+RUCFtPZQ33xQDCNO0MB4gJsblrb+9f4mXUDJcxk5HiYVw7EXcqdtaObdJ6zOHJw
         Uer9ib0FCVsCI9XxoyYIoD4FUm0JDNwK7aSrbWtv46Esb659LSQ4tEj8IokmyZQTK21/
         xEEmFSbhr4gg/D8+jQJ8CXL2uJHe110oJhSkp6a7Sb4mrK6bw1oznSr7nhkgVdclV5yJ
         3+GmmOMMld3Qm5x82eLKau7J9Na78U3P16STzHWcV0pLIc+AFlS0LhVMMN/GdDU2B88M
         naxRSub4B3ERaMSeSVSyyE643JYpPB0dy6vEjAoU8L0texpSuZ5Fy/AWNid+2IEe3ir6
         lYgg==
X-Forwarded-Encrypted: i=1; AHgh+RrTN36i35hFPB2OStI5tGWw3GfPS7C7K2Rczp/060r8F9FbuiHvOOf1jqB1soo/luvTNdTuZJbW4sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW807QfCa3YDZvIbcnelauWdfn5ukEr63SpLfRDTmQziSwveH2
	ZOEom1PGa5p8Kd0DFuTU2WfAEBgnloxNv2EM1Kdn0spnb8HE3/cF3ibI
X-Gm-Gg: AR+sD10NUQd7U6h6W1ynyMrwHfHeM+yG0qUsgXyClCaCwf970IJfsHzHTyZPtgj8LOz
	7mQvRTksm7x7fq/sz9O4Pp3OpsBIJ/eGL5Q6LpRjZtWueQORdO9BK1P/q0oEq/hcBG+4Nbq3JMg
	UDezb4DvYjnlsD4bo8tOOVW/BUKdrA5zvgxo0XMBCSMTCWyDe4p3jzB+ioBAFEdGZJZjTz/PQiV
	nnTS1IxgJKUBhLRb02Ws4zXy2yOt6a4iw7RQPXejcpi+YkYVKF7uUJYNW0q9r3vtvIAzMzJrczc
	eaZ+D7bd43+FIeV8GmLnCRqgEhn7G2VWb4lP5j1XdNkcn6Se4IhAgWOpCOIpiBCy5h5fjZOPCUN
	qqYVeKSu41KvzY7x93lO0njjwlsuXIiUWgXcSV/YoOPmWZTtInA6rBzoSYTaP77R8jtkh39p14N
	JayNKxcuLefSa/K27LUDcPSB17gKi78ntrzlj8GaymDxTvdqsZAWPiCrw=
X-Received: by 2002:a05:6000:4910:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-4829dc6172amr3577280f8f.1.1786831263297;
        Sat, 15 Aug 2026 15:01:03 -0700 (PDT)
Received: from Gentoo ([191.96.150.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c1307sm20384790f8f.27.2026.08.15.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 15:01:02 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Doc: process: Getting rid of OProfile url enlisting
Date: Sun, 16 Aug 2026 03:23:17 +0530
Message-ID: <20260815220029.3711742-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aren't we done with this damn tool from a kernel perspective?? Thought,the link
could be removed.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/process/changes.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 0aa232b117b5..336c07190c9b 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -556,10 +556,6 @@ Ip-route2

 - <https://www.kernel.org/pub/linux/utils/net/iproute2/>

-OProfile
---------
-
-- <https://oprofile.sf.net/download/>

 Kernel documentation
 ********************
--
2.54.0

