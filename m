Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872F27F005
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 04:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093556; cv=none; b=XXRuvO1qZKmRpPZF5kMUP0E8BnoywIL4W1IzH4ireFv9xZ5GDChTAu9xYWG4/iCRFQoQoFfYfKJoYYiWUviooIBmwH+1byLfIqowlf6C8YcsQ+H8hVKPIqoqAbdCpb60Zzo/lmU5WYRKeGxZ2hOGZnYaYtXUbMEgsv5RNECKij4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093556; c=relaxed/simple;
	bh=vqxQ3dK7VdFS3PT/6Q6WjwlGkrU2MdtNuweZl3H6mBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpfsPmyDpHdffq2pzr2gvMMRKVnfB/otNiW8ZcKrGEM0bUqJjU3cyw8eZqeTs68eKFydodhZKYUCV3rJD8GbXPPESVQ/1BZy3z40XOdP7ErHf9Qe/4RQNzYg5P23VDBMEZN/rWvgVOc7wnd1E8xnssffio5im2uHKXCx0+bMeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcdvIvc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S6ehArPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcdvIvc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S6ehArPl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaokw1423690
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 04:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l9FUBbeUidxIV00pdQyQahKH
	PpoxkuEk9fyNczKyhZ4=; b=WcdvIvc3sMDYJHBly1X7GlPj50GGKCEK4vrDj8k0
	5eaZ80++Ws3b6M4a/w2eVgp5fBZPqpReXJ6xcZvCuGqlyHQVAUPNMJplXDtRkmjR
	y6847o+zGxT2XJUEtVt8QOs1dNpy77MXiVZuOJgYMs0BamIgUtjw2hTVBYrDWjPI
	ByZ746JdSL8Gv5MgaoTNMk2yzeUNW4jCf/D2j643Vd/vNt+46rBlvy+jz4Ihw0Z+
	fTd/SLbn6SPCPWVriGZp93nSNSFJRad1vxT6ksE51c5WW0OqhiOxjWbi0pFY79Eh
	201wVoknTjIeNpA4GWGoZTCf94s18YBclqS5YUrFYMV7Vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0rag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 04:12:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24383b680so727368285a.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 20:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763093552; x=1763698352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9FUBbeUidxIV00pdQyQahKHPpoxkuEk9fyNczKyhZ4=;
        b=S6ehArPlA6Y4Y2WhGL5tW8g9/P+SLUq8P/kEOUNHMBNtktCmPsFqnHMd7TRn04iPvO
         3UXvPPUHTZFrNRaz15CaNWcEokgpflDA4lHpPu+L9wZx06AZC8GrhZtLXNVTJk+CMbdu
         11zsB1uyN//YAxP5Y6B6mKG39c9o8KpIfLjHmkBiFb3K71khvkuwX4igh8z8to2voa3p
         zeYb6yua1xQrJTcS/hZVKWsHoARpHWPg+pAKO80q7A1M9sFReG2WhdDHevHZdxs/91T0
         ILNhpfgX4oj303aRnl5T51TBtUVEF1XALli3nQ25MOMx2STZunr5JokL0gQauX1zO4qz
         pY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763093552; x=1763698352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9FUBbeUidxIV00pdQyQahKHPpoxkuEk9fyNczKyhZ4=;
        b=Q5DH7bKttCdKBmuXjz8tifFR9mDJp51sFz5dRxFXZ1LPfiJPbO7EMqG4EK5qKXb+QW
         DTHTFRZVybnvgppiOqaMF4NDxyyapO6v5zXL0GLziv7gb8GhbySwwCVWlBWzJDaIyTUE
         3Gf81MH+E3XZuABIGOOf2Iis7Lx0K+QyTms/vm4xrbcQltX3LlcHXfOmKv1soQFabAiS
         qS+msCzWzHTbnF+12/7JMUYLOvW7cdct1t+k45UF/JUtIBWfQ6+kyR8iWy0U9NiLsIaD
         Ac/46TLqbawWR7RlqqZfOOZTQxb+JvRqBTnuKQt0XLFSBFrmDGh7QxUli9Eua9OOIgw0
         4vxA==
X-Forwarded-Encrypted: i=1; AJvYcCVpeuzkn6n4Mac+oWL6WFBH55Fqq8XIXqxwLkLo9bbCxL2c8zcrxueaPTEMoBtosjjGoS4hHZGmVAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKYBjadpsZqiubjc5mx0A3LxXhwfHaYe9yXuhqBkR/KC01Cwu
	FWoBxsLl4ok37Y3U5n01o6Bn0on6buNVNJIMsmn9xaAZEMjqWyPOuBQi4uQeabZ4DuVEV1H22k2
	oOsS/+4sOVy9HNuH7BOsGlEzru/a8DbwJYzKZeUT5bFwAo6vzzDspfabXPqRciUU=
X-Gm-Gg: ASbGncviCFBV8pMqX2W99Dtz7sVwWZdIrCBWm5BjKSqixlwzLabmmvB3ee63UOkEWxd
	0y+Un/53MrIBWfWvm0bPSW3tjcoMEO5jrkFoFCQICs2smUl8EUbzLO4V2TvGQvr4x/DGdKyen2r
	9ekBCEzyS4B9vG65wqLscz1F08pVoNacqCHfgpwznA4TszaMdSLVYYVxJC4Ay5aOVVORK3CdpOp
	oUSuWHhTodwKcwMGotkfZAVfsl2l7R59DLec861FwnD6QKKH56YpdnLLVNFtVx24Gl4iuRixgu9
	RBM7Jkyc0ZbFyvI/XNnQNttyINGztmIMr4xlhM372JSykpJSh1dFhO4XvVaEaMR4G+JsbwaWEb1
	agXrFXQ6G0SVufSI4aDclrAxq32JB0JNYoVsSLFS9m/IxPiDgqcCxERnzbeyLOrz3WzV8DipJUy
	Yfqznuag8aCq9i
X-Received: by 2002:a05:620a:4628:b0:8b1:ed55:e4f1 with SMTP id af79cd13be357-8b2c3175d59mr235429585a.39.1763093551924;
        Thu, 13 Nov 2025 20:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRBRFxxiAD30mEJm55HBtKCBqJwVeb/nqEO1wa7PZ+U+vRFrL3SI4k/Rw4EJ92OxtkmKQ+nw==
X-Received: by 2002:a05:620a:4628:b0:8b1:ed55:e4f1 with SMTP id af79cd13be357-8b2c3175d59mr235424485a.39.1763093551352;
        Thu, 13 Nov 2025 20:12:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405a4esm784867e87.95.2025.11.13.20.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 20:12:30 -0800 (PST)
Date: Fri, 14 Nov 2025 06:12:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
        Vitaly Lifshits <vitaly.lifshits@intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Sagi Maimon <maimon.sagi@gmail.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Karan Tilak Kumar <kartilak@cisco.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
        Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
        Max Kellermann <max.kellermann@ionos.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
        netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
        ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Przemek Kitszel <przemyslaw.kitszel@intel.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rodolfo Giometti <giometti@enneenne.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Stefan Haberland <sth@linux.ibm.com>,
        Jan Hoeppner <hoeppner@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Satish Kharat <satishkh@cisco.com>,
        Sesidhar Baddela <sebaddel@cisco.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 06/21] drm/msm: Switch to use %ptSp
Message-ID: <ngzyqzrjg2msv6odahkirdipjizbpaecfscfgnic3su5fl6hs7@qgdb53svq64p>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-7-andriy.shevchenko@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916ac31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=JNz3O4sEs4oywJvo4n4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyOSBTYWx0ZWRfX+4Zw1DBaOOlY
 hE06Brh+VczNBJWa8FhRxg6S6cPIxqREIr7jAuEr6vUqtouYUznYMmK6Eg5IFg0yaCOBMdUV2LO
 WkeEDjEp7WOuG3d2ikyAcdp8VeZB3kQMUSoevwY3wRjhb2cxxQXwJFCK6zlF7Yo7k2uDT8+/Pnq
 cExgNOleC332LJbNIjJv96YtPWVtDNusFHCp3ksUmZrqxPL0wBf+ToW5EJPh7uNkIvwaG1Xe+8A
 Dkx6HoW1RySw3Q6ZZSZ4npEUKWIfVxZtI/ddYbc72SZIor4InHVJq5ci5U2CrEKnSBm2943bonW
 /5cgubhISlT5Y7ojMrRse/M1z2Fv3kpnuVJoGtEbrcbvqEkKrLUzlORyMf/yIFMOcEDePWdEZhi
 J8PXxQza0A9m0oh7XVjOlvU0Z9L4vw==
X-Proofpoint-ORIG-GUID: yYAO6a5QuoGbMKZoYleWe4tb4WE4v4c9
X-Proofpoint-GUID: yYAO6a5QuoGbMKZoYleWe4tb4WE4v4c9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140029

On Thu, Nov 13, 2025 at 03:32:20PM +0100, Andy Shevchenko wrote:
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 3 +--
>  drivers/gpu/drm/msm/msm_gpu.c                     | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
