Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD2629D28A
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763016588; cv=none; b=ne+WSuvuA9JMzKu0iKdV2Cc83FPC6gDp64qbyBg2hJQph88clnwiHO21xvRTM9kYhq7M8I6vlSSYiSyXMHYihGOLhT290R33wyrD+PNayzahgLbE3bT+MZadOVXql/BogU9ZpFQoG0VQHp9UOB1RhVK0GzxOnO/aaqMBt8a7Qhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763016588; c=relaxed/simple;
	bh=29nAki8ESaO1fL9aGhOKACF0bJg24F8USzUzT2R+14k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IcptWvMHzfG71gb2FNxCFkJLZC2T9/TiLb4LF9GgfclcZgyzfdjSpuaKd3cnKLTilRe75v+tStdH6+SGsD9F91Mlln/VXFnRUGrSMfCGo/XQWNlOGGk1QRICUi177wFFA/mz2EqyqWfTk+KKgQZk79uwr0W0CJyQCIz2DWoFYqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvbFTyxF; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvbFTyxF"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-340bb1cb9ddso403588a91.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 22:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763016586; x=1763621386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T84pQ1+9aq8AWuzbsa/zDb8vuVA7/GAGMhFUb/seRIk=;
        b=XvbFTyxFH48sRBlCsuND1ti+4HkLaua4NcMYB3AsL/8Mxqm8SpmHlKiW9F5EX7PxQs
         x8Kxsa6+RDM4CkXHHtCWHxXmYsJabD5wfjvs+BLf2k4oxhwX/YtXCAep8TjpymS9/E1H
         Uke8t54lZX5gEVSC2gm2xcM+rwasguzDZJxSYeeaAqWznRBQy5AzCbfkpTffPYHkgMNP
         i1rSSQ2ZhSMpk2kUgYqjhofIWRioc4rGeaTQ6MsqGG+rVtqKXEjR6EiOLdPIQ066k79I
         Z/XwMNDWspfslUrWwnPWISv3Su7HiT/FhchV3yceNXw8ceR4WfI8d2ly/vZSwFeO1/xD
         hw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763016586; x=1763621386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T84pQ1+9aq8AWuzbsa/zDb8vuVA7/GAGMhFUb/seRIk=;
        b=GtankhXZN71b5gz6zVXzFidXRIDYpVk+y3bZIRj9qABqEz4WO8afXPYJY5hDRBmsAH
         4H0fjPZtxiD3OCgyEl7n6X4S/dXZ0+dCLAnBXnBHDmvtDcS8p+d6m6Fw7RpslpFdNJRE
         kEuURjQ2vqc/eWAFgsTzm7XedVD847HY/JjP1v/uMTUc1pXY/MlKpLq1dDVTsmyV5MDV
         EWLbnKyY3r61NhaEp1oaPo/3P2Ue7i1tEJzOkmO5NyDjF9EjVyyAOXxH2/l5Pv+ET0fj
         iT65KLf+yCd87o13ngbywdsDXQgcxTOfsJDz4q0nZBD3qhxwtCmsJtjpoIvjxX41VxIU
         wO6w==
X-Forwarded-Encrypted: i=1; AJvYcCVf9gnHu4F3WQL2dNGbMbvaC4y2J74Px0nwUmbvGrV9kgUSBkBxLPzD6s73F01xsxUMsP+AZ3h1zWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvQgoEqNYFXtXzxUNQqpSeQzu1HSQgJ1ta9PivO49nEW5p8+y
	AtsIrAmBQK/DcziP6HTAVzs1Aw2AOdxqp7uTyahLqIbgdQ+xucOngfxH
X-Gm-Gg: ASbGncvvP/swjR77QmdKr+50H+0GDuSLjMD58TiRbz9EJacdL6c0qImB0WT/gQ+jeL2
	l/nwF2bpUwNEBDiaCxADfh0JQnkDAMDc2+ddcduOCWPd69ceXYUcBx2hhHwutADf6RxaLq+Nvh/
	s3xGcxAYcqR9vIwgk6PA2SEQ8d5Zc6h87WAKXqoQRrrNI0+kH8VsGR1HMDSuTDTIK+UZZ/Ru9Cg
	ENMe2A/l3B8WKkP1iMZbzDD53J/TX7Po4ddOAAHlGTY+2Y5bROBp62sHQZE+Wj6xcPzNcDXHbTW
	2Kl/eBhjPtltEbKINaMAijL6C6frrEf2ViJqz2UBANsqu9Pqz9jr1Irwe/I5gp94rgk7oKHTrbq
	ovH8Y+Omc3iYNeBr+sg+mvWWz4R/Iv9gF0Bs2Xu7AQMeowZpK8WIaxFVwRuuB8507dewbOrglVz
	sjaHt0vLPigRJIx1DqswXFa4fy
X-Google-Smtp-Source: AGHT+IFcm/7eA7OM1o0lYGSXbMuGwXv23lCAu3vI178c0WrBUNLFpdQ0EvMHjhKjzvOvGwj6jeFaVQ==
X-Received: by 2002:a17:90b:5487:b0:343:c839:21d2 with SMTP id 98e67ed59e1d1-343ddef34c5mr6162819a91.28.1763016586418;
        Wed, 12 Nov 2025 22:49:46 -0800 (PST)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07156absm4838126a91.5.2025.11.12.22.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:49:46 -0800 (PST)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH] docs: dmaengine: add explanation for phys field in dma_async_tx_descriptor structure
Date: Thu, 13 Nov 2025 12:19:37 +0530
Message-Id: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the need to initialize the phys field in the dma_async_tx_descriptor
structure during its initialization.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Documentation/driver-api/dmaengine/provider.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index 1594598b3..f4ed98f70 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -411,7 +411,7 @@ supported.
   - This structure can be initialized using the function
     ``dma_async_tx_descriptor_init``.
 
-  - You'll also need to set two fields in this structure:
+  - You'll also need to set following fields in this structure:
 
     - flags:
       TODO: Can it be modified by the driver itself, or
@@ -421,6 +421,9 @@ supported.
       that is supposed to push the current transaction descriptor to a
       pending queue, waiting for issue_pending to be called.
 
+    - phys: Physical address of the descriptor which is used later by
+      the dma engine to read the descriptor and initiate transfer.
+
   - In this structure the function pointer callback_result can be
     initialized in order for the submitter to be notified that a
     transaction has completed. In the earlier code the function pointer
-- 
2.34.1

