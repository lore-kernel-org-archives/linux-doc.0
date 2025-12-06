Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972522248BE
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765021553; cv=none; b=IoHSKDx/+FIFsxH3rOsyBaL8vGD/tlggSQVa7jhRbN+yR9IYQKkZi2INXI2Hyoc7USyvVtreEZIfmufEU1/B0XakMnljT7YF7+Hh0AymX7ivcjM4tJ4L97tEoVRl8mXFclAWWain9SdhtZMSEiqL3zKgcBrDM7KxNGXyUBjE5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765021553; c=relaxed/simple;
	bh=yfJjYI1TKTl+dZ7vuy+EKk5k/Wwc7PCUSaLTtm6n/TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVfNWIogBmQWssxKs8V73B68Zd0/bISx18aEuiXfqe1pjHJzkGtFkWywJ3n4Y0OdQJFilXerogP0LOvflCBf1/6au4KcFD+MbSVPKNJugOen8DOG8yDARrISHRiQC6Jld/31DcEhNt6s0umluwg3hR0pK7aXvCtvDlij2SYlSlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyOzA7pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HaLm6bdZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyOzA7pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HaLm6bdZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B6Aiase3385605
	for <linux-doc@vger.kernel.org>; Sat, 6 Dec 2025 11:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qd3aBq0UymBii6ZFMhW0qvHm
	kEhMp8LfhgbHB7N8EfQ=; b=ZyOzA7peZHV4/z2NAtE5wgB8cBXN9TpCFGUdoahZ
	1MhxL98urs58pWFrqkOP3Av/NXo/N2NOFNrvUJajZS911nC9OsuQ391rYqLhSXqu
	4VYdIxXEiTvCcCIXyW+ap5dd+TsquG4n1x5/HTBRRCK1b3JTLmVKO6e4ct5wF1xI
	b2noMPAuSwKT49IYhUVhJ3xzwRehNwKoz5T35XEoSTsqzPQ4K0XAnEetQijpwkPq
	GfrFA1obaGec582kqqyqQIUsw4rLD/V8j7wPsEUUU1rDO9stkb32CHXRrCYMrt6V
	ylYRnP9FmUbZUhWY+54oSEmDUAnEwXpCaXg9cORy9fbgSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcv80mh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 11:45:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b245c49d0cso92526485a.3
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 03:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765021548; x=1765626348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qd3aBq0UymBii6ZFMhW0qvHmkEhMp8LfhgbHB7N8EfQ=;
        b=HaLm6bdZP2VYR77HcOq7ui2e4kK0EBKXPAJZEqGiM/dC/kp9f0qAKJcLcL3BUR8rj1
         LT1ty5EMm1K9sNfoEfYbsaRij9KmMGbekpIZRm6K+RbhEd/fwdwWKylZ7cjmTATGdle9
         MPzvSkqMrK7n/XH/xjnqioQ8+VJzJTno+w9s/FOEFw7LPJ0kv9lkLvJU5k7BcTKe7JHy
         GrHw+l6Y0LT9yaqF3u5VYMWr62Z3p8wigBWh8jHPkaoaNmO+x4c2/DoT36/bNDQEbNmA
         a5n8umnTxs4cZih21srC9KWfaznpWlMST0jqS8r8JXZMeK8/9fJvZYoALYTidKLDlzyD
         vovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765021548; x=1765626348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qd3aBq0UymBii6ZFMhW0qvHmkEhMp8LfhgbHB7N8EfQ=;
        b=NicHZh8cMTrIX/thuVuS03aw72loMCWHqpKRzqYDXDZh2muAkFY+iXwyQx0M22r9av
         mjF9f31VNtTDMOH7NbEDQSD667QVspS6irAhmSiTo6OdDKYOq3YCwFEpcCqXDlpoZByz
         Tm4q5SEoPHfvSz9nqGLy43U3Axn7LbJjGR+7G2O8xKcKKShqqLgZnnz4R7/ioG1yiCUI
         Xwlx4B7PERi8yXNcwJAWLY51lxEmGzrPdwgPVEK1NgPodfXyMPlif0kNtV0EGGdm++V3
         lKpkFr95jnUivaRfT6W+nrcQ8cmDKo40wcNVYa1BYZr0T1WNNwmZIoLInV2ke0MEmHY7
         URIA==
X-Forwarded-Encrypted: i=1; AJvYcCV5gRellyi2bgkNgjsS1lrB8vXmW5IpyTxfcCkUmdE17Y4YBdOytbox6k3mSP45elTL6bh7H4G+Rk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+scrh2tcwdXKKxphSXOMdcxeSxj0SaVb8oyEvfPWaorjzcL35
	Cy3Qbi7TKjyp4ovbX7Z2Wc13Y3gKTEQRmBGJW6xw9wFy0vmUG9ed5a6ckTxls5M6yRAgAqAkr6Q
	RbDyGwP2GXUx+2rX04Q5Yu7410dWYb40vkBehfH5aZ+Vjw7cWeKP1/XCvsk9SS3c=
X-Gm-Gg: ASbGncuCySWvnumPxSKg4mEVyEyx1sClyJluNqAJzN/stKoA6kSW2xzX0Ruv2jWHgh/
	Ww37vTvi/lHLez8qGvrBi/QMs8Dzy7or0yk+m6UpSdpn7IlXdG7VqcC2dWueR+70tqvZ6hN41DV
	uPM0fEHI+DvyRBTxjMDtaZlgtnQfTA2S9189lxpWgOzBQ3sRziC+/YD6z1EZHRwCfhw3VCyBql2
	BjyMregLEW65gBuzYLGBtKJHQ5yZ5OYXWhGzbF1IPXfV26aU7/fEf4LCVJpmt4k2nOAQi5Aax6C
	4gZBCQN+E7WN0fOsa9t6/YvBBoXh7Zho/5etX943r3LUjWrB8ML3fprtLIwWp7hOfP6Ue1AaK5w
	EeCencBW5hnkEIjAbbpQimxUNBSAxAsBjzxvyX8PBCZVtplMRzVMNMj6XSMkXKuTLrHU9lLLoHL
	bueXgvvSMslzXvcmwkKcqkCcQ=
X-Received: by 2002:a05:620a:5cc1:b0:8b2:f228:ed73 with SMTP id af79cd13be357-8b6a2348d63mr208849685a.7.1765021547764;
        Sat, 06 Dec 2025 03:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7lhRj80fCQhRwzG8Sy9MVABWIaWuDqVkUzPeyO/wCFqFIdnng6bpykxGDH3HN12wdPzhmBQ==
X-Received: by 2002:a05:620a:5cc1:b0:8b2:f228:ed73 with SMTP id af79cd13be357-8b6a2348d63mr208847785a.7.1765021547290;
        Sat, 06 Dec 2025 03:45:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70660c43sm21834671fa.47.2025.12.06.03.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:45:46 -0800 (PST)
Date: Sat, 6 Dec 2025 13:45:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 11/11] crypto: qce - Switch to using BAM DMA for
 crypto I/O
Message-ID: <2rua7crcsdwikakbchbsmzbcwkofzwwbujskknub42hpkxjlsu@owqmdyl2gyuv>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
X-Proofpoint-ORIG-GUID: jLZ5eZa_VGHzD4ckGePZrpUal-2byYDQ
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=6934176d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RpWgtCqNgKFi5XhArUUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NSBTYWx0ZWRfX3Dpch7Rn01PA
 uZG6LtbyO4DL47+fy6dWQdsmrViTgKonqA2tYRuQMUIedYufkXSmRdnRAzpsAJTkytb/SBgUTmx
 1D5tqefT6Y5aFwGsb5lS0V0FQciR/zn9cDL1FlXlshI7qmZKhrc1zHwY6PFpo6vTJWLNjxImMjp
 yALpndPmubxELQwBoDg8JOn+w0YI3WFsiIs2z6byGIbz2oABBL9kDQhKNMa/g4resm8NFodLH/b
 IURd4QGo/82CJQ2jZqKyjtzkMQ6eEFLvx6CAzdUccEsFh//XBrLXECVRQUAr0ChZpn9wmCD5CXz
 K7cBbOCnzgBTbYRhXARBAobEveCT9yBpBayTd3Vvcj+vHwVGxQwC3qO8gVeG0wSXZvr+pfYr22I
 DCk+W7119HqeCBc9auWwFYrUquWZtA==
X-Proofpoint-GUID: jLZ5eZa_VGHzD4ckGePZrpUal-2byYDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060095

On Fri, Nov 28, 2025 at 12:44:09PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With everything else in place, we can now switch to actually using the
> BAM DMA for register I/O with DMA engine locking.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/crypto/qce/aead.c     | 10 ++++++++++
>  drivers/crypto/qce/common.c   | 21 ++++++++++-----------
>  drivers/crypto/qce/sha.c      |  8 ++++++++
>  drivers/crypto/qce/skcipher.c |  7 +++++++
>  4 files changed, 35 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
