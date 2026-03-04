Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D9F3845D0
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615117; cv=pass; b=DHTtOWC4/ZZRsqqNVMSHwNNQOAXEPrnOdYA5dJnckVEOnioJRKpx70PC6a1exIx3LG2JrT+uOHW2iiMVmm14ZQ6vvGGzXWdyA1UxRvxBccFLP+Gw83aXQosT2XxQWUWGO/YS7HBDKxkNiMrNeewsVxj01hJIbCbdRTS2iqv9Zk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615117; c=relaxed/simple;
	bh=FKLPownS4as4Rxizmq6wK7Bz0LkGYz79WGXPKG34n58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hsexfyj2HT3/yY+rDGMlY8il5vEmEMOjb1zqGlXMqzJarEzoayTVCcU3OxKGATdZJF/fhCBrTSWp3W4Asm23cmTz4U7zqkfKZOl1psDySX+XVO3hLAamNBRyQbHbql63mqZ/jVlSdXyh5kMv2jyJ4PR+Q1xD8bjxvKjg5h4MKn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awZOxuVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DI9QGZHE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awZOxuVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DI9QGZHE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQnx945115
	for <linux-doc@vger.kernel.org>; Wed, 4 Mar 2026 09:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=; b=awZOxuVNTvwZ2+av
	WPZlYoD53H5UyBDyiduxLMCXEcxjGmx5GoNpk1jU6aqt1G5kK3OrObXSXVVRzNte
	NOvxmwY39p2J7rOHaRj2/YYL4uy2Vlc74lnjFhfZ6qxVpP10jhmRJp6fA7mHq1Lj
	UZKYNFdbs9xLSI/lFPJCmgtVW0EqLgdJ9FeAQvwNKQB+9oZA9nHRYMoOVKXCfdAx
	Oilktxm5mYA6T1VApB4flJac9/Z3we3bnbuX49UsNQiO6yMkpw5RZ0vjHnfgoUVF
	3cDFYOSsZU5AJOzyCvUqVYv8CImCnGgVDrubkg725Z93ga8bmbchh3opmOZgZ+6e
	/1mspA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfcd7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 09:05:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a178d7270so84148766d6.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 01:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772615115; cv=none;
        d=google.com; s=arc-20240605;
        b=AvmBjBhqEutio6l31rwclQjAETH2ebYh61n+ac91kqaTqYBMNpgbPWEN1fwb4GzfWJ
         syCpZ7g8HC5UA5zEr0rZClVgOVYJDVfrhHRiarsqmC9bAFZdQt2zu7PrG9XeBqYAeEVS
         UAvPA+xnuzDm42mxJFcG/3jEUkpXHJ8eahkwxgxO0t1sUnv10s9yAfcZ4jy+Fd0xuaCO
         W4Y+SqyOcHKYMloMXrpKHTKcNe9vJw+HUMml4QD/rqbaN7pAlNweUHVXTUl4LcFb7ezl
         WDwKaoI/pWOXxnPU7xkB7EfyhGxStcVYoyjvwIGMQ7/se7DxylKY5XmX7bPTLSjxcuxP
         ZdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        fh=6vB+zAMF0amMfkYGJicYLdBHeIK6JgGE5nRrQjEWUYI=;
        b=P5UwBXiAlDPqngRLbvTQiYg/nLidjbqqMC5JvKl90x7Qzkn32LIHwoxcK3u7wl4OH/
         lDIZNxBcs5QhQ1+5CWXSfqDULvCPexs0ix2TvCkWf0VT2yhUHMLG67e4OGoceQaKyPSp
         QhLnHcQtmvutaUOTC+Yts+gNO3qvY3khjA/okj1HQhqjUg7iz25wHE9P8JTfunJRV03Z
         cQhHkynDvYcvvF3Ulh7QG7PRM8C0HaFAlxtDBTimcenxeN3p95ZYaNN/+LbENntfnEkL
         TX62xcx4IbShXw9YlH9OQwphsLW2e8h2YRD/S0pwFClqbmm4Zvv/M3DfH+KybknXgi65
         eYqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615115; x=1773219915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        b=DI9QGZHEhcIqz6JrJzfhBLx3tJN91E+exN79NV29RYbMTORZpYFOAyY+zfs7szROuS
         1ShVJ/VB3KeVVvRSs1KnXfrd7rIPtQyAh0y48y8+w6u/QOUfejPUuIHoO2NPVTJi7cCu
         mU8yUKh92FGV/YDWftvEqiHc79qBHbAXNRKFAt7NzbNIlrXEuW9mJ2Ez69wq6zVKzk34
         ugik7eHc0fqG0h6PLfFUCpjARP6Op8EyQTHEoDxbrGhi36uZakuaQi0INoGJAXqxTgf1
         ztzQWNiysCo5XXAhls8iowu7FvHg+NCuoa8XNKWR4DtzNheVAXuStk2njofvjIYfKLd1
         PFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615115; x=1773219915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        b=hGNlKo+2r8aQiamaGXXnSXzxjRE7Ys//SmTQ4KviaYjoXvF2H+cgQCvjkAZPokOxTd
         iFr0EsHLTbr2tQJ6Lnz/yz+lpepu8Oufp6hCAP9dCPPnXP0BDCUKNPSMZAhaxKCMScc6
         uBYBfkKlR7v+tpW+7QOk8rX91+K5+3ty7ocQ4MIS04BOv9x01k9YJ1mULItjZHcV5L3M
         Mii4MaCnrVV4up18Qap8VPwJx0Q0Kcz9p4kSOdcoKvjx8jieCBPCERQ1eGJV5TyQ0/M2
         Yx1PfK+SY9B74Q6ApgEhuKKOxG1KYL+t7OW1I8p8etsYq+bHJVW797GmeCm5yR0XWyah
         aOTw==
X-Forwarded-Encrypted: i=1; AJvYcCV1oOgADMkjPGfAJNwPiuRqW558LlrBh52uRHu+DLqt2b+SEXjePYl1i8YThKjoOGI7dCkOuwumxYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPTScLb2USGMW+Rnp+dvp/+ieaS/cWmApRrO17O9jYazMIF6fz
	y3nIhUOwFcvM/W+4sqsgGPdZen/9EQOe2OlcudWDVvkpDHELvsvICKRkFkP8cwQRsWwyWiYB9kC
	IMoBVz2+E81rEgHSFAKUJiWkT1W9pzn2Bhzh3Den9RcQqdx1gN+aTxuHYtvX0M8Tce6lXAfB0i4
	yXGcN5aevt+H8vVx/mvT7PvkYj9YZrhsoacTibuQ==
X-Gm-Gg: ATEYQzxir7A8MRnRyCHE7AgxqQYwODPyiPu2QoZO/bkyY/xVB5iGHBXd1z2iuig/thj
	jMDzC4SYl0lqGrAWdmVy46o7nFHzD9cXHPxPttmy308CFVKA4bYWQPqQCnMP+GRe5kNDcMjLUj+
	JSmUAbveQZp/qK/HUk1U33GOLGmc5oR63yZCrQvinMX0lCbO4skoRtwmT3m9vBovPu4PfcDVD5v
	yfnirNHFWVttGT2ZpdvSBKGgQgcPOal7x5BGwEK
X-Received: by 2002:ad4:5cc3:0:b0:899:fd1e:47be with SMTP id 6a1803df08f44-89a19ac3694mr14701956d6.30.1772615114891;
        Wed, 04 Mar 2026 01:05:14 -0800 (PST)
X-Received: by 2002:ad4:5cc3:0:b0:899:fd1e:47be with SMTP id
 6a1803df08f44-89a19ac3694mr14701676d6.30.1772615114437; Wed, 04 Mar 2026
 01:05:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:05:03 +0100
X-Gm-Features: AaiRm52GpPLERaXH_bo6QPLSahmWGlT4Y_NVOOLhpNvAEmeb6xiH53K9rnhnSsA
Message-ID: <CAFEp6-0ik4B20cRyid9w0f+UgibGciPof9HCWTJ=uBOPvHG35Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] char: qcom_csm_dp: Add data path driver for QDU100 device
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2OCBTYWx0ZWRfX+8cqkNRqpaRG
 CSBxtrq8Zbfm4nzHMXplKQUhf0IBf5WUnRnoniO0SQfWCDBg1i5b1ls395sTN1oe4fTdLRpPqcH
 ujQOvZf1fHU+Iv1BzLzr/XxNXYI/1scN8Vx/ypA2A+yPMfMQB9YLNDjjw+bj86khNw10IqTdR0g
 Sn+ODfZpP3mwmggL9bOpmDtsoERX+/clZBLi60501iBIsMzCv5iP19iiAIpDJsbbw9KSwHoebLe
 hsrVE4qR1b3mGEDPgqrHNMe380qBc8dYdnnPRVXjnlDJnvSWkSfi50y28GyRD8ObYNkBCYGGUs7
 MlLZPCQQgY9hVd6KlcegnuUMF1CXjrR4uGDaf4euqk6fpr2jlsCHjuDw1bBGme9dK8QpOwHmPMg
 KzgUsRcx/JRxrAIdJUgN5nuGJ38HJorvnVt6fg7gHzJR0jbeCtxyI6sFm25+HvPJm7wq4N8V3kI
 2CgnM16DIipm1MzOL0w==
X-Proofpoint-ORIG-GUID: G642cpa03gPbNBl87iMVkZAQBoUqNBhz
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f5cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=1qH30nBXnUapzXPqwXgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: G642cpa03gPbNBl87iMVkZAQBoUqNBhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040068

Hi Sivareddy,

On Thu, Dec 11, 2025 at 9:07=E2=80=AFAM Sivareddy Surasani
<sivareddy.surasani@oss.qualcomm.com> wrote:
>
> This series introduces a character device driver for the Qualcomm
> Cell Site Modem (CSM) Data Path (DP) interface to support the
> QDU100 5G distributed unit in cellular base station deployments
>
> The driver enables high-performance communication between an x86
> Layer 2 host and the Qualcomm Distributed Unit (QDU100) by

Why specifically a x86 host?

> transmitting and receiving FAPI packets over PCIe using the Modem
> Host Interface (MHI). The design targets low-latency, high-rate
> data movement suitable for real-time 5G workloads.

It most likely belongs in the WWAN subsystem. While WWAN currently
focuses on User=E2=80=91Equipment/Modem=E2=80=91type devices, there is noth=
ing
preventing us from extending the framework to support Distributed=E2=80=91U=
nit
accelerators, including defining a new device_type or other
abstractions as needed.

>
> Key features
> ------------
>  - Provide a character-based interface to userspace and register as
>    an MHI client.
>  - Implement zero-copy using shared rings and memory pools to avoid
>    data copies between user and kernel space, reducing latency and
>    increasing throughput.

We already have established mechanisms for this like dma=E2=80=91buf, udmab=
uf,
io_uring, etc.
Is there a reason we can=E2=80=99t leverage those instead of introducing so=
mething new?
Also, AFAIK, MHI is also already using rings internally for transfers,

>  - Expose ioctls for memory pool management and packet transmission.
>  - Support two DMA channels (control and data) with system
>    configuration ensuring correct channel assignment.
>  - Add SR-IOV support so QDU100 can present multiple virtual PCIe
>    functions to the host, scaling to up to 12 devices with up to 4
>    virtual functions per device.
>
> Userspace API(dp-lib)
> -------------
> The character device exposes ioctls to:
>  - create and manage memory pools and shared rings
>  - enqueue and dequeue packet buffers for TX/RX
>  - configure control vs data channel usage
> dp-lib: https://github.com/qualcomm/dp-lib

Since FAPI is a standard, could this be exposed as a new generic FAPI
interface/API?

>
> MHI
> -------
> Add support to read MHI capabilities. Initial post of MHI
> capabilities is referenced here:
> https://lore.kernel.org/all/202508181647.7mZJVOr6-lkp@intel.com/
>
> Add data path channels and event rings for QDU100 VFs. Disable
> IRQ moderation for hardware channels to improve latency.
>
> IP_HW1: Control configuration procedures over the L1 FAPI P5
> interface include initialization, termination, restart, reset,
> and error notification. These procedures transition the PHY
> layer through IDLE, CONFIGURED, and RUNNING states.

Why calling this channel IP_HW1, and not FAPI_CTRL...

>
> IP_HW2: Data path configuration procedures control DL and UL
> frame structures and transfer subframe data between L2/L3
> software and PHY. Supported procedures include subframe message
> transmission, SFN/SF synchronization, and various transport
> channel operations.

Could it be a FAPI_DATA channel?

Regards,
Loic
