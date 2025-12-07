Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ABF8479
	for <linux-doc@vger.kernel.org>; Sun,  7 Dec 2025 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765139271; cv=none; b=eBAx2iihPG+7vttjDUlviM8NWdQwPuzAei3CgdoHzDwYDEKSr61AVnVHFupleqg9/bopDGH+U0MZc4tvHp0Znu70lRFrf6RAhM0iUnPfcfcDjUZmUv+4GpYYqzTJw/ZMicvQIGr8QXzV1mmnOO/WGfXeR/Xq87vwrb1tk14yW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765139271; c=relaxed/simple;
	bh=pTFPo5Q2+iKTcmgIH35Rm0x5Pl4vIHoz+rvWyv3fWd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uh7xRrXKlyrpaUVA+lcelzvFsUu+2kQTVPG30ubHcyQFx7Wa08F17i9shbnGbpdiVSK30Sh+tgks/dY8BrZaBo0QBKs9OZ1pxXXq1q1LzLAsUZQav5Xb/Modb1NtOqRUcCwzfmg62VgycpN5JQRUZ6NM1mJtiA+AtWfk7CWPY5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZm3Onbt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZm3Onbt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7e2762ad850so3926608b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 07 Dec 2025 12:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765139270; x=1765744070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTnGo5IRNTPqTb6QTueFQxQdCY9bvgmhSZCOqTE9YWI=;
        b=dZm3Onbt6H7NDXlKg0nW3QhK/pkBCv9pzOa4vJCI4fNTSgPa0qUsuZPkaF1q5kbG06
         0VELW6p5SVkQVF5RGgw45fHm88qk4Q7j5E1HterRbjACg7bax6WvRxuC2gt3YXOyY3nj
         VeSX2g6365OeoLlAhfy8fbhS4zG3QIyaZ8mXgt5c3gBiI8lPAR4fDR3bNtWo+RCGzl3y
         0heJ04jeBIj/GicKfAvlqmqB7S+LguCPOX74MBJGiGauF74VgSTaEjtaAfrIyrcPGWm8
         LroSSxILGS2tIoja8G0GXC3HBhppwode42+arBi8yOgZyTSLh1p587lE8zOIgV62e2tu
         0Z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765139270; x=1765744070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTnGo5IRNTPqTb6QTueFQxQdCY9bvgmhSZCOqTE9YWI=;
        b=kz+3t8CDvBAuFT9c2XepA3AK6Sdx1pLdiHZe+G4ceLf55gHYmd6p2kfyOGvVkkYreR
         ifGX19FxgdkUCB4vaPZoTZkBW1twvoxpus5F8yfEsG7GmoxEJ1nTqYQGuSe9l+aDjO4t
         DlQurK7MpLWTu3pBJJOyn52MFSG8vjzFAe6paEtxM7HgKM7LFHrqFSc56NW5gRXQ7ff0
         k+jjbfhNyX3FgyBayLA9+V56R/4VfWPUAIFsL6ihDorr3SEhOROlL/0Cwml8QvmwWY6M
         wixwPzk6D73EDwwjxb5raq8zS0QN+/rRTxxVs3Zlctm8C+tG0m3pomsoL2gzhfMYU/bK
         53Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUjfRr04UGdnNj2UzqOM8WcF/iQDI6qsC2b6FBw3Qxf3/WI5joM2xRkT94xR5c6C5Q/W1x7V02id68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkHa2HAHDPP+00UrxmBibOxZybCbo46Hud+f0DSMA8UpgyGV9m
	COdvptYZrPBhyNc1tywkxLhJa5U/MxH8kpzRn+Jb2myRdYTWz7RCRzFu
X-Gm-Gg: ASbGnctR4kmPK7AXuyVkB4TynY4/WkLYFfSqs06848+mD7E9cg1YmKW3aVkvmqXNQ/Q
	JWsEAQa1YbGY/2FJboPtk6Aq0giOPpXvQx6BTlqptP0yVjSxSlKrztjGaQpfJuuHVQfEvzaJEBs
	ieEWCM3MwAR5Ur80h2vQszJka4e1/Eo78kHlSMbeG94EvVrFuSwNS1HLwKkIaRq8dGso4gQyBDS
	ABIyfatX6RpLHC1mzB5znzssli7qopQWZb7DAIX45QoNu6i81YrQyaV8Fq+WenogWmeL+Uz+tjY
	D33kZGLwdpqe3RSxefwjgtZSNZiF0yt1sHz24YqKeLjitf7QxHexVUCSNegITkeLfhkHKllespS
	olWGPAExytr0Q/QWJT2xTb9GI0h3E4cI+uqLMyQ2CcK4JOiY6fTRKaTCFE8jSAEE5WQ2McuHCtp
	acu700YJECTOGMGAoeo1wd44UapAk+ap2U6tJGXQ==
X-Google-Smtp-Source: AGHT+IGVt6rATJFKXgf7QcNgwJuR8JRguYCnyZ0hcV5ZGNWLUeU6GT4A8kEOcekzUI0dw+RlJq3oyw==
X-Received: by 2002:a05:6a00:3e14:b0:7e8:4433:8fb3 with SMTP id d2e1a72fcca58-7e8c6c9d722mr5238488b3a.59.1765139269782;
        Sun, 07 Dec 2025 12:27:49 -0800 (PST)
Received: from golem.. ([223.187.99.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ed31bsm11168091b3a.3.2025.12.07.12.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 12:27:49 -0800 (PST)
From: Shubham Sharma <slopixelz@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shubham Sharma <slopixelz@gmail.com>
Subject: [PATCH] Documentation: hwmon: g762: update DT binding reference
Date: Mon,  8 Dec 2025 01:57:12 +0530
Message-ID: <20251207202712.71787-1-slopixelz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the device tree binding reference to show the change
from .txt to YAML. Binding was converted in commit
3d8e25372417 ("dt-bindings: hwmon: g762: Convert to yaml schema")
and moved to Documentation/devicetree/bindings/hwmon/gmt,g762.yaml.

Signed-off-by: Shubham Sharma <slopixelz@gmail.com>
---
 Documentation/hwmon/g762.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 0371b3365c48..f224552a2d3c 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/g762.txt or
+documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
 using a specific platform_data structure in board initialization
 file (see include/linux/platform_data/g762.h).
 
-- 
2.43.0

