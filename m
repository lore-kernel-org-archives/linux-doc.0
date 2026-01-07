Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9312A2EAB64
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788538; cv=none; b=BJMDss92sz3XfEKK5vxBbxKP7aLeCXBcVG6C1QrcIwd5Yn+xe/WSOl5hiIWBhCokMTvnqc+67T6rLrZa/H/gM26huBHHSYJxkUHJSVJcGQE4Cg9xXmbUaBXNgdTJR//q9e3sa37SSqd9pgpN4pxjnYzGfyzbdvnyiAqF6GfIJag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788538; c=relaxed/simple;
	bh=Q4ZqUeHdxj8w0kNEPzoysqUJgGoxPgA1XB5F+ofXapY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYuYUJzbUTDfUg812Fsby/SOjIDl2dcV+r4KrmRMW645jptKHjCXMjXb6uAkT1diRtVxuat23Nx3Z4cr5alnT50yE5WJCZ3MbINOWhc+7thA6lDuqtKdTzEFykjNwoLIqdbTcIIbwhrjdN6+otQlaJ27bgi4PCBrrlm2XvI4j3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3+G9jnD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3+G9jnD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2e77f519so1272524f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 04:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767788535; x=1768393335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2Lat8SdX+02TbmLDhXK9YgQomayPj4Tjy+cMyjwyFk=;
        b=e3+G9jnD6SyE+1ipEAjcougs9hqzvu9iQZ90we/e61pbNkHiwJuKugTViHBbEDuDOW
         22obTnkjGzPHpWibpWHI5cWoihazSkJx7nF93Fc8xwzQZ7NlEVR7ht88XC1KVphfTgpP
         R0HmbRgavlAHVOE3TKfbwgRzuPemeVbY9SikcRViLIRecgJXa1Ke5LhxPnSOqbjRzyMv
         97BD36v+Qirqi21vhQSkEYMMVd6ohyEIP6CXr6g+/Cl1iC9J1eqBLxLi+7YE82HrNQCq
         zTpakHWDBgYt1x7fW4tDoccF6fxGvKfZS89ka855GoDCRAtshEY8q5e5w84Kz3TQgAQ+
         pjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767788535; x=1768393335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+2Lat8SdX+02TbmLDhXK9YgQomayPj4Tjy+cMyjwyFk=;
        b=Ket7QQOovV4q4BK2FdMFlNsm62mZUi2jX7VnyviUkC9jGdzEHqha7hGVOTyCnfYHFq
         kGocmbHD3ONfXWQBmSaw3lItu72vmaPzhWgyxP60WMi4O104lRJVQQ4d8BNoChqx35JM
         CWqU/D9vmcJazqmnTYxNl/GEFsU/gj3HKS8qSzbhwkX3LNY1tVPpuIAHodhz8PKB9V6y
         ystjst3lvm6Yl0B1ZfyNZzEsiYNa4BEudZxIhAaU0oMQMXiyjs1A13CIG6wmV+MYt9Ej
         ECs5s39M7FmCEKeC5R5DejwEnwKhiSBWAYZEsRcP87+rK65z9DdDkYhispDYJc4Gtya6
         tK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1bGWHEqM4MAADY/vNlh3Ax5rI7KEjbX3ckuSlCJHSx1Ba0PaLiiHeJIKqrLDm7nc/kGgxd/YsyL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9r2jTbwN8mISnCdjLOL8bPQ5TXXeh89rImWbAy/TsBTVpP32
	WVt548tZr4hFFONaYzuj8OGbQgyObwMtp5q2HeBnGN8IFbfbsMmGNYD9
X-Gm-Gg: AY/fxX6v8sm0Gczd2zXYoOiel+heAqvv2ZAEQ6T+1cW2wulRRuoJXYGdichOD8Ubkfj
	szu79EWNTv3ZNxDZNkGakbWIZgDgvUuPWlKnsPzK0AF1SuUsotG6FWZSyDh2e785rpCpdWDyNFr
	Nq1zvhN6H9ujYuhVsDuSS3BbK3wLxtMX1ez1yvVtq9EBAlXz3LJLYg10pKLEXelDvwDVPhYhT3a
	dZlgOR1Sa95TeM3/1Ol8jZLzUBp+Op2hKB9ixECWxCpoQeIyMyzbaDpKqgaL4S/Ak7yNfJK5OvQ
	Z8/gs4MB0/Lh91hZZCuhOdQMJK3TEF+Si7shAnG3nav5Kt/+83wSRNFOoPK4iQEE9TzBBJETiN1
	rDN8l8RBxJBuFCgweD7bd/UgYsRac6tZEe1cDyRbvKNhWH1FTkJ7TmortlRwpqGH9nrhPz6zDXr
	zKhnl2BTvkOD9ZID4z0KQh5lumEgr5
X-Google-Smtp-Source: AGHT+IEAEEOMloGtBWAWlq//SXxp8JdbjV1Xe8Xns3g8sq+4RlTi3G3ATBwUL+bMJLZKOmriMZD/VQ==
X-Received: by 2002:a5d:584c:0:b0:42f:9f4d:a4b2 with SMTP id ffacd0b85a97d-432c3775a07mr2858945f8f.19.1767788534546;
        Wed, 07 Jan 2026 04:22:14 -0800 (PST)
Received: from imac.lan ([2a02:8010:60a0:0:bc70:fb0c:12b6:3a41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm10417107f8f.11.2026.01.07.04.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:22:14 -0800 (PST)
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
Subject: [PATCH net-next v1 10/13] tools: ynl-gen-c: suppress unhelpful pylint messages
Date: Wed,  7 Jan 2026 12:21:40 +0000
Message-ID: <20260107122143.93810-11-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107122143.93810-1-donald.hunter@gmail.com>
References: <20260107122143.93810-1-donald.hunter@gmail.com>
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

