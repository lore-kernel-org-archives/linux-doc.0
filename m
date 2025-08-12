Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1393E3594F
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030665; cv=none; b=AX9jyHEAKUOctRc9hKr7xuFvysNvJIstcZxvg27ogWeJyWA2TK06Kln3yaJlGAkWRprrDAz4ttPFcyVeZBv8ijqI7PNl5icfo/j/uDzAO7oBBzHz83oWuw0rUH1LcByn9WfejigvCP+MvavQP9GG+V7mhuLXpgrUvp4cncHbHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030665; c=relaxed/simple;
	bh=2IfuNLyi9uipq3MoWaI5s6DoSkNjEJLyA65WKiHlfhU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lpjYCYSOf2HqupkBpRQQW9IqCr9ZUI09YNEk6TbdCYVy8pz3Fb27J7RrXieF0Ob7LIcmBR2UJWKkLz3GhICZF9JR/dMv4kepnkF8RrXs3/fwYTC7cDNAmP9pWGiTzCcDEfU5saQEtHy0+gT3wgUHs9+SbGySUN48kEJi8gtIORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa/Lmq+7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa/Lmq+7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73c17c770a7so7408607b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755030663; x=1755635463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2D4lQpHgeJtXF/5J8lAW78CcuhxTdiGqHN9IR3ofsk=;
        b=Xa/Lmq+7CbBRWMnPwjDJtf5vb6FCly0Fv9Z26AHUHViLiKH1o+6EeoF0WrbpwdLQP6
         8limHInBo1x/XgogW5owhq9iw6ov7Q6zL+SROwsO405xLBBtAVXZtJ78V4mRnvDvPBRz
         Jy7Rxmi3K1qz6Z4zjNgH85WPA9kNef+x3vQrNKhYUBJtmj6+SMQeJrxHKN02zi0M2y+w
         aQO6T/jHhecQbxNdrYu1dXzS7SsBxW4KXVUO5j6R4G8//voQJDmhezkzAYKcPqccMtoc
         S3ptYWEyM98sz96Fi/sQFvAGmQUhIavUGNe0vCSJWz8jSXPkxK1GNohvy8MfORiaG0hL
         c3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755030663; x=1755635463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2D4lQpHgeJtXF/5J8lAW78CcuhxTdiGqHN9IR3ofsk=;
        b=Z1HuC42nhe21ktzyDyigq9VYEB+3jBxNWJqlsEuliTbc9omndS6wsrUV5Hlw/s2o2s
         +f0KR+VRqppwk7+P+Roo/kvj7BtfBZOAQ4lNU3QEZE/8s56QtvpKofCwZ/5R8psSYUHa
         ZcvRqCxRkIlryDQr7dZgWxkgvrBNM6AhRoh8RaGlXdHdnLLM+wuHGE3f7JyqfOjaGe1/
         2ZIN1YcQO3hg4P9UGvjvooOUbNf7zZc14QWVTUm90QFU20ejx2AnLxIYWvPv+TYQOr2G
         AWTKbCmJsxQsYRMwOsbKEoGVYdYeJ42nxB1Dc41tfc1OtXca1Wg9mthDYkHiF5Wj2F9Z
         OqeQ==
X-Gm-Message-State: AOJu0YwfQcXX/ImE7Csm65KOoYVZ9dSrQn5e6gbl+m8b0c4TF5L0QtZk
	Od0dfsvFsDOI1OSsSz7RmGcQKOCxSRNm0pWjiJl+GG8GwJLN1MxGAUQjj3bHt60gfxY=
X-Gm-Gg: ASbGncssQ+TsCvtwCFPuO2E03yhyTdBn1BPH7Kalbd1ebqiwTDBIwTFYe2ww+URSxCq
	OJcEciV/RPRut5GjOAi2bQqCDfOnDgTb3kUJtC6QuC3mwnvWFKggar3SQG+ZOIGS7k2Y88UuklH
	DNYoOW7Jger105nY3eU/RXUb49vqzRagkXQix/f6tjrNY13EDVmmJN2faJhZMIyHxdeIGO+3uNb
	vnsKKsvOiePIYthlMY80fbDR8PJUA213UKCne+MjGHXJesLsoELYs4q+ERxg4/C4ZSB7BLtWw1Y
	2MiQ+S0bhjuRH8HD0S1tKpE9DHWALiX9Fn/RzZ27eT0EEMHbN+Bl5SKyqnyRtdJ4sNrtnrGVBjj
	N8aVF9JltidD2EJISVl4nuSv8Vn4m84U=
X-Google-Smtp-Source: AGHT+IG9ie4Yc/kU4PIfXSz9Uma7N+1x9yV3RNNsMPDGOBfLHQeO7dB57CngKREHXy9pRt6j39w6Lw==
X-Received: by 2002:a17:902:e54f:b0:240:2a0:c449 with SMTP id d9443c01a7336-2430d08d164mr7810415ad.8.1755030662579;
        Tue, 12 Aug 2025 13:31:02 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cfcsm50361a91.21.2025.08.12.13.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:31:02 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dlemoal@kernel.org,
	hch@lst.de,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH v2 2/9] docs: zoned_loop: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 01:59:40 +0530
Message-Id: <20250812202940.70560-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- conventioanl -> conventional
- directoy -> directory

in `Documentation/admin-guide/blockdev/zoned_loop.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/blockdev/zoned_loop.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zoned_loop.rst b/Documentation/admin-guide/blockdev/zoned_loop.rst
index 9c7aa3b482f3..2d50d081592b 100644
--- a/Documentation/admin-guide/blockdev/zoned_loop.rst
+++ b/Documentation/admin-guide/blockdev/zoned_loop.rst
@@ -77,9 +77,9 @@ capacity_mb        Device total capacity in MiB. This is always rounded up to
 zone_size_mb       Device zone size in MiB. Default: 256 MiB.
 zone_capacity_mb   Device zone capacity (must always be equal to or lower than
                    the zone size. Default: zone size.
-conv_zones         Total number of conventioanl zones starting from sector 0.
+conv_zones         Total number of conventional zones starting from sector 0.
                    Default: 8.
-base_dir           Path to the base directoy where to create the directory
+base_dir           Path to the base directory where to create the directory
                    containing the zone files of the device.
                    Default=/var/local/zloop.
                    The device directory containing the zone files is always
-- 
2.34.1

