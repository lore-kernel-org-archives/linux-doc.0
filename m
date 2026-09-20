Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FC530F92E
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888742; cv=none; b=cmrsU05BJicxQ9Le+3DSAUeHBxs8i3cWQvOrYTj0h9d0+XWelxBxCdtA/1mGX5pc9h+Gry5UpShmSTzWni1r+utJ5KSDDKpmQCUrJ9o91m49FPCVY1Rqg4bATdqwYAb6rgcmTRY0Te5x4cz9HHD6Fy5Amip+uiboYKIYAUsFgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888742; c=relaxed/simple;
	bh=QljQsLZgvTlldSo9Rcar9zMqwa1TqgtCUjw6CR+xk/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7UyO/6yeVlyFubzW25gusBz+kgJZaWmpBhYrpdOfUlYEL19bxPsCv56nBgjR+7vQ2Xz66eYJWVrbPlx21Y0BBdV2aVWoO4Vq+DdsQOJ+aqn2eSt1N/YPiwh7aSQoNWPaX9LdOR2i/IyhOdoIA6gfb8PFPq+UE6vqNaaFrYpoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hv6f59Nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMZlyZvY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hv6f59Nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMZlyZvY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54kQc2455542
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 07:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=; b=hv6f59NmZw3jCZxF
	7yeN1OYfWZz+4AZc46Bs+mwr7bAs0V3uJrUbKKwuQuzZpn5DLUsM5EaDuSGZnV0h
	D0qWLj73SFVEq0DNWnjXXVed0iDGmvnVIHGmJyG7RHmRTNp1lhzfNvIDqx4rDjCy
	oTbTPNBF2etK4FqaFwWzjmTDfimh8RoNQ6q1+7kPaThDhK0jMQsyBSnehXGp9YwN
	ZYMGpv9KaUIlhfYZJniiXEXzuif6nRKiC+gqTPNvOljKfSN0z7Z8fwJk/BcMrMr4
	TWsHgUHON6s3K9cQHXVKP/gB7Q2CM0HAoE8GpF0ITp20xFGXfL0+BQTA4XkYzaF7
	n4aXfg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsam73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 07:19:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso40097305ad.1
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 00:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888740; x=1790493540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=;
        b=gMZlyZvYo5XzdPOpdOzwCSLX+HwQuOUolicAqkjQzKFu7EF5pqcF+5bN8GMGbfIdw9
         BVSE/nYhObSshTGeT8lupPzIsjAoJKHRaZ40Bj6pQEbOn+9QV0yb7/gBz6nZGI8XAiVw
         NaDuf4Jn28Dk/hhr4kcfHRyXloHece6SGtiekVdE10gegUKZgGDswxlrZYCEMJpDJb1m
         LruO1Yw5BJ5tdAz/bz7D7S17y9c6XzxNYt7ZT6rf9/9wSsmxPdRKOPibzW05y2829RvQ
         16Ile/oOnwjGcf2NRRDW67rdEjE7xOl8uovRfFmSUUqm9QK6TZVzzXq5tIGYzlle8cRY
         /FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888740; x=1790493540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=;
        b=Uey4yFikvbvkxkPLKUJUad96KOPj7alPMXmYGshN3rV286KmRT6u6oV5tQhf7A21vC
         05U6gnI6UmVbfNprjguFua072F0/WJ8wMVstaPJfMMs5B/6jz1+7UxsEZLOf+YY5WRCm
         a9ZZacAd798bZBQLguNtqhGLMrKVSko323fLOa+NS5g9+86L6n3cOmUXieJ0yPoFhqAc
         eIf+0Uf1cOfM9AJMAHACfzyuIS3jNRyj628jJSdkJr/ooF1yU5g1BayU8hg7MOeivGQc
         ZhzJf6gCrMQM3Rl0JKbhbqo2VZA+1JpLwgy0gBBW62GH1OZvS7e0SUTYkANQ1tz3Knvv
         dIog==
X-Gm-Message-State: AFuF++lw0RW2kPKkmIfvomADo5V0oxusglPdNbtIUAOHjaPwcEhgsMEX
	o5P5E3SU1NdnEVXPV4ztVdgLYGnc5rTncl2IDtNYUzOQ9+GYqTPpUgwwS0V5Ew3bZybVegK3ec4
	5x7dqXPZTg2wxXhmjSlulTwQNkH2tReUGujFrBwnjRc/L4sN6eD9v6zpj6LFAlEY=
X-Gm-Gg: AYBFou3DhnzghORWczQtxW+1bmO5HYfNkWCAgCJe3aihLCaD49oEINxwf3YD5CLX0Mn
	MT+/7aIHY3dWzpVTHYEjFiILCkUhgB0Sum/mysr3JgkAfbswt8NhAfo8pRav8PVoiokEe2eb1Gw
	M/1BINbFx3+ThxJvaSjijxqtLl5dmei23bjCdJVg24uG3JITFlEg07spqaX7jMgh4YLoi9wJFvg
	FX6qw3+1mrBNvSA9XUHLqNdGRyGXxYEEe5huV2bBrH8oMyHcueWiXDGr3lScROPu5R3vDkHTn7R
	ooCMLhg2W97ZLBtBZGmY4mRLJm2lVH01OVXMhONBvWOk4LSoZSRugDjxq0s=
X-Received: by 2002:a17:902:d487:b0:2db:8019:847a with SMTP id d9443c01a7336-2ddb1adbe4bmr125951175ad.9.1789888739940;
        Sun, 20 Sep 2026 00:18:59 -0700 (PDT)
X-Received: by 2002:a17:902:d487:b0:2db:8019:847a with SMTP id d9443c01a7336-2ddb1adbe4bmr125950945ad.9.1789888739468;
        Sun, 20 Sep 2026 00:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:18:58 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:22 -0400
Subject: [PATCH v8 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-2-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=QljQsLZgvTlldSo9Rcar9zMqwa1TqgtCUjw6CR+xk/Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSfsnswMllI0v9+6LmXlWvmE6DXM+inXd0k0MCvNV
 /jhl8/aUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABPReMzIMOOz1DO9x7kN/NF2
 gf2asv43/SKsF1qfm316kYiek9acRkaGx9b/f31YXLve7MaGwClsGi0nNTa59s59tUhd6+7XTRH
 lPAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: _ik_tP_5uaFCtDX5pzfZy_wyq3s7_GRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX6An5kuxgjLT9
 qeg2rmc2r/oZ4fQFypZ9YcFcL5ALwN4nCaJs6I5wsQRy1t/DpdPuE0pYQFopla/xWXp19OLiB2Q
 Aq6onUHhmCps9ghaTGla2SXOA3TLHznZblf+Mi2zNbzVj6HOk2FeANaIWuxU0ONQHsuLhQeykIP
 smLxHefZYFqgXvB0BBDlpIR6RBnTlOFX/kMBOGUd5QL6NyIlaz1QUKSDsbARlwMIAaLu4mAenYw
 6nh8W7eog4aPdkBsvmSorn1Q/eTcOjvgM/uSVUWDbG98WdGfAgRYMyz2+pqGJacMIWgMcnuyBJ1
 pfBNcuK7DmIt6OFSYQ4cOeiLkZo1N4saGrUpR/dKwqPJ2d40Rrz0CvlDrrg8l3WYNLWH2ObPrWG
 fdysIXRDAIwmRwILs24wJKkmyl7ZZaXMv9kwXblksZlJKScyzxF7FKleeeyROy5sbloc4ifzED9
 99r9lnVpNgqzna+8YbQ==
X-Proofpoint-ORIG-GUID: _ik_tP_5uaFCtDX5pzfZy_wyq3s7_GRr
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaf88e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=JwNH_LCS6ezfG0-7a8gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXwTeCv1ORVrqD
 M7DfVRBcUnTgo9Sx6sPF4BzQmJtwdB04yk6hhZsNc3Kq/AnQI50xIOdsFXGjzL8i+fY1s5XSmKG
 u8BZMFS5Qps8tNKhR/HDP/cXSFnMEPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Match only nodes that use riscv,isa-extensions, so nodes carrying just
the deprecated riscv,isa string are not affected.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: Collected Acked-by from Conor Dooley.
v6: Only match nodes that have riscv,isa-extensions, fixing
    dt_binding_check errors on legacy riscv,isa-only nodes (fix
    suggested by Conor, breakage reported by Rob's bot).
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..d4cde2a7b8b2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1211,6 +1211,38 @@   - if:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

