Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1ED3ED5DF
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141758; cv=none; b=O1VkKcHb2hodLPkfC4ZxFWOV64iLcWShumW/HGvvzSAQLfYhw9IK8ZA4oplULJROSeq9AAt+6318QMtMAN5toVZGlYrJ1NktQ7+m1Z7Zh3lvz6TaiK5leZubkJqWX29g5kVq0SCRuNcc605kzDPtoRxjzXbMpRTxCbWeOOtgkkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141758; c=relaxed/simple;
	bh=9HTS4fZ3H+lFANDn5LMcUa1sEWyLefaj6bErjMWxbGA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r/v8QNsi8MaR/NGZhPkBn481UgnLiI3ITtMDr9VjkuD0Z8NORsn65ubpZ5iBr64GFLRThQ1P6kk1IO1HsP0RiZJQbQdUN/CxzoyjnzPBj9LLvXvaOGeKYCIE2pOrCvTCGzJ2CaQwoiYYs0BMw2iZNwu1aUam/2GXTg7fp4MSkM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0cJ+uHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+tylTQS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0cJ+uHV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+tylTQS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632Cu8Nj1128477
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 14:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5v9zMJNPjpSTtFQa2UP54Z
	4SnDZvPgOCBNMoFPOzTAs=; b=C0cJ+uHVvBZ+ku9t4IWrTZsgDisrhoqZiJa/JY
	lx/qH+oKT0/Ls2+lkSuIG7ADjpdspP3UH4AOUqwZHaaZ3vxb0DK9SO7FH4ZxLjKO
	mJSj/01aODXbfbtYJEPzETjjfwxdfi0C0CweRNz32cb7n1zZDvTDCkHRuaw4FaUY
	8Stiew9CxAid1DkKFY0Aqf1FLA65EMALxfCQOBPyHBtEF0LSy4O23OVxzEtKvXnq
	XmfOjTPiKQzkh/ztE7354EhJDWbgPe9x+lwGkUxtYYZ9PIrT5tD+aYKl+EDwtwFs
	mOCPlhftOXypsic8ltb4CE0DPP4HJiywkpcf3vz1KraHGJ9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9cn52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 14:55:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so24614241cf.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141753; x=1775746553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5v9zMJNPjpSTtFQa2UP54Z4SnDZvPgOCBNMoFPOzTAs=;
        b=P+tylTQSjl84ZBut2rE8/gBm1L4cO5lXHi1/bllaE5ofYmHYIDKh8lbRpJVnNbf80G
         kojS9x/LWpQNpuAeaAS5vjyuEqHMcdKAESLSQM7SHgHlMTyyhk5CQzzsIDQ2/SdO56CU
         ra5N4BurdhMZ/nONAIuToMEEHksnPSzeXAKHFH6Rcpfw3R0AliL3M0mYdM+u+E6FZJJy
         9hzFcuXeFKYAn++N/U5lN6tEAiVGBxXzyIf478Vhg8IBixzZsoTLUFIXwu4M6fglmgAj
         2LEcX90k5F3KlKWi8BeVmMyup+s+otMQFUTgbWwQSZnAm2LqB3IPNZlv2fsDxiTYkwM4
         WZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141753; x=1775746553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5v9zMJNPjpSTtFQa2UP54Z4SnDZvPgOCBNMoFPOzTAs=;
        b=BMDktkVUEQHxdgJLve1NWHYj7YoUR2ONFFdP2iT99GcLP21pN67z4ZLY1bGrtb0C2U
         nWlPrJTQDvDS71LJEiuGpxYKeVH4oIHS8/1YRTVzz56THv+Ofniay0NcK+YpXCwnB7bh
         ln7s6x1oEcRwgMfhb5XH2pZkLeIIz4ah4p5PGSBUjFe3hUj9ilLvZtt/3OAXXXF+XmWO
         OJVP6QxfWCcxocDeMJyHXaMHeayitTnOraakcmbohbvYWQw8a/zKK/+cPKYCVTBnEbI4
         eaNY041HcxAxDiubFfTympz0edpsjcSCoTdk5ftnBY7JgFtXVhXWHSphN1ZLc0hoJCYV
         nmcw==
X-Forwarded-Encrypted: i=1; AJvYcCUWL4kRVXW7O96HT930+V1Hv5OAN9amyUPquPZCbrGOw/bCPZe+0xWCXjnOb8MLd+Idywmo3asccCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1y0T/JFfOdqHZREiF5tUUBwz5ZP4fvLdlgRVvJCj9Z0V4juRa
	RflwAWuV+T43s/i51NVkJ70TmKD0mOpS8+Ecao2BVaYPOu7b4zU59TRiW3PFRCMnkmLdfGjWHHw
	c8SdgFzvlwttA5CbzWQmczIqio3ftGEj/YKzNEnkEkbqSfwJKkoliXEqB8Ov5Jng=
X-Gm-Gg: ATEYQzzgUoxg+lMRKcH0kRBRUZOQtMZxn+dlSIslIqzg3Jl+/KlExDtXZnK88yOB+zt
	aVhK2B++Y3jqIdhp6hhAQzg7+Eoku+5tiTYnHi/nYyOqbaXCJwNP1XN9JbRTGUQRmtLwW28F1QU
	qoLzfuw0QGp3cAIHupJz4otN+7T7jxJWsv1Zyn/VecgLtvNNaqt7m3ZqlRvTGivPF2BCMAFzK5v
	qMshbZaB9rEVfwzhh4Yhad6ymjrV0ybt0nC484WI0OOtUQidK6P8h1dl+ygtYbt8XDUfCUC+xm2
	k2lCAl9R6CiOK1gRKr2ZK2GsmYurCJNN9XrSi3asD+qTElUurObJcQ/lBxNrJm4EPXOmWUqfQku
	fppo4aE6gRKt6zpMcxmAmE/BCVsJvAZv5VoFi1GP7vGDNAic/n93w
X-Received: by 2002:ac8:7d03:0:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50d4bba6211mr51259861cf.30.1775141752634;
        Thu, 02 Apr 2026 07:55:52 -0700 (PDT)
X-Received: by 2002:ac8:7d03:0:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50d4bba6211mr51259341cf.30.1775141751975;
        Thu, 02 Apr 2026 07:55:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v15 00/12] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Thu, 02 Apr 2026 16:55:11 +0200
Message-Id: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+DzmkC/3XRwW7DIAwA0F+pOI8IDAmwU/9j2oGAaZHapoUt2
 lT13+dWqxZp5IAlG3hG5soqloyVvW6urOCca55OlMj+ZcPC3p92yHOkAgMBvZRC8UuYjhSQh2P
 kEWsoPPToRikTDsIxungumPLXQ317p3yf68dUvh9NZnuvPrmhxc2WC44hxuBB0Rq2h3zyZeqms
 mN3b3YLA2zTcGQ43ycDo3UG4J8hxR8C0jURKUhJyaAek4k+6u1Ua3f59Ac6fOwo/FryaQ1CCWh
 bkixyZOrjqK2ANQsWFj2gaQFZytmkTIIBk1iz1NIybUuRJdxgcdTJBr1q6YUFqm3p+7xo1ydNP
 2Na87rdbj8hk9FndgIAAA==
X-Change-ID: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9691;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9HTS4fZ3H+lFANDn5LMcUa1sEWyLefaj6bErjMWxbGA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNkH+K2t7d9VEYrkQ+bxfDT/2MpwDhDu1tvj
 /joyUJJL++JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DZAAKCRAFnS7L/zaE
 w7CxD/0ajtu4iYpjOcpfav/T0BlpjGAd+UsaeLvRmVSGeF0jQvj0rmJVYy6sIOcq0CL8Jo2lNWp
 NZRcgbjwwcWejtSgdcTjbx4kh12s3YUwjMkqH2mxugGzrbYzgshlpdPJR6PR3SvZBoirdUF2gES
 KhXOgBlJ8Hbh4thBFXYxJ57IZVory6dK+wNGs70QD7WsG3MjNRmc1taDq2Yb5rGmvIXA4kqVVFf
 MmFQma9unFTAB+y53vEPsCiDLXOIpyNopnkLIWsmKwZlfQWVgKO81ud2UsptBaQ3Ejk7ZvcqUxO
 FHp+7GdZtGp97JipDA5MF+SoK4Ci+BkuoUq/uG1xQfrIYXyyZoXMx0O8d35ebTjlxf8QZ6jQBAt
 RE5a63zrzP0dlrToUvLyQ3Ag3/SB8PkOYMqKMGji0dnf4TyjHVRmL56YhIexGKffl+TXxU0Iy7Y
 mZ5afQgn4KQsugW8+GENq0gEdl1idINyxpTT6XQejHp4uUDH9nBpdEMBj6KYkgC2hYgMw9JrmIE
 PLulTIKg9uttbVZHlf1hxLLBqG7v0qG+cYqNN4xYL1O8/gn/4SzyiMwohUsXTq+WqpVNiaBSHkg
 flmLDB8L8G99ppe+U6Ubg15ItFLs+z9BbPbB6pvaQ8u1HMER3ZX3lY05C7eV6hsVMcLfa71BOIp
 QRDU8mYZbXudCSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce8379 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=uGVhH4IIQU4n5J_wZqUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mczc0FllqK8zpCtkvCFQheQzBlWp2xiN
X-Proofpoint-GUID: Mczc0FllqK8zpCtkvCFQheQzBlWp2xiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX5TD5hu7uj5nr
 JtZrYxcVIhLq2V4S0ve64ImJnvzoBAKtKUrsdgNMZT7E3v0EaJmD98MK8/Xt04jkXJ5/AEz82Bx
 DAi/T243JjswQPi0ltAuT3Jyb6mUjYu6at6zEylnvuzKX4U6HhE4QrV3DPG9rTfn3Q+zB7DthhB
 UKWu+TeRPPdmc871GtX7Upqg/rEzivEzNgNFefSoyudT0Jm3D/kix0Ew3s374mXMl9Vw6k/Z/3Z
 hfDqDvfOCx6sBCYfcRrR7FGgQt2lUfirbuolADtHmJP2hu1+AJDzxSro/IE119/Lybx0TXU2gWV
 6ujL9lmImYoiUlYsAnpwId+ZYqbKN1s2O90IXU/wsHiYIoJvb7ZfWdm4CPupQnnP6YPcfSWekjM
 lazavBkT3RvijobFMlvFmgISFq92HHC2UykIAqb6BNCmfF2NVscS1BKxwfPEAAIPjqi1U+B/w7S
 VYr4sC/1K3bWFHgL1gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134

This iteration is quite similar to v12 but uses the BAM's NWD bit on
data descriptors as suggested by Stephan. To that end, there are some
more changes like reversing the order of command and data descriptors
queuedy by the QCE driver.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking to the driver. The BAM driver will now wrap
any existing issued descriptor chains with additional descriptors
performing the locking when the client starts the transaction
(dmaengine_issue_pending()). The client wanting to profit from locking
needs to switch to performing register I/O over DMA and communicate the
address to which to perform the dummy writes via a call to
dmaengine_desc_attach_metadata().

In the specific case of the BAM DMA this translates to sending command
descriptors performing dummy writes with the relevant flags set. The BAM
will then lock all other pipes not related to the current pipe group, and
keep handling the current pipe only until it sees the the unlock bit.

In order for the locking to work correctly, we also need to switch to
using DMA for all register I/O.

On top of this, the series contains some additional tweaks and
refactoring.

The goal of this is not to improve the performance but to prepare the
driver for supporting decryption into secure buffers in the future.

Tested with tcrypt.ko, kcapi and cryptsetup.

Shout out to Daniel and Udit from Qualcomm for helping me out with some
DMA issues we encountered.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v15:
- Extend the descriptor metadata struct to also carry the channel's
  transfer direction and stop using dmaengine_slave_config() for that
- Link to v14: https://patch.msgid.link/20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com

Changes in v14:
- Don't return an error to a client which wants to use locking on BAM
  that doesn't support it
- Add a comment describing the DMA descriptor metadata structure
- Fix memory leaks
- Remove leftovers from previous iterations
- Propagate errors from dma_cookie_assign() when setting up lock
  descriptors
- Link to v13: https://patch.msgid.link/20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com

Changes in v13:
- As part of the DMA changes in the QCE driver: reverse the order of
  queueing the descriptors in the QCE driver: queue command descriptors
  with all the register writes first, followed by all the data descriptors,
  this is in line with the recommandations from the BAM HPG
- Set the NWD (notify-when-done) bit (DMA_PREP_FENCE in dmaengine
  parlance) on the data descriptors to ensure that the UNLOCK descriptor
  will not be processed until after they have been processed by the
  engine. While technically the NWD bit is only needed on the final data
  descriptor, it's hard to tell which one *will* be the last from the
  driver's point-of-view and both the downstream driver as well as
  the Qualcomm TZ against which we want to synchronize sets NWD on every
  data descriptor,
- Revert to creating the LOCK/UNLOCK command descriptor pair in one
  place now that the NWD bit is in place,
- Link to v12: https://patch.msgid.link/20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com

Changes in v12:
- Wait until the transaction is done before queueing the UNLOCK command
  descriptor
- Use descriptor metadata for communicating the scratchpad address to
  the BAM driver
- To that end: reverse the order of the series (first BAM, then QCE) to
  maintain bisectability
- Unmap buffers used for dummy writes after the transaction
- Link to v11: https://patch.msgid.link/20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com

Changes in v11:
- Use new approach, not requiring the client to be involved in locking.
- Add a patch constifying dma_descriptor_metadata_ops
- Rebase on top of v7.0-rc1
- Link to v10: https://lore.kernel.org/r/20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com

Changes in v10:
- Move DESC_FLAG_(UN)LOCK BIT definitions from patch 2 to 3
- Add a patch constifying the dma engine metadata as the first in the
  series
- Use the VERSION register for dummy lock/unlock writes
- Link to v9: https://lore.kernel.org/r/20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org

Changes in v9:
- Drop the global, generic LOCK/UNLOCK flags and instead use DMA
  descriptor metadata ops to pass BAM-specific information from the QCE
  to the DMA engine
- Link to v8: https://lore.kernel.org/r/20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org

Changes in v8:
- Rework the command descriptor logic and drop a lot of unneeded code
- Use the physical address for BAM command descriptor access, not the
  mapped DMA address
- Fix the problems with iommu faults on newer platforms
- Generalize the LOCK/UNLOCK flags in dmaengine and reword the docs and
  commit messages
- Make the BAM locking logic stricter in the DMA engine driver
- Add some additional minor QCE driver refactoring changes to the series
- Lots of small reworks and tweaks to rebase on current mainline and fix
  previous issues
- Link to v7: https://lore.kernel.org/all/20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org/

Changes in v7:
- remove unused code: writing to multiple registers was not used in v6,
  neither were the functions for reading registers over BAM DMA-
- remove
- don't read the SW_VERSION register needlessly in the BAM driver,
  instead: encode the information on whether the IP supports BAM locking
  in device match data
- shrink code where possible with logic modifications (for instance:
  change the implementation of qce_write() instead of replacing it
  everywhere with a new symbol)
- remove duplicated error messages
- rework commit messages
- a lot of shuffling code around for easier review and a more
  streamlined series
- Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/

Changes in v6:
- change "BAM" to "DMA"
- Ensured this series is compilable with the current Linux-next tip of
  the tree (TOT).

Changes in v5:
- Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
- Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
- Added FIELD_GET and GENMASK macro to extract major and minor version

Changes in v4:
- Added feature description and test hardware
  with test command
- Fixed patch version numbering
- Dropped dt-binding patch
- Dropped device tree changes
- Added BAM_SW_VERSION register read
- Handled the error path for the api dma_map_resource()
  in probe
- updated the commit messages for batter redability
- Squash the change where qce_bam_acquire_lock() and
  qce_bam_release_lock() api got introduce to the change where
  the lock/unlock flag get introced
- changed cover letter subject heading to
  "dmaengine: qcom: bam_dma: add cmd descriptor support"
- Added the very initial post for BAM lock/unlock patch link
  as v1 to track this feature

Changes in v3:
- https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
- Addressed all the comments from v2
- Added the dt-binding
- Fix alignment issue
- Removed type casting from qce_write_reg_dma()
  and qce_read_reg_dma()
- Removed qce_bam_txn = dma->qce_bam_txn; line from
  qce_alloc_bam_txn() api and directly returning
  dma->qce_bam_txn

Changes in v2:
- https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
- Initial set of patches for cmd descriptor support
- Add client driver to use BAM lock/unlock feature
- Added register read/write via BAM in QCE Crypto driver
  to use BAM lock/unlock feature

---
Bartosz Golaszewski (12):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine

 drivers/crypto/qce/aead.c        |   8 +-
 drivers/crypto/qce/common.c      |  20 ++--
 drivers/crypto/qce/core.c        |  28 ++++-
 drivers/crypto/qce/core.h        |  11 ++
 drivers/crypto/qce/dma.c         | 161 ++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |   8 +-
 drivers/crypto/qce/skcipher.c    |   8 +-
 drivers/dma/qcom/bam_dma.c       | 230 ++++++++++++++++++++++++++++++++++-----
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  14 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 416 insertions(+), 89 deletions(-)
---
base-commit: f09c0150ae6cb6eae66a75ddf6f0e890182594bc
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

