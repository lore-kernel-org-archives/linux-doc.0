Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD63932DC
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497605; cv=none; b=e8FrnE46YF7qiZ7ahx3GNC6/+9BzGHoDYT9BIenjlFTJqfdsNamLsUmRX5+igcw6zEOh1MeeAn3JCR/15+Fw/nK91MnIE80g5sIE5f+4FGvMBaKD1gHnzP/xR3QhgKTRY39RuaaUX/LDP2VmEnHUlfwI+RxmOixAAzlLJeAoWZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497605; c=relaxed/simple;
	bh=v8gT6ChYVGCidG5PYw+FmtRLKgQY8s/yK//CC8Z78BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsWvX2N7pLXaedlHIBBQbD4IZbq4AK27GzoQwdgv/G0QDfWlO+l/lm9Zr28xR8GOctJse1OUenEu5/60V2RVtiZD0t6aTsOexcBeLMHE6Yo8Dc1e1KJvEUx5gyVw107kHyBg9Tmuxgted+iGxdMPmgA5zXbywBLRny3blPqb6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRi3UKNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMSGFbqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRi3UKNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMSGFbqq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636DuUhE2420580
	for <linux-doc@vger.kernel.org>; Mon, 6 Apr 2026 17:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5J1LEnO7Lx3oSEMFDv8aayqFtR5IHNRx2Z8
	gx3jDmVo=; b=bRi3UKNlxod/6i+yuhoHJiHvkvX6efI5S0Aj8SuE9seYg71QZFk
	Bb9TbQx9JvvrTGpE3qktNVZqssIgh+Z1CJESETU9nSLkFqpoIwPEe8SBz5mqjJ4J
	R6WxunP6Uc2BBMGeAgSDz5RuWfir8NjivpbFp47nSA+5Y+uliOTxzU3zHPuYC0wC
	btSu+l7rd1rslwB6iuJ13NgxcOcx/S7H10rqsurRnARWftJniBXk6DoG6BtNfCb6
	rtBSwxHfadToqHmsT/WbPVvKcjoEu35JgDF2/Pm9cOHcEiqt0bbSa7DwYdDBkKRk
	jOBK0WgdCXCFa/AA/UxHg2lmbbxyazg0Z/Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dce5jrsbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 17:46:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-604eba0f2f8so1604031137.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497602; x=1776102402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5J1LEnO7Lx3oSEMFDv8aayqFtR5IHNRx2Z8gx3jDmVo=;
        b=VMSGFbqqTy5Co/LmH7OH8GDqc83jyqW/H/yB3DK1ftGOwAJUSDpu/xwZI/6prAve08
         JcZAlUyRWRG4QhUhZZoTfuA42nxknAJP8mhgrleDiMbbOIo0TznjeWctZY2M53k08LDG
         QW7cJG7mdBQpSgmGCpI3S7SfoufABeFv+UclOlaHvOFYRMiJMwFY9o1dAPP1WYJE/qBl
         7a5glKSMfHWvtMR1ZfNXI3KPU9fM8SP5cybtKxfRjuGAUgCPL6rZoMDLLlNei2w7rzYS
         QU2peH+BGxUNh1cxXlS/zq0GTz5RwIeVt9LH6Uk1WHcViWjhyYirduD3DlaAdshFacoQ
         V7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497602; x=1776102402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J1LEnO7Lx3oSEMFDv8aayqFtR5IHNRx2Z8gx3jDmVo=;
        b=Q4mQuYwFf6+7b6QzxxGZ9WPfIk0+Un+ER47aBFqlMAACSZ0J1o98QALnFgu0o1JpF1
         bn4OqBM6Lj4Y24tO6M9nJuXN6x/XMW5FGVg6E+V7Zrqr9bQn/BZQ3BEN/QEk/w5MKw3Y
         6DUaEGv4CBGqpfAVUvPh18fxGYthB6Y6VwhYWTApVdDIMjKTPytMv1tXXD//GVuVREeB
         IRcFmj2Q4o86YwFTGronWNxAEsdAl1ksC6h+nUicg3pGyTcSfX1IQcd5+36B8A3XhK80
         TZr935u5+tFYt3Ksy0kpD/BC+TNN2UXSWlWwpG9PinUHARc8DB8do+WBwXmaUu/8yOoA
         haYg==
X-Forwarded-Encrypted: i=1; AJvYcCXHbnBC01iGHSL/7XejM+dhfs5F/yFVI2oFAnlSV4WvDhq43h4DJ3V/v9cvkgI8ACBsng4/6+oiZAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbgG/H/vfxQ+trEp3EXuh42oKXyhrfsE+skqL6veYAj7jMc19
	nTg0oSAcLf6N8aSsq+fujm1gliXSJJ9JBYTAPC+Ls7jZNGFqlDE8NXMpPvXjOzVYXskiG6rEs9L
	nIwOgaOjNOJHA6Qibf+LxVXsoY0jrv0t9oCgH5e8es9zmmGVg4sp7xmRyTI7ALpo=
X-Gm-Gg: AeBDievMgGNN8i3LHI30SFrZuL1Mmn0QrS+8b//qXjgfphOjz/LZpspbe0HVwDcKKgU
	dgr5XtO+FBgDraukvtAoVjdOYBcM7dqtly+VGkNdiNQAS0hvTAUu8C89Y8GFueoeGQ0geq73jvT
	tIzrJY+rYW3WDEwHwMWot/sePu+XKiFziPJl+pPtxFXFr7fpXjjRgxQFzJC+gwyUe9XUkclZ13E
	l+TrmBB0QmwaGADlDpEDikRvu71N+o4C8RuUBq+nAU/0PBV61a2jLNmZTc/gu2U1TQFnsOGOPE1
	4SCs2FhjTnLmGke4gNs1hQbdXrO0mxv2xs6zaJFHgl6hyphbBlFcHgttEenU6zNV2N8CpHCY13s
	F3hppky2nz+c3C3RmMrzUHYzWwiKkus4LMaBqo8cy9k51a5kdeyfr1w3QVJwsYk11KIyA2tkM0+
	R4a0VoUEciul1VdApN3Drk/QyJGIinwN5M3rmI
X-Received: by 2002:a05:6102:dc6:b0:5ff:ea39:dc7b with SMTP id ada2fe7eead31-605a50e18abmr3956737137.22.1775497601664;
        Mon, 06 Apr 2026 10:46:41 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:5ff:ea39:dc7b with SMTP id ada2fe7eead31-605a50e18abmr3956679137.22.1775497600900;
        Mon, 06 Apr 2026 10:46:40 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff0a1esm483073866b.43.2026.04.06.10.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:39 -0700 (PDT)
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
Subject: [PATCH 0/1] Documentation: leds: leds-class: Document keyboard backlight LED class naming
Date: Mon,  6 Apr 2026 19:46:37 +0200
Message-ID: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R9AO2NRX c=1 sm=1 tr=0 ts=69d3f182 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=9P2F5LBCuBIzmV2R0jgA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 2yq1hQDRySLV_GkVe3IcNr_oyUhGs8Zx
X-Proofpoint-GUID: 2yq1hQDRySLV_GkVe3IcNr_oyUhGs8Zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfX42u2tsPTQELz
 Uq6GL4snBrj2DEeWmzPbTf5SlMQ1YBoFdtn8JurNXn+cRyfIJeKAk8ONko841PVy1gA14Jx+Bab
 breTn8EmGaYf/vzznii+icIM0ElmIIzKMSqwQUifkTjlGqe9SFG6U70QtSx/Q2G1aRDk16vfMry
 zX/YZInzBAlfGN3/C1HYkoSVg16MTv7POny7r7dF4B/pHxXgdNsMKngWp46o8dnQ7J1RkjIcuCx
 1DEU+1gD6sG12Wk1ejP3mH4nSXGlLWXVwm+d0EoAykVfQecDFimo1ZdzCAP5gkZDQVzSHxIN52s
 YZxsdbXcQEkKXmSCSm3c5iTRphPmneieBv/9ex3+hxansPcVn9Fc3Pjm6C1U+HPi0FZRaldwWxK
 aAGQg5ewKJ4IrKBnKAkwFm3/NCi3BYu7plvPWHZb888rqUUQZORb3dFA52WLeuLCODXUI1eyeIK
 4zBxqs9NbPEUGzmCrRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060174

Hi All,

Over the last couple of years there have been several attempts to add
upstream kernel support for controlling keyboard backlights consisting of
a small number of backlight zones, think e.g. : "main", "cursor" and
"keypad" zones.

All of these attempts have gotten or are stuck on the lack of consensus on
a userspace API (1) for controlling such zoned keyboard backlights.

Previous discussion can be summarized as there being consensus that
these backlights should be represented as (multi-color) LED class devices
with one LED class device per zone, mirroring the existing use of
a LED class device for controlling single zone keyboard backlights.

The only thing which really still needs to be agreed upon is a naming
scheme for the per zone LED class devices so that userspace can detect:

1. That the function of these is to control a zoned keyboard backlight.
2. How to group the per zone devices together for a single keyboard.

The single patch in this series documents the currently undocumented naming
scheme for single zone keyboard backlights and extends this with a naming
scheme to use for multi-zone keyboard backlights.

This is send out as a separate patch rather then as part of a series
implementing this in the hope to get multiple drivers which are in
the process of being upstreamed unstuck wrt the LED class naming problem.

Drivers which need this are:

1. HP WMI laptop driver Omen gaming keyboards backlight control support:
First 2023 attempt:
https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
Later 2024 attempt which includes an earlier version of this doc patch:
https://lore.kernel.org/platform-driver-x86/20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com/
Current ongoing 2026 attempt:
https://lore.kernel.org/platform-driver-x86/20260304105831.119349-3-edip@medip.dev/

2. Casper Excalibur laptop driver (inc. multi-zone kbd backlight control):
https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
This one unfortunately seems to have stalled.

3. Logitech G710/G710+ gaming keyboards HID driver:
https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
Posted a week ago, needs an agreement on the LED class dev naming scheme
to continue.

Regards,

Hans


1) The lack of such an API may not always have been the sole reason these
drivers have gotten stuck, but it was always a factor.


Carlos Ferreira (1):
  Documentation: leds: leds-class: Document keyboard backlight LED class
    naming

 Documentation/leds/leds-class.rst | 63 +++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

-- 
2.53.0

