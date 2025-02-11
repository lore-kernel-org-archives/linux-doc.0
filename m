Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21D41DF967
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269815; cv=none; b=tw22i4cbr24GVPkpqI4CEHkGSSjNnu0wrT1rBdzojC2oS36YlrjAy20otLmFWmcXqQF2nYhWbqqYzP5C2wDJBZq0Ixsjvniqj3WnIJC3bY4ilj6PjZ+LWycuo5ErWyRLQA2SPX7ui0VKcLhLPS0/BuwB2PbS6hLKfMLnG23NU8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269815; c=relaxed/simple;
	bh=fNsV/w5qlTC0UnjLXwyi9kyQZ7wIrrmDxbP6Hk8uLLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B0kJJ3SVTJXhhH3rKQWhy8h9g1Tt7GkjOaxCeJlLQXhbatP6lM5BC6l9yHAkyWLoTOtSs7VnAoG4UihZZsHElLq4snZNeBUQ2iW1EXY9ZKcNWCbgpwzhPn6S1EozC7FlXvaOYBhjJFbuW78dtL4PnkfIoYt4eFWaLktoVq5VIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX6IQipY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX6IQipY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f573ff39bso77311925ad.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 02:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739269813; x=1739874613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHfbaJWue40oGVU9gl6xqWDxiyf5UiEbsGPKoxtQUu8=;
        b=VX6IQipYarLrJOFwUCAKgF6LT5WN9O6Vqemcxlo2WB8BDaMOB8IscjE9hVjBYczAtj
         PY48ynQWqpjhXLVsDVORwxm1WAG7pZmsCnz9OYwzpDHxGlgX7zrZuze8momWKF/28NNY
         B0+l8s200A6UbANww3mXfO5tNVFvIdCzgjNzsRxOTqcwZx6mQN7DEyIr6rW3YWAlPt9a
         /0SrjyrKONy08zU3jxU4yRnEuA6zQlERia/iJzKJbE16s21zlcNq/IqV1xyvKsaF/zeD
         4UiKuWZ6aZajQHCEIRa/Q7oFz1+b3E7mNEXTUF59b7kridfW579Hj4OssnszMYSWTBog
         MeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269813; x=1739874613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHfbaJWue40oGVU9gl6xqWDxiyf5UiEbsGPKoxtQUu8=;
        b=TrzEKqU1BnMU7FBzY0DgS6cf1ztXeS6/NU4GYM1ysg5jGq9273w+0WGVjvjaZyiUFK
         mRiuI2FmY+5fQ2DTVFRLHHQmGtDPVoYGcKAJo8/K2z+5BSKcKGUtVZdDkKvHTJpGLsU+
         Q1JQW9l7/FfHIX/5sqFQcCYEbvHUPvaunIdZx9d+i4CZw56yuUyiQvKr7rp9DEpnXYAv
         kN5blKKO/wdqmBKi0ZkJYr21c3ZD32vt9YhSN2DDC81JTTSI9DmpPhNlgG0VM9UaFSUW
         B7lt3KOKe5P+58So5/xkRMLzTVhmWBchvAH3e+pcUpJ6LcQuaeUgz+Iga/y1W8BYDfz4
         FTpA==
X-Gm-Message-State: AOJu0YziH2t7tvvEdSvDi0jHCPJeQ1KnD7Y+Nea2aNGg4QFoP1HOZonj
	h6VTkWgJw1j4N8H7OHmf40iAZ8MT3tL7Vy4JepEe6cPPpCUlKcyR
X-Gm-Gg: ASbGncvllXn0ta/8UvabUU+SBM2MkzrWYmeaIMX+FwFlp7A+6HHN+N+Av/+4pgTxP9N
	ZKCZLS0+kpKDvjvbelWovYCIIpZmpLRqaW9fCSxb6GRnFJhMU3mPST6j1zBYic0y8+5Cyqsh7lz
	/PMnUDByO+dJmrY2SkjYZd40esYt8Ugxv77Q+scJ2UGR++iQkZ+wTLbZpKw0Txki3jDpR3IcaPe
	Xehg/HT3h4Ee78We6ZvnIweXtzQSa4vFpFNMaxgUHdRjRP8aUb/X8IBh3kJ3hPOz3/pQDk/mlWF
	xdKQ89YLrPb8G1fppFM=
X-Google-Smtp-Source: AGHT+IEnKuqhVUNUIpoiBX2xq3wVpCFtMSrJbwfG0VM2EBLTBd73Q6SWH+mSESRCyRpa+aZI0oVCjg==
X-Received: by 2002:a17:902:f787:b0:216:644f:bc0e with SMTP id d9443c01a7336-21f4e6c899dmr327386445ad.24.1739269813123;
        Tue, 11 Feb 2025 02:30:13 -0800 (PST)
Received: from pop-os.. ([2401:4900:4e6e:cd6d:2732:b5a2:e46f:2ac5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c8f7sm94054635ad.178.2025.02.11.02.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:30:12 -0800 (PST)
From: Aditya Dutt <duttaditya18@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH] Documentation/driver-api: fixed spelling mistakes
Date: Tue, 11 Feb 2025 16:00:02 +0530
Message-Id: <20250211103002.199004-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed some spelling mistakes identified by misspell tool.
The example code in Documentation/driver-api/nvdimm/nvdimm.rst contained a
misspelled identifier (paramaters instead of parameters).
This typo would have caused a compilation error if copied as-is.

Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
 Documentation/driver-api/media/drivers/zoran.rst            | 2 +-
 Documentation/driver-api/media/maintainer-entry-profile.rst | 2 +-
 Documentation/driver-api/nvdimm/nvdimm.rst                  | 6 +++---
 Documentation/driver-api/pm/devices.rst                     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
index b205e10c3154..3e05b7f0442a 100644
--- a/Documentation/driver-api/media/drivers/zoran.rst
+++ b/Documentation/driver-api/media/drivers/zoran.rst
@@ -222,7 +222,7 @@ The CCIR - I uses the PAL colorsystem, and is used in Great Britain, Hong Kong,
 Ireland, Nigeria, South Africa.
 
 The CCIR - N uses the PAL colorsystem and PAL frame size but the NTSC framerate,
-and is used in Argentinia, Uruguay, an a few others
+and is used in Argentina, Uruguay, an a few others
 
 We do not talk about how the audio is broadcast !
 
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index ffc712a5f632..ad96a89ee916 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -116,7 +116,7 @@ CEC drivers		``cec-compliance``
 .. [3] The ``v4l2-compliance`` also covers the media controller usage inside
        V4L2 drivers.
 
-Other compilance tools are under development to check other parts of the
+Other compliance tools are under development to check other parts of the
 subsystem.
 
 Those tests need to pass before the patches go upstream.
diff --git a/Documentation/driver-api/nvdimm/nvdimm.rst b/Documentation/driver-api/nvdimm/nvdimm.rst
index ca16b5acbf30..c205efa4d45b 100644
--- a/Documentation/driver-api/nvdimm/nvdimm.rst
+++ b/Documentation/driver-api/nvdimm/nvdimm.rst
@@ -535,12 +535,12 @@ internally with a static identifier::
           char devname[50];
 
           snprintf(devname, sizeof(devname), "namespace%d.%d",
-                          ndctl_region_get_id(region), paramaters->id);
+                          ndctl_region_get_id(region), parameters->id);
 
           ndctl_namespace_set_alt_name(ndns, devname);
           /* 'uuid' must be set prior to setting size! */
-          ndctl_namespace_set_uuid(ndns, paramaters->uuid);
-          ndctl_namespace_set_size(ndns, paramaters->size);
+          ndctl_namespace_set_uuid(ndns, parameters->uuid);
+          ndctl_namespace_set_size(ndns, parameters->size);
           /* unlike pmem namespaces, blk namespaces have a sector size */
           if (parameters->lbasize)
                   ndctl_namespace_set_sector_size(ndns, parameters->lbasize);
diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index d448cb57df86..8d86d5da4023 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -358,7 +358,7 @@ the phases are: ``prepare``, ``suspend``, ``suspend_late``, ``suspend_noirq``.
 	is probed against the device in question by passing them to the
 	:c:func:`dev_pm_set_driver_flags` helper function.]  If the first of
 	these flags is set, the PM core will not apply the direct-complete
-	procedure described above to the given device and, consequenty, to any
+	procedure described above to the given device and, consequently, to any
 	of its ancestors.  The second flag, when set, informs the middle layer
 	code (bus types, device types, PM domains, classes) that it should take
 	the return value of the ``->prepare`` callback provided by the driver
-- 
2.34.1

