Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61878347BA9
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888798; cv=none; b=dODB5NSqzapIKLZQK9rDYovASjdjgtltAsWimxZn41rOBwavgZ/5wGWum+rTYTAwQDqLjkkQt3o7iZxiodWhoTScDbR1Y2e2fZe6PwHWCXVaIOAyWansF4/AqMF4hEgujmlSyhMYAXT4vtDAZI8H1wZOoZVMnQuDDUBXyX1BIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888798; c=relaxed/simple;
	bh=LiWE+wlkueULRI6+/+fF5gGTm3Y2rs+sPskRz14DADA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ma+a2XcrxxDZA4nIXQCiQNtLuXyLBlbtBhNBiOODF+1ac0xi1BHvWIIKxX1Y4Yhji7RzYunzu4ULfX7bGPQZ0EmYsYpWHMxXMeyrbNNLTw4CZUmK78mae3wnKP2rvk8Y7u2vkjd4uO1IXwJxJ9cAtUlYfd9aPgDh14oUb/gfI3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjXAMP09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWCpHIdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjXAMP09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWCpHIdt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K550DM162622
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 07:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=; b=VjXAMP09Ggey6wVW
	k6Wt82ZlJOTex+hbBMd3dQfhZo8+dT3hRgGPgLTO03P0vlWf6CSebHvPUqrqlMYz
	r0LBVqeMrUldbHdaXaL2Q9PA6vhgM1FSSaNdfkMDzSNfNwVTNGYoKMQgREVD4oEz
	2pK/8NAV2m6ldCV+aEZpLxSLmDnww3jwF0/rlCuKMNDcCKFlDmyB0jD7YaSYQ9o3
	am8PGPsE4fQL4RXLSLWI/bBpRsH3jDQxLOP3YN6sl+cMYhgxa6pOkM9KB+ryMJfA
	zDkltq4Cor+m19iGEuTEuAr0CXAOZg40ds836ZGC0f4Fjykb4RdgKlJGL3fljJam
	M96+7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2cfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 07:19:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3734d06dso37131655ad.0
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888795; x=1790493595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=XWCpHIdtvbFygfRrBQyQuZZm8JVCpOPVx06dPAcYsCf7CcZyidKt8Zh2FuEZAWjoE+
         H2kum444kz74xlQaRRq8x/lclTDnJKBmjmLDmuIeltda8frUvWRryEQqk2fJmIc1NSjC
         lwG4V0/X9d/v+nAW1ACVzaXiZamNIWd/wfMn1xTW9AqsHXdmBaFQKIrbT8eDqJM86ESY
         RuEybbeH3AbzIp59LRRLE0P4xcBmPkcQumPRKc2bqca1XNSh4flrBGDkH+VsBoyx2h0Q
         Jn1T7zNtBpoX3kx71lDjyGNG5czHhBJHMarwqouDt+9geG1RsWZ9yp5zMA/OGrQpvV8s
         V8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888795; x=1790493595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=G8LV4EmeVHKDxQLxFxhXPW15AwvUriukQ2ttYecicyouhpdK1bvMw/h0dSUbmOMw17
         vo20zw1W5zCyRQ9H9LwrsXLic2owEnT2Eqwz1tEgamYxPjeSEGAv5hlCZB7A/UtJvHKF
         /aTvnkP/4lwtgZdJcQUEB0YPUE+leF2lPlC5mrYL3+gI306AH3cxeuw8ZFR8lK6aUpcA
         i+PAUrgFBeYDM4t40KhyPBO5xCo1aSkD6YafFKZHGVlAKKnSyUNJsoTw2PpLw4vxEykv
         QsCXNCVKjq2Mm+4m2JNlHANcaoR6WqS4YnFLeZuArx8DWwNvVXE3X8JW9zlakVRQ4e5p
         l/cg==
X-Gm-Message-State: AFuF++lPIDpxvwTNztwppvpwPJylwQmQXHjlp4nelW2t8kxkuvZ0XEC3
	4z8/MZgxQ/61xcq7rLT+uX2KbjwK+8TXfsG94j94UIUuRO6kGLA+UBrgd4iYQdLm8gdGwbfERKp
	NU5MI2w8A1o3a3jEEhNxk5ZcRbm4Vee5Nun5Z1LT4qQBXXAKs2ZnjjazrvskLwT4=
X-Gm-Gg: AYBFou23+zrQj12GJu0C0o/XW3s6WGQliVsxCCW7F1NwibOYUycj8Jyq0BkYGJTqTww
	HAgsRUkpUgvRAXNY4KIFxwoMxUZGdSjsmXffehYBS4UX+XPfLl7EcuyWbTPYvnE0v91z+kNWHzA
	wDA6d4YpwQQ0Z4G+HCdcmVz6PVlnx/mR8lR9qPhv944Fx8r6+Ci2W0rdE21xFe/WWDU7sjRfJ+5
	6VB5MxAE8M//axibGCWLrpEd8Z0oYx6OUrqVRH+4lEnB1HJpqSHEE8eyo4cyGExY4P0IrVm6W5L
	RMByR0OUwe0Re4RW/1CI93syVA+VA0RnQdC2FeZRk9Z6p6PJfByWFOhHl7Q=
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61371255ad.40.1789888794692;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61370925ad.40.1789888794067;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:53 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:29 -0400
Subject: [PATCH v8 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-9-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7913;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=LiWE+wlkueULRI6+/+fF5gGTm3Y2rs+sPskRz14DADA=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HafmauqU2LZqJ+c/N9MOjGGbJlTzae0Kab799Tbq9
 U963Js7SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCIHNzL8L/q0t3Sb5GvWB5pc
 lid9NCp13pw9rFGgPaXNJlrjsprjNkaG/TXq919aTmKzmN8eOS0yi/uY9jk9ppLdtne6A9WslVd
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaf891b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2dgCOJfQ_T_1aLmlT9AA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXxGG7fJiftVVL
 QNN9RvPAx327E92zcFjIM+ZRTPRT8PDKU9Td2q8HlM3X3ydGL08FZHuo+j4xyVfGiTarK5LpNkZ
 KkXvavzFyP587HwVi4jM3JIwYjnXPdM0m/q83+Afo/F76VFRrj8MPJ4JSkRRtrlJDR7ySfAQivd
 O6wwSkYFUDNE0/JjJx2mD0LZDtDfb8SuiFwiudLXniKrY/HCndmgZSFcaDzNLhUsdY/Oy46X6oI
 l3AEGO9FjnZk5rxdNNpYU1lNpvXmgU+FVbsSOCgUvnimYfm39KauHi74TSnsrqdr3TaN0vcvL0q
 lf72mc5h2AWCWo/renj2LJuH9NTWG8lr+IlfB7yxNrFClMn/d/bNh2QdQKkiOTh4LJmmiabFDEY
 b7EGA+2a2Qz3IVN6JiBpEyPhoEiU3g2malfi2XIRgNPo/xyVoyLtOahPgXY18yEi2IQaJhySs0E
 0Myd42yWHWx5izaymzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX3oONmGa5ADRK
 3Z3pOOpcaZMAxZ5mG2sMxDAZtNyqBuLAE2qhPm2m9HXbDKTcaV8qvXABO86o0FBi3KoXJWqaSp4
 BwJgGHiY8gLSoACHrccIXFTrzRFWPtw=
X-Proofpoint-ORIG-GUID: sBLNvZcHH5M3iH_G-xml9cLjtJNiQnAe
X-Proofpoint-GUID: sBLNvZcHH5M3iH_G-xml9cLjtJNiQnAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail. It is also early enough that
arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
when it snapshots the hwprobe values into the vDSO data page.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing, which keeps them consistent with
each other.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
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
 arch/riscv/kernel/cpufeature.c      | 113 ++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..89c64d42ee745 100644
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
@@ -130,6 +142,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ef3133a52c0ea..126d5466a6f4c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
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
@@ -1350,3 +1373,93 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
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
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*,
+ * and early enough that arch_initcall_sync(init_hwprobe_vdso_data)
+ * finds the ISA bases populated when it snapshots the hwprobe
+ * values into the vDSO data page.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0

