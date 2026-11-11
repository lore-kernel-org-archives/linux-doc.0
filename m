Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386007;
	b=29H3QQ38zdkCdJHIhn09707yadLUOsgkGPRWe2i8e9g0MLywWRaxGI6ERC3t3ZPooWcL
	 2Ii2J5Fp72Dox7USrSG57Ervh2wsatXB4TRCZ5QpN9zenJQ081VLDKfSmdxghFfbzLZsE
	 P4Bxkr9Z/leUl6VBa6wGcy1LhLdkrzB5x65epvRNzYkaV9GaiOTGiOJh9WytiGl8H+/BN
	 ssFUQqqea1wiNbh+vHDCwdkFKnqdGtg3slBc8f8S5o/YGQ+RiWEmNl57JqsBedAk2QNtK
	 DeBm5dx3/G819Pnq6m+uCxJ0Fluqw7ql/yC7SWpXfcxRVmPvoXsWCw4Jk105Yq5bQLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
	b=NV918HzYVXC3zMI9ea8PwUh7LwBL0L3JBxS2NM47mKuEhzQVvnROMLZuKikndBKZXSIj
	 J4IxxrWoDonfy6AlnJtonlN1rDL9Wf1EwvHsT7nMSeZwRor4IyvS/2ulETAdM6eDwuXbl
	 Y5rHJDXQwbaoKjNLBM0VCexNL+qiHMJhjuuSiTvam+OOTgknnEi4f4YmCCDR0cWpSyq/j
	 1x4iJPqpPZjaAnh5CdP0FqYUW8CZEYuNn4ykPgzrfdz4Ccu+NfsrEe3EsIQHhcGLhtaDR
	 IJ1t6sZhTkvHkdm1iNUm0Nf5qEwzw89D2tJxJ1sOCHtJ+ipeULDYbo7+/ets4Awc3Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA8606A33D
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFA8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KItt1369015
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=; b=ExzrXnKWCIJuRBYW
	adlPonufNKzumfWmayEMC2ytP0DcBjWY22YFKn4YbEymsgJmsfGf64Z/I99EVESM
	Iwwh2NEDAYO1fknxf3wpxObrSHiaPMgb0dFAejfkLOjJozEtfs0tP/Roz1hQmT+X
	KNtOXCwzMXVzmymZPX2+ldNXcDr4IbSK4YAKqiMlVRRBBPYuSJ/b9Onbg0VyWEkZ
	5noTWZOHi925H8YZ6P2Y99oaUphEDMhKHnGufPJahXIykXXB56H5oUiV1Y0Ubc8U
	BMh//eVhierB+74JJRmF2uhNuS3jwvlB+rKcX39D23/HSmhcuTBivBjo2pZVUIOu
	jAFQ1w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpehts0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:33:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so5218972eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386005; x=1794990805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=LumO8tFyNpgZ8WmIxaPO4OMDIu0tC/OKETcHi48LvuoTCqPGQwNB9CGq0oMq90SP+9
         k2yEcYpmBd3COz+n72MRc/puVC70IhmgIJ1AIWMYXjlcBAP7Pb6NjvgdGzbxPIPDgyqf
         bC7zsSRebGiHdxAqtRmJboMaXW5TZvCHoN19knYtib3XAElz2KGCl+bdpfNtMduf9gC7
         RRKf5sxYEq1sEiFeA9j/ZjJoSQOpmzFpnxPq2iWZPqam9HxRDNW+ak8zsRM8aTI53lV4
         48ke54AFgaa3mbljvrZDNNgaftlwmyru5jQSq2uAiCUFOFvrdY2wvJmHCM0czUmkKjYK
         rtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386005; x=1794990805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=jEwadZWnKOTZlTXWzJTVJITC9ODjt+68I6AHLkup6DABTAeUGuyVqRGifmRrjl5DPr
         ZyRpvupKfm+eoOfLipplNTAx7lQRysgDQtC35gN9nIHtF/sRB6mxKioFj500NnLk4DcY
         DI0yoVEUFCgSpflfmwW9b/P0Xr0NyLnaZ9mRmI0dYW/CRt2Pg+8kt/h6Zc7Wj2Smdsnw
         W9X3MPdw0NPM0V/cxmyxmXyD2iswCoqt3DBmYr2ay6lShHKAPJIdhJGVX4paOMss4PM3
         1nqXfMcN9Ko0fMr+YJpsilckv/NCt4WcGZ7CRjpQXLns+c86Qu0Vx0YRSXrXwH+yNW1b
         UWDg==
X-Forwarded-Encrypted: i=1; AL+hErFC5LEUqeRqNjltGrUQz1LSubO/caRR0mYBmWYzXhfq1IXdf03D33MvvkJiAv3mtWsAfnSSvoOa+co=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zopcHGU2JgbII8F1FLznEDXSOsrrWYAtt0dTBfFJwh43lxFWH
	dz81Ck6MTocYKgoojxaVfzOIj6jRu7ipaVgm74tAQ+obWq8NCq6q7Xz8kx69gLwjLHiih5L+Z+a
	jDHdTnjtyix0jEanqE6/SchHMnMJ+thAbZh8D/NbrNyEzjvP/BG709g+7jjN30SA=
X-Gm-Gg: AYBFou0uR43g5NCG0FCQw9xTpP3PICKrPs0uG+tiSXJEha9Seq4SLJezoJWtDmN/bI/
	KbYFVqorwAWqPMD5uIIM692oqHgl8NpKIudxDdYarc3GGPnBwgnyuk1GfxH2GRRiPbVmb3u24ot
	7wJgLyhy3N9ijnQK3AcyoDOQnBW5RbKcp6ym2rU86ii8kvJr/OuV9HIsJhjRZ3OpxhPGdfW+ly3
	uNjYs0vlHAPpVl4zooNU9xM7t0FF5pDtLgJoIdkEL8zJFDTh9kIDjsngNcfdX6ZT2hZuiMl+dn6
	zNCK9/Bcuzjva0Rug7eTlUnkWVamcvm8txI8jiJ1qjBy8VDZtrBVrbm3K/n56HLo6xr5D8PN9ks
	M17II/TQsIW/aRXNSbiMWDY5lNwJ98fUYwCJbC5rgifNHXu17gCYJGtg7p9E80aUyUxOizSbPn3
	rr0Q==
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455977eec.5.1794386004938;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455945eec.5.1794386004375;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm26864637eec.29.2026.11.11.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:33:23 -0800 (PST)
Message-ID: <811819ae-ebff-49e2-be25-134b58711a5f@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:03:13 +0530
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/25] accel/qda: Add initial QDA DRM accelerator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-2-88f2f24a5f0b@qti.qualcomm.com>
 <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfX7daoMBJU7kqY
 PxAWsyqiJtHztpLoIU7iU2GgwRGCx3T8l+rFj5Y6s1bQsE64M/Jp+4m4xtP7qrN7RLaQgBiT+Sd
 08NWYufguODwXShtZw6Vtc3nhZjHpT2LN3NcIgfaYnYjRhyUUGT7tDYJmZy3xtooONppEii/dPy
 RzQBimwbd9D7hiAYkQl9j96VcQKjn8+Nj3sylMmJZVnwaku0/iV685uUNmbGDZKW92kY8bV1Zuy
 +aeghcX4jzreIQmfOACqOT7fKwrGm4GIISXYjrph8mcSi6xnfboucl+Quwuf/nlwlrP4k/sR+tG
 sApDty5zOJ2+TF2t+Bu0NTwMtX96iVnK6Il/MAd3MlxNv/CcsTBIkTqum9cP65U7AdhCSbKQ3SD
 fM50HwXVEVU9eXPAZgAVrKrkAHWuIKa0mT25On4FddFM1gT3czif38d4Rm09pWJTFghKQWqhTFM
 ht2EYmWX2By9qbaDTow==
X-Proofpoint-ORIG-GUID: PSZXTpdbJjCHqbGIYh1wfoOb7pw6ovmv
X-Proofpoint-GUID: PSZXTpdbJjCHqbGIYh1wfoOb7pw6ovmv
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af42856 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=3RgQX8W33KRH0BhMXdoA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfX7t+bEj0TFjG5
 irJK4QkY5+sK8wkkvDEREtPIKlXnMpGa0DfIKXVrovmMe4WljAh2ClgxelxOokBshYk7vg5Tdbw
 X7R9nTR78/8AccxlD0galITuf9OKmi0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110033

On 02-11-2026 14:12, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> +
>> +#include "qda_drv.h"
>> +
>> +/*
>> + * Both compatibles the binding defines are matched here. The glymur, hawi,
>> + * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> + * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> + * attached as match data by a later patch, once there is something that
> 
> So you add empty or non-working code. No, add these once you actually
> have complete and working table.
agreed, will add this once there is a complete table.

> 
>> + * consumes them.
>> + */
> 
> Drop comment, redundant. Referencing future patches makes no sense in
> source code, because there is no "patch" when looking at the code.
ack.

> 
>> +static const struct of_device_id qda_rpmsg_of_match[] = {
>> +	{ .compatible = "qcom,kaanapali-fastrpc" },
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{ }
> 
> 
> 
> 
> Best regards,
> Krzysztof

