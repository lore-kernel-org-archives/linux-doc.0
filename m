Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453000;
	b=hUoSLGBlGQyJEdhdZXSVNaHhWq9G64Dty1i+oQgN8YplSGK07UTh3GaVYsQy773LRhfz
	 0+HT0Ue8jeSN50i8qocyUF++uDPMbHgH3RybUDuaQQtQWhIpTuYP9l45qT8BwNfo9bfvD
	 xLV6Zyo3FJ2h+T2o+aauFxlAdttdKcu7KnFp22/NTPnehBs12/MGB92c7H8YHpa2ymSHJ
	 f8wPX4UEW1xjkaBLXITXAxIFxAgl5D2HSiwb45EmhViIs02DPVs7epmgPrDG2yJrxTo5l
	 xCMyHDtUx+FJlW3t5GCHJBoa0CXZe13dP4H/4TmUVzwEfd8HMFhjDMgJPOOohohh1FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=;
	b=1pADqTQxZKSLSS6Z9fk2xSfctvLikMX5rkjUw0tfpPq/+g/8uHp7BwXe1pv9lXuNupiH
	 TFMi662QoNuXQHGyKM6hkaX59U5WoNy+ToLHKwmG7cX3ctKmWju8Zc7LaHtSwktUjsGjT
	 bBeRn+uFBvcAITKzGviPn6loLciO0iUDDFgyMN+CWquYeo9sDM0HPnCQVlfMYjphvoWo+
	 4r7nGRcO0D+hthjpLXFEOgcS8SdIHcQgS54uWa4Vscl1r/rTsjB1EQzFqjGCk6HFeTuf6
	 AyGv+ZMuwz0G8Z6qVyX+Ne+fRpSh66tqI6nEz0bxgOkDxwhj0Di/GJiFA0c+2b/HbEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNweS2kL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUkem9Gc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A13606A326
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 13:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A13606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNweS2kL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUkem9Gc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxqGs2161133
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 13:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=; b=RNweS2kLLiYzRuKf
	o8AOiskYhmIoQEQeuYb4UX8XSBHuSUYNtE79nqhtW/UhFiWP6H771xIXGjcKVhbm
	/Bg5CYXbaWctKdA/deZHUEjhxo/gojv/t7Ibnx2sMgg2nSfMZ/PdABFxywKWS2KY
	bs6kqCr6zMftzT4McsmDekOVb94eXOklpP7JL4Fl477Pf4LxH/3hsDUVsMgcgi5X
	rmcX43XxJC7gJXvPNRtrxF+oa30+h33WtvCcc1/gzHQu8m8DRikJe0/fOHRHxWGr
	EHhK+YsegoPVqVx8y0sI5brnC3vRU/8Hku1c798JMSwegLRnS5K50Wk9cXmXDRdm
	flHozQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2s6tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 13:23:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3649602eec.1
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452998; x=1794057798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=;
        b=KUkem9Gc+v02mhQuczLT4KZ6QWcf2dE48mARWuX/gWDWcl+Ku21ArvXecMouDzANHZ
         WJlngq3aji0ifUJs0MU8kuPTt3QbESI9ZWmGNbAbFm8ZSWTnRedqg4LbeqlqdTdn9skp
         WYh6uU8qCbdKvs20EDQVczfNzBPBboxgheUQKgmfmRBZocKSoJiJ+5GRBsL4ojzbSxXE
         F27MWSOEyRSwe3hh81vbL58utmEL0+sSdYntSBYx9p5MPw/IX1V1jt7kxpf804IhaP5J
         C7d7AvyPfpOpTetRnalUxtnUtr+wL6LwonVCQmIJYuzNHPILDHt57XurusPCIfglDtLL
         gEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452998; x=1794057798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7zIqXb+j1h1NKIcOBksnZHm6tGnQ1r6omYIqQFPW4I=;
        b=x7OxOCm2QctECWXa3IadZxLnAPBHIU31ltycLNhub9tgqPxJYaAzO7TIo8BjxIIDML
         whf1pve8PndK++hUz4W7fwQbeZMvWmODWvybgbn/pwNmCuAKnhJ46Cj+0hw6Ct/cRReX
         BJehRVe8hP7d/9hNZjOzjd3mPAKmm4IKHqswvn8BVNuJpw7KQdmL4h43H6ZQO+ZC4XVh
         LagyvoCBEX8ur59xS/QuEQVUZ1B6ip8K7ZIOKf/YzDSY611v+AvTCSMiMD+j7HLgnfia
         +LOmkKgaOCzv+KOOIOQsSsw2EBXASIUcap8HnRM+Cvuf/V0gUweN0yM2x9cqBgtgwJMl
         HANg==
X-Forwarded-Encrypted: i=1; AKwUvBxfX1WMCw8lee5vpWXtfPVvTasB+fQl2YvXgGjfhJAc1WbZBOPSlsL6EUW/tYsS5GxJh+iXdgSDUco=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1C1OjhjxKZUS1k1bPtR69oQOmzY8i2jEMDNa8APL63sHH981e
	Dt2KSw0blxHdQ/wszL2PRBqkUqDxdQY/omPr0FE0Ju1SN3dSIgZIsUmt18RTsw9EqpL6vOREds4
	8DUxJOYbYbNmtSSnjnrK6hX7cuGDHjc2dVZ4Nqa6mwQ1HQ4I1rXjuGZ5OMhqRLQI=
X-Gm-Gg: AYBFou3dF2AHhcGS9CJ8aLidvVk20Cg3MnAYaAOm8AEs9JT64QNoGxB20k/MKKKw7jy
	O4LH1ZzMttGBbYUCPpG0DvioKSbBvz7QIqt+mOgiPWt3UdFPWukSoxgI56PFumS/awj6akDWSsc
	g0lJE6ZBTSkJ4DHHMsvKVgebsL98X7pRXDOLkx1mrm0NqP/lAbdIIOMiwK0mS5hSvbd9m0+Ac1g
	LC2koUnFRYaO3sn+k1Wj/pZSIqhjJMeh64F53ue4THosEe8fWVe6ez5fYxZaI7mPGUVcYq5lZnU
	bdGES3GaUAd4st/nQF5CftPguSVVcwQbMMFdeIr27XTuuneNj0LsceDFkz9l+928IjvYTUVbkfE
	fHBK9ERgS3spSUaVwZjapplG845si+0Py6Jfgto1ecBsXGiY3tMaVjVU9qEEidd4xG667hDiw7z
	vTh1Q=
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr6930086c88.18.1793452998024;
        Sat, 31 Oct 2026 06:23:18 -0700 (PDT)
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr6930039c88.18.1793452997369;
        Sat, 31 Oct 2026 06:23:17 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:17 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:47 +0530
Subject: [PATCH v2 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
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
Message-Id: <20261031-thermal_bin-v2-1-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=4695;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=ncFZPtnOUeeKhOPBeq8g6g1+nKJHU1t/0jL31m8J8Cc=;
 b=Tm+Ia+SgoeDa5fXtBbi5k9T80BKfPWtqz/KtX4cC0D1IO54QiUL7nDXJbvoVFK+i6miQ3IKAZ
 7TfNxEHrpxNDP2eKFgG7ZOW0akgtPOifXwZsuyY9l6FyKg9q021MnO8
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: 0RqN1ko4-CzNSCVpPTQ8X_nbF81Qjg6T
X-Proofpoint-ORIG-GUID: 0RqN1ko4-CzNSCVpPTQ8X_nbF81Qjg6T
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae5ebc6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=j3Ouay22MIlEJhTpI7oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX2+v6qXnG7bZP
 Cq03sSmBvYw+gjJu+tfRrAJh0fuMcpty24qW60sE4rQ4T2V6NP/+9GeZwgp3yf5LU3i2/TPMEOZ
 ocMh4YoRFNxxnTD0oV9ssIu8VswITtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX9IIkpSx3wnA9
 fZvUGw2JYGtRVGf1xBcw+YneEXLI+6iQLZFlJJkB+qyYJ1wACsJCp+kG3p/0zuO+wESq7zAEpae
 O7ARrhzmS0CwO1EF1d4v/Fbk/k4R6HKMqB63TLz/CwNQ66LHhHt5GtCAV7pjd+M3VIHXcC51ly0
 lRbeLUpfFEIE1JXp8yM0DmyHdjlnvp7y4FW0t8jRT7Bh+U0GTSqpxOeGXuTTXgUN7q6smhFe8sw
 FYRtUmcLiTrXcqLFF1VSBOVoyLhmAU45IQ7jEM35bCbH/trINuKTVfBT5amchjnFDn/hKus6NpU
 fkZq32E6f+1YlGb+Vg3KWY7jsfriZ8EPijmuAjKow9hRxFkDnjygvthVtLYypZsPR2ErQM2VAfC
 PXZAn/wGDim4FVyS7hQOK8dCQCqGDrGSKKUYObbXeErvIZfTJQFZyg0nTVkT4s8M1mWIbg5Itu8
 h5Z68MkivosxVJyVr6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

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
 .../devicetree/bindings/thermal/thermal-zones.yaml | 57 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..62590dfc77bf 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -152,6 +152,55 @@ patternProperties:
                 situation where the trip gets constantly triggered soon after
                 cooling action is removed.
 
+            temperature-bin:
+              $ref: /schemas/types.yaml#/definitions/int32-array
+              items:
+                minimum: -273000
+                maximum: 200000
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
+                matches.  If multiple sub-groups match, the first matching
+                sub-group selects the corresponding temperature-bin entry.
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
@@ -179,8 +228,14 @@ patternProperties:
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

