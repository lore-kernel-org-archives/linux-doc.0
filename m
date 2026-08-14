Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D1A35E944
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 03:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786679908; cv=none; b=VWdQY4kBvbCE2KYZsdOmYcrKfPKCgfhL2iVcbRP26QgGhuxQT7a70aGRfFDBjgBRoI4QeVyU0NKB5UicpiGDyfYdPO7yxnuk6p6ePG92eNS06NBwAQ7oCnnHdcJg4lVOoeIOxf6s0pKV6ZEWvl0gDF8kRlNHamvztzdP7yOBwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786679908; c=relaxed/simple;
	bh=jCDeqn4a8Ajp0kh2tsCXXZkBx+232A5pSG4wDAub0yE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gf0R8AxG0KWSUB4Ge3vOCdgknDNlyBCdmyikh+RK9xhHJ9NV3Nx0FGCsmIbmPjlLNYTfGlh6m7UW5HFVfDitp1KduTPQUMZGlKQqegd420sUGR1mhCZNUQpMHjpFg7LfUHG7c88bNQSg6E6YR1SElz/NW2oDoYn+ckDTv3lwPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0lzIaJd; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0lzIaJd"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80cebd41372so8734007b3.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786679906; x=1787284706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCDeqn4a8Ajp0kh2tsCXXZkBx+232A5pSG4wDAub0yE=;
        b=R0lzIaJdlO3Jab2pXxCSZwE5m2OKlkaOnngfAt26LuyYrnL/NHjap/HCiizGY3zxLv
         nCzbBW0UeVbOVqw9oxgirvxajPMeNKrWTkr/bBJgwiVUN2LbXq3BC8Y5Dgp2SS+AKJgu
         d4v5IkB4tPUiQyk6O1Vw7ApJqT1jM3Z2NK3b8/yYdR+2sobJg2ulGRHgMhYwey+IwBWq
         5VJZrMEYCiwu9DfUF47SbKmFfl43Qami5JPAnXkUUebdWlnBjKywDH530VlmKtP2BrVH
         pe8x4x5bXDTbiNgpWRPXrnEtJnCRlqxjyUB6oer4m12ymPq3QlZMao92tmDkKbLmm0Bw
         PXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786679906; x=1787284706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCDeqn4a8Ajp0kh2tsCXXZkBx+232A5pSG4wDAub0yE=;
        b=bx557Irt0aEtolWQhE1r7CN+UWhJ9fqQMFJLiB1CYFdCMAJ7ocWt1n+dsWh/JFJY7E
         UotC+iZ1oAFYOwG5BUTuSSYG8MZARLFffuvYMgY4usLnwqYTTv8C3yJw2As0odDHUKHg
         ncXWIBHndke5uVXiwdQfB5tMV4XimnsXKUpESS7PF2FnopLnxVuLIBlmkPwdeK/XFgVe
         qlczHxeOVVIwqI+HU6lvZ6ulBme9S+dieiRkv2VU8K+MNoY7fiWlctZMoeFG55ZXt6gv
         uJ78ANFQvJ4DnHSH0aNEeEYdQXdcnqt+czkseBA9Z2km5iS1woSnnCYd2hsNOApJ6irP
         APNw==
X-Forwarded-Encrypted: i=1; AHgh+RqbRc4TFyEneiconXab0fN25PVT63Vxm2GBnU0x4yL0KjIMZaJ7EmYbpK/F9oMQq+HE3dyXKZbuvDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZw7m83Rx9eJuZ4iZbxXLvSdri31VdugoV5YKXPdQeSsKib3RS
	tS2tG0206jzejMcBQ8jT2ZGh2yQ4pv4S0oUlOdhu6ibZFSwXDSPE+d3xCM4RK6XX8rR0Yw==
X-Gm-Gg: AR+sD11qWuzyZy+BT8yQzwVc44d7yzzDv4TSVOQVJg/m7CDh5PT2D3jwy5gd27pF2dH
	x7ryA9tcwJlQN2LczraiTw75S1OXX9G83Jowi4mF1Fq07eSrLOoRPoNlXfVGQKRa2XJNgK9/HeG
	z0ej1rsD2srUJJa/R0nokbk4vbJzLx8z7zffAgK0KcstMeOe4HExg8StNOuNpd3ikG28g1d7w2F
	oPHJ2awzmNpBynv6kW/uQAfHN1hZdc7Xcqn5YHzkA87k6FZIcP58QaqXV5713e0jUKh4bwkAcpB
	AyeaHjolTkl9qkelVvYEaWPSdbutMPAUSgUHpUvDnZsEWykQzGEDx8KrSx8ks98iBBJP6DI7CZk
	MIzoHrKQ5si/dprJEEl0qL/5jIq7M2X21GIiUfWPhRa345sM47A4bT0xnMaz8yp1Tt8K1uJfxfO
	k9g1tyMJQMTpq8riMYc5OhrlHsiJ/23xiKbcwBhhG22XCDiVbjB2bwEb8=
X-Received: by 2002:a05:690e:418e:b0:66c:4937:d319 with SMTP id 956f58d0204a3-66c72d2ec6bmr1419743d50.46.1786679906536;
        Thu, 13 Aug 2026 20:58:26 -0700 (PDT)
Received: from Gentoo ([191.96.150.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c7934cf98sm303070d50.16.2026.08.13.20.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:58:25 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: ray.huang@amd.com,
	mario.limonciello@amd.com,
	perry.yuan@amd.com,
	kprateek.nayak@amd.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Doc: admin-guide: pm:  Removed unnecessary backticks
Date: Fri, 14 Aug 2026 09:22:07 +0530
Message-ID: <20260814035753.1978031-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed the superfluous backticks in the sentence.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/admin-guide/pm/amd-pstate.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index c7bf7cc2db87..a37a51c8b042 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -471,7 +471,7 @@ update the core ranking and set the cpu's priority.
 Kernel Parameters
 -----------------

-``amd-pstate`` peferred core`` has two states: enable and disable.
+``amd-pstate`` peferred core has two states: enable and disable.
 Enable/disable states can be chosen by different kernel parameters.
 Default enable ``amd-pstate`` preferred core.

--
2.54.0

