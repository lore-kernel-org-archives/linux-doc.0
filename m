Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492AC3E92B5
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173896; cv=none; b=r3HMFWrNSRCRjTp+YLCE5usHqoIaxRan+x1QqIpl6SB6hR4dknf+sZRRI5jHBaTOIazFswpT6rXL7ekSqTfwd9jF83Jj7SahC1pIfKGQXTbXKE4MTE8f7kku1zy/59mJANKfLfWQEekPj+Uhu6aNkUejMGm+Ao0+Pe1fe4ne7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173896; c=relaxed/simple;
	bh=0ritzErIaOpABamjKjWNtLluyjwBIb/S6nslk4thba0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fydsw65Vs1kQOPWvt7ETPw3KTUQjt1/ZmA53Se6Sc4pTtG5AVymEMNtQmG/F756xKMunS+X4/Vup/imEjIRQqaV3QcesadHJLEZ8lenFYMGOPLLUfUjfOba0ZXLtWbl+HZebRX6UmxsjuoEhIrACJ1mfW829HRNcbebbr0rLgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThgTmnWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE5L8rqt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThgTmnWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE5L8rqt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AEF5TT1863538
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUnRC5Z9iDEsUkeDXjt9L4ivaeLdDr4kj19gbc3Hy6I=; b=ThgTmnWOfvbZeQo1
	JmhSGY/XWUnWavEygPXUvRtSQuzM7eO68HBklkhFXiEJF/pLtdJLv9M+QvmNdpDB
	53Uf1epX1mwcmxWxQ1hUuD9kbeKWXsJMxUE5Owva3qpevqhT2s4DprTxmfaEsHRV
	AS8AUtpw1FcKodPRvcM23BVifHTzbJE2vlQdv2BO45BEGoN5lT9go52vFwF0Al1i
	jzr9rv/rVfs1Qli/kRemy5JL6zrh1CczgpDCntp48GdKc27UkzLmNceX7dJ1QTfu
	SmrbICVkKh5nF70f1D18IYFvLjwJBpM30gywzH6qahOL4lGsZ5J6XKCACmAucW8W
	cvRrgw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw81fpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae49080364so80589665ad.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173894; x=1773778694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUnRC5Z9iDEsUkeDXjt9L4ivaeLdDr4kj19gbc3Hy6I=;
        b=YE5L8rqtFEU6EzNvPcMhB0JYHDcnG58RTV0joEEWkpgrIRtsTK/vMV18v9uCD/7acU
         ulQdL8Q8cD7zPW/AvGu2DaxcU19mqCI/he6BSXmz6bcmzXmfh0qQxTqIQSV2TPtBryLH
         Am5MAF15OQW3GL1qvmsAAYgE0k1HXs1ymXwCJEtUojTVHGJXmu60cg32Sp/jT/5bXMcv
         5Sbn7f8x+/F+AQ2+8YBZBUknf5znxQaIj2r77ksq1OpDAxRsaUKLsWMki3fmnlPSeMGi
         +QxEjOhxjKhil1iCApzR+yfgElWvaRfN7Y42G08pguYY5P5i78q8rNLn+OAh+dlnQwgU
         m75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173894; x=1773778694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUnRC5Z9iDEsUkeDXjt9L4ivaeLdDr4kj19gbc3Hy6I=;
        b=jePpbqsUz5RJOD8OOJ9lbflzr/lz3L2VQhv5VUA4k1Q+maynKyAG0RLC72zsoHi26i
         7v4p7rk1y/mhA8rFieFstItH4zybm+gXKMHZu7Yyopu+dVcyKjza5rZzLXt0BjIOzLnh
         HHIomurvTrwXQMEhJipLlW5dHxo9B6LGw8KVGbXXJ81FyPbX507QFJWUL6Oe+coCwOC7
         iDTkODEgT03L0dryA67xWbfySMZdBEdLKSfNFNuHD5AIb5dvBmVAiFloa6fcVWnNr16R
         rFfVY2DFHiDkAUzMYG2sn/3brhhYRFEPAy/Ce7kdbv36CnzcLLIldO8cQZ9i/jFMFaWK
         LU4A==
X-Forwarded-Encrypted: i=1; AJvYcCXYe61BlDVfiE9ti9aPwjZZWYZevNtw66fr2fl48dgcDGnQLPc2NJ6OZTZnrKgW0pjEqittf9aFQ5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy1/+IrBi2Dd7LvJqrhDWUzv3V7ggetVw+ciFkqLOjAr89HXZw
	nkMDjmLmc2B766luwhoqTcsAMNDnSEWchEPiQR88GwaBNaIY9qlmy1Plw6aSbZ6ZA/SVnOg3kQh
	JVawX2K//1enmDMI83kETrPWNij4Fkgl45+1xo0xJidoi+YcMniHQRgbjQjKQWtk=
X-Gm-Gg: ATEYQzw4vNJqEO8bgkpRgJN6EljnLg6AftlfwDanHke2TjoDGqN+2fVhgcKm5zRqZgo
	0PEVSaQkB7QrTfRRB8IPYWWj2PNAyPwPcvavUKB/4corzmbXTg12pvDzUq9zW8p90izKr53bqNn
	O1OrhRaXJMXPw/G2fwBrTiSTRlZupMRENLXT7mld0HV9655bX9X8z2GMVC8ZykHbbEzz960EK+d
	BmQ5JlLC3ANFiQTbI8juudt4M2pND3tyQYuvmdJD3TFvG1WIQbJ/iXjaVo5WUiEPScSur5fspwG
	7JNFHzpw0vWEKEQXSCT9WFcmQjjMpThD6iZN0eZuMscp3NP+c9P0Z8n8t80Hl/oUsDLdGhM2Lze
	jAn2E/PC64OtM44U2l5xEPaWB1I5TGy1PI0oAqQ6B6x3SizmD
X-Received: by 2002:a05:6a00:420c:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-829f7078837mr151564b3a.49.1773173893792;
        Tue, 10 Mar 2026 13:18:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:420c:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-829f7078837mr151503b3a.49.1773173893211;
        Tue, 10 Mar 2026 13:18:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:52 +0530
Subject: [PATCH v2 08/25] mm/page_alloc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-8-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=951;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=WjWOTE5wCASvyqTEqQTC8D45Mnb3Je5ENWQae6LBsc8=;
 b=sCMEZiGoy1i3RaFgw2bPkErqvS8tQsW6y9j1/DY+TYT3BAmsnGCCvrBuUVNv5kpwQ0AKxsqsc
 0GXsjJqIPzVAxAfgDVGIQ0i5cxpLM7I3P0NkJ56C69IwXRBjC/8natt
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: yZgqIgyEUDcnE_0Rpe4l3OPfKIB9IK4c
X-Proofpoint-GUID: yZgqIgyEUDcnE_0Rpe4l3OPfKIB9IK4c
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b07c86 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TiJDLkziv7N9Y1Svq3wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXzKXjdiZcRaL5
 CcJEIfqZtQGWIPjWlIXLm7UWchIivsSHymIIuK36qxi/jCUm21wDnp+M7V9CGF4X5ChVFBQV1n0
 xJNuqHFJqhCWAOJCmEjxRcoWDDUUUK9fFn/Q/bynXYGF0gbecZDp3V+I+vdNGAkw+EhC2OfZINE
 Zjr67pCC0+uh/cMywAc4SY4//UwY78ao4EuzPzQv0XrDDB7/EthvVPCMElLBaYbril6VpcWASO6
 6v+dq9D5+bTgmZ/H6KW3qxjau+wcCbxZmKhsQH6cGLcs14TM5vcffRs8zWmoE4+FmHweREvKc/n
 mFnvpetUX7is9pOX6ahDgNHwdfY+Sh9CP2jMu6DUiAUM7N5gqGhIUyYnppyftOw9oJI/2Gz63Cn
 DSKNJ7CE07gZSgb6UakGKzfldFqFv6yWP7uGD99mAhyfDQMfJ2YKoteqquN7urzf99n86BpE3OD
 +SD6cfg92ujQEHfMtDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - node_states

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 75ee81445640..c28a84d11d49 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -54,6 +54,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/meminspect.h>
 #include <linux/mmzone_lock.h>
 #include <asm/div64.h>
 #include "internal.h"
@@ -199,6 +200,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+MEMINSPECT_SIMPLE_ENTRY(node_states);
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 

-- 
2.50.1

