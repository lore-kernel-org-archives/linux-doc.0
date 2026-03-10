Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA03E958D
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174018; cv=none; b=B1JRqBXH7TX1R8XPvyvZ5jUgL/gw3ExTI3nHQ7+j7/6B1eqW/C6wJ4t0ISmVjaOf4SoOyKuA7wvB9guWH9yAvKCJtWWGiOE/8NVKL5zorcAqFSB2jyOdH5kobde1NcMmxRkQUJZXOxubH99HBmp+EbKzF/OZs3GYarZ+DRYHoJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174018; c=relaxed/simple;
	bh=WMywfnI9PbjUKLPp2Fs3M4g0w7tyQGBNDo7yzMHxSAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXRZ7fdUHvcRQ/S4akyxIXntEYS4WNELiC5q1AFC0E+4mInBV+akzs5Rf0VgVmaZMtM8RCqR+23k40/24FaFYDNV5naFDeW9FQGL16cTgFbj6xp6m9tK0Whu0vJwzZL8enqvLKRS92JJ0W5Apc2ZgZEDF5RB78mSEDdGmQ6EewI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kcj/fPZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HaH/zEvh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kcj/fPZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HaH/zEvh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGAjDY1265992
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=; b=Kcj/fPZ/cpOljFC8
	ggqErlBTtfF+TdraC1O0f1rho0XEPKKZ6o2Yw+WE95wpJdRXAc0+qCBIN/zepz9i
	LcSwm3oqsSsUlZC2OQRvxxPdClhNjkpWeEXSilhPesJt7G/DBKTu/jGAm3JuKgQ5
	H9XHXg/vRhgxSrecNxbG+HBo8xI+R1DxZ++B63aTilUJ8O8BYsPcxoZAk7kTDz3d
	7c/FUBMuxtNOBhlSPTp96BX9PefFu3KoMjtDL6+WGxEyQrJtf8LdlVhuJLK1twzh
	REzMRHwO0BV2rzW+BpmfiwiDIeZD8OL2t8QqGeF3nlYgxmBh7Ih3AT7Xazciul7e
	i4LpUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfh0by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b6b22dabso1121595b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174016; x=1773778816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=;
        b=HaH/zEvhqr2hJJYiVjebl/uTTVZUmGOMc/m+/tyHSBMqEBvbtio8KS7Cuh2lbNs3Wn
         296kzKS5t6J2BMDIPwNGQL8geRTNqzCMvCyoaUyQV89nHTgdj9nU9QUuKo/M0qJJwK+8
         /hEtCdfmowXqwaMyMjIKHii4Ve9fL9i+BAXBxxs1yx8hIoRDYWfwsJTr1r76dLFkxaCg
         ywUC+ivnSxaQ8/RTPBDvtEc7eUNifdkWjDzuG0WEBc2pT5G9tWm7x1yVmj1VE0XVRlSW
         J73Lbs/ltFxnyuCfA64VLxfbE1sdHkbLATeTPOmpYL+PjJc3oIGugR3DnNnmSW/wgqvy
         q3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174016; x=1773778816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=;
        b=t0b+nvPze9mfhq/AL+AO7rGyPtryFP9EaBmg2ARdUtaqjviVAllFmwRaC/97sKWXFQ
         rBJQlLsGanRXBC0gMrDaW92B7VYBwlj+RncT7T099kqhRXPPbbRcwgeVU1RhQUrDmFa0
         Q8eOIIyGWjTT5ZxobalvPR71T+Kb0y6loDeuPNBx79w9wjK0OwoaropfgWDBn3ogAe5v
         YSfvmfYt8q2Zorzlxx5P2SBw9mCIgg0837NW764u8xglL6HXud62/TSoB4G4F3V3gZwo
         JrgFgnNwzPxDhRVitev539Nw1+ZtZsHsgSjele/fbiTpHaFIugilHJBoitTeL3DspA17
         M/kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2aN1FnJqBheemuqb/2+nXWMdZLdIKQXLA+Lte8BcsHLbkN5Ce6jUM47iBbjX0dTMIhBRdGthp5+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzZo/dbVU4a1J2jPoojYeMgOoW3PPGvQmyXH+Q3QNuAzz633l
	Rxdf6Ng9hgKmjXSMeyXSlWp+5/IA1cSreJ8slogIttSB27csvTdER2CFvH5OaSLyHahROtyXMHX
	l4fU1gAIoDAmTVToqWUviPUXQgmPQzoL1RLEwe3Z1iofBpdktNhEP+5YXle6l5JI=
X-Gm-Gg: ATEYQzyrEQCXDXtcMGVycTbqn0EUU+4+9vDl9L7LX2q6mzTrl5WGHniypmigmoerJP9
	mNE2P/wgn+I2svJ0j7qqTJpLGpUgirf2zr/v2yHe3wQ2N3jD0E1qJGeqnch2lFb+d2hBzJ6rETu
	enrKYijRIZ2W34JTehLo4JtiKuZPkx1EdZPLcJppSVoTQqkeFr3RrTvkwT1Lxi7sEs+0FRzkyWe
	oLmWiGRnklsGnvV5ovKmwzqsd5/XPQmB4LL9K1VBw8sPcbLf5L6Uj/VL4IG85sAMj2NYpeykbmn
	pq2qz+taUhrMam7J8WHhiK/CIUPnqQ1q8D4+eD5X8uBOeJnk726e5VGng4zGwjBVoO+P+WQOO5O
	6ONYnb1K/C8cpuZMoBhwHYfQLYfaaGzpWuP5lDN6rL0+0lbUl
X-Received: by 2002:a05:6a00:9298:b0:821:8ebc:2899 with SMTP id d2e1a72fcca58-829f6ee87aemr174142b3a.7.1773174014900;
        Tue, 10 Mar 2026 13:20:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9298:b0:821:8ebc:2899 with SMTP id d2e1a72fcca58-829f6ee87aemr174107b3a.7.1773174014221;
        Tue, 10 Mar 2026 13:20:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:00 +0530
Subject: [PATCH v2 16/25] mm/mm_init: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-16-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=916;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DTT/RubkS1uO6w8Q2uLlEU+1CHFNOkom7gwELIcItBM=;
 b=2RE1s2i4KuvAIh/et2VJGLUruCSAirKOtEoh43eZpI8VBrpC3JkYwLQaT5N0Z0sjwA4h7TPsx
 8yuvgeVV1F/DrKNesJyEKMfCO6ycGwgttYEV2WQsmy/djxLHR8nIR9O
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: pkW6XppMxG_1G0IhSkqHB0CYt6aqVry8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX9v8ZQeoGKtHn
 THy+iO8CLChYh+VoGJ53cBWRPr7Na0veS8vmoToQ9+rNQqog3rwHmWZDo2xxxLuEu0R8mWxl5Qy
 IZnUHWwksfWyctaDkTH3g406qOUG82z9yryaSJkgmMnLVU9nWYFZi2t8bKFWei21rAxvzLPc0YD
 rk3XALgHP1NXKXOdmCzR6GJEdegUXY9+EAhVDJrqa5G6YgtKc5pmfsHad4PzcXERqwyZ+AQhSlR
 uhXCKsF0yzRkxiNOmm7VUC5+w9Gd/N41Sj7oXB9tSJWr/uDR8NtrUFaIYpjJDzCuS8zoLeyuine
 /poYGd3lWuKAKKQJo+Z4gVC1xOjd78TgEoQJ9JWBV6SdScPIclVlVQCXs4gEI9P9YVyuX+UPU4O
 ij8E0/VLw/5iHFdXK7dW/2o2B6OUMsLMmMPnV5B+lQRretmlxaHCm1PrmuLEukNpc6UVducrBvg
 IR1co4MMgpULME9L2zQ==
X-Proofpoint-ORIG-GUID: pkW6XppMxG_1G0IhSkqHB0CYt6aqVry8
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b07d00 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R-PfVeyQBJMsRd_P_MAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - high_memory

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index cec7bb758bdd..3cfaea1e0b21 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include <linux/mmzone_lock.h>
 #include "internal.h"
 #include "slab.h"
@@ -53,6 +54,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);

-- 
2.50.1

