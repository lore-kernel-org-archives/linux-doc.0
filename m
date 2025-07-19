Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C96022D7A1
	for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752921166; cv=none; b=L9g+gXsDL2nudkRCBvVVc+yiIxAXKjAFejlQ6dcqITZdY6NIjgcWLafxuOUdBZA+IEx3dtLvbcn9D6Fhpr0d0Y14cVpp/6tSE+22tSwijC+DVarUtvg888gh8YIWA5w137iAq8V2ok4HvrwzLJnjUPI+W7dnV10Pla4tXZ2lZhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752921166; c=relaxed/simple;
	bh=T2ye2l75Lj3Lleb/xuoPqhp7Wl0OEMA5wv/bIJGwIgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpKhAJJf8/vb/KLwIFeBGNOTNYlhEdkTBRX+1atiCxC20qjIvdIXQr+6sc8D48omsqJ5jWUR+l0HZlPDu9KllPLuE03FiuY9T7cJj5L29HcOObIcgz7I6NZ2zncDiOQz94Mn/XYUyfgq5xIdIiUAPaK0rvJVTuf+OobX1R9qph8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7qGKWCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7qGKWCl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4FgGP018269
	for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 10:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G06iwEutK3GO5lHqQU1Eqf05
	c4jNYrzpMWxGrGkxhJo=; b=P7qGKWClADMSME/mv2lvSzusTfdruXgsRvc8STfH
	rN6Byk2gxnN+etDjq70KR41ths+fuho2v3STtqSh0tp4lPiHC9fiMDYUD0aJI8DQ
	+djVqF4dCoPsjS4LP665vLNdGR8FbtRXYnKmH840WfZwIIpMKyiaVMPIqJedoDZJ
	16o4k0CoW3k0c89dJc98bnuZTsoZEzm5N0Y8liCwMh5rhLZhz6hg/wt8zyRUBudw
	8uoPAxubE5n0sraVoNcJKaHkjB1m6txCpveJJi6P7+oP2TL/mZg8xTZXQFzG/hGE
	KBXTCnud/NFFzGXHBO5eHH+UtheMEshZtHfkGpVi/4joqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045h8ge3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 10:32:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2c8137662so501760585a.2
        for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 03:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752921156; x=1753525956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G06iwEutK3GO5lHqQU1Eqf05c4jNYrzpMWxGrGkxhJo=;
        b=uRMpuTrt8YKT8icy9UgQPz061kn0K0uAjDPGKDYikNzy/UTIxuac1XzP17MYRwOg0n
         oi2CvKjlbHnr6wAhGmsydmy6uzDj0mICdRE8PrBkR4YoxyRzb8GjrCLGTA6ggHWsNAnX
         JIXjQhtnzzwOdOfNyCH/2O0AwHqRfwL6XOQHKTqp2S5hzB0Vs2uRHwxj1KTssojIdxbH
         PguoLK08zxo5Xlvj01jvU+8vq5+UK/3H+I2byv6BjrKDZrTKC4qgXkxpQXZs8if8dvEH
         tBly8RYQxKY1uyw9BDxPbcWB+IE5mGvLCDV0wmoE3TgYm5+28Z+8JUABVPkrWGIAsdb7
         4T8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuxsBlrgyzFi8RdsmkdwqyZb5zlJSwLQtdYRUJT4fUsF2rKNngc+3SFcUZVNDoLfjwhOBsfAwN0I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrMfUmC4rDAcVponGDU/CktlFyUQ86vQuW6xNFEkjzW2471M7
	zqtlCoqzNAWukaU1sdyYvgrACrX/hsZA7aHIQCYYma+zsWyuzA1Z369oc2Nt9fjT6mlvrCyk512
	vhl6/CMsFU5pjUJd2jif8MiNb2kcnY5Ijxl3mQNDgTDoSYCErKK80y9z+z+0cJes=
X-Gm-Gg: ASbGncs8s6ro/YRTVzrZV5FyoiVbJUf26octzQomdQeqF4/stYDkEUbkQYE0VJCLzNc
	mz24/xc8E0t/U0zCAZzyWi3lHHKK5CGDZr9M8sPeH/1aEZoE4vwCPGIGPkV7AhVytneAaYLU77b
	kWpZDx73E+ZS18E/j6bQjPxtjJ+XIu5MCnwL53MARZus9MI1/eZCb90xK7eIIKZu/q/OHGd8Ubd
	8PqVNn/EsR0kZk3NOoEbTPgoh8ktA8Exop8glU7CdlsS14hhSytDG7tuMMz3jN4EwGz6v/d1aNo
	SG4XI20g8CxEjYEpAn2yA1nUm/Zy78XBTK4eY9GMAJMQOUEKatr8Wp88Tk6/7CFlnXIbRS2IB4y
	tfNc5RC5CI+KankQm2ythzJl3Qovr2G0adtnGt6W8ahFcpmgEa3rF
X-Received: by 2002:a05:620a:4413:b0:7e3:3417:8c80 with SMTP id af79cd13be357-7e3435eb5c8mr1843006685a.31.1752921155721;
        Sat, 19 Jul 2025 03:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPks1HjgTCMsnblTK4TjsiAlwy/vjObFV82l5OdaaO+bcfhs7Bu3VSA6ZEe50HuSOATIjNgw==
X-Received: by 2002:a05:620a:4413:b0:7e3:3417:8c80 with SMTP id af79cd13be357-7e3435eb5c8mr1843003785a.31.1752921155315;
        Sat, 19 Jul 2025 03:32:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c226sm658791e87.85.2025.07.19.03.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 03:32:34 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:32:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: dianders@chromium.org, tejasvipin76@gmail.com,
        diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
Message-ID: <arbdzp3r726vvfwds65cw7thcvxu2hpnwbjwdb4u2rgm4irir5@w25kvujy36kf>
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719082639.307545-2-me@brighamcampbell.com>
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687b744c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=wukD7SXyAAAA:8 a=EUspDBNiAAAA:8 a=n_CNi66bQm-mhO-RI4YA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=n7THaJik3DRP1sDdJiGm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwNSBTYWx0ZWRfXx7kpJEApx/mi
 quFRMP0O6qfGESsyws9/PG2+nFWMIxsxMs8VZiADsOcaN4K4V/w8Yt/+E/7fudGWyLuAEevNNyM
 GqT8r6H5jjRjSYcx0jg1s2+WvJjIUxbO1yHT+hIyPHk85GPZTr5VUlKZ1i+7uA+t+8CeV2XWPst
 7Rmb6HvUxgX1FX8Oo0HOGSReTCd7qBhxdpFcy7aUW4o6ZLpxPdbAaHfOUH2kC15S6eXFiaA4QTY
 an8wp/SZEhgfLYKYDinvPaDB46l/J8yVmg1XlE+fV+189w1Rh/1i/5bp2nqVARZDZH716nNud4a
 g2yvAeuFnKqXJ/XBojAP76LKtRXkKOZrUh8JdUoOEoWrUkurSdwSVfhQh53TAi+42OhhoS2/LbU
 0ew9sXOlww78k1wKJ8imzF5AQOjJ14ugQjYOjAe4vbigBYeW2wGxFy9FlMC9P9EKG/pc9CHY
X-Proofpoint-GUID: 4pVfORrSinVlULNywcywTGIrxvabZRv5
X-Proofpoint-ORIG-GUID: 4pVfORrSinVlULNywcywTGIrxvabZRv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=730
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190105

On Sat, Jul 19, 2025 at 02:26:35AM -0600, Brigham Campbell wrote:
> Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
> mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
> by two parallel serial interfaces. This allows for the reduction of code
> duplication in drivers for these panels.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> 
> mipi_dsi_dual_dcs_write_seq_multi goes unused by jdi-lpm102a188a. It's
> included in this patch for completeness and in anticipation of its use
> in other drivers in the future.
> 
>  drivers/gpu/drm/drm_mipi_dsi.c | 48 ++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 89 ++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
