Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878F193402
	for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004344; cv=none; b=OeZhbVtLD/w9I8zR45ZVXle0N/r8rbMCFQzMuO8AjTgjo7Z1ipb1xtyuqwZwJAhzSLUAlA7yt/KIsCPTHr6jXWZ+AxPLwOIvoh/w5tSu3ejAloCXIP2qyZpWuOwRV+KXnpWAqcw64iCkr5j+mIVvIBKBbXGNOb2/tEe2VsPfJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004344; c=relaxed/simple;
	bh=nkr/PLl5Q0ZEQyx5U8g+dnvAT8DRsCwqiQxbaWUVua0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGZRVsjOOUexeB3CIqRXqDfq39vPtB11OJqLEzOH3LpaAaF88pyTlRGx6ksUoq702ydW2Ioy3w+MAU3ut8nfAESDOAO6kgxQ40u2+euJdc8GWVX8IC4s7ecbMHuD3GsI8zrc+f5uF1kBSLz3hOM7CERYPMi2jEQA26ljZQEPpng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NU05fhFT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NU05fhFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738004341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kwypsRR4V/FC6/+fxlt0fS6h6Fxn6ww5c5v9OMMFuhY=;
	b=NU05fhFTYcLo1wnx2jWc4GCFPyvsDvK66PswL796h9K92qnaBofdP5jSIVMOQTXbzVVBxo
	vKgcXPa28u55S/nzYmEvP5/j0PWMtL32/j+o6A38yblW2J9TbK8kgLpaVKAGM4maI8D3Y0
	MJ0HW4SCY0KjL77r/nF2fy6MTO61KRI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-fmDI7LdyN-eyCKK44AtPWg-1; Mon, 27 Jan 2025 13:58:59 -0500
X-MC-Unique: fmDI7LdyN-eyCKK44AtPWg-1
X-Mimecast-MFC-AGG-ID: fmDI7LdyN-eyCKK44AtPWg
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21650d4612eso129117795ad.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 10:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738004338; x=1738609138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwypsRR4V/FC6/+fxlt0fS6h6Fxn6ww5c5v9OMMFuhY=;
        b=u/3H/hBCgajt1r6NykDafDN9oORgAUQUU8DROq4d5ipCOWIKmOZmi4+Z8mWdzl8JD0
         DcFXSTbWAcCBMrLoElPQE4jaPYm7DgddBO2/WU4YIKbYvPh4iei5/PLD+g9GN4pZPAY4
         Y4J3+zdTL+vXoA2NfANaV3KtZMS9lzDU/qN/AfPNz8igypmSAyvOmgZxJZ/mydqkWpOe
         4/+/LUgpD0PsyCiuzZzQTh6JtXJ0MRE2xvXM2u0s3xTN3cJKaHodtnTDOH3NgbFMttF/
         SIcwX6zCUfoyahf4tg4Fqbra1qH/daKtqWRhieT7GCEXKi9OwTMTPTs/45liCFDr5LGZ
         CrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVshNPfMSmRwuy4/Z9fSBmj+o4XBLPuec1OjPMQcs/Gnh+c4fUq9FbgxQbyFQvSsv5PSonwK00DWMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD05T4helURbWzL/w+QZqfZ28e3f1YspjQzi+NJ+H2H7xMm2Ac
	Rxy6lQWp0kAEGRSg02JoMOh2Dv4AV36gA3kVIt5GyqYWzScE/XOTek40fKfRI3vFtFsrhfnh9T6
	NokVtqkd2br+Kjwk+TaexpYEeJpeUPPp7cz4YA57XG3zOJoOBerGghEVNTA==
X-Gm-Gg: ASbGnctbIXZOilPoFxci0Zx8PfVIdnfpn8AhJ6CUITCEeIBINR4Mk19uAwRNDe+mw6a
	e7uwpzlmK7y3rWS6NKgKWpoWBUOU5D4FIILnh6Awdr1Msp8zoP6c54BBpJJ7sw4GnlK0niZkH1X
	HzY+kaxMXOPCv2tsq/HU0f3x8ZdKhVwxcdQwYo7iy2osQWLu/khwVRGsGVIbXYHQPugmjb2XDJy
	aoGnsHqIoGo/S1wFVovqTa5hJKpZ4UaEyA2NsOiIggVU3Rd+7ufY8VD9hNQ32akx8PpBk4CgzFl
	OuWYnCWb6dpSgg==
X-Received: by 2002:a17:902:f54f:b0:21d:3bd7:afdd with SMTP id d9443c01a7336-21d3bd7b341mr440646025ad.0.1738004338075;
        Mon, 27 Jan 2025 10:58:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYWynuAQ6dVqX0QoE4kZ5Wh8F1Y8kn1WTSOnlhZZ47NDsPfhlAa1hcBk7x3k8Oxuy7IZ06ig==
X-Received: by 2002:a17:902:f54f:b0:21d:3bd7:afdd with SMTP id d9443c01a7336-21d3bd7b341mr440645215ad.0.1738004337234;
        Mon, 27 Jan 2025 10:58:57 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3081sm66658595ad.62.2025.01.27.10.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 10:58:56 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Helen Koike <helen.koike@collabora.com>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Leonardo Bras <leobras@redhat.com>,
	Shreeya Patel <shreeya.patel@collabora.com>
Cc: kernelci@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] gitlab-ci: Let project define runner using environment variables
Date: Mon, 27 Jan 2025 15:58:49 -0300
Message-ID: <20250127185849.34131-1-leobras@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently it's not possible to select which runner will handle a pipeline
without changing the codebase.

Add KCI_CI_TAGS environment variable, which can be used to select a runner
either from a commit message, or directly from Gitlab interface.
If not set in any way, the project will pick the default runner.

Also add Documentation for this variable.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 Documentation/ci/gitlab-ci/gitlab-ci.rst | 5 +++++
 tools/ci/gitlab-ci/gitlab-ci.yml         | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/ci/gitlab-ci/gitlab-ci.rst b/Documentation/ci/gitlab-ci/gitlab-ci.rst
index 940a800069238..ce89e4c093863 100644
--- a/Documentation/ci/gitlab-ci/gitlab-ci.rst
+++ b/Documentation/ci/gitlab-ci/gitlab-ci.rst
@@ -371,20 +371,25 @@ Description of Each Variable
 **KCI_CHECKPATCH_OPTIONS**
     Used in `checkpatch.pl "$KCI_CHECKPATCH_OPTIONS"` (see checkpatch
     documentation). It is commonly used with the --ignore flag to suppress
     specific warnings generated by checkpatch.pl. It can also be defined in the
     commit message, since it is evaluated in run time.
 
 **KCI_PATCH_SERIES_SIZE**
     Used to define the size of the patch series, see `job: checkpatch` section
     above. It is evaluated in run time, and can be set in the commit message.
 
+**KCI_CI_TAGS**
+    Used to help choose which runner will deal with the current pipeline.
+    Make sure to use a runner with at least 16GB of RAM, as this is required
+    to build & commit the base image.
+
 .. _triggering-pipelines-from-command-line:
 
 Triggering Pipelines from Command Line
 --------------------------------------
 
 Pipelines can be triggered from the command line with custom variables using the
 `GitLab CLI tool <https://docs.gitlab.com/ee/editor_extensions/gitlab_cli>`_.
 
 Example:
 
diff --git a/tools/ci/gitlab-ci/gitlab-ci.yml b/tools/ci/gitlab-ci/gitlab-ci.yml
index d2679d9929de1..f49105ee61be6 100644
--- a/tools/ci/gitlab-ci/gitlab-ci.yml
+++ b/tools/ci/gitlab-ci/gitlab-ci.yml
@@ -34,20 +34,22 @@ workflow:
 
 variables:
   SMATCH_DB_DIR: /smatch/smatch_data
   # exit code of bash script on `script` will be the exit code of the job
   FF_USE_NEW_BASH_EVAL_STRATEGY: "true"
   KCI_SCENARIO:
     description: Set to any non-empty value to disable scenarios
     value: ""
 
 default:
+  tags:
+    - $KCI_CI_TAGS
   artifacts:
     paths:
       - artifacts/
     when: always
 
 include:
   - remote: 'https://gitlab.freedesktop.org/freedesktop/ci-templates/-/raw/16bc29078de5e0a067ff84a1a199a3760d3b3811/templates/debian.yml'
 
   - tools/ci/gitlab-ci/container.yml
   - tools/ci/gitlab-ci/cache.yml
-- 
2.48.1

