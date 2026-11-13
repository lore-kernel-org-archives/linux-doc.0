Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559481;
	b=HHq7Q0oV31pNHcUK97Z4CmB6TZTSgixTDbcjjuNsasa7jkDwl5DBiKTrLwLJkI2l2Mg0
	 IpdPz/c1pJaeg/icV2AkZ6FRU4nc8x/5MNp7ug1iTmtV/xYg43kD7cgnK4/HAY2wWGow8
	 LnpH5Y7inJh7bdrXXJanq/HgEa3h7ZWjJXTSCAa6zLvTdfZDYHMXXnuBpBGeds4T9BRmp
	 Ze1n8KpR7jBXL2XEDZxCOxJEv5VcBS9s0JRJ996kJ+t+QKfgRWldjkz3ZrZdjIOZ6fK+e
	 gBa4rRYy8wlAeNUS+1Brvjy6So5igdglzsEj77X3S+a+PbhdUXo4V6E+PkFXLgxN+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
	b=AT5KsPqcwCKxBkEDcF60E6ab7LzvkJJjHwSEHMkPo8qPJEz/3ISilMuXlsynxCnMOREa
	 L7w/sjAGI+9rPvjDPeFnVsE/ymx9bxS5al6lp5cbHq+33AIOmn1LNxaohrbt5FlZAVBT9
	 2CzUfetIZEQdcip3Q5DCc9rte72I2RrLvYpEyL6B6lS+E79muXut/TC1blvkb3hUAkHkC
	 eiTwrRhVsis+yBJ/REVQqJKdORVjFXVWd2G1/eLiDi4VvERfHx7qjGXImbIhxUxdk249b
	 LKbs93MQ7RRMvMNcUJvzIh+7KT18iez7wTv+Htxvo+3GKCVCcNldqWER7s0Zwuvb/4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWIx79Qb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwN8MxQ2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D126606A889
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D126606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWIx79Qb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwN8MxQ2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uv7d3164523
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=; b=RWIx79Qb43YpODZN
	UrDLH1rjSOQSUi32mYZnnjk+SsakssXggJllrthJ63skr1a/VT87pxwJAJsDU9rJ
	kfGPzeXBXlk4EN706NzCI7yBOFYn9qzCW20WjNevdF1V2fkX3Jkcpe30tSBffXnK
	av8xSNTJG5xfzV8zuD4GOP2V6x8eCB1xEKdCE/zWC8U3SKXcU6DT/YAPyARnOB4T
	VwEzjqyVulbtUSze+9WUQqebcHrTd909jbld2fOTRz08Y1tRkG4K0aDLJS0VGAtW
	P6dPjB4/CZct+tJ1/qMQUxutM5agPi3StylX7OOgpDZBbqIUdcGPqv77i8Zt/xoE
	KwRQ4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mry80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so978428eec.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559479; x=1795164279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
        b=iwN8MxQ2nacxBJdnAKNmF+qjSyInIwnHoOk4BS1w2/0xBqOe/ig64jx8UTItnG+xBl
         +tBGE3SQmhVobLUWsdXYTyZRO4xppDjLY/e5mcmRSSC6e02i1JhPM7g0R1spLiTjjr5X
         P9gobvE9M0kpdgO9KjCfEPJ9Slxo6FYkzaqQ/sI23S4H/IicYIX3LROsk+VS9b6k4jOa
         DRKceva9GBXmn2bS8VjW31TFpz/VSCbUAtfhHfw+j1ps1D5GhNSE33VkTLHBuMT9Xcao
         J6JMG9LsDqSc6CreG/WbReXO2FZtZ2treeL+yENT6AqGLuYk05LchIysZmfAjR4ARsf/
         3I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559479; x=1795164279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIrMTfyIonOmY1GNvBcsxJZZMZU4zQSdH0XcMZTdSWQ=;
        b=KaAEC40tCVJ8kL253MBIFm8yLcHUboGDZKRFh1eKiXbPak+jKzhDCdOlA3prhJe4cO
         nEWw5ZJh2KJiD+LLRkQEvaM3N1d70uW8mgIbSf7LJqK1H5op0PzGweRqZozeMjk5HhWy
         QGQn+juRXK5P4gMXkP2iHIiKcfJdi05YEb2nj3p8lOridjwSNnwmz9TIBK89mcQlxaom
         Rn+HiA1dcM5ySMycoS2nChjWB3NvaAwI9BQ8jrb/rZpvtxEThZWVMRCb/witL4ZdIyrX
         xdm30m+Mc3TpMxHw2UZueUNJye6YsoxqgpMpQSur4/GsFM1yOdOjJWUNkLa0siAr5Osl
         noTQ==
X-Forwarded-Encrypted: i=1; AL+hErF/Iau1/goLeeLmqXTdl90RVoZoBvXEXsuEPzc1vgi/HiJASbI219Sg87EpXKsS+t5p7Ogw8+AFeEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LsAmjXP/gMscbQQxWj1DuIROE3PqZk5dTsHc4VOPNfsdT+Yoz
	kNf9Ocg85O5J6k3Ru6sjfW/57IV6vWIQqOduIZ9ON1g2NLN3oePf4Nskhu/YiqCEnnu7bsqs9Cs
	ri93gffJWh0t/yzw9zPjqg1lYA9TIIDrIes2fWaRg6tuxkXdgTqe1qZh/xGtiHaY=
X-Gm-Gg: AYBFou19XLX3/U3alXOaE59AosmGR+kCymKrg0u2pA7bOoBHrVzOCqy3DfLHAxNH/XH
	WCnDQqoh34gbCLTdDoH6kykJQJruNyEYRvIoCkSctlO17/ouq6ZZ2KCYX3Bq47O09cXXcW+HJHn
	8q8m9six2Sqjnn9vRaY+Sm26qSCgftiFnOdridROnL5I96gWQE8YksZEC8VbuWaMXF7Y8PzAl3c
	Vw63RkGA7yIRmoI9nMXkStH36xNeiRkDg+2V/AV7EArY/MxjkWetkudSNM6P2X4cN+SGp+3Xr1p
	MgGp3vrD8NxENvhmfu2PeqNatm5Kl5Ccmxlq3kI0VAnBlGSd4rNxvINMgfNM2qzUCsmHD/w7cSZ
	YQNsBCpqZhycBumcCqc7TwuV+l7rOc0nueRlc/5Pju+bUw8PcvNvnkOPhQ02JJFGcDd2S+X0iGA
	FDRe4=
X-Received: by 2002:a05:693c:8042:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-379684b6defmr1914377eec.31.1794559479207;
        Fri, 13 Nov 2026 00:44:39 -0800 (PST)
X-Received: by 2002:a05:693c:8042:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-379684b6defmr1914350eec.31.1794559478641;
        Fri, 13 Nov 2026 00:44:38 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:38 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:46 +0530
Subject: [PATCH v3 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
 tsens
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
Message-Id: <20261113-thermal_bin-v3-3-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=1843;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=vwYmeuoZ5lHmVqk80h0qWG19XZnP39VU8XyF/LOm3ZI=;
 b=aeA7dvyrgX7CJFxmnzCADaVvcpgLvAr0AI7xRba8QE3wF0ZoOviqkPIDA4JfSv+d6Cg4VR9kD
 zLlm8CYXaUdBHj7wZgEROD0Gvk4uUyRquehwJ71pl/N8GmAhIHlkjNb
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: 6VnOlQiUpYgCWEnJRBUfa_dhE3-PvGle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX7cLATHyah1xz
 K2JlxlvQjl7Ds9JZcxGduz/XfkNltR8r6CNjojVcwE15IlR6QpwCvLzTiP3qCoO+tRb4ZIU7foQ
 7vep4vH4W47iU0Ac+nYMujaKWSzoXdq/exCYF/DLERfnyMBWpMiNTP/kAqVo+N19uKJcegrBeWx
 D0lpiGYSeRR3ei4aljIWBnZkottHc/jFXEjSZfAa2mZb2W20TXz8RQDoC7b00vStqiNx/oKk3DD
 Nti3yj6a8F/65E3lwVJEYN3c99dMIUcjU3bD0qVm44gnqtFGfBFWe7kPKBJC1hfc+xDw46loJ8/
 2/x4tbsDG8Wiu3mRdfxhvoRX1+YOK/IAHF3GEwe7aoXzTdOycb8SLVqgTX5tEtviLPQQQj6M5X9
 bZy+NO/3IH87JNKBf4dQSkO3SE3/jQeykuT/GjsNVukRZL5cyTBEUAhamP4aL6AcVQp1ZmyeaPe
 F/qlHTWkVHgDtlKrUtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX6EbvuPswdwd5
 gSFY070wJhQ9zOgnU8XFz+m2PDDub0SUG1/4MFxyW9ltRRnWJncbmiIZo/60r7gIMM+gWY0HVMy
 iD1tGJY3U8NyOpxt1zbboQyWQPHLGF0=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6cdf7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 6VnOlQiUpYgCWEnJRBUfa_dhE3-PvGle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..e72d6b8b657b 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -66,6 +66,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -245,6 +246,13 @@ properties:
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
+        # hardware-binning fuse cells: a single i-temp bit
+      - items:
+          - const: i-temp
+        # hardware-binning fuse cells: jtag-id and feature-id
+      - items:
+          - const: jtag-id
+          - const: feat-id
 
   "#qcom,sensors":
     description:

-- 
2.34.1

