Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF43BBFDE
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488892; cv=none; b=alVoF+T5jv8VSuaukYH3lIKBashUJ9B1TDXqosj1QM/XWT5xdoBdKRPpY97QKH+THNHgLwCXMHAsg/TRv50u5K+qsljCdF9kv0cXOi1tDVfA/KOK3uwnT+eNauBQAtzz8Jl+43QGLqoWRlGBJQ7YbMA42bYW3boePGRFHGiCf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488892; c=relaxed/simple;
	bh=G7OTxl0hvmmMhHZfG1dBv16rJ8UL2LeMtOP6OSlMZ9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGPnh+AG9pH1VWEZlBhgLg0gp15G5i3EKENWwVmAsmOX9doiiF1IIxiqGhPCovxm+5im7DWf17xOS4nucKHGmKvfHgcX0pI5/NW/pPR5Kfiyp//pV4hosNHveVB8Py4/AuPWOWnNotHxm8IvUzyzixmracN5udtpozKVJop0dY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtwLPwnm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mb3w/vQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtwLPwnm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mb3w/vQr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842GZ81695176
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 05:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GG0TiEFI6S40u81CAA6ELJbYcW+fJPcBWrtzfeGi1/M=; b=CtwLPwnmIWiCP60L
	tSRsWp19PTCvpGjTRExUl39BzKsi+1lH/6uR4/3M9lId08XsntBqFVLk732lFfZx
	PJvuBKJLGVOglKa3NnUHesiRg9LcFb6InkB9NcYdGjQr3LXiJzSBccXx2chE4mQC
	+B4+ilNPXhbBgZ0jXx8+aGb0zAGPN1UxAGNoknIjQhKClh6K1myUaQZ36mpiFGJX
	03ih5H27p0rFYkktHS+mLwP3ldhelLo0rwl23FhVNzePBBDxAu5GqLxhcv7nzz75
	5JviMCxj2DbFv9kIvNO2Wcb0ycdSOYQn4PspXJkWPKmGwYGgAhkg/GNcgKW4HxMP
	3rSjmA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw8sp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:34:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8482b95574dso412136b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488890; x=1784093690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG0TiEFI6S40u81CAA6ELJbYcW+fJPcBWrtzfeGi1/M=;
        b=Mb3w/vQr0ja+Jy9Lry6RwWCwnOIJkcQ7kP+hOhjrsk6hSjL/BLsps0cMqd5ZOw0H5p
         auEH7Sp9fAfd94M65+AXq5wfLWrkpknpi+MgY4xCiP++q3Sj7CUkicGORO/Bc9rs2Nwv
         AriIvzgVYaevGLBLCCzmUOiVPEIkwY9guKpP++9APX7Jb2CqTFOjMUG8GDEFeihr7K3z
         8T3RUIUKKaNCzNzlYxTRGiUyryQ9fZX/r+s3xzzNjj21Jw/JGixJ/1jfM/itbB1V/kLg
         osmHGr1IKBalho6QHWp0ri8B33/uYr8oVdu3kpQHQRN/bL/inN7vHVDNj+1ybvaw+6R+
         VtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488890; x=1784093690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GG0TiEFI6S40u81CAA6ELJbYcW+fJPcBWrtzfeGi1/M=;
        b=ndSLOSuERIBbfc9dYCrk2KewBUmmg5qzzGemfA1bjJjX0rAYs8MmvPd4rDSHK7W0Cu
         YH1Hy4fwlJlzlYNOflV0Hyb5es+LFz+19kp6zShDyWx8YrEtI+fSTj0AZg3HY6Dek9/l
         gvpVvO8b0GzDP7uUJ8egCM6VsHNGZRFZsaeUA9FRahkDG3NSpbXKDg5WJYG2Lvm9pNu+
         yibFNz4ElU6gpZ5Df9Yzj1FBW29ntapx3JzJ7ZE1IEEPKObwPM1gj5zZd7ZJklLR+seO
         6ERkCv5arod2IQbAlRVRo6815fDV85ojEytWiV3HMUnLNxZNvPX5I+DS43QdAHCYuy34
         HuAg==
X-Forwarded-Encrypted: i=1; AHgh+RpHltN3numqd9iQbjm9xrtVw5Lj83gs29O6lM/gJRP1ZCl2iVqNFgTZ9Mm7AP4GNilEzAiQJxUSd48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hm0XEct/wrF8Nbi4ERel4uewMpcakOvVp2rVFX7FYtkU22LW
	EGdutJ0jL4ZbSgTeU/VdhJ3r6PysYy0nFdxmZstWIR+NxDk9/icRAE9gLMaZ8LvhzPB8IJnZAZt
	f+z1twsgYhJClhUl5xe4fVJBQQFwqozklGPmDazUbLqgOpPDhwfzYR4bTlHkhoFY=
X-Gm-Gg: AfdE7clJ4w93Z3lWSMecKJ4nR4e3n8kY+Ilz6zkZAKHLzofcEFI6zJzDW7kRWPCgAvv
	CcTE+JSLvkZMeUQbJJbIzr9LvgPdaDTJsSiQ3orvYLmEyMc/MtXYpTFJ4DxHlnYLy0H7lZTSSx9
	ZvLFREIvAhCJP0zQkIIBhvOQeuqwFXfeyKomDVh/LzklhetjX44rf8m/me1BccldkQ9KZ6NYgsR
	tUmy1B8oZDR3bCjfRgJVXkjSLG/68DV+A8RUh9cdNsTynMHTIG0xgf3jckAQZvEys8PMrB3lDYL
	0QmFJtBM4ACUiknRO2Aq2yHaBvrAENwTZS1eMyQpxJQg0UyEzM/2YnngVzQ09uNTKjERj68a4M0
	+6s21WHB6ByLOMTxaipS7Kk6xdFi/Iqc48QyCsA==
X-Received: by 2002:a05:6a00:1d87:b0:848:2f71:b65f with SMTP id d2e1a72fcca58-84843000644mr1092053b3a.74.1783488889723;
        Tue, 07 Jul 2026 22:34:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d87:b0:848:2f71:b65f with SMTP id d2e1a72fcca58-84843000644mr1091997b3a.74.1783488889150;
        Tue, 07 Jul 2026 22:34:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:49 +0530
Subject: [PATCH v3 10/26] mm/show_mem: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-10-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=914;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Juh0kWVVV9+31+pGUNWBrImKXqVrnwqwm/8iHkGSNZc=;
 b=QUUwmdgFWBgI75+U/LQsmKds191tgbFJHJT05eRFMeyjFTPxg5V8CAPSijLkfNZ7LQtRjumHe
 J5Xw5f3z1e2CW+YpiYhbyE+qRS4qLD2cAWVE6mgZMA9c4AZEcoFxInw
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: WDneuvqMQqNiC0Q5F_F3daXKPTDLopDH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXzZaKFN3xH31K
 4K3pVT318JxrWdcF4es8SgdmQ4tqhs4RxYOcOD9Gs3eSZjC+4EXooZifeeJQUp0iEqoGNippb/h
 4VME6FbI4Kha/8uhiUlR8c0kA5Ju/vE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX2aNTgPO+huWT
 zAJ5QPnYcMfDI03xH+IiKeMKRuBGVK23b2BEnXEGhslY7Yx9zONNaJlhTVMtO099YYNc6tSka8W
 jrv9SY911GUP/jLVC/f2Iq4wr+hQNE67a7XuHw/ULyspFNcz00inLs5+zlDopOBB5OM6R0DkIE1
 0rSDPpISJf54OxxtTfz3ez6rZeFcamyN6mLwD09urQqUpbj0WfXIOc3Gl1RaYI87nqi39sghfT/
 kCMnnN/m4sKwDsuR8ePk1xddthPJjkGdT+l9daDaz/cK2jrxHaqM0rncCJxq4WqNabFJ5mZuV+X
 cb9VXgkPO4twG7sSC/aJEqjXUUi6BxJ9GymtXNWXbDXrI5Urx8wvNdrnvPLrwRkzfPwCEWX+EA1
 28SDbwPuSgSL6kp9VLkdhObp5oY70czOnHV4eeDOKVkW21m4DtJi68ZCy7StlBGzF5i/m9v8H8F
 8l3SPyIcgCp94iATgZQ==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4de17a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ayq6lH46roXo9nsmW_UA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WDneuvqMQqNiC0Q5F_F3daXKPTDLopDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

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
index d1288b4c2b64..67ef32f1ebb9 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,6 +14,7 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "page_alloc.h"
@@ -21,6 +22,7 @@
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 

-- 
2.53.0

