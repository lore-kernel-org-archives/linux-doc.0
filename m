Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614155;
	b=AYTXwlhfAYuJbJiUGVHF/pCO2MTzxMfPs1Ned0bJcBZkp7AJg7EcfZg5ncONZ56wgr/A
	 4IXgl1/OrJwMVTHf/ZIkq1kJ0/T+4OORbpcIrzheT5dJ1vU2A6tJx/kHSdWPGgAWE1AE5
	 +2ApYi1fFK5q83g8lJv/OtIb4g5TjvtRuH77jw6GAz/hJvWrwm1JDeyFVslQmS8qhdiX8
	 ndJNQwLsgTTYrt/u0BJfA+op0Ht2r8rDCFzNYXFrlCfoL2deeWSlSleTVw2Fj4GpSRk+f
	 Lem0bFqUax0qQF2plSe65xq1cbILRDiSHqcZYY139E/j6081CTrVdHp5F4RzV8+R46Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
	b=b/ARaxpbPn2kPuBQ9xkppabsgQ1hNWA3/vZfpO2QNyuO6oTKEoKseVq3d+uemorojcGg
	 yYLjShLsbuwAt70ICPl5C9EJum1W22yFMHk/tF1xGLCUMVCzMBv2xjaveIFhAZgJOh3Ui
	 dVbgOJ3359DgvWBHRg5+HeIk6Dsc7p5OC3r96tAXRURd9NAWYLqfglmsPzT/0lSS5Mntf
	 YssUErarqE+WAypUP8OrZT8sEqkOJJRkg0zu7gj/rZTKr/+a8Wd0mzOK2/912St/fz8b7
	 OOMjGsroizIfLYi2idxrdSsX7Wy+1nceaOpdGg9Kfajjsv0u4QOOoTFdjp+XKJGPEHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fcooxj1/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NpAs/XiK";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE059606A327
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 10:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE059606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fcooxj1/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NpAs/XiK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQmH2361168
	for <linux-doc@vger.kernel.org>; Mon, 2 Nov 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=; b=Fcooxj1/EnfnyTwT
	//vHKn83TDfpot7hVAY+bwYIcrYfAleant7bpT89zR1ne1GFlGdUmcQ1dE8WxGtT
	yzF+QX72fTvEX03D3r5nPmYKKOMLldpeuaD+NM6VM4G4VtMNQr5Ie5ZM/99IWOH+
	7WFnVcfA3cyDMmYaSHAMrpoGOHvzgoLxMCPFzRI+4VRJJ6FWqYVbS+K5q5iMLLWt
	irMjg9i5uOI80dz94zuM5alzkZfHUHBh2kCdG/G64IUiDN9v26DDI42eFU2j+l1V
	+sGC6c9/0ZEyDIFBsPgdz+wqferiq6K7sJ1W4NPtLQJDg3I0Q+OTwybI34zbJgRX
	4HGtIA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7xadk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 10:09:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1559842a12.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 02:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793614153; x=1794218953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
        b=NpAs/XiKl6lbjdDJWFdf5mIeq8d9kl0N94W9AOHOE8IxHcF5P0TJEQ7iaXQtgQtxp4
         vNZkq2oCJU/UzkKMz6aW4j0mvqV4O45UUWsKocASaMQrE6sWhDy9620DBiJt+FiGixrK
         U7JaNDm0uCSG1h7J0JQb/DBaiIZZw7ILffkhzBmFBxs1MAwR0FN+h59+5uNg7nmwKlIa
         aYD9cUOGqJzyjv1k9zHgVlxS+HFGrEoBbXFsyQllQLkbGKVStqwRe3SDXPZGoCuglsir
         INEZB3DN3W52DFrD6UjEKu6zuWsZYq/rA/q0U1z2CAIEv1vPF4Cq8xasGnZBOdIOtu9t
         OUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614153; x=1794218953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xm99b92EcvQYiFo2BERFkDMWH8ztgzfeHS78pLE5VUs=;
        b=snrg40gDozumoNWqIcZI3yV8+4Xyo29Q0IlCyE0kEKIRGlQFhN+E3523WLpc1Oyv48
         xSPZR9GnWDg8VIYwyV1V58SQ9FUCDRsk0dFBMdQTLBelnmx3L5IP3zavXwcis0XVjIkE
         WbWeA6KclzY90cH9UoYVj9a6wwvq3/W3XPnEsFxNfQQD5bDAoM5uvpbWzKzp6DDSmOCn
         IwgBgfBg1YMHPXSjwg5lDPsHeM8gi7VVtyzAeh+zGZedn4iCSM6ax6pKycat2N2Ib90i
         SZH+r+VEofuE6VWr+Mthz1/wsomyhyYuLWKipszCgf1GYfBQBDYQT48TRovoMJMXLYp4
         Vl9g==
X-Forwarded-Encrypted: i=1; AKwUvBzr4P2o0aFgv457ddF0HXM5gBJ0nr6sMq94CoRx/F7k0sIsDwggHMo9EtpWb3CQHm/0GntBj1byR1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K2FvHRulHQFpkCoBHkg0dDoKhCpq7cyOUiqxekBF2m+Yd0qLy
	pGgAxOiPfwwcJeeFNGEunAdEQenY5yaGNS9r2IJ2R80WZtStHqXs6jAitQO4csi7FQrv+TD9f/t
	kiPwsMUOOJvyyla37FHIMEonzChy+SfDzvthE7AYHPxdTVXQBRZRkEjSzNCX+BlU=
X-Gm-Gg: AYBFou3GyyPhRH+84p0wwCtYJrEpITm1mEM9mQPWBge2WzZ1JTQerw+LIvfBQtPMQJp
	i5aZaMrrajbewfFAc9ghwsZCXRoigsCpTxTg6Jj3emLtjBrboYGIJjWN1kPP8VtqJhiA9EcWcpB
	9WpKu7j+1RRx/bniUfz2y4qz6DhrpSbd18sQkrEF/JtzikMcy8O+TjsAi/5IpIvF3s0xFbro2bz
	Z64dYIsGb6hVYfZIw9Y4pI72WcB7orT+GZkng0oN+2jfovZEmKM+72gQRpmByXCC20JQf0FrNAd
	m06IqqKMg4nzcroLpCKtvzMhI4NJxWhMUdTWRAmTlj6rKcOA+f3B/GWXHzLdwugbcjiXLCAA3jD
	SLzYpNdt8yQ6N36dswXITbUwN6OD1zhrOVGnB3Af34CMvUlS5aTp5VLiEZn6AwLReNHck+LvdU5
	hiNQ==
X-Received: by 2002:a17:90b:4b8a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ae8977737emr7207178a91.40.1793614152664;
        Mon, 02 Nov 2026 02:09:12 -0800 (PST)
X-Received: by 2002:a17:90b:4b8a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ae8977737emr7207161a91.40.1793614151969;
        Mon, 02 Nov 2026 02:09:11 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98f888sm18169303a91.13.2026.11.02.02.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:09:10 -0800 (PST)
Message-ID: <26ca5c66-a2ff-4aaf-9c9d-724ac66480eb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:38:58 +0530
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
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
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
 <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V30-zPJP5d2R1_vaoNBg5ztsviy-vNok
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX6KbHK6XA+PkV
 19IdgHQruqJzVqjXY9y+6uf64OwwX5PZXI9QuSILjnjfiCA0qCSxcK+0gQ50pMW6ZFhzqbhpmZ4
 iNUh+yereB7hBlr4EXVGvC/gSeJ4xRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MCBTYWx0ZWRfX74HVRVp3IIlR
 0cXt92KdbBMkghitzYwOu2rX5SL1xBv43QezxUxooPccamdsjLqGakoA6Z0QKRjlxJyE6RTuRHM
 kBASZa+4fSMWx4n2xO7VYOB+czbM96Gy+nbLNSUogJiBlIjhtLCxaD89sHz87YmTGpb2Mmfcr66
 8wysE/eoA0SIjm/nsxGOgEA7zl25T+QzM4FcvTy/L9SpyBTqGjtVNZaGCiw3K060/N5tVji8i3S
 Yo7VwodIblf4nf9N984pYhtLe+DvT4B3MvXHL7TnPjgoDxiMy1uUhOdjhScPFlV7sIW5pfBa4Ru
 ezz/6fXRkPhARjT1DCXyg3oVAl6lr66DGcXtXeEhzvMmTzUpZ4x3sjlJhiN4DCOMSXWUSTWvnfY
 C3m5sxiIQbLo5c/erfGfHCmFwhRrDSjgWxdK/LFe7b0V3a73XMzI2DN6DhKPXWGFAoTaExY5HZm
 osDpLDv7fAbEM9VFSSA==
X-Proofpoint-GUID: V30-zPJP5d2R1_vaoNBg5ztsviy-vNok
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae86149 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=PkZpfZOK-p4hLHj_r-EA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020040

On 02-11-2026 14:23, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>  drivers/accel/qda/qda_soc.c            |   66 ++
>>  drivers/accel/qda/qda_soc.h            |   61 ++
>>  drivers/misc/Kconfig                   |    1 +
>>  include/uapi/drm/qda_accel.h           |  282 +++++++
>>  33 files changed, 5877 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
>> change-id: 20261102-v4-e8feb321263f
> 
> What is happening here? How are we supposed to work with this?
> 
> v1: 20260223-qda-firstpost-4ab05249e2cc
> v2: 20260519-qda-series-78c2bf0ed78b
> v2 again: 20260817-qda-v2-78e2d1f10529
> 
> And now completely different one?
> 
> This makes the change id completely unusable. b4 diff obviously does not
> work. Any tracking of this does not work.
> 
> NAK, really, I already complained internally months ago about such
> practice, so apparently not enough.
> 
> Best regards,
> Krzysztof

Sorry about this. I lost the original b4 branch and re-enrolled the
series for v4, which generated a new change-id. I should have carried
the existing one over.

I have restored the v3 change-id (20260817-qda-v2-78e2d1f10529) on the
branch, and it will stay fixed for all future revisions of this series.
v5 will use it.

Note that v4 is a substantial rework of v3 (the custom bus and iommu
patches are gone, the legacy shim is new and the series is reordered),
so a range-diff against v3 would be of limited use; the "Changes in v4"
section in the cover letter lists what changed and why.

//Ekansh
