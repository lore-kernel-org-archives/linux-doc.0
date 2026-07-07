Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0258942088B
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783396041; cv=none; b=g9cfXVY0lEW/Pptpy5zesv2t0imSby2VgARewWeAHQhigTstlPU+UcmTzvSEc2eqL9C8UfyYeyehPdo9cMCigIyl76tqnKOb8ttj5M4kttPutD2B6BGzZEgwlWY4DKP3ixTUAt8CEgUpIy+UOKWhyjvWMoALN2JOcFkIEG7Yf2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783396041; c=relaxed/simple;
	bh=8FuvXj43qEW9pkubgws9NtoRYm37MvdVD99ryLk9c34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wm2VUmkmQkajz3MU5jBzyWN8fRbuZQt1H+ZImcgS68eGsZQof1XXn6CoXATBhAvZ+B/zz1L5NWlb2+uquacJDx6+roK1dI7gbmtsKCCjDZgFFcTj7AS6GxXaTyRJ0rkYDnVkUFTZg9x6zJUlh/nWqjK8ajq/IpfZoMKEXhx97Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCsuMmqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFk6N1c9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCsuMmqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFk6N1c9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEJ2k1639917
	for <linux-doc@vger.kernel.org>; Tue, 7 Jul 2026 03:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=10l19KTCxqSqYBdgxJawtbug
	fIDCCKBH6sLy1qfvrv8=; b=PCsuMmqq4w6H8IKL4WBNW/wOKcccb1RfrTXGgngs
	i5Y4KjftEt1aheYFGe6WM5ujcx2y7DfRXzChlPcTs/rMe+X41JrJJDSGaXnaGNax
	3u3W9HUrrCcLI7mAwkfsMu+clPpxiVxzWQA1VcpAvxuqOCFl00nz4qRvqHu9Klf2
	9genqowRTUZGoDrS3anzJJT0dxsryrsR9gjmaxjJkxWxTuwPFTj7N3WBBePYelWL
	94Fhk1NOQlkLLalHLZXlmeNpurVQ9oW8dv/ZIAXDTb4ckf0hysc8GuX47/qJvt+E
	eq6aWDlZRXzSaVyEyuR5hId7u36XyYQUZALUUckKBtNjtw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r3x2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 03:47:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6251817a12.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 20:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783396038; x=1784000838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10l19KTCxqSqYBdgxJawtbugfIDCCKBH6sLy1qfvrv8=;
        b=eFk6N1c9mnpEYKAkCZNDJL86dhhYaai/4z8DzqcluC3FYyfnRkSuHruXo3ypaSDGDL
         Y/FTPyYY4mKrzR5MAIvdwl5yPuzkO22ATTAuFyy1++/pncvCt0B1s7EO6q+t3Q8q7Yli
         xnvYv8MnNegnqFELRR3FUWG5eOKQ273Db2dj8ecirFGTxaA+dNuzKHRSweTD8jXdGjqN
         O3y6RP7MQJ5hBYdMbLoUoi8vgXkbHoGrdallxL5iL/iq0NCLbWPHm+ZfB4a3OpYnDigR
         V0IKbE40sRQesixOdusMwIXz7fYD8Dv0Bx17YsIaXd73Lm6onRA2ZU5dX761SALPwX/W
         Kb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783396038; x=1784000838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10l19KTCxqSqYBdgxJawtbugfIDCCKBH6sLy1qfvrv8=;
        b=OomOufQO9C2PriD1TYwsWB5JV5REXrA4ZYUI/eOKbQTxaDbp+wsTHAr58S2bqNtaan
         NM9MKSUaHWduv3npWePyfwOGqs6maGj0K5OaSJrsr11CxNkTPeWOxlUD5xW3G4+EgsB5
         9Fm1DpmCKGSN9f9UUutrphoTGQlVnNn9uMKaGCqEaBJgSxZK9h+piZ1i4coWMzmiE8gl
         aGcmWw1iUc14rXS2COxUKAG0TVYvx0dyTTXwsFFNmOSSPBHr4cGnOaTsMSCe3c/kUIkm
         ddgd7ixYTcsFMR5x9q//gBHTEjdOpTtnIT3IS3BBXePgrWWR576aZpP388RHfEeqj0Re
         Ejig==
X-Forwarded-Encrypted: i=1; AHgh+RrTxqPDMMzEp6IHLj5PxGnA/w1Yk7ecb+E3ygDRuGtts55PFmYRDpFpnefBYLhGmpgatYi8ZpjlOlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzKVHKszoYFc64WWlRO8wA3EaYjhW83EdEMi+QM9/CvtU6eyuu
	/3XC3+oD0gH6NmeUezR9k52/1pXcvrjmg/YHG68GlcswITDTulBlj3aTyPzHgXB9Bslf8t7905R
	2ht+oL9TVxfeMixQoXqlCzm+Lh2p18GZihezjyRbX9sSqa2EZzpvGrpf3USl4OOA=
X-Gm-Gg: AfdE7cmsqbUus5evnPAO9eEZK541Z5EdF5xdwhKymPM4C3KoBvuhx3al/oH8/Cx6gze
	clr/z2BCIjwvfQrQ0QqSQxl6tHkI1Rlheq9fgYK8qNKz3aNspt174geuwQtNxzQoj8NzqdkWSHh
	ZvWZgEAS4GVd7RXlaZ9qL9cTM0be33Y6uWiIV2By5JfJpDrAJNR2jqUJZ6xZ26lAndIQCjA45Bf
	3fAdG6I6eLkvmOp+pxiLUFTvsFs4iz8rx1hCFQkRq1OFqiP1ZUXTlLxIC4Qfv6mggyDIoLRp+F1
	z00e9ZKEn9VNttrFSV9BNGOmn9QACjPdMImddBfk5seGKS0Y1UZ0DOX1Z12QbIUz37sP0IWzrrE
	W/PTvBM75vIB9+HRIye3eaw4ozN0blCZcJlzu95n1XuOsK0f8D4TzKvgMSRJR
X-Received: by 2002:a05:6a21:6497:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3c08edf0234mr4305555637.23.1783396037830;
        Mon, 06 Jul 2026 20:47:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:6497:b0:3bf:b9de:854d with SMTP id adf61e73a8af0-3c08edf0234mr4305480637.23.1783396037283;
        Mon, 06 Jul 2026 20:47:17 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm2875802c88.3.2026.07.06.20.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:47:16 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:47:14 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: shijujose2008@gmail.com
Cc: rafael@kernel.org, bp@alien8.de, akpm@linux-foundation.org,
        rppt@kernel.org, dferguson@amperecomputing.com,
        linux-edac@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org, tony.luck@intel.com,
        lenb@kernel.org, leo.duran@amd.com, Yazen.Ghannam@amd.com,
        mchehab@kernel.org, jic23@kernel.org, linuxarm@huawei.com,
        rientjes@google.com, jiaqiyan@google.com, Jon.Grimm@amd.com,
        dave.hansen@linux.intel.com, naoya.horiguchi@nec.com,
        james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com,
        erdemaktas@google.com, pgonda@google.com, duenwen@google.com,
        gthelen@google.com, wschwartz@amperecomputing.com,
        wbs@os.amperecomputing.com, nifan.cxl@gmail.com, tanxiaofei@huawei.com,
        prime.zeng@hisilicon.com, roberto.sassu@huawei.com,
        kangkang.shen@futurewei.com, wanghuiqiang@huawei.com,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH v21 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature
 table
Message-ID: <akx2wqr3ULcmpCmc@hu-ashoraj-lv.qualcomm.com>
References: <20260706000338.362421-1-shijujose2008@gmail.com>
 <20260706000338.362421-2-shijujose2008@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706000338.362421-2-shijujose2008@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAzMSBTYWx0ZWRfX8thM9ses5IpA
 FLjF6Mn1yJtLwuafgseDfOVx+BTw8jth6zh96wWXt6zyw3cJVwS2dNr7O9Ska/hdm8wLyxH8Xkq
 eOz7bCxiTtDxVPAq4kr8wKpJlQN8joUfGJuO20u4o/OCOjTAxEdvy+1sN0OeQTToMeeX4SyyhqJ
 KuYaLwVESKuZ4wvJm+ewWAR3E3e9alviekfPNpqyqF/aqL1Ldf16c8JohucxYbOkFH+5nccY8bT
 SLaxnOnUMquQ7mfk9GQzPGOVhjLrA1sWEnEmMQubFdS4ekm2n6ZEmejlSBg4BToSrQXB5XMQ3Ht
 TTlOZQUhoNH0/2tSK3lROOaePgYJrS0KXINv7hwp12OBLN8+W5W4nbDSlLRqA8I3Y9FLz7r/lFa
 tmzgRvywxVqn9kf23doAYUUCFTFP5BADR8tfWJhG2nWZtKhWuzFdUlfiX1gmNFdVHcfsMvxIcPC
 rPc7zxQ3zWnLzI6I7Hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAzMSBTYWx0ZWRfX3X3GxqjGZVUZ
 90ukKu3pgIZdjiEnhccN6BdghuZUcLditedrBhWi1OZwc5IXSBFUYuNvnnmCDUCEXFtZ+n+wNi3
 xAwHdh2xiJTVw/nKZIH7ERguFQE4MCk=
X-Proofpoint-GUID: 4Mp8BQ4sj5tydQC70d6L0-h54GyeAoZz
X-Proofpoint-ORIG-GUID: 4Mp8BQ4sj5tydQC70d6L0-h54GyeAoZz
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c76c6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Go8T6LQju8gDQlRwKi4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070031

Hi Shiju

Thanks!

On Mon, Jul 06, 2026 at 01:03:37AM +0100, shijujose2008@gmail.com wrote:
> From: Shiju Jose <shijujose2008@gmail.com>
> 

[snip]

> +static int register_pcc_channel(struct ras2_mem_ctx *ras2_ctx, int pcc_id)
> +{
> +	struct pcc_mbox_chan *pcc_chan;
> +	struct ras2_sspcc *sspcc;
> +
> +	if (pcc_id < 0)
> +		return -EINVAL;
> +
> +	sspcc = ras2_sspcc_get(pcc_id);
> +	if (sspcc) {
> +		ras2_ctx->sspcc		= sspcc;
> +		ras2_ctx->comm_addr	= sspcc->comm_addr;
> +		ras2_ctx->dev		=
> +			sspcc->pcc_chan->mchan->mbox->dev;
> +		ras2_ctx->pcc_lock	= &sspcc->pcc_lock;
> +		return 0;
> +	}
> +
> +	sspcc = kzalloc(sizeof(*sspcc), GFP_KERNEL);
> +	if (!sspcc)
> +		return -ENOMEM;
> +
> +	pcc_chan = pcc_mbox_request_channel(&sspcc->mbox_client, pcc_id);
> +	if (IS_ERR(pcc_chan)) {
> +		kfree(sspcc);
> +		return PTR_ERR(pcc_chan);
> +	}
> +
> +	if (!pcc_chan->shmem) {
> +		pcc_mbox_free_channel(pcc_chan);
> +		kfree(sspcc);
> +		return -EINVAL;
> +	}
> +
> +	sspcc->pcc_id		= pcc_id;
> +	sspcc->pcc_chan		= pcc_chan;
> +	sspcc->comm_addr	= pcc_chan->shmem;
> +	if (pcc_chan->latency)
> +		sspcc->deadline_us = PCC_NUM_RETRIES * pcc_chan->latency;
> +	else
> +		sspcc->deadline_us = PCC_NUM_RETRIES * PCC_CHNL_DEFAULT_LATENCY;
> +	sspcc->pcc_mrtt		= pcc_chan->min_turnaround_time;
> +	sspcc->pcc_mpar		= pcc_chan->max_access_rate;
> +	sspcc->mbox_client.knows_txdone	= true;
> +

  Probably a minor nit .. 

  sspcc is published on the global ras2_sspcc list (with a live kref)
  via list_add() before sspcc->pcc_lock is initialized a few lines
  later via mutex_init().

  Once list_add() runs, ras2_sspcc_get() can find this sspcc and hand
  out a pointer to it (kref_get_unless_zero() succeeds since kref_init()
  already ran). A caller doing so before mutex_init() executes would
  end up with ras2_ctx->pcc_lock pointing at an uninitialized mutex.

  Currently harmless because the only caller, parse_ras2_table(), walks
  PCC descriptors strictly sequentially, so no second register_pcc_channel()
  call for the same pcc_id can land inside the window. But it's relying on
  that being true rather than the code enforcing it.

  Should we initialize the mutex before publishing the object, e.g.:

        mutex_init(&sspcc->pcc_lock);

> +	kref_init(&sspcc->kref);
> +
> +	mutex_lock(&ras2_pcc_list_lock);
> +	list_add(&sspcc->elem, &ras2_sspcc);
> +	mutex_unlock(&ras2_pcc_list_lock);
> +
> +	ras2_ctx->sspcc		= sspcc;
> +	ras2_ctx->comm_addr	= sspcc->comm_addr;
> +	ras2_ctx->dev		= pcc_chan->mchan->mbox->dev;
> +

> +	mutex_init(&sspcc->pcc_lock); <---------------------

> +	ras2_ctx->pcc_lock	= &sspcc->pcc_lock;
> +
> +	return 0;
> +}

Otherwise 

Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>

Cheers,
Ashok
