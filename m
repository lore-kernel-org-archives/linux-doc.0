Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BE147F3CA
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938039; cv=none; b=l6NEO9V68drOdv8CAyDw6sjcdJ336rAO+sWZvxV97exSytF83GEAJlriUbZVxgnLe193baQt70i/NiNis5HwrvTXEYxojMn7Az9MuLekRsKWHgXUX14XLqKKMYQ623OkNdgYLfpEXBoRR0oXw7APpUWWECOsGermJv30zdmFwFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938039; c=relaxed/simple;
	bh=dHXOjF3dD9B+Rwvm1XfTboxKHlQvc+VNR6wwnEiSmis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3/detoFiaIxO8NR5zWWOpdYdTpYMcEEDbl/jgXfnzgghRAF7Dvp8Et7jbuCUxWazX5JV9iHHm7VtxKkW+GARvwnLNoNbsmdqc7bdrfpy0TmVm+x1MOM4UElN7HRGY23zx9Oq+VI5m1t4wK/pr++A+Gm95G6ZfUS5Q/ziP33I9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Crqucdnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQMqWF/7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Crqucdnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQMqWF/7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZnw3935120
	for <linux-doc@vger.kernel.org>; Fri, 2 Oct 2026 10:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yYOhgnTQt/mpMNP7gs6l5MDjzuc7Hi21qDSgV/W9ug=; b=CrqucdnhENxdD4hQ
	v5ltZjHu9HY0TASn5q6Uq10H8HF5JcsUzOUqvTkmyOAPd34Ooj3wD264J5JxWR/3
	OJR5VttquK+sTC+vVGFi/taORW7XJp49xnBrQ/qfzEndwmbUTp8EP4nc4tXeb2FV
	sW/AZUyalYeQ7o/wcqE1TMVsrKG0CM6BIevuLAlzwco59B+jLknCSPLN099w7Eqn
	f3Mh2OIiWzA9fknfWTUpW1w9+Zq8P7ZnyFfJ0PYOMOiAfSdgPa54j4+xii6NNCHe
	6ofA9nXSAiFAgF9F9drYFeEhhlLgjYyKgNhBiBu/j7KrD6RYZLcrsYi+Dt2TMHN/
	rLTC8w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxearce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:47:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1438fef603cso17182958c88.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938036; x=1791542836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yYOhgnTQt/mpMNP7gs6l5MDjzuc7Hi21qDSgV/W9ug=;
        b=NQMqWF/7/Ru5mMt9hnoG7sL9QsMSDlGwxup6epdki4x/EfP+T2TvHQgNig/keGeDqM
         wfuyu9GaG+WSbHNAeFaPVSIBV0aAtXY9uA3YOW7Xwcw2Two6//QSyzJl32/mDVJ48Cu6
         bwRffK2xlhBiVyJ/8DtPzsJ8dcwa++vcXci5pGX8sydXOko1J4FhCD/QSHoy690xhMAW
         hSZ3+sZPYrYn1HJaQqY/oWsTQrZX7TpMU9ZMmcM8odwttN6Uk6Ac4XHj1/Rpn/gzvwa2
         wBku9qDB9oY7MVkz2ZBQjdC1DXEP4JaPCF5e86mIOGHtrUppUUVxeG3XrCCVJDDAsDV2
         Y9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938036; x=1791542836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yYOhgnTQt/mpMNP7gs6l5MDjzuc7Hi21qDSgV/W9ug=;
        b=rR3F+V3X1W6DdSaMgnB9P0m9/+12DFEkuYQTxJDUETJMVy87nr6TJgasrynnk7jbtJ
         sJkV4QO0gfDaC55fOPxkesnqbOyW8ZzIb2ccv7ERfJRWiZn4e9T5Sp/qA3pVZJwFhWoU
         lO9p2P1tH3EskAvBxLA7RGu+gnKVfimYLb4zNTTlU1rVemWPpinVzOJJQ3X5+BO3ChWH
         fkqIjIZtmsKjAZDw7EV5AGQYYN2eNVLZDsj0BfMEZ+oQPRZF9753cDpDuPJBaPetyy9i
         yfahJFrrZMF4GCUIErtG4RQlLTz79McMc+afLiScpODv9Ubd86ZGfWvMCzJTQjxdbpVW
         rK4g==
X-Forwarded-Encrypted: i=1; AKwUvBzVGZ3JN8XVZT9+fzT3s14y0fCVcljCYd6AX5GbPV2g5Kl89tHAMlvJ+2p4mt3WENILzBrVLgwhex4=@vger.kernel.org
X-Gm-Message-State: AFuF++lcmVbpPmmR3CvSQufC+ukdrBz+sqPbQElFDPnz6vuIjVt//hZs
	F4Rfklnr+A1MUvwGTY5bG4rzG3Bp8Ok2iGBN6Hkc9ZuK+qETyypgqw/7GDfQjN/6wSVMr1iKfyi
	JqO/xDvgrbauVxphHRXzYplT6hmzvUvBYifem9MeofY/PAsiImWSmYPL+3lI8FoM=
X-Gm-Gg: AYBFou2Z9Fy6+EkEtee3l1sx0Qg9Oh7IEmGhCHuedTyxPhZQ+JGbT1nLoTfUwuZARNB
	ofjjtpQWtGjbmzgOkLlHl+igtVgVsieMAljF/lTzqiT7YkBWgy8DNDqp7Z1eWMbWwKvLqKcq6hg
	WwwOcsGnmBuiN+yuWm8DyJTcWnG8wSA4yt5aW/IMAyDZF4OBwST9mCQhtOFxmEtz44+6b6sOM7h
	HldEQvSVMijjJw2U5I36CMhIz4KI3WImBzhJ6i7JBmSZy2Hx4rkdhu/1k+lRXlGmjr7gGaNtKR8
	IRO792AIwJ8ZtTeTOKCZSp/qVu+QtyjArerWJ5uw4Ea/h8EdLUHxQzb+mPW5Tql0l2RsloQrpvM
	kigYJz20WMDhDGvOUN71NOkekeaaq
X-Received: by 2002:a05:701b:2818:b0:144:ee9f:74be with SMTP id a92af1059eb24-14f5d3b3031mr2681949c88.40.1790938036259;
        Fri, 02 Oct 2026 03:47:16 -0700 (PDT)
X-Received: by 2002:a05:701b:2818:b0:144:ee9f:74be with SMTP id a92af1059eb24-14f5d3b3031mr2681893c88.40.1790938035657;
        Fri, 02 Oct 2026 03:47:15 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm10645191c88.4.2026.10.02.03.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:47:15 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 16:16:56 +0530
Subject: [PATCH 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-thermal_bin-v1-1-5a29be7e8ec5@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
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
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790938020; l=4476;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=H8P82K8EyasmbTl3TFXPQ35moHYiA6gWzZHVuNlSx+Q=;
 b=MgCdkyIdTWFzBl+2SEiVvI3TiE1GgrR5mriJmvtIATzgiNSspQexIJcD2RJgO+QNtJQNiYLYh
 ko3y11sbQWTCaMmuBoqoApQ3tVqBfqQDrM8KJA3aHc4DPvjP21jrhzb
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abf8bb5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j3Ouay22MIlEJhTpI7oA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: q9UG1-1OmZYTI9DZaCV_NQ4XqL07eMG9
X-Proofpoint-ORIG-GUID: q9UG1-1OmZYTI9DZaCV_NQ4XqL07eMG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX/Qh1cwwvrOUt
 axTSxRnD10PaQnKwYfW0Ym/Nm6GioB+Dle06TQmkgcN8pUJa5sxzWFK+Iihv/9zt56GG/SGp+I5
 YW/TqOgD2MAJzo2B6FPlCbkG0O2wxyQrqVmywn40kq+PYgDo/Fwn9G06n3V6KkgsJlapnVfaypa
 vExWneWBc7KbBpacj5hKM92BF6RJyhB1sMBmmFO4zYLGsFuvCmOBQMmmKcU5ZVXsMxwZduy1FUm
 VdWI2TTR871Ni/yxQpuYhqR2lMCFOqjLRurOPDPDNcLAuK7N8/k6dCS3FqiDK4JFDNu9AGSaDrF
 /GmX6UOgtC1MV8FRPN+GPOSaGlygmWTlNw8eTVuFVRNAd5dHlBQOBg1CdDOMxzmliIcggtIgoY9
 +V6TlQBkOCQEe8sSB1hKxS41xjai9C60JK/wgDIVugw50LLIoP3Qpe8vwkEq9TWGBYyIiElzOmv
 a9SFeYwu/6q5F3QAGGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX2Bhj3DJHxz77
 ie1PgUsEHWbu6orNSuPwZZd0I4kQwshDeNTi6Ct/4EpGTGJxGBubkgLww1uVNOt403cAu/dOH+V
 cEzRH4AI9WP1p0ryrdRLo+pIzIEnOYU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

Differences in SoC packaging can be used to provide multiple SoC SKUs at
different thermal and performance characteristics. The underlying SoC
remains the same except for how much heat the packaging can dissipate,
thereby influencing the critical trip point at which an SoC SKU needs to
be throttled. This SKU-specific data is typically burned into fuses
during manufacturing and can be read back at runtime.

Add two optional trip-point properties to describe this:

  - 'temperature-bin': an array of per-bin trip temperatures, used
    instead of 'temperature' when the trip depends on the hardware
    revision encoded in fuses.

  - 'thermal-hw-bin': one or more bitmask groups describing the hardware
    revisions for which a trip point is valid, modeled on the
    'opp-supported-hw' property of the OPP framework.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../devicetree/bindings/thermal/thermal-zones.yaml | 53 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..cbe72c2ef87c 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -152,6 +152,51 @@ patternProperties:
                 situation where the trip gets constantly triggered soon after
                 cooling action is removed.
 
+            temperature-bin:
+              $ref: /schemas/types.yaml#/definitions/int32-array
+              description: |
+                An array of integers expressing trip temperatures in
+                millicelsius, one entry per hardware bin sub-group defined
+                in the thermal-hw-bin property.  Each value is the trip
+                temperature for the corresponding hardware bin.
+
+                Use this property instead of 'temperature' when the trip
+                temperature depends on the SoC hardware revision as encoded
+                in fuse values.  The platform driver reads the fuse and
+                registers the hardware-version bitfields with the thermal
+                zone; the framework then selects the matching entry.
+
+                Exactly one of 'temperature' or 'temperature-bin' must be
+                present in each trip node.
+
+            thermal-hw-bin:
+              $ref: /schemas/types.yaml#/definitions/uint32-matrix
+              description: |
+                Optional bitmask(s) describing the hardware revisions for
+                which this trip point is valid.
+
+                Uses the same format and semantics as the opp-supported-hw
+                property in the OPP framework.  The platform provides N
+                32-bit values describing the hardware it is running on.
+                Each trip node may provide one or more groups of N 32-bit
+                mask values.
+
+                The total number of 32-bit cells must be a multiple of N.
+                Each contiguous group of N cells forms a sub-group.  A
+                sub-group matches if, for all i in [0 .. N-1], the bitwise
+                AND of the i-th mask and the i-th platform hardware value
+                is non-zero.  The trip point is enabled if any sub-group
+                matches.
+
+                When used together with 'temperature-bin', the number of
+                sub-groups must equal the number of entries in
+                'temperature-bin'.
+
+                If absent, the trip point is valid for all hardware.
+              items:
+                minItems: 1
+                maxItems: 4
+
             type:
               $ref: /schemas/types.yaml#/definitions/string
               enum:
@@ -179,8 +224,14 @@ patternProperties:
                 The active trip type can be used to control other HW to
                 help in cooling e.g. fans can be sped up or slowed down
 
+          oneOf:
+            - required:
+                - temperature
+            - required:
+                - temperature-bin
+          dependentRequired:
+            temperature-bin: [thermal-hw-bin]
           required:
-            - temperature
             - hysteresis
             - type
 

-- 
2.34.1

