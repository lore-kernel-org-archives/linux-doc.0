Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452994;
	b=IVXVAM59xT2K2cogbMHU1mUTlP9SuofAI5DTA0HCTHggf/c7pB+nFEQbNRd5/P+btpZB
	 8vMsQIFmyHu5DkCj+0YiP3DtOCDV7SZt4rLJRAIYsXT5YNff0CY47ikSafGkCFirvTIEU
	 BORqOClgJt2fXbErxPDZw2fz8Um7tfMYrDndRm9msjLaqw++jbPAlylvCJMMlBSlgnU1/
	 FsJQnzx9oAQ+4fadmMDG31cQfX4BAh9Tf0JBCD9VLSPe8MtIpyZUfC+RNgOBDu9aHvU7G
	 876Snk6Gl8Xlce+cNplBsMxKxl4l9oM59TyhBRmyRO7BFft9rDuxndl+7GUeDbwV9cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4oSUppzxzHF3D+dg1jUudVpg0qnnD2G2Yi8QoIkwJ48=;
	b=yb0d/qWdL1xJGRoK2Q3nV4jy5LOM7cBowKt1BXVCAMS3Ikk/79NBg8h9BSqcE/apZRMU
	 9afUJAk9ckpK6NYS9aGsPOmnbQtJMhkA0ud+Zou8EeyxviqVVL7oTCCRiRQyuwhg373iY
	 1MqgzjuJYjmyPMBwWzJVOeWJvXyZKbX5sBOorfKNe2I8MT/aAUzIvlf0KKzzFvmze2axu
	 EayMfCSnbXs6h8zHDOK6+RMw7mPIsRUL0agCmLXEPC40C7dZCI8RYAag1T+HTCfyWLwbw
	 vdzdUjgLJeRRfpdUddURHwhhWsrodFR5Vdqtewtz5saNr2m3U/3RV+M8NKVKHAoYwrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cgvrcHcv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LZQ3R96Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F860606A320
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 13:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F860606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cgvrcHcv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LZQ3R96Q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD032c1233015
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 13:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4oSUppzxzHF3D+dg1jUudV
	pg0qnnD2G2Yi8QoIkwJ48=; b=cgvrcHcvCZNzVtSvV+tBKNVF/ZohKSMCXHsLDR
	7pMaDiDHuenF92r1ZIXt2wUzDXiBmM1US0Bi3Z0jHukA68ihi/IM2pegxHuG/wAr
	6pgvlxLpVNP+kNQOTQXOk/kwf35vTEqTxAvbL0XV0iH9+P2v0nplCY1Rp0gd54j/
	WUdbzCAIwnFcM6bBjWBsaElL2BlbEH3a/MIQvDQgA4ljvQ+83OxMcawZjVGEQytY
	gHK/mxicw2hpNfILmqLLO4A6JxR7jyaNGShPWHcDaIscJUEYjCXDdpguvCkgBMHO
	l+sWrMoEuv3prrxvVD52TlMFXilTYbO/AH/7fpyVDH9uALkg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98yth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 13:23:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so1905183c88.1
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452991; x=1794057791; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4oSUppzxzHF3D+dg1jUudVpg0qnnD2G2Yi8QoIkwJ48=;
        b=LZQ3R96QnU+Gi19XZCAZanIqNUuiLezMaVE2deiiYIFJ5SHjkQN2trIpyWarsGnr96
         R2jDqCeNU+6h4q92jJ3+TgIfgCHEDBTBz428/lFCoIN2wXrRj22JCLKQpxbctxYbNL71
         Xa4S+qg/7CJVsK3xiX2hxQJi4XOBj6gNxysu3oeB9yKi/3ZpMVHwHmlAl/0SYPq9TFxx
         MGMdKZCX9suaK+ef1wGwDPZ7JMisVxKkM5+v79E8zX/SACiZFwBdB2Xgj4LFUpJWDh3Q
         73AvgGtn6AMfiyuXTnrSpHioC2HSZ3GS5kDY7L+oE7P+IniYDuCzsqfQNIUkYjMrxKf3
         nxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452991; x=1794057791;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4oSUppzxzHF3D+dg1jUudVpg0qnnD2G2Yi8QoIkwJ48=;
        b=lArYDOGV1KXXY6matElxva4wF6KylQUlXvEYY/M6U2FaDTEYnO+X/vcksRJB8i+JU3
         ZesW9luA8D+aw5xjYa5/Ph9lwUJknzU03vo8kV7bZpQmk8tXrKlnNjBZNVxuvc4SBtV0
         WgL36Tw2l0VvEAOkh9ZOgCTUnZajwNanVmvQQGIoeS3KMn3UV2IEoqp3WXRg9PoIpt/o
         /zUH5IYDRh0OWJ2wQShzvFcWeIVzOhSOSfVKsMhTgayCF7dNs8OYkKsh/M3dPjHpudPy
         Xm9BP9JigfiPXoK/t0e/msBPEU1F9U/WrTDffqOG1fwRPtf5Y3aXySfBGO98GtsrwlUn
         mUvA==
X-Forwarded-Encrypted: i=1; AKwUvBynoLb1rxqd0pVkYwetUgEJ8vszm3rmz604zoNO9C7Yz2ds/RujE1poHuceZTfTWkeWNBupxTH1on8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRA70rCmSYRA+tQIX0HLYgr2bSKKUtkulJnk9x5atlxuw/9z8b
	IkRrTAsKM5/fns7zBXZtShNzMt5Lq3GkK+S9Dxc5itWG6zf6SBqI+Zhoje6DWUFKCLBJMF84Z+P
	Myf9MNHPyvjIElVtJATcAHFaWmLoZV3eoz9eSrNmZ2mjTE4+KWm/8Qlw3f86Kba4=
X-Gm-Gg: AYBFou2KS6swkxtqduZS9T4/Bv/nWGKIQC2bpuqZNHiLKhlD8mAXlv/JBbYK2a6apoG
	trHh2Rv99jU6cTwa0JtG2qBtqhAX/Xg73lekWinOmwmhBZaRutthmJGmw0mWBeJt5JFeKcIK6T0
	plea/gFE9mPQvbvGG8EQ+2IvMsTIurhI4CMtaVgy08N/sFDK/7lWZ1K7G0dEl8swLEyQM6hX4Oc
	LXG6Ziv6eaN5G3mckP7l3VBbKBUR53ibSELS7pPFbX6zlsi4qtySS39CWY1flnvvP/Ga+aYykhU
	I8oviqfwBrT08zj0j3PrGKzgAgq5I3kwa0qGXx0kE0pZmhduY+jZ/1HKjmvV0eHY64HQgfBaFRe
	ubvVZMiftpDxhEWFX3S5ydJtVXjEW2EiieUWcWjlYY4RJpdeM4abnGjEjsxC2l6/UUsPfysMUBP
	yMHo8=
X-Received: by 2002:a05:701b:4502:10b0:18d:96e8:b913 with SMTP id a92af1059eb24-1ac5f64afcbmr7058772c88.47.1793452991107;
        Sat, 31 Oct 2026 06:23:11 -0700 (PDT)
X-Received: by 2002:a05:701b:4502:10b0:18d:96e8:b913 with SMTP id a92af1059eb24-1ac5f64afcbmr7058733c88.47.1793452990367;
        Sat, 31 Oct 2026 06:23:10 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:09 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v2 0/6] thermal: Add hardware-binned trip point support
Date: Sat, 31 Oct 2026 18:52:46 +0530
Message-Id: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKfr5WoC/1XM0QrCIBTG8VcZ5zqHCsvWVe8RI9Sd5YE5S5cUw
 3fPdtfNgf+B77dBwkiY4NxsEDFTorDUkIcGrNPLHRmNtUFyeeS9UGx1GL2eb4YWNqEyaMeJo1B
 QF4+IE7137TrUdpTWED87nsXvuzuCc/nnZME467TsDSo8oe0uIaX2+dKzDd639cBQSvkCfTZIX
 K0AAAA=
X-Change-ID: 20260917-thermal_bin-fe7becdf0e17
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=4715;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=MRemRaOBOzvAS+s91I3hR3FSXCHfN0Am3nSSTty9cbc=;
 b=Y+4eo6jLmnpvhRPgCYXsO0sY0h6PwZfNKxRNFHd0HoR+PgpiTyd9NwOWHU2fj2AW5kVaV+Wfh
 ImDebT/ed3pDFmlHJu6sjPOIsUTV5u4Z3aNiv0mayuqPbb7U4n813q4
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: 5amv3attfPX0WsHc9FR8QZz8mhnNBE4i
X-Proofpoint-GUID: 5amv3attfPX0WsHc9FR8QZz8mhnNBE4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX580/WFrgKTUn
 efhwqobvHAR4cOTZb/phA6VVas37FAioKb/XNPENDDmH/awyMlJw1H0lIyX47qClVITLIVq9Dvi
 qAFmwq37uBxaoDzHCx02unVwi2IAKdcWZkOPVQrQVQihz33DkjcIbgEATYRlrJWEZE9xuIxkM5+
 H/ohqLMSeQhebybrfIlQuVKyQdoFGqVsDbULfGZWyMDqG/nFpORZVVtKUdogpMJ7lt/K77aqbwZ
 vhUs6/9BWChWN9PnnoLJdrCICckQXHLAd2pwgsWziaVnpuEH08bURqrNVu9GaldY2SaGt00BvpI
 TBguh+P7BS1v9PpgcquKqGuISBdvHixJ/cdr9nft4c1ufrt9kKfkHs5kEn0yOJCjz8Sg4h3aeZR
 pX0smZbfSW1vECwuEoGWjg1NqCE/ZbqgcQxXTnfYFSo4Mhkjff0YYnJOyYlDRWKgnr2HXKkTJMz
 W1gI3OzQLswidKY0f1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfXyVZmhQ0T1+yP
 Jsjpv27y1EjTx2M7W2ceefu4EhDE84kdZLN6qs/0RdV/GlKhcdbpTVfHrRBY0PJoZDKhl/7fWL4
 x2rLl6A9PYgQgAnDoGaV5zoj6GLejYc=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5ebc0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OGjWj8McAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CgZP1dY-1rEdhbSE9MUA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

Some SoCs are available in multiple thermal/package bins. The silicon is
otherwise the same, but the package/bin determines which junction
temperature limits are valid for a given part. This information is
programmed in manufacturing fuses and needs to be reflected in the trip
points used by the kernel.

At the moment this is difficult to describe cleanly. Board-specific trip
overrides can handle individual cases, but they do not describe the real
hardware property: the limit is selected by SoC fuse state, not by board
identity. Duplicating thermal zones or adding vendor-specific trip
properties would also make the binding harder to share across platforms.

This series adds generic hardware-binned trip point support to the
thermal OF parser, following the same general model as the OPP
framework's opp-supported-hw property. A thermal sensor driver provides
the decoded hardware bin when registering a thermal zone, and the OF
parser uses that information to select the applicable trip data.

Two generic trip-point properties are added:

  - thermal-hw-bin:
      one or more hardware-bin mask groups for which the trip is valid

  - temperature-bin:
      per-bin trip temperatures, selected by the matching
      thermal-hw-bin group

This topic was discussed at the Linux Plumbers Conference Power and
Thermal Management microconference as "Thermal binning support". The
discussion covered how to represent SoCs whose valid junction temperature
limits depend on package/bin characteristics. The approach taken here is
to keep the DT description generic and let the platform thermal driver
provide the hardware-specific fuse decoding.

LPC discussion:
  https://lpc.events/event/19/contributions/2245/

Slides:
  https://lpc.events/event/19/contributions/2245/attachments/1885/4034/LPC2025-Thermal-Microconf-Amit-Tj-Thermal-binning.pdf

Qualcomm TSENS is added as the first user of the generic support. On
SC7280/QCM6490-class platforms, TSENS reads the jtag-id and feat-id
QFPROM cells and maps them to the thermal hardware bin. On
X1E80100-class platforms, TSENS reads the i-temp QFPROM bit. The decoded
bin is passed to the thermal OF registration path before trip points are
parsed.

The DTS patches use the new properties for the affected Kodiak and Hamoa
thermal zones. For the standard bin the passive trip remains at 95C; for
the elevated bin it is selected as 105C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Changes in v2:
- Format temperature-bin as separate DT cells. (Konrad)
- Add min/max constraints for temperature-bin entries. (Sashiko)
- Drop the post-registration hardware-bin API. (Sashiko)
- Remove CONFIG_THERMAL_BIN and make hardware-bin trip parsing part of
  the thermal OF registration path. (Sashiko)
- Keep hardware-bin selection registration-time only through
  devm_thermal_of_zone_register_with_bin(), because OF trips are parsed
  synchronously during zone registration. (Sashiko)
- Propagate -EPROBE_DEFER when TSENS cannot read the hardware-bin nvmem
  cells yet. (Sashiko)
- Link to v1: https://lore.kernel.org/r/20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com

---
Amit Kucheria (6):
      dt-bindings: thermal: thermal-zones: add hardware-binning trip properties
      thermal: add hardware-binning trip-point filtering support
      dt-bindings: thermal: qcom-tsens: document qcm6490 tsens
      thermal: qcom: tsens: add hardware-bin trip-point filtering
      arm64: dts: qcom: kodiak: use thermal hw-bin trips
      arm64: dts: qcom: hamoa: add thermal hw-bin support

 .../devicetree/bindings/thermal/qcom-tsens.yaml    |   8 +
 .../devicetree/bindings/thermal/thermal-zones.yaml |  57 ++++-
 .../driver-api/thermal/hardware-binning.rst        | 112 +++++++++
 Documentation/driver-api/thermal/index.rst         |   1 +
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  66 ------
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  42 +++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  58 +++--
 drivers/thermal/qcom/tsens-v2.c                    |  16 ++
 drivers/thermal/qcom/tsens.c                       | 190 +++++++++++++++-
 drivers/thermal/qcom/tsens.h                       |  29 +++
 drivers/thermal/thermal_of.c                       | 253 +++++++++++++++++++--
 include/linux/thermal.h                            |  32 +++
 13 files changed, 751 insertions(+), 114 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-thermal_bin-fe7becdf0e17

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

