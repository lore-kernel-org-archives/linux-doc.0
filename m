Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26F3E9597
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174034; cv=none; b=HSD6vCCec0DpKJwJWHFI7fyQtKpVAThSZPSWkgMo020fiu0XKApyxduAXWVf6VWhjKE8mt6yWgxYwX7q9s8nf2vUEIWeLUjGN0xzsXkyxH+1lF4SdI1BhXjsW0/Dm7H6EHMl7yPcMCkzWUEZu8NyjSr/5qoRQxXvqebjbw62jzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174034; c=relaxed/simple;
	bh=GJsyRX5M78HpXD5ZIPg64tgahV7EZgChDo8/tB3hlfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fv9Sc+WB/Z2AAwQ6ytjV6+A70BNZ7zNmJPcgE4ucZJLO0FdrK7f2FHoAsmgDu++MajZbxZJqdFnnvujvrQNrj+6yTI5z72NHhQ8C85AZsehijMF9RNZ0/7hnnmVSe5WX5SHSEdvNNHPVmPWOXAfvEnuYBkk8RKiXcJACluJk4pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNqSVUAR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqWI8Ig3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNqSVUAR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqWI8Ig3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGH0a6508387
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwPwm9egcX+1gvanmp7QoXzEqEd1Picj/3vW/4UCWRY=; b=bNqSVUAReEBebBrT
	ofohgRxPzbWGJJ38g5iWUzHtnSkL/fjdSQlZ0gdSMlAFXkNkOP4rEQmBrnov7snm
	HbeI38MRtkXkee+aCtlogRvfLkSMIR/qWkWlRtD9sFhEMOtYNytkfbSFOFzMfu+H
	We25PIxl2QFD57enTLWaatpPBvYhic/xuHsemTbMvEUO2G2erVOPG8l2ceamOU6E
	/FgY0+QEaDXlCGBSKoIxprW3BLsxJjuly+/xmQvEwgP3fnHLoVwiugxuExFXjhdY
	vKjH9P2s85pdWK0yn16vc2VtDZR5SmuC+uW+yDzEEAMMmgnLoDpKcDkb8EuWnJFa
	F67aIg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppagx23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso9836687a12.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174031; x=1773778831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwPwm9egcX+1gvanmp7QoXzEqEd1Picj/3vW/4UCWRY=;
        b=iqWI8Ig3+YJHd7YFvjuvp0kwnxI4qE4zE8QJFQJTP71tFVXaTIwk1V9FG0sbm17yWh
         p+qC65M2i3be7ZHbHdzgGaSzaROwTO005qHvGb+g5Onoe6Ngivw6KjzjrxxblbS2FMEl
         p/QpW7x7H3iknYpMkKux7sJ/0l53nbFhA6bmeHlAo339EvQSKZKDsZhstOU8KwabZwk8
         BnVE9W0WUB3LU5AHHHb6OtGmsDRNuM/Lr+Mqh5V/nuyEFl5THZ0quqzxUCqWco7x9WlC
         R+Lfm/WkZlL0VNAUR9QmqZ/gQCQmxZsoTzLr9tFZimrikyDBma2meMXWx1MvkXfC5pB/
         gwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174031; x=1773778831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwPwm9egcX+1gvanmp7QoXzEqEd1Picj/3vW/4UCWRY=;
        b=J3S99S4+G4jSCWziPTbKyuskgCTJx6p8hl0i/nHUUNphb7IQN+qDjkDNB8X+bdsUXI
         QcHcHLa06jSwFUrqJ1kSR+lG6Lp/jLadXx99w4qxk3SZ8skjly4H7q3fPNe/9JXIeIfm
         KgytGTA+BGCqyorCDfLPBuirlWmj0yWDHq20qJfvXtyIGe9M6msY57LkLPS8ChzU+EhJ
         HQLmUB56p5ukDOKjLbcJgGi9KaWEDtwpknJMZxybTNmdx6W+iArIx7yeg7Ogi+PSbSlG
         krxaiaW1Wc1MVqNCT2LJEZdC+Y4cqrbO8SHzOpoXTHWHqpknWcz6I/AWMSj5iQRbVjd3
         b/4A==
X-Forwarded-Encrypted: i=1; AJvYcCXbzZZo1tTr3aYPIH43fd8OfndC8joCn8t5bugcbxSG1vHeLZYbfgt2hLBg6IJpE+902UI5UsFvhQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyglFOmaAzjmUFhsLst27feTNcFvFOswpx5GzCDnYALfsqVa3DV
	ZfcjQy0RBMpxdkzkdk1dqmflQJxz+UJyetlHhmQiBK1AozyKYbjt5UwwmkVP++cvbdktPNBI1IZ
	6qtMf0q+JSUQsTvqfDrlKUvGFf87WLV3LqIO6MZ/HUXZaJlMOBg9NUj2McAM3ndw=
X-Gm-Gg: ATEYQzxTf35OP4t9c/ntnT4tTNySzGAE6/STYodbgd71+pnR46NwGhHCNR2i7xWn2lA
	/w1KTVbKH9tT6RxjTQRiV5ZcX4yp27prOZVeaTJmkVMhpEjIiAz6XssgoKBYnfqSfp+5OJwn+cd
	0B00OADsKwPo1sIs7n6InGdt23sSdaprBALZpw8PVa2wpAYfz8D6lfpM4Y+Pe/TEp/NtFuOlt8s
	k2nT7420nRsxRTQhAM+o9gNNH7kMlhpYyFsR2A0mI4CHNFj2ww9+dZOlytFY7dNRDpb3rTO6TCB
	OQyKsJEI1VxwY52T8RpI0deS+6dDV6/oObNY59uTpYMurwxPDhM8PObLceIcO+pk5nIIMZc3Zks
	cFYzH5XE923wNMyMhhUnE0wDtOkMVMd3PUj+1NSubhVbiNXFh
X-Received: by 2002:a05:6a00:1c85:b0:826:b70a:7350 with SMTP id d2e1a72fcca58-829f7240393mr123134b3a.52.1773174030034;
        Tue, 10 Mar 2026 13:20:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c85:b0:826:b70a:7350 with SMTP id d2e1a72fcca58-829f7240393mr123063b3a.52.1773174029418;
        Tue, 10 Mar 2026 13:20:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:01 +0530
Subject: [PATCH v2 17/25] sched/core: Annotate runqueues into meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-17-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1089;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZO7/bDryoGYv40z36iJsb1xhTIu6V9V40nzuQaYTMw4=;
 b=97ph7aGBo5DOsMrEvMbA9BDZtVSKSQVZcudPly6Z6cNUsdakmi1m/CNdYna9ssoZjW5hq3wnH
 06UefCLXjwxBLjVEa/zKZewRQLiHGj6hw5oxhvMiehOvkGLtM23NX1E
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: NGooa1-ht7UGC_VUp1Txu6jdb99Kwnuv
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b07d0f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WIgWxXLGzmshCHNC7soA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX+07b/9RYw6Ue
 oDM49d4pCNZ1yD7b3RGQj3qvZ4Wk+Knj2PhTSGYO7NNJ2jQF+vlvDh9jodbWjg2Lmy/UUlYB8UN
 HzsdVsrKNIHinKFiAOMCq1BG7ykX0+Nv/2Rt10ZsRJSeIN1Qsjg9yU0smvmOeP8eBPlzdQ17Zvr
 18zC+vvvrk0RccbTNYSIlgZUZctEVxt6H3KRphWhP2l/JavDCCKxUkShAFK5dgY94U9yP7TerHC
 RSbv3gBAzRjNhWetk+VGBarVId/SJgZRhQABgDnCVwOc5UD32VIVZwsakcvnk08Hd2tjFzdR6j3
 xkNcZnrvgBd43Du2IpH46OTdIo+IHsJ4fzXPWnUSlxM0kxPO+AHSLR6QVNYBXf7eb/Q2a/91mPd
 iFEbw+rZphtTrijXhol9AeMlUSVTwUATO65me2Ls/jcc8b1WzRd7hfLpG1nZBPfIyF61MjUgd8N
 7v1/lKt+iLdSViQDuMg==
X-Proofpoint-ORIG-GUID: NGooa1-ht7UGC_VUp1Txu6jdb99Kwnuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate runqueues into meminspect. Even if these are static, they are
defined percpu, and a later init call will instantiate them for each
cpu. Hence, we cannot annotate them in the usual way, but rather have to
call meminspect API at init time.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 82afa387d529..09a532a5e9f7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -69,6 +69,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -8804,6 +8805,7 @@ void __init sched_init(void)
 		rq->core_cookie = 0UL;
 #endif
 		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
+		meminspect_lock_register_va(rq, sizeof(*rq));
 	}
 
 	set_load_weight(&init_task, false);

-- 
2.50.1

