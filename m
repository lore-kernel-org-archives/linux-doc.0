Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7583E8699
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173911; cv=none; b=TvWFTgdKKMO31unFlO9bOqvM6pJKFcNrEmOuZxaU+YJJ+3d8AsHh9UVkzlsHdJaVD8O09/zc2ZotLbOJuTg/sm4caAjvG8wmo6Ly3V0zu0jX3NtbukTEijft7TuV+q8AcYdho1huED3S8zEU18PHM+GhAoox0cL6jneDbbOSE2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173911; c=relaxed/simple;
	bh=ddnLcCWQifntrskr0bcFbMBQGwwCpIQxRxTa/csgC88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUSgOhZLblSkmYVlhq14z5IcX+/tcGQAbX3tOnmn0enHA76IsFurooR129YA3rGTAV3ElKUd2AsAtPJ8XsuKrGeVsKOYCnqdqPWEQmY5XsuNNQ2f1bSwxzavYJ6nPNxquC2vqzJtfbuR4kaUSU9ov2tNLKUU1BezAX9CHvdtqnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnrC4NkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaLXtyRO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnrC4NkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaLXtyRO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIXIC02861962
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=; b=AnrC4NkBToNr65+G
	AeOELDrpl9XgKlIS8M/AtttB4QyAglvTb6SQxjBuNnsCiDxLCeSoU5WmEqxThd3n
	q1r7NaFq7tri0wHflV+Z3u1FJeS4NCUh+YoW29ccfw+azNMLfQsyntExTh9g0eM/
	OK65QDkAjslsNMXN0BZIg5Zs35L3NZGED64QqDWnvxaOkQbYFjYXtz/2YHDRZZ4x
	d/i6zaSKGtTvF74k4p0sDUwgSutpk1nIU+WC11pYUqWQKNQWVXSoRlKiNN3DpcMs
	OyewJGRmFq0SSbpreUfhULNlhtKqRVRBf7e0xiXv8vwnmwA8wH/1n+oQZ2VCsAGO
	B+jY/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3wb61g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82990cfa91aso2090993b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173909; x=1773778709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=;
        b=MaLXtyROcBZIG2lrTCKQpdHM3sgGv7EaztOOHEKwzuUfvG+cYkBQMf7QFqE70H4VGX
         rlPCdwv9FDZ7jO4aPW76cF0kfNenn/pcsqLX5M0fEfMEPWZ8JEoEDWzyt0+CeiFrZYg8
         rJx39BzDt4GWhbjJm3rOwnAtTKiIvI6W/GBUuwqYLGrTTjF8nQ5UH9skMxB69zjTrLvL
         HVejgm7woF6iKUJuEo0oGrP4dDC4iD3yJqBZFTQWM5665OkV1DV0tCa0YxSIEe/CYLw8
         /hKDDgV5d8m41vAk5IdyzqdTzui6ihs4pdsxbYRfbIabjjwQ6qTcJW3PWWr36RcHIiLz
         bWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173909; x=1773778709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=;
        b=VKagSACYQKuR+Ms0c+Bd/8AVWqda2pdrtTNUQ9cA5RxCbrKoTBAqoM1qrRFdj5eKE1
         19g2KyrJEwmnGy9LvE9sWoRsBlmyq/YnddWCOcO1CKCzxbjazHHjbdVFbD3jwC6uSaDV
         y5qhrZ1CAbrPvAneOGYonmVA0pEfCkw9JN1oLaFU6EN14S2uwtXC0OOxAUsaegdVbF6v
         yAaLBdQ+TA/fqk/RXMrW76zlvZbNiSBYHrE+NqgMSV+uSBBf6v59qnUOU+1HvBwy4mc8
         eEsnG+mXrBnVT8mM6cblbUdJ0eO8uOL1sOgWRLcnOJwFovKbjq4AItJuhbt+dTG/xkSW
         Jyog==
X-Forwarded-Encrypted: i=1; AJvYcCVohGElOIKTT/Ze2WiQcBFpqMTy3MZo8U9b/1iJdCn1xeT78+keqeTgr0v71FkMzqWy6KSzR8MpfO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUiIJqQdKl0E+VgOstWajDbVTTdNAF9TNqHx3mmg7GBZDfVY5Z
	T95YTpxxc4dHERxxE6x7AYHnAjEAsg8vaXmMVIztd/FFYr0Qy+JDWELYFCU/kKSWthnQilLhKwX
	Ps1vxQS/vKmmVMpD429udzuqr2zi0nL1i5/VTUMZ+WXzTjFMXEV+H5iKiKF53KYk=
X-Gm-Gg: ATEYQzzWyy9iDrHUiDMdLGJ1JIv+Jef9CmOdzZ9Lr+qR80KjsW88Xi+clijg49JHXod
	ah8yLBKeuHEiaRpzECeEEQ+LUmolSrSqZ7CtOhwsnr+qHmahLMJO/Fa1CM9udESoly1oeuvHfnk
	ewxoXjg7NhZFTgsnI10qVH+NlolLXpCpdpZR+YqNNxCHOB2dG810HaMieAcUE7QVIQy6DRL1WeJ
	+A6d1aknuWne1m/sWH69R1fto/HQYHqpgkEN4uoh2RGcIIcJxQJ/msyOtFetHRdYVImB8CsQH6g
	SqmRNVJeyo1SeaAynNwlFJTzIfbF/EQYkMV5jsH+te8shjabug/dVr7TG12rmo3Ynll1n9A5vAU
	/rDHXs7RwxVCE1ewby4RTKnzgHjvXM5jf4E6XOhzqEr22RfAn
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr188031b3a.9.1773173908913;
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr187951b3a.9.1773173908318;
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:53 +0530
Subject: [PATCH v2 09/25] mm/show_mem: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-9-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=896;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=hnWgTs3BqNwkuy01WGRtLHEmLnAWVLqGtO9y7HspcnE=;
 b=uLHZ20TEam9IFeoPaxYKND50xjzJmo8/66x/toJROlPuRsGnYldJCrFNEUSo9htPmJgsz83XB
 h1nzBbPPYs9BIy9KMclSQJQfzgEIMyig5knFQTbc87F6JhGMpL4Ps/A
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX7iBqCB1waRCN
 Vpi/dU2Pj9cilzuoOQ04PIuBYe1LkNIuaUnbPcmlX3noLgu23uH3cejRxwzJjuLrd1k6s/GoJd+
 w4ENhaFA10mryia5Ftnyt7mv5itNJgV+U4Lz85ZEKtexXsoANYK6tC48CcJXBQdGNL50OS2TjDE
 aMvwZ879lpI9nEZvtgtR3twRiq4sDegDoeOV6LXqy3Pp2PMv2go7oSjTz0fnnswDbIGnoD/m0W4
 6SN7V9ipWRp/+/ArAvbAA934OjE1Mtaq/tzNC3j0Un9DDu0lvPob1y7lie7xQ3ou+NJGqUkznI6
 rwlTYSO1BowgJAmYD5Zjw2s5q51B3NxLZnbcR4wOEFBQ1hLXuvsz/1t8KBIC9LRc2MbekT5x9NU
 IUNauXcz5SkM9FaWfiLNEbjnvPXGs5I2C8fk4XA5NSX/6N9rhTziaI0grxHlTx9ldRso6soOSyF
 2aLYhgg61gkizZbxBtQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b07c96 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ayq6lH46roXo9nsmW_UA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uPodD-MHLl4U62Q2F7fja10n2jRssfXJ
X-Proofpoint-GUID: uPodD-MHLl4U62Q2F7fja10n2jRssfXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - _totalram_pages

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index d7d1b6cd6442..f6a92c7d9d1d 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -15,12 +15,14 @@
 #include <linux/mmzone_lock.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 

-- 
2.50.1

