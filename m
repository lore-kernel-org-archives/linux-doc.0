Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9D277017
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732470; cv=none; b=lV62zEmGgiO6TSao6Ea9NXOy9GY1WP+kAw1vVK5m7vBpIq28SuBHbMOFOUvMkMCnxXjZF/dsuOnHEmjO0ZwToKuUieIgUGMf4/5dJeuVvn0BLUeypw5a+TNTz8xD7bk9O4C+ZB1Nzag7IrEQho183X9oWrUCgDxR8lr645XsUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732470; c=relaxed/simple;
	bh=nbJBIm15Ji1XwKk/v/G/rXONVRy1EyJBStzCCuIeyac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3IYD3h3vUQFVmJIV31OocUYC45HmZi/JLfUXCnVVNyasCPQsjxR+XKPk2F0ZhE3w7SIzhb9YYeTQC1NedUd9D33YkhvpGvCZSras+lWER4fBd2MsIZf3FWztWQ/iPteKC8qZ1Ti2TgjZR69zHOnvD9AqMOaRUTNWqHVos5ha1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bELdswTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBnEP0bE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bELdswTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBnEP0bE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THF7iJ3900264
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iRA2nAXRxz5YrufMBs5S030c
	Uo0x/I8unim1ur6B/e8=; b=bELdswTaQxcWnLmEgsaDIWLX1MYVNkJcANsO34FF
	DecrEX9YtKlVy63Q9m1pe/O/RRTXs1u25UNsVS4iKTj/MOzrkL9ffrc1VqyLm9Pf
	QOXiA8bud6NKuQmX1j53bbmYi4JJaGJIZHsWvp1ev3cEGBpBDVFX36SAK1jgftep
	n/VBE/vQX33x82LdgBJe9fc1UVcqivvcnyaMPGNZZi5p9AbFls+J4spcr4b9+k4M
	8fzWYHL4Y67BWWfDBJWmbVL4u6YO5vdJ8A4tCl669ywfGALaJ28JF1ccIWcZbgYO
	zvc/hqBndqBgGxW6dgFUkdi7GF98JZ9/kJ3RdRQAxp5Wlw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05seahga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:21:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b795cff830so8869549eec.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 16:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732468; x=1770337268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRA2nAXRxz5YrufMBs5S030cUo0x/I8unim1ur6B/e8=;
        b=iBnEP0bEyja2nF2rOAr/+ktobXHn2gXsa6jeds+ZONC7OshQyo3I71t8y3w6+OWLnm
         ddDueOOopWky+pfVzCGgL9i0pGIR5fTJsU1T3o9yCJD6qdZcI4iMWJKdGOYvyS/RkDUR
         qgfTk+SxWgUDPfWCZop8so+jTNhve0EES+V3d1/l+tnq/cLQjf6Iim1uC7qEr/mLgBFg
         mlMpY+IjqAIqXLJWA+zY212Zrjl6CmPVCUi89HKw3T/ChXphKS2dXl+wmewsY/4UqzCD
         paKkmkczQP02/OxFUN+kjqpA8S/d2UGqVWzvHDp5GbySrUQDbSN/ECwCLFZehC2UOpr7
         PeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732468; x=1770337268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRA2nAXRxz5YrufMBs5S030cUo0x/I8unim1ur6B/e8=;
        b=XD+/BJFKg75wQhHudwe36Nd1dBbujwoZwcU2um13Hc9C5JGEWQrhjfRvvHum3i5gC8
         L2+sMzWMfo9CPgjUksRy6pjRSR4fc0TSjWj19hIdOGtoIcrzslKputMrWFiJIi1s/IoY
         dWyyEVjx5fm0Y45APE0nIV5TEKNUTYvrxpdHw7VZSinLN6kDE7iVNbhO2R1VAOKZsI2p
         zpT2vqYARlSUm6GOpdOwOtjP3WHtMbzc6YU9LPMnzt2HLmOtl/oCHxe0ePJ1HsEBt245
         gI72rJhWzlHd523UcTUE0XqqqhgHr7h/Qjlr5Nq1tZb70nFAoegiu996PO6oQDPpoIGz
         NFxw==
X-Forwarded-Encrypted: i=1; AJvYcCUos06lhe8MAyEpYN2z9pjufGo3QrRnlquXSN5zXdAofB9MYMn4OREv/HkKiQp77fXrVsv+Q0H5f0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbK+GAENmin6MWTGEHdm26l9HtuL7XnxDLJ2etf6zS7wTDrCj
	iG1djirxay3hwK3devSIl8+jDnpL6YOwTqC0u5zCT+nuziIwviajgj/LX+OXmHxZ8GBRqYrYWRz
	c03Xzr6wbflnu9QaZgrBeF3KwjQ6T+HGDRizTsfUkCY29CRMdkdMm6a+GiPcVl5k=
X-Gm-Gg: AZuq6aIjCu4ztlC4m878tbFw0ieWVZUwVj3/mvDBPxRtTSEfbmehrHTbX4KODVmgOvR
	uOsFXuN8w8ht4pUYr+dvmO349M9h32AvLdvcHwIbBB4bCmUmZY14dAh5kvod9H2hWjo+MENNKKY
	7QAiVtfBvPpfZiR63QD1jSw8tpPjumj5EPMdBvJ30pmRRrCLdK1tjM6WGEZv0L4NOYTAgIOTe/X
	7v1P2hnJY2dU2m1h/IvXDxaSdWt5vZtnz8yc9uE+BfcIQSeMGaQmAw9OIiV2UfJJwtVevSBvQkd
	ggMPkOcTD4AQnNmh/PC1vHiOZ7cbNKerbqzMbALh6UMW6f+xbZpiisuPrW/eHH6l34Ib/AvEXY+
	xrg42ZpvuZEuzpcBbf0FTSt1lLy7A8zudpuJ+DjL81jnDgAyQqLZ+xTAeLx8rdAU=
X-Received: by 2002:a05:7300:f193:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b7c89507ddmr453398eec.40.1769732467877;
        Thu, 29 Jan 2026 16:21:07 -0800 (PST)
X-Received: by 2002:a05:7300:f193:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b7c89507ddmr453378eec.40.1769732467302;
        Thu, 29 Jan 2026 16:21:07 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8ac0sm9018117eec.35.2026.01.29.16.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:21:06 -0800 (PST)
Date: Thu, 29 Jan 2026 16:21:05 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] rpmsg: core: Fix incorrect return value documentation
Message-ID: <aXv5caIoE7DXMlP+@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _MRpHnRHRHoU_la2Mspoq5otwQXOPLrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfXzt0bLFyJwk3w
 7I417F6AOn/hEhUVhyx+f/lh+Ke1I4gdHE+ugp4mx4dT4bjNhcsw/jMQTZhy43kHeQ0nOp9l2XM
 koTHAUatcJ4yKTGnYyfF3MPC9u54Kd3AtMERZz/gs1ikvRSI9eUZkbmQu2OfQG1GRvpcWGYIQ6w
 94IF53/CObtFOt1ooQTsP9eOVsrPQ4pKbv5KNB9DfMnn3hGK87hohhEqf7eK1bJEMo8t/cS0ssr
 gl/mxBSsoj6PnDWY1QumtXKzRh8uyxidgVFH4aVXipa6Cku3CtaSZnUBkmwu1glOc7+ShVYwRDE
 65xP8D010mkL6p3AcH0PzM5pz9LITUaU1+RuoRbqfMLZkrZJy4H8NnILPyDEM/gnbBkOcqVc+El
 Sqg5nP3cGEJcEuy6Gl75YDEPfd0i+cayAEYF9NMOUJbTv9QXS1ZqkCC9aHmb3gW8lj0E9gUNTRy
 BASjV+rk51q3HJs/poQ==
X-Authority-Analysis: v=2.4 cv=RIu+3oi+ c=1 sm=1 tr=0 ts=697bf974 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QRj5kXCQZoiapl6m6psA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _MRpHnRHRHoU_la2Mspoq5otwQXOPLrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300000

On Wed, Dec 17, 2025 at 02:51:09PM +0800, Zhongqiu Han wrote:
> The unregister_rpmsg_driver() function has a void return type but the
> documentation incorrectly described a return value. Remove the incorrect
> return value documentation to match the actual function signature.
> 
> Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  Documentation/staging/rpmsg.rst | 1 -
>  drivers/rpmsg/rpmsg_core.c      | 2 --
>  2 files changed, 3 deletions(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>

