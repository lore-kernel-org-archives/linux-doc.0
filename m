Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3A432143C
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725910; cv=none; b=o7LS6rabEEqfck7xdstepRxJfwsnzHuW8813A/rUz63vtiOla1UBblG0JUIIQqrCuqE5AXIa0lth5tqqiVLJiaiBg2XwPln3euEDPZBVCckGveDum5mb1AOim6Iw0oW1S02GMWVvN1jzOy+wtw/5WdrRBbxE6xoEMo/LqGG6isM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725910; c=relaxed/simple;
	bh=ytOgLBaFXH0MjHGi3HQFFq5SOoOzuPaSnXx/JqK3xmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a2PnoN/FlG5EvSdE8dlm0dlhJIHaIYnfoa8y25Mf6/Mnj+DCgeQAS/Um0C4tClh2FJDNW0hvNKKdqBnoy0+yoUarJGZ/WXegBZhjWMdQqutFE+o8INHXCU8jXzjkBJDNlrQXAyzD8/W1XBN9t8HNM9s1J5KpJXD16TH+53/md9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDkJji5N; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDkJji5N"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33ba5d8f3bfso6261188a91.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761725908; x=1762330708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BU/2ChziUWHxejZHVNmmLwHaGHaf0EEXiVZ1de6fJz8=;
        b=PDkJji5NpIy/iINL419GnAk+9+qYddfkAKyMuKwFe4mlyO6WGqcObFtOQ+Lptky7WR
         KJ1Wl2S7CV7RZyN7rjes5T1aweYJdAO3cVjnyE1eIOkSiJxpn0vYDb+9Aowm6Gdv9QCg
         NqipBCPtCxKEbyo8m9dUSyjA9lKk1B4e/OponYrV6bspekPHH4sAJl3T2EI1Y0xFxgUG
         XkgNhNQ3p5DvmFratLinp+c/jIfPeTtnog6V0XMo/IJ02fBZAWcgERwN6LMbe8S7mdWK
         psAfWnLveVVJaQR/Sqfq9Uw3UNAGesj6k0wht6v5yM/SLk6BbMr3MLsh/TK/vfviHkhX
         Hucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725908; x=1762330708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BU/2ChziUWHxejZHVNmmLwHaGHaf0EEXiVZ1de6fJz8=;
        b=Mz8RufD+izsdLB/S+xs4HhMNUEasACPtEKGTwKlQ9x2JhPyKgBHFRnqXPbrky4Z78X
         rT/dvnmp9E+QthCC0o9IpLWlGF502/1LIj/+XWcBzWQ3C4PTQInOaoHNe2tCQLlr401X
         mO9w2DdGTd2cPDtXk2aSwwmJO/yGmc3H4O1NqubE804glk/UkgDOyUQzx3xj2XGqai8f
         id5UAr2bGA94PZBeML229cG0Bc2+CV2ypSjbrwXzgpKJsEn3H3JsBDeqOyFA86MpAjEq
         S/qHtzb6yyqACJiYXq3cOb44eEPjh4c8VXb5Z9G+JAe1SpyK2EBKNwmWXvl9oN42LTI3
         zjjw==
X-Forwarded-Encrypted: i=1; AJvYcCXdVwao4zCpCtK+v5TPJzDTZghXmw9XszOQJABYNxY1FqOmqLrkrnAOJ/hcWEvwKRYKjUyMXAx8ObA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbfqXkNdAMbCLwn5zN72kqGYHBBZNxl0MskSi7iWkPwM/jvdcl
	I3dpqaExzI2HLSfXGsw1+k4lAxwb28R8tQHz18qRy2AoK04MD+eOZwsZ
X-Gm-Gg: ASbGncsYkxAmp4vP/BowBrA0pUHGHhFzRFhvrWhQpvEdZprCic2AC/agz4arJQVlI5e
	60QrGdjKUuS/psBL5cOMwEEz7d4giMoiMDnF6pS1zsErNs5K6Nk6PiAWBE18pYLjVOJO3ih9m7n
	D8ipEdtPn1URMKgecf21kmUbHVt736qD/g5ZkVdgawHpLvHEQ6/+KzHt0scQ+ZACkFHNcY/aFO8
	whloD6M0YAwr4Jwege2hHLK+am4tBFGWpdCe2tLTFm3QdgYjC+I40hNdU/1jxHspzoyKxq3ebvc
	yMY4wyOeco6640efN5V4iJ8a9VlXPnNNdx0FqH0XB01TQtHPYM+RHCgcLmD5Uzk8DGZ1D6H01/Y
	89ytWL2x4S0/l+eQ9C/OaaQJ50XEpidVIwQi6ca8TPF6q6VMtEYyd2qrgmYB9TZbhZE9QLpMt5g
	RlKYiimek=
X-Google-Smtp-Source: AGHT+IG0hKoAdUsMURHNX2F0gCSO4GHclR682zY7XisnLdYkrJ5vgKbkXR26X+9oYI+y2cVVLM86Wg==
X-Received: by 2002:a17:90b:514c:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-3403a26500bmr2931834a91.12.1761725907889;
        Wed, 29 Oct 2025 01:18:27 -0700 (PDT)
Received: from LilGuy ([2409:40c2:1057:4837:724a:2122:38a7:2755])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33fee84db04sm7905429a91.2.2025.10.29.01.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:18:27 -0700 (PDT)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-pm@vger.kernel.org (open list:CPU FREQUENCY SCALING FRAMEWORK),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] Documentation: pm: fix duplicate hyperlink target errors
Date: Wed, 29 Oct 2025 13:47:37 +0000
Message-ID: <20251029134737.42229-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix reST warnings in
Documentation/admin-guide/pm/intel_pstate.rst caused by missing explicit
hyperlink labels for section titles.

Before this change, the following errors were printed during
`make htmldocs`:

  Documentation/admin-guide/pm/intel_pstate.rst:401:
    ERROR: Indirect hyperlink target (id="id6") refers to target
    "passive mode", which is a duplicate, and cannot be used as a
    unique reference.
  Documentation/admin-guide/pm/intel_pstate.rst:517:
    ERROR: Indirect hyperlink target (id="id9") refers to target
    "active mode", which is a duplicate, and cannot be used as a
    unique reference.
  Documentation/admin-guide/pm/intel_pstate.rst:611:
    ERROR: Indirect hyperlink target (id="id15") refers to target
    "global attributes", which is a duplicate, and cannot be used as
    a unique reference.
  ERROR: Duplicate target name, cannot be used as a unique reference:
  "passive mode", "active mode", "global attributes".

These errors occurred because the sections "Active Mode",
"Active Mode With HWP", "Passive Mode", and "Global Attributes"
did not define explicit hyperlink labels. As a result, Sphinx
auto-generated duplicate anchors when the same titles appeared
multiple times within the document.

Because of this, the generated HTML documentation contained
broken references such as:

  `active mode <Active Mode_>`_
  `passive mode <Passive Mode_>`_
  `global attributes <Global Attributes_>`_

This patch adds explicit hyperlink labels for the affected sections,
ensuring all references are unique and correctly resolved.

After applying this patch, `make htmldocs` completes without
any warnings, and all hyperlinks in intel_pstate.html render properly.


Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 Documentation/admin-guide/pm/intel_pstate.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_pstate.rst b/Documentation/admin-guide/pm/intel_pstate.rst
index 26e702c7016e..9cdd9dad6516 100644
--- a/Documentation/admin-guide/pm/intel_pstate.rst
+++ b/Documentation/admin-guide/pm/intel_pstate.rst
@@ -62,6 +62,8 @@ a certain performance scaling algorithm.  Which of them will be in effect
 depends on what kernel command line options are used and on the capabilities of
 the processor.

+.. _Active Mode:
+
 Active Mode
 -----------

@@ -94,6 +96,8 @@ Which of the P-state selection algorithms is used by default depends on the
 Namely, if that option is set, the ``performance`` algorithm will be used by
 default, and the other one will be used by default if it is not set.

+.. _Active Mode With HWP:
+
 Active Mode With HWP
 ~~~~~~~~~~~~~~~~~~~~

@@ -192,6 +196,8 @@ This is the default P-state selection algorithm if the
 :c:macro:`CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE` kernel configuration option
 is not set.

+.. _Passive Mode:
+
 Passive Mode
 ------------

@@ -432,6 +438,8 @@ the ``energy_model`` directory in ``debugfs`` (typlically mounted on
 User Space Interface in ``sysfs``
 =================================

+.. _Global Attributes:
+
 Global Attributes
 -----------------


base-commit: f30d294530d939fa4b77d61bc60f25c4284841fa
--
2.51.1

