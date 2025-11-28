Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29128264617
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343133; cv=none; b=FAimFvEZ3xzfmwQgTFRhDD2KIL/tFb6F45DT/LEO5kRQyO2L3GmWaK/AjaBn2pIBE3OCS/ksu3rabiKv642lSodhwoJ3n3pqbzNIbEkHEkcEdFOv3PWtT0UaWntLijDIU0WmA9ApeDjm+FcVtLD+PR+BBCjd/3TNjPIAb4vLZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343133; c=relaxed/simple;
	bh=77vkR0+1JCLSlChPUV7mfgMnrTVHDOFl297gadUE40c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DAN5fe28mnEyWrD8ZqnkuQ+AB15/eIp7PkwZgRZXuNyOGIegDE6iNRLHiHZNOJejvXV77iihD3sDS0e+G/kDgcYMw/TaYT6b7ppGnRCwX7eslAxe3nh6s4/0tUHzXW3EJAwFMq/lv/EOG4B9xCO4mVT8HZFJnsPztWMH0REGHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vld9HZWN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vld9HZWN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2984dfae043so17572465ad.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 07:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764343128; x=1764947928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qB15gwXBroqkrK/PKr7oQFDmRDy1z34ETO6NhfgHsEw=;
        b=Vld9HZWN/LIZDhgmPy0nKU4VeEWN8ZwtgJdDuy8HY1Vrq4GVkz0mxBMkewz0OYgg4U
         p7BhFhq+/a+EubimiWPsMx6osbX5V0iRJ9dHFLy+4ibOVTlH2HVd1ksLSHoY8QJsnrSn
         Qwoiu8j7jtUP3SmSjnVqvB20+Q1t5xW+7qRBSpEwOLRoOQhQaMDeLdHNipVKqQenqE0G
         yW8rWAUCu4KaO25oiCaEDxYm35+QC8SelfzRLyuJHbu+r57yBA9XnTjOHX9g5JKwSwvT
         67hOEQQgVnkCBeP/Q0BHFJaFlQlBmOQ2gKhZsiXAVpsz+npuerkwuIKUN3jMbTNZw3np
         /zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764343128; x=1764947928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB15gwXBroqkrK/PKr7oQFDmRDy1z34ETO6NhfgHsEw=;
        b=GWo/ssJlBsid+pxmiOIyK7UYDPglMHLo0aPJ1qw8JzW74QAKoZQo7/CxLCTOA4BwYt
         HQJ/mDRprkt2czs5P2V3o2M0igHf1bMgHTlwVeCG+WBIm0eSgQCx1yzvtycYrEHp3Gn1
         MbImYNrcr9b9B3jZCPMFuTNnKG8Oq+yftJLIqKs4xrp2ZPE+blx/6j7KFoKxIS4pjtJz
         AjiCdq5iL9eVYt7GzVUPi8Dhzja8/rkvgj+/OjT98Vhj8CxcZuI46z5CN0fD0dwYpjHK
         3NUjJu7igHE7Th0/cvASlYJmpkcuZ7DhgwccZLvrkQgHF5s9d+FB1DcynjPPDHbPtazY
         dmzw==
X-Forwarded-Encrypted: i=1; AJvYcCVjMuM9uXyePb7DFoGsqvkVUyUIlUSR2Ufb9udvylWVED5RIq/yjGjuywl/v43ERPyq/q0mmPI8Jn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyjR1QuVFMnBGrE/FxbJlYS8Q+8sJVXiaAoXQyv9KYoE6qj0Pr
	PK7geOy2g0Qa+Mf1gSA6/qyLd+ki+bQiwhnAIweMFyc92ZGp9ofGvS0=
X-Gm-Gg: ASbGncsUN1zoKl5LVTsK6w9aHf8cwOujifJ9L3x/RBoV6Y3yzEPSGIVog3ifABccjVS
	Fkt47d3iy0SoUMaa6FrC5feAFgk3RlsxR9MOlLA9bSHuSsJuo4T03x1IuUw/h83qhtgUwyVkcGP
	EPJWznp/YS+QuR+sBdv7VTcgeqzWkemcH9sQQFPtBJ3VYaB8Pp/JzVSIqTDhOhyP5s2Ds2atw/V
	WsgXNCssn7ymp5tzQfDUW2AUf0ZqadT0RZpVunR7jtuOKFrURK20xzyaYujr3SYbSO6s5p0BYJh
	Y4YqehRMLKocTEQhIWtAhQShG19/7qHCs9un7AI6eNaUn6YJGpZm1+W0ogJYQAqhjErP3nCurad
	973157LQvk6ACI5dA3OEzpD8qWmw0WIhtGm1pYhAbNDXbycRTsdSHrS3aMzRUInEtUk5taLf3r8
	zkluuuzYzH5hk8EPQS4RTtP7GPCkKrJT20MXV9JKPhRzz6ZQ==
X-Google-Smtp-Source: AGHT+IFMZPGeYzAXlC4s7H1GRQcgTEvVdLdV7GOhi3U/+54OuO5WVgJO+4Ca80HXmsdLRnU/cszaIQ==
X-Received: by 2002:a17:902:ebc1:b0:26a:ac66:ef3f with SMTP id d9443c01a7336-29b6c3c2857mr249858005ad.8.1764343127369;
        Fri, 28 Nov 2025 07:18:47 -0800 (PST)
Received: from samee-VMware-Virtual-Platform.. ([2409:40c0:1f:b21d:eb16:b830:6608:73b4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb2490bcsm5064944a12.2.2025.11.28.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:18:46 -0800 (PST)
From: Sameeksha Sankpal <sameekshasankpal@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>
Subject: [PATCH] Documentation: tools/rtla: remove undefined substitutions in common_options.rst
Date: Fri, 28 Nov 2025 20:48:38 +0530
Message-ID: <20251128151838.7985-1-sameekshasankpal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTLA common options documentation uses several Sphinx substitution
placeholders (|threshold|, |tool|, |thresharg|, |tracer|, |actionsperf|)
that are not defined anywhere in the tree. This causes the htmldocs
build to fail with multiple "Undefined substitution" errors.

Replace these undefined substitutions with plain text or generic
placeholders (<tool>, <threshold-option>, <tracer>) to ensure the
documentation builds cleanly while preserving the intended meaning of
the examples.

Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
---
 Documentation/tools/rtla/common_options.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/tools/rtla/common_options.rst b/Documentation/tools/rtla/common_options.rst
index 77ef35d3f831..bd5a6f32f5bf 100644
--- a/Documentation/tools/rtla/common_options.rst
+++ b/Documentation/tools/rtla/common_options.rst
@@ -56,7 +56,7 @@
 **--on-threshold** *action*
 
         Defines an action to be executed when tracing is stopped on a latency threshold
-        specified by |threshold|.
+        specified by the threshold value.
 
         Multiple --on-threshold actions may be specified, and they will be executed in
         the order they are provided. If any action fails, subsequent actions in the list
@@ -85,17 +85,17 @@
 
         Example:
 
-        $ rtla |tool| |thresharg| 20 --on-threshold trace
-        --on-threshold shell,command="grep ipi_send |tracer|\_trace.txt"
+        $ rtla <tool> <threshold-option> 20 --on-threshold trace
+        --on-threshold shell,command="grep ipi_send <tracer>\_trace.txt"
         --on-threshold signal,num=2,pid=parent
 
-        This will save a trace with the default filename "|tracer|\_trace.txt", print its
+        This will save a trace with the default filename "<tracer>\_trace.txt", print its
         lines that contain the text "ipi_send" on standard output, and send signal 2
         (SIGINT) to the parent process.
 
         Performance Considerations:
 
-        |actionsperf|
+        Note: Executing actions during tracing may introduce additional performance overhead depending on system load, system configuration, and the number of actions triggered.
 
 **--on-end** *action*
 
@@ -110,7 +110,7 @@
 
         Example:
 
-        $ rtla |tool| -d 5s --on-end trace
+        $ rtla <tool> -d 5s --on-end trace
 
         This runs rtla with the default options, and saves trace output at the end.
 
-- 
2.43.0

