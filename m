Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0530A47012A
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577738; cv=none; b=bbMo1ccAZJX3TPZk5nInnMvO9L2v5iMFG8kmrX1mQpbRzj90PdclhXckHLG7QdpewxFNQAJddrIqAOoco+m3j6yTYm6de9CJMXP2Q6vMi03MJYysyHmvbYh9gOygwggUngP0cqpY5rmtT2slp6WfgaJMJ4S1FaQVVPKdmJRJROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577738; c=relaxed/simple;
	bh=+dp9Vtps27IuWUP3AnoeGjUrH0F9t/YAsGiT2Ps0DtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezJBhko+ajufonxaTO4YAZmApLficXdaCy9M3tKLT/wqHQsAkVoK/qzSSSRhaGgtTOfgNFHTisOkCiyIlPSUSt3Wp9kQ2uG454Q5ZOM/VdNEQ1J6I20Vu/sL+v4Ikm4rpatskesDNv7ALoKwpOjyZJ0JBooRp3OEVD7RzfMm0V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YojOx9aQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOu9ItJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YojOx9aQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOu9ItJE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMSIv721315
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=; b=YojOx9aQmonhxXUs
	6qzKycVFk4bAjBdLEmZipaYboaKQWt88q/4+/5TgEQvkMXZZActak186vWiRqIUp
	cpp+RUIPLKXwjbXleKwSz8za+0LTBk167S4yKBTZRaoVGiFFq2QqnjefQSqkg6h5
	magLE5etM3/hOeOMeIg1BnnYPVclMDj7qTqGZnfe7AshOT12gzW/AI0HFQeaFnyc
	d1BhNqd6iGrSNBbfx1xM5F1kSm/9R5FENsfbU1ys1LE4ZX2u/vZ37fKhWyA0NpdX
	cBiYcUBv3GEK5KB91oxrZkg32srJDVnUsdqIwsONcXGGtURLgGF+bX0gbm18oCcH
	r5lQOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d3kp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:35:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso2704295ad.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 16:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577735; x=1787182535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=;
        b=MOu9ItJEdmthBUx+9mdpGIfjc963CQtD4xW2Qw5tFDFuVIlBb/DeLfjiOAzchSlIPg
         ygrtdB57agq0F8+Xg1uCbZQ9AB63IjsDxyrG+AdURgS5RbFoHK6VurkoDueZ3xR8fr/2
         +BuasQP6YY+Ixz0d4QAWB/816eXGebfnvN+/Ea0s2eg73b7e6S6R7iSrlRqOrVVFMtp1
         C0C5PS19zt0BQSraU/KCpx97dz40udRjxWVwlfZRri62ODRz2aKYs16Tobxm95SxxYlj
         Tca09ftP39kdiHydG+iFsOBeI4N6IUNTKtCCBlsiIH7RVSzEArDrXKf18iUh9rOzVCp0
         Pcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577735; x=1787182535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLx6LxcsDwB3ZjIhypvrn1AGWZ6LjrH8hIxTnjXB4Bk=;
        b=Lt1eWZ8Cx6vtVstF4JV6pueMUVglg1XXVGWbnyKQeZFAeAoVyAkm+0Rg3/b79i2Eqm
         WV98Cp6YF6Z7dKyhidp77Iv2D+x5NIAkHCwzGpUgOLRDOZr8tbQLPZkVvZUohSAsxCdX
         WthBN0Dh5w7cITgCZGZQUsI8P+tm/M2TDhoUL2VbB1OUSrAXBh5fMmkp+pJOc6EAEgUC
         iQC8hzBGt0sHWh4LAt5Mj6tSK7j9YqYh74GVMUbyv6mWf+VdpIQrwREGEtv3aJkFyzdi
         FGkzBQyOpUdgEbPrn3M3BHQCy/yL5TfITgntBD2csB9WKs2yaQuSGVUJxZ0pdyhLOfE4
         UVMw==
X-Gm-Message-State: AOJu0Ywjw/YfS4lIZj0zQ5/VIbnbMb0k7pdrRccjkopJTUqkcoAQc4eD
	Fpx36lNAmzaacVdQ/mSydCTlbLiv5Y93unSSuYmS0ZVnD76gt75Ti/xqGirR0YbiVOivZnt5qmF
	+dx5voGJrvSUxvtzj5eVfNDOJk+qENAa64Hm0tMAN6cELJBoGd7ZO64MtbQ50zRo=
X-Gm-Gg: AR+sD12T9BkjwAxXqyRCrdJhlfiqNKWYWNL0vuD1skBedg1m3zZGcHvEvx1qjo4zb8d
	ZAW1hkyn0//aDSYFiLtSFhB4Sdh1VNyW18eg5KTO/20GxRniL3+UtB/TguxVQLk0L2Py/pyNAMa
	q3RUqb4pP6WskWo6huOeSdi/StLPi5BobypqkamPHwgruy/hZEnjxOMdrnYQet9o4zghBHWiBcW
	u1DCOB3hPLaBV4CgB2sjbREVfmAhNqidBleI96sRS+lIf9RRRK/AQOTR+/8tSHpOi+stjJACYZy
	P6ECx/r9migNkPxxjOnUnIC11/ADgc05RiCbW5SFF3/WFHE067xwMgJyWAlOmA==
X-Received: by 2002:a17:902:d2cc:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2d37e855129mr13704465ad.11.1786577734756;
        Wed, 12 Aug 2026 16:35:34 -0700 (PDT)
X-Received: by 2002:a17:902:d2cc:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2d37e855129mr13703945ad.11.1786577734295;
        Wed, 12 Aug 2026 16:35:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:33 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:51 -0400
Subject: [PATCH v6 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-5-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6883;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=+dp9Vtps27IuWUP3AnoeGjUrH0F9t/YAsGiT2Ps0DtE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZtGHGjGn45+ZfZUUtp/T9rgyOard5u8NuS7v5Xpq3
 C+LZlh3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwERWBTH8jxTsX6fpeUG6OqiY
 s96jVm+yWoN/uL7RA4GuA+4P7qW8YfhncLre/61C3KsnPEEtH5vWTd9yNPbZw9AF01i8FFfXewr
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: 4xdNxxGnm4kY2Z_NEYEwjbGTIxpImZfA
X-Proofpoint-GUID: 4xdNxxGnm4kY2Z_NEYEwjbGTIxpImZfA
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7d0347 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX/3kx/8aqo2ql
 gCoQgEnwXIIL7gKIyqk3Y3fp/uaEq4KVE4IuGlhoOV6MdqArhmwlExiXP6QVserTbpMCjLssJFJ
 vEfyPyADzXY4HYI8aQjGpTsou7EbQV7n3exNyviIobc0VdVt/pHz8O/KXGSYooMqiFzsT9Jc2ym
 bRgMZnxzsBOlohfZIBFqANdl5XIRkXsKA7b02q3cAkCTH4W9OKGg+g3T+VpLK10Ps16wS0Hrl+E
 x3nyg/Kig0PG6nkixTrZNQUgkFVHVxoaqaQn+zkfTAgqGvWYr6Sy/rdAKGIBpFC8AmWDuy37TPW
 BQyL0f9s2WsKQFjf2SJNSaodPL/6/yAeMO4HETHO4zwXK8vL2fN0Ygd8YxjOf8QZhNij1gbZZ1n
 sQnupWpIZ3tELm8NP7TmCr5em2NVr7OGhKNJILw9YbLe2OSP4yVzTpGBf+U/YZUqflQC1eP0lJg
 QZV2OvrtVtJ7XiymCXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX1wCzolBuXa9Q
 4q5zGpdswLUk7fYTLcPQaRYBgyfbc+qLN1jV93YEOGKkN3Pxu83NLYVDHAS7Q05/+XdCwdLFGm1
 JUD1idBEURq018PIqKwaELetXFsX73w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..9a03b72e271c 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -35,9 +35,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -76,9 +76,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -117,9 +117,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -158,9 +158,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -199,9 +199,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -240,9 +240,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -281,9 +281,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -322,9 +322,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0

