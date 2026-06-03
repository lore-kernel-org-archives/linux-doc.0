Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAB82BE7DB
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493204; cv=none; b=azUuZpF+m204n7cMrPBD5DueDMyR7IFdbSfFJ481MGhAdyTMkoN8SIcM/NepAIR8JcHbV01YP+gBLV7/y1bYINXf56rWVkyVMgjJIYVuMmd5r+Uv2yBSsyFEQYo0ywmLqmBAtk0kpaG/kVpRu2qfBmm4zunf4+0F3wrOKyQJYZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493204; c=relaxed/simple;
	bh=T/tEolCSMDWiK1ElWJnUQfM0lMP/lYha3xE84ovma+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udBipMhfrqQ8dXrSIP4obdJPUsBz2DAVUEfuB/Kn+qvN72TSsVnogVNKjMq1KJ5HTNZJaw15rt024ZM2WLuk8SsyJO3QMH72Kyf1G+tKtj4nv9OyLwid5YcOGrzTDZkdTQ1+KGACt0N1iFIcSLkHkJQojYV9FbMiMEgGG+Gamx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwfdrQC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceWVHw2K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwfdrQC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceWVHw2K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653AB4ig3552292
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 13:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FBhsg7FwzuMrC2Y5faSGRrZu
	R8DY6M4ytXCJ9V4SUKo=; b=gwfdrQC8QGxcPEM1JdkngF2f7SVaf4tWQ4Ar3/Z2
	6Ayhs4s0EPnkY365ytZbRhJr5pZ2Ia0SCCTCAjv8Dbl8NTmB4HeesLWg5ze+/sWx
	TbJcRPE3fn3biZkvNM1w3nSUGg1ZJKlJVM1FYegh6rsP/G/2hwrATp873oFuKgfj
	RvZupct1n2aWYUOfGIbS+nTL/f9ub4gaaiJm67n2bX/LW77XFx5QZNmy1ZIFRr71
	uH5X6GoBc3xC/fiJxNk3Hi9qxlRKkJtAjnpLvT/a0udBzmyrHG9DmQLaQSP/yiJF
	3et4YpPyFT+THy+MgCOz4wiuWpJyvsI6UXbRlDQhUCOuDQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mrpvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:26:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a7cbf971fcso202964e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780493202; x=1781098002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBhsg7FwzuMrC2Y5faSGRrZuR8DY6M4ytXCJ9V4SUKo=;
        b=ceWVHw2KQGLyex9UXmZ5/JNZ2bii61ny0GF+QyC1BQIPtMcJlAGHREnqXaYyKMLXnF
         +MtW8r/pScL7qmLWLiZvHTYDtHE+JkU/ANApeUmfnNlLTMuCWJ5V46+F2H4WV7ZVKvII
         FmRTZTPVzOH+TrtMuBjDib8LczauN3JW9k/xOCXY4DjE9tKMHKX5+S8NyMBc8Nl1Eu3g
         INiN1a7gskKErRJooKnCTqZFoJGIKjfX/D9tvVxU4De43FtY4eCd9qvqc+Gjzc00Ox/i
         D6b5pOYiojMgxMZ4r4Lpl5zlAyXHnPLnEmcrppPeLMk+erGa2w6pG0DWn2nG51DaOunA
         DGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780493202; x=1781098002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBhsg7FwzuMrC2Y5faSGRrZuR8DY6M4ytXCJ9V4SUKo=;
        b=NKzFidCk/cvv3N5a4U7ruyDqGyz3zvXRvbNbNA1UYXg2gNBFOVilzmCR0kL8SCe+ND
         KTtASyYWFsWYQ4IhtQr/pmYnCxXi/jPnbYoAbvlA18DOG6EWE1A/KuaHNDO+Pbrge1GI
         OJ3PSq5H+tYAKTDyZ6/R/zyis8s+suaafL7VG94xLb1aawMAbTV9lcqgGmEZ8OJH0eOt
         Eja6ZoKeGC/QplLZNfBSL6asOelBsdTLqu771U4e/esvTrVxnO6vS2shJXwHr46uWtuh
         Sr4q1DPsSTuj2H+szlQqV++M+ETb5gat4Ad9cEeZAaRs/ju1zazodz3Qj1rBdijZkuRl
         xUbw==
X-Forwarded-Encrypted: i=1; AFNElJ8lJKVueF5nTFogDJ5THFqRfjM1cIlmkQxZf1hOQaitpvW/SmjO19BByAzWb++qhnOU6OOfjWf1tK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoTNQKNm1o3f0tQXpit3pxR2MKqEqvv98bAVLIxWm6wJmeU/sD
	2Qer0lgFcI02orTc2OI+siQLEUKsitru8wZ+AKqcVyvd2lwPJcXpXl5APXbuHyZOH9I79g8yWPT
	JOCmSbEOPob6J61BtdG2GppY+shmIhf/Hg+8HOtH+zbKJd92VDYytNYOq8e83i/Q=
X-Gm-Gg: Acq92OGgXCSqlQo+jmUPrYQdCc4FDbsQfm1H8r4nyG2hYysZzR/086diT4/7u1Bgb6L
	Z+GFYf21HjYs7OmkKzKt7ugrpd4ZBmaeor2igAFYQRr5M9xyRBSdrFjue8DxyFG9Q6Cn2qf4kc0
	97M6U49RwlutqqufKcTn3+Y4mA1J1RV7Qsgcq1Ep87rxuoOvzjDN8KfKofs8mDhawWgSIGEXD/X
	tZYxOIBy3Zcasgkb3BZzQCiVP2DOwxaeCrQTGF++bTuRUGR2b1/InW3wG39bZ/8AV/lRLq4EQdD
	8kFP8EKOVCqdiLNoXPScRTOfNW3qQF9JLORfYUrM60mfWYQ+lzmR3Ny8Afe584q4hDH00JMbk2N
	1miizo5bkPwyQpd9x0g2E+k+Sl9vMl9btY3Nf9+9Rcci5QdgKPTFT03teg64gyKkFDjFq1x7QmF
	pxoWPhMkXQYctqKzBAocMaoQai6kEllhn9LxlmnK7SV6jiMg==
X-Received: by 2002:a05:6122:1da9:b0:5a4:ac74:f5ba with SMTP id 71dfb90a1353d-5a6e86256ecmr1670753e0c.11.1780493201640;
        Wed, 03 Jun 2026 06:26:41 -0700 (PDT)
X-Received: by 2002:a05:6122:1da9:b0:5a4:ac74:f5ba with SMTP id 71dfb90a1353d-5a6e86256ecmr1670719e0c.11.1780493201199;
        Wed, 03 Jun 2026 06:26:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b04esm665779e87.40.2026.06.03.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:26:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:26:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 06/15] accel/qda: Create compute context bank devices on
 QDA compute bus
Message-ID: <4ok65ttxij2yn4qyvbizgobfxsfikqmsaynz5c6lfbp2d3o2kt@iuqdma64k4w5>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-6-b2d984c297f8@oss.qualcomm.com>
 <f527lflctqyqjrotd2qerlx4oikg6st6u2seqsjw6u5krkqrab@uhw33gnkp5c7>
 <37ae68ba-6639-4bd2-9483-5aa0156fd772@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ae68ba-6639-4bd2-9483-5aa0156fd772@oss.qualcomm.com>
X-Proofpoint-GUID: OsZDkObXafMRbqqFHDGG1tReyZZwTd0d
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a202b92 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=niLhY7D_osK6bJDgftoA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyOSBTYWx0ZWRfXyTFca+oiTdYl
 SBIG1xqVG3nxNq8zJpBVdP65WtKsb66Rx3GvKmjAxaJjzRY7nYyQAgGj53jjGC+9rC6d2gcOaTn
 MkT651tKSQTsuc2nGi+RL1ffkHdl0HtiobNQaBFjE+tyqm6RPhN0mBeaBMVtA278LzlMQmRwKO6
 xHqETuj0fu+3QgN8z/MAAYdqaudgdqMAL5BPvBJSJNrA62dBH0x6In4i/r8OS7X77dIWhZoVzgZ
 YSyLIlqhULu4bbsFggXHXqAwoGJMsQv1F6OQBzoXwUGLDgrzG2IG0eVBrZXQUCRMFcGcSX91zP/
 KRzqB/YM6+qSjmL5I4ASc388xSIUD9OOW/BV7qGNL5kRQou38FMR24kK8Uy5TCg7fW8cHAk8758
 46w0+C/y+1q8hNFxkyeAO5xegT9+Rn9DBHK270R2XyGstE0oft4gjrCVf4lG8uua/gKKjbcBMGn
 40ekPo3v1OaSc/qxKIQ==
X-Proofpoint-ORIG-GUID: OsZDkObXafMRbqqFHDGG1tReyZZwTd0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030129

On Wed, Jun 03, 2026 at 11:09:31AM +0530, Ekansh Gupta wrote:
> On 20-05-2026 19:53, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 11:45:56AM +0530, Ekansh Gupta via B4 Relay wrote:
> >> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>
> >> Introduce the CB (compute context bank) device management layer for the
> >> QDA driver. Each DSP domain node in the device tree may contain child
> >> nodes with compatible "qcom,fastrpc-compute-cb", each representing one
> >> IOMMU context bank. The driver enumerates those child nodes during
> >> RPMsg probe and creates a corresponding device on the qda-compute-cb
> >> bus for each one.
> >>
> >> The CB devices are created via create_qda_cb_device(), which registers
> >> them on the qda-compute-cb bus so that the IOMMU subsystem assigns each
> >> device its own IOMMU domain, enabling per-session address space
> >> isolation for DSP buffer mapping.
> >>
> >> The new qda_cb.c file provides two functions:
> >>
> >>   qda_create_cb_device()
> >>     Reads the "reg" property from the DT child node to obtain the
> >>     stream ID, constructs a unique device name of the form
> >>     "qda-cb-<dsp>-<sid>", and registers the device on the compute bus.
> >>     A qda_cb_dev entry is allocated and appended to qdev->cb_devs so
> >>     that the list can be walked during teardown.
> >>
> >>   qda_destroy_cb_device()
> >>     Removes the device from its IOMMU group before calling
> >>     device_unregister(), ensuring the IOMMU domain is released cleanly.
> >>
> >> CB devices are populated before the DRM device is registered and
> >> destroyed before it is unplugged, so no DRM operation can race with
> >> CB teardown. On probe failure after population, qda_cb_unpopulate()
> >> is called to clean up any CBs that were successfully created before
> >> the error.
> >>
> >> Assisted-by: Claude:claude-4-6-sonnet
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/accel/qda/Makefile    |  1 +
> >>  drivers/accel/qda/qda_cb.c    | 99 +++++++++++++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_cb.h    | 32 ++++++++++++++
> >>  drivers/accel/qda/qda_drv.c   |  1 +
> >>  drivers/accel/qda/qda_drv.h   |  3 ++
> >>  drivers/accel/qda/qda_rpmsg.c | 12 +++++-
> >>  6 files changed, 147 insertions(+), 1 deletion(-)
> >> @@ -59,9 +61,17 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
> >>  	}
> >>  	qdev->dsp_name = label;
> >>  
> >> +	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
> >> +	if (ret) {
> >> +		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >>  	ret = qda_register_device(qdev);
> >> -	if (ret)
> >> +	if (ret) {
> >> +		qda_cb_unpopulate(qdev);
> >>  		return ret;
> > 
> > Unwinding registration?
> did I miss something here? The intention to free up the CB devices in
> case the device registration fails.>

Don't you need to unwind anything else?

> >> +	}
> >>  
> >>  	drm_info(&qdev->drm_dev, "QDA RPMsg probe complete for %s\n", qdev->dsp_name);
> >>  	return 0;
> >>
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 

-- 
With best wishes
Dmitry
