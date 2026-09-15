Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5E468C29
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456630; cv=none; b=plvgW9F5Ix15FtCiIvM4vflCAQY99qRY6dNG06EfJAlicrCTDJjZv2j1osfpSbBQZHHbmx15xKT5hy21WlMpVQAwH9de6xIoeQXe1Kqzzg6o3GiVMqMRYi9efutZebbB8h81Z0qtRtKp+p/jhqL+VuVTZjM2OvtlcWej8eeODkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456630; c=relaxed/simple;
	bh=/bdHVT19+Gg3CIpKwikMFbUnLqQOlahzHepUFXFmpKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYGj1Du2ji4mjbY8R4eoudyfQEdb/vtO3/sU1IFs/vcqLFruzxrFcFcyCsBwLZz/yErQCfLhIHCR0UfKWoplIB+4VO//4vu12xAzrnAgVuOUDqZE/HI1+cRs0556ojqlGuOEWRom98NdiLqDYTeOl0YJl13BRj26PY4gTwi54ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9GXO6vF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CslJA8yj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9GXO6vF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CslJA8yj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZNGL2983817
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A12QGBXThDHXy9BHdQjUCypSnvxRfAI6MUwDrx/7tNw=; b=d9GXO6vFu7CucDWZ
	0lxtLdT4AErXo3u3joBcOp4v7idv2k0bs914FxscUfsFgcZdbJEL/CUISE88od/F
	kK90OmWBZ9bGRk1OgO+hq8v7joViyzryV1i6F9xetmrhL+8av6WT4aM1/sLyJWvI
	fWF5ly52VrwkopcnRdueC90ouiBdBCYgg5WS9WbITGWB3YhtVtED2TIcXFvvuiDJ
	BQkU3nh4aQoE8OzlBfqh97VBeenu1vQiqlSYCOji7F0lXnVqGQqFRDa0e9Clq4CY
	LFcGp0BjhfmHKPO/RVhazf4bg77TFhRPV9tjPUdjQqc8BK5Gw9h1WMBMFG3wpmnX
	5xKQ5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet2xmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:17:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso8010102a91.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 00:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456627; x=1790061427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A12QGBXThDHXy9BHdQjUCypSnvxRfAI6MUwDrx/7tNw=;
        b=CslJA8yjQzSUk+ZvVKQrhwc59EgdrXG2svqHMbpm5Ib+0P6Q127ALK7rkhgg3a7ApP
         Xc7yUWqvWo0NdFgNyCYJi01b4l0p3nlnDLXOa1sxCdljkQCepim0JnLhcQvpKEozCYes
         vMNZ2ZYqV0dPNBgK+yJuGjxQyh0jL3Mm353MMhSBevu6cYozCiRUdGNKXZVQzcdFedmj
         vFz3H+TtdDcMCuFH1fOMG0J7nCerS45pTF8Fv2JkJK2zFZVhKiNVOGGBDK70KDTVjyJ1
         7enDzQg7Eb/i3Nlja+hag0/EYMnt1BSjV2STUykqvHh1d+rmBAYKzkuVdV9qPfRTIEmL
         xRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456627; x=1790061427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A12QGBXThDHXy9BHdQjUCypSnvxRfAI6MUwDrx/7tNw=;
        b=QgvZdMwZSJAB0eKrijKQdS8LhVZ+akXWunMrBSBVNyU2dwfKOVwb76e6EkduT6DE5O
         mDx04UCyqCwMeOBe4HDZHf65QIIMNngLZrcgBtD275dFOqtszu2g0PLLCAC05q8NUgJe
         bCDNRAVr7+XTHxW4PJo3hmeNbtGu3MYX1xGwM1IYqPFnYgNoDJe8mrRi/0MQGun1cVxF
         XNVrGHhKe9flUzjB06JllCwUGrmXmrIenDlMytkxdUDPJS9Iw8gXrm8BnoigygSqHrjL
         0NUtq+vXs/MpWf/ny51G3xByWhqProPXMM3Gzbj5Dwg7RBcomohB7xKtsjDcqf1Xe2qW
         f3aA==
X-Gm-Message-State: AFuF++m/KMpbfbdYMhpqfc/6B2FiVN0fUpsiLLTpyJyOpdCY10CE9orK
	HnSVMMWd/7L2+QnV8jvPui1ps47XJnnoAgwQSNOOUA7qFcBxw82+j78XowfgwqHc6luVj9ROag7
	8XhgJprapdkvVGJqEJKE1RcUhyentAsd82a69/C47J2xMRC0/cQxnlU6Bz9Yq3cQ=
X-Gm-Gg: AYBFou0IoY1aRTV1guEUPfjm6zXTfiKLqEyOjLdZNKLen4Re05voSbV7ylqC7uigubt
	VQe8y6zuBikWJvMKLg/XD8Me77Qm2aDR13MEgg/FaZkS31i9pnJ8oshdbhrSmY5c7XB7uN9xuQg
	El7nzyUstP5SDlp2LS6y14VFizWg8W8udTJ9WkinwYOStwn2iTHzY8mQqmhJDPmlSBEQVDnSG5b
	3/16Qs4R+WwvfHYKU45gI5XnPbH0PPP3ixyOXe0SPkjs9LChS8WYg09A8RmwYqVA/sAwd2ED65h
	nknoVk4KPptMLYirvPNtdKVwaqnmHyOcj06+3HErONQRb9T/A3rRS0I22YLJ
X-Received: by 2002:a17:90b:4d07:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-39df6a66122mr8234773a91.3.1789456626574;
        Tue, 15 Sep 2026 00:17:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4d07:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-39df6a66122mr8234683a91.3.1789456625915;
        Tue, 15 Sep 2026 00:17:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:05 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:32 -0400
Subject: [PATCH v7 06/11] riscv: dts: spacemit: k1: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-6-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10167;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=/bdHVT19+Gg3CIpKwikMFbUnLqQOlahzHepUFXFmpKU=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7ZOvR11rk9k8deL1q+SHq1PE1FuLF/sd7j3+pqKD
 q2Js/oWdJSyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBE7BkY/un7p235fCFg3+F5
 rkV7LE/xTLoUaRWo7/TX/9b0L25cIiUM/4uaUhzawtb7XA7NkOA4laH+e8mfO4V3lvp4VV3f0H6
 jiAcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+ZHynZPr0SRA
 Pbc6YpEPCTNYODW3x4UI4GwuKHYntpGv4rZf5IbbVjFc0v3DZ2lQ6+dLWIzo0IF22/KQtAdMkn8
 C5gIsHpVL8yKllLkOzCVaFUrGbT+We4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX7NPz4IM1cVeo
 QtR8BA3fft1m6q4RxtrR6pCSg0DqXEGSZgDcEk6QCzGPw6O+L+9B2UxOwUKjYCLMrs2sjLlWUwE
 Q1aglgtvuDQYZQF3XZWekJ7G9+/E8U5CQUSVhnadtouMEZhL00htd/xuzylYCwlzi+wuriH3jLz
 t91NF1RMIGWInSPuK1FkTs7kCSA9gbxqQcVvP4ffJhVrO2hhp6cqXYGgdReSuZjZLJFPO0nHQw1
 FlQ5KVAn7Wx3yNYQTtU+y9GmGjQOmiGCjtt2I6/sMbkrNQ8WuXo3VIdlPcNRDNWOuf1tP+8Wk5e
 Z4PdOVvOE4zb5yBd/98wvrvIwKlTW42bQcgc812ox/w3UECZflqPgk00EZ0zbPEjZBimTjUm9g0
 KwwdIiD0nj2Zy1u+BmuNleGomS3gEBydTpz7kBA+XAlO0S8fj+/KiD5mmOQn2uvmndsBJoe3t2m
 AuTyoZVvX9PwZgXppog==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8f0f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tnVZVcqGRelvdznDbj8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: LMldu1497ZpnxhfMgF_rKe1t6tDWL9gU
X-Proofpoint-ORIG-GUID: LMldu1497ZpnxhfMgF_rKe1t6tDWL9gU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

The K1 X60 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions and in the deprecated riscv,isa string.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: No change.
v5: No change.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 80 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..542bfc0d19f5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -57,12 +57,12 @@ cpu_0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -88,12 +88,12 @@ cpu_1: cpu@1 {
 			device_type = "cpu";
 			reg = <1>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -119,12 +119,12 @@ cpu_2: cpu@2 {
 			device_type = "cpu";
 			reg = <2>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -150,12 +150,12 @@ cpu_3: cpu@3 {
 			device_type = "cpu";
 			reg = <3>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -181,12 +181,12 @@ cpu_4: cpu@4 {
 			device_type = "cpu";
 			reg = <4>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -212,12 +212,12 @@ cpu_5: cpu@5 {
 			device_type = "cpu";
 			reg = <5>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -243,12 +243,12 @@ cpu_6: cpu@6 {
 			device_type = "cpu";
 			reg = <6>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -274,12 +274,12 @@ cpu_7: cpu@7 {
 			device_type = "cpu";
 			reg = <7>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;

-- 
2.43.0

