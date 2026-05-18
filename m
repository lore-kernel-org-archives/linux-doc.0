Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C24322B72
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099193; cv=none; b=r1u5MhVKiwxoixTh+55wzNkycKuFiqMEZmDCXTaPcg0gO4QulcEwFd8nLpTn9t9Pk5Nh5gRZE7Lb9itshEef8qC518FTmthtjrECHVMaEeOIcD25PKl6/wJdIZcVEfCzp/YSXjnXUnpSBgrS+VGnUjwRy6gb8vlkpH1Jt94Dr9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099193; c=relaxed/simple;
	bh=9E3qq5D4WZQHWgquf7eFFyaxjAiENCppqVM2VoCoy30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dZSGsyJQIMx1fzp9Loq5j8FIrZRKhabII3r68c4NFx+gVyY5uGYop0tS5FVshqTADS2JwLLo6uyB+qPpkhRpjYjO5UG3z1VqAwajML8MXpig6bOUoiXJSfIvh/5+dpEqT3c66/jwbN9RxUY2GdBL8mwSbzQheDR61RLNQgGaSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hi3mAoa/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnoc4EYW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hi3mAoa/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnoc4EYW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7t8mj1440822
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AEl5MQcG4V9U6z1ZgKV9Wf
	SwRgV+hZqvkiSWVAMoQeE=; b=hi3mAoa/6iQqs4Oh+KyqFGRwQ5W7kDyrObXxhY
	tfIVGVIwm+GaF1h5gY9+PODtSGJu4EcnnuFFiWTOV/sc3XgpjgoLREWztwZWbOrm
	eHeI/5+VzhNuKvziAG3HJexYFLaE+igishnrhUxsFYACut9p0LYXZEaVGYJ9DTJ1
	g/6058w7/Cw2iQVvIDwWz403SNEW18f+G0+jfYYRa/BRo4ACW8LzURUJLBlQ6hcd
	tM2QNCqR6N4hzw1v7Pxt9heDArG8dzP03DTxHRf6HW5K25Sma2FcmqSKtAgw0hR0
	WJSdg7KU2iXaBOaNw5CorrsPESaprm701cyC53lIM9omD1MQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wued-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:13:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b673c8f1so27700491cf.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099189; x=1779703989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEl5MQcG4V9U6z1ZgKV9WfSwRgV+hZqvkiSWVAMoQeE=;
        b=Xnoc4EYWVWtzMvOYUfjw6s6l6pWPFD98cUMPAn7nR2HzxTNAP8zzl9vacwP8QkS2uw
         /YQATAcR5TF5TJJ0xR7EQSEtZ+vibUEUoa25DSwU1vSBePG5FD4iKWxEYsREsiBGyN0S
         Id+W45IyYLaal028c+uIDmeLMvIJ8p9uTCSskt98oMzA9+l4l8S/4Jl7WF+atcZuEC79
         LOflxUYHl4QI7Tskh6sUwO0/JNkgZMnlIZgGYPoWkh15dZLd2VzgIBeVZO65K3N7y9rT
         S3ehyJ5dtQ3Kf9LDCwcHm54MhmLY2s4yDoHdA9zkeZByduv2xcYGon9/BDXs9RzJKg+U
         huSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099189; x=1779703989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEl5MQcG4V9U6z1ZgKV9WfSwRgV+hZqvkiSWVAMoQeE=;
        b=OuJ45nSj2C/klJIZ61yyCyzz1/AeyDWrEjGiiKaXI1uCHhNLP3jD+rKjcoRyDlqpbz
         99b7oRtUYN9UDhQqj0NqUPLX/3I//f95lraJlqZBF7ZSFY8/LojZkK//nwGcQQifoo9C
         LDQJ4hbayjbA/n1gbJztjDn0mOYHOJ9iFfRsb4eXYxHGfKInaehWrjzjVkI8O+jxfA9B
         Y6Eltg2BQBj8HZ7Jtkn/AkOHV4/V+7MB4ARG3sM0CmvHtCHm//df5d99lwhX5I3PNxbb
         qgm32BVr0ViJKdcRkeWboLDDtDqyLyszLvq6sxDDW3+3eo0AIfkg+GNCNmf9DEEkwWRj
         RCmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ry+nsoI71DnH4Dj1TJJO5RyweiETVPB5mgqVwfyhAK8Vus8Z1i/0vhYctHJXph8SfFo2onUgJxVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Qt4uBytIlo/vvhbarDNawpDiVix9DWgassDrhb8jkLiG/clT
	R0eBv8f2lSN/gLO8pSgdqiABpB4pAsWJl8p5neW1d7yEgTRxwgA1tytSZqzWCtwpuvjh3TDCKhy
	OMU3wlE3dYdOvrOmTLSa0dwhVOsGE6u0zknHgciNgoyuTutNr5/HZCNkbo2zBe2M=
X-Gm-Gg: Acq92OH+N/pdwmLp3QxSQor7GEYUqXc44yFwOLe+SHwdH1/fXXN6VQ2Lzgn4rwYaKCI
	VN5hCbOdbo8pAC3QM1zVWwLAIDGi8Uz+ZyfcGxHXwEqdAjbI40G/95Rme/qEQW9xxht8kcogSRU
	w/KFz1BolbQnsVv1lawfj6VGfkDGb2iZFrTJSnT91y8mnImOn6B6yvQTcg580tl1l6bb8ixKn7H
	ai1hAKP3w30oEUyoo8WJMf/+1zVir7hrtfHwHW9uoRO5vWim+dM3hzZYDCa/dcV7uKvMcud7LJS
	0/h8nSWMVPjZjLCoib8eTk5GlRpLQX4C87sTPyTSB1nKdwmhuO3DBVldPT5zneVhz2t+DIb/7AC
	CL+JJZkusaylpJ4cOFU2/4F4to7OCeggVgpAf
X-Received: by 2002:a05:622a:2516:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5165a059c4cmr205872731cf.26.1779099188668;
        Mon, 18 May 2026 03:13:08 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5165a059c4cmr205872241cf.26.1779099188062;
        Mon, 18 May 2026 03:13:08 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm240548175e9.4.2026.05.18.03.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:13:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2] docs: dt: maintainer: Add Devicetree and OF maintainer profile document
Date: Mon, 18 May 2026 12:12:58 +0200
Message-ID: <20260518101259.34948-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5055; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9E3qq5D4WZQHWgquf7eFFyaxjAiENCppqVM2VoCoy30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCuYrlVysAwtLXXMvpEbQvYDr+bq8SSxz/afMQ
 zlLbT4sz/WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrmKwAKCRDBN2bmhouD
 117uEACK/anmxHIQXXzJEmDqMdAuebkx2c3ITQYiYPVx/gXQnmSsY2lm/CPK1uU6VRVFngJLa10
 EsYD9D9Jh3g7qK8uvNqqf6BZIlJtXFJwfRK25wYRsW8Oc3uFNDj5z1OINWLiOxd4+zCExpY/gzB
 OzG049WyWEH/Oi5j8an7hDvvot+Dbj0GR9aPBZ/pSsePg/qqVAIcldySjgs85ODFCJGrk0ikNLb
 DwLTrdOhQOiMNXA2hp5ON2t+xQ1xPbrQbFnGb5UEMx4fV0wn86IrYChd9W0eBQTus3tYTXzqLCV
 awLgZv7W+Lc6D+kiB+n5d9FKdkPLd1fHCDQkYjsY32vrPni6f/vGJan0ml2T35BTdFOBapLrUmz
 yxQGwJAUtyOC/tXMO7gUjG5yWb7kxUShZ6ToPGcD1E/bsM4htr/LbCR5Nfeu4CiUYN+Ty645bDv
 8Bks3V5hxYyf5e84JoK6l7uo5sbRrhj8J+WPEjt92rQB8kRm3R6En7y/QvNJHcTzt2tDo6MCgwY
 u7HxVSzMkI0UBW7e13WOGxHOtz9nVCquRLTAUey9UiA8EfiNhjvBAMpMBseRZqjc3k1Zt4u+BDl
 YU03l15h8BINUouIfSsYr1f/6EP8RJ/95X5lZ6YmL2tcvOAuMl9uX+lVtG6LGrfo9GcDjx8Vcq5 Em3ZDxBMKmGiigg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5OCBTYWx0ZWRfXzckNyWS+4t0E
 yDCv2AgwgzF+3OroUgQsBjpi1+xLzjlyjby/eCw8E7/08iE8PDfJQskL8GuCh5Cn/dNIwUalMbf
 c9GTb1e/iZBdQFlcbtzPkF9ungYxUAztYlcqN4D1wyx1zwDYBzfarWhIo8OgguVDv8AobCwsd+c
 8Hs8ue6XxbJrxfr+iJzGHFL/q3ykhO97C9tagxQ0aWGxuoVVZFqEM5iSL77PwSjVPf9/Hd5jsmV
 CQEmuhOo5zSedilAHLKlGdH/Q6BDcNFogeWCrxVMImGVTLZs3JgYikibA8UFhwNR2kXQaRFjJ6K
 QMjNgsi2+uKGFN7VFsGknVeSyZElt0iaK+yJbSXBx6eHkgWsF3NWIo5J0DtbpGAYRPplEsAT+K3
 RPJPaLSIIv7zGRUiAi39owHMATKhh1y/qX7WbCh6/1rXMpYzSn46XxAnh8L74LMMgDfDk/Nyt3C
 F1fq8idC2g77iWvaJrA==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0ae635 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7C85NsCI5bDNKhsY0GcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: CkafwNSxTHjCmCgMapa5G-e2xanuMEsP
X-Proofpoint-GUID: CkafwNSxTHjCmCgMapa5G-e2xanuMEsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180098

Document how Devicetree and Open Firmware maintainers handle their
subsystem, especially focusing on two caveats:

Devicetree subsystem handles patches with a minor difference comparing
to other subsystems: while DT maintainers pick up OF code, they only
provide review of DT bindings without applying these.

All three DT bindings maintainers rely currently on Patchwork and due to
enormous amount of emails per day, regardless how much DT maintainers
try, they cannot read all the emails.

Cc: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I expect patch to be picked up by Rob, after review.

Changes in v2:
1. Correct typos and trailing white spaces.
2. Fix order of P: after C: in maintainers.
---
 .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/process/maintainer-devicetree.rst

diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
new file mode 100644
index 000000000000..d8ffe752bf5d
--- /dev/null
+++ b/Documentation/process/maintainer-devicetree.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Devicetree and Open Firmware Subsystem
+======================================
+
+Other Process Documents
+-----------------------
+
+Please see the documents in Documentation/devicetree/bindings/ for information
+on how to write proper Devicetree bindings and how to submit patches.
+
+Patch Review and Handling
+-------------------------
+
+Patches handled by Devicetree maintainers are processed differently depending
+on the patch type:
+
+1. Core OF driver code, e.g. drivers/of/:
+   patches are reviewed and applied by DT maintainers.
+
+2. Devicetree bindings:
+   patches are reviewed by DT maintainers but, except in certain cases, should
+   be applied by subsystem maintainers.  See also *For kernel maintainers* in
+   Documentation/devicetree/bindings/submitting-patches.rst.
+
+3. DTS and drivers:
+   DT maintainers might provide comments, but review is generally not expected.
+
+Patchwork
+~~~~~~~~~
+
+Devicetree maintainers review patches using Patchwork, so the current status of
+a patch can be checked there. For typical driver submissions, Patchwork
+receives the entire patch set, but only a few patches are usually Devicetree
+bindings that are reviewed by DT maintainers.
+
+Explanation of Patchwork statuses:
+
+ - **New**: Not yet processed by the automation toolset.
+ - **Needs ACK**: Waiting for review by DT maintainers.
+ - **Handled Elsewhere**: Non-DT patch; not being reviewed here.
+ - **RFC**: Patch was likely ignored because it was an incomplete RFC.
+ - **Changes Requested**: Patch was reviewed and DT maintainers expect changes.
+ - **Accepted**: Patch was reviewed and applied by DT maintainers to their tree.
+ - **Not Applicable**: Patch was reviewed and is likely in good shape, with a
+   *Reviewed-by* or *Acked-by* tag provided, but DT maintainers expect someone
+   else to apply it.
+
+Patch Re-review and Pinging
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Due to the high volume of email traffic, Devicetree maintainers do not read
+every email they receive and instead rely on Patchwork during the review
+process. They also often skip patches that have already been reviewed.
+
+As a result, maintainers might miss:
+
+1. Questions about already reviewed patches.
+2. Pings, for example when a patch has been reviewed by DT maintainers but has
+   not been picked up by subsystem maintainers.
+
+Such cases can be addressed by:
+
+1. Pinging DT maintainers on the IRC channel.
+2. Dropping the DT maintainer’s *Acked-by* or *Reviewed-by* tag when sending a new
+   version of the patch set, together with an explanation in the patch
+   changelog describing why the tag was removed and what is expected from DT
+   maintainers.
+
diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c7..843f1d124446 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20050,6 +20050,7 @@ S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 W:	http://www.devicetree.org/
 C:	irc://irc.libera.chat/devicetree
+P:	Documentation/process/maintainer-devicetree.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/ABI/testing/sysfs-firmware-ofw
 F:	drivers/of/
@@ -20071,6 +20072,7 @@ L:	devicetree@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 C:	irc://irc.libera.chat/devicetree
+P:	Documentation/process/maintainer-devicetree.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
-- 
2.51.0

