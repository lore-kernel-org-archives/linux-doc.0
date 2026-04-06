Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA238D008
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497606; cv=none; b=pxTFHL67NIRdKeW2nih2lYmD8sp3nIJRGUYbjvMeqzVVQpiBe9cXDA9BPZMHbobQHVmc3qi/jJCQQHMKZZz9aXfK8ElNRIi6l+E6+oIO5cfpfvZZZUm2XCbIATmSjd+dc+nMEucbIb6RCiOydHd30vVLDrq8jXgSeH6/1i7xXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497606; c=relaxed/simple;
	bh=+JG5e/VRiGyNDel5Lpq95Hgqtu2psU0HvbS4OkDOVDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaphDMD3dyXLEFvIAKa0DRFy3b2MdcZEtTk6mY/7UYqajdvTuA92gcJMINLo1dNYbCOxi9ExosILGd1BLvVzKQpRU7nc64X28JTtypltHlqEoRN7RmBWSiqc2ygG9vYl4I7u0zfC/PpcM0UqfTrCN9SAcGqwsn5QpN+8SUfmgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6BQrWFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLl5Ewy+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6BQrWFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLl5Ewy+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636F0nc6582102
	for <linux-doc@vger.kernel.org>; Mon, 6 Apr 2026 17:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VopzH88EL8r
	PWDDNnhoD5m4dwvmv5uc9zh/PPjVirC4=; b=R6BQrWFzqgNIfOiY6ys8ikLGw29
	KqhW9d+Yzj7fLRRsrk28/7SVRTB/UE8x3XA9f2CGAcorckaWM2AaQdUvN3c0Y25q
	SiTY8P6CGQkpVN5an9dhLeLZbJlEVxn5YvHDKPDykIvmtRgpad3dT+4w3p0+Cwm2
	DkmUJCxXcmbO9PecHJaZYyvv1Vr4jQnuwl3qyxpy32tvNTXP5RZLliop91bR0Kcp
	ofLaoYiYOyxdNn7EFSbujv+bEu6bDO7iW/qPPUBKNFFazOMeUczJXUVG+9Of7NEH
	FBXfQoNqWzlXxqCApW4ddXbSwfsVkTrrdbVgpkmij7A7s61UcKoopu3mk4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf3r0hyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 17:46:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso59785101cf.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497603; x=1776102403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VopzH88EL8rPWDDNnhoD5m4dwvmv5uc9zh/PPjVirC4=;
        b=KLl5Ewy+kQwezi5hO6to4vLwYwwQAw3GqhhStHhXllF5899TJ2vRe5OUIi0UcdxLJ4
         NoeLn2DFhxw2FdprK8ZeHIivY9Yr2WIc9aomJzywdj2LF+wzub08tevnXBfHLd997sGy
         2se9R85zP52wLRXdgPqTtcNhNoVQQutdZOzkHxuW0W2DWKZSvnFDzDoEVOt9vtfXIONb
         KFbwpI2TW1GIDo/dZqBOrLThKbUtRmKkGdZ4R6lq5QVxgRN1aGSgRNCxNLhGIaEtWBQ4
         7d1mxvJpdxlbp7gv/3/LrcAYiZ2DGyUXmngsiN2GuI9k/5i5axhLQpRg8Zf0sY4YK640
         nZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497603; x=1776102403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VopzH88EL8rPWDDNnhoD5m4dwvmv5uc9zh/PPjVirC4=;
        b=BODFV6fXij8Bj+M97k0FDsO0cbU4JHEGSJ72+0NUqdXLzcxBtA9WM8GCTkic2JKZFJ
         //0aBv3e371RCn3YtI/A4BhVoeSHwoHx89kTG5hr+uDjCHlaIHP/BN7oiFWLoGDwMeBs
         OYxz/Kw+petOiuBdxoM/Vo0YFhadgntrjToQZJ50GIJvmTAccXTScte7q+I2DKZdnbp8
         0QggAZd7cE2NvIcZSbvKA+V4p6iDufIh63C8Lw+PsN24o6tsr5NZdpBjnVryDaT+eFMA
         fOJb8rFIC4H7yRtmPTKxnSUzVX8ig0Z+XXKehp2PNRAN1K8SlUEHoTNwysRqdUzv9lEq
         VWfw==
X-Forwarded-Encrypted: i=1; AJvYcCXoc/eROPMubMflnglKUQRfLV6I1z+l/nBzjLpUjSuSH1H65Q5gRypJtqSGLVx7BDGpcMQSy73V/cM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nV52ulmNRa87LJ+grkdXwjuQgeNhZlDX1U6En3qazxdRoM0A
	jpsi18vSjGLRkKDCKaDC9fU5WzH0kiWzkKNUBSC91DFKJKUOPavDng6595AllzL7TiQjRR9nbWm
	IhSBA9plZgdIstf6hilfubm/+wxo8jld/i1HoPS/pvByBlQVZePkbO0la4wwv2jY=
X-Gm-Gg: AeBDiesDxIrt2OnUUTPiTg4EZzdr2gl91nF9J3ImRe1isteL8k4AQ+fSCPjYdKowXHv
	6ytov2befVqdikP4a4Jq1CNSniRyd9SfGB9NkFhLQj06LbHwI1crSvsK7D/+thjqky4/49AWig8
	QU0I/MWenpyY6L1twu0Dh711E3kIWhFOOZNZRZ55xvneUzrbX8G5Oa18aedil3tDBUQTL4UjYj/
	uKpas/0D2tEs3qM3uXRlCo1x2R+fM0QFJ0VQHS9/ZhimyOi2Jx7pCl+XsmH0wgcpkQEAXcAuZIT
	+TNq/w7XtCxGS2X6aVdxF85bfnjgapbqZpwKfUUdAP7luwhSylixczCl/wdnjNKtLMsxkUSx3r8
	0ggVveDJwToxEjjkN5hLq7xy5M80X2h7AszphEob4Pd9WwnuvLqpXQkvt80CLSSNPZjDjmRpNCf
	R9uYUKn2bU8bJC74bJK/6sUIKAM6SsnlcjEQe0
X-Received: by 2002:ac8:7d15:0:b0:50b:509e:7920 with SMTP id d75a77b69052e-50d62c79a83mr205536241cf.48.1775497603252;
        Mon, 06 Apr 2026 10:46:43 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:509e:7920 with SMTP id d75a77b69052e-50d62c79a83mr205535741cf.48.1775497602694;
        Mon, 06 Apr 2026 10:46:42 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff0a1esm483073866b.43.2026.04.06.10.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:41 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
        Edip Hazuri <edip@medip.dev>,
        =?UTF-8?q?Mustafa=20Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>,
        Xavier Bestel <xav@bes.tel>, linux-leds@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 1/1] Documentation: leds: leds-class: Document keyboard backlight LED class naming
Date: Mon,  6 Apr 2026 19:46:38 +0200
Message-ID: <20260406174638.320135-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
References: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OOVbFoqloqycMnbmIY-eO2V0cXsqgfgA
X-Authority-Analysis: v=2.4 cv=Us9u9uwB c=1 sm=1 tr=0 ts=69d3f184 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BbKpnyccwsDoZckoJYIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfXxYQUs3sUzHlv
 1veEilIhlhWomOCkipfoU+4ffhLoMCRCx79M6VC3iHBznC2rOUMYsaJhMigKaLhXdTww6KHl4Hc
 3hoevIu1cqlrI13ey+nIq4AAs55wfJNf3mNmM1J0+RDkwqd28hshESC4enUM/ecHHemey6p+aNK
 KQWzX8ZSNOBRAOcY+GEADatoIIn4EvpHxYPyiQd6qWI/1pmHzAV3NuwmYI4+yRUEyn+g++lZmk1
 BTnSXQRkLFb3xmc2rr2YM9f6lXyEvTQeJxVyIweKjYBnHDzmAUMEShQQH5J+Ux2EP+9GGvVIi46
 qwklSACkbK1DPoZh8FqutK3KJMfSwNA2d8kzxQZiLqgQqqhIbWm7RERAVf71cQcRz2Eg7+5SDkC
 MfkJ1ymCqQlBgYnqD1W+biOoBDyR1iRf4hBGwMFOWkDpWNpGQvZ7lACcxDeba2zRp+/1VRZGhKU
 20ENS1FQdQLlmTMi8MA==
X-Proofpoint-GUID: OOVbFoqloqycMnbmIY-eO2V0cXsqgfgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060174

From: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>

Document the existing practice of always using 'kbd_backlight' for
the function part of LED class device names for LED class devices which
control single-zone keyboard backlights.

Also extend this existing practice with a new naming scheme for keyboards
with zoned backlight control. There are several drivers in the works (see
the Link:tags below) which offer backlight control for keyboards where
the keyboard backlight is divided in a limited number of zones, e.g.
"main", "cursor" and "numpad" zones.

It is important to agree on a consistent naming scheme for these now,
so that userspace can support multiple different models / vendors through
a single unified naming scheme.

Link: https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
Link: https://lore.kernel.org/platform-driver-x86/20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com/
Link: https://lore.kernel.org/platform-driver-x86/20260304105831.119349-3-edip@medip.dev/
Link: https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
Link: https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
Co-authored-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 Documentation/leds/leds-class.rst | 63 +++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 5db620ed27aa..d2b042519a66 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -116,6 +116,69 @@ above leaves scope for further attributes should they be needed. If sections
 of the name don't apply, just leave that section blank.
 
 
+Keyboard backlight control LED Device Naming
+============================================
+
+For backlit keyboards with a single brightness / color settings a single
+(multicolor) LED class device should be used to allow userspace to change
+the backlight brightness (and if possible the color). This LED class device
+must use "kbd_backlight" for the function part of the LED class device name.
+IOW the name must end with ":kbd_backlight".
+
+For backlit keyboards with multiple control zones, one (multicolor) LED class
+device should be used per zone. These LED class devices' name must follow:
+
+	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
+
+and <devicename> must be the same for all zones of the same keyboard.
+
+<zone_name> should be descriptive of which part of the keyboard backlight
+the zone covers and should be suitable for userspace to show to an end user
+in an UI for controlling the zones.
+
+Where possible <zone_name> should be a value already used by other
+zoned keyboards with a similar or identical zone layout, e.g.:
+
+<devicename>:<color>:kbd_zoned_backlight-right
+<devicename>:<color>:kbd_zoned_backlight-middle
+<devicename>:<color>:kbd_zoned_backlight-left
+<devicename>:<color>:kbd_zoned_backlight-corners
+<devicename>:<color>:kbd_zoned_backlight-wasd
+
+or:
+
+<devicename>:<color>:kbd_zoned_backlight-main
+<devicename>:<color>:kbd_zoned_backlight-cursor
+<devicename>:<color>:kbd_zoned_backlight-numpad
+<devicename>:<color>:kbd_zoned_backlight-corners
+<devicename>:<color>:kbd_zoned_backlight-wasd
+
+Note that this is intended for keyboards with a limited number of zones,
+keyboards with per key addressable backlighting must not use LED class devices
+since the sysfs API is not suitable for rapidly change multiple LEDs in one
+"commit" as is necessary to do animations / special effects on such keyboards.
+
+An exception to the rule that all zones must follow:
+
+	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
+
+is made for the special case where there is a single big zone which controls
+the backlighting of almost all of the keyboard and there are some small areas
+with separate control, like just the 4 cursor keys, or the WASD keys. In this
+case the main zone should use 'kbd_backlight' for the function part of the name
+for compatiblity with (older) userspace code which is not aware of
+the "kbd_zoned_backlight-<zone_name>" function naming scheme.
+
+While the smaller zones should use the new zoned naming scheme. Such a setup
+would result in e.g.:
+
+<devicename>:<color>:kbd_backlight
+<devicename>:<color>:kbd_zoned_backlight-wasd
+
+"kbd_zoned_backlight-<zone_name>" aware userspace should be aware of this
+exception and check for a main zone with a "kbd_backlight" function-name.
+
+
 Brightness setting API
 ======================
 
-- 
2.53.0

