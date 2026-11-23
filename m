Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467309;
	b=JkUtN96IY4LG3uUW8p02t0yxfwLjeuOCT1H8TanqiEB1VdnaNoMMeARHeBffXjSuOsI+
	 z7iFN1kK/jomtfdS+O3VpxAUgWQhXrfABrrpPwyAnb+SlkYOwD680VBpd5CKeB4d2PHg2
	 OSpN+3nrXClDeWevfbOYK2z5lzRlFI1SJsaR7WI0mFSXz3vYQA0cGk1Y/81pM5Ur3dVhj
	 owPs7BP7kvjaCbiavwW4+/uZHP+hOsekF1Dz7zwV8kC1HpckQAViQcU5lGSshrvgH1zi5
	 1+cwL2vUwR9tIVo15B/AKqHsYb5C8jscRTSNHv/nm2IlqVOvv52sdJBjQnm9O+3M0rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m4Gg0S5k6435INA1ZtBPlYq70/Y86dn1eAS2yd6Cy3c=;
	b=voe5aVyZUy7qJL0tzmoLiti/N11PjEuRx0N1Co0hQMP0Lvx1INQRLZOEsFa/xnRWBYkx
	 o6sOivtqK1Gn8DTjmNqSnodA2MBkPRfQpXRHwpBO39mRxVIOyZQFn7wBeTdnY8rBRpKMj
	 OdslLK7hVESZqkuQ43wNXele27irFF1/nmnz12gNeYR92+0ex9IokRTqixAEyIw0mlBVV
	 3DfZxMh9o+z/J4+doGZRu1kz4HmauWr6Nbz2mAYvG7aRnxXUGnE5GnMv4TkuLElMuEvgN
	 QOi43vV2kKIQWb/p+djYmnc884Oaap00dCS5g1yyhOSIafnZXgCKe76DkNqpExVYRVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hwmXy8/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XJ/FQT36";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DF2606A332
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DF2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwmXy8/w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XJ/FQT36
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuPQm720741
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m4Gg0S5k6435INA1ZtBPlY
	q70/Y86dn1eAS2yd6Cy3c=; b=hwmXy8/wPTp5CxnVneTEj6McBvUmtL2HplTUmQ
	KOSDj8eW2Z+pdtKSj0XDQX9qSwXwkDwnAD+xXZmtqiRnEQF6h2/QGjLrfhsP6BFK
	bsQ4Ii4KG6pzIx6yICi0DDWj5wOM/L0aPmpPyQ2c1RcfkfUFlJPfdzyKm6MGP/Y2
	4l2ZnsZsqudO47Q2qZPW5X2tMrQxgoLsBdVwgOvDb2o8Yrpg6LaerbFWDVWzVEs1
	kJf6pHLNqIa1SMqD0Me8MZCNuY9CHvB0nMoZWQK3INxNqmxDx5+JlQqdQIBld4B0
	O1EaFMoh4xdizyreNK+hTA/ilzGZPMoa/wtikNZZwQDRvnRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgaev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so3426430eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467307; x=1796072107; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m4Gg0S5k6435INA1ZtBPlYq70/Y86dn1eAS2yd6Cy3c=;
        b=XJ/FQT36EQpG2+1jpOlgiMUVwPMU8PbPqT0WAOEfnVkBM6YqbQjHIQSdOMfIRXPyRi
         ZeSe6EBRBndn5zmBIOsY4EcdO3dQLzv+7Pm5gZMENVF/S9YSr6TZVbqvSLhFWQsZrAL/
         lFsoGfN1wET2cjAOXJME2Jlrp15z7UB5e2HZgR5ISINYunWzv8Sf85wV0GluVNyhGGtZ
         TtGhPytbdch5jxwGUBqGmcOjQxfV7KQfi+a2pt2LGhYafkIIQKZqBvVIgaGhJvL3NDbe
         4DJtFpmhDQI12Ja5YcNsif4xmtGopbFf+v/DlbsN93CarDj66Dns+FTwd2dqhkTyEVU7
         tCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467307; x=1796072107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m4Gg0S5k6435INA1ZtBPlYq70/Y86dn1eAS2yd6Cy3c=;
        b=ORfelX2iUSHv9d4sHnzoEzSWCFav8W8Zg3+g/IXGdqGe8OA/DsjzY2pvkHFrsX9+x4
         QPJx5ecmfvvu1jrpJ5wOgjixUfwoaGE5XPsbq2VKCD3/yeKnOvgCJDlmSaHCfC3o/ZIo
         shmX18byf4j5WYRun8TKaMX4FYaZBV9QHXRtL60ADhTscCG2IJCx9JJdJfQooYg/WfmG
         RBV4raPsJgajeBoI2JwpdXvXLYytJqBJC7pnrFmjqEkawGE9PQATak4QAX5PvP2XpYti
         Y6E0qv1AdG8/nXuZ3XbGSRn/cEY6u34o8a+V6YySTVQFmTtNYwdK6mYkG9C9f61p7YAy
         rGag==
X-Forwarded-Encrypted: i=1; AL+hErEa4fc5ktv/O7kC77JGVlECfUeI4YySzaz/Pb9oPqB5E6qK4KxiOwFVkoLNMrzFBxeyxaU4nurzd8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T08JkjS0dloWUBaE3vZwCHh3DA3hWCk9+StRE24o5bRRYT3vb
	0U8f24MYOGsCT6GsJmhYGr3zpXY8H2erFFbcj439glb2oWOjViAaWPVd4uI8YqzAF7PXnga3BBm
	ABHqFzGAJNYzvWvgYpzLJE7iqcMvEdEhB6bw3aK+6J8CeJxqhRM/celb/7DymnJM=
X-Gm-Gg: AZFdTZcHM/xjeWmztNujyYmjMqPxR/SBsh/BktoTKVrb7C3zKfFmdiZLyt5YvxpbwTR
	i9dP7zmGfdB8UQkOI2U4zJFuw3OXkfzecd5tbgRiCU/4JBGZhAje3XCP3hB7+XkDyHfbExw265C
	vrXEoCQVJ93QL58E2B+kjz0/zW7WFB1hjYCY2PjbriwbccMPk8wuUCx5vwDqPjpxwcX2ZLoZHQn
	SKH0ttJrN6OyQIUIEdzT90DnjmTasjeaPgA/pwurIfMFUDJwbICU1lliVGPovqouDh5uAziDd7K
	vA0I+ZBrPuF9Q50ONpuPihDeoWo7qu0lF00v2jqY0m7VAYrk+BeCPwj5FfOJtPjM8fn+9ssEJ3O
	3tBS/l7flGn/lpZCvMFZAZW7lVAU1RuEMhw/23PJkzJ3dEI2i1/FMixIB43QRtkpGryJGJiXV2z
	9AmSPk2q1Z
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr18417432eec.16.1795467306558;
        Mon, 23 Nov 2026 12:55:06 -0800 (PST)
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr18417375eec.16.1795467305833;
        Mon, 23 Nov 2026 12:55:05 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:05 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v5 00/12] hwmon: Add Qualcomm SPMI BCL driver
Date: Tue, 24 Nov 2026 02:24:40 +0530
Message-Id: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABCoBGsC/3XPwW7DIAwG4FepOJfKOBBgp73HtANQ0yA1YQ1bt
 qnKu5fk0ErLerH0W78/yVdWaExU2MvuykaaUkl5qEHtdyx0bjgRT8eaGQK2QgjJLyH33Icz777
 7PPCjCdZCJLAoWT36GCmmnxV8e6+5S+Uzj7+rP4llu1KA0P6lJsGBay+xjeC1duI1l3K4fLlz7
 fWHOtgiTvhQNOJGwapE8oQGFAntnyjNQ7FoN0qzKCo4AGNsiPqJIu+KAFAbRVZFgbfOBN3Up/5
 R5nm+ARgqmruFAQAA
X-Change-ID: 20261114-qcom-bcl-hwmon-d8c990fe0924
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=7797;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=amOVXlt0YgK5m/43XjRUS8Xc2xOI+q2KY954dScqRz0=;
 b=Imkgrw9lFccnrFBrzh1D6sSYSh0t3MbbpQ+u72dSeOnIDbFpQbei+BJAAuy+4eRuBeLM3J5VF
 v8ybA+m78A9B9MdL151875/hFZ0JFCH8xzNUYe8XHSJI5g/3QGAIuNt
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04a82b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8 a=jZPNHtCe3420C_rECVwA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXzq1LCt/bhDm1
 HXMMB5PV2fgcqJyQycsPH62ZDfscHkAjPSxEZQepdFBaoLnolXWFc3DSwoSFrgZ3a1uTu40FAGb
 YGVubWcTEpLx8pCG9LEUj2o892nxVOdaQZaMoSaEHp4qW6z+vaLxI7kxZzEJFCx3XadfOrtzlzS
 n3mdc0yguuDtes7nSCU4TtI3Ev4s9Y31jKitmN5ZRke1s12brMYhrhL6U2EjI65A29SV5Z8YV1k
 1pUirKWHERp15cgZEjzNmp5LnD/1aUZa2MrEs6PWFKkSk98ccoKK8WUPA1hPKAlkrhcaMyIsty0
 dQIHXpMFX3OAUuTLqMBWIyg7oLNFNOuJoVf2N3wsoF7yP9woJI4wX9CPIzK4esZV0viQu4+oqOn
 f8M+b2JSnhBKy0TqPtpnO56tg728pf/wnQ9egETX1GO6Ilp7ZUHrEqurBgTJ0L9YymYDccEH762
 D+s5lqq0mec/1iWDcwg==
X-Proofpoint-GUID: PPjGHny2y36WNBzVTz8NH852EohlhL-g
X-Proofpoint-ORIG-GUID: PPjGHny2y36WNBzVTz8NH852EohlhL-g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX41aGGlNkRV4C
 xmpVyF4DaxPso38h2VhQrFX6fj3z1WtWb3qcJqvp4M9mCc1KUa5ZijDb43fHk//UEyfI4bwwvuO
 zIOcuCWxQATqVLGNbLQt9cg8fUcbwWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

This series introduces support for the Qualcomm SPMI PMIC Battery Current
Limiting (BCL) hardware monitor present in various Qualcomm PMICs.

The BCL hardware ensures robust battery protection by monitoring battery
conditions in real time and triggering interrupts when predefined
thresholds are crossed. These alerts allow the system to respond
proactively, preventing battery degradation and preserving system
reliability under adverse power conditions.

The driver integrates with the standard hwmon subsystem, exposing battery
measurements and configurable alarm thresholds. This design enables
seamless integration with existing system monitoring tools and thermal
management frameworks.

Key features:
- Battery/system under voltage and over current monitoring support
- Real-time voltage and current readings support
- Configurable threshold-based alarms (warning, critical and emergency)
- Interrupt-driven notifications for threshold violations
- Automatic threshold management with polling-based recovery
- Hardware-specific scaling factors and threshold representations

Voltage and current monitoring can be independently enabled/disabled
by firmware, and the driver automatically detects the enabled features
at probe time.

Dependencies:
- This series depends on the following patch, which is currently present
in linux-next but is not yet in the mainline tree:
https://lore.kernel.org/all/20260813211433.879638-1-linux@roeck-us.net/

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v5:
- Fixed a use-after-free on driver unbind: consolidated two separate
  devm cleanup actions into one bcl_alarm_cleanup_action.(Sashiko)
- Fixed a missed-edge race in bcl_alarm_enable_poll(): after enable_irq(),
  the alarm status is now re-read before notifying. (Sashiko)
- Fixed a missed-edge race in bcl_alarm_enable_poll()
- Widened the threshold scaling-factor math from u32 to u64 with a WARN_ON
  guard against a zero scaling factor. (Sashiko)
- Deduplicated bcl_in_thresh_write()/bcl_curr_thresh_write() and the
  matching read helpers into single function.(Konrad)
- Replaced the three separate in_mon_enabled/in_input_enabled/curr_mon_enabled
  bools with a single features bitmask. (Daniel)
- Merged the separate IRQ-name/hwmon-attr lookup tables into one bcl_lvl_info[]
  struct table. (Daniel)
- Removed the now-unused bcl_get_version_major()/bcl_get_version_minor() helpers.(Konrad)
- Dropped the qcom,pm7550-bcl entry from the of_device_id match table. (Konrad)
- Widened bcl_device.base from u16 to u32.
- Dt-binding: Reworked the compatible property so qcom,pm7550-bcl requires
  a qcom,pm8550-bcl fallback compatible.(Konrad)
- Added hwmon sysfs ABI doc for the driver, including the full compatible-string
  list and sysfs attribute table.
- Link to v4: https://lore.kernel.org/r/20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com

Changes in v4:
- Dropped empty line from pm8350c devicetree change (Abel Vesa)
- Fixed use-after-free in delayed work in tear down path (Sashiko)
- Updated DIV_S64_ROUND_CLOSEST instead of the biased add-500000-then-truncate pattern (Sashiko)
- Updated regmap_bulk_read() for the 16-bit LSB/MSB pair (Sashiko)
- Removed dead code after above fixes
- Link to v3: https://lore.kernel.org/r/20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com

Changes in v3:
- Rebased series and added 3rd alarm (emergency limit alarm) support for all PMICs
- Used static hwmon info building instead of dynamic info (Guenter)
- Removed unnecessary generic labels sysfs (Guenter)
- Renamed struct bcl_channel_cfg fields with _mu suffix for clarity
- Removed linux/mod_devicetable.h include (Uwe)
- Fixed uninitialized cache timestamps (sashiko ai)
- Fixed Integer truncation in threshold writes(sashiko ai)
- Fixed Missing data_field_bits_size in pmh0101_data (sashiko ai)
- Fixed DIV_ROUND_CLOSEST 32-bit architecture issue (sashiko ai)
- Fixed CHANNEL_CURR max_mu values using correct formula
- Fixed critical teardown race conditions
- Added device tree nodes for PM7550 and PM7550BA on Eliza platform
- Link to v2: https://lore.kernel.org/r/20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com

Changes in v2:
- Reworked the binding from the generic qcom,bcl-hwmon.yaml schema to a
  PMIC-specific qcom,pm7250b-bcl.yaml schema using exact compatible strings.(Krzysztof)
- Dropped the DT-configured overcurrent-thresholds-milliamp property.(Konrad)
- Renamed interrupt names from "bcl-max-min"/"bcl-critical" to
  "max-min"/"critical".(Krzysztof)
- Limited the binding and driver match table to the supported PMICs:
  PM7250B, PM8350C, PM8550, PMH0101, PMIH0108, SMB2360 and SMB2370.(Daniel)
- Folded qcom-bcl-hwmon.h into qcom-bcl-hwmon.c and removed the
  macro-generated alarm mapping helpers.(Krzysztof/Bjorn/Daniel)
- Reworked the driver around per-PMIC register descriptors instead of
  generic BCL generation/mode descriptors.(Krzysztof/Bjorn)
- Added support for 16-bit voltage/current input registers and
  SMB2360/SMB2370 2S/3S battery configuration based scaling.
- Build hwmon channel information dynamically from hardware enable state
  instead of registering static voltage/current channel sets.(Daniel)
- Improved alarm IRQ handling with per-alarm locking, wake state tracking,
  shutdown guards, and explicit delayed-work cleanup.
- Switched probe/error paths to dev_err_probe() and tightened BCL enable,
  regmap-field, and hwmon registration handling.
- Link to v1: https://lore.kernel.org/r/20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (12):
      dt-bindings: hwmon: Describe Qualcomm BCL hardware
      hwmon: Add Qualcomm PMIC BCL driver
      arm64: dts: qcom: hamoa-pmic: Enable BCL sensor node
      arm64: dts: qcom: pm7250b: Enable BCL sensor node
      arm64: dts: qcom: pm7550-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm7550ba-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm8350c: Enable BCL sensor node
      arm64: dts: qcom: pm8550: Enable BCL sensor node
      arm64: dts: qcom: pmh0101: Enable BCL sensor node
      arm64: dts: qcom: pmih0108-kaanapali: Enable BCL sensor node
      arm64: dts: qcom: pmih0108: Enable BCL sensor node
      arm64: dts: qcom: smb2370: Enable BCL sensor node

 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           |   72 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/qcom-bcl-hwmon.rst             |   67 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |   22 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   11 +
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi       |   11 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |   11 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   11 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   11 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |   11 +
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 1434 ++++++++++++++++++++
 18 files changed, 1721 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcom-bcl-hwmon-d8c990fe0924

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

