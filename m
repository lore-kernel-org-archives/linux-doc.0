Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559468;
	b=1VAyGgPxHk1PcV/L9c7p5RsCTg5JB9bZXOVEB1yqsOz47qn9x8ynDfxJuaVGlmJuUP6C
	 xu+0m4IO7HTjH1HemXR0cIOzg+8C+lOdFgAQKw9JiblNFAt2sB7BR2CdweCIBnVL0duKi
	 /YWxUjzh3l0//2j6QKkHi0RJ8c8S/ivo/8/xJZ+fLI8XvGtlrY5HedHMkS6q0JiCd5RYN
	 06Rujx4q7woi1Ea6yEDyZwTDtzMV7IREGwGaEZ5L5ltXb2S/f2F5g+yXffRtaaT/6fX8q
	 BDGMkwDrKqa/i7weitJsP1PrgH4NeRohFlke/CKmhPSR0EjEujiaByWtuKeHrfKO6zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559468;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
	b=jngVu4I/UBzsnYcUPs80/aKyW2E6LMkZ6Aq/S2T4FMhIM7T+SM7meo31sHvDKZ4cPXtc
	 yccXMlPZBYomaWRbE8kwVStozKzzJyBO8//b3NCjNMR993h5d0tEQrBP+uce1RGTziG1K
	 BErWObjwbxOPRE0F3keOWUS4C7g33VTp72ua+Dykh15mWmRdqrFmSSqqVedbX4GUNuYnt
	 /RYr/7wXsqEoNlGe6T1P6Yp+jqp0aVZEex9rpt6eXRkuIuKdXokqGzvTtC16XyiK7Dx8F
	 JHaZU9Y70cwkEOWO7pnXPj2y4w6R7ee1tb0qmUpXL96zQLzIIOb0M41REyPPH5e7c/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu2EkAfO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MD/0eqTj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612F606A337
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4612F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lu2EkAfO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MD/0eqTj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V1Cl3826907
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=; b=lu2EkAfOaTXC691p
	FGXwc07l9Q1Qpjm8XPZMLS5T15O3ogvsIM7DOdKXgir7eos/GS5KjncUeRIlZaO1
	FzFglnAYiWuEy9jAb8keYyZQLg1PLjDeNKzuzF6Akk+Wvmv+tOhNdJ9KUCRzLEyb
	fOdIw0AKNVZfDdyw9TRg6/EIXnFskSMNJKvjWvh9L9LxrEn/6CP092AGpVYvPYAV
	6SeSckd47ccAQcEP/jv8E6B66ZOmC5uc/wwMFcYcsXoeqbys1gLIKqhr7KnYvTFM
	TDOMroimQfSBfsqY7lWyxmPpiBvpJ6kqqQI4SqcxX/9g58Oek9mCYItQeh+aXrkG
	wwK/og==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37grrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so752270eec.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559465; x=1795164265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
        b=MD/0eqTjaU7gcfBgjSSpnIdLmviZWnyOMmBx1mL67gpxm9mOFFWoM+x0R7TYGH9SYj
         t0NQR7sBmbYaqqjKB2ekC/o0mdYUJwDmBrT++q85VlTQWs4iIMVGAPQUHFT2/hHoJ/o1
         c1640otYwDQXdwC9Lsfinb8aHqdt60iCoJi1Oxw0coXaoarixFqBjaDAteBHrUJCaY/7
         0DHsc9A0nC/FQjsCxOi4A0s/y2d+utQC47I4YQfHgqWdha37n+44Ki86ogGlBrx2xUhT
         XTJCd5ZaeEbwLv4D03/dSH/3fF+sEPQg7rXMVtAYB+YtDwDy4OUdeEjpcp9W+34xpJg2
         qKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559465; x=1795164265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCmlxpWNXorm8SdNGaH1ZfI8QxycbG+2/21/yQHnkxM=;
        b=Q3Sv2LQMTvMkP3ywoetxiMM9gQ6cUocUJPaYh6lrWNBUQznS+dVEABXpYQBpWCR8qf
         pwMmjp2I96yvaZj+t+wcmludxNMeOuez04CEy1MfQ8qvvYoGJneb7JYEYZcUjNWD17Ef
         YF7WzYL1c4LKevKwypzCr9ZhdcFq1uN9c+/G6goK9WNrQaciXaCCeTEbTpto2gmM3V7t
         4OJT9nJNihgufbd4vWGY1PF7kmeQwLQCyrSt9Inp68EhdKSlAa4SJRvgxxnGwfUZeMbj
         yERiSwaom7U/n27FfmxtpO7cP6a1Bk21RHXL20yvTHpKbIAGyRXrmTVuIGjt21Em5l42
         wXNA==
X-Forwarded-Encrypted: i=1; AL+hErGh7l0s5+hyrdi6GzCQyl/VeEBIE3ztD2flTvWaw0TKjHDjqwIcUqUOrmZfY5yAfdZS/V6gpXVtnww=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X9DDzCIyTdm7cBnr65YNhktT2tzlT66QpBBWZWLNQ+ybRV9Zp
	1pNyBMC1MBTfuLl4ecsXTrzLb1vz35P2Dl0fk1jrQ9t0O905X2dnJ4qGD4Kh7BED/GQHFN3D05D
	ADKFxmP45jR+P9Fu7vH0SpJwqtbkXJM6jjY/95FA7qDvBOLN7aIIFLBsKqrP6eV4=
X-Gm-Gg: AYBFou2ghNxcG0Ncox6Auc9N/gxvjKppqRiJhFHm2qmZZfxdg9NyqK35xroxNEyJw8k
	LjLkGAGr5EkGvQOeKMD3RsW4dH+djRJGOSpvuTHbAq/yua6RCjDPmeOh/LH10V6vEyLzDWR2i8m
	/u/d9PW80YwAa5YL2L5VYIZxAtrgAgZAGIlOBhIJsVx93cipg9ZJ/MJYrVTjjAi2m7iT+bjwqM9
	A2eayexpN529uWrP9QbSXCoSN9xD4Y0Ela3f8JUaFpj7ow/5hzWEumiasXJvwTH+MnNS5IR0I60
	H3kMJJnBJSpcNq968EwuzVfRSFZcs3/u+eJlkLkX+UYtaBi1eLX2WSzspLvvH+x9BbRGYhBSBkJ
	tu8zmwl3rIftt2wXDKOl4jHyjRHXBCWFelWGw9D0TnYC4yGN3Ke9QrQ+318usvduC4LnPWt2UBw
	/hJ5A=
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr1500735eec.10.1794559464935;
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr1500719eec.10.1794559464398;
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:24 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:44 +0530
Subject: [PATCH v3 1/6] dt-bindings: thermal: thermal-zones: add
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
Message-Id: <20261113-thermal_bin-v3-1-878df6eef8bc@oss.qualcomm.com>
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
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=4816;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lX4dJOooS+S1R79QALYmm0VfcAfISX3ohk8vnGBZQ64=;
 b=4LlJ6prFqGAHDuJ2zWVdrAwMBPgyUzaVitP1CjHO+p4Fr2qDwS3C3u3UrbgErcUcPI6AppLzI
 z7BdLbUpck1CrwnNWJVG1gPsrFRYgJ1WXcpvc+pD/SDjW7+eTm0YvSs
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXyTLQNVL4ONtD
 fzwi/NxXlZ4U3e9EHRUNFqV/Z8t7XPHu25D+n3PuDc9KNMxl9ReRRM9CpTmJu6O8Mn4u8UhLaea
 1BzZhkMnVUtKBZF6GW7cQyXAM2RufJQ=
X-Proofpoint-ORIG-GUID: S4_99o9_6xMkUht7D63DQDfScrYbJv4_
X-Proofpoint-GUID: S4_99o9_6xMkUht7D63DQDfScrYbJv4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXwZnNXH87o1Eo
 cppXLhpfJsgcEVIFrQ4cPJrBOKgSSybaLtQlB+ModNOMUasfhpBzCi2tOfqesYqcrcW5CsDK4mf
 /ucDhXbX6z8YkRJYSGxd2OG2ITAYDp3N40xGQtq6XBwplefvOnog9tYp290jnGFCg9WZw631pmb
 nZc2B/7k7zYShKpvZk534f+hd/WB8CdtRwdbVaHvz1g1Bcd2CB0b+0+XdWD189JwSvE6GDFLnyL
 KVaiJ5ge2fNQTS0jWfPU+NcgeCH3+26frLBntCKc1fplILvz2L9eYMgITSwSf8oTOkwq4yX/fuA
 MPAjLkogwPJLEs1j5Scn8BxxelTKAWMtuTG1rbcXgbSBC1KywCRfhfjsn4zKGf5CyRAcdm0fOp9
 qZlExkZoHVoHfYIZZKyrVqPQtpJgv3sELU3Ly3Fo6S6+yGStfP29jq2OmKYA7Gvn6e6TFBXVR1C
 WyH+KclR+9d+QcEKKPg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6cdea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j3Ouay22MIlEJhTpI7oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130034

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
 .../devicetree/bindings/thermal/thermal-zones.yaml | 60 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..cb9a8c96d053 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -152,6 +152,58 @@ patternProperties:
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
+              minItems: 1
+              maxItems: 32
+              description: |
+                Optional bitmask(s) describing the hardware revisions for
+                which this trip point is valid.
+
+                Uses the same format and semantics as the opp-supported-hw
+                property in the OPP framework.  The platform thermal driver
+                provides N 32-bit values describing the hardware it is
+                running on, in a platform-specific format.
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
@@ -179,8 +231,14 @@ patternProperties:
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

