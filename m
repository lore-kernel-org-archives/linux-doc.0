Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A613BBFBB
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488814; cv=none; b=tFu+hoC/P3BhkcBrfyYo0DB1Smv8RBzkNIwFl4pyKrAWh8VYWfj/oU+rVnb2FZU3kOL6rtSHtt2KImo9rJ4fYJ83tUdLFU8jP9cD/BIDD45JgW6nPeYMEUDOrg81ozilnKkMSi+IlZWlgsF6dqlhMrunvd8LLg4n909Xa8c4TRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488814; c=relaxed/simple;
	bh=/6h3tT/lVyKdJ7Awq4ViT6MVLM2gza4iwC931wR4Q9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPk2d80xmcxEQp2WEA2J3526t9NhWFBu0Vo66+7hBub/9M7bg3RipAx30qivq8VKKRe0cGfBs5KoLSY/0ewtlpkqMf6ZD7OFzfuuGgx9+OEEaO6A9nGTiuks+51b5em/dTMCP0Y4lm22+48luwjYiw9LFfh2tdeahDpV1317GGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIJ+OVUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOO5QBB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIJ+OVUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOO5QBB8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842E0r1572838
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 05:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tw0fKvrBBEA5FX4luROpIV1tavP8899q2m1fKdILPtY=; b=aIJ+OVUnjOReaFIJ
	gofT2IG7kN05yyO6OHhRtExveYz2PuaQ799uaLO3FtSZhmKD1Nyb+xCKZ91fRTJ1
	IbTs/p29TaH6QeAppdwHG7Aqa+hO3ouwWFp5ZhITk+HN0qiwvqug5C6D1B2HiCM0
	vlj/LtfuoT6CkzD4QwEzimGz4gLd3Z4qvHosvA8yh1R7OjUDtUu/pXC7iIgQWDXR
	LvunRPbvLIG5hyUJCIk+lCPWFfk6bZn8eSbzShWBfsTclu95eNt0VEAaWmZAgdL1
	HjObNtYklBRkRBI6WYeqm+QoZ6naZtcfmWLcKJfhJk76NFZhH7jNaqkVnArreON3
	ohhKrA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgshbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:33:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84770f89b99so569760b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488810; x=1784093610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw0fKvrBBEA5FX4luROpIV1tavP8899q2m1fKdILPtY=;
        b=dOO5QBB8L/2VxvPfb20T3obS7JCW5aZpYJXbaCrw9su1jSt8wW4b5a15c/gST/fAtn
         ch5mwIuXAGxgW4RzcuJeFY7gqjzdrU+FZz9CE3fDY8bCJraFnr+EcmDdeoRc37P86BmG
         9NqMqbcPY31+BOb5h3eRgEFze4zZuCGjClKkRj1WdsDni261UJdNOmPbhBWQMaey453f
         iEyRof8PC+wZlfmOmlcPvOZj1AC3S+xGbUjre2aiaSLY/engPuBnp7RmlmK4pKsBn6Lo
         gcZU/o3Jj3qWDpdd4X57D4+Oz2zjJuPJ2fC7noDegiW9mpiO1ymzC9blONK9aH0Qu6rP
         UEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488810; x=1784093610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tw0fKvrBBEA5FX4luROpIV1tavP8899q2m1fKdILPtY=;
        b=LqVhqAhGv1hCRXxVJr+r1UU0wIUrsmH+Ese8MRC7ar/9tFg1nmOWBzjvyI2RH/VmOD
         FoK19DZVUSvvxAKP9sUshhZG+nXbLCBcT0bqPm7jhqQKfmUUjS+TqdEwJ2bvFHa72vZF
         h3dytDlfiNQSLGAT+K+dd6hGU3q4/sC4+2hO00l6scMxjdHVWSbiNjTHe8+U3N8g3/gT
         FnDlWcHcP3VJ32HmACevBPmxNpLM9L8UXIaKwM4weW++eos6o6Q+4LBv5SwEjV/WA6qr
         ego9FbrYEXFooubzBybgwwfUo02XvI+wYBH9ECLVM6zOjFuY/mjNHAwACh/Um18Hkaba
         IdJQ==
X-Forwarded-Encrypted: i=1; AHgh+RottKS3Wy7rU+pDOhKw5h0wcLmWqE4X6be3DewAh7pV2+3Vgjedn4bcNfeznlknCrEZ1LUFwUZAAko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX2nFk02K97aZ5/UHZqQ7dzyRfxSgDEuLEP/StCnXIW0rFvK0H
	DQVGuGwzY0l2Qi/0ial7jgCL6qSZjOL/se5LpLRVGGweB+CuvfXIBZNjuIh7Z2hg1cC3vY/GXFE
	Oc9Ldh6c7snbx6wKuaBUDCh+68S/rZPiRKj/ZL5+jr21JZKoV1fFQio4veO4RHWM=
X-Gm-Gg: AfdE7ckgCAXtqAufHjgxBqAuhsLYD/AqM2U/0l4cB7dP2cBkBSv2jI/Bovlojjpf+un
	Dr6T99obCRYOttGjPgqk7BcBIck2T+bGG8ob/qx0vcnzYhBtO7pSWuB0bdfNMpCDAPLXVrCwh/1
	nB/FEcijWPqhStn+qrHStODtb9GVPNRVYcoiezzqWAltAPCMXSMN9WDnWZvkYTPRCNkF5eLCXWq
	z70w0vuKUpjOT+4qmYlCKxX46EaJky+QZSEIpx9QK9BO6+IEvdxzYeoJ8PnTB8/gQG6BDhV4/eg
	Tr11htgJFvcXn4+lAwPOiezV2hNLTC1y8Rfo1ulwRjJg4/v0sbhYwACCBWJEGF0MLEf4AILfZpJ
	XAy3C5upNQIo87B9ZkSe8OGBDX6nP+BSk2GDzLA==
X-Received: by 2002:a05:6a00:1992:b0:847:871a:94ca with SMTP id d2e1a72fcca58-84842fd4953mr1063866b3a.41.1783488810298;
        Tue, 07 Jul 2026 22:33:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1992:b0:847:871a:94ca with SMTP id d2e1a72fcca58-84842fd4953mr1063828b3a.41.1783488809721;
        Tue, 07 Jul 2026 22:33:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:44 +0530
Subject: [PATCH v3 05/26] genirq/irqdesc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-5-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=986;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=V0hkQm6fvvdwmLWbmnwABstbPfO8t7+liV20uf7x678=;
 b=B6bivnR7Bg4sl7bXAEOPvh5EHC7DFSJQHDd2jJMSLy/o2W0KYPGcZeOKz7zeQrcRQv7F9NTaX
 XpS7VFBMTebDkPpnbFKurlA2nLFIU7MLF0pBWpFuobcTjDgJMXosqKZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: bzAJ4_zCcp-Gg4U5ZTWwPOPw4ASBtPRO
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4de12b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=W0BCv_TwhUmk0ohr3HAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bzAJ4_zCcp-Gg4U5ZTWwPOPw4ASBtPRO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+FT0V9wzfBVt
 toKRBdLjD4nqdNrTRlePImy4P1iXzjquuuk1HUxMpNW7I1oyqsFRJo0YLRRS1E3htiWJzLBnBzj
 a2R4ayOOVVEbB/LfS7vDTOJlCYgyaFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX2gluxOtA0r/r
 VI5OU32+BOc8ZxiJKYfeecNzuM1aiRnP8IVENUSVEuIxHoJrBezZr+2YscAd/ThFOo3TrOEvqNY
 GcG4Agqi7fCTjrWW+Aq6krVhMTYyN6JImZGrOUCyCuBwl0cSsCZSjHtwXbVbAjmhrIeS2YOd0W4
 rZUB5gQpkOGNhreenFsUipjExWZoI+atkMPEdIYZzYMCV7Z5ENpm9e160OuX3LmuKn5alPwAKd1
 h489NywOrCRuhD/29VPvMMCpitca9SibbqYpzCVolBPJ/VFF+iZb9KCEAa2UcoEGmRJbxgxGj8W
 ggxrLzjtyYkbKMSLihiJLLQChdG1s3WlVXiJFIQXfi9jM9EJw4TGhtLB/+AOe9Vluk2lLa60hmB
 DVlQ6dmQCSjDfPkUSlnAj/52WlJyiMgrkqiA5dGcRbHw+5j8vzwd4lQkgMCfPyrBBBenMXgThiT
 t0Hggu29srwnRoiPqkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - total_nr_irqs

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 80ef4e27dcf4..4e58e7f5fc6c 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
 #include <linux/string_choices.h>
+#include <linux/meminspect.h>
 
 #include "internals.h"
 
@@ -142,6 +143,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 unsigned int total_nr_irqs __read_mostly = NR_IRQS;
+MEMINSPECT_SIMPLE_ENTRY(total_nr_irqs);
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.

-- 
2.53.0

