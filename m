Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75F408018
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577723; cv=none; b=d/oV5RWr3clxM8iRuUy/9lUZQPo9dZVqpceU4+cYUFeadOLNRKiDAjEKP3XEyoNBSgTeryZouoUkVNkeUCIiwSg6MvaO7rxPGSTJbV70cFcjcMLevI/fb1wGhcZdraZSdSK9zCHwqE9PvDM6FG7Jn54f+/jJuLA03VQr76neEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577723; c=relaxed/simple;
	bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBevsEbmD9M5CV5Xwhbs3kdzhiu+XC565N/ow2AMBJTFmCnI87HVWrlihUTF310rCupUQuLC7nlwVgDrTZzPT0LzcrwrT9pl9F4tUTn5gxg9WVISNxA10NbZiISDccrqL5gZj2VCL67hZxde94VK3f4Kw67U4O48pQBthONYdrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRVSFQ47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZKiB48s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRVSFQ47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZKiB48s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLXh8941723
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=; b=QRVSFQ47/HfFj+l5
	1NZcpNhH7D+NfqSPF8QVnXbaf5oeLkC2iCGcqnpkNvYm5pXkI9msqwKdEFoZpFes
	Ieqiqj/8LByLIG1GwqMz1f/C+z0DItXQw2vicLrDlSCXPlseo8tZ0uJ8wcMsv3Zi
	VtLf5PUfW9PvmlrSdUqX6/4R1DIPyp47XdohzGLgSgI24v/r2aT+Is/hyxUJBR+i
	GeUfKVvvWJXyG9xLYmi9+THEo8L2T0tp+fv/+s+mgLr73oVH0NXxCCGG8K4839gE
	EkgPTDywrjy3ElT4GWqtVWtFzmJKv5AryJ7alo/+nmBIGcJ0DH5BPSKWIsjAkiP0
	i6OvSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xx1rtr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:35:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso2735285ad.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577719; x=1787182519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=JZKiB48s9Y/tn6Upo8IT8HRjjIjFO1fVgYSz5kkFvnpVZPr0QLVMSqbCyHqZJ0Rw1D
         MaTYFA/nw+NzkLup7Pw8FnDrxjPB6SHECmmunAd4lfKBZg0Xg0EFBLQtrzxJHOMQ03kb
         9hK93VrnSc8DroNYY0L+MCBYP0pKMHaGcziBsdDO2cLnzdYi/Nsvx41i6SslZwPVI2C+
         2mXbJqObBlmBUg0XnPqxqJxOetII7DL9edLN+YeYgjcKd073CZzmsnSPTW4ATpwP36/0
         O1zmV8YU8zBCtRkr7Kt/m8rlAgaTE/up0hNSWxG1jl9b269jY6czUw+NYGuJHLdwaf4b
         8Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577719; x=1787182519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=swhmkVMunT/0o+5HLmXLKLL31v2hu1F4qavBRECeAL2bTpd0symzNIbD20hRDJsEH3
         C1wAR+WPiBDV0MgVldBG2zdVvokY8XX0y5UqPzr1CzCEUQjWw5URQaCkkzn5tbtCS79g
         fWgMf/oCcbzKRB4nl6uK0xmDeZWR3X2jy2Ppyzoqf8afFpoM+tgoVoEOB3BQgtuthQWs
         +vC+waYOsoAR2i2cJy0FqJNggeOaMCuBveiY5hs7ayCTTtZw1ELo+Epe7Z1db5tbUeUt
         Zq50C56gCOBj5YzzcFJaHiY6CXQdIX+tdylNpBgv7AQPMIAQ4nputEnPmlbXtdFe+XCU
         S5YA==
X-Gm-Message-State: AOJu0YyyYbzV+T5ijK5PX8G+7758IM6SntewAYUvpMMq2pMV8L1KCaTf
	5h+OmD4wMtV5jmZsDSTp1QQs1ToDDRkFceQcI/33M13/zQ/Y48KXWiT0uzCJPUd55rxVKN9+loh
	NJXRyLba3lZc6Rh/Y++otf+7lubZrJteIF+503Sr12X3JvLvghMQvVPzcGldZfNs=
X-Gm-Gg: AR+sD13MxkoAZYdk3YDeny2lBN+BoeLXWykf9ocObTLfMH2K30b+UsmI6zPbnmI2ZKN
	8aeDNduvuH3H6M5uU765q1YjhNDfBDcmwfgPObg6SAkT+eYCzW35LjehVOLHmQR9aG36XSgLqL5
	1f3xJRWKycHjSXuA4nWkzNYV7rsOFz0690Uqz2cCML+Q4J4P2WPSupTMQspGNnU4y0ni6tVmwI7
	tLXKDzLpAwlwDNcizO7CzBdejCcndtDCzflyeXT5ug6zdfdLV0uYAL7kW1J4QVVbxl8MNh2ygma
	AYyxzoGUYGxSVuxWEJyIEIWuMz8CK7hoCyMEDIU/USMIALEOrSRuCOl6DChFgQ==
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19111245ad.8.1786577718862;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19110515ad.8.1786577718418;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:49 -0400
Subject: [PATCH v6 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpGghL0lKZNWVsyfs/b09AnNXKwq7Ue3Jb5z3bP1V
 bmp1L69HaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRVHtGhs7zvq3twu+tnrx1
 cD9TvWg1n87SC7vz+1NusSjfZ/ed2sjIcEBQY4v9Xc3WDZeKznt5ss3XPXZa67/EvvcOlyzzb9n
 t5wIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: KzgcEzRRpjg6zEeSp6FFNTjFEaaYXdCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXxsYPqRvZgJkM
 ALgH0U8Uw1FvyHqIWhzKb/iNTm+o9H7R05VqYmaH3gJFlD8fhzrcscJKIQqkY9Lxh5FQ+qo0EMU
 8M74/yVB7wy/WaRDQtU/r7en+zla3GqxdpOaTydNM/5MALMDvo4bly+ARoqGJooX3aOpOs73eSu
 96gYxOZkZeNCbnZVCzfDQjsCHiPSCDbUHpBOkbUXaMfmd4eev7luzhbEL0hPjw1tjpwR3Jm+Gj1
 sy/2JP0AhMsmABP0Y3hX9NHCNuF633fqNEvCvcIgxJ5iV5tpbBKn9hjPJSYJtI5XV3zGW/OyNRB
 m82nJhXB4GkqDlyIbsao7o6hjnbVfcFgAeOtQQnbZGmz38kFvR+VhVsvN0L4sNdi1dUl8tkNIbM
 iRne5vKHuwBjp54ZDew0jsOLeiOmMtTMQV1a3utHY84OMYs2bAcrru2vsqKZUbv+IDj3mfVhky4
 Y+7UclKT+456/VSlKcQ==
X-Authority-Analysis: v=2.4 cv=J6KaKgnS c=1 sm=1 tr=0 ts=6a7d0337 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX9Xycf49+ErRY
 eQHvEjLQDGUU87sZSOf6d3Srngj9Jag16KTCXhbv1ZXxF9u2ZSWbNKIXtW0k0aQb4pf5JwB/zgA
 miVAYxh7m/NwdNCwFSKk8DGOne7DdAc=
X-Proofpoint-ORIG-GUID: KzgcEzRRpjg6zEeSp6FFNTjFEaaYXdCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

