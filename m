Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4139329C7F
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173881; cv=none; b=f7FkvrsYrNJS2XbuGAtKtbf3VaWrMjXqztoM4KzNgtUe7pFRTNsjEDNP3+IDtPLIB6s3IcSoSEyT4SoG7iIZ9qhtnq12L0afqQ+YkEIKwrdUr+qkbjIBZy1pyptW7r0n5Hz3zk4JYPURKoEb4hV0QzzqYYZUiuTlCbJEOBNrkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173881; c=relaxed/simple;
	bh=ug1wcCRzPYFk9IAOWMuUc6kVL0dAY9kLZVyg1dl3ZxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVtGG2u44MRx33d35He2q+x/vURpINYMYsVWfp2xPG3SFWegbi8v+P9eHrsfF5ePJIo7+00mTvg7qjtteoy0VBDrq78URZYHtunwkvU7jdP16cfrjndntw0DX+TsSiBxC1RlE/ohpOpGvhwR1LcyzdwkiLBzzGW8F+ot5VpZl5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltPrFDPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9Y/Xkdo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltPrFDPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9Y/Xkdo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHDQGp1574238
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfUV+gBEdHPcOo4V9gaPme4dCYACtyl7032fIDcKRTA=; b=ltPrFDPpBsvwp4po
	ad90malbUSCAVb1F77szLolF5CGbif8xsLCMrHPQ395uceqWccxjjS731AmtNcZA
	s35yyO+XxfA+/9ksW1XEG1SZEp8/x90VJsvDurZvg0w5K35oxTWTuBitgb0rQlxN
	jm815/+ebhvK6V/FnI7Hl3iAjyrgOcIyWjGA5OndLr7U1uoDwcObVsxWHkBy49pe
	ijrlD7wNCQLDh9J4i+76LgLqSYK1DiABrcBtbo2D2HkuTUnNd6M+qALdxFx5fz4+
	KU/YVzFef4M2F1sc+1Fuas+IPIKF6mtUPu53zirHUT3TSA+QFU8S0VT5isIfdIXz
	dralag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk8npw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:17:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8298150caddso4552700b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173879; x=1773778679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfUV+gBEdHPcOo4V9gaPme4dCYACtyl7032fIDcKRTA=;
        b=H9Y/XkdoYSMZHUA7g/qReLNyFtYHKZf7qfvSLjDVPVluho1OOOnihTIZfdAl/UuUdg
         PuCp87ZIxhv1zgQ2V474ojA/DR+tDS2270FKRQqpxz2tZVGpTF7mAV1/4QHJZJ7lPizo
         zLj3/+nMkOYwiuNFOSKyrLHvpRFbp6/6coH6MFZYIq5TMqydINyswx0P8XEJNZvwhHtg
         +QfujNBXWwnKWIV5S1om5hBWRwsr1z36wAWMWjvJp8fP+Zl3bAio7bjxMSnKUlw7B8NC
         gjuMDAgRTlqvI4K5oXXsPqJmQvWYv8W/QnaFepyfGRcPvrEFo6T5ohdPCZOu5mHzqHA7
         n4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173879; x=1773778679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bfUV+gBEdHPcOo4V9gaPme4dCYACtyl7032fIDcKRTA=;
        b=wSuTH0YYz5xqBjdtE06TVdNbWiB4llcsQPAs0bs/lORhm42jjDDmvyOPOKRmXYXxpg
         6cTf3hh8/srsNAJPmyXWf+dbwLG/wpcdClUrUn4f5tBUaGgh5uIaEhoem3+pYIdUHiip
         U4+3vACs6SWTLfwdIEsfV1Y+zGEbZUb71mytEW+XsN8gnYYvWU1wMNpnap6P1FogUNUF
         UAXd/ByTp7FhZHP+E5u88XOXp5lEumtPQibgJ6Bx7khuD1rQNMnibIIOvbTOt0QK4EnI
         +ny980wV7Odl6fZoQJabJI9gkOZzu4RH8co8PYBoQZDJw5bxwa0wJ7lkT1pGqPBCZWDf
         1hsg==
X-Forwarded-Encrypted: i=1; AJvYcCXdi8netyRfAu5mLoQM9/JG27lXpbktwuZzPxiMxA++HYDvsxdHJsjSc7q2O26AYXb6vyjpjZmUTmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/JlW+S3vK16Uk8AocRxUqf3xsbmi/einZ/hCHcRKfgpbvxWQC
	7TphAEaDnA7WQ5dFFhs66TwDQZM98FyeDrmiVT1kb6qSyopnGLvWWPDUVdDJIF/Gmpv4SJVd5L1
	vKt1ixzfI8YmGTc/Bz8cMv14KuhRriNsYQNy86FhPOpHU4767aZ7Xcfb+ro3wRT4=
X-Gm-Gg: ATEYQzzgYm6A3LQHLi+JdQPnrGxYj0BheBtiw+wsSVMEkiZ8kPv6VS/qiD9MLRJ46aE
	6RH9XFVjIbIZtjLI3/bvdcuFSw7Rx9LGhWyapWO/TNeWL0kUyINUpK5Ikyj6hhiSLGprL7kR+nh
	XDMA4Sh0WY0dDoBpB5pGiooQyzSsJJI3gzYq55ZEa41RXrVjuKqgAVXrIqsZdPit3NKix0jkTfW
	VWnxYVhVf7tmIPHtB1Zlg+I5D8wTW1hX0/EsG+1nzl0i9LqWldcFsZ3vxZAiOXSUZS39jBna0ut
	3tyBNBvumPvhVScqMn6Elg48UpQ0jufR7PlPIyTXIQJHbIR8A9C+Ojf0mBm+tr6bOOk3b0e7TO9
	Gmxr0NUdjZB+kPgf10uRVXhb9zkddKXwikYnV5K2RDlIRp6rJ
X-Received: by 2002:a05:6a00:4503:b0:824:9451:c1f5 with SMTP id d2e1a72fcca58-829f71970a8mr146606b3a.58.1773173878750;
        Tue, 10 Mar 2026 13:17:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4503:b0:824:9451:c1f5 with SMTP id d2e1a72fcca58-829f71970a8mr146573b3a.58.1773173878123;
        Tue, 10 Mar 2026 13:17:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:17:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:51 +0530
Subject: [PATCH v2 07/25] kernel/fork: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-7-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=954;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=tIrpoWgx8SQ0AJN4uKOz8Q5k4KFIipptt9Oac2pyJ/g=;
 b=u81ZD0X0X0SI+khpkrPGcBBxMXVinSVgpb28+k/sEaIN8k2yywYYFp73LfCO2jT2lgtl+DXbZ
 rxxNXkcBZHpBttjt41FiCwlNIOvPQKsMtMaqk/XFlaQv/SJP7SYKiPJ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: oY3OIA9voxsRjpaZqKiAdZlfCo6qM4ma
X-Proofpoint-ORIG-GUID: oY3OIA9voxsRjpaZqKiAdZlfCo6qM4ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXx5RISXVMlfMy
 /oie/LVkxauQjpF3OFLurXkhgLHTbHmKsVUVv2QfGkH2u/EGS5+r2g3t64LgNpjNu+cU4I9i/hA
 h+DGIlhtpbi4STbsGGJyUjmpk/iSX9RmHS1nKvPOXJ3P2kY/YMNbrb+jrLi6f3Gza5+nW4R2qSU
 4fDWh06KAGJyEScyAUWU28BllQMi1En60IjvNf7Pep/NMp6kAUkK+3uWMwcrba4K7CQgNsM88hg
 PiRPamtKRqTcCbpLtPbIt1TX9skuprVI8PvOtOnUoekinF3wUoeeDOoW1iNp5ANcVpY8a5sNlJs
 9TQvTuoGs4lRbmYG4c5MkYWwMxPaVBXmnq6nZSg7PeNFoSrmU54pfkseiKcHzK2a6vxMIimNGQF
 7cuFxnAnATmn8F7t7cHfLO7CCfLj5H5IhnG57pO8WquaC3UUY2nC8qGAvTjsbd3KQcg6Nlzte40
 dG9Cli4bhXRNBV2vK8A==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b07c77 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=A5cnksRAjNInYuj8VG4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
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
 - nr_threads

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/fork.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 17d2c2a9af93..5f20b6250259 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -108,6 +108,8 @@
 #include <linux/tick.h>
 #include <linux/unwind_deferred.h>
 #include <linux/pgalloc.h>
+#include <linux/meminspect.h>
+
 #include <linux/uaccess.h>
 
 #include <asm/mmu_context.h>
@@ -144,6 +146,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+MEMINSPECT_SIMPLE_ENTRY(nr_threads);
 
 static int max_threads;		/* tunable limit on nr_threads */
 

-- 
2.50.1

