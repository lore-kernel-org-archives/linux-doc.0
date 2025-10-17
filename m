Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AAA328B79
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698696; cv=none; b=MbvC95aFLcFFmijbMfpQqFgJ1IXf38KxSefEw1Lu3TyGI5FiG6uBFCHBV1Cj6FKvnVp89v54XAH/E21EXtBOQUV/i9em8o/ZaqfU4sYFo+RNVneV6eBpaQd1o1bRb70qjM0X87cEJm8iBs8YuSRsYUeMlcQRd0UXDOQyzE/FNJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698696; c=relaxed/simple;
	bh=jYLh1g0/g+YswT19wb8sGFf9meznkL5gtg/UsZXCKQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKID6rs5PyXRSW9Kl+Ur5GcNFX19gPpYtNPaukM5KFtbxy1KuancqOw2IBbzl9AuE6C4mr6ciKes+Y9/h8GdBUA6FISeczrdKIhl7brOifQQL15RUATribPCndy5YUTC8S6Ry5iGI0iYtCkHABYwA4WjTzS4nKyR90/NOodcvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQvPPquH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQvPPquH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7833765433cso2451056b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 03:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760698694; x=1761303494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eRznc/oLGLRRb/vl90nQzjbWZjbdpkXCZdSvk3IxGA=;
        b=MQvPPquHetcTsZXKOgOgZDvfn79VR8+oaoGUGlKshsGPSw+HpHSISnRIX4ZDFVepA7
         EFrntiYNqWRunGfdlRio+/Li7+gKOKWqffi2kG6QTBMFCQ3k4TMRpQEaZ5kvGBQMt5BR
         brWXNiCNT9eq5sLI59Ta+1mHAAIbfnCf8g7GQL0e9vJqMwC77/RLW8eX7Qrp7mEql4kV
         gMG851XdJPB9bSpBZgH5UQhWL3gTnkSHrZ/dehhQDTk9Vnm/Lwu9tj5CBcXXk+5Wgf3z
         ujDGbxLwnI5JXSgdaFBD323fQ16o8vgX3RijRoWMAq8d/uFKj+NSU40tigU3Jx+jgLHn
         I8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698694; x=1761303494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eRznc/oLGLRRb/vl90nQzjbWZjbdpkXCZdSvk3IxGA=;
        b=aIqu/HbPmAhvMzThpC/sUiiGlMmFuED0tJ/bLwPEW72efTomdgPMuAB05JxdAVlh5G
         GWUjICwGSOqNqSBTpAAtR3vI2JpKEIrmartf0k5bpV/aLeXSaySiM5f+cvpw7gb9hsiK
         jw3b5QTNF0Ytz8+6kaRosM0Mn0jyi9ir+0FhBp+d2RdW32yqu+jzD4vjKqCqCaV2U3By
         Zzb0pcbI/Gf/hrjAN0JW3ZnjIZen/s8dtFtBWFtnWecqlVD8QvT5P3McesjxJK2VWzSv
         UcKJifMOBvjLpZAbFxDRBJWeaoo8kyUn8EBNVsTpVMepr/+M2xJOQq4npBL81UkMKWdF
         e7xw==
X-Forwarded-Encrypted: i=1; AJvYcCWvUraTkFaTdlXXBmNyoO7VMhwzN7Y5uc1ptP153jCoIqlWY9K1G6w/hZk5CPWIwsIxrW6Z4fObmFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyACwck777xh8nZQ9g4oaIl0I1RyNjJIh/J/80uM1t0dYJg4hcX
	png04PIwV399lktzVVqyRPwKzLyBX/LOVWMUZCMdmZXEoi8b06fa3CjR
X-Gm-Gg: ASbGncs5Z0dfm+e4fyLV9w4fZGtuSpYqylASFem6Go/oFHeWlukw5Qg0jcWdo39EplT
	YNjThb8eP5Yrw3i034krt2LWzrjhhprLNNZZHxsnsHZkrPP7Go/YB23HBT38r7+8BA/Qp18TJ05
	lcsbVlioRsnB2gPWsgcXfJXdGTnsGAnx6NVcqhgpv+0OY8nj5+hj/G7M6lSLLSmrqU+E7wSEmVi
	ckoDKpe5u2MF1TulRJYlrME2DDHoDxhWku4t8OthZayReKjNRsPNqmtAxxrgotKdSGiiqkaatld
	7qnNm5qiaRtKhqyUIsYNEQkeSDp3VW5ZxZqAzpP1b1XgWrK6paY9fAP01lSXln90KigExaLijtv
	FEDk8NEXaFgTWETXbwjP7FAXlLOx9x9k80Htb05PW4fiA+OzEi+/GGGj0eA0I65bW65qq8sRWQ+
	mWSsWLjw==
X-Google-Smtp-Source: AGHT+IFqhscQ7885gKuszm90YTf0KoEGYReUi6/2alYhWRhod7rmgZECRMNtrRBswwS4tMpqwgKgtg==
X-Received: by 2002:a05:6a20:7489:b0:32b:721e:ced1 with SMTP id adf61e73a8af0-334a8617237mr4808979637.36.1760698693905;
        Fri, 17 Oct 2025 03:58:13 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cc8sm25407571b3a.20.2025.10.17.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:58:13 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH 0/3] docs/hwmon: Fix broken and missing Maxim chip links
Date: Fri, 17 Oct 2025 16:27:15 +0530
Message-ID: <20251017105740.17646-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes broken or missing links related to Maxim chips in several
hwmon documentation files. And updates a the links that get redirected to analog.com
to their analog.com links.

These changes remove several warnings generated by `make linkcheckdocs`.

Patches are independent and touch multiple hwmon documentation files.

Ankan Biswas (3):
  docs/hwmon: Fix broken maxim-ic.com links to analog.com
  docs/hwmon: Add missing datasheet links for Maxim chips
  docs/hwmon: Update maxim-ic.com links to analog.com

 Documentation/hwmon/ds1621.rst   | 20 ++++++++++++----
 Documentation/hwmon/jc42.rst     |  6 ++---
 Documentation/hwmon/lm75.rst     | 13 +++++++----
 Documentation/hwmon/max127.rst   |  4 +++-
 Documentation/hwmon/max15301.rst |  8 +++++--
 Documentation/hwmon/max16064.rst |  2 +-
 Documentation/hwmon/max16065.rst | 16 ++++++-------
 Documentation/hwmon/max1619.rst  |  4 ++--
 Documentation/hwmon/max16601.rst |  4 +++-
 Documentation/hwmon/max1668.rst  |  4 +++-
 Documentation/hwmon/max197.rst   |  8 +++++--
 Documentation/hwmon/max20730.rst | 16 +++++++++----
 Documentation/hwmon/max31722.rst |  8 +++++--
 Documentation/hwmon/max31730.rst |  4 +++-
 Documentation/hwmon/max31785.rst |  4 +++-
 Documentation/hwmon/max31790.rst |  4 +++-
 Documentation/hwmon/max31827.rst |  5 ++++
 Documentation/hwmon/max34440.rst | 24 ++++++++++++++-----
 Documentation/hwmon/max6620.rst  |  4 +++-
 Documentation/hwmon/max6639.rst  |  4 +++-
 Documentation/hwmon/max6650.rst  |  8 +++++--
 Documentation/hwmon/max6697.rst  | 40 ++++++++++++++++++++++++--------
 Documentation/hwmon/max77705.rst |  4 +++-
 Documentation/hwmon/max8688.rst  |  4 +++-
 Documentation/hwmon/pmbus.rst    |  4 ++--
 25 files changed, 158 insertions(+), 64 deletions(-)

-- 
2.51.0

