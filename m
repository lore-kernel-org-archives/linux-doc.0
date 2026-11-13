Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559461;
	b=vhTXIDebEswHLZyqikidargPK+A8TnDG9zN3/jDs9XsiUlSANMgUJDHFTqQ2YE769BDc
	 yxzjZHDOZcjHOKkb3dU/pJdaDwM9sjvbu3m6YU9ExM1NmX7ClJrfvRGP5fwNUn8dCNuUS
	 AJG6YIzDpdp4lqsIsLAA9mvZ6S+wYu+qS+eM3SjBqXX1Cfm/hoxuvfaZ8izwiAeRdGpwf
	 oqmwpSOwBA6grsLEjJcTrSqxklEmuBCfBlh0QNSeAvBfbUk7uVnfrv1WGTYMlflGWk5ml
	 rJ4A0xPcN5ydJ84bcfx3BB5qDhgthraGSbl9TYNUfDpm9a7JD/3Htv3Rr3ziHsQsbpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Cy3AvJDhrlzoEp/i44V1yM1DzmGzaROP4/Q3KSzyLzc=;
	b=aK3jor21o6WePkRdX/3Ow9lbjuRfPjvS5QmmRwJ/tF/qYKn3Ibax9YZsRj+AJ1AYBjK7
	 cQCAfsIyXQv7CPLANXf8OOVNZgE/SiDoFxm3BR7pRbII81pAGPCmNtqsEMnNUhuH1B07r
	 ej0ReTaGwlhabK0xhK7a28qjqlHbXtFVPbyvkwSA/u9PeuTEdRYBLwYWgQdEV47DAV4YI
	 ozOH/19W/wUM8yPj5EW1xFlnab9mkCkCMq57wIC+nsAitnMn79R0KbT8SzHgpRFiF/jR/
	 qxnR19UTRHMnZGyusHpN1uPtDR0nENP3yclcwVX8VJtTZm64jHJ6XZHdplD5M7PcS5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/289O58";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoBphwVR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFAE606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFAE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/289O58;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PoBphwVR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V7uC619141
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cy3AvJDhrlzoEp/i44V1yM
	1DzmGzaROP4/Q3KSzyLzc=; b=N/289O58v22oRQmUmNi1VIskBnYuHEhIw5O0KP
	3FCAu4aNG0PMJW8GEHauHuvpMoOIwhq0mlso/soEBv2JfC6rkhcuN5yBxL8SOHnJ
	63nGx/spMt7YLd+wrXMI8yESSbnVwXTjDFLKW3WmgdQVVqcf9DGlrWVNLFhTN99/
	triV72jLM1bhzt+3xCnNcbml5QE5kgISORnXobhjTBk36QQ4xl7wk28ukC2JA1FA
	WuOCYrsbrYc2jFB1RJqpI25zskkdrL7TYBoIGlbfifCNhTWNDqA/GntmsM7D4f/9
	B4NdFixpyforbVkIXnTZHIp0V4anyBO6IzdmFavypLOlGdMg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs048u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:44:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so421247eec.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559458; x=1795164258; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cy3AvJDhrlzoEp/i44V1yM1DzmGzaROP4/Q3KSzyLzc=;
        b=PoBphwVR8SjzJmBQ5BMpjKxYqNWTFFJxIPqxbWc9U1wbRifOvAqApAGsEUhygBOC2u
         81XX/tKdCmwj6b90ddQC1PZS4CoJCwdiRpYFdx3jOgk2MY7k/YgM8l8RupFcTKbGaEnd
         WH+d4Atn4amhs5yrVp/aap/C2JPo86f8sVWQW0b/+M+PW8z4oV2iTZi2HpeR+4sKOE/E
         KZkJh/q9z1VvZEJUSuOmzKmEkgW9EE/Eojq7kHPDDoKsSo/yK9kKYk8j/ZsynnleKhTO
         DDVkDzG4MhsWNmfxHhDWTeYTjPmOBUkUjCZvZF57zma8IwRWWV+YOoZJJ+kxXrhyLg+A
         66qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559458; x=1795164258;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cy3AvJDhrlzoEp/i44V1yM1DzmGzaROP4/Q3KSzyLzc=;
        b=Q2sTcdwLBJ35tRxm6sRI3BTtsv0GZqPV1CwDGkKe4gwooc/39n+W7P9L7vj6ngjOdR
         ErqHv1fexQOw6airbOZ5TdzmNt7uOilpkPWxZuwSs2PjcQ4v/k3I+v+OL9GnXWbyJuKx
         Os7vGiL7XOvmUo0juIfjLYjUpyZ8vgybBHRGlbqBGl4abae7HnCk5E2C+XWA0DQIU0nf
         LO88JUyvWSX5/RtFJWNI/RqY3yjHIf1SUTOWSxNywOmHBU7O6CTiqjhu7X6yt+Rt0whJ
         ePCz0ZHsHNR+LDxZU2GKlgSmrhV4MAQuQxug9/SMysKbGB8XGJ1QkQsQYa1zwZ7C12S7
         zgAQ==
X-Forwarded-Encrypted: i=1; AL+hErE/fmNk20wo7vKLe9GTyPenXHM4JVJ3e52vFz/qGhfzqsD9wHf8LdkDrBcDyRSwc7QwgH93QJI5j8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z91oDZ3JO52dzITpnhNlL1JNTNA1RaXiSSsnQA/fnh3gK16V9jE
	eAXOv01qz9VgNWpbrT7Fwwij0yyGzIaTRL/+4ZdWOhXiyB+1BX52BQmbBErDMgDp0REbEj3W0Mn
	K5wKcxVfpvLPkLI00Mtd03UU1pCu9/9cHEEryjuvu8DF45bGWWo3OHCbnk1qZH3k=
X-Gm-Gg: AYBFou0/OwKOKsMSfPnFZh0nm5cC0w1x+5ZclZEXlEvdTjP5PXMXn0B3RNcfKXp492r
	atWRE1M+HxlN1WaJL3q4ifvj6GhA431ogZHkXsB3ylbOganWcUxZx3NmowSZMr57lEsyE3k+iSh
	MIbqtAyNid1vFOStWHJkRwvcwOb8YUzIkN2398neElrUxHgrb9gGVWglSWsdvQSxsWzPfn3sJVg
	g7DHHxlprDA98pEmUEQZycMIoCTL0MHWL7BwbWXXIxQyVoizz14I9Ps6dB+B48W4M87jcCczJd0
	vAB9aImKnLaGF9Tnp6nfWpNN54nO4eA+/D7PPdu8+8aOg1oVdDEyRBwiwi5jZuMzD9anQCpoA9Z
	fzdhgOeCLST3rt+AzBWrHos90WMxvPTDPz9ZuwdJeiXoLVE+S4NxrWU+lt0E9UQRFcz+RamcmhZ
	7pRRk=
X-Received: by 2002:a05:693c:60d2:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-377e1cebaffmr4662507eec.27.1794559458097;
        Fri, 13 Nov 2026 00:44:18 -0800 (PST)
X-Received: by 2002:a05:693c:60d2:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-377e1cebaffmr4662461eec.27.1794559457406;
        Fri, 13 Nov 2026 00:44:17 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:16 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v3 0/6] thermal: Add hardware-binned trip point support
Date: Fri, 13 Nov 2026 14:13:43 +0530
Message-Id: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMDN9moC/23M0QqDIBTG8VcJr2eoUdau9h5jDNPjOlDZtMlG9
 O6zrhbs5sD/wPdbSACPEMg5W4iHiAHdmKI4ZUR3anwARZOaCCYq1nBJ5w78oPp7iyO1IFvQxjL
 gkqTF5MHie9eut9Qdhtn5z45Hvn13hzMmDk7klNFSiaYFCTXo8uJCyJ8v1Ws3DHk6ZOOi+CEKf
 iREIoysrGGyUNDUf4h1Xb/WdNvM8AAAAA==
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
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=5075;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=v+B7zag628LCa5QlWMrOOUPqcaxGK5K9/TVhWhfCj2s=;
 b=fPA7n9pK9SH7LHcZWJtAY5nxkjvpnLEikRoSDiB5Q+VoSksczQ4d8KWxk9VjsRJehSKbBJ1k0
 SujInmItuBiAbdnApZgOu2ZpepKcAdxzLMCNpG/mgxGJ+qoIZq3iZ4x
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX5LbsKFoPWQM8
 +0PXZbRXINkI3pT5pvbddAExnHZVCn1aII4Upid3cw++NG2wqcQFQ6Xayio9TVOiPp0oq4FoW1T
 qDV/taULfYr0qNUY7svEmFU1R4ySYKwaRNFdjcbJrgwLcT3j7oZrw1b+H79janJ1Ex6h6d2VEoW
 iMGADqIynbqkDN5Xd6WpP9ueBb/hA93zPYICuX6YJ5P9dJe2nqDHcCMjwOZESg2ZwZJB3c79GRh
 n33CK+/iIpAiT7DGoD9kdN1qfapJ6nS3Fna4kX+lJuw1GEyW+E1TheAFbi7qZtauWbsWyVA1sy6
 A3czDjGFsf6Un+IWBntrLHtlu8M2E57A0Af/HQ7csV1+1AElnx987ccap4ETmAH2fF/XHUECu07
 oDGCikIt418sD4ZZOS4pRDgl/8uaMioZaurydTjF70ABHGWVbEmeRLJqz9EnYDsj5zNsHjMFhWs
 0QZNA0GM/hfGpa7X3WA==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6cde3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OGjWj8McAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hd7cryhKw5KO45NzTFkA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX+QOC1xCsh6Df
 vzpjCF6zNupDUJQbDqx+mypJsnbd/waPIrlejf7LUBL/sIBBvF1LtCm968ov9ncRxN18wMAHvsI
 aZ5JgIfF5VYOdy8MAlE/QWl9Dl08at4=
X-Proofpoint-GUID: 1L_M4FRItxCiyYBFkG0jG76bQxCT7Rz2
X-Proofpoint-ORIG-GUID: 1L_M4FRItxCiyYBFkG0jG76bQxCT7Rz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

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
Changes in v3:
- Add minItems/maxItems constraints for thermal-hw-bin. (Krzysztof)
- Return -EINVAL for invalid trip types so -ENODEV remains reserved for
  skipped hw-bin trips. (Sashiko)
- Add Reviewed-by from Krzysztof for the qcom-tsens binding patch.
- Link to v2: https://lore.kernel.org/r/20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com

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
 .../devicetree/bindings/thermal/thermal-zones.yaml |  60 ++++-
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
 13 files changed, 754 insertions(+), 114 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260917-thermal_bin-fe7becdf0e17

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

