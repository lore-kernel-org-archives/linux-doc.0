Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8A03563F6
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173988; cv=none; b=t8gSybhwjy8GBOYWjqMm8ZUyNO3ldDVYDznc67fwO1+2aDTPDYF+vryruXwIjz2bF72+sCY8OHsDSpOtlrHjV5OVXJ3v/WTAGeG5A06IF4v/KJdBY3ojdc/DG2NZfVwosMYXHSJOhWAVKp01NUIW652GNyBZN7vXfxa+dQzj64M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173988; c=relaxed/simple;
	bh=wlqT0KjWJK0l8lqum7wtMlCC8k5TDcN2j/YxGJ8VYZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsJqWagE5gCoLcsbeFlEhdukVQTNnrxh2H2Y+0Yqx5DJLMy4VT0Ka2ir6TXYwf2KwDmlqbCVuLiNs117EWfWcr7ROLfoKhri6Rw8nDeExdE56w5Nxex32ZEiCGS/mVvKSWMpssl+YUEUzFm7LYUsLiNC0EmxwcVyl6wrdIOzI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjRDOs4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+TFtFQR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjRDOs4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+TFtFQR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJ2ZbO3297898
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwpDp7aMAgBSG+xcal97Cd6xKHw+4XmuCvZKGe6Z0+E=; b=DjRDOs4LgNnogppS
	pbEtzYSW/aSQ1bjfJwg3k2S39P0xRyV7xKiR+7tMMqNmVhvTUY+UQft64oSHwc0m
	O0wKRltcKUkeV5nyagGJrw7iUhjkQ+KaQGhmsAFJu8Ns8VKMirOXkYe9TL/kbNKn
	1EtKdUpA3QAi5bLLilcf6G/V4kHSC3+YBVcuex7nOWge88/ZR8rzGtzNSpfHfm4/
	/PperC8fre5EIXn8E9lbFebGMkC3Jj5XtWMVk5RDFZAHzj1PEvi51Vq/eVnzlBTQ
	nnCRCPJW8Vto+Q9/ZeP8V4rOHGT0Udq57XA8N60ZS4vIorBICL6riLYCBqLcC9Uz
	ax41ZQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mtpe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:19:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82990cfa91aso2091259b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173985; x=1773778785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwpDp7aMAgBSG+xcal97Cd6xKHw+4XmuCvZKGe6Z0+E=;
        b=B+TFtFQRkyEnCxFNU423e+2m9+02EAB/d766+wwYcH7ksB5Xrb6VfUwPZnRs09kU+i
         33xDZD/2CXrTn2tIG5rV2xOWmvsr6Xdr2KLtxm9nUBHsmsqXvOvs+Ed4u74a4nerdov2
         Enz9Uq15rE1tRvY/hLY9lvoWrGfxmPtxutWze1pAUtShGKpApSwpP3MwrR76eaZE/FHp
         nz9GsK2oNpD/18XGNIxGFAdkmC35ELXEuDYhENKrnZnoHFTQV2EEnynkDxy0ahINe47T
         pVlIkIrn3o3GbEGTzyQNeZg4pEw9Ei1oUvZuk7YjIO8GaYnV4xSluRYZhpuF/9x1TeJu
         OE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173985; x=1773778785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gwpDp7aMAgBSG+xcal97Cd6xKHw+4XmuCvZKGe6Z0+E=;
        b=X1rlpE7KPnGMb+5ATRVLyGkiNBSzfa1fikgkgf6leOE6W+mY9HMIKTeMFmqnxD5lvo
         79rwF8u209rhlMqPyXZRky+Pu3VfFjg9mujQnF1hDGe+SYrxRcIf+5CzKQGpgs8KITm1
         ar5gpleJYr/94mF+ITz1K0JDwrWhfjqO/ZVZYA6Gl/3aFdbmespdjQYAFUMvaRRkZWzZ
         CVoEIwQhLYgnemIr+mvfXPsiG6vgWKzBwhdNbP+fnks/nxtZJxuYZWArNszM85soK1Y2
         iFj+tvq9BnWBR6scQ8NZ6Cki1SSJuKJrIY8NvhPeOEPj7gzvMC0nD8K4b3zwiVr4nxr+
         C6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRlVUf97ZqCYLW6pc1JPhSPGtXqvhfuC/vKdTxzbnZfJ2AAm1kthwQX9UDBWgxUW1MOrL082GKLBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZxp98aCnoBHA95uo3DUsaCaUUZiLJS/DirStccyxPJ9hrfM6c
	+ZgFn6IVyJ45UQIfkC+GfQTomgwR1V3eQNTIs61K3Tu0uXXZzz3W1ThTC6O9+5afkKDarmZxLM8
	CkeycBhSR9Wm/f5H4Pju4a4mCP3mAVabskEB0VDHmylyRnBgerVMZtS4Itrn5Emg=
X-Gm-Gg: ATEYQzyiPLkrk6ZQ2msIS3Md349JSongZaNhOj3a1+ClBev/CroX/6hnulMaxgki0UV
	yZcO/txHi+8y+R+Mx1R46SY8U35vNx8gmEpVy6p5nblxJjzf+SjPTDfjM5f5A9dNE5fUCY2V7tR
	IbV2UBBFzv0V63dB2eZqN5cAjdvObVl1vJwIYxag08nqpjoBFdPE3R9wKfC21xHaK7J5avkqgyv
	NEp1vIgFPcr9wSstp93ZqQkLL0YFATgTBMqWgcy5s6iS3/xl/VjpcQiL+nP1gRmAzwnFRyAad8b
	JQVsgEkVEhaEoihORzzr9TjoMvTee3WlHmSyxCiWQFqjc8ZWjrK4UGTE+P5vkXb/Kxqt6XAGALq
	apv3RxRSji3HexjThuntzKNvOXxkqCEM9zxM1KCPiTJJbXXJA
X-Received: by 2002:a05:6a00:ad04:b0:827:2736:d928 with SMTP id d2e1a72fcca58-829f70f04c4mr138767b3a.39.1773173984643;
        Tue, 10 Mar 2026 13:19:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad04:b0:827:2736:d928 with SMTP id d2e1a72fcca58-829f70f04c4mr138715b3a.39.1773173984034;
        Tue, 10 Mar 2026 13:19:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:19:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:58 +0530
Subject: [PATCH v2 14/25] panic: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-14-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1365;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=lNXUiyOavxpH+nkJAUsL6tXwgIVeayDdpUTtrMGpbN8=;
 b=XhDH2w4mEz3MQsVANAQsn4u6is7j4U79l+YZiSzviUo/lRPaV+eAvCHeg+LHm3FJEyUmXtITH
 h7lwIX9gOjtD4Zhh82gN9bDOruCNJrlOfEq3jVS3l0UVOlydRIeQN4F
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b07ce2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sIx07V1IIwI039IRSX0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WFYCAcGhAyO4HqsYwxS4Z7bo7VO_Bg5W
X-Proofpoint-GUID: WFYCAcGhAyO4HqsYwxS4Z7bo7VO_Bg5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX6UdQjXSbZ1nT
 4cxIZZrpT+hPhhQwrRX+YG7MdXC47FKXuI1RkWZ2zErbytS0TuGTGFQWouG8Nb+TJszmjeesSFb
 UH1pWYUSjd0qIOswdD7/0R9JIhuCmFECUXTPXeUbdsxfT8ojkIYk+9B2QSEWPy5yGccVYFkIlMk
 N2QzWg41RWU8WEI6J8O0Urd+1GWmgA9NPLt1P9Gy8hGCEDjqD8CHSQeMWwUZ5V9qKKsprKaH9uG
 L1TRcIpvNxqIr9b2DUlAoP0wUXU47u5to6kljUWcFWnLfVSu1N6KM+z/lCCvAeVvagYU+3xYcIp
 6v5vDyiMAbnH176UgtQhVTkKZ1C9PGUfIUeJ/mMdFEIYxt7izdrpcuV2ZW7Fy9Xw0ZkIUxzXrve
 zXoWebXNSoVAr2E1JVatHD1mTxF3G9jdWGav5hybQnsdy8L/JFXofwSO8gcJ/V7YuRMwRS8k8IP
 qJ5wEp3XPlhuU2GhWjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 20feada5319d..ea1969d81fd9 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -37,6 +37,7 @@
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
 #include <linux/sys_info.h>
+#include <linux/meminspect.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 
@@ -57,6 +58,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = IS_ENABLED(CONFIG_PANIC_ON_OOPS);
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+MEMINSPECT_SIMPLE_ENTRY(tainted_mask);
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -827,6 +829,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' '),
 };
 
+MEMINSPECT_SIMPLE_ENTRY(taint_flags);
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)

-- 
2.50.1

