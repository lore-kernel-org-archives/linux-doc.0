Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087D34DB7C
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883720; cv=none; b=YKWdwrs11qWZrmzD/q58COcose98KI7YHntRvcLBA6Fyjj8pAn6j00iBt80wy2rvLHFhYN9gW94vIjAvraXfCGErs5vznfSASUAd/aR4a95HB/DKPemheQxVRNb3cZ5UhS8qJFJ4QwGyhoG1vVGxzPHSaFJLXc63Zuo4/s8v8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883720; c=relaxed/simple;
	bh=iEUuY3wGzLZPYjI71MhbAplsXD6EpLcgQaZDOkmWUSw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qnXnrTyHAgph0F4nt/tBtL1Xptnw0C+AwcBtoUFBn/5duFIaBPq5InHd1v3ZPvIiFVo2dMIpYwidav6mslzvwyo/WZaSC0Vj9KfCGrmXKqPsE88UwUVzK3QpXy0rvrjUtiSm69b85kqws1qkrk8zsIrO4hS4fMbF5biejvCkzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gO/2Ic+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRR7XJXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gO/2Ic+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRR7XJXT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qqhE3098381
	for <linux-doc@vger.kernel.org>; Sat, 7 Mar 2026 11:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3nSo4d6ACuGW4wqzMO4zRi
	XyX4asXwy79TGsDWMoSMg=; b=gO/2Ic+eCuuNyNBG6DX1wOiSmYhR6xZgc4gt1E
	DaV6icbdmVaBU53eRaly/OugAwkhW3uxzKFQYnq2fiptFFG/VcM6D3srnVkcJSYX
	gBVliCPckTeNeRVEmQSchBC39sL99aWZgo/pbgl+yYEXYLAdC3VXksxuW1swmekm
	Yk60xbw1zcamgZSxCEr2rWzY5FUBiggl3iaOPSa9cbudrpRwuy/l3H1YiBNGsQ+6
	v3jggVMHxNx/QIgUvbGdaV0WAwnOZTUMZvrsGDT5H1t2DMGUyI6dT2qN+D6WB4Gn
	OV9BkMZs6mBjD4zEho6V42lChR8gjI7izDjNXkC6YR6SUAMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrgufn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 11:41:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae50463c39so63839845ad.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 03:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883718; x=1773488518; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nSo4d6ACuGW4wqzMO4zRiXyX4asXwy79TGsDWMoSMg=;
        b=CRR7XJXTGRslaP6xbPfsdVnUbC4SlVy4de3MAp90rqtelOY+tn4nCmGTE8s6lKeAhl
         hMYGQvQu3Wcsbk8kNfiz6sKjR0+TaqyWNWSPpjn7JkN7EVDLsf1gTx/I3zXozGVou5cC
         FfOD1VtCCi0BJ0z7zuB0fVtVqKjbOJmaeAiQUDfE3Mw976dVXWXCmXWCZqUs/Kq/zz0J
         jKEazZ82RpE3kJiqsHD9ZgqH8HIJ0DMUE0B3+APxEVzXofUDpWUmPOOyFo/KYOHQCiZy
         TdAw5QnoUgDum0NrckJjGAbo/4jJhlDBS2T1r1B5qjr2CFtLgEIhQTdPdRYm+hUxieWK
         Kwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883718; x=1773488518;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nSo4d6ACuGW4wqzMO4zRiXyX4asXwy79TGsDWMoSMg=;
        b=FJtkINK51HRAMmVGoGHZzBt+7tTI7TyUFm1F07pGIJiHtHOsL4wD5C0xWNVwx7X96H
         qX8y7eTrG5vL4xwyvF95jPXVx3vA550Jn2IW2Rz9flJsL7y2XrnkHL/lfm9gp64jxXmP
         HgSqqk12pUJKvdGP2luUlDDZ5uDtjMGEqgBddf7+3XXz3XLM3pshL6HAIxuAigkGKgTW
         eWXz89cx1M1CwmQ+g0sOQi9+Tm9OaRyvmNRYw/CURds/JkDn5e4dx428tR7GSwfCtwrb
         grwXHPvw47pfEKpg8tpwMzYsd8IFyPXwql0HO5bpfXyX6VCjhXyYoMLWYCj89d5+NjIm
         iOoA==
X-Gm-Message-State: AOJu0YzMTB8m2B0VY9DOoId0sLLAUwzopZ2zU6Y6C84xUa8x4fp2i54T
	WOAfpr4ibtQB8DcdWn3GVQvFG+N6D5T34SpkFnuZ+a8BfpVQXKnzCbxnwrbC0HA1KeKQiJR5jkg
	HxBewROsF5wXT/C5ewcbAgSTSGOFEycjD8QCBuuOskJ0i2FYGq2jKG++hHC4Zr5I=
X-Gm-Gg: ATEYQzynDUcHLslUk/p2k9VfKOZZr3mqERPlUlIMK47Tb4RGyzoE2AL3Xh8IMCczYML
	1m1eUF6Fvk7fMVBfPMyEkbfvmhWs+IRS+hcf294YK86c1VOgu0pYL9AjlaoV//3+fn6LIaDz589
	x2cnEJgm6CRWVOtfR6z5eyQBAZsgj3BMbz8rUd4rCA/mOBMPShVVts90/dxCcmnKG239j9mSbsj
	IfOD+lIr3p/fIFroqBH+sqIRiLLX7KuqOdLgMxuQKQ0BFH17wG7d2Y21eG97NIqUDnipzecf7di
	hYJu7ixys+1FiHTcvxywTg1QVqHlKFz7P4fgVibgXgKyHeF2JIQ4s5fe5UdD+YlAG95KPwbVIE0
	Du6oOZg8TMAIOU1+BXAqx1ZtDPrMQeGaqskDZGmhKEHEL+jcrlm8=
X-Received: by 2002:a17:902:f54e:b0:2ae:478f:2eb with SMTP id d9443c01a7336-2ae822f1f5cmr53494935ad.0.1772883717866;
        Sat, 07 Mar 2026 03:41:57 -0800 (PST)
X-Received: by 2002:a17:902:f54e:b0:2ae:478f:2eb with SMTP id d9443c01a7336-2ae822f1f5cmr53494825ad.0.1772883717343;
        Sat, 07 Mar 2026 03:41:57 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:41:57 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Qualcomm Sahara protocol enhancements.
Date: Sat, 07 Mar 2026 17:11:21 +0530
Message-Id: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEOrGkC/x2N0Q6CIBiFX6VxHQxQwLrqPZpzRJgs9Td+sprz3
 UNvzvad7XxnIehj8EjOh4VEPwcMMGaQxwNxnR0fnoZ7ZiK51LzghqLtbLTNFCGBg74Z/aeZJdV
 aVqo0pnCtIXk8Rd+G7y6+1pm7gAnib/+ZxdZuSsUrqQQXJ6mZFJorVVJBnwE7iJ7dbEr2Aojs9
 ba9g2FgOUi9rusfnSP4zbgAAAA=
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=5313;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=iEUuY3wGzLZPYjI71MhbAplsXD6EpLcgQaZDOkmWUSw=;
 b=RUj880u9mPXD5GTS+6SFf3uYgx5efxLyyzY/IPlSOkM8aMj1QCmRl3FN7mc9O/HuO1+NeVhwc
 +H4dMSpBWp/Bq7gM/RyR41jlCsZ4cZx8Jwl+8eq7RQ/sbo+knoIKUG/
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ac0f06 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lG-yCPvlEGbsawO-O7cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gxNngpS2hJSr--BG_UY6ScBSTNu_zMwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX7JuVPusKenYH
 wqOB3YFsT32cD3H2e4PDYe2+hUuNfqnowiQkJxJncbJuaxczchuc4Whw7SNWzrTCr65ujFPCx+l
 qKjnriQnWlOCqn7zClBqQqXMHwtivU9E3N1YPIyvctBB7cMiFBcud0+sXiCbLcNzbEE9WPEhshm
 n2YSmv29K6rSptXwuFiL2SDqsRT4Dj2xtFxISZXuUxZPGcSQOxfzTVC2BpW6gQRhAErZAWmfPAQ
 lLjg/IhA40fOBI7lt0gsp2mNXpeHGABzTjJDx/nsZEVLBN1AOTMygtJs97RdtiNAWRNw9OVqitN
 I145be+GMPX06BaSASqoyOkm/jhxYQvc21/Zaxdc6rDCXlMWpoYgliq/aqbj4sjY/vw3fVz/Kqg
 xzqRsntDKqU1y0vDEKchJf6UTUkFNiCJyeqAj/Q5V1cVVuM4RG2Q4siHRJcw0IKeGRHCiTX8SQ+
 uErFDCU/AeqA6QtqA+Q==
X-Proofpoint-GUID: gxNngpS2hJSr--BG_UY6ScBSTNu_zMwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108

Hi All,

This series reworks the Sahara protocol driver to make it reusable for
multiple MHI based devices and adds support for capturing, restoring and
exposing DDR training data using the Sahara command mode.

The Sahara protocol is transported over the MHI bus and is used by multiple
flashless devices to transfer firmware images, retrieve memory dumps and
exchange command mode data during early boot. However, the current
implementation lives under the QAIC accelerator driver and contains
device-specific assumptions that limit reuse.

Some MHI devices (for example, QDU100) expose the sahara protocol directly
on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
data with the host. The existing driver does not bind to such devices and
ignores Sahara command mode packets, causing training data to be dropped.

This series addresses these issues by relocating the Sahara driver to the
MHI subsystem, centralizing device specific configuration and adding command
mode handling for DDR training data.

Overview of the changes in this series -
1. Move Sahara under the MHI subsystem:
   a. Relocate the sahara protocol driver from QAIC accelerator tree to
      drivers/bus/mhi.
   b. Register Sahara as an independent MHI protocol driver.

2. Generalize device matching and configuration
   a. Allow the driver to bind to devices exposing the protocol on a
      SAHARA MHI channel.
   b. Centralize firmware image table selection at probe time using a variant
      table, instead of scattered conditionals.
   c. Preserve existing behavior on AIC devices.

3. Add QDU100 firmware image table support
   a. Add a QDU100 image table and select it based on the matched MHI channel.
   b. No separate client driver or registration mechanism is required.

4. Add Sahara command mode support for DDR training.
   a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
   b. Query supported commands and retrieve DDR training data from the device.
   c. Allocate receive buffers based on the reported payload size and copy
      raw data from the MHI DL.
   d. Store training data in controller-scoped memory using devres so it
      survives sahara channel teardown.

5. Expose DDR training data to userspace
   a. Add a read-only binary sysfs attribute under the MHI controller device.
   b. The attribute reads directly from controller-scoped storage and remains
      available after the Sahara channel device is removed.
   c. Cleanup is handled automatically via device-managed resources.

6. Document the sysfs ABI
   a. Add ABI documentation describing the DDR training data sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
Changes in v2:
- Rebased onto latest linux-next tip.
- Reworked commit messages to clearly start with the problem being solved and
  end with a technical description of the change.
- Moved the Sahara driver to drivers/bus/mhi instead of drivers/soc/qcom,
  reflecting that its an MHI protocol driver rather than a SoC specific driver.
- Removed client side image table registration and consolidated firmware
  selection directly in the sahara driver using a probe-time variant
  mechanism.
- Ensured each patch is self-contained and does not break the build or runtime
  behavior at any intermediate point.
- Simplified state handling and lifetime management to avoid duplicated state
  tracking and ad-hoc cleanup.
- Updated sysfs handling to use controller-scoped devres and avoid one-shot
  reads or manual teardown.
- Link to v1: https://lore.kernel.org/r/20250825101926.2160554-1-kishore.batta@oss.qualcomm.com

---
Kishore Batta (9):
      Add documentation for Sahara protocol.
      bus: mhi: Move sahara protocol driver under drivers/bus/mhi
      bus: mhi: Match devices exposing the protocol on the SAHARA channel
      bus: mhi: Centralize firmware image table selection at probe time
      bus: mhi: Add QDU100 firmware image table
      bus: mhi: Load DDR training data using per-device serial number
      bus: mhi: Capture DDR training data using command mode
      bus: mhi: Expose DDR training data via controller sysfs
      Documentation: ABI: Add sysfs ABI documentation for DDR training data

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/sahara/index.rst                     |   14 +
 Documentation/sahara/sahara_protocol.rst           | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/qaic_drv.c                      |   11 +-
 drivers/bus/mhi/Kconfig                            |    1 +
 drivers/bus/mhi/Makefile                           |    3 +
 drivers/bus/mhi/sahara/Kconfig                     |   18 +
 drivers/bus/mhi/sahara/Makefile                    |    2 +
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c    |  574 ++++++++-
 {drivers/accel/qaic => include/linux}/sahara.h     |    0
 12 files changed, 1844 insertions(+), 43 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

