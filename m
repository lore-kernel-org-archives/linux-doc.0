Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0CC33BBBD
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702550; cv=none; b=KkR4uF58m2jxTDbM6lnckEcJ/tZ4E/yIU2FclsK63WVyAAXVjPdPcYgHE/LiOkUmaki2j4aOXmS2pv6Kg5Ig6DY5Kl2uUDiRj3STPm1q8suXwqIaAVm1qfG/y3B+LIvAjJoPDsj56EonOB+NMljB3PVLgjg0D9PWoyi666VuRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702550; c=relaxed/simple;
	bh=D15rmX5lfCdhAtsO6JBImQCGZd/Dy2YNt1Wb1sR3Xi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scMv989V6TRiSWLb2r3y5a1xrk0uqrXs9yUAa08WcwPfSP2fytBRNl8v6Xuq9gVmHYZy2bcjsTf0qcHTQVApbuSRwiBxEEnDHrYV3G86oG5DuvQr5z+SlBXaqS3Z1jb5yzdaVjMHFygN1Q3WpdEeTUzxbaTQR/tqf97prUclQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UokcxGQy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UokcxGQy"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82746ed8cb1so4373011b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 01:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772702549; x=1773307349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGw8YHPYJQfvE0v0vm8ntXkbcVbkWsR+ihkFDpKuKyk=;
        b=UokcxGQyVhYXcUMVaPUTmJwgG+W0jYAbVpCGQK6nz/6uIlTgg1B5QI5kehbOv/Kmrd
         uryGxefPwjvAriTrTfh76+8s4kQSrr3vN+seVjBy4VvWZVEN/8t0tAdCdqSWleAAsrFC
         dRU5iWB85lz1fpq99nVn4v1+f8S1y1/1WeHOPXEjBoqU2/GUlKY0DEI/W1COCGcttukP
         yv34ZskwqivwlSpZtv5r3WVNVLtPBTlOA58Y1guK7r8ASgtcNCJ+0ZPDE+BMDBJE44zx
         Y20j5Sy7BZv2qECd+B2vxRnlyzJk1E5RDnYiHwKFqvoECFjFjq70JdZr6cvs/5azHwZw
         LeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702549; x=1773307349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGw8YHPYJQfvE0v0vm8ntXkbcVbkWsR+ihkFDpKuKyk=;
        b=vr+QIrJxECkvdOGMPYl08DcmQxPxJDofRMsIz0rgUZOJ8r2ZpkJrowobFAcYEx8HSJ
         f+/+VVjIAYIoJmRs0v4gkGLMcUaX2VUcEo9TBpnoYLPbvN0b4LqXtaPNQMD/82/ZrOWO
         H8RLSk7JEEvDs+vaInvC0QqP1zeIwcV88GvhUen4gOhfjfQfakVzba9HtIbt+D1CEg76
         zgG4cnA3UMDBT2a8slAig6LLgY7IspMPaUHIqjh4SkkHmB8qNJbuP/254Hw5jSjTgAjv
         HwwexlktUnL7iB7HG8/UPFpjhf87cUVwA3FK6kxVyJZuTdEeCOcKqFPv2HEMi1kDs0+j
         2Rag==
X-Forwarded-Encrypted: i=1; AJvYcCVmEEhFTBMQCQ5EMmPDkEbQnDYc34tH2f0NBF6EJ9UVZDIsQPnWmQ10pK9Ic+NML2SC/ghSAbOmpUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3OXCaXP19Wl4BObL++zz8XVpYny9C3NdNO5EP+jFjrMNE9mo
	O+y7CMoYOadbctqXVNATzAzdRvl7tdkD/CROCBFlzrzfD4Y65oDXG89E
X-Gm-Gg: ATEYQzzdQirnA1UnG1XnH5yxow0WkxRJKOnZZb6KT3I6hg1e3/vW1bAuWCnrWO/sGHa
	luqaHEkleXPnU25Iw7kpg3xYg1ouaTd7Zx40m1jqOvE0ucPviZTwnTArHWC0UTXaUqaiWOWQ9tr
	uC7P/z0r38/mabMBFpKQUXGavxnkU1r6CDiWhMlBZz5cYgcvzjPQZNiqVjrgzpZ/hgW3jL3DKZw
	QyL3U3f14nCfL/b2HvSW7V4rpL0+IOMisrR4Ln4WfoPk5rfIH4nXFha0tT30Fd13iTPzxyjPSly
	oDstoeohGTsaVrZdr6EwD1jusL4gfMcxlh+ElWSr0p1vBbDuoWfZn8EDRxKaKgxGydLVFZTferl
	pvMovsUU23kAHuA43qAA7t8cfseqPy4ZIHWws8XufeXABv0kSGRFpfyashEEXKy6HzwXJDVQGHK
	hPrtTy7iowTcWjUM+xVrUG5VRAK/4mRlXKOyG+FVo88ecHCQ/+F0HCfV2oKe7P
X-Received: by 2002:a05:6a00:909c:b0:827:3093:901b with SMTP id d2e1a72fcca58-82972d0d66dmr4186080b3a.43.1772702549140;
        Thu, 05 Mar 2026 01:22:29 -0800 (PST)
Received: from ubuntu24-04.. (120-51-71-230.tokyo.ap.gmo-isp.jp. [120.51.71.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff34fesm19718200b3a.42.2026.03.05.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:22:28 -0800 (PST)
From: sawara04.o@gmail.com
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: Kyoji Ogasawara <sawara04.o@gmail.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next 0/2] smc-sysctl formatting and missing entries
Date: Thu,  5 Mar 2026 18:22:22 +0900
Message-ID: <20260305092226.27379-1-sawara04.o@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyoji Ogasawara <sawara04.o@gmail.com>

Hi,

this series updates SMC sysctl documentation in two small steps.

- patch 1 fixes indentation in the smcr_buf_type section
- patch 2 documents missing sysctl parameters limit_smc_hs and hs_ctrl,
  including values/defaults and hs_ctrl usage notes

No code or runtime behavior is changed.

Thanks,
Kyoji

Kyoji Ogasawara (2):
  net/smc: fix indentation in smcr_buf_type section
  net/smc: Add documentation for limit_smc_hs and hs_ctrl

 Documentation/networking/smc-sysctl.rst | 40 ++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

-- 
2.43.0

