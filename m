Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B63E19D082
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753211145; cv=none; b=tDvgTdQ5awIfLHVq5Ojh6NpjOPGu156ciTE6zE00mn1zzoHLbp22O3SDKuYAeKyLLNwBytjH/xuzRc7QW6lBWUr32L2cwd+xz8jvsWh5LbekEXypzS1ND+Uto9qzkvXwloaszJAl7BWa1xRsbZJeihDg4NW0u4PUUGIFNBxyOSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753211145; c=relaxed/simple;
	bh=xZlxAmn3kRUUxhK5EyFi4gKntDMk5ctn9fLRRBn2z/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3BNTrmE19CNJRNk+OLAP1EWIFZqMa5BuLEd/kf4B3xGUeR702E6Rr0SDpeC/NFb2KnuMsABvbvVlnqFIDZKD8wsdhLv3th1YGCmkTh9AUt9DJCta/kX8FcZy+p2Jw5zz8emZCAvIdsewcUgenU4hlWaGRQMH5PC4qWvjv+H80w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUxoL7Yr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUxoL7Yr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ME38Yo009227
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 19:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P2+6l4qAfd3G8OT0Vp0C7LdE
	m1O9SDlPysbdkSzFPqg=; b=MUxoL7Yr83E+66mLMhAAylNYCqeVBssfMOlrmT4S
	aAbjRbfxz0+QE7G2I3hT8WVzhyN9cIyCDNOlDGs8qUjrVHsHNB5+SznDuCxI/NmL
	D8YY8gq4AZtUpYzHJTaGtePF+jv6xZ5d1syLl53KWwgNcji7lUHHw0idozwBbuOX
	I2SoEvbhgHHIBUnySrmJzzSWEpJPfGR4pgOFRK+PXzvnsfBHHEt01U9VozkdoRe3
	uF6uGBnVid5pHvfGaUDSgZ3NBB8N801sBD5eyPE67oHK3FL230RT//0e1GJt0tAs
	GYh4r5vWb5o+UmzGzOC6eRLhVpeXtmYOph5AAFLw4kvXuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w0xv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 19:05:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e36e20d700so29097585a.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 12:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753211142; x=1753815942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2+6l4qAfd3G8OT0Vp0C7LdEm1O9SDlPysbdkSzFPqg=;
        b=FnR80WNdl5bEVQsQaEJ7penSV4tpHjO1aX5JmdZmFdt+fLUVHLbibhYBblXA//cesC
         /uawpuO86D8XnZkXMZV2JcBIv+ZpW/IGqITMDXNbXWW+NeycfZ9uGclAt2XE84qCGVAH
         7kmxXXtcPFyyoD3ufJqrnRCZg1O1ZU1rE2PUROzkDfpVorTigU+h+2KNPkpPBMbMAOlI
         zHUC9U4KdBfslR/Dk7Tz0UtQ10Jk3OxPUfHOma1nzYoqifV7REM0wHachia1RiL/8dqg
         CtvFMntoQfumdB3pPBbmfviqJDBqqbZm7pe2dXFXOKdDo6iBDG2dKxxlJvnW9rEIlJle
         8yuA==
X-Forwarded-Encrypted: i=1; AJvYcCXoaM8QP5CEP3QZBiAx25z4ebGH9S30oxIf5tuIcujVNZYW5kWKid1YmWOzc5MZgUQR//kJmoOwqgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+H9W3cMLB2u00ejWjzqKyGVcxhB1DRYOf1uRouWU8dYJWXdc
	QlR3sIpE1S+U4dHO7PmERl6skb72ScJ/LeLH3V6c39ZM418C70k82vEGClPOmeJ0JNcDYklEbXQ
	34GfB0HiafLhMGOisDnBVLmdsPou45J+mjcJAaFLqZs/CrqL1GEgs2XWSE/Cq3ZE=
X-Gm-Gg: ASbGncsxZTobnXQ6Xavvcbu5rcvrImwz1sbJqBKWrw7GL3EhH6IZ+2j+iKtTfd6d0nn
	s9DCLuUxYppmDU6n4EHGWLB4tT2kl0dnq1NmyUFU6w0gIM5bUo0C486J4G1vZQKBgFkU/STb1db
	AbFoRkpMutyavuaNKqyb0wfoTY4RCaRKkJcKPOZt2znqQVP/1wz1ZTQlFIrh5y1FWSmfciPstgf
	U6aA43/boITtGs6l5ZubYhvRg1mbV39v9U6V5OQVEBGBRVZoTTOPvtFaGL7w3x4cQM5s1iiu5x7
	KVS4PLP8DNyg5sPbME83B8aVstlQzVzGArqxCeflyhv0IebC81xgUf45SOYxgrRpZuVna81Fath
	/CF+Rbdid7sQZuaTg89IZltQn5xixwsRcOoi+YNTw4y2E21LbgiHl
X-Received: by 2002:a05:620a:7004:b0:7e1:aeab:41b6 with SMTP id af79cd13be357-7e62123d2admr639044685a.18.1753211141796;
        Tue, 22 Jul 2025 12:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnWw82SLv09ir9ZtrixO/tE940fX1DelTTNbNTu76eCwjlOF98H3Zx1i+G/fDCf6mx0HVYLg==
X-Received: by 2002:a05:620a:7004:b0:7e1:aeab:41b6 with SMTP id af79cd13be357-7e62123d2admr639040285a.18.1753211141325;
        Tue, 22 Jul 2025 12:05:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aba0f7sm2051200e87.83.2025.07.22.12.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 12:05:40 -0700 (PDT)
Date: Tue, 22 Jul 2025 22:05:38 +0300
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
Subject: Re: [PATCH v6 3/4] drm: Remove unused MIPI write seq and chatty
 functions
Message-ID: <46h32rtuyamdvg36wegmi5fonfg6o6gau2ek377mhumscd4k57@3mw47znxnj7p>
References: <20250722015313.561966-1-me@brighamcampbell.com>
 <20250722015313.561966-4-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722015313.561966-4-me@brighamcampbell.com>
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fe107 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=cm27Pg_UAAAA:8 a=wukD7SXyAAAA:8 a=EUspDBNiAAAA:8
 a=BQFrTPDZmi-2fyfDvBEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=n7THaJik3DRP1sDdJiGm:22
X-Proofpoint-GUID: NeagbkEE6qE6HerxfJTVcZYyYbwyDF7C
X-Proofpoint-ORIG-GUID: NeagbkEE6qE6HerxfJTVcZYyYbwyDF7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE2MyBTYWx0ZWRfX0zbcN4UjLymk
 Gu20LnE5+O169+7DrH0OgPsqk3PMU34abi30diAMYWig5qgpdFenrfhQ5KW2dflyj6DmfvOhXSj
 gwJFp9kh4tfWtio5/6ZqcFJAQMigMpMu/Q2+QTmgikM9PJ7Fy2D5YhJpkpOSLY1S0YlCKRBuzFk
 46jwWnLG9hY34ILCV9O5pMlPzhKggXUHwDM5F4NFvUtFna7/GM30D8lvzCrKiOi8lXiKPH59ci5
 0yPJpWCBqh1VU6FOAmpwSWLEXj1V+ieHpJWzFzitFLfTp7L4l6mGY853QYZy+vHT8VRK/Q598KB
 3jpjcDdII7KYXV8x5TYLGJv33PyGVxlKa5FMCQy9rXB8hGiiligqTQ7gZ+OXB+Gk3QHWm1z9RCl
 3Tk622MSCzjzmwvFgRITunGYmAtZ1ZP1TuZu0YO8KwRHQp1K5KTChoNH0aol37CirlSlNiHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=661 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220163

On Mon, Jul 21, 2025 at 07:53:10PM -0600, Brigham Campbell wrote:
> Remove the deprecated mipi_dsi_generic_write_seq() and
> mipi_dsi_generic_write_chatty() functions now that they are no longer
> used.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
>  include/drm/drm_mipi_dsi.h     | 23 -----------------------
>  2 files changed, 3 insertions(+), 54 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
