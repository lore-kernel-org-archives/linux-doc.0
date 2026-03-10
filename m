Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29DC3E92AD
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173852; cv=none; b=VLo3+76PPTDY6WwJTRsIJgicAgkxgm6qKnTHdghKjzychm0X9ju3lP/RPpmjU9oi+72AOjr3oJidMoQV6AhtZ4vUbUBVvKPKIpxHaI2RntZoPIC+6KvYBWJRpc6M6skZ2o4ZqQwxcxBwh4q1HJipotjBebNz+Yh06MKAfTTcjsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173852; c=relaxed/simple;
	bh=/g8HEiXUYfa3Zq5UeMQE3tUVgKrL8ys+bUgFTnVC3x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ftq8HRmQ+zIAXco3zzTdejQOEXBx9X2GGFUSaEsbH7jnRWCBeiYMYWHwfLk1KIM5EMnJOMEYRUQO+kvMxR8oAvLORukz0KhOybk2fYSe1IaOKiCv2KKfnMoC+PECYhl718vkrB14kgWvuYZztnPVjS6r/c8aXeuwykf/va/aTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=by4B4Kk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hU3TKpNN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="by4B4Kk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hU3TKpNN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHD6FW1573310
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/p5bQNtsurS8ELLM8cfGcTYhFbVSlQNGcc/PqunPdEc=; b=by4B4Kk5+VrKoSdS
	6QyqTOk4zerpxFHN9awWxqzVBp5b3Mbr9Z2OSzscqVAx95NlEcLuGCeFrp5wkCor
	c4u8y1+2cddOZHOuCwlb4trlfPIlcBqsiLktXdRhu26uZ7LrcFQWmSSE1xgkztHZ
	bRkzfwzAfTXWaFbv9/xATSrCiv2I3Wfn36Loaj3XoBEioFfD/2E6fsm63URDyl2y
	nkIFioEFaNvJKMYKFzFHpmIGQL7IU1jCt2ZIcL9zpLf2QlAYZrKj0XqOF75lafAU
	dJwLzxk2YiqgzWwu7Pg7sSwVEv2cgU23b9noj6vPEkTuFMFs2LXYtiNLQ7ovBjj+
	SjLD4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk8nms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:17:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8297d261a67so2415330b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173849; x=1773778649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p5bQNtsurS8ELLM8cfGcTYhFbVSlQNGcc/PqunPdEc=;
        b=hU3TKpNNJ001yX2DiFyaTw4dzs1LcUKPlbeShEYB1mM/k3aw1BYqXUkWlJDuIcV7Cu
         8cJguLTa/cMI/Os8l+uQxW8WGd+UdAETzDAj3nfVKUlA/ppjx0zZgcBQzoLcPVVTV2Gf
         aBAEarGR9wObJInuokzQ5S7B7hr0kOeHGwJpzgBayMv61hM1hB/CDZ+xT9RQk3wtpowC
         HIkjVSgQobgItO2BOWYXRTVOIw+0S9Oy1y8Ii5GLbJyq/rjDivc6hfnpuIHLYwMcUKEc
         a/dS8v18OEzvKaO89H1NhqD9jM/wRuwQ8P2dMn+o1WY+xwh+gLKjA1Wad96PT1ehfCna
         41KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173849; x=1773778649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/p5bQNtsurS8ELLM8cfGcTYhFbVSlQNGcc/PqunPdEc=;
        b=xO59XNEmHfC7x0wRjevS68FYVmWgdIRt2wMftq9IBWttOXfCbNwJHVzEzCKLEzTbWo
         n85FtRq5AXNqeQu/UTaNFPfJhQE7zSaDdcqBaa3VPNDsmp9uQ7uj5/zAamGFaN+uAOfR
         3oxJBW2dShf+jqbeIpKWX+FZ48TSDXhrPjV9lm3r2SSggsYSU+NBDf4UyUasM2HO5kOY
         /zwObecLKfVlxzOKoyS2xyaRK9KMwHBdjqjZG3kG8zrrFkZ+0Uwt7snRjiTUrKCz9M1n
         TOk/x6JGzmWaHw912wkw30S7+7QlQbvPLGhiuJPxu0ZzPHewwtPedxQ1bjxN4dykuowO
         WMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWICKM+78dVKfyB3hM4kS+ztzbQ/qQM16ZRJzH1oBElz19ZRlHDGZfxXC5FDHnvlLTyaebCE7aX9Mw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz92FP3Ai3V4wOcqNzT6sKbh5htIRERie1dTfUrBOHCljSeuJ+F
	hGH74/xNdWRdwBfQmMjgkjZZKcG5CEhCLDRhNTq+nLqziXOZkaQ6GnIVC08QqtsQXhu6W5TdFin
	0dknc4v2kcGimtSi+S3Cfu2N8Jd9y8pWMONKdJVjwxJOhxN5ufHDEVVvmZtYj0mY=
X-Gm-Gg: ATEYQzwb5LkcyRfJLPlrKUbDIANazfLxNegvzmwXo8wZ9Ju4HfSX5GW+QXot1pDluGE
	2qCQ7E+l0Exnml0WOIZNYFPosAHQFqqHUeyQcB+ibTjQ2S0Rfwzoh9BYHCMWgfMkV0SZ1uXStXj
	d76RdOPez97cPWwTJMr1Mr0S6ZJ8ZLagIYE+qC8CO2c8i/ZQ8yfV3LEJefgHabzvSfZklgomeIs
	a8JuUjQTpF2PMT/HfK4ipaxIDOrv0x0zFPbmjnA2ORG5OD48E6fFsrKU828f+jwEvQ6rtS6+Rxf
	U+i0d2ex7ZSJVxxIhwZSJoK/HzVkWsJ9k89Wb2QE+fV+dwjs5tyaIhqFNO/ExQwFtErKwjQiOrP
	TQ7klW6zMFf/Yu3H00hn/bsOC74Rx45zgMg6Gh+/54UnE1maf
X-Received: by 2002:a05:6a00:180f:b0:829:7e6d:cf12 with SMTP id d2e1a72fcca58-829f6ea54e6mr176846b3a.18.1773173848449;
        Tue, 10 Mar 2026 13:17:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:180f:b0:829:7e6d:cf12 with SMTP id d2e1a72fcca58-829f6ea54e6mr176795b3a.18.1773173847792;
        Tue, 10 Mar 2026 13:17:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:17:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:49 +0530
Subject: [PATCH v2 05/25] genirq/irqdesc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-5-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=961;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=UXg1t0l9m5ubA1qVNL7kczvqoaB7NuMSr+jbvqU0OqA=;
 b=tpLi1SDrgekMvdM7bSodVPbvBq2jkmRJ9w+7dr9fMPSvTOVcpu589oNcA+Ssz2qd7S8Bd4rG9
 EZ0hqpigrLFAIbWc52tOHGSzhTc9cgRgeA1CcE72coJ1nJxp+QVKA/P
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 2SsS21EWugspEfnDleJQuG8HF31ae9SF
X-Proofpoint-ORIG-GUID: 2SsS21EWugspEfnDleJQuG8HF31ae9SF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX1U8yZVQ4kUiU
 rwH4/X41jPnYCNa4FIu2E9FTL1dBvIi3Ubzg3HdGWT2ULZmOcBn99n/ndqk6ocp70JBvJgE8e8q
 kBLaG4OAiqteJTAlgDSqRhUuXY6jbAyWNZxpVhOnoQBv0/6A3HIMYICCg1GG+B3+PkLAFvoafHE
 WF97pZlOLlRprOrqy7MiueVoIqjfKocpgKzAnjcaJzyJx8lLFjJWmLlqI3zI8SDNatsuHFPpHaY
 Rb/UOJ+dBdFw7Ss/YKZo5tgU2JHlSrgsS/Od8/x4NgUVq9LaTDyWJWQL7XNoFeN/MoztHFy1ZfC
 pXqP0kc++go0ITQbJ5XBN5PyST2p9Ak01WVWgv/wQy4ArWUHcbYRstbwIZCQZu+M05K1GSGpB4r
 W+LSm2iJVwxWwV94h7jxnqCotl4eZHH2x38KWTxi5Bo4zEvz3BdmOGpNPkT/7kAvSN7u5QiTS4n
 YHeGQFqaGJdRuBpwsLA==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b07c59 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=W0BCv_TwhUmk0ohr3HAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - nr_irqs

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 7173b8b634f2..44ef0ebcc3ce 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
 #include <linux/string_choices.h>
+#include <linux/meminspect.h>
 
 #include "internals.h"
 
@@ -141,6 +142,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 static unsigned int nr_irqs = NR_IRQS;
+MEMINSPECT_SIMPLE_ENTRY(nr_irqs);
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.

-- 
2.50.1

