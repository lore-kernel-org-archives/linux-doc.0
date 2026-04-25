Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6939F13FEE
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777115029; cv=none; b=WfP9DLoB+TV+aTj7VeolLjqvNjz2pBCOW+EMw4cQuTWF4arGNylcpkC2iypIpYLJBBqdXxlE2eXGVseG/aHSAqh1oJHG2D5y9IvPh10YD9Mn/gmvX8LTwnwyDGqpiH5xtqjhDsLrG7H/O1bmi/NQjupngQxEfrfM12ekRjgwj04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777115029; c=relaxed/simple;
	bh=Q5t/gzpwv0VmY3V88U6TNRGg/I5GxekE524aldqFzKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxinSYaC4oGrfHS6T3K8NnLYupCh1hOS/wlkgQEb/0udahaKhG2SSja5Y29fCRq7ucxVNgllm7kRTSMhV8AP4KUk2lAjh/uz/ZwI0slAsU+wbWstywMX/QfF1iOTLsiuVBuqVT7WiENURa5odjYAKVs0OCSfB/GaQZhYTfYodhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buxnuiWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flok2QK0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buxnuiWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flok2QK0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4Bgt72656684
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NGyE7KsIgE1iCIP7BFttRF0t
	KByHvA43U+zOtPNKwNs=; b=buxnuiWLQj2/Up9fdROOm92md/+ciO6Vm5XkOt00
	bBiFLPIEta5evStIw1TWwS3cQox2DW8qE1rvDaOJ3G5rbEO+CPyV9uW/NqCy3rq2
	NxW6VyEUFmaZntlnlgL3G2iCEkfn8ynKqlQrPc4ut8FZQy7JPr+mckAf/BtohmQK
	G2MUjUwP5Ob1v2vgrr0AdKirLo0DrUu+SZsN/DI0JU7GX7k+FCrTY4JilBMmT4eo
	Nq/Wwav4JPuYvldw418/mpwjLsTyVhP3HP9LnjuLnD4kLtAyGyCb0x+PYbZkpakR
	2jPJXqZnLBhAWmJiGZ9wcieiQKA/SNG/XbjdMeRT6MtCHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdgpfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:03:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so232529251cf.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777115026; x=1777719826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGyE7KsIgE1iCIP7BFttRF0tKByHvA43U+zOtPNKwNs=;
        b=flok2QK0c4dEJA6TzV9JkA7JVLkGxUIJXvkZ76+8CwXGYczZ4yVkskumbc7b3kHlHx
         /gHT3ZJGfwzh7FxDdICNC1QZHhO+LZ4wXwhrM5Siy6RiYqDO1nWDBRwi/V8JC1rKmxWT
         rlbN7AWuD0qJ0G/n9Eo/9qZK93QdKMELftYOuKQ+7FigLJj9FNIByR6TcquuYQwpuLU/
         6WVHEDfzFn1HKauvWk9/Xv2ACCaETUFMDoDJ+EtdrFLvzjfl1rb4ajfmOrxwhVrBwdrE
         7u9op7ZcotAaCP9wZUY1jk6SQzW+opwO9v5IB2S2wzxLMBem8VwZVqnBaZYczZqUJGB+
         m/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777115026; x=1777719826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGyE7KsIgE1iCIP7BFttRF0tKByHvA43U+zOtPNKwNs=;
        b=hsYhFj9Cwgv6tJ4oWFETRFXM9lZvKokvWy3y8oeVlm4JPOBuOIFNcJdWao5AxdEm44
         DsO+1YQ/vvcmnwRjlk80PjA/ZzC5imvBicRuRn0B1Bsk8xHAp3ugPowyrEFuP+jhwtds
         G+OK07Y6VccS4LAtzPMGwVbIVWaldrLk/uVjCBFKijfnkZyLK2D8ca9wi9m4M2ox4T6B
         UsPi+gwHmlrih+d+vacUq8UpEfNVC1Y3VYXgUvputRluhVWVAaYzji8t3e7pa6TtnkJZ
         WPDQMjkUHXqlcBijUcHHZewNiP7OOSDp/itSh9z4NoCjqZ3lr72XoNMstFnZlz07xIky
         Sv5A==
X-Forwarded-Encrypted: i=1; AFNElJ+jRT1p7bOZmZpTij4RJNJ4CJnRu+ZELh8BcTBApdzHN7PfKV6Ti7cdUBd0x7sVwnan1oMV+YjqMgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOtUW54cdHMszyPrscawDYUiBXh+ZKMCSvymfHSP6eYb2q4lF
	cqrjomTR9g6ONxl3GCEzAZyHN2UsmhOg/1shTwy9KI+J4uc9oTv3FGW1Asn4emInlGqOaFi8ACc
	H/mo/ZOqcz/u9O9Mj1LTWkbd6E2ew0NaUrRAVMkyOJPEJH+aAGy7/NzkZQ1X4TRo=
X-Gm-Gg: AeBDievKEuX+ntIlePQoc+rVMxonZdQ06kJrXyoyHY7exC1guV3JX9WJr5/D0vRlIXn
	L+DRS+HimSKGZ5HdkDnhN5RrgbGhmqIR+/QF7ZBcmyv6vYVnNCfHorOpULOCRJwpo1YabHhUSZw
	JgIdVDEn/ZmnX7KmxxbGVyvccbeAriqyrCrmVQgXcsSQIMIv0QT/ATWFR3+Sd2+bB9z0bgceoTl
	oEpMKzrJVA/JHQwMYeMBC/INyR1+FS+eUOh/G32c11MFetZoi+dXHe+Wr2DApBC3ZEYaO0eAftt
	d7u5LxHyzMgINokogIIjJB4Gb9Bo/VF+r/Xn55cpKvuW1CQALiU18Da0MOs+lz2swwVVnRQ2hPq
	/RM1MiYW1BR24gkJS50h5F1vP1vw1hgeXo6xRjqkjRWibmOcoCaPzToZxQLY+yXYfcJTCdQ+8IQ
	ReJ6LcKz2S8jtpx6KdHFkJlvmjSNXcNu2YQntS89LE1i91BA==
X-Received: by 2002:ac8:5f4d:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-50f135e1259mr360464631cf.58.1777115026553;
        Sat, 25 Apr 2026 04:03:46 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-50f135e1259mr360464161cf.58.1777115026099;
        Sat, 25 Apr 2026 04:03:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a6335ce587sm2078590e87.70.2026.04.25.04.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:03:45 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:03:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 06/28] drm/bridge: Act on the DRM color format
 property
Message-ID: <e3lpzsodpfemx62ye2rshiq7xnexiihzwxtj5ouqddxip5xnxo@q75ujeicb5p5>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-6-449a419ccbd4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-6-449a419ccbd4@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMCBTYWx0ZWRfXxh+6smWJNg2g
 A/3KfTCOVZnyeZi8A8Glvoi92jMYvuwcEPUpIErkOjGm+hE6ok/O7cqez8KSvczKHouJgEJAEdI
 dw06tFM0zm4zsd+KfUbOO2ABnuV2964P9dNGopduhTqtlgljTlQxbAG4VNpffGErzJBMbb5QO+N
 L8ujh23wq0i4nvdPttn5/4U/80LQunjtnOmutF1Szvi34B/5DR1wvyzE4jfFa9r8xJK9MP0i82a
 flyDxtzbnDI7HLQ7dwDWo0yeDZxHuoyAwoxNc6Dk6Pefw85xHO29ItUmrDvRtT7ZBXbj8qyS1BW
 cxlF3gRfXMzYZ+vnJ/Hjpu4GdNZp+D9Wm4jU7dc+V8fC/84nYAB0PREgA1+XrCN+wOTS6IhxGnn
 mEi+B2XeMbVPPsGe4OW0IErWhS9cF/tdKRJyLIlZW243U3sbcLb/nseOMwlXbbK/0lVnOFK6v2H
 DzpzWZbqNF8MCsb9DHA==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69ec9f93 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=zO9H7474j3G4b47APuEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 0y0V4w0dIVW93Y58NF9E4Kmm-6cOBUAq
X-Proofpoint-GUID: 0y0V4w0dIVW93Y58NF9E4Kmm-6cOBUAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250110

On Thu, Apr 23, 2026 at 09:03:29PM +0200, Nicolas Frattaroli wrote:
> The new DRM color format property allows userspace to request a specific
> color format on a connector. In turn, this fills the connector state's
> color_format member to switch color formats.
> 
> Make drm_bridges consider the color_format set in the connector state
> during the atomic bridge check. Call into the connector function to get
> the connector state's connector color format. For bridge connectors
> including an HDMI bridge, this will make use of whatever the HDMI
> implementation set as output formats, and AUTO will never be part of the
> rejection logic.
> 
> Reject any output bus formats that do not correspond to the requested
> color format. DRM_CONNECTOR_COLOR_FORMAT_AUTO is always accepted as a
> matching color format for a bus format, meaning that non-HDMI bridge
> chains will end up picking the first bus format choice that works, as
> has already been the case previously.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 64 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 

Nice, generic and easily reusable for DP!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
