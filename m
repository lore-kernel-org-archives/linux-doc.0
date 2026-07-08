Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310BA3B9D8C
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488766; cv=none; b=ItfCs18zGDX226vZeiW9iUqTwRpPOoys1iZAf3zN/wjrpP0WZGX+lDMnSnZg8kY/lfXFnQoqdYE1GF64PkrSRnaG2jlS/uVcJhsEhKPqgSd5/x4LqDzeFzH0R0jenpMsEKouEY/bZJ/9/vufjtONy70Vvka90ePM00Alv1HdfUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488766; c=relaxed/simple;
	bh=LViExQ3nDxQajjv9U5jUdFV6kLaFd1zaubarifh2xpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/AnLNOzwsdDGOwQgCCTxvQVnRCzEQ4Ec3Kw+LAMaVJY2YbGRUjilSzC/1lSNi6INzXHlLx/Xyp71uaUX5BcBlV2I4oO3WKBj9uAUFLiQm4/G5j1eS2RrarDWwW7lngAyOvG3uDZjGWUlTBEP7pFzCDMJyjQT01g9Uy2pzV+oF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/GuVMHR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQOYozoG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/GuVMHR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQOYozoG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842arE1491300
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 05:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wt4xXlBaiTArQJb4Dc9JxahMF7p7g/k7Bc47vJjViYw=; b=D/GuVMHRdMYWGI1n
	zcnAq9lpN/WhuPQNUi7IePjTU9zxLKQDqzCLYxNbMHdlOJ09mo14YIGsgDPvyIAY
	RRCA56dsuCJ5WCWsz2WAmwblGV77toDFBbChK7iNJ/vVVtIPQzvIjZWPDe9jYr1K
	uzDrcqXIvdYEpYzC58tGCon0724sJCjjUCULAu8evnTuMnDM1uXqSEQc/ipO7I1T
	VSHsuLI2QPFinLNSeyng57txHpbeSTwQhux3JvOS7YiN6Sx+j1oCdRcvrWeLnm5S
	H4hwgq2dJYhKB5J5YWKpQQ9eZQvOYmz2HXyHzt5wlr+VFGeXHqm0duuedn9rNN07
	KhJk2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g948k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:32:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84240683a82so328772b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 22:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488763; x=1784093563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wt4xXlBaiTArQJb4Dc9JxahMF7p7g/k7Bc47vJjViYw=;
        b=TQOYozoGmXbKe3Q3xQXow2iOvABR7F/W0fueDAcBSOyAfZIjHgXCggXQBipTlELVlJ
         Zyv4hrc7UsmlYL4e2Kw4zdFquWaNcOiNB21E2Dft0YOuWKiyNUped3WXz60b8shbE3Q9
         Hdx3h91NIO4yLzpj5PLFMLOrALnL+xC+YfV8N/edRlnJDmmCnM1yEd/GPV/01hKXF+G5
         W/LlLoHzne2TaSj7T28RC95i7Pnqlwuo9gyMy89SBq4AFqaGugJJvVr5ujlp8ivhynDy
         vKUCV3aMzUKgtbpQ2ea1HL5akQJlm6rYLU3+BgWbMfiGJNDJY4z1NBiXC7lbbR/a6Ziu
         0A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488763; x=1784093563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wt4xXlBaiTArQJb4Dc9JxahMF7p7g/k7Bc47vJjViYw=;
        b=UYk/45rlAH0u7ThMvyquJrunRk3cvwr0B3FfIpxQTBQzItC6DlJPyj+MJ16A/kosj7
         PkemJOLe9ZQup4rKnUkFSa/D6kga1xB9pCnBpHGGXafRL1giP3Elbq4g4piFZbtG3TaN
         7IC2UG6SiAnT8DneAz/0n9tHCLWDpJ8H6Y5MPWHFOHQEw8jhuDYJBjoOvRzP3Lteeijb
         +IyHbALTQcJtyA8ix39VRa2xXOYFC3B611nGsa4/2KXqrc2qU4cLn2UO3MGBnF8Sqenl
         IcPVqhl6vI2zhQ/nMNArENd7yC7JndhEEC6W20uVJGB6rsNbMGy3dZGh/0iqX6rqI8vV
         LZBg==
X-Forwarded-Encrypted: i=1; AHgh+RrDnNlJApu08yD5l9ldLMv2ffRbz2wqew4kwSaVZPOHp3ziYPiOuYMUbWnwXUudvHtTHPwB/6PZaPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ECNOraSes/UhDZORgrQ1/7Ky0ig3C2xz+kTtNKB76eTznSpf
	mOJuU9hye+r73pzMdpBT2be+nAG4DPXXxJjZfvWcG4S/Gbi9NRY4P0qGTAvD/bZbM5t413NUPX/
	CSAL50zt6uoqi2aJGDpVSZPnSYJ9c7ZMTG+f4KqcbWFsDjwFDXqg42vAue8/tq3k=
X-Gm-Gg: AfdE7cm2R56pZuayZkBvY+LfxMJBploJDxwIpzHWXW+lEWm1mADpmChPa5CfqgGt80y
	PxrV7huw1cPV0s2lM1KG3b5pP3RD1eBM00j3SrJlnLX/0t1orYB+3qPHZT9XnIEfaVoFg7uOgRk
	La/tit9U5VW0ky5LcEgW5tGaKWblJd4sy6ABSYwheVUQht1pZIIEWUqVPgMy49MDlWW6rpcvLbz
	iZgVXHCujWmq1KnPCeZQPFBaw7g6bHNJnsWnXFsu0pkkJ4gHpDpii604lDaH/A+NtsmKfDns8dG
	665hIQkupDIe8yhvOr47oXE8Zm+jAgR0DcpNwJ4bLiNv7FG+uUrP1x7xHhI8oanMLfpbSOI7cf6
	wcSmycwCQOsnhqpQBq+sUrF5x82+XVp1ljOq38Q==
X-Received: by 2002:a05:6a00:3e12:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84842ffcc36mr985406b3a.32.1783488762953;
        Tue, 07 Jul 2026 22:32:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:848:2ef5:50d8 with SMTP id d2e1a72fcca58-84842ffcc36mr985325b3a.32.1783488762180;
        Tue, 07 Jul 2026 22:32:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:32:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:41 +0530
Subject: [PATCH v3 02/26] init/version: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-2-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1541;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=biMhvzpDIK+Q+HwprmIy/ZCCVhqzt5rT4bfWf3Rfits=;
 b=k3O5TLngHyIRrBNI52+BrcUxw3xmjpVsNzhWV+7yBVH9wpmKpORd/vbLo8LxRWzzPpOJi8dut
 RJ4Kz16BlfeBP+Oj/O1AoT7PAHbGUl+ejWRIaB969xrnlumEM1RZh3T
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX6xxStZ6JsciI
 n91T4nUq2L2Lw0AV54jTqJCsDV7+W2FsGWBjaUSv9ZZ/+BU9oDbIk+HIWtGby0GDlcn723FQBMS
 E4vd/s3XrXwJL8Gvr1qBhn3YpytOH1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX4jsgbLM4IpVV
 bIF34RBYKfxo1nqRQqqDCX3keP2Z/ybtJEjC5OjAAVXV+WudbhVJKrE1d7hSFKmRpFCqDBSBCgY
 GuTvvxRPWwvmaVgbKMTODnEBL/toYXn79MfCk72iv8WzdYnwVemi25EUkJeLM5EtMZ7CUDll7Wr
 yDos4lOaneQd90u6Rgy9vV2qOT66guL/wU0Vg1+6qGS7d6dMn2c9R6dJ+RjuxnIxaGlQUbUqGc5
 fx5IG4ZBZEF4yUDNQYv+CLH0GK7NKCJV8R2CkD69ZVAGDLex4Gy22lrQDx/1uTicqqumVFMzTwj
 BVA1+Qcn4Bttke4j+rrXfF59/bQFKhAezn3meNrviwK+/YVUS93ALm2q9zSqd8TRqoAHpk4/blb
 CnhHfxJbylByNAYrD/NF3UafAV9xML0aR2S1gfBQSTEbhUIywKmqak+haYN9Ic+TQkMAl0F/4nv
 bIN+Sg9XeHn4WGtRiIw==
X-Proofpoint-ORIG-GUID: IvQLPw_RFWaSW3HuTcNkB5Z5vxVmVhPp
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4de0fc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZVr_NMlg2zHurtFOj60A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IvQLPw_RFWaSW3HuTcNkB5Z5vxVmVhPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - init_uts_ns
 - linux_banner

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 init/version-timestamp.c | 3 +++
 init/version.c           | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/init/version-timestamp.c b/init/version-timestamp.c
index 375726e05f69..37bdcdd443f9 100644
--- a/init/version-timestamp.c
+++ b/init/version-timestamp.c
@@ -6,6 +6,7 @@
 #include <linux/refcount.h>
 #include <linux/uts.h>
 #include <linux/utsname.h>
+#include <linux/meminspect.h>
 
 struct uts_namespace init_uts_ns = {
 	.ns = NS_COMMON_INIT(init_uts_ns),
@@ -24,3 +25,5 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+
+MEMINSPECT_SIMPLE_ENTRY(linux_banner);
diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..eeb139236562 100644
--- a/init/version.c
+++ b/init/version.c
@@ -16,6 +16,7 @@
 #include <linux/uts.h>
 #include <linux/utsname.h>
 #include <linux/proc_ns.h>
+#include <linux/meminspect.h>
 
 static int __init early_hostname(char *arg)
 {
@@ -51,4 +52,6 @@ const char linux_banner[] __weak;
 
 #include "version-timestamp.c"
 
+MEMINSPECT_SIMPLE_ENTRY(init_uts_ns);
+
 EXPORT_SYMBOL_GPL(init_uts_ns);

-- 
2.53.0

