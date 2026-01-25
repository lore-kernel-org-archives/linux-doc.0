Received: from outbound.qs.icloud.com (p-east3-cluster5-host2-snip4-2.eps.apple.com [57.103.86.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDD331813A
	for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 12:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.86.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769345104; cv=none; b=cSDy5y28g1dI0iC6MEmIErm3Y1pxqiufEbanBC8tDqbURSGpzalvt16+bwUmdXFXaIPamda4ccGHa2xVjIir6/ZT+1Lx7pfzkUkch7Y8HQ9Fys6vRRK2R1t2SHWv3HIzOBHf+ZPtBNmoHv1ys7Zk5m4V6/M/p87IKTl0lOv4Ir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769345104; c=relaxed/simple;
	bh=HKQcMQap0+1U0DIot+idUkxFX8P0mS9duZWVdWiqVVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgmi4LmdRHqrIIeYaPAAiYXUiBRpxvb19YBq18hXtOYfz+1ylp8GV3GLyZHZzd2Cxl8DgZGdZQNSzp6aXyGqRey9hL5DTHJSh7lZ7d9PcPLELFYJ6aCfYYEn5ao1T/jNYTB8xcrP2LQybI16bvzh9qLGLi5CuHB/xafKj0EkKk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=bLQjDJuh; arc=none smtp.client-ip=57.103.86.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="bLQjDJuh"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-2 (Postfix) with ESMTPS id 9D7431800344;
	Sun, 25 Jan 2026 12:44:59 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1769345101; x=1771937101; bh=OOrdWrqu5e7mJVtIxOujFcOimuHlCYN2cB/9N01k4Zo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=bLQjDJuhOzbIsCJvwdCRXd6e/7Z/yrdYlAXrg7kNj2erywEbz01EZQab8BEYujYsFerti4aiI20YImtsnXYOkCiYFfg+Qb/Ju/+2hAf5rE5fc3NsXBFrJJ6e/mv63cqUQvFxPGMfxfuYXZb5klfUqCIxYx42CVg02owPnC3+PnBnzND47AfDkhjnCmh1E+QsWu6z6Y/JLSZ3VVTaLaKGCj+fzbwFCS4+7Sl2WfxgWL2oLLWGXjvnZBAbxNcFf5JhVbperjI6oEvCgrujxQqU9RosLImoaxgE4aFK5FGbUJgxgF6GgiB2LH/OqFPH+Av2EzCY9OnB53i5X5NgJuAFiw==
Received: from dedsec-amd0.tail874668.ts.net (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-2 (Postfix) with ESMTPSA id 36B38180036A;
	Sun, 25 Jan 2026 12:44:56 +0000 (UTC)
From: Yulong Han <wheatfox17@icloud.com>
To: mchehab@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wheatfox <wheatfox17@icloud.com>
Subject: [PATCH] docs: automarkup.py: Skip common English words as C identifiers
Date: Sun, 25 Jan 2026 20:44:50 +0800
Message-ID: <20260125124450.2005006-1-wheatfox17@icloud.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=D/xK6/Rj c=1 sm=1 tr=0 ts=6976104b
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=vUbySO9Y5rIA:10 a=x7bEGLp0ZPQA:10
 a=wIqLKzeCRP0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=6DNX4KSEXEvrVo_5AQ0A:9 a=rA1zylPnuwYoWo2zmoT6:22 a=0pBa3l49qnM4LAj5lDSL:22
X-Proofpoint-GUID: siDDQemm3Nz-rB3-YHQPL8OX9LxJGFTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEwNSBTYWx0ZWRfXxJyIkr3eVYqE
 3g7Fg9avm90D+9PtNhs3yICQJLYaFZdxkhUAbjSEBcoho38Fld1weqc/8MrZkosGhkhzapHS8Yq
 RUlqVH5YKFC0E7CUI5Jpk1uo7AK9B31ncdUGBUXYd55/HomN9a0hEM6pjIQeaTFhC/fkIDtgMRV
 smga6Z3X8p3v7o7UwZT9MhJ5QPawm8duNMyFPX5ZLuhJ9q0w8EH86Fkd6NoL/Aqoo4RtUdvVM5u
 dBOPFwb3A/i3m1RjDcikw23OCm07jurgZUTU5YhH40or+BrTQfrqn1t5wYIzkGRUkwP9W2KtmqJ
 QOjDFpre6vygmxPD0b8
X-Proofpoint-ORIG-GUID: siDDQemm3Nz-rB3-YHQPL8OX9LxJGFTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2601250105
X-JNJ: AAAAAAABkGRYqEK7eLxvYFqlaGllwTnqucfGPq0dCxYWH7qCAunOoB/izDhRf43lS1/8qXfBayk8MQH1ekDeYYsEgbvekYEydgcFNeJOqlld5dDNmeb3R6zTrftUNloJ4keMME+aTJGR61nsu08GI7xMwE+1zEpjjTuUrJSvuWmDJze/ql5fTza7h2JTRZnLp/E9/sr8oi9m6VV1KMibQ0xwCeNSV/974mW12mxO9dJOshwWXuq/XbS4vCn//c7h1TOA0oDw8nHL2dFBebqK3u8tP1UMdK8eH4vpgs4iF6XXCUvQSpcdb8N8MsnWpMqHWCDPe6I4H9KqLS6Vo3RO76jorQEQnBuGGJdMca0RSq3Loc6g0VS4mzsDsbHpxVHHgYbCJ+jjYCUMm1NaEg8mCHsYh5IuBjWaDDrzX9FydUm1aDqeeL62hIedyKVmfyO2pfZSSm2XWQqJw/QgcB4aZHm+vKvUESwVvuGlov2LN1f/MjOQHSJQGVrzRxrJVSnRhepQUFO7Xnv/sdibXgO7mErBR7RmAhBqgD51kDemD9kgtWus+x4mepIbKxLwXR2c1fB4NzvlsOm61LtGugM62K/JMv0N/SqRMqHgBTCVXpcTC5y0VUyP2ruHmx0Jr9dAvpUXEeDpfa1TgXXPklOg8xbSII1PzbVBNPGIoT1tthR+ewyJFk7nj69l0lkKww==

From: wheatfox <wheatfox17@icloud.com>

The automarkup extension incorrectly recognizes common English words
as C identifiers when they follow struct/union/enum/typedef keywords,
causing normal text like "... (a simple) struct that" (in `workqueue.rst`)
to be rendered as code blocks.

This patch adds Skipidentifiers list to filter out these words.

Signed-off-by: Yulong Han <wheatfox17@icloud.com>
---
 Documentation/sphinx/automarkup.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 1d9dada40a74..c2227ab0a891 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -46,6 +46,12 @@ RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
 #
 Skipnames = [ 'for', 'if', 'register', 'sizeof', 'struct', 'unsigned' ]
 
+#
+# Common English words that should not be recognized as C identifiers
+# when following struct/union/enum/typedef keywords.
+# Example: "a simple struct that" in workqueue.rst should not be marked as code.
+#
+Skipidentifiers = [ 'that', 'which', 'where', 'whose' ]
 
 #
 # Many places in the docs refer to common system calls.  It is
@@ -163,6 +169,10 @@ def markup_c_ref(docname, app, match):
     if c_namespace:
         possible_targets.insert(0, c_namespace + "." + base_target)
 
+    # Skip common English words that match identifier pattern but are not C code.
+    if base_target in Skipidentifiers:
+        return target_text
+
     if base_target not in Skipnames:
         for target in possible_targets:
             if not (match.re == RE_function and target in Skipfuncs):
-- 
2.47.3

