Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DB3C13F5
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159935; cv=none; b=FkwyRAvOEcjfXSpohCf7ydNu/Us6Oxwuu7vywgLv/AXYo3DMuOOc1wgk8USRHo22lSY8OXwClUJ0k9LRY8BS75tnyxa0dYhnroWSThadHDtF1yu3r1kFLw2XM+tXy9ygrJDmWy4KRWAorUg2IzocpIWWtHINZFhntzOJUxIwCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159935; c=relaxed/simple;
	bh=VfZJL/05CrykX+ouf4RhiP1e4++49VnbXustyYGDWMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7Lqs2Ly5xhArLl7A/KlML9AawLP7Mi5/SB2ilqvm/Pz1whnjoD5bi+ZOQNv0+1kfT3e/B1rzfu/C48Q30YKfd8D9KUU2J4ulu/ouO7sTLJ4IDEGw7I6SPuo50j+fopDIHr01/gMsqjztjx2v/sg3fzsPvjWGNP/OgceWEGSHnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Suhm7e8m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9F2CfFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Suhm7e8m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9F2CfFJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6fDw31479029
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=; b=Suhm7e8mZGqcGosW
	9je+YigAKvzd5Q8YTF4XfC0yZ2BfpxQDLqaGpSJaampK3812YalnqDcGBVxYko5U
	GdFwsqe20bLeA3OPm+cN2L4EUjHsQ8tRdbwkm6M0ZcvHZQ4xrn6Qkf6o2/pfx67l
	c5yrVPdjEwnkN+vj687HmoRA1WNgQsAPMznaIxgBUuziNpKFurLiOqR/gYRHwGcD
	FkzKSI8t9EgVsN3DdxNg2Lx68yyoEgN9ZsfaydMw9GJ5e4n+dyJqqLLj6Y4mC6uV
	bNuqLLyaqwuhQKbXPYFI1YYJm0/F/yI+K26XxOKZuQDUqmaZ+8IgA8SJmWWxl6DK
	WMonVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j25dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:45:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so76409835ad.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159933; x=1776764733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=;
        b=K9F2CfFJvcE7zsW61ns5lvvgrXhYZO5rXgbStDJI9RM1k3SVevxOgisX6SAYMheHEB
         Hg8VCABTVItTgJ/TBIwOKGklzI6MEnk3bI3z/6ygSMXVXrqL1w7ghkTW0biTjv6A14L3
         z0o74GV0KSVppGrB8wbaDcFOUmMIJl2A4Jxd96ueVRvtsYR1ltGcbROleafR7OD7Ewlo
         Paf7rkFIT8FF3EdaKh5XRcbSAptgY4xhTItIiVlm/Lx9cIE0eG/C9ORGFwlmAT3W6Ds+
         Ge9yEsMeCxaIbPAbn9/nGPFrZ/rVN2uyzP9XZegJccwmsC3HDv9c2VpL2nNLsIK8kT2H
         5R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159933; x=1776764733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=;
        b=rkmlo/1GyRpzAwbkzhsQxQCUBq02KIHd23kxFFWJLftYZRnx/mPV4svO/LxFQVR8EK
         50oFBbdUY0995k3yxww/9TNjb4NtTspBVXK9FQ1WZ/ZxuGQM5wuwEjMhiEmR6VRFb4fO
         rGcIflA0IwAYdFC7b81UFqRzvAbY24LrF1a8Jmn9bcwiUrkXUtxueZtsXU+QiEPyVuo/
         TBy0s/BSiEP6WHd7VfxlgjoBkPOaRNCGjwaF8utxI0QLLZI5PlK7XJMxxnevblkQXwKx
         p8FPAHoyFWqki2rRs22ZnHXkgcYl8w6x9mgYm9gorIhZsqEXjvZB8ZE0KWcttOVnif2w
         /S0w==
X-Forwarded-Encrypted: i=1; AFNElJ9o7+/wHSksO0lJwcjOMLi8r29HDvBJFlR7MxcHkzFjv/zZhAMoqmgXzwlWdjFZOg9ocKLepIulyNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNtZNLSK5/WzceYZ4Mm2WCSDGiVRL51gJfjDvUAnwSDXqReh3
	u5icWvEaEUhkFxrS9KexZXSpwAvVRvT/wp0VMAUepM7tUIXDYEP+f/9t8CIwJfzdH0/0XxapNOq
	+5x2p9Ycf2JhJjyo90xSv7rO6YS4nkqF8Z9MkyHyb0/3pmvYf+3SWWgmtAsKLYVo=
X-Gm-Gg: AeBDieuVk9b+2iC8uIkwdHHVFROyBPmRizJYRSEeZsuOYR8dhDwlG5qcFVsvwIQE5wN
	WJzKmCEACfbIu/NFYRwIfecXqx0cB8gZZ94TzAmXDo+xy9EyjlL+Vuw8zCdAc3fJ8wDHDaK0Pdd
	Ufqaov2vQuwcP/u1jJ+LSpJdNZfRlJC/+ciQWIYCjFRfQXXyfXyoY8cFJTle0Hep1dAjcWXLaQo
	kXJAK6kmqK98oEL/CjfJW72X6w1/y+iGAx3mWqZpjh5i6GOx8AzLcManyGiR7bEYldNxJItC7JP
	/Qqmw6sl4U3JTAikyd377sVt/K83hXLnBUPDRUXDi43Gb5zwR8J/glvwu74BA6UhIulPVtVohgq
	9sZqRPm1E5mkA6xOvVABtOLxPyRbY9Cacz2ir7Lal9QZr7o+REn5CwQ==
X-Received: by 2002:a17:902:cf0d:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b2d59ae7cemr166707585ad.16.1776159933036;
        Tue, 14 Apr 2026 02:45:33 -0700 (PDT)
X-Received: by 2002:a17:902:cf0d:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b2d59ae7cemr166707295ad.16.1776159932546;
        Tue, 14 Apr 2026 02:45:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2f8e7sm134928975ad.65.2026.04.14.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:45:32 -0700 (PDT)
Message-ID: <5a2fa53c-a895-4c39-9670-c6d383ca17a6@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:15:27 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
 <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
 <sab2tgxtiftme5gscknsl7cfifpshtlrnnihbm2g56ppbowcit@bg4bzwuta6a6>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <sab2tgxtiftme5gscknsl7cfifpshtlrnnihbm2g56ppbowcit@bg4bzwuta6a6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lWyfwvI9ldFlwj9HPTTrPG0O2vFxZY0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfX/Hr3zneiUAm9
 K01Tx/hzu6vP0xbv1Udszr+TWe8r8MlFwutrOaW/X1IYhkZIMo6bWBXb7sQHKU34DAufoyBlKHH
 QOsW91jK576h9ZT4YfYzpePOI99aKQ7cGtEA7LxtFTMqeexHqMco04s0i+vNXUZ3SGDJpQ6V+Lu
 M/ng16sBrxyyHzv/v+33yloLN+eq/lvgucFT+8fKyKjMfQs+lY1ZjKhIY35bRLu+adLO8HYLjxg
 c50cePkvPNAvQXAbT2l+RDvKphu3sUuoy/x0Jb/WeYa6IKaboCst9+wow8LEUaVVOwocaU625hn
 fnCMP7V9YSe/YuS862bIUtZl/MnCdP+SSJCiWQ5orGDW4MHKDLZPHUy8xK+OgLW+kt5vmLMVBv1
 7306YEOA0VsI1dvuO6AqxwY2Oe+3AJDZ1cAg9k5L3kavQUT9T+XeueF+FzduD3B3BIiRFx7JQgI
 L7NhXeWFC0UJ+rbPrmA==
X-Proofpoint-ORIG-GUID: lWyfwvI9ldFlwj9HPTTrPG0O2vFxZY0y
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de0cbd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=W_4NKV7oC5Mk2jKmMQsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140091


On 4/13/2026 4:34 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 09, 2026 at 02:20:02PM -0600, Jeff Hugo wrote:
>> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>>> The Sahara protocol driver is currently located under the QAIC
>>> accelerator subsystem even though protocol itself is transported over the
>>> MHI bus and is used by multiple Qualcomm flashless devices.
>>>
>>> Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
>>> an independent MHI protocol driver. This avoids treating Sahara as QAIC
>>> specific and makes it available for reuse by other MHI based devices.
>>>
>>> As part of this move, introduce a dedicated Kconfig and Makefile under the
>>> MHI subsystem and expose the sahara interface via a common header.
>> I don't think this belongs under MHI. Mani needs to confirm that he agrees
>> with the concept of moving this there.
>>
>> The Sahara protocol as defined by the spec does not require MHI. We know
>> that there are Sahara implementations over USB. I don't see a dependency or
>> relationship to MHI other than the current in-kernel implementation uses
>> MHI, but there are plenty of things that use MHI (qaic, mhi-net, ath12k,
>> etc) which are not a part of the MHI bus.
>>
> Since Sahara is a MHI client driver, it is OK with me to place it under
> drivers/bus/mhi/host/. We do tend to host the client/controller drivers if they
> also bind to separate top level subsystems like Net, WWAN... but for the pure
> protocol drivers like Sahara, MHI can provide asylum.
>
> - Mani
Thanks for the confirmation Mani. I will keep the Sahara driver under 
driver/bus/mhi/host/ and also move the Sahara documentation under 
Documentation/mhi/ directory.
