Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDAF2D9796
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888858; cv=none; b=MEP3iD4rF7RbHnRkVYHncx9zjRy04f7rYAMXy2H0Uj3JTRT9KImPhYtu99Af2pKjUOSR57OXA1Ro89idGKOcxIs3y/Yml797iLHrvHuP3JLfJBz0vGPcoTQySk3P6XJLe6DxjYFQIom8X8OyeMu96sbbjHD0xWQFzJZW0GGnf2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888858; c=relaxed/simple;
	bh=Q4ZqUeHdxj8w0kNEPzoysqUJgGoxPgA1XB5F+ofXapY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WoIY8k/9cmt2FSuBX/Ba6lEVUjUrTtE63dBrkCSsnLvtuueAhxQ/mOjz2llCDunxUj+TnQep7pCQ4NmIveJ+GsuKUiYnrMUVhJ37QsO5Q4HpDMKkX2DyZzZnV9lulTiGMw7ht0qDAZvPVE7nea3h8n/uiL6s8FhZyqhEkESuvUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJV2aMoc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJV2aMoc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432777da980so1845200f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767888854; x=1768493654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2Lat8SdX+02TbmLDhXK9YgQomayPj4Tjy+cMyjwyFk=;
        b=YJV2aMocaEDevN6qUL/PWkBKxC/1o+WtCN8nPokdfoZnARAwXgLf0nHnkLtBCcDpDN
         reUdBHUCmhlZSFyXLsO7ZNkAOujARnaLkH71Po+hQIkGhN+J6At07hqzDUwpIKCe4hIq
         qvLIow33xGnmgJSSv/07Qux/d3sYo5WLokQUiXBBoq8rwz3BS6lYQzW5nl2TsKT29oIL
         min2AJUvaleehWRJtMoAt4jsKNNf8s8lkZEdLR982rzYuU3YIGL2XNH+EPRuFWWSsmPg
         1awFYW6qEmmrB+uPQWqIrMbJVn3TsAbKT6dPyq13KanvpJmEdAmruquKF0iXQYD64D+U
         3VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888854; x=1768493654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+2Lat8SdX+02TbmLDhXK9YgQomayPj4Tjy+cMyjwyFk=;
        b=NiNpU+ZOrvfIZz3vusNP0jASeFMfaiytwupUWb8vuhaEfZo1f5IdA1fN/P1olGxmSk
         9H0xCNroHBKLtNexVUJjRx5n3USw+C4neQis0m/hZG5nwgiL2sJtb0/KO+/zpH2U7m4G
         oT06l0oq1meVsb9eY3CYnEVjWykzr+VgRA4PJWCccss0a7tYAiuv+h3v/YD/jbNSSnmY
         Ay2FogUNof65+pXPUj6iiA4eqgDDI7WyGokiOV2tO7QYZcDsdSWnFLj79EXScwivhv25
         HoxXvDt4FDzQnRsFmvMXjm2Aq2pbjLx9GRRkKJrqYgKmuQhZB+8ttjmlAik58ph31DI3
         kQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0n1e30VTET+Vw9Yir8ms7asOmD3mciMy88oW5nnSYEI70Albq5S8VpKBd60sIO2n6Tqk1I7LYnsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAle7UPV5M3W8U8B/FJZzZzfrjjY7ElAa7rp4lbR8NnqNqGCQ
	EriKzY87syXdWeRMx8p8W2iwXOfxLCdAunJjMAh0VCsxTqX+cMaJPEBl
X-Gm-Gg: AY/fxX5H40kPeY1u5fYEa3ukBsaGik1i9ya2xNjjmITZK4OdtEtc8n9j/0rCB5y2yfa
	bHhoFRvmuRf2l2M4mcp6lAnpScsI7o+POP4TUnTxKUIQ2YB81PVewWsI7x1WKJ444HvMax0uDg5
	uJcX18CLGDPCKFq7+qCLuAkY0/nZ/oDDw5rBJVfJvpgtKyUuyamuhGAhC45/erUIuypbSMSErKy
	oxMrvnYZB0TcI0pSWkMJw/hew5FvvPH/tzXBMT5/xHcUzkcxV6o3UKbujlECnaJREIJKjLTUsAw
	Ygrbw7n5SWg+YGfw5FMAnHQBqRHhhb5Yu6UJXnbN37l55zdzIKF0G3KPDajA5PN7b8D1YooElL/
	YTxM2FE1itrM0YrYsMkfBC72+/arxGHMNtWDcoYU3AjRapSmFQiRuhVTIcPOMw/nFTPt566lO/T
	bEwAHmmguAL7wvEDjSh4bu1UslOOBL6LRCjo0S2NI=
X-Google-Smtp-Source: AGHT+IG1vgvpzx0rhxyfmBwtGJ+0oxYBD/K8EASvXCLfiOLuS6bmIi+Y2CjqHx/QQTzroKTX0qFSeQ==
X-Received: by 2002:a5d:5288:0:b0:432:c37c:d83b with SMTP id ffacd0b85a97d-432c37cd9bcmr7538529f8f.20.1767888853988;
        Thu, 08 Jan 2026 08:14:13 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:8115:84ef:f979:bd53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm17140039f8f.29.2026.01.08.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:14:13 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	Gal Pressman <gal@nvidia.com>,
	Jan Stancek <jstancek@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ruben Wauters <rubenru09@aol.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 10/13] tools: ynl-gen-c: suppress unhelpful pylint messages
Date: Thu,  8 Jan 2026 16:13:36 +0000
Message-ID: <20260108161339.29166-11-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108161339.29166-1-donald.hunter@gmail.com>
References: <20260108161339.29166-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable pylint messages for too-many-*, too-few-*, docstrings,
broad-exception-* and messages for specific code that won't get changed.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index b517d0c605ad..14d16024fe11 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -1,5 +1,11 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+#
+# pylint: disable=line-too-long, missing-class-docstring, missing-function-docstring
+# pylint: disable=too-many-positional-arguments, too-many-arguments, too-many-statements
+# pylint: disable=too-many-branches, too-many-locals, too-many-instance-attributes
+# pylint: disable=too-many-nested-blocks, too-many-lines, too-few-public-methods
+# pylint: disable=broad-exception-raised, broad-exception-caught, protected-access
 
 import argparse
 import filecmp
@@ -11,6 +17,7 @@ import sys
 import tempfile
 import yaml
 
+# pylint: disable=no-name-in-module,wrong-import-position
 sys.path.append(pathlib.Path(__file__).resolve().parent.as_posix())
 from lib import SpecFamily, SpecAttrSet, SpecAttr, SpecOperation, SpecEnumSet, SpecEnumEntry
 from lib import SpecSubMessage
@@ -183,6 +190,7 @@ class Type(SpecAttr):
         for line in lines:
             ri.cw.p(line)
 
+    # pylint: disable=assignment-from-none
     def arg_member(self, ri):
         member = self._complex_member_type(ri)
         if member:
@@ -280,6 +288,7 @@ class Type(SpecAttr):
 
         code = []
         presence = ''
+        # pylint: disable=consider-using-enumerate
         for i in range(0, len(ref)):
             presence = f"{var}->{'.'.join(ref[:i] + [''])}_present.{ref[i]}"
             # Every layer below last is a nest, so we know it uses bit presence
@@ -414,6 +423,7 @@ class TypeScalar(Type):
         if low < -32768 or high > 32767:
             self.checks['full-range'] = True
 
+    # pylint: disable=too-many-return-statements
     def _attr_policy(self, policy):
         if 'flags-mask' in self.checks or self.is_bitfield:
             if self.is_bitfield:
@@ -1650,6 +1660,7 @@ class CodeWriter:
         if out_file is None:
             self._out = os.sys.stdout
         else:
+            # pylint: disable=consider-using-with
             self._out = tempfile.NamedTemporaryFile('w+')
             self._out_file = out_file
 
-- 
2.52.0

