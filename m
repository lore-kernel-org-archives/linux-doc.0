Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413F344DA4
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817795; cv=none; b=sZOWdnM/V0RqZ9LzlplUCQqjwMwvhQPJ6BpV7aB9ard7wmaR/ZW73y9G7yShHLi0hxn8boQakVw5gSuJSSd2tROQhwuWbzWMTpLokDNIMgd8RhfipJJiouByJTjUzCRcMREvMp3jvctCVhWvRV9EgPoRqbJih3GQZ1KsoHZzRtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817795; c=relaxed/simple;
	bh=aYPUqTpCzM5Tkwp+W8Jx1IUDJDoRaxbtu36jmeGo27w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X7+s6U5PT4HvCiFgI+b1M7i6NXdJKiIKJ0N/A657rzy34m7AoWPW+bONJErIKcFvAikAKK+0ALamlxZU5bxH9C5aVsE4pOXc2iZupRtzmxxtczCETnZZatdd+J4ZmvzX9Wkv90ToUrxuMKA7nfazI7vuAJnCOX/sfIFCzuM+YrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lH5dkCw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aloeGv5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lH5dkCw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aloeGv5Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H29j5668835
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MnfkUfPC/9+ueKGLdBxBI+
	FLbF+ag8oMCFFK5lvPNNk=; b=lH5dkCw2u5HzHmkz7ByF58qUuv6P+toz1ZbCGa
	QaFyYBT/uNrRgoM1N9jYiv1ektNUg8QbymnB9bx1PRnRT9HuOoEcy96mqh4D6XzT
	tEBmNFWln/yU0Q5Ybq0ujOiMauUUnWP19N+xVGwe1u64D21eu3TTj+WbjKiRdbnn
	6OcWx1gMh3ow/ayoJ7Dt5C7U4Ksr/8uj3IqSISPRY9QKXyC6JJZ8/6KEJP5Rd3pt
	FoyR6///1yzBBC5Wxb7mYLq3NOD+cDqbwVfzmBSDJIJlrsegWmdEeuJvk1ebPdqU
	K+T5eR07KptEwjTv5BQirkLgELRw6HXT6E/yWA5qo1OXBpUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2ye03bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5033b4d599eso685404741cf.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817792; x=1773422592; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MnfkUfPC/9+ueKGLdBxBI+FLbF+ag8oMCFFK5lvPNNk=;
        b=aloeGv5QO3zwrc95IDB48sHoP5rP92PsIquFkVFJFy4sLk6DLC1cY5SP2Xvt0a013b
         xv/+z6dVcdiWzJO5W1x1XgZ6nPuJ3RTazqmgnRkJ2sZNxPSz6ygZ1S7SsbkOunIEyqbW
         uSP+OkQ+4kY9Ndv+/VR1KhE5wHjcObpFGuc1GxAPKHUN+Z2h7w0d91x58ernwyKGPoNv
         P/408LrtSYOB++kaPPfqUWdlcAVEv3zjms6cLvbRS02n3ERoYq/jdGqmK93suiv6wibE
         9Gyq+Z8vLpUm9291DvpOjH28pjUgoWsSDJ+IXSOfHCvt/OnyJHTfChvr3KKOyOlvDPQZ
         GVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817792; x=1773422592;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnfkUfPC/9+ueKGLdBxBI+FLbF+ag8oMCFFK5lvPNNk=;
        b=lgLV6xMD6GI6LEkHJD2jETY0zhev5ZI/B+sU5hwSUyY7PkRgPFAeAdhmWbXYYsFrdg
         eclb3kJascYeTIIvFCVZR056fxu/p48eTzq6goJqpyb24cO3us8qNn75+7T6Oh0TKCvk
         rc1Bv1/04MgAWH7Qh2N1y6y04m38szQlL67o6ZjsxtNoYfhd/K4ihRYXBA9tJzY7cFaJ
         rEcj2sY6YWFP192SXfh/K+zdlCil5RgyCBOaGZaQOn3Z4Cu76wfUECPmwoqruBN0Rm8V
         IqegasLN5Cm6SgFSJBhUzQq0eTea4WtAiIWS2iu4qd438CpuegDkXRU0ZOaIAGCtH/r/
         ZrUA==
X-Forwarded-Encrypted: i=1; AJvYcCWnWubbTZwQIet5sARLqFeH4UHxxDdQ190ek5ED2rR5z5bDeZBG1ExHbm5hJjZSAtPc76SLWPp5vXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGDVEdTpHuoamw3vT56cHqrJ2MJwwzlZ27n2/3lStVDFyHqnd
	5BeKMJfV8kvCi1fH+ALwg2ZheZpSNSDx58EDO5EQgZIldcyhJ/XgX2fdg5LFtcAUICmBncuGq23
	t2UvIncX3yowzhY5Io8gmd86Iw5xrYB0vwFJOKDNTf/IUkPmC4MVIi2q1xtLXcrY=
X-Gm-Gg: ATEYQzy4y76jiRGmCzFkxSkKvmyuQQDZAxjGqEGouHPAWAnUhBawRZU7MjmfPcPziU3
	5RmT1Tp9e+DLzMoHm9bnBSh5H4JPPMGy/nPIK46UXZbHBqNPTUF2zBDzbNqBWYrv/6TMGSar1wH
	BrdCbbi0QOA2d6yk4ft5Ts15PYuzad7gRohTvkA2YNJcTywrmHYUxwZ67pUWz6qGYUq8T+U33l6
	Me0Q2lbTfIUNLfzTxNF5uUgWhKbl5iWhW/bizH43eO4tYUjidqwY7zdkTnBNttSYUk89Jxc+66V
	BOBy5TBKLe6xMhv6XU5ihmEURXpEOVBlArJR6TBwaRpE4b4APIvLQQbPcJNFIPwGxGPS65S/u+o
	X9wLWBPT+/GicCpuXe/uiboH9TUES0foa1Sp31t/+4x9M8KVIwjxP
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cd6d324021mr370878585a.12.1772817792177;
        Fri, 06 Mar 2026 09:23:12 -0800 (PST)
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cd6d324021mr370875085a.12.1772817791695;
        Fri, 06 Mar 2026 09:23:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 00/14] reset: major reset core refactoring
Date: Fri, 06 Mar 2026 18:22:44 +0100
Message-Id: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUNq2kC/23NzRKCIBAH8FdxOIcDi6R06j2aDrRiMpNSYEyN4
 7u3eunihdn/fvyYWXLRu8ROxcyiyz75MFJQh4Jhb8e7476lzECAlgDAo0tu4hiio7KzOIXIdWf
 bWpoab9gxunzSxH829XKl3PtEa9/tkyzX7uodhRR618uSC26xqpQUqjJNew4pla+3fWAYhpIet
 rIZ/hSA2qeAKO20raEx0gjcoZZl+QG/LjSmCAEAAA==
X-Change-ID: 20251222-reset-core-refactor-5fad7197cbcf
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aYPUqTpCzM5Tkwp+W8Jx1IUDJDoRaxbtu36jmeGo27w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw1sVxjKpShgxSgSQ2bNvR/tjWGUonyD27ROB
 QqhGvkJYsGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNbAAKCRAFnS7L/zaE
 w/KmD/4mVMydQmIRk1//2XYV8z/lQn1BrsperzD8l+shsA+2MP2o1rLVFHQp77lXcMfuYuC9upg
 b8uxI6iNstfdm4cvyZxWW0hJe+bZ7u1kbxANY2Pg8jG9nl5N3nLV95RAcSFBo7L4TpFpedvSWqV
 8eIU33WNzBY2R/0Fp725DYgKD7xVIw0FeaCcQja80nqHtWj4WJx+E6MEo3Cxl+DOBaPC0JNPKbK
 kd7o6dAJEeb7WK+bOW52v07hcZc0rPlOhj7TSDkEu0eBh7hFvsSl3Xpt6cMu/9w8BJ3/AhcDmOZ
 NnE/2pvSoEyInAWIMYCNbLM/9lMRgILo72dH/SXFkwYDrXY/fJKee9vSaDcztfABEWpazeubXSA
 Nl+fgkW9wKeRDl6/oIkJ9SgNOEbU/q1S3svB8GAxOMAix64Xr5rNkZzg4DoPkDvf0t8M0bWdno2
 0uPEXDbtjKDeqoA1TKmd95Z5wffzNpYJX95xXw/5e5X/6kuSbSwzep7KQPp8Ir/dhXKzSRkfL8s
 CEp8sClJ5mePLkEvZMbssJ/ojjoKCzma4Ls/3c063H2k9T4hb2BtVDgnddreBB9QxJaQ+kokm2L
 k7K3SNQBaEepsLm6R6oPTMOQ50apODQynjh5J7cU3LAgw2LvsLWbNzNJsE2NOlVF4UENiM4g1v/
 ndWOzkvUKc2qebA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX+0ncH+MyE5sr
 OA45iRA9PA+n8CCeyWqVfE7Uk/jMK5AEqJjvLlDTZtDB//lDrqMrpXKoOLJuuVGX+o3pRmpCmef
 RBnbXOT3Po7JvU6jJEICFfR9eYpnKYemo/bRd+BI0oOIPXo8701iEYwyhiA5cx0o1FaMzI2GU59
 egm4IOgeqSO8/tJJXIGd7EsVXiQlluMxV638GDC/2OAkuwC0O4djh/UewFPCuP7q1OL+415Z/rF
 jFPUHOgwD2nQ4Ed0y9yo8fto9q/QJ37e8fFHrbYhKE7jGA1epK00V6yx0T04W+oZ5MgM+qLgIUt
 4PgnHTYLnl/HfPONx2Ze8dCt3J66zxupNbjfsmRttLTQT3IndBP4OUWsrsemc+9zV7DwTcD/JwS
 DAY0nNyw6BvIUQBPhbDc533TMhArWxwLTh3BQq27uNPCwYV+2phY7HDZgM2SaYhbTpZosAk9etH
 2hGBv+EArifzRQ2V3Vw==
X-Authority-Analysis: v=2.4 cv=Bt+QAIX5 c=1 sm=1 tr=0 ts=69ab0d81 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NkTeoEEA0MArJt8Sc6EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: H0-cQRQGjedn5DftW4HzACmCvMBLWcMh
X-Proofpoint-ORIG-GUID: H0-cQRQGjedn5DftW4HzACmCvMBLWcMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

Here is the promised refactoring of the reset core. The main goal of the
series is to make the reset subsystem fwnode-agnostic - meaning it can
work with all kinds of firmware nodes instead of being OF-centric - but
there are some other related changes in here as well. I'm sending it all
out for review to give Phillipp a better picture of the end result but
individual pieces can be picked up earlier if accepted.

The series is logically split into several parts:

Patches 1-5: Several reset-gpio improvements. Most are not very
controversial but I included a reworked version of the patch adding a
firmware device link between the auxiliary reset device and its
consumers.

Patches 6-7: Just general improvements.

Patch 8: Before we support all firmware nodes (even software nodes for
which no devlinks are created) we need to make sure reset drivers can
survive a sudden unbinding of the supplier with consumers still holding
references to the controller. This patch addresses it using SRCU.

Patches 9,10: Rework locking in reset core. Make locking fine-grained
instead of using a single global lock for everything.

Patches 11-14: Make reset core use fwnode as primary source of
device properties and references. Convert reset-gpio to becoming the
first fwnode-agnostic driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- make kerneldocs for new locks more precise
- in patch 10: rework the release path to fix a race between
  reset_control_get() and reset_control_put()
- in patch 13: in case neither of_node nor fwnode is set: try to get the
  fwnode from rcdev->dev and if that too fails: bail out with -EINVAL
- Link to v2: https://patch.msgid.link/20260223-reset-core-refactor-v2-0-5e5a7289190c@oss.qualcomm.com

Changes in v2:
- fix lock guard usage
- tweak commit messages
- fix potential NULL-pointer dereference
- drop unneeded patch (squash it into another one)
- collect tags
- rebase on top of v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260105-reset-core-refactor-v1-0-ac443103498d@oss.qualcomm.com

---
Bartosz Golaszewski (14):
      reset: gpio: remove unneeded OF-node put
      reset: gpio: add a devlink between reset-gpio and its consumer
      reset: gpio: simplify fallback device matching
      reset: gpio: remove unneeded auxiliary_set_drvdata()
      reset: warn on reset-gpio release
      reset: fold ida_alloc() into reset_create_gpio_aux_device()
      reset: use lock guards in reset core
      reset: handle removing supplier before consumers
      reset: protect struct reset_controller_dev with its own mutex
      reset: protect struct reset_control with its own mutex
      reset: convert of_reset_control_get_count() to using firmware nodes
      reset: convert the core API to using firmware nodes
      reset: convert reset core to using firmware nodes
      reset: gpio: make the driver fwnode-agnostic

 Documentation/driver-api/reset.rst |   1 -
 drivers/reset/core.c               | 503 ++++++++++++++++++++++++-------------
 drivers/reset/reset-gpio.c         |  27 +-
 include/linux/reset-controller.h   |  21 +-
 include/linux/reset.h              |  43 ++--
 5 files changed, 382 insertions(+), 213 deletions(-)
---
base-commit: 18faab1eb02810f006d269e923fe0964beff42d0
change-id: 20251222-reset-core-refactor-5fad7197cbcf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

