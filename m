Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77642D12E3
	for <linux-doc@vger.kernel.org>; Thu,  4 Sep 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756979937; cv=none; b=gs7x/RLoxECbBN0f9n4nyUy2ppkEg8w3EHBUM2JMLRjGXdk7VGl+XRlHfqgcoUGNb2uFRsvrAveRZ9dtt9fEQVVvmHBYcx4vRlIzGH94jk3/kDWYj2ob7yALw5xQcSCjQZJezJV1gzj4aG/1BZK84kM3jhK1uDftqQ/HyuGPRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756979937; c=relaxed/simple;
	bh=dTjylt6FNuHvCptXeKETOZzHy8yDQ5Bd0hZn/zc7uNw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Vt52Q7/r6q7PKHfSdQ1QWPeKIkTr/dsMQs9i4tGEP0Itj+jRl4jUqQbUCdsq+nAuXip1utoHxFXrgM0OlApegYT1Ab269FL1VUInoE83SGYn9z6463aDRMfWHw7swOKoHzxco8PcNoJzVyGaWxpHc5I+v93REqdsNB/bKxEUUPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UN1w2Z1k; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UN1w2Z1k"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849smEJ002980;
	Thu, 4 Sep 2025 09:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=QGTM+9wG07CepGBq
	rnnxxNl8gW41nFU/xgAMKwVz1GQ=; b=UN1w2Z1kYVyJXjMRfNnE8XziFMgnj6yJ
	BhmRgfwka6rjGLUg8Pg/d1ZgT3t5cSs2ZmrlhtjiDHdTrqrLixi6CQggtBa7Vf7M
	PmvzS0mrNxIJv5cE8ltThINl6G4imWqvYtplPiryzy1E2WhMEmosVHNNLa+NfqPX
	81uzhoTzkZg8/47LE3djlLEs+S6csBPjvOYNagltp+Z3HoPVmDsYagM5yBWLWXuw
	QcCN8oEvoTFpNFz0KD+x9r9ejq07Lc/3TmPTWr8kh34zHZh0Bv/MNf/99OfJ7KPB
	8i7yumagN21OhI81XPCUQMXdBY2JzorC8Tuh10SQM5/NMmn98aHEpg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48y8j3005v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 09:58:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5848bI5f036303;
	Thu, 4 Sep 2025 09:45:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrbbyba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 09:45:35 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5849jYZm033188;
	Thu, 4 Sep 2025 09:45:34 GMT
Received: from localhost.localdomain (dhcp-10-154-122-161.vpn.oracle.com [10.154.122.161])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 48uqrbbyar-1;
	Thu, 04 Sep 2025 09:45:34 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH RFC 1/3] docs: add scripts/documentation-gen-renames.py
Date: Thu,  4 Sep 2025 11:45:18 +0200
Message-Id: <20250904094520.451070-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
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
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509040096
X-Proofpoint-GUID: --jfkZpl5KASxjLGtYhSatkE3pE1-8u4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDA5OCBTYWx0ZWRfX5gn00bFWFwq5
 ROSkmwVGoOEpXTU3vVp7QM52wbo6tSezrnlUzoaIBa/IN4XT/9JY8xWl/n07NapvHwjo4atIG9q
 NF2lCaBv6Gdj+dWKz55joiZDCg/VU6ZNc0ngR2pbqrYsBW/pCiSBbaYBIUCzrmRIhjcvVgSWDx0
 TQ+fNygJMrm4PjviUMN9h5crVVi55wqleq8CXr3zLCbfUHefTJ6mcrKqly8mZ4QjGA9oh2lB/zb
 Wre8LoHHkknKqnpm6orBes7YiloquWkOmlaYKvOfPLmw/jAXvhYHnbJOSTvYlbiKx2ZAWY9nAp3
 olOkRpg190luMNDGc+sRs+mgLfdUuzYkspmbEHSsL23Oxp5gs5fyrr+z44uHA3uLrhBf1EkgkQY
 QMalKgYL
X-Proofpoint-ORIG-GUID: --jfkZpl5KASxjLGtYhSatkE3pE1-8u4
X-Authority-Analysis: v=2.4 cv=JfC8rVKV c=1 sm=1 tr=0 ts=68b962dc b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=pI-514bexkF2qXON-WYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Add a new script that wraps git to trawl the repository history for
renames of .rst files in the Documentation/ directory.

Example usage:

  scripts/documentation-gen-renames.py --rev v6.17-rc3 > Documentation/.renames.txt

The output format is simply:

  <old path> SPACE <new path> NEWLINE

where neither <old path> nor <new path> contain the Documentation/
prefix or the .rst suffix. The file is sorted alphabetically.

We can suggest rerunning the script for future renames (and squash the
resulting change) or rerun it periodically to keep the file up to date.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/documentation-gen-renames.py | 122 +++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100755 scripts/documentation-gen-renames.py

diff --git a/scripts/documentation-gen-renames.py b/scripts/documentation-gen-renames.py
new file mode 100755
index 0000000000000..daabd2366c53c
--- /dev/null
+++ b/scripts/documentation-gen-renames.py
@@ -0,0 +1,122 @@
+#! /usr/bin/env python3
+#
+# Copyright © 2025, Oracle and/or its affiliates.
+# Author: Vegard Nossum <vegard.nossum@oracle.com>
+
+import argparse
+import itertools
+import os
+import subprocess
+import sys
+
+parser = argparse.ArgumentParser()
+parser.add_argument('--rev', default='HEAD')
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

