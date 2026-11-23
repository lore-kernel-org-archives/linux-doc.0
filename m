Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417331;
	b=Jfu01p4b6kP6jf3dvEh6kl1vyhmdA58VW6Irzj68iwo0a85rzuluoKXGTTa4XLzoxceW
	 RJ+jJBRwzFYg+gTMfvQn3HFgspMEQ8jxm23MAO0J0YTJS3VuKiO9DHTX7+mkJP7qmMvaT
	 7AdAEYQb0uKmoueeNSzY3F9LqbxaTcm2wnNMInYDKfeCjWvHpmdNbOdln5MdUGD2o13nZ
	 e5aWDUMqNrA+LVkwYiKZx12z5iNtavuJYyEpPItyEDx65fCp5MCBWvvM9r6Cu0/wDl/en
	 bzXM8347kFGxfTIjZJ5pK9FhohGD8uFSCPm3IlrsW5Toeq/UkXHwCqJqGlWnAIVK/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WitnkPIKInkmZAEKjbunWxwckrFC20CfZk6oXZK5Seo=;
	b=0U4NQfoyIjyCsX0bzt/BfWxyR/BihIrBby4PphBLS8Fv00slsBMsUSgk/dWh5ay5wusa
	 NHfQqyx+067j0y2uBk5LeXBpAD7yVSHzwJsiyvc59diaV4XGoUMI+PW1qi+zkB+5pyVdp
	 sRxF4lujY1cQjuWTMnjGF1oo7EBpZMdMXPNhCU4vKOgJWnKoke0mGst4HMNmUib4TpKwj
	 e+gisy6bVU3aStS0mrGVfs9+gYmTAovQ0xNbTAmRKHQqwBxSAH42WIcCOcEK5FaToGKib
	 ZxXihVPM0V1R9MMKvCALfZtWKDF7ftXuZ2YdRFoQJByyX2MGI9vZln9xBGPw1ivcVpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFvuwKj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA8SftVy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD20606A32E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD20606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFvuwKj5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA8SftVy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Kup2924184
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WitnkPIKInkmZAEKjbunWx
	wckrFC20CfZk6oXZK5Seo=; b=oFvuwKj57xx1aV9DriphQI5K5hhtCclZU6K4f3
	0ZSYbkGwww2grANH+q20fu4AJCSd1ctJuHvZOH5rMOJ7cSafdtYmpzHKF1pgoQoD
	aXWgHAYo6ys31XFbuD3sOOIpjJOXFvJVQF4LNa/UqKI+Ub3AemfJbnB/Mpm/quP8
	DY/NmudTK10/n3XlCKsXp30sS1sut1DsMCixL5mjdjGJCthdH6dzycNzAvGSgea/
	QBJ7r/5F1HCSskLaT5riaT4blSpIpSxjlt7dknWCl+aRLmNe+ZhT0/toBU3AUEZ/
	+rwsvj0VPAekn0vh1sN3GrdIF89Ghd0K/PFDQodvQfsEOZYQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsgcn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:02:09 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47cfa971c9eso5357456fac.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 23:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795417328; x=1796022128; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WitnkPIKInkmZAEKjbunWxwckrFC20CfZk6oXZK5Seo=;
        b=TA8SftVySvSVWOZixotcDsvqIGLM3WE5UH6Xn1cnOIJMkXsYA2T9D/IXfElXvFEKGH
         hgKpe2641qOm6bK0O7Pv+CD2tEWy+S7L2mupRNtSSkRddg3c7iffg8P5rpJwG11oURBQ
         Mx3ZzfFMHcIAfyZypDVqz136cjSp2Cleuidz5mxL3k0pAY1F2VPAnDe8ilu1TzBoaCTL
         gPE/8MXhD7bYbX1ig83UgpuCWtg1noTTLWyKWoz7SlWepHxC0uKyMUMmQ+Fud2S9Tz/f
         Hu2KJmkumGEj6upIZiekhF8MBRhc8Mm9XggdzenB+kftUzGyVp+43DkXOOwP15N2pqKW
         dtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417328; x=1796022128;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WitnkPIKInkmZAEKjbunWxwckrFC20CfZk6oXZK5Seo=;
        b=kqbRTgc2ktfCUlt60xVhqrJLLOBYZxWk0Af3s7JxsEZvvjnWEs6TduLWx4gkeuGLyG
         jNJTnvSwSMaAoybO6NnHV70ab/e1KWKYik6tMOjV7hsU6rbwNWDEQYb/tCFiqr5Ew0t0
         8voD6Yl9Ks3T3Yv8Z6kFEZTBRc5OPWgcjCGfdayU3kg91iQuSqzjwXI7mFFRVJs5Ze2F
         g4Ev6ExpOFJTHL1bqMo7yN/NzFOFHrTTx9hloo2HjDvZtlPpxdbY3ePl0vzufxDd5oEQ
         4DIHtrFR/6VIHJ0s6wXVNA5Y/iuHlSFJXa9nyiHzU5Pmd0NGE49z2MivGL9EZfFQvBS3
         CF+w==
X-Forwarded-Encrypted: i=1; AL+hErH3ARkBFFnLonFFDg43cXog/cirANjUciRxI47gCN5KE9PhtlDF2oGEA7/jVNNpYOd1TTyKPrepBjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kE9Z+/fVC/K258TUc1MXDIUL9sHJEXIuoparrtrnNNzgWNjvs
	DbLreKcSKrZHP1RkNCjgLEnG/VwyadBxtsLhDt9HEdfLBnXiFLHuMqNaDstjytMD+fSqYgl3YdU
	BmzFvuxpf78eED6ur8FERXtGjQhe8IUQC7ReXuGhCI7hW589SRKGrW//WirU6Z6Q=
X-Gm-Gg: AZFdTZcDj9aSf//KwmjZxaozwKONp+m7uCVlOdZhian7RdB/bEe5Rkz80has2Gmxy2c
	5lyYqkZK/uSyazDY8Sa1A5Y1aK9sL9eLO+x84B06gMi0llC/gpl32aLZ3dky22UsM6k3n69F9Kt
	lYTVy3td9Ykg8uYMF6PrjcZnAdDpj+7alJHrCP4PlDfPYC9vEWLiexejOlFXEVXthaLPrdGHZmX
	Y2zej5mrMLwlVW7nnCsR1v4imCoOxJ+Hkka4eI3i+aphbs+NSb3CEjKRYufEcRGG7CWA4pcsXh9
	VFjzdr8OWxy+fMvPpuhT22T+TztrhkQBPmrao7ey4w1YtO17VAcQllQrcxRLzCikkqGkM4ayRPs
	Qo1jIlzfYB6CudyzDm3x/3weYryx9++WMSRl8POrtZB20xdGP5N4PKQWkDLgZfxG02S/duAxtIO
	eU6fRAakICQ0s9OtmFRS2rYnO+Dg==
X-Received: by 2002:a05:6808:30a2:b0:55b:f88d:6e8e with SMTP id 5614622812f47-57a095fcee6mr7275562b6e.11.1795417328249;
        Sun, 22 Nov 2026 23:02:08 -0800 (PST)
X-Received: by 2002:a05:6808:30a2:b0:55b:f88d:6e8e with SMTP id 5614622812f47-57a095fcee6mr7275543b6e.11.1795417327772;
        Sun, 22 Nov 2026 23:02:07 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8817213b6e.17.2026.11.22.23.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:07 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/4] leds: leds-qcom-lpg: Add several fixes and the PWM
 frequency mode support
Date: Sun, 22 Nov 2026 23:02:02 -0800
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOrkA2sC/5WOQW7DIBBFrxKx7kQwTgjtqveousD20FAZQxjbb
 RT57oEkiy66yWY0X3r6718EU/bE4m1zEZkWzz6OJTQvG9Ed7fhF4PuSBUrUSskGBurh1MVQH4Y
 wD5NPA4Hzv8Rgxx7STwAXgOeUYp6gsXLnzL7Tsn0VpTVlurGl9OPznnluv6mbqqYSR89TzOfbp
 EVV7mFXh6ftiwIJB2s04k5q07j3yLw9zXYoJWFbjqgjFvyjQXxeg0WDZMzeaelaav/RrOt6BYp
 gQeduAQAA
X-Change-ID: 20261103-led-qcom-leds-multiple-fixes-and-pwm-fm-support-3a04f85c60b9
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795417325; l=4230;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=u4YSFCPdaLrET1dQXhONt7jbw73wkJX2XVbYBBj5P5Y=;
 b=BXlmI3ipv3tifH7OQmvDlsmHTVyZ4L5soz9DId+VftBPU4cyT1QnodhXBeLLtGG8s5zFV92FC
 joaxeWTsuehCkLOOy0Up5gj1cabYoN2hRIO/7pKolVv+KpbVxi1cUWS
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03e4f1 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=bC-a23v3AAAA:8
 a=bFXfmCB1GATZPAOclEkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: LP6uyYaVXs0fddgIsGyOT0WtxlFsbuSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX+JQP6AYD6V6y
 LJiOCrLpVaOnC7FhBf+M2GlF/2Ql8qNtEoR6R+Ut845BdIb6FI7X/2ezrC5f7IknJ3N4gVDqjDh
 1mDFRh1b5x/5n9wXBdaH5KaPUI7ji1oYbVScXRYJ3FSaPN3sHDD/LR2PtZ6OmP5z3yrZGt5ytiQ
 F742Epj+GCT9OaT9lfObL3lZ0rH4fDL0JYXRcc4nUgHJpuBkjMfLS9GpVdXqTrBcmgYOEgp1+Am
 aMT4Nn1c7lQ68v0WjY5Q6cs7+QfAQU6dKZdhTQ7OXSog2CJHSlAMbAsvj4/C+kfYyMqqDPGv9w7
 VIprGNdzQ1w364ETMIjhhrF4dzKuMTNtTgo7zOTaudOdkFoHg+QX1sbhylvxXETevT6amp+iyUX
 KBNy3BbALa8Fcr80VGzU1h8TKOIas7OrEjZ17WuWriSME96eUv6pdrN96Is83dHjUcuz5tru/BA
 fmFHlEQNfJ/6FCXMoDA==
X-Proofpoint-GUID: LP6uyYaVXs0fddgIsGyOT0WtxlFsbuSu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfXy1zyL2NjQp11
 CP8FsWXZFCYwskToa01I7o2zgg1OZ7FLGdS3q/aOeLsA6fmRrqNBcalLgoCoMDNi9D4mpGEEPCe
 qMvsTaB4FYiv3d1k951aUH1wWYHGU+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230027

This series of changes combines and rebased these 2 series as they were
changing the same driver file. It is easier to send them together to handle
the dependency:

https://lore.kernel.org/linux-leds/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/
https://lore.kernel.org/linux-leds/20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com/

Also, a new change is added to close the discussion in here:
https://lore.kernel.org/linux-leds/20260827133753.GM770273@google.com/

Following are the Changes in this series after the combination:

- Added changes to scale the pattern when the brightness and
  multi_intensity is updated while the pattern is active.
- Added a new change for explicit LUT ownership tracking to fix single-entry
  LUT leaks during pattern cleanup.
- Skipped LUT allocation for zero-intensity multicolor channels to fix
  comments from Konrad.
- Renamed Frequency Mode identifiers consistently from `fm_*`/`frequency_mode`
  to `freq_mode_*', and clean up the code and fix the naming issues to address
  the review comments from Lee.
- Added logic to compare the timing accuracy between standard pwm mode and
  frequency mode and select the better one.

The change series was tested on Maili QRD device with pmh0101 in these scenarios:
1. Tested the RGB LEDs by randomly adjusting the brightness, hw_pattern, and
   multi_intensity when it is working in HW pattern mode, and the LED pattern
   and color were confirmed to update correctly every time.
2. Exercised the PWM4 channel on pmh0101 by requesting it at different periods
   with a 50% duty cycle, confirming that the frequency mode could be configured
   correctly.
 

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v3:
- Fixed the review comments from Sashiko
  1. Avoid ping-pong compression for two-step patterns to prevent programming
     an unsafe single-entry LUT range.

- Link to v2: https://patch.msgid.link/20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com

Changes in v2:
- Fixed the review comments from Sashiko
  1. Replace the ``pattern_lo_idx == chan->pattern_hi_idx`` checks with the
     ``has_lut`` flag, which is also used when releasing LUT allocations.
     This correctly distinguishes a valid single-entry LUT from a channel
     without a LUT.

  2. In ``lpg_pattern_mc_update()``, scale multicolor patterns using each
     sub-LED’s calculated ``brightness`` rather than its ``intensity``.
     Document the resulting multicolor pattern-scaling behavior following
     feedback from an OpenAI-assisted review.

  3. Add a LUT allocation preflight in ``lpg_pattern_mc_update()`` to ensure
     the complete replacement pattern fits in the LUT before stopping and
     releasing the existing pattern.

  4. Stop recalculating sub-LED brightness using LED_FULL in ``lpg_pattern_mc_set()``.
     Scale the pattern using the existing calculated sub-LED brightness instead.

  5. Update patch 3/4 commit message to clarify that the lock in lpg_pwm_get_state()
     serializes register reads against register writes performed by the LED
     callbacks.

  6. In ``lpg_apply_freq_mode()``, preserve the PWM_FM_ENABLE bit when
     disabling a channel so that a subsequent get_state() call can still
     report the correct period and duty cycle.

- Link to v1: https://patch.msgid.link/20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com

---
Fenglin Wu (4):
      leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
      leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
      leds: rgb: leds-qcom-lpg: Add mutex lock in lpg_pwm_get_state()
      leds: rgb: leds-qcom-lpg: Add PWM frequency mode support

 Documentation/leds/leds-qcom-lpg.rst |   9 +
 drivers/leds/rgb/leds-qcom-lpg.c     | 701 ++++++++++++++++++++++++++++++-----
 2 files changed, 624 insertions(+), 86 deletions(-)
---
base-commit: c016466c8c8b01af27ac66d97b64fa9c9e431a3d
change-id: 20261103-led-qcom-leds-multiple-fixes-and-pwm-fm-support-3a04f85c60b9

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

