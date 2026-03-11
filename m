Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48BA278161
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 03:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198353; cv=none; b=HuVjV8DEhY6PDPKTeoysTECtmtGWm7+4/40ggo6QM9uDPV0ou9AZnY2sQ7O/QHsKX3iZ64UruDkUQMynoutrPQUWGLXi+SSyHZXz/TXnQVV8uGkAOOtRJhaN3aZcQr5aZYXCTZyxX4MnmgMlNfWmyNguMXUV7oyPg2I3+OYJpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198353; c=relaxed/simple;
	bh=g0jP/cCy0U+7vBEtzVQh9T91m2nfewDiwa5GpQYX8hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iaZpldtW+2faoiCFjFb4LRo60wM7PSYX2vYZAz42bmQEC/QFS3QlzY96YQ2fJJNqDERSepGZAC0/jNHaoH9+qN3O5w6wSx3BCuKdwV4vR6fdJIiJkbAB7hVuWydrZaZ2V1vo0gjWUlgUh+HydSs7ad2vLs4Mh1EQij5s+i36yzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZciOML3; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZciOML3"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-466ebbf7ff7so1182603b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773198351; x=1773803151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95ZRrtc4eXz3V4yj62Q+GPsi5hI9uvUkZWMdSqVx+RM=;
        b=BZciOML3J05tgEuHCeUpKJ979BzwmjZ5M3RcxhcHptbOGQE+cLL/4PD6q0lMuniqEx
         3pqZ6XQ0nxZ2J6NQsP7b4K96Q8iymyJEBnmp274PdCN/BhqiwMjxX3q0qwEM1cJVQQtJ
         JNZK1nym6Woy4HgqsWB/P6gXyYLud54h73bg4I1Py3sDp64CcTfvJy7p3ne8Ftl0eQdK
         ZctrsiYXbI7qFWnxu9FaksD32zHNbVqlMcenfITbmxG3mS3/gjaBwMEq/LaT4e+LNeSy
         f31x4YjrYxAJwj3GfkCH9q/myztAE2XBxFDrgLiUvrdgGXy9+bgvQMl0yRlPhne9CnAL
         s14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198351; x=1773803151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95ZRrtc4eXz3V4yj62Q+GPsi5hI9uvUkZWMdSqVx+RM=;
        b=fHSeg8QC7i3MtzeG83UkGvLZxESxBszsZiUWDckfAr+aiMMrEY8UAcMB0DDhRWbKL9
         onj1Aluh+AANiSOlMsqtH9Qih7iOyOgBdbOoM1RfMVtqW7TGV/80aVE+AsIPuBnbQTGR
         uxdZiDZBhk1iHxUGjSoM+R9zjRtiKc9UPoaCo+kfVvmKOIR5YrD1K0hc0X8fl0oG1JqX
         xVsnv7mZhd69ILIHWrxIXqgpHluLwGPL3LfvmErUrmkxIGGD1rZ1dMT0VNVeaj6n1cN9
         ZQ/Hu6ZVedRYH5RL7snrWhQ/jmoTQnCpS/R6HgRbVKXqwtLPK/L5bmscJza/Vq3M2y54
         JgtA==
X-Forwarded-Encrypted: i=1; AJvYcCUq4DcG15QKncO/VNoTraAuIuJpTRQdDyGcMz0YY8x7qYL3Z+qiymmi/b2g195U8ZiJGen8BjcS5ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK3DUPfWpkN14+9c71JOqy4k4+o1Gv4oxZZn8ggC0B5ywBi9hw
	4OlZsSE0I9lYZ4PRSHKVU/0wearYiVQPwooTK3CQQPAsZdhONsnTIESd
X-Gm-Gg: ATEYQzwlVmnZ6UXZkGp9odnk6gi5VWeLog8TCZSmlOjTNryF7ab/ciDId+q0Jcq4eW1
	gW637aBlp4Yx2/egqOgLU1gxc05XDCJ4Kiji2Uy8QB3iKIRmhNZkrN9DH6Rgdk0qobOvpzTnZTc
	MkLzDVqmGDgtqyIP5vBIvgZXDyF1v+4ICNBAuvqXS/da2neoG/yxnmqxOwS53vwsuH8jQjQveru
	CGyDkwU1IYP2vtC9u29aglD+J/LgSFdZhTGeLPmV8aahuCSngSALQn7p+gc/7jiR3y0AZVShFqC
	rAV+jX6rz6I8V/hvOdjZWJgRbiA6f/mVKExhGQMUNSj6JMzkWFgUvYOFh1DdSUgXCy0eQz/oDdM
	/EnYFRbZVo7N+XG/IWU+Dea8L7NACqJK+rJAsfwdG3PkFX7q+/8BAq8KNzlpJfD98bn6FgQSlYG
	qd1zswiXKm/OIF4oBI9PHSd16/A+uxxUGUpqe1FaiyoSYC25ju2qfksVb7iqD2TlcTx3Bc4VyUd
	oolDjZkg6pdjy/4T2nDEvA=
X-Received: by 2002:a05:6808:30a5:b0:467:2a6e:adad with SMTP id 5614622812f47-46733425bc7mr575564b6e.11.1773198350583;
        Tue, 10 Mar 2026 20:05:50 -0700 (PDT)
Received: from ShravyaPC.. (r74-192-25-180.bcstcmta01.clsttx.tl.dh.suddenlink.net. [74.192.25.180])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-467342ef6fesm468393b6e.14.2026.03.10.20.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:05:50 -0700 (PDT)
From: ShravyaPanchagiri <shravy112@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ShravyaPanchagiri <shravy112@gmail.com>
Subject: [PATCH v2] docs: octeontx2: fix typo in documentation
Date: Tue, 10 Mar 2026 22:04:50 -0500
Message-ID: <20260311030450.8461-1-shravy112@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake "Crate" to "Create" in the documentation.

Signed-off-by: ShravyaPanchagiri <shravy112@gmail.com>
---
 .../networking/device_drivers/ethernet/marvell/octeontx2.rst    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
index a52850602cd8..c31c6c197cdb 100644
--- a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
+++ b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
@@ -323,7 +323,7 @@ Setup HTB offload
 
         # ethtool -K <interface> hw-tc-offload on
 
-2. Crate htb root::
+2. Create htb root::
 
         # tc qdisc add dev <interface> clsact
         # tc qdisc replace dev <interface> root handle 1: htb offload
-- 
2.43.0

