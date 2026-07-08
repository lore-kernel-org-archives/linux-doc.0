Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D83BCD0F
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488909; cv=none; b=aCr7oGaVfvHjTRb7TJoe8QikcAH4aZD784jgWgptruhDk3BcsKYKKtaUcJj7+9OIvy4dIqYjqGWbs8EUK8bfmAam1V5JaoExz7Yq9Fsirc8mXZJNZPr6HuTT+RABa0selsR4NAB8+tZFcpSXK/7yDzquat2DUAOdA836EVbdIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488909; c=relaxed/simple;
	bh=dQKKnqGBFhStTej2/7vdZRU0D9KWrTARaJgojwH0KLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCAopS0UpCffrvzqwRkq0Xmi9uTceGzI7f9/Dw2Ss/xuNQ7spcmBvIEPJBn6jx46k4Ensu/nZ8gBuxjtCijubHrtNF0VZiCAXigXvRmUdP52IUFrlzgouUF4pdMxd8m76T3B0J6NW7bgJ+BURmcWxsAXwxsWq4Fdi0VyquoRLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4u4oLee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEohFnZ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4u4oLee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEohFnZ6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842hZg1668319
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 05:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=; b=M4u4oLeej6p8aS0u
	TRiwSM6+IF3MEJ73TbAD5e3O6bITNiVhDsevvmXVA8qM7eHF8ko+X7aB5nuu9aa0
	VGyZj0lxfsCcIoLynfx+qcUXzgOwfBJSVD6Coh/wG1mrFdfAuVOm4FeR5jHxaJcn
	OSVcziuUAkVr0Jsie3RsCsuxwHRnw92TBYL2AsOpSOI25B2LX4lyximoVyCKH89k
	RCi4EMAa0qHudCXQ4GNEai/e3XLrrL90yW7MoFAGAG61/ffzdilghSC5UKSGVJkZ
	pBAjnOcJqrkdnfbmUkEkRcCbaSL2MoV/Z0A5zUJxUgBmiq/OUVKrib1maXiZWC4R
	hd26Nw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5ttkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:35:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845df469a26so905321b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 22:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488906; x=1784093706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=;
        b=DEohFnZ6WJR00zFFPJAACmfqd0/7Z5qygNKKSELYajpkEo2DpXCC06rx3DzUHN5fUk
         ej//lIrahmH1Ytwl5bQ+b4vSP2BcB0hwbvCG86TTHcm2A/5Bm+Aj+tXCjRdt3bML+mjr
         8THIyNZkdIUFBRguHtOpOoplwtlAyXI4kZ23esjPHAiKy45NRDqkazMgeJrC2FAkNtWf
         0GZAEiUW8evsTZN9M5n6Ua3xgtE7FwAk8q5ELW0QsohQLgij2llf35pjmyi+oxCxi23f
         De1rgKkVm+5u4sCbZE69KH+vovAg5oOsk1pybYjQ1HgMj/7W/uiw7voUg1RAUERrDoI8
         CUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488906; x=1784093706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=;
        b=i6hrfM72XuTQ2q6AGn5Szcoh+395tcd7c5PIMzNyK70RWoOLD5kBHhxCh65wkWNVlc
         ssRSvYwYVhL9ntp1olSKKQeP9tShhnBtc3GbhaJeZNRDFlrCBGaQlCJT2fUSLVGhHTUS
         bTc8+zpXeZ/Nkt4Ri8VLHu/nKYRdmaXGM0yFNcBpJrNIJM8BJFBAoRj0pDwrz3w1xoqC
         c+V44Ud0f8W7TLx+XY2OsY3OyVPzohsf/MXOtqYHDPiDUFExV0yj+8BdXDwTM6ZGN8bl
         ZUwe0sE5r6OCErRZ851qd7HJqLittoOnpqct6FAokA+S815pkGIIj9vNsZnyGDUIEV5r
         Ph3g==
X-Forwarded-Encrypted: i=1; AHgh+RolD0Bb66Iba7HPgGXSGctkr8/afyjLPT4K+JFSpij+jQ4wT5+KwMcwQwdqY4fhIMFEaESgsgiDRj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn1S1CqcvX/S/D9rCZ9ozWNJOiHTMoZzNIseAOkrBXz12tD1Vr
	ygXjmxvPkcDDMxnH7+RcoEAPjSgxH3/nkXtkIfXB35Cb8j6srPYYWjcVMkAmkhTVIV6via/6qHG
	yo2oipL/RfaR2fiO7OIbQUM9yefKyNYfCM5vcxRbr0vfdFRX6H8KBmDOyQdPNORU=
X-Gm-Gg: AfdE7clCjtMsXXAsfwVQU3dcTIgwY7j6Cei9OiA90X7c0fsNturh6VnEAxuC4pLu4BH
	G7dlO+ZkfQCuioDTpPcodm22gVAHlSLbv2qudTGMtFFds8avriAVhn7Ll/diQTSOUpN/mAgbJ4n
	UFgqrGTZs5ys/2q1yTBkrUQ4IC+dTNqlHdX6Dk0BQ71OM3RIqImjax+Fojn1Z+ncdvwxk3X0bRt
	mxlGDaN7wCDZmChGFlnHp8rhhRYKrS2pERxAeMgI4Myt/6OvzKkb1YrjccGlqZ3n9cJLXUq7o2P
	h9tmc/lH3PlPmUfi1MM4zPaaOOYiAbWEroWsbrXUuzP88zekfWw+QuhEh3lZXWwBsQxfflDyc9V
	DvtubcK7/f97EmOape0El5NLD43yOXBKfo9mN4Q==
X-Received: by 2002:a05:6a00:9aa:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-848432a16ebmr1252352b3a.32.1783488905638;
        Tue, 07 Jul 2026 22:35:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:9aa:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-848432a16ebmr1252249b3a.32.1783488904894;
        Tue, 07 Jul 2026 22:35:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:50 +0530
Subject: [PATCH v3 11/26] mm/swapfile: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-11-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=977;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Le/Q1zQCFzKw7TzU97mwXcZteClh+RXmg0tVYvpLcUg=;
 b=/A38jB8jdahPqFeNwjbw3VsOCOB71d39aCOjB+lkv/q++5YdKJm74I+QKrYoRlSQmDy7ph1py
 Js3L+F1YhD2A103w/t5mZSZ9W83XBW+cKVhsPjinjQelhxoWx2X6Hww
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: -zBJNH4Ga7pPnRA73cKdEixxTtKLZ35g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX8ivMb80MdVWf
 kU15WMW3Tb4joDReKPB+GRlXtawG3fZ9ncUdruuaA0HPnLGaE9eRH7dO+q1Uvv5Q27EGrTZFAFK
 Lc28mqwkRIAmReu2bqKHzQU3r/kVxO0=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4de18a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7W-H8-9HiqHpPtFVMfQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -zBJNH4Ga7pPnRA73cKdEixxTtKLZ35g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX5Mx3boVXA9d1
 Sifr2gchcwfags5v+gj9m23RghLH7x1h2oXhukzLVneGff6iHJxuMZElFD2FLKvqmWnTaLsoEjl
 I4+K2QCqVCe7lr0RfF1VkMD/OQeFyMDDEkthlMR4Zq5Kqzj9YwOFHAq9FeCwh0yOlr6gnEK0/nU
 /kknc05hseupYY5HtWKPq7qInuYtjO3LhEdW00ZsthwcIfpu2DnO4ZiLnmOvRBGvH1sDIMgKyqT
 YygA3LDv1DfKQaypFZS2MaKpgFaT+0bI4AAm8d14S4rsmz6zZXwvc6FHiIpTqn+u/HgfIuzqtAm
 fgLnwNTUlQ5ZYYa20ScgVkPM+3gxSOs6kXgxEP2c1TF3SlIlUpFTCR2UNJiMkR8PV0jhOxa/w/t
 qSB8gOPKgknPc6t6sSecCN2f7QJFWFTBeitil9mh+/akSVgflOKd+BJSw1r8S7tfhDWLkeONhfg
 st23ada/F1YNvZNeVhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - nr_swapfiles

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index a602e5820513..d480727e4987 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
  */
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under

-- 
2.53.0

