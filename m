Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA73E92A3
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173806; cv=none; b=qxeBs9i1rHrsichdSor8G8YL7mGob8iN4ADwWsk8vKy6e/LDgg0H2Vky/rEsh8C1HSbS9kWydtxAOaXXbnHn0TZYTXb1SXTr3TGOXRt9RQOMyk6LxjdV8u11+B7PUZMp2JB0LrKNyp7JJ/D/wCkIEaM1oFFF0VdpWUUK1tAmFsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173806; c=relaxed/simple;
	bh=/xVBlIexoiOw17+VSL96A86GGoIfbwPbVcOrCndryE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsmFfFA7katBhx/2XZszpQVOLd+mkS1BQPpyELEa+pSWpyv+omU44/FG6phAQmJBJne2KtFHVzlXSB/EVRF2yPeuyMsKGClakiUmpjTx/hRjN/qls0BXQjnb6fzvv0dIsIXGU+FLPY1QFxeWV7XefhbORM5Ur7MttloYt1W2F04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwXlqLyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyA6J39w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwXlqLyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YyA6J39w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGAfes1265813
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTX4p31kM7kOnEUefU6ccwARTUTvSilVWBmwn4s2oLU=; b=KwXlqLyunBOJBnaC
	9wTPeZY1p89fm9likNFkjIOolZGYigd4493rDSGio0Op56iSgADiW9tkmHS93DzZ
	Z4dl3kYK7EjYBQr7qF5Mwz4WMuEu52mgBz4R7wcAfeGzA26nbuhKhy1odSdpXF5K
	IOPLF4kdehxHDI75rew70DYRGZYgWX1KqCjKFVGo+O+MWeYEYdrDFGDwWZooXr+/
	R3qUdx6aW3a6GhAgqL7XEbXRAClq2wY0FQtyl9UurWK53k3N6n15pyuQA8u73CUz
	1K4KVoX2wmGYlqdjcVtdNJg7TSfXM+/x3wu36mRui73jRM69fdxknSj8BuhqU99u
	srEkgQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfgyuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:16:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73935acff2so2745334a12.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173803; x=1773778603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTX4p31kM7kOnEUefU6ccwARTUTvSilVWBmwn4s2oLU=;
        b=YyA6J39w8fVxkhvsORD8+eHaT+CPb+S9Mk7+hlo0HfZ3ge/gJ7Xlt1OOBuIJEPKNcV
         Mgpu5/Tw+Iuk/1NugzrwLF6srXZ3o3ATpN5b0+EpeoferVd8udcHn6B3gd9gdUdq0akd
         RA9AWnbMrqN3CMZEQuGzn63/szydRLu8Cp2SqTxkBLY4y/7JuFfUVo1aX6siQcT260cs
         7qX6cZZouoYt3qAdB+6atqmMfDTx84RqwIDVKS8HhTgzFXwPCe6j2nq/v5IWmAoZ44X6
         0QBAq535J/HvxGioDWKJP25dgcn1olJ7znkCgxVf4E/VnGwN7NGo6/pbqyvhMPPT2xqB
         c/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173803; x=1773778603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DTX4p31kM7kOnEUefU6ccwARTUTvSilVWBmwn4s2oLU=;
        b=YEgx3r+4EXwd6c5wwLvQzTIXQElhlukDfQO/Js14sx0JjLzzK9UDmJ10vWwOswYTl3
         mNtOQ3lpoTtizjQxwt/se7w8nOeIkNmFoPn48mS4L+IUT/dUStfwxMu59RvFHKpdB+e3
         +KmOtIIbkmu3RLhtctuXUp1jUtqqYGq8qIIl2mYdTznBQuNRvez8o/AI80Nc9/Gav1s6
         6HsrcpMdqt3lzxmLLF+ThHpBKv4Ind4YIJCHU1/KPCvz4P4Q6/FRq23kx1tpTiSFsvvd
         UK6uluDNwwf7b09O+JBZR8zepHdl0cz6et6NNy1M62ze+atx16/3GfR18sjzWPApvPip
         vyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhaATtfMT4WsFUm8MSQV39QVGPkqIZH8bxQ727x7J6z4Me4UotRT9U/oJ7Rb/Lp39VWzPD3YUqi/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuvB19Tfs9e7HvPTCwaTmuPXEEukBHb+ho7k3EXS0kuX7o07E
	w2kjviMjqJUllIvwWBE2VEHT0RnkzehlxlYT1umAx+MobDM8vSSx21PVYU2UItWZKFUfEprDoiw
	QbebwED7n5U6QYXYJU6QktbbH93mmo8AyO7TaqzPk7MQVBJeyxwKH0CsuRzoI/Qo=
X-Gm-Gg: ATEYQzwYIXnLlHItCW/hQAyM4BtSiW6vtOrRU3fW9pErh4/Wfs4pV5x2dFxTNn5TI7K
	clePxwPPDHdjR6xEbU6lUSsKz3dDVuXpPOwD5QK6JUjvzZ5bLxwOlkrKrQCAbzxQ6JrrF6kkxN7
	KFBqunajpYm/jJ3f2jbZDB4Gf2+t4BeEFtA1h+Taq/u0a3KQeCHt5gQqaYE3DMO++wYOrqweMfF
	xkLSzQs1zbLuagIHksQOUBS8OgWrwNQM4jt0P8fwDwD1d9BkbE1gn7tjrzw2DtLRkbr3WVSbjNW
	7ybU+lfBe5tlCr0Bsl4n2ZLStrH4Dex8qtIU1+Vx6SFGpq3LhIBjRgDh3sb8zUdgUig1eBm+jL8
	YhthixrwEjFQ+r6GeQ4Lcl9RclgOhZihVMWhs1vBN9lYwDIqp
X-Received: by 2002:a05:6a00:1911:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-829f71c2835mr119382b3a.66.1773173802627;
        Tue, 10 Mar 2026 13:16:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1911:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-829f71c2835mr119313b3a.66.1773173801990;
        Tue, 10 Mar 2026 13:16:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:16:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:46 +0530
Subject: [PATCH v2 02/25] init/version: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-2-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1541;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=lAwXJbujOmB09G6GZkxyBJzVpavSEwyrUE2Z7xn4ZiU=;
 b=0oYhGgbq1STEZ7k8JFP6TcqseHKDFSTb2lpqYRc6OwdRJclcX7mQ9VIpOlUuYgfOJpihrSniF
 GvMoFUpmXdqDtjHRmHcCfq12jlKK2hy1c3AQybcS1esMZcKKicnFheu
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: W8n-5kVZfZKA6xfbb1TLouwGnD6WjZ9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NiBTYWx0ZWRfX0fciXt4WNouk
 5hpkJSL8xxTPk9hRZ/2puydYNL/c6hylVnB/ViCdwlq9Ksqr6hKPnJRG/HAtgxgbw1qIx5rioy+
 7laUmsQ2SnRbCbhvlVDayLNC1LQLsY73zmG1yq5BOzyI9R3Uc8NAMJK0aJFLxLzWLp43m6Z0RM9
 PvhgSdkfgqK4jP5nfcK4Dfa8wBPpPiy8ePEGGw6c1om1h9lFuzB6n1JLMLkt5EIjqZeknitLRJF
 i8Z0mhgZzD8Iszce6bckanWkIwR2kxAs+3unzu7D0gPGa174EYZry2yDGBXCnTf5+CsNV06zR35
 z1+oOYa51yErrxlh25AoSckwODC6USXbAwl5wWQ4/VMeDbVjq/MrQSO7nA8rnueDq257pQgK1hA
 QPPQwxJNwhUM9EO/oOtGKj/7veWnwMoUFt84pVC7py422o87gj1gqZp0fTgxHgeZAOuxhvnHl1/
 hysaw7l4PvaV8b+hRDg==
X-Proofpoint-ORIG-GUID: W8n-5kVZfZKA6xfbb1TLouwGnD6WjZ9E
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b07c2c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZVr_NMlg2zHurtFOj60A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100176

From: Eugen Hristev <eugen.hristev@linaro.org>

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
2.50.1

