Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185341FF7C7
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368084; cv=none; b=AtPPOTILdW7Ditcdp+Hj152KNT3eVfRz93TM/lwAloF87sMEPXv+9RwXW8bu14WvZbwE6bROg9ay9MoEQeWGA9D7YYO/Zw0h54viNhWOVHq2n0cc+pDBB632DLA6zLRkGdqJwJA0R5NJw1NQToPm4OrWpkBL9azv+okfLidKYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368084; c=relaxed/simple;
	bh=IcJ41p1S3Zzjw+o3gA1Mi9zZTLqegfsjHjcr7r1iJcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttOu9efTqq/4aMmyFZHPp2gwRl3ak9YMxMiVNAaBL+DfqwQtKvxCWQK4fNTL24HXuXtZSQwwTtIE1yCHUeDNkJkVUMOPzOyszrDQN2f9y3TUWH16Db3NoDVBwF9qOIC5SYDtZbNojn//FJ7IHOlXvhKBj5pJrRvNoXoiyOzbmeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1rHlRNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOd4b1cV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1rHlRNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOd4b1cV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42vWt1329554
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uVa5aELi8oMy5IN5qMbJc9fv
	wjHh1VOUvgLucaocG9g=; b=J1rHlRNedvYMBPu+kQJFq8obDoBh6bHtsfLGahz2
	hlQdCu+A6u3y7mjNloWouF+t4ISvCbX70e/l5X26Ljg2HnbVteXVnmUdaj70LAwr
	Se5keSzn6OCCgB6kTKCD9qIvIHkO03HYe3XZFCyixRkDWuJsXVxeHgm9aT3NtzNN
	F9k59gi5dAEG//R2LTnCsJS+rxYudLoQgLQRrtgEkNzmE0fUyzlJ5d87WPw51qs8
	LHONOWUKvpSi3Cz+8TPT5HHrXEt22Nh/a6Bdr4yu4IjaazJ6ONe5swPbm4d13sx+
	RvQnHLtGk9d4RZtOgaZOHHVy6uWmbgG2RvD9ITkBdunESQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhah4rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 09:21:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca154e2b5so196659056d6.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368081; x=1777972881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uVa5aELi8oMy5IN5qMbJc9fvwjHh1VOUvgLucaocG9g=;
        b=YOd4b1cVwSsNK4+1sMkmiM5NJM+9VU0OlisGAe5kL61hrXZzkkHFKS9jUaFSAjQRf2
         LVukT1X7Koq0P6kAjxWZrnnslCGcz5+dYtkPEv/I8stq66KHeEzHOoi/brD4HPoReUx4
         AdzU8v4Ru8YRFofuSSaVUylzsm0i5qOLnMJpKFAX2pnUJtxvTyHMDVhii7wiGv7kna44
         vQrBnFONurN0icXXkY/f3m/Auia+96DcYfe1vvqobI+4l1t8+ZZvA/la57aJqi6z24Ou
         pAwa4SqViMDala8CdJj1yUpv79FaAsd2CeypeXRGtcqI9/uJYMOeFlxPmkwCl68TDsfT
         mF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368081; x=1777972881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVa5aELi8oMy5IN5qMbJc9fvwjHh1VOUvgLucaocG9g=;
        b=Y6C0s5YgzMuEV22c8xLHTCRW3lbkn1FMgC0KscMtKjGtHH8o9rxnmpeDElhyCKqz8o
         rGVI8O8Gnd87tMzU06E+tOuucd+lgg9NkvSdMAWmx6fXMouiToRApgOm1m+7sH0dqye+
         BdRGTxubDsAdusfygqPZYso5PtioPwcAx2tW64yOJi+rIIMIY+9zraWEFaBT3ANLv3DK
         +1TnF4B7ddP+x/t1j78VNgbRAq9FJStq/qUhfalQoa+ndS3OUZ+HUChkAiKRJeanz/zE
         e3zyoO69r3hJUwo8KX6IulQxYZUx+bfHSg3aASXwo01P/dFccTVVBRJCMbE9g4GeUkat
         qxJg==
X-Forwarded-Encrypted: i=1; AFNElJ9oUaiLs5j9A8bkOkymITpD7pD78x9wu8G1wCPg2aAJVg8hsEqgBHM8p8bCo4PS9iZ7MhY6kzkIz7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fshpGAiBA8c8WKPplBNDznE2KT+j/5b6dbHybl5aNjChMn2o
	qhHpL6z91klWC1j0eBqojrQAQnmsBN2CC26BaJD+pCxBzxmlZmkpiAlj0u5Pu7nH/tFmddOvP+2
	zs1UXM+BDTI7h862a1Vg0RB+L2E5dAem5Ad4z1t8k2Yu23e1h5IFB/1ukDk4CZ40=
X-Gm-Gg: AeBDietsd46eFSpGvIX4958btUaxDrZyGJksMeVtgC9DiyYG/MMkONxWivJX4dpGsl5
	VSqa8cvA8AnJQhjJNEihYxO01D0mCo/VghY4zeAlQL62/fZxtr6yh+ztH63bf0UXWzjN+XUaDVC
	1L48ZZyeppqcAd4/ylt18pClCNwBhGnz1cIxxi24Jyd0TePpz+yVZ16J7aalBO0YrvQ8MpCWyKZ
	vqxBtqtxYPRdJJRBhfKsopnJ35F1PMHFv/SUWXnig199plRxVKPNp9KBt645qD3maeTgeF5ldBh
	8mzeg3CeiL27oJQc73x4li4RJ+RB/qozOn3lMFcA7Fss6mElpAII8lYmklt+eI46cs2a1FVX16e
	3Kg3QNUGIOWtUOwATjRJT43QkDuu2rDIMB/6EolhlUyk4ctTTWabXGKFDOu4Pf4HY4WliN1+25E
	LXwNpxrCm3i9Lw0mNusL+wvA9NF/RbfPoe7jzAAEZ+cSbWMA==
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr26863691cf.4.1777368081461;
        Tue, 28 Apr 2026 02:21:21 -0700 (PDT)
X-Received: by 2002:ac8:57cd:0:b0:50f:c117:1c52 with SMTP id d75a77b69052e-5100e0f6951mr26863341cf.4.1777368080872;
        Tue, 28 Apr 2026 02:21:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462d5821sm470542e87.33.2026.04.28.02.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:21:19 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:21:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v11 08/11] tee: add Qualcomm TEE driver
Message-ID: <ljfhoo5o45m3t5fsqypg75c46qohvszd5azcqxyjdcr5unx7ob@vcgip4yzkmmn>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
 <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-8-520e867b3d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-8-520e867b3d74@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfXz4m3GA/JLAae
 xSCzRu2q7RVd84zYOh5p2XL/5JUeH655k6T3Ar+8QoOey7qUvcESpfNOUPwCEEqemvWddNOflk/
 nK/Ow81n7YJsByh23Bz88NQCoiCS0W5IPl28F8bn9aV0lkXo9kd12/0oXw9BTQmFhkaGqQmqxOj
 3XoDUMu5/lcqhPQEI1kjoI+tXQ6mKARZRUZvvFy52KM3LFObQsPxFoSJe5pgbR8eu6CcNPAVOcp
 JkirzprxkxnIcgUmLYItsrXC641SnD40DZfbjPAC7AiytI3DGh4c0EEwuchhEvHobVLvQFYmDv2
 nwvnCNGjh/i6W9bV7+w2fpHmCC/QZHkjMlvCgQEu4raWCtwwThJUIAGWtBY5vBkrr35cofyYvwT
 F66ANL+8CcABrAwGZ+w0+gCz/enBO7rqhQVQxU3ARxUb3phm7ziM0nmR3FNYqVhFDnUp+XjWvxZ
 vgUTXlLgFYYTowuu7jA==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f07c12 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yhmqyPtzb8d5NndqWuMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6Rz7kFvz_UWaPrR4i6Gabi8iW58RyAM9
X-Proofpoint-ORIG-GUID: 6Rz7kFvz_UWaPrR4i6Gabi8iW58RyAM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082

On Wed, Sep 10, 2025 at 08:41:21PM -0700, Amirreza Zarrabi wrote:
> Introduce qcomtee_object, which represents an object in both QTEE and
> the kernel. QTEE clients can invoke an instance of qcomtee_object to
> access QTEE services. If this invocation produces a new object in QTEE,
> an instance of qcomtee_object will be returned.
> 
> Similarly, QTEE can request services from by issuing a callback
> request, which invokes an instance of qcomtee_object.
> 
> Implement initial support for exporting qcomtee_object to userspace
> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
> through the TEE subsystem.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  MAINTAINERS                          |   6 +
>  drivers/tee/Kconfig                  |   1 +
>  drivers/tee/Makefile                 |   1 +
>  drivers/tee/qcomtee/Kconfig          |  12 +
>  drivers/tee/qcomtee/Makefile         |   7 +
>  drivers/tee/qcomtee/async.c          | 182 +++++++
>  drivers/tee/qcomtee/call.c           | 813 +++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/core.c           | 906 +++++++++++++++++++++++++++++++++++
>  drivers/tee/qcomtee/qcomtee.h        | 143 ++++++
>  drivers/tee/qcomtee/qcomtee_msg.h    | 304 ++++++++++++
>  drivers/tee/qcomtee/qcomtee_object.h | 316 ++++++++++++
>  drivers/tee/qcomtee/shm.c            | 153 ++++++
>  drivers/tee/qcomtee/user_obj.c       | 692 ++++++++++++++++++++++++++
>  include/uapi/linux/tee.h             |   1 +
>  14 files changed, 3537 insertions(+)
> 
> +
> +static int
> +qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *oic,
> +				 int *result, u64 *res_type)
> +{
> +	phys_addr_t out_msg_paddr;
> +	phys_addr_t in_msg_paddr;
> +	int ret;
> +	u64 res;
> +
> +	tee_shm_get_pa(oic->out_shm, 0, &out_msg_paddr);
> +	tee_shm_get_pa(oic->in_shm, 0, &in_msg_paddr);
> +	if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY))
> +		ret = qcom_scm_qtee_invoke_smc(in_msg_paddr, oic->in_msg.size,
> +					       out_msg_paddr, oic->out_msg.size,
> +					       &res, res_type);
> +	else
> +		ret = qcom_scm_qtee_callback_response(out_msg_paddr,
> +						      oic->out_msg.size,
> +						      &res, res_type);
> +
> +	if (ret)
> +		pr_err("QTEE returned with %d.\n", ret);
> +	else
> +		*result = (int)res;

After enablign QCOMTEE driver, I observe the following error during the
bootup on RB3 Gen2:

[    4.720777] qcomtee: QTEE returned with -22.
[    4.725251] qcomtee: QTEE version 0.0.0


> +
> +	return ret;
> +}
> +

-- 
With best wishes
Dmitry
