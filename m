Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830C3328F5
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036916; cv=none; b=cugoBJS4N6Hc23nNrwRLxz/NiO0fPiM6uoP8XwoRBXTPwsgqXqzrqebi4dAcrjs6Pz9oMT5aASUsEq9dHfqGNOzJ4pA9xYZy/ReTvxFGx6BGm8PsuVZgrqCjiJQbaH0rihAlGX8jDM3EuuATEzmHvnCkhEibvGxzGwi7IrCtFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036916; c=relaxed/simple;
	bh=XRz5CpX58FzZ6Py48iS5tMNcegYVIQP1CxQVyYVTqHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axQANKU2jURMrNgbrNOuheDQQguKPxBnhN2njz6bMsD72L382xHGjpY6jIARRk6bAinzy8bATue5lh8W1DVd1mFFDAjpgKzx8AR7IIJY4FC+eim9iEe3yiQ2FAzM6bG/oupG/jKB/gZyScSucbnNlUcA8v62AViGEPvWscPg0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCLzmV5w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpSKinwc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCLzmV5w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpSKinwc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD65oMU3563726
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 12:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dc+nXsVIfk+kYw0a9SDHakUwMtVHi1qybXAJiieTfWo=; b=dCLzmV5wSYFmslfA
	QHRxOADcLZOP6Xqh1NTonQP7J6xadJEou5sDtmcyuezGVFSAz8LVBmWQ2KXisKsQ
	ZynF2EHUFLlH13rTe2BDFNWmXnjBk6MNIAUCeYrUS2oYy044zsHM7iSFE1vmxVxX
	xsZHYNvPinm7FkMhDfdd1/J6obNP4UIn8CfFHo+TdxR1ehsfsoZapgIvuEhfkgyk
	mhxdxFPdi0OPRWqpSAom58m/4j0FK8qdC/1x6nnqxCuWDQ3OVrMunz+4x/DI8cp8
	KoV202rFi5gSt0ZVopd+ntX+7kIRKtnPkkJV9uOTxP/JLPKCBxKkrY470lPa5AYW
	sWmwVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvh3wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 12:28:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb927e4deso20908511cf.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 04:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763036913; x=1763641713; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dc+nXsVIfk+kYw0a9SDHakUwMtVHi1qybXAJiieTfWo=;
        b=FpSKinwch4rI2m3cTUu9+E7hesJO6xr/hjOGF15NJ+a+QeV3s8AJN+r1yDu6rZs+g0
         gGXTZjDtsPNzjYgPiidjs1VdKIZn2s/VqKBOTh0NfM+Q3JRYsViKUwTGXXpzuTh6cjZ5
         XIKIgbFTHtExJVtuZxmooPdjtG1+uSFOSoygjEC3QGGOgCLZiQB3wmtQcI3yLxHkL8Wu
         JQBF7NBIGSM6l2n0mvGnKYDiapr/LDg2zoXoIm6AoNHd7iwdozUEH5HnjYGGB5AAPynV
         B2edjbXiJJ/VAGhLTzbC804otfsr3mFQxDtlmGg/6av1p3xAb6fdTkSty0P0W0PCDEsG
         y/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036913; x=1763641713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc+nXsVIfk+kYw0a9SDHakUwMtVHi1qybXAJiieTfWo=;
        b=AQMBzukB9+xROx1+rGCeYu8iKcnx46lNUa7XSyqadMRO1JR834p8uHMNRwcZpd0QTI
         3wYC5hWHPaoHG7U/igqvpj2mKEuF+tmm/FjSHFckNKb1dVaqZuDMQ4rjof6Ia3nLTqEr
         98N03eVfMquQFUJj4ky2a0Xk4xcgKxtw9xSVDjoEJjUl3f5hDvUZnREh4YKXWNAaPyW2
         z6WjyCcC3V6VBl4xNfHq18MF+3J9hAa0hLA9ehN3X1LpAalT4a3lBf3roUvCOronvgEH
         22LreRc5Vhyy5Xe7yfJ10Cdfnenwm42E9Mz/x/TlhZBsGCNB4wIscnqeE96doyhNQ2o+
         Epzw==
X-Forwarded-Encrypted: i=1; AJvYcCUTqtbEBE3/QPnJ+Wc27WNnQzHRlf2uvIXlYp8zlR1lKMKbCLJzaLQYZ0A14eua1ycg5lxwQFG+sus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5EPsRGSG4APtSnhIvS/LLHQEQ+QRrzRQIH1qaB5oZJNCFZsUB
	MzXZaU2IA0s48qR2pV6TPpANLkLywyRCa4h4q/kIwnGY1QRtfm5YRJocX3IjCiGKdh1KZ8+mIiV
	UyAozBhULuQ0VvPdWsKSVzCFfkRSDBQCwUI7X9sYlU/+di69kcBW4C5XKD2z/Ebg=
X-Gm-Gg: ASbGnctq1vmpkXz/by5BrG0eHljB7+XsEu9z4Rut29I4kt8AudMOUZ3To+4mc4CaRMM
	umIRJXxNjlP1OVbg0wzFzNJlpXwDNPJatX15dT/wG0NTFu/ZfVIqVoAkcv+ovwLNwTEJ4ckvxac
	wn2yhkq23VwyYHl5ZyBgWVp5/XxK0zRjvm61OXRQciZdgvkUikW+CZ9JILPbGUTG9LO/wtAGAEe
	EJ33Hg6Dmk3LdbrlDpjkydN7sf2maWvG6Fv7gm6IK2m/nfitmHnDttZxf6WSRS5LiabAaJDuAbG
	IyaQESJynIUciOh7wbFiiDv9zFH6UUdVudMr5VSzPDXoZrr3Wekkeeet7FuCLOQdh7muixMLksW
	NbM86IY7+O+An1xMbMIzSPC5JCquMyaGO/pw78rMFUdO++DS06kZi0vFM6+dSCiecstahzpheWT
	KXZgqNIC36qU+e
X-Received: by 2002:a05:622a:450:b0:4ed:aa0c:5ed3 with SMTP id d75a77b69052e-4eddbe1fb65mr90593531cf.56.1763036913587;
        Thu, 13 Nov 2025 04:28:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl424EUsKOX7ilgawVQ1n2x4FN4hOAJvrDsPMxj9xL3zRt+q8/YlY9Rp/WoxcRjg0fZHCeZg==
X-Received: by 2002:a05:622a:450:b0:4ed:aa0c:5ed3 with SMTP id d75a77b69052e-4eddbe1fb65mr90593041cf.56.1763036913059;
        Thu, 13 Nov 2025 04:28:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac925sm367710e87.10.2025.11.13.04.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:28:32 -0800 (PST)
Date: Thu, 13 Nov 2025 14:28:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v8 01/11] dmaengine: Add DMA_PREP_LOCK/DMA_PREP_UNLOCK
 flags
Message-ID: <m4puer7jzmicbjrz54yx3fsrlakz7nwkuhbyfedqwco2udcivp@ctlklvrk3ixg>
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
 <20251106-qcom-qce-cmd-descr-v8-1-ecddca23ca26@linaro.org>
 <xozu7tlourkzuclx7brdgzzwomulrbznmejx5d4lr6dksasctd@zngg5ptmedej>
 <CAMRc=MdC7haZ9fkCNGKoGb-8R5iB0P2UA5+Fap8Svjq-WdE-=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdC7haZ9fkCNGKoGb-8R5iB0P2UA5+Fap8Svjq-WdE-=w@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=6915cef2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=5NgRZS-Cu3st9J7LMwIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cTYHobOb-No11CYSqJQwS44BZdMC3DhB
X-Proofpoint-GUID: cTYHobOb-No11CYSqJQwS44BZdMC3DhB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5NCBTYWx0ZWRfX+XqKQnevq9PN
 eUNOYwbWRIMu1v4ISSCYDEgAXsD8A3lOrY+0NFVzmwzFp8WWIb/aixHO/97CiwWv26s7951avGd
 NhxeEgReealoUR6m1gB6Il/F1uVvk5POPyqTaGs4Hb7WRfrZjkzngu8wBaevnUK3GdI99Qvgz9H
 nLbmJkWU9WV7E4EJMMbl/SIQaMqXneCjG0/tuAZLt6CNy4SUs3RtAZPEk/bWuB7ioudCUodJVio
 D1KSykGeJyKQbTuko+cwSvNQIa/7vz3Zc0/Vdp6Zk/juYe+P0+fhTeyeoTVQgMtmAvhBsk4UzBu
 Li2S39Yh/DI7RobRptmSTXcz3txzNgAyLaOaBPyl8v5yWglb077Ft3jjC07m9e4dtPYzT5/sLF1
 8E8xSklzTmcEWH/h3/NxHZRpFnFb1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130094

On Thu, Nov 13, 2025 at 11:02:11AM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 11, 2025 at 1:30 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Nov 06, 2025 at 12:33:57PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Some DMA engines may be accessed from linux and the TrustZone
> > > simultaneously. In order to allow synchronization, add lock and unlock
> > > flags for the command descriptor that allow the caller to request the
> > > controller to be locked for the duration of the transaction in an
> > > implementation-dependent way.
> >
> > What is the expected behaviour if Linux "locks" the engine and then TZ
> > tries to use it before Linux has a chance to unlock it.
> >
> 
> Are you asking about the actual behavior on Qualcomm platforms or are
> you hinting that we should describe the behavior of the TZ in the docs
> here? Ideally TZ would use the same synchronization mechanism and not
> get in linux' way. On Qualcomm the BAM, once "locked" will not fetch
> the next descriptors on pipes other than the current one until
> unlocked so effectively DMA will just not complete on other pipes.
> These flags here however are more general so I'm not sure if we should
> describe any implementation-specific details.
> 
> We can say: "The DMA controller will be locked for the duration of the
> current transaction and other users of the controller/TrustZone will
> not see their transactions complete before it is unlocked"?

So, basically, we are providing a way to stall TZ's DMA transactions?
Doesn't sound good enough to me.

-- 
With best wishes
Dmitry
