Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD233E8C44
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173927; cv=none; b=Sv1DWOMU6MzrmNaxcRtG96rGuNVP8chfh7mWOlWv4Ky+jTEQg9L26bVB7aRHaeYIMpgmBZXiPVm4lHxsmImoTsWg46MbFrPst0TpaTOI+vusAzAq7wdG7WDj0viLquG5TlHF8K5tIx4T330NmLoRY3wG6djYVykaWtgWGRZIb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173927; c=relaxed/simple;
	bh=lQDikNlzlcSt50phSDa4IXhRVO0iEhluLF5Uv4Ogkaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syF9dGm7jnrSnBwrOpQ38yX5wZMQL81fk3RpfNW7WdaBcoQT/PZFbvh/nZPnX0hTB2AtB3OERMTXhWfi7mqXg3hG40mQxm/GtI36YRVs6k2cP1sp5sWKk3YIimmBm7tyeZhbcAVU/ZxOo+66O9tEopWu+wiL03PZthrt9ZPX4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ik9HsVe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Exh9BpQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik9HsVe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Exh9BpQY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGH0pg508377
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRfV+v8T0vtqGrE/H48Sbm8BwZSwOTwP5bNFawAy1Fk=; b=ik9HsVe27x7k7E+e
	7lwbkzTzKs+Xaa30Gwlu8DLnPa/d9oQ0nR6g8WEDDpquIfohhaf/ldNmONkYrHSX
	5+aozV2K6RXs05Ks5/qSSt8OAA7DFEB3znqkdC1gCDMTAN3Hz9nvYgKTD3vtKpYC
	1UZKCggpJTEftG2QeJGWx9Pdfz72tXsFE0kTxa5COwTCVBIoN3KguwyA4zxmhHWL
	p/w8XWCMBJhl44cJq9qnOKhcsk8lSeDdyOGEv0v/xA1rAPZyLpsaXrNFnHrYFcTx
	TYYN1mU1HNA35xh9h1gWfC0mcaWaRFK52is/s4kKpby5MgjBrr3SPbnthq6zQtzF
	ojqwBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppagwp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829ad8a2896so12378259b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173924; x=1773778724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRfV+v8T0vtqGrE/H48Sbm8BwZSwOTwP5bNFawAy1Fk=;
        b=Exh9BpQYFlFZvvy+VZDSDnSidMsMs4kHfFHA9yzR7UAvNALmXMNFvOFm+sqwKa5FwZ
         0rYD7oxh6WPD01uLWNpckcgfQmX5D810Z05/2Nhsqk09QTqw6MGlL1gFi5AlLrRrQHfN
         e7c3FeI8H1yJojfhsKUP2jf51cfOm7/RoQhTneFkdjw28oajCNQsfHATa51LCEuuG6OI
         r0+KMQ5NwlZDUy8Ju3jdenSgM+Z6otcAoucBnXo2d/N/3ugarfUJt4ULkxnWpvk2tcvb
         6uBBK4UmGk96H2IevXWpD2Xla1L0/a4JbnwW/suZPJpW4LPGTYddVuV/g9lcDewebkkT
         w4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173924; x=1773778724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRfV+v8T0vtqGrE/H48Sbm8BwZSwOTwP5bNFawAy1Fk=;
        b=pKJiERBXhJOi6l2iFwlQ/AkfrrEtuqg9dnHTOgg+LH5fug3WAczpgxPIlK7hmsi7CU
         VNMnKzeSDVGBxarjwrbRANj9FMmFNEHXAzzBqsabR/QIFAznq0ClVIu8dvcNhblsWr15
         W1YLxZeyBwzpP1Kpk3+ThdhJiVcz2JJZCGbGJSHe0a+YYCNfCmp6JMIzxFPfANLC+jYW
         P/TPaEDS3pHMaLArztWIxyJgW3QKyhpolY3JYXHlLtTvejCvZhWvZ9QPqNsI3gJkFL2x
         jbrw4yXPtp5SwB/WbZ2Dewfo6xdrJm1nsF+sEXK8u5W/kqP049XW/FoffTA6QBOb01YN
         v7uA==
X-Forwarded-Encrypted: i=1; AJvYcCWFSR2BAc9ouS1kkfdPqTlquNJo0v6IN0yotvjkWdRMWda4QMf0LseS6ybhoI5MBgCZEe2Gbk7HUTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtrJUPGrTS+zXIN74ddCrog5QLH8EbBcREAFfPuB+MmaQXZ+JV
	bLwVjan5DQAwu8F+IiFWOqO7Wyiizshc406/qQM5/17PBDdcbzxeaWe4jb4g9Awnr56eGhPVphN
	lSJocFK3eu6ic4MM04A53sHcUdI+f14m3fL3vnne40YcQlAcBB2kFW4kbLatn/o0=
X-Gm-Gg: ATEYQzwoLGRzJubfZFmfvu6IuppPSVqYYgaieZG+Wxfvq+uCJMIVjUkxrKD+h3MSbf2
	dzcvL5njS6cn/z7x7d8+0dFzn4AjQarXoHBKufXwd/reloJgJuO014a3C8GPeuZZ+M0GppA9nOY
	AXfDx448mEvirXmDOOi3MD596j0viVJBkAAinFeOkBXr9hAwnmXjd000+6WGOFQRLuvCL+2/G7L
	FCfZf63/oC7pBAuPV/yhduXi15QDqchO/EyV8ZL/VOKkztqxnQB7k18Vei9REZvVLTJmLnVhV09
	GSiRdXDq8PYNrzdPjXP1LzAJmlzNP1aoMH60jYj6pq7N5zA9MdPUmQ/ZlIK23D3u3dahO9kO0gm
	EP+UF7f1dChpJz/3BXVmP4QvggU9h8cf/rXMxtn4CgkGnTPAE
X-Received: by 2002:a05:6a00:7082:b0:827:2cee:ed88 with SMTP id d2e1a72fcca58-829f71c2ddemr118121b3a.66.1773173923942;
        Tue, 10 Mar 2026 13:18:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:7082:b0:827:2cee:ed88 with SMTP id d2e1a72fcca58-829f71c2ddemr118106b3a.66.1773173923413;
        Tue, 10 Mar 2026 13:18:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:54 +0530
Subject: [PATCH v2 10/25] mm/swapfile: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-10-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=977;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Tfb2N6LauUTGiRFAYk0nYJYKBMAQNAqF6HcYVIzPbHw=;
 b=So4F5y2//OWXVBpu6mb1G2pjPDprKl6dD0OwLjg3M54+O5uetJywuxdJPx+lFXIZJyyrlQ8RK
 O05sCcy76vCAVjm8ctNTaSyWivzLnJvWFr91LSWTGqkpzQ2TiYaDGt2
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 0hFlHQmB1JsrbTjQv0wEphEetleLQPQp
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b07ca4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7W-H8-9HiqHpPtFVMfQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX9YxgWFBTMcmZ
 a61tWzc2FkrEcZ3k321emoz2nGVyxwVg2pyFu9O/hEsNbp9BR5aVShN7GcvAQkY3r2bEVxg+c5M
 9JoHmbuuPxiWkw4gcv1RL40OT67THoG2y7O69dtc02gIzr93Jd/Df3Sk/X5llPKfi0wkRy0kmFD
 LIhT1Qw440X7lPLUjOPVRrfZMpS0rAUMJtsPzf2enj/peAuf/NxrOsFKWXMQCjhu0aq+gw+4Oa1
 5fNqp2bUq/pUbVOwr0SBkkX/wW5HuhFTMNf60n72JgaCFx+I6MBLwj0NTPKYj7lJt3dszdbMAnv
 nUmC6D26YzvIWz/SNWb07PIiHRxvKX7XePa65GK61/iwctt5CKaaOqZn2Db3/2Pd2oi5RUCQBDT
 ecjBkECS14miOXEMP2SSeHavThouFfqa88MMJQe0krTLKIHMiwjxrm4ojbSgdiB0NkhSO/1T0pA
 Ix5iOg6x4HRS7HsAi7A==
X-Proofpoint-ORIG-GUID: 0hFlHQmB1JsrbTjQv0wEphEetleLQPQp
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
index f39c3d712273..03aee425bdbd 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -67,6 +68,7 @@ static void move_cluster(struct swap_info_struct *si,
  */
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under

-- 
2.50.1

