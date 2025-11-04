Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58623EA95
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 04:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762229918; cv=none; b=RJAAeWfbiVAVwb8aRTOITrhL5VCOw5UfZGju/+VScOJ0cl7eGTsTxz6/06Z5JD4AQ3zQGpvb55xE190epV1K0IsHqlrWKKtxr+N941XpIhgau6nKgpJwd5ezqr3CEibqd63BAg/pVd8cm1hNEbKtBDBj5p9+sLYsd6dBR8aga7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762229918; c=relaxed/simple;
	bh=d3rqa1ult8IYHT+pOGDFjb+rtGvu3JZ7+RJtjJ/9aO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kx7/2UW2KtFnb+T3YiwdrnGLnKNIOSkvPsXHZmDsxHtk1G7wLoJzmJhXPwLGCdAPppOswc9cieKK4S3BmrEiXqaS7tf41neHbNUo5PhITJGLPYJeiaJH08QcjE1k8oMaEYFtZgEd4jF/mLBgrBnXZZmVY1N17j508VfDk5wWFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+d1io8z; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+d1io8z"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so4696147a91.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 20:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762229916; x=1762834716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOEzRCysEL4x+FuysJWqjlh6gSnAH1oKrrtDPG6N4YE=;
        b=S+d1io8z+VGlkDeOegFeVZZ+VZDSYEhBGAmURVgfAjKGhkOWFS9Fdn4i79Cc0uWjm6
         /V3hUua4Ewz+gx3gO77HjdVfvPEcUdSt17+U3bHHMB6sIdBf3BBgQmNZfihPDDqra+RV
         ZxUTwqmyjM91AhrTCWP+30mEs/9K68y5fJQARu40ki6E9FWAUYUlbRghI881fQhEvY1U
         KQZMwa3sIBlqdVVhOzPVizzUjgQvPtASAJuPfy1rHkYTL9xm9+z/QjhrF8AXa16FxQ3y
         Gz00tP9yDZjaymFS8nxYnhLVUGrkm4E4Snd+JB/cH3LRLm0GGFI7u0yKipNnSS4396Dl
         v5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762229916; x=1762834716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOEzRCysEL4x+FuysJWqjlh6gSnAH1oKrrtDPG6N4YE=;
        b=hvRmvq1qceI0BCdCnOxppylZNRjs8TUvvBh3lprgCHjiNgHS7ZJ0KTmLV4E2YLWv1L
         YqR98UtRfl2UeKfvKuks4G0sinqDTJPAum+2iURlBwk5MS8Cw90gV6q2KYkAKQCZGRCb
         Jw23kmo4p8ucp/xj50t1Q1U29xIrrvtIPSfb8ISGYBuFpJR+rpNTR/tzG6OGLGxp2s/q
         K1Ia+kPKYBuu9u0ugK5R7EBrp4mE/aKmkrvHIh+BkBT84C4j3kwBofDItbUpawyVnfq+
         pEVAPDA2r3fYYJW+Z2dML4wvTJOEb2Ey4RdWjiWyRoxRlr4yyt4F2bRLCslEudYHwxLh
         Gg/w==
X-Forwarded-Encrypted: i=1; AJvYcCUg8rGKXdgEEa9vM9ySy2El1Q4FUIdLyP2vZfEcB4kOKZcqp9xjpYbxfooj8JygLrcW5kr9SIEXivM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1y3C7ZZVKlpz8cM5PnjUQdTQi+eWIXFBwyxOFdxmwllASQFgg
	zxl7sodTKknz5R/kUvECfHpuOPwAtnbBxIO+XnjaF4E4zvtHr7BSZx2Z
X-Gm-Gg: ASbGncsvkzGafNvGl4L5j99/C27fdCG8e4ZHFtp+HicKrae1+cZfsGcmWRBWtloGIGF
	MTX+ZxB3KMWGdRWhsuDsFHKHM7xcUtmqzSypwZrmd2ltCqFins8msuwtMm3g9OIe7doBuiUprOy
	oxkTpP9nKHWhJay4l5D3snPkGEf4wg4oYxkVZmPX01gkFNV+iAgxSq2w+T5GE6haIYnIrX4iiVt
	4tdG/KNtProS5T1DGd02d/8zqAGIYp1uTT4OvsDok3+MXsEVWnKva6dT2CWZ02LecuCW3L1XT/h
	UIWKM1r8ewhV3CxoVDsyG943m5tLg/RKMw/r8OPwmcaiHUCZNemFxQEig+Xmi+s5E5sFubHmWT5
	ynE0j8vAzj34cnUOunaEiljGfDm+mpywV85ucmJnewqN3rEnYbTTRRfkcVHOJoNTsSeHcYAIq+y
	0fLNgZTrSksvE=
X-Google-Smtp-Source: AGHT+IF2gVVXIyi2y6ccvDeSRxF3EKmw6lJ5/T5UH+EEDwxXUqwmRvEoqwHDHQlOaSYlJWAumbaTNQ==
X-Received: by 2002:a17:90b:584b:b0:340:b152:efe7 with SMTP id 98e67ed59e1d1-340b152f234mr16472957a91.11.1762229916164;
        Mon, 03 Nov 2025 20:18:36 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f1831141sm801807a12.4.2025.11.03.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:18:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 604F2420A6B9; Tue, 04 Nov 2025 11:18:21 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Akshay Gupta <akshay.gupta@amd.com>,
	Srujana Challa <schalla@marvell.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Julien Panis <jpanis@baylibre.com>
Subject: [PATCH 0/3] misc devices formatting devices
Date: Tue,  4 Nov 2025 11:18:09 +0700
Message-ID: <20251104041812.31402-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=bagasdotme@gmail.com; h=from:subject; bh=d3rqa1ult8IYHT+pOGDFjb+rtGvu3JZ7+RJtjJ/9aO8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmcNb/CZvCyubx5d//cMt2783eYzI/Qblobc6stu3OD8 5f/+w8Ld5SyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAid3kZGQ6vite/Ua5+KCX/ vqOdi/H0KXIncm+IT0radLnX4YJu2WZGhve9z2ZfiPr1VzflO5Ns68dKv2sbXQM/LGL/zcvA/uD uOw4A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here is a small docs formatting cleanup for assorted miscellaneous devices.
Patches [2-3/3] are split from my previous macro references fixup patch [1].

Enjoy!

[1]: https://lore.kernel.org/linux-doc/20251104022242.19224-1-bagasdotme@gmail.com/

Bagas Sanjaya (3):
  Documentation: amd-sbi: Wrap miscdevice listing snippet in literal
    code block
  Documentation: mrvl-cn10k-dpi: Fix macro cross-reference syntax
  Documentation: tps6594-pfsm: Fix macro cross-reference syntax

 Documentation/misc-devices/amd-sbi.rst        |  6 ++++--
 Documentation/misc-devices/mrvl_cn10k_dpi.rst |  4 ++--
 Documentation/misc-devices/tps6594-pfsm.rst   | 12 ++++++------
 3 files changed, 12 insertions(+), 10 deletions(-)


base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara

