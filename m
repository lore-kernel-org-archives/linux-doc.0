Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCA1DDA24
	for <linux-doc@vger.kernel.org>; Fri,  5 Sep 2025 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757083588; cv=none; b=VkblcVGGoBVicE5zRJd1wczmy7lNDfotNRaIjKKp1d/aOrcSmcZ1LixvHcllD3OgROU9CkVdbLYb7eOiFZV8omYmm+wGAn5aglIk59kiEK7bM7DHefrDBCdI5jvXfpDbyY0Am5S8QeK7RUo4UNE7Imx6I0VM/1lIQQpMA73qIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757083588; c=relaxed/simple;
	bh=AgRo8YqvxAxOhvshNgnNaKRsuTOmFpck6GxaIqn5nhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dadV3I4jmz1YxA8lq0qAG/wpfAWqdoqJqnGOigqFiKG9oCo8uQnuPy2fw0KdYe+aykaCUnwdJ+yJbMoN98s8KbUcOjx81pP9T4hGOv+MBaj5elKn8J3p1tBRLh/CBQYclNms0XpTMsoi+ETnP22gCi/gM7/CfVkby6de7br9pbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ab3OErKV; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ab3OErKV"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585EOtNv009811;
	Fri, 5 Sep 2025 14:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=icTl512yL6fIFI+Qs34fbjwebqBmne9DKWyV+xf/3AI=; b=
	ab3OErKVqi+g9bAzO0G9BzsqeOOGw45fYyt1sPjcvlrIeyYaWcS0nk02aDT4Ovuy
	QQtiZ3HDkzjAIjgfsOwWC+6v/82QW/r/eHo4J4qJpOrz5MaD9gNrmvutVv6o0r71
	BIOoV0ypn/lEKjw3tCzKd1ygFk1UtwLOBkAiXsQMVWJd7qUNbfUSoW1sI5cofHQH
	vDebIZv8pMykHdgUR3k8elHcPBarI+BQwKpZ2JsKzih2f2hMWdqHkNbCSPsX5hfs
	2R1lEIzSqsG127KMi/iYsLP6IlJdEGEfcbJSt5Hv8H71daZ9A4buGk9Iqv8s91UU
	GAfGGlOEXrl6kbG1VdYTxQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4900gf8642-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 14:46:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 585DmQI7026181;
	Fri, 5 Sep 2025 14:46:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrd3vpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 14:46:21 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 585EkKZa022015;
	Fri, 5 Sep 2025 14:46:21 GMT
Received: from localhost.localdomain (dhcp-10-154-122-46.vpn.oracle.com [10.154.122.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrd3vm5-2;
	Fri, 05 Sep 2025 14:46:21 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH v2 1/3] docs: add tools/docs/gen-renames.py
Date: Fri,  5 Sep 2025 16:46:06 +0200
Message-Id: <20250905144608.577449-2-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905144608.577449-1-vegard.nossum@oracle.com>
References: <20250905144608.577449-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509050145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDEyOSBTYWx0ZWRfXxNNiUb2AaDTy
 sK42RKzjyQIOoIoPzhN5DdrnPSahpT6YHWhW3QvkUAea+3heqqNAF9zY0zqO50CuBxQdGXgJo8M
 TDYoWloO7grdh1fcV7hhlRWbx6XeyvzDcISoWHhx8AaN90XHOgylM23PmSMbvJNOZffL8PV9BZh
 KsVXvVFbvRQYggXuL5b/+NE7vZWqMut/mXxv2MRpfduSskNBELe3L2B39DEO8Qni+t4Z6dYvgc/
 wS6zJb92PJchFlrZdlP6iEaPxh9dWOq6m3fegzEej0WTgvmTxMbKheYPZzD8HIVdGFY19dT9mU4
 5la0H+RTQItpYj2MqsZ8K3MEZXRfM5RnRgpKBrJ9pUWyb8BWpF3jjifalQVz05X0j/GSaMUMFo3
 YRPqO0DVrv4Z2ejQFThiGB6dFSjSOg==
X-Proofpoint-GUID: Xz1kYi9OYdFPCS102tgy3093tRh2mRJt
X-Authority-Analysis: v=2.4 cv=GKEIEvNK c=1 sm=1 tr=0 ts=68baf7be b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=IuO9HAJ8MybilolMRbwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602
X-Proofpoint-ORIG-GUID: Xz1kYi9OYdFPCS102tgy3093tRh2mRJt

Add a new script that wraps git to trawl the repository history for
renames of .rst files in the Documentation/ directory.

Example usage:

  tools/docs/gen-renames.py --rev v6.17-rc3 > Documentation/.renames.txt

The output format is simply:

  <old path> SPACE <new path> NEWLINE

where neither <old path> nor <new path> contain the Documentation/
prefix or the .rst suffix. The file is sorted alphabetically.

We can suggest rerunning the script for future renames (and squash the
resulting change) or rerun it periodically to keep the file up to date.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 tools/docs/gen-renames.py | 130 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100755 tools/docs/gen-renames.py

diff --git a/tools/docs/gen-renames.py b/tools/docs/gen-renames.py
new file mode 100755
index 0000000000000..8cb3b2157d83b
--- /dev/null
+++ b/tools/docs/gen-renames.py
@@ -0,0 +1,130 @@
+#! /usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright © 2025, Oracle and/or its affiliates.
+# Author: Vegard Nossum <vegard.nossum@oracle.com>
+
+"""Trawl repository history for renames of Documentation/**.rst files.
+
+Example:
+
+    tools/docs/gen-renames.py --rev HEAD > Documentation/.renames.txt
+"""
+
+import argparse
+import itertools
+import os
+import subprocess
+import sys
+
+parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
+parser.add_argument('--rev', default='HEAD', help='generate renames up to this revision')
+
+args = parser.parse_args()
+
+def normalize(path):
+    prefix = 'Documentation/'
+    suffix = '.rst'
+
+    assert path.startswith(prefix)
+    assert path.endswith(suffix)
+
+    return path[len(prefix):-len(suffix)]
+
+class Name(object):
+    def __init__(self, name):
+        self.names = [name]
+
+    def rename(self, new_name):
+        self.names.append(new_name)
+
+names = {
+}
+
+for line in subprocess.check_output([
+    'git', 'log',
+    '--reverse',
+    '--oneline',
+    '--find-renames',
+    '--diff-filter=RD',
+    '--name-status',
+    '--format=commit %H',
+    # ~v4.8-ish is when Sphinx/.rst was added in the first place
+    f'v4.8..{args.rev}',
+    '--',
+    'Documentation/'
+], text=True).splitlines():
+    # rename
+    if line.startswith('R'):
+        _, old, new = line[1:].split('\t', 2)
+
+        if old.endswith('.rst') and new.endswith('.rst'):
+            old = normalize(old)
+            new = normalize(new)
+
+            name = names.get(old)
+            if name is None:
+                name = Name(old)
+            else:
+                del names[old]
+
+            name.rename(new)
+            names[new] = name
+
+        continue
+
+    # delete
+    if line.startswith('D'):
+        _, old = line.split('\t', 1)
+
+        if old.endswith('.rst'):
+            old = normalize(old)
+
+            # TODO: we could save added/modified files as well and propose
+            # them as alternatives
+            name = names.get(old)
+            if name is None:
+                pass
+            else:
+                del names[old]
+
+        continue
+
+#
+# Get the set of current files so we can sanity check that we aren't
+# redirecting any of those
+#
+
+current_files = set()
+for line in subprocess.check_output([
+    'git', 'ls-tree',
+    '-r',
+    '--name-only',
+    args.rev,
+    'Documentation/',
+], text=True).splitlines():
+    if line.endswith('.rst'):
+        current_files.add(normalize(line))
+
+#
+# Format/group/output result
+#
+
+result = []
+for _, v in names.items():
+    old_names = v.names[:-1]
+    new_name = v.names[-1]
+
+    for old_name in old_names:
+        if old_name == new_name:
+            # A file was renamed to its new name twice; don't redirect that
+            continue
+
+        if old_name in current_files:
+            # A file was recreated with a former name; don't redirect those
+            continue
+
+        result.append((old_name, new_name))
+
+for old_name, new_name in sorted(result):
+    print(f"{old_name} {new_name}")
-- 
2.34.1

