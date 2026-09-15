Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CF463B96
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456626; cv=none; b=HRMbrNm+6VkWoveuIIAhPk7/3BXAX/G+Ji9dTatD1ybEFYvhwIueQhOse1IWscVBZRlPHqK48sHCc1qh0MTSFU9Aw3gMBXeMtuwq+tB4cUrJ4AwUom0ck0UfUB1zdl9mVUh4fYNF7DWAYS353bWkOqm+kV+zkHJei2FQt0eZc6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456626; c=relaxed/simple;
	bh=eLTEdh5CFvwbPjheikZKqnmvnX76F42E2jbZEEV3dzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JOUUtl6YhAJ8tc5YjfAHnGsrZ1H6+MTX/6JcbpI8VvHFpVlA+WBWtMcI+iQd7cHhSyjWNrX9rQINwEPwPlKBsbG5XDkpOASZ8hECOEZQs8Xd0sLJ5+CMt5nff73pBhmxsE1M2vJYPaYriaYSycOlxpfTbfR4n9wy7QKeCSYVz/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7TFToeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQ/M4Zvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7TFToeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQ/M4Zvg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Ze8O3126427
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=; b=h7TFToeBWimVbRuK
	QFPpndcbP6SgGwsJyKfEaPXsul2JrcVBIcNFDWAU16XnldGTBc/GnZiRK2vnSLG6
	7wwbPz3Wi2NAWZJWM1SFV/31iEand/ozc9DpAHEuoJJJiq7MoakcfNWWz4F/gLkw
	tPRbOx/qtbg8DYZMg/wdPXij9j5fRp9/tM8DXvW4qXY4hLE5WWDzpFPNEGSshlNW
	AB+Yt4Zk1gDUeT3FhDXzcABfz8gDLhqrmO66IAkBcoOvmIjea+R6QT0P46JWH03a
	dyXCdgZ4Qt58mXkX6gF+Ff6/kXnNy4jfm3r/JmOgM2kODDnJXtCHhW6kcb37OFiz
	r+ohfw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9u1wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:16:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so9301302a91.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456618; x=1790061418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=;
        b=LQ/M4ZvgpR57jNWyTZgrCZZkiVupi49MzN3glQGMLrxc4it+hYeggb+GIb0TnXDRqY
         8VLrpo7FY8nt8FUMehI8cRkiuaNBG/ndNTfv8OS5SXD3qfvHa2/Ble3NoD6ZhTzX0qCa
         WkrI11A4MA3IhtY6LXGl/GGAwEwqAjzsSoCfyQh+psCwpOhjVIT1l4yLyIcmffgxCrMv
         ojB7p6H/Ab/DsbJ6LFeqGqH4GE+qD/Edx+VeaAgi5K9vxrVD3awGRurZ2dNerPnCzDHo
         zgq8Q/l3ESoBt4eE8Woig1V+Az5HwnJuDRmvQBXd50U5KxlbWG2vtJRDUT62FNEDFfbt
         X2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456618; x=1790061418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=;
        b=iRmE7QvYapa+b6EZuvjKjgTXkPgr5DHtGO+WToV9e9r7KCRboj+0CTyvSJpmhvmyK5
         bNSJIggqEEQ37NKsGSBqfVuxr6Aet5EzTHjK0GOVMd5EV6yZEKjl9bPA3US+Hwrc7OOI
         nneSK1eobN2i5SMDDE2WLC1w5mGrZWmaBVPMvXunGsdPQMt0n0I6AQSSAHTs2wcN6bJK
         tm/uPz8cFpp61sb/wOjOQwppsGEQC986JBmKVCZzgBvcFZRW0OmyKNDExMgU80femcHz
         /o4ksAGxNAaLF32taSrgxBdW18UefSY39FsFg63ly5TrY57drrM3WBT1oSYWksJInIXN
         0QYg==
X-Gm-Message-State: AFuF++mHJUjvvoSjpznCPLFTmxkbXiPp6L/u5dHsH6AwNVRITN3UBSjD
	umaPdSWhXHxY8vES8K8dc/ddvwGz6YIFS6AS80n7as3GY6YPCChOksyNMrjZKHU+mvDasKmKUnW
	zGLo2r6DKz0/QcCawq/aDTwm1Ju8XAKB9v0U9Si/XM7LlkCm/cMKpocFql9YwvW8=
X-Gm-Gg: AYBFou3JKaJnoQQeL7h5sDPZkVCeiPP492UMBRtzNTG1gMDY/TV5D5T2v2kdeuOFNkj
	ZIaZm0xJhtFuNrawvlPCJoK4I6XlIpEOS8/Qs+zitXwCb3dGRh70OpvWdusUiVxiiae2jd04lsf
	W2HrITwjy2CFq62KHu2vpNzB+uEMrVwhIExCdjfGZq0ag98VHhbKp1Wrac65zs3hOqkIwcta6wx
	AIlgMLngyUOTXiSjUtboHvzVPkfSHMFafYc3PrLKKFhNnpL/8R10AZsE4ZnYvlM2Qn8QFuWDMFi
	HMpyBUcarA8nnevelQSN3o66k8wvy7R043w02jIjkAwjXsD2t3HlxMX2/DZa
X-Received: by 2002:a17:90b:224b:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39dec09a541mr11810754a91.19.1789456618108;
        Tue, 15 Sep 2026 00:16:58 -0700 (PDT)
X-Received: by 2002:a17:90b:224b:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39dec09a541mr11810682a91.19.1789456617515;
        Tue, 15 Sep 2026 00:16:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:57 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:31 -0400
Subject: [PATCH v7 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-5-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6899;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=eLTEdh5CFvwbPjheikZKqnmvnX76F42E2jbZEEV3dzQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bcmypqkGf20YnN82XfLzHzWXatfrZ3c/4/mbBK7
 bfwhsKmjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIq8kM/4xcN083UvR7p3P5
 35s7b14WS7no33dp35ez4dLNLnnl63EM/yytdwRN0bh8Kd42Kb7oQUhK4A6Ov3fjOpmrGL633XH
 pYwUA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8f0eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX/xZUbBLgwLS8
 PSSGoFFD9tIODTAlskFZj7y7TYIt16mI5774xd8jT+ohW9O138k1LvhEujMZ0YO1p9ot1DjlqGN
 5lLHlYNFImi3iRrv2fLsZJ8w/8qdf2Uac/UQPrFNuTAaQrNWbbOeOX5OkMXL1yTmoXm7TKsYN9r
 qBQEcQHzuD4JEgQI/mssdzjqKe7DIOCRqUZqf1dCZ82yfpUTmT9uLKMR9uSjyNmB19rr7ZUOAhL
 Ftc5DdMB3Vj6aAI9as2oZrGqLzlvZP9dhxD1QZ7LTAdS5Y6D1/yHk5t4oj39B30GqB9v+mJwCzt
 agheifNAOOBh3760B/xdR7hqXeUZdWwwTgPs8onjr5g2MMc8yC+0lhzIzUroFZ6wR/XjwS+Xa/h
 8Hij8IRBDPfgcftsBQo3jSZ8wa16vDaNrcS0lypWT25UK0trKpDrWO8EagxV0TGzDlSNnk3GANe
 dLB42iBrbsCmWjDXsaA==
X-Proofpoint-GUID: GBnrx34F42Shqnv8LWh01ua7Sbjh2Ja4
X-Proofpoint-ORIG-GUID: GBnrx34F42Shqnv8LWh01ua7Sbjh2Ja4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+I9uhWkOocd2
 MCO5DDaYrJWtLNoRfd8uUpnbhBKN+z67GFs16C+bES7Y9b8YZoPBm3rzOb3STJ4JKigirtYh4sX
 x+K5jtZpb5Bug7AEhtPqgGP6u9ie2qk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: No change.
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..799f0f00288c 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -38,9 +38,9 @@ cpu_0: cpu@0 {
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
@@ -79,9 +79,9 @@ cpu_1: cpu@1 {
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
@@ -120,9 +120,9 @@ cpu_2: cpu@2 {
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
@@ -161,9 +161,9 @@ cpu_3: cpu@3 {
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
@@ -202,9 +202,9 @@ cpu_4: cpu@4 {
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
@@ -243,9 +243,9 @@ cpu_5: cpu@5 {
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
@@ -284,9 +284,9 @@ cpu_6: cpu@6 {
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
@@ -325,9 +325,9 @@ cpu_7: cpu@7 {
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

