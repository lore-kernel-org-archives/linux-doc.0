Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAB6386C08
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753126; cv=none; b=UT0I80B/5M97Z+mHoyv+3kFxNRnsbwfMTDn98ibHYjbsBrb4UY3gc6G4itYeU3eI5TNFaaXfEDugr1snyh/IMU5jg4+hTBZybQ57PPOl+Zvr5MxjeZK3hqqf3szaGVjABcrzrInc+tNZLRJ7K8IMdLIYwr1dbxIKOiM0c35mC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753126; c=relaxed/simple;
	bh=Dt7uawwamGL5dzZbfwrTJusLP6o30EN5ycCd9lSUTTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pufjep3s2YiAxuAuq83jYeSLS8v5EpMEKXfP00SzdVeYvvPf+SAjPAzFp507nE/0MOCi+3HMOLT8Noem0NkbhWBiXUgGkcy6zjPpmZNaq7WNaEkdlh8P/N/tanTqt78C8nHBbRiDYmIfJyhNdtN8pjmqBbd5/PmW/4VSy8e/gns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAoOjh3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+8bTebB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAoOjh3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+8bTebB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737Gmmc3959939
	for <linux-doc@vger.kernel.org>; Mon, 3 Aug 2026 10:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnKaf8soKtsfI46+7/IcDh6tbT8xlfKfVzMrrCqhrT0=; b=hAoOjh3E7f/wHN+1
	M3aDHDlm2LGxlWFl8ZVuZzRSO8g7y0yP3x/gV9ZNnfE0P5JVomin8GLiIpcum0e3
	gUEVmOevnW7h7pO9XZ5P64oJdtwkCul7d4KtYAmzjMZ/Hsmcxt+QusMaMLXcBfBT
	/4hctq5jt+ULxRspBZrkDZsfxdSfxrAj4ey/BC+MdrsRebdoyh8jRybFXbtnYoQo
	3N3FuTolnWmE0TXebW2hKAmhM/QilCiV7HoQ6WJaNsCTbEpbjhxw/rgxIZSqHN5E
	x3S5qyGU/B2LRaj4YYcN0q/YNh7aj9xWLnKkzebRVzDTyW2B6AjV2ybswnOc0m3L
	uHCkRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajqvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 10:32:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so4488322a91.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 03:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753123; x=1786357923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnKaf8soKtsfI46+7/IcDh6tbT8xlfKfVzMrrCqhrT0=;
        b=P+8bTebBNK3ABnTI/DmMmVPJnAWOjJPddtUYFdM52mu2Q7ADGf+I6oJk//DCtX4iCQ
         AGtrsnqbbgBAJvdtw1/9cM9vJ1TC0QuccWJYfk/cRlM3Pv7vdbc/Y1cI3XHR3DXTD+zr
         ohxHhSf//c2L+dzQhnuYNUZnqagezeXyrL5wEgv1uMWfyycaoAxDsV3UdIqA8OopDd+N
         T7t7pUQ/E1b4UJjl573WoWKnqbyRVPifb1s9/ZlubzrvE3aI2oci7/aCGnN/cTNGyhxv
         s/bId4fxc+QmSx7gt5tit8XB5ubRhLntzVHQ37Kqy/MAtO8wkHce0PjlMs4eW+LZni3h
         QfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753123; x=1786357923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnKaf8soKtsfI46+7/IcDh6tbT8xlfKfVzMrrCqhrT0=;
        b=LLcC7e0XORH4hLZ1mJQbC1s6V4/Hp3i/Yl9vHExDBeHR9xQblkaRlACdwrjLiq1J8m
         zePkawNMJCpKUjK3HcXBrO8NPsZwTxrZCbkNFTYlV/sEEExFm3PtlScUvAN62EHbTxJR
         p27OmVxxQTvZxBQR6GIwE+sZE5s4slR8Pl+GlYUu+bXYpuqHobiafWR+0iweTwwEMHcP
         +1jcdG+vArByStUYKM1IdZM8eo/SEfpqHdTd3uCu+Oaf/23KUSqXg9s7YhDtH5WK1Hgz
         +0FQXRZwIjOW32uHC6mO9+uib+3p3hj57BVD3Lp1l7KE4qthi3gBJTfel1zJMkSEHloL
         agdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcW84ckUSuMGdUZQq8dFVHACOMusYMFViEuPZqY+ZAcxrxsWW6GbudG/CkMoepFuiFuq/vz78Oo+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YygDsSW5FARk1zziXa10NF8FHsu2aX0ahYQ8WElrFP/X+a/LW9Z
	wQkHRSfAzv9IuqcklDA7+NMTOji/IFqu92nv1p66iFvHELBornE28IT4fxmJa9vb/4m8FAkLUxL
	FyRJF78mwsffRFT0K2u0ujT49p1fYnurmdBlWXHrQTGMTjoI827pTlsIBtNBU5q0=
X-Gm-Gg: AR+sD12Fni56u2/8xi4PW3zezmIiNvG+7IP1SsDdxcR7XrFcuNLTKGOJ0FemCpl2mPI
	2ACsIljmPNIBZVQVGQP3QoOpvFAKtYNlgv4QGMdX4IEitLgcWXoxWrrQ7rjY+h8MRU0qYkDvICF
	m9h2UDD7YMePOtD46G8QGan4GZ3uC4tU8FQrAX8WC4ND10XfOuYUaqYBPpMXmJZre2E0oEaP8HF
	nvz3BeaAQzXkZjuqbu95sNkJ/8b+3hUYe1JOfykou8EmkiLxQcx2Uga+kV2bZzMziv3s2WdE9Ez
	DOMPzbA9Olvkb5mfECgSdAOgZ28fhptOwHRS67mr+YRwTvkcYRr7S+U6/gQwObPzDR7mMH98RIY
	6ZO8PsyBtC7Iy72b34Amv3BeSAA==
X-Received: by 2002:a17:90b:280a:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38fbc45436bmr8414424a91.14.1785753123090;
        Mon, 03 Aug 2026 03:32:03 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38fbc45436bmr8414407a91.14.1785753122550;
        Mon, 03 Aug 2026 03:32:02 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:02 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:44 +0530
Subject: [PATCH v2 2/5] dmaengine: dw-edma: Add DMA_SG support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-2-c12bb05e42d6@oss.qualcomm.com>
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
In-Reply-To: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=9314;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=Dt7uawwamGL5dzZbfwrTJusLP6o30EN5ycCd9lSUTTA=;
 b=Nn4l0bMMov/mSFqw3meaBaoqHEtMDdiPvrx/ENQmNWAidJ1BQ1j6oH20wYCJqtwxhbUJVyoNV
 IyqdC0G627/CGiVmC4k+FZvC/APWNV1tor2WcbrXmTKStUezyzJwKLn
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a706e24 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3YK5jeb26AILRK50rYoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Hkiuhflxdy85-YA4qntDcj4-QoHriDnD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXyK7Fqx5jpdOn
 Ci0QcMTQNbPRFtRBLrvAcaTrvKbrd94fmwXZrmVud/UVp0+YAzeBqRDBS6akjAlr3K10VyAuLI7
 k5i42xSSb+dvzcWRDYC1qknrRxy/cdk=
X-Proofpoint-ORIG-GUID: Hkiuhflxdy85-YA4qntDcj4-QoHriDnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX6ZV73dQKudai
 bvFeE2wl4CIdtmE2gcmd+emaLoy5fTo82m2S6WQ3GCh3Bj6ypN5+gTP4tW5g4l3dExTBNvNH+Wn
 iehBe+sWvz6z/y4hk0LWQjtu0p3zBrS1gLGSyaAlRKuL5GYZwnm3UOkkzox9T+LGMv1yLC+PISu
 RsVlkgSBNMIGkpIEgeA9E5u+YXarCQR90e40Ya0azYxDVf5CTD6BRt8d+u5Zdnk9BIa0HVWub/M
 JKkpMGgRIjixmftfHthnq5K1dsrJX0MSFiB4z9y9RmSsmbV3gUEqRUxLpSwq2RpUU7VtbmKsVuY
 KJivF/n11Jn3nnYeNo5Mbwuu/GSkLNxHKU0r4ZAazPjvE1l58K2H0BfzsCBKB8a6FvQnweeXD7s
 82L9BqhW+n1K4gILsc+jcLRITeI6NyEM6mLL7+Eexh8vb7iOdFufZ9hSc9U4SInbocSQ5cdM1xG
 +glp0xoW+tHFYHCnkxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

Synopsys DesignWare eDMA supports a linked-list mode where each list item
carries independent source and destination addresses, letting multiple
independent memory transfers be described in one linked list and submitted
to the hardware as a single DMA transaction. The IP processes list items
strictly in order, so paired scatter-gather entries are never reordered.

Implement the DMA_SG capability by adding a new EDMA_XFER_DUAL_SG transfer
type and a corresponding struct dw_edma_dual_sg carrying the paired source
and destination SG lists. dw_edma_device_transfer() walks both lists in
lockstep, building a single hardware linked-list; a per-entry length
mismatch or premature list end fails the whole request.

The transfer direction is inferred from the channel hardware polarity
(EDMA_DIR_READ/WRITE), not from dma_slave_config.direction: for local eDMA
(DW_EDMA_CHIP_LOCAL) read channels handle DEV_TO_MEM and write channels
handle MEM_TO_DEV; for remote eDMA the mapping is inverted. PCIe bus
addresses are translated via dw_edma_get_pci_address() for the remote side
of each transfer. dmaengine_slave_config() must still be called before
dmaengine_prep_dma_sg() because dw_edma_device_transfer() gates transfers
on chan->configured, even though the direction field itself is unused by
the DMA_SG path.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/dma/dw-edma/dw-edma-core.c | 87 +++++++++++++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h | 10 ++++-
 2 files changed, 90 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1f893dc54c7938a9c45bafd975a4f99fdc0acb38..9fbfa5ad65b5421b164d2ab9883233225e0269e4 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -372,6 +372,7 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(xfer->dchan);
 	enum dma_transfer_direction dir = xfer->direction;
 	struct scatterlist *sg = NULL;
+	struct scatterlist *dst_sg = NULL;
 	struct dw_edma_burst *burst;
 	struct dw_edma_desc *desc;
 	u64 src_addr, dst_addr;
@@ -429,6 +430,9 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 			return NULL;
 		if (!xfer->xfer.il->src_inc || !xfer->xfer.il->dst_inc)
 			return NULL;
+	} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+		if (xfer->xfer.dual_sg.len < 1)
+			return NULL;
 	} else {
 		return NULL;
 	}
@@ -441,16 +445,27 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 		dst_addr = config->dst_addr;
 	}
 
-	if (dir == DMA_DEV_TO_MEM)
-		src_addr = dw_edma_get_pci_address(chan, (phys_addr_t)src_addr);
-	else
-		dst_addr = dw_edma_get_pci_address(chan, (phys_addr_t)dst_addr);
+	/*
+	 * DUAL_SG translates each src/dst sg entry individually below
+	 * (see the burst->sar/burst->dar assignment), so it is exempt
+	 * from the single up-front translation used by other types.
+	 */
+	if (xfer->type != EDMA_XFER_DUAL_SG) {
+		if (dir == DMA_DEV_TO_MEM)
+			src_addr = dw_edma_get_pci_address(chan, (phys_addr_t)src_addr);
+		else
+			dst_addr = dw_edma_get_pci_address(chan, (phys_addr_t)dst_addr);
+	}
 
 	if (xfer->type == EDMA_XFER_CYCLIC) {
 		cnt = xfer->xfer.cyclic.cnt;
 	} else if (xfer->type == EDMA_XFER_SCATTER_GATHER) {
 		cnt = xfer->xfer.sg.len;
 		sg = xfer->xfer.sg.sgl;
+	} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+		cnt = xfer->xfer.dual_sg.len;
+		sg = xfer->xfer.dual_sg.src_sgl;
+		dst_sg = xfer->xfer.dual_sg.dst_sgl;
 	} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 		cnt = xfer->xfer.il->numf * xfer->xfer.il->frame_size;
 		fsz = xfer->xfer.il->frame_size;
@@ -463,12 +478,23 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 	for (i = 0; i < cnt; i++) {
 		if (xfer->type == EDMA_XFER_SCATTER_GATHER && !sg)
 			break;
+		/*
+		 * DUAL_SG walks the source and destination lists in lockstep;
+		 * a premature end or a per-entry length mismatch would leave
+		 * the descriptor partially built, so fail the whole request.
+		 */
+		if (xfer->type == EDMA_XFER_DUAL_SG &&
+		    (!sg || !dst_sg || sg_dma_len(sg) != sg_dma_len(dst_sg))) {
+			kfree(desc);
+			return NULL;
+		}
 
 		burst = desc->burst + i;
 
 		if (xfer->type == EDMA_XFER_CYCLIC)
 			burst->sz = xfer->xfer.cyclic.len;
-		else if (xfer->type == EDMA_XFER_SCATTER_GATHER)
+		else if (xfer->type == EDMA_XFER_SCATTER_GATHER ||
+			 xfer->type == EDMA_XFER_DUAL_SG)
 			burst->sz = sg_dma_len(sg);
 		else if (xfer->type == EDMA_XFER_INTERLEAVED)
 			burst->sz = xfer->xfer.il->sgl[i % fsz].size;
@@ -492,6 +518,9 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 				 */
 			} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 				burst->dar = dst_addr;
+			} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+				burst->sar = dw_edma_get_pci_address(chan, sg_dma_address(sg));
+				burst->dar = sg_dma_address(dst_sg);
 			}
 		} else {
 			burst->dar = dst_addr;
@@ -507,13 +536,19 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 				 * and destination addresses are increased
 				 * by the same portion (data length)
 				 */
-			}  else if (xfer->type == EDMA_XFER_INTERLEAVED) {
+			} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 				burst->sar = src_addr;
+			} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+				burst->sar = sg_dma_address(sg);
+				burst->dar = dw_edma_get_pci_address(chan, sg_dma_address(dst_sg));
 			}
 		}
 
 		if (xfer->type == EDMA_XFER_SCATTER_GATHER) {
 			sg = sg_next(sg);
+		} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+			sg = sg_next(sg);
+			dst_sg = sg_next(dst_sg);
 		} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 			struct dma_interleaved_template *il = xfer->xfer.il;
 			struct data_chunk *dc = &il->sgl[i % fsz];
@@ -613,6 +648,44 @@ static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 	res->residue = residue;
 }
 
+static struct dma_async_tx_descriptor *
+dw_edma_device_prep_dma_sg(struct dma_chan *dchan,
+			   struct scatterlist *dst_sg, unsigned int dst_nents,
+			   struct scatterlist *src_sg, unsigned int src_nents,
+			   unsigned long flags)
+{
+	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	struct dw_edma_transfer xfer;
+	enum dma_transfer_direction dir;
+
+	if (src_nents != dst_nents || !src_nents)
+		return NULL;
+
+	if (!src_sg || !dst_sg)
+		return NULL;
+
+	/* Determine direction from channel configuration */
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL)
+		dir = (chan->dir == EDMA_DIR_READ) ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
+	else
+		dir = (chan->dir == EDMA_DIR_WRITE) ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
+
+	xfer.dchan = dchan;
+	xfer.direction = dir;
+	xfer.xfer.dual_sg.src_sgl = src_sg;
+	xfer.xfer.dual_sg.dst_sgl = dst_sg;
+	xfer.xfer.dual_sg.len = src_nents;
+	xfer.flags = flags;
+	xfer.type = EDMA_XFER_DUAL_SG;
+
+	/*
+	 * dw_edma_device_transfer() rejects unconfigured channels, so
+	 * dmaengine_slave_config() must have been called on this channel
+	 * beforehand even though the direction field is unused here.
+	 */
+	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
+}
+
 static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
@@ -997,6 +1070,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma_cap_set(DMA_CYCLIC, dma->cap_mask);
 	dma_cap_set(DMA_PRIVATE, dma->cap_mask);
 	dma_cap_set(DMA_INTERLEAVE, dma->cap_mask);
+	dma_cap_set(DMA_SG, dma->cap_mask);
 	dma->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	dma->src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	dma->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
@@ -1017,6 +1091,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma->device_prep_config_sg = dw_edma_device_prep_config_sg;
 	dma->device_prep_dma_cyclic = dw_edma_device_prep_dma_cyclic;
 	dma->device_prep_interleaved_dma = dw_edma_device_prep_interleaved_dma;
+	dma->device_prep_dma_sg = dw_edma_device_prep_dma_sg;
 
 	dma_set_max_seg_size(dma->dev, U32_MAX);
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f6a5ad31756723e6fd72f7d9d903a1204e25c0b0..e3219ae96d84f528fb7d77dbe3a0b3d7c1264f05 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -38,7 +38,8 @@ enum dw_edma_status {
 enum dw_edma_xfer_type {
 	EDMA_XFER_SCATTER_GATHER = 0,
 	EDMA_XFER_CYCLIC,
-	EDMA_XFER_INTERLEAVED
+	EDMA_XFER_INTERLEAVED,
+	EDMA_XFER_DUAL_SG,
 };
 
 struct dw_edma_chan;
@@ -151,6 +152,12 @@ struct dw_edma_sg {
 	unsigned int			len;
 };
 
+struct dw_edma_dual_sg {
+	struct scatterlist		*src_sgl;
+	struct scatterlist		*dst_sgl;
+	unsigned int			len;
+};
+
 struct dw_edma_cyclic {
 	dma_addr_t			paddr;
 	size_t				len;
@@ -163,6 +170,7 @@ struct dw_edma_transfer {
 		struct dw_edma_sg		sg;
 		struct dw_edma_cyclic		cyclic;
 		struct dma_interleaved_template *il;
+		struct dw_edma_dual_sg		dual_sg;
 	} xfer;
 	enum dma_transfer_direction	direction;
 	unsigned long			flags;

-- 
2.34.1

