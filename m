Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4C2DC770
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087671; cv=none; b=aSF9VZFm5WuAv4hxyWbVfMfVbf90YxvDK6Y6t29dlJ4pthNqSHAL0cFJRBUHA2o0Wn9YGWaYpFJY+w5CzeqIhuhBq1EJ6tPSm/dxFY7RdBt4e4l7W3z1iGIUZhE1eRAi9J8poXlr4IhsRj9MT0GO6NbLAX/Ef+Ea/zQyxxoxLrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087671; c=relaxed/simple;
	bh=JMfWtDZPoW33e5iPZgz08TVXR8x0tYqgOH75GYKjvVs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=P5xb9cMkHi9IUuNm63dfQOjQ6TROKn/i/in4pWM5IQZpRVrxGm3bEtk2jefKBdqJbMpe+GlB35hF9mHm7WuOobPOdg2qQb7WL4Roh61FjcRLx+7H8ygLRd16GT2c7mBeOasVJVjQ2N7FyKiFtGY43LtP3icIxkTWYBYz8rHHlbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1727Wi5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1727Wi5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7398d65476eso592237b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 01:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746087670; x=1746692470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYx/0CK/65KhjnWaLN2YJlBZbzICSh+AKoRuXk/A4Gg=;
        b=K1727Wi5t6kQBnMrUjsHMeI+G0k/lIlQ8GB4QXz/QS6k0o09KJLSFujX+qnV1SMj39
         D9IeMLlTmhJNbto+lDHUMawnM+EgqlGOz9MNphpaEp9seXweGAtshA0cinYBxpFCq1X9
         5k3/DUTnqZHNnZVFUM1A7naPsTiavTM7UoD5xRmWPsuJ+NYYsLoZRQyKcNgCU25aRzII
         PFZIQ4tpYrze3N6TY5Ped50AhFCPtdQBmCF5sNwZKgOX48UDCgJJJzkHPFwcdVG131so
         M5rBAWS+cM9rb9BGbgTZPgqlfulu1EqTD7+ZTJk8R63V9HN8hujyrd45AJTIQ8hXi2fI
         q6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087670; x=1746692470;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jYx/0CK/65KhjnWaLN2YJlBZbzICSh+AKoRuXk/A4Gg=;
        b=X3lUvTRLBWO3w50KQ1DBVVOC/FNMMpkzJRclUzmwOMaerjg5dWJobCaAeuLTVX898E
         bzPnjMQdxRXwQhrLRBP+iGNTHkv13BxW7fe1GBhIlq7/5309j6Gpz/Bdoh9HPJyMECy/
         /sL0Hc5Eu3LiTzNUy5ma/2UR5ZM61r4DkQExn56PHhxrNHocrDmxtd7h75wB7+wk8vXW
         1YXOKbSD89gMGYtbarHuCYD1AVGSxFjm4s3NndK77zjhD4p4mQtdLtIwEzdyd4ptAoNz
         6Z6EWU75zycOlDPv8hmoWO2JD6vwel4se7dcAV6DhfxaSPi2eGpRfmwkNt1fnf9UZvmG
         ryaQ==
X-Gm-Message-State: AOJu0YzPPq7D0JZw8kkfiwaeZcjG4gmMIMTsztYQ60KUBcDnP+HROCqO
	53qT+RBZhGWUR9/Jz+j3M4tm088eecoJmyOUcwDL2O2e9Ahjz8W2
X-Gm-Gg: ASbGncvT7zyPeOWA/fjdiVUFw212Cnisuxe5edxZE95v9MYCxCN7ejPJ5XCCFooRC6E
	nJWrW728hgUJpZX3+mYW9mPtAJ9bF+vxZfFgP+C23O756ZSbxPKulopflvVbMtGkrEfvHwguXYJ
	aU2IOAoqKwei93Idozm6S/vA+2hnzoC4FKNSklehLc2TM60MPr3iqyVPVBBaQJza10HWkjFP4LX
	Xb9OawbZv5+r0dfIHHaL9/ILX5/0yuyRSqY+pJE9kYzHAyO+SpSud0FH2JqU+Z7U0xaZW2FoIRG
	7c2mK+8p2XsYBdkWTX2XAjwpFocTmoIrnsUu9FBI1E/40jZ3lQSaRlmgg10HR1lRvQpXT/b62IY
	vxUM+AiiEIWU=
X-Google-Smtp-Source: AGHT+IGkEMWriyee1CuRcF930LV1DSO5FMMjSqOzNu/L58SMGxnos5mlbxSdw1SCEK6C+xVxaQioCw==
X-Received: by 2002:a05:6a20:3ca8:b0:1f3:3864:bbe0 with SMTP id adf61e73a8af0-20bdc4a792amr2352795637.8.1746087669682;
        Thu, 01 May 2025 01:21:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d66e230sm230692a12.66.2025.05.01.01.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:21:09 -0700 (PDT)
Message-ID: <0253ce98-960c-4498-8ace-a4354e3ebc26@gmail.com>
Date: Thu, 1 May 2025 17:21:07 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: Makefile: Inherit PYTHONPYCACHEPREFIX setting as env
 variable
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit 6c2f0b28d76e ("docs: Makefile: store __pycache__ at the output
directory") assigns a new path to PYTHONPYCACHEPREFIX for building
kernel documentation.

However, it is not necessarily optimal for everyone.

If you find PYTHONPYCACHEPREFIX is already set, it strongly suggests
that the developer has selected the setting as best suited for one's own
workflow.

Use "?=" in the assignment to PYTHONPYCACHEPREFIX so that the path of
$(abspath $(BUILDDIR)/__pycache__) works only as a safeguard.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
Mauro,

I left other Makefiles commit 5c5c32d7abd9 ("scripts/kernel-doc.py:
don't create *.pyc files") has touched, as I'm not sure which path to
assign in them.

Additional Notes:

Python's default behavior, which is safe in cases where the source tree
is never shared heterogeneously, can be restored by defining it empty
by saying:

    export PYTHONPYCACHEPREFIX=

As the path in the env var can have white spaces, a quote pair is added
to make it a single token.

Thanks,
Akira
--
 Documentation/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 59e95ebae786..d30d66ddf1ad 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -82,9 +82,11 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
 # $5 reST source folder relative to $(src),
 #    e.g. "userspace-api/media" for the linux-tv book-set at ./Documentation/userspace-api/media
 
+PYTHONPYCACHEPREFIX ?= $(abspath $(BUILDDIR)/__pycache__)
+
 quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
       cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
-	PYTHONPYCACHEPREFIX=$(abspath $(BUILDDIR)/__pycache__) \
+	PYTHONPYCACHEPREFIX="$(PYTHONPYCACHEPREFIX)" \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(src)/$5/$(SPHINX_CONF)) \
 	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
 	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \

base-commit: c0fe189b590c754f69e0cb87c5b5674cad535cf6
-- 
2.43.0

