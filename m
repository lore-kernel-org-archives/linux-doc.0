Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728786;
	b=MEnfhnYlttSd5DzT3JfyJWNqMo/Y5tqcx3vL3aFRjT51dLCBYDqUkt/S3DtbLJX05DDm
	 QgrizskbDCqcKqho4SUIqqIalqpijBWImSSY/wk1RXz7VP0nYQrF34LavE1EayR7qawUZ
	 9ciRMEo4nAiSv81YawEpx+s2JRa4CZRUbPJ43JxhaARTR0T7UqMRpCwheycuUO6+J3yXg
	 e1jHo4XoFeKtF/+006t/qRwGkFUtvWIAcVpDG2ZrIP9idllKBrEcRgpclaBGQLG6Bbxx1
	 580AZ/sN5xYalpuQiIVEnwZN9sbksrE93wZzQcZm1y3FTEE6PAyREhimnEWTSbjM8wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EbF0/Zpd6D8zEuprgKoW4WGKvrtBgaY9AIO1Yxozo/0=;
	b=iB+w9he+q4WallqdaTRdCl7w7yJssbAmK+ElE5pfbJ8YpR0Kuxtd5/YZCgqFFSjUU6B1
	 s46FvwZzbP8Bm1puu9g4Ih56XVapn7PQx5epbwZbJH256rdW6lt/wQRWzj8oEv+xccTRf
	 Ruu3MeCFco747qJzu7LLsqXEDRhCSJSyE5c8bcyfVkNHzca1v8ATJDDX1CL5HFLotEuKs
	 DsZISzlhuvuZwiWo0V1H51s/KJN4MkVaTdfbkh3OFnE0a4vibaPPT36HlgcGw3eEBjc0K
	 ut9O444AqCnAUyn5HHan/Bjb/GcfOclFLmqzhlPWtupDwqKzEpZB8AZlSK8dEAR7zyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oalIg95P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d2uIQhjl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88533606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 21:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88533606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oalIg95P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d2uIQhjl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQK03H21715668
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 21:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbF0/Zpd6D8zEuprgKoW4WGKvrtBgaY9AIO1Yxozo/0=; b=oalIg95Pzq0SmhiQ
	+tQiS7aCTQKINNLuk2CK7fbzH+oZBTyW5rzTTNg4e+efRGOFGi0mwPJYCcdn4aaN
	hAQ+7Wm52xvAqgEcZXdOEz5xgy3vtWPb+Fyd3JlNy7ZFD5tGwZA7r+FeN52H3T7f
	3feCKIc1l97z91Of8BTZ0sNOjark7UBCSRCmK2SyG9IBHXVnL6KHcgLQFb/oWPf1
	n+Bvulw2fza341USRsMQm077cgJK/Y6wV08qlGLHGh9cvAqBSEC7GQ8b9hjj1zMs
	DXmVVZ9QI+vF7YZBQYPwCoGE8mvivSFCQU8snRjeCXKJCEmq/Om/sLlsuL1SCwLk
	4NN9wA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne2jqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 21:33:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so5794971a91.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728783; x=1796333583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbF0/Zpd6D8zEuprgKoW4WGKvrtBgaY9AIO1Yxozo/0=;
        b=d2uIQhjl8Fc0QnGZbLMyf+44NHKYxd6ED9yqDgOt15g1wgKYLgjq9Pk3ycNzUCLfbY
         6gCAQIAdgpyfyqFCUhRHiQfncqp8TmJ4F1E4WU2jIG3DGwP8jXPPqCNULIsjzqiwGE/0
         dk6Mx2lCaYCXwNw9p42sqK7JclCL0z88zja+0+qpmXqR6r0kfyiz64Ork9hljUzcaA9u
         lem3ZFSgLi5rSS1dyN9qdzKKG9ubvSVcdcJn0DrnUt5YzvnqjX+tLjv3e9rnEAnqwOW4
         VTFGolnWlO2sUlPM5FRsPvJQf4YLs5lnu96dr7Rh5hxnMkQeWGXuOUk93Bg5EKcycBe7
         ijZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728783; x=1796333583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbF0/Zpd6D8zEuprgKoW4WGKvrtBgaY9AIO1Yxozo/0=;
        b=hAL/NwqvMMEwSAVsHW8tB83qlPyCwNO3fn79iiQA+nQ9zOUG763dH/6vxM1gBSWSiI
         s0kx09wb2rcou1bxc/LfEU2ZBmwcUQv/U22qGlMmhGbta/GG+Dqy9UAn+lxE0a6wAveA
         /d19ggTCOAoxIYge6nnnWTC8LOmtw5n6p6waErcbuL4XZpCDxWzdVKYLGVLpDJ4Uun1C
         7Je6vZ7MEkaJglY82L2QHRKfdqt2LVjaV0tNgKPTPjAtNjSB7xl0z+8jQt/utu0gutkb
         rw3V3I1bz9lVYGiU7zovrEx0GcKPGgaT9Z2/c/ueqbmDEp9yxQrBbfpWQVffdqzpKzPH
         +oTQ==
X-Gm-Message-State: APuU4Z+DvLiv6Yw2IjodJvELGECfcfXTbmLcna7RY7KyDqavMkb1d79i
	awvAaMrOMwKvzyIpOmK1fphFmdYT8lG93/rUDmY1ai1myL6xa8+KKIZ95o37TdJj/9rz7uBp7h6
	LnOg/FaG6BcQFSv8BzcbSEXzBPtIdh07XWX9RCiLR2JOdVg7YCFh7x30RDB505uc=
X-Gm-Gg: AZFdTZcEUylbPaENiqapcsUXV4YpL/BuCW/qPgf9xxkGOqoWd2hA4hl0J1jGSwav8Wq
	tXpbvo3yVq2XHHJtI2hPxIw//OqQQeqkxutVS/k89nI4X+gXlG8F8DcL2JJm23cUnHNNwBAuiro
	qe/5kucY60YNF0HL35N4xZyXyPRsKS0W3R/X1Q/YRo1hYvVSduoYV2aiewd14khgg/LTpkip5j9
	AWtYzqEWQrn9eoNt2/CAHx+bVGw9j4K8S1o9TBZERD3253HGi4itPwfPWjO8wiTJt12lbE1c6AN
	IZb5jJlRaEey2l+iLy21YEbcn4T4ythQ+IJZFD8PKbXDIm44sxX8qGmGpsTGygdGy70EAx0B1Ki
	nsSJRPeylwx7nxC5sc+rZqnF+hivnVhOgYpxfUI/3qKz7mDfOxwXa0thjXmnyIk43+1MNr24Wru
	pJ/2yWN4TMSA==
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr20098467a91.26.1795728782984;
        Thu, 26 Nov 2026 13:33:02 -0800 (PST)
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr20098421a91.26.1795728782345;
        Thu, 26 Nov 2026 13:33:02 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm10988078a12.12.2026.11.26.13.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:01 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:29 -0500
Subject: [PATCH v10 1/4] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-1-bea130335fc4@oss.qualcomm.com>
References: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
In-Reply-To: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>, Icenowy Zheng <uwu@icenowy.me>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7858;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=lZWLb7/5VadHhSu6m/BnO3hRf+Bmv2pwYJHFTEmRVE0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpVU/BZnb+dNd3Yxvhmkten3k/LEl7zjNzRJEvt65v
 jz41cmjHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRwHpGhpfff84tcux5b7iu
 zPXb3K8/Y2adDpc+HPeYJ8JG2S5Y5xgjw/K7E9ymbD4Q9HbGo9IMw62qse/PLg779JG/R3R+iuR
 sPT4A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b08a590 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9qfSqdpAuJX0V-etOtAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX57PONrCvnRWz
 yMsovc6nJo7xVEHHz9zrIMnTRO2tH+/sJsdP36Ck+NhXuNkq5ugDbbsHeFNbeIu2xczGlXud3AW
 9beTDApxhGavPVlX5sDDRSj+SG1TjsOrU0FqiaioH1df7fOB4utz0d9HxMld2TN+Tw77N80903g
 ZxNY3bVqUSKAKnc6j8U3B00jvf1nmqFchGLDG0NcFXTsZ/Y8TvpoyR9BuqpYmUwdHijh7SXt/5e
 DN6R5YhKrYP06XPBKszRYgjJzLmlpcH05KMNFvqaXnkDnev/UhIZXH5Tj8tisOW14mX0mgx7z45
 JRmX1A2UEQ2M567rJSGowTqEXtSJBV1iER1dO/eswSQvIqng2xSOAwXyI13TxuJoU35GCxYEPtY
 wFNqwsp4kg+2J5cCKy/6ALgpTZ/xyiUDJn5EguWPZTDm3BvXDPjPySLwjAtn8HbLFHdwvaqKRda
 JnZZrZgm07ngfk4hBmQ==
X-Proofpoint-GUID: hjC7mSvZ91mq6HeJ-BsBTKFDtv4417Zv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX54+59KVb/A2M
 74MGqMZzdxPWNX34+aD/0GRcWCXx8W+zn0zg45PDuShja6LVlBBzJRa825qQQ2bV5uUAUDoB2W7
 nhIbObb/GKN9FZ07sBmucb0tNLJNApc=
X-Proofpoint-ORIG-GUID: hjC7mSvZ91mq6HeJ-BsBTKFDtv4417Zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260084

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profiles such as RVA23U64, plus the IMA base), computed at
init time by riscv_init_isa_bases().

The IMA base is set unconditionally: it is behavior the kernel always
provides, and is intentionally not derived from the I, M and A
extensions.

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that consumers such as /proc/cpuinfo's "isa
bases" lines read without recomputing.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10:
- Reword the commit message and the arch_initcall comment: the bitmap
  feeds /proc/cpuinfo; hwprobe derives RVA23U64 from its own keys.
v9: Set the IMA base unconditionally; do not derive it from I, M and A.
v8: Add Co-developed-by for Andrew Jones (Conor).
v7:
- Register riscv_init_isa_bases() at arch_initcall, ahead of the vDSO
  hwprobe snapshot at arch_initcall_sync; v6 returned 0 for
  RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO.
- Keep riscv_isa_bases static; add riscv_isa_base_available().
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h |  13 +++++
 arch/riscv/kernel/cpufeature.c      | 106 ++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 99799cc6c1984..2ce1a1e212c9d 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,8 +25,20 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
@@ -134,6 +146,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f1..d63a70c387019 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -81,6 +84,26 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * riscv_isa_base_available() - Check whether a given ISA base is
+ * available or not
+ *
+ * @isa_bases: ISA bases bitmap to use
+ * @base: bit position of the desired ISA base
+ * Return: true or false
+ *
+ * NOTE: If isa_bases is NULL then the host ISA bases bitmap will be used.
+ */
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base)
+{
+	const unsigned long *bmap = isa_bases ? isa_bases : riscv_isa_bases;
+
+	if (base >= RISCV_NR_ISA_BASES)
+		return false;
+
+	return test_bit(base, bmap);
+}
+
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
@@ -1406,3 +1429,86 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	if (early)
 		local_flush_icache_all();
 }
+
+/*
+ * Compute the set of bases a hart conforms to. Profile bases such as
+ * RVA23U64 are derived from its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* The IMA base is behavior the kernel always provides. */
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as arch_initcall: late enough that
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0

