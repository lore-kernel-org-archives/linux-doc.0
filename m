Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3EB19922D
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 06:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990868; cv=none; b=g4q7767gc/GrCdxzHsc8emRT6X6Hx9jNZ+nHxnd+gOhhNqXirVD2yKxO5ghKdc/RB7yALlZvFd5ZPEZGW6U2Y4PqhQxQteEYvDnE+28MEzuMQKTD9iq2hkdNNbIaviPJYlkaDu3kchx0wE1GA0e16YbGxbLQnkL1S7WUpOKBrls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990868; c=relaxed/simple;
	bh=Fk+RjXbZJTL0DO9yjL2L7bGn62WUZdyrqJBrM5R3R5U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=f1hUpO/PUt+Xx+gDld8/enLKnnCpLjBgiXoY58tHVT1MtWoYdh/ihvcCQNdJnHgri67jEThufz3ks7IMt+fHU0FIKu5JMzq+8aB9r15RJ2LwDK0wtE1aOMjImfFI3eSMnRQpYy2SYC0kbI9UF3Wm1Lu9to7DHEK6Mv4ttX/nQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mU8jNTDY; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mU8jNTDY"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-791c287c10dso547471b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759990866; x=1760595666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtcimQvrq503f7Hzsc/besUDu9Iss597RLpVH8L9bnw=;
        b=mU8jNTDYl32yrxYZFPUfgSRODVo/Pvuh8GaGcmSEdiuEAYt2dC5wvzjg5Hy5LOxq5m
         QerXW0pm8nZ7JCmQlqJa7ifLVyHocvucggeaGdd0/aGB77/oFr69vJYydZJ8jEZaYBEx
         PfP8KLHNCwaL/qcOG3Lvnd8EtOFyrKHP0+4m4spefOGYSkK4v6a9D9Zq7dotIUtKsMZF
         qX6SrAoPZu9pn7q3sNptpy0awX3TcKb/sUTbeAR+Lqi5iV17DBty0QaOWiLz4AvS0HAC
         Hg+wEy74ULNfQf1iN0SOE2KKVVMQDN3wWLm+VETNt+gAGAzlBhEsOwEHX3JLFuW/B3l9
         H0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990866; x=1760595666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtcimQvrq503f7Hzsc/besUDu9Iss597RLpVH8L9bnw=;
        b=nEPlfBKmwIneaDLBy2KTb/VXLI4OG1Y7UxXfDvtQuZ4DPioMmcBvP3/4zC35gjDPka
         FuJYNYR7RC3jcvzHXQVv9sVdyvispcMU772oGvnztCoKUy1ezyEG3qMjWOM8lSygIl1B
         FZWd0IPQLNIbwPNz7mT2a/kVx4C+l8kW7ilbRGISDparnM3bVI3rsCw1Pt0f5XCbQzfE
         BYfdMmWHRPsS8R4OBYeUUaQy09wCtxc9ZnriF2irVRVUyKoexYXLuHuV19EaJ9PX1G/f
         dIiFbRJpXEGExXwj3H0oIXNJyw2Vg8P5TL4wWbepPCj15p3KeVAtNmvP8KLDGZkd8xOj
         8kLw==
X-Forwarded-Encrypted: i=1; AJvYcCVTPcMjRo9Pmu4eWMdfmigmcrQs8MKVBv6fU52oXNZqpUpmi6tZVANCet4osRN+0Xal0aehSKeTQKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+15mDhtzju0d3cYoGxSAGDGY+ZZLBPAU8qRo6bkairrMQjrc6
	hh2f+mJDNaEtBE3IK8gHAA7qZJZBq/c9NfXGqAGc5lENcUyWgojQXlIj
X-Gm-Gg: ASbGncuZzE2DwX4NY1T4oppR2HuUWyv0GCEGbVMi7a9PTdNop2Xy3mfdYSdkraaEIBh
	DbE2WfsUQJEAK33B2HU6gxwIi0g1m7vpv8cqWagX6WDlg3rDSC+qDTyalJnZ1r7nf49CUWAxcRL
	02zd3wxmHW1EG5cB6/7pZ6L2r3gYBECoIoDktPqldZNYCTxvUspgWZa53j/NqZ8kMArwNGzirWX
	tXlHcG0UkCtnBySWgMHIDXiOw8u8ygA9RqSBRDRbU34tXUkr9p8xVOjr6d3VObnTY1krDPLGkBv
	vJkCYi9IWDZdbiMzUF/ex/+HdLnt0t5vsy5FmRJtP4cgOJdk+/DZKMUzf5CrJVY3ZnoSI19r0nM
	fKsB7H+wMi+KqFyGZXPfoRz8B0uSAmI6G1miRtq1ul7s4/88W3CRl
X-Google-Smtp-Source: AGHT+IHgL0/LrT4Tyn+uTKNxNi0hK/zZRK6Dw1o3C0PshSZmrcB1E5/oSohTBTx4rGelQXJ715r17A==
X-Received: by 2002:a05:6a00:a0a:b0:77d:13e3:cd08 with SMTP id d2e1a72fcca58-793859f64aemr7043025b3a.5.1759990866082;
        Wed, 08 Oct 2025 23:21:06 -0700 (PDT)
Received: from localhost ([46.232.121.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794dbc5a163sm1744192b3a.42.2025.10.08.23.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:21:05 -0700 (PDT)
From: Frank Cen <focksor@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Frank Cen <focksor@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] docs/zh_CN: Add trace debugging Chinese translation
Date: Thu,  9 Oct 2025 14:20:17 +0800
Message-ID: <cover.1759990204.git.focksor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix RST title underline characters for proper formatting as noted in the v1 patch comment. 

Ignore the v2 patch please, as some changes were inadvertently omitted.

Frank Cen (1):
  docs/zh_CN: Add trace debugging Chinese translation

 .../translations/zh_CN/trace/debugging.rst    | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/trace/debugging.rst

-- 
2.43.0

