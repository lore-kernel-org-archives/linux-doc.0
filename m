Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03913E47B
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184122; cv=none; b=fJ3VXwqT6+jUbadDDY7RhdjgXiKEXebM040rve8m0k0UYKdAPp6t3A/5Gh01AI3BQlk9sgyvVB1D7WQWttDg3oX/BdZHxLXNpFJTvEvS9RSLBHCc7zjPxORWQknLhd1NjUsDqyWXDjB1VMFhEnt8wr9K5iCqBEuNOGbf55nwo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184122; c=relaxed/simple;
	bh=iXWnCvVZ87ZhxeHXve8z6eGPTqXNBUtx57uGAyUBYaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vuq4a8pSapFix+2Svde3QUFdpYIlOOmW6UHtC63O9sYI8Dt2toM/JNYsqodzp/oo0sFjkwVPZjjQ2y0873ONjWq4VQNidSDc0wHWPKVJrQSaLGE0jKyoevkTKEYHKDsmWXSSC/47Pfs0guwvC9Rzkd+9sSKlOdWgkov0aOQa5W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQgu4Lr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKUeNf5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQgu4Lr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKUeNf5M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC6FQ245810
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 20:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfnDuv+8RUeh/cKuM0y6F6+wWcdFDiaIhkznAKbe9dw=; b=lQgu4Lr0xnH06IRI
	8zn/Xfh2RSw6Y2xrKOK/boi9q03xKJDIMEu4BiJQW9kFn0BHicPZICCusB+Gu/Ua
	zblKX42Ds9JlYXKQxDxpmTzHmcSfDb6wdfmZgo0YWTq21mS23Lx5y5Vf7HHxqeVx
	c9tCCKnn8OQ2cmAJTQS4OYxhJyEPZZy3g6NVWZl5cY3tjpzqya7b199Bygab10Cj
	7/FI5S2eCF0SziDa1c1qykRbWn3PeLig5PF1+lhdws9QifCOPwJxrBIoG85tJtYU
	L5zVjtiSmajiwhbtstdcX0M/UXqenVnUEHtOOpu4qpjjboZANFpXImTNySUeVZs/
	FeaHHA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbtxda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 20:28:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2096195a12.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785184118; x=1785788918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfnDuv+8RUeh/cKuM0y6F6+wWcdFDiaIhkznAKbe9dw=;
        b=cKUeNf5MjYufietstw1tWulbv+10NjknhYNO3pcg7QsQobMgcm6bzh5/NEBkrcjsz6
         71uBlB9Y15nU/m+TFtKrxh8gUN+pCU81e6bICBBXqbPmNUgQMD2ra+woqt+TnSA0dnRz
         35KLYcRE48C79EmbS6BHd3ubzFMJj5Ubg7GwmUJrro7DCe9iv+OUfnEK1D39Z4ATm4HP
         VbBSynyC5k7MuYG3/+9cHiNNuS92Ppuk2tvonxsumcmKSjk+rbrxww2eKehg64XgHD4t
         CvI+/4zfquhupckodGAwLi8FQCU+qzGgm7J9AEWfqcxPpYayTFCFMHsHpLKj2F/LK6eA
         /Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184118; x=1785788918;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfnDuv+8RUeh/cKuM0y6F6+wWcdFDiaIhkznAKbe9dw=;
        b=RoeVp8g1HLHuJHS7Alh4wx/hIugeKg2scz/Xbr9wGkex9LQ9zV+Wvkk5KtkhKYlShP
         8BVAtrlPFiqpdu7GVX+MUaytW6eUYPYkQUa0RHlz0K7yKV1zx9OfOofzPzDCNU5I4yOu
         VCudMb4PnYIHYCs+aSOQ4DPfEI42ZtwIc3xE/H0meQ820gtgRFDqH5VEIid5nNwBCjnZ
         PYMQkneDznrVYpKTDOGLMCK9jtSRjjYuOUsQh+dmChN+g90g74e5uafYyOMhloLsdULP
         UOX3s2BBiKWOsUEiLTwu12issVGZAQkzEZaFZjlyo5f2oB68AvPRpN2IPVFADxV+jxJ5
         HrYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqYfGWwlPsTvJa6b53Ap8YO+tDuwvVUJ9LHM8tyuN4MC+TLRtSDWl2ZFlv5BH/v3BbZOorHApQvxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aJUb1heMBRHQ+I6av0NdzMXr0J8zKbzlHYuQx9A8FrVBpTNj
	F8lCs7AZsg6DdJaXXqf9+dEjQ47F8QFC64nhaMM/sDEiQM3yTR0XuybKovg5lZT78vTyDmIzV2Z
	Ov83MNstcKT+BdN9xFiTc7qfo8eUX2XKp4xKjTRqApAFkyxrNAo1tBmvq2eQ54XY=
X-Gm-Gg: AR+sD135V2OmQXV5hItEofFKdI0GA45cZqlrXkA1CC+4SiVZfrwvZ1WFVai3ucJ/aTI
	DPMHnW3ewo9PXUKkcz+lanag9d8dMDAW0E45lef0UCJc4TSNccrEWuUSINMFdW8NHaaBr881iNP
	XYRZQxgg7+8n55EDHzAmwDg/ZZ0b73lvQKTsXiucq29MN7Z/btOkzLHTj3OXgVZjzBw4juWpRMc
	OGofxOeA2rGcA5TZG6h9K5kynAo7Cpsp97zvvRRgULlX6LfZcqXGADn7494LF1f5X3Zfq23LSHO
	KljmhjTjliB9ULV8Jg0OpBJjG6u+UhhPWqDqjEQ9vk5zeE0VXCkpk6lHZNfzBwEc8ldU7bZbkDj
	Bi0E6ktER0+tDFsxWTXl9jrSKjX+yNinfvXMkDXJaVvh91QrOX7QwO/SuFQ==
X-Received: by 2002:a05:6a20:6a21:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3c6c7b3d0a0mr1108962637.5.1785184117712;
        Mon, 27 Jul 2026 13:28:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a21:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3c6c7b3d0a0mr1108941637.5.1785184117159;
        Mon, 27 Jul 2026 13:28:37 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc415eafsm35949179eec.7.2026.07.27.13.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:28:36 -0700 (PDT)
Message-ID: <477e6f55-d6d7-4a30-af28-dcee185cfbc2@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:28:33 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] power: sequencing: rename pwrseq_power_on/off() to
 pwrseq_vote_on/off()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, imagination@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pci@vger.kernel.org
References: <20260727-pwrseq-vote-rename-v1-1-a2029aeeac65@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727-pwrseq-vote-rename-v1-1-a2029aeeac65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K8lV0XE9Fjp6ZOWl9ypUw_BkvYRYYvj8
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a67bf76 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=u4B4c_klvyXDgThYlB4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4MyBTYWx0ZWRfXz7J0RjNlF2/v
 e09vugHY7otVKCIsbbVeK/6Al3WrQOF3EVITCOBL3ngw0J4busZuaIrUeQ3j2vOq0bMyg7lgNHa
 6ky3K1Bp8Kwa8ndF0ZUdxs8QBCF9/qQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4MyBTYWx0ZWRfX/aJORAhsH3hn
 l79de7Px5CUSRQt9qi9w4XmcGk/LdI08QbHRJhmC/rF63mFdWLq61oFCs8+h7iIe9M8kmMo1HGK
 pqnMA6UfL5Sye9ARaqB1zv2CspwPXKnBSd4E3XMIaldRbSvf7edmY1F/y9cxWSWuQn37K8VvWqT
 sKJNGviMYdYhUyLE7FN4LYHTazTYuOAkzg+FHpCejjk9wW+xVeGyzmLSOFnzBWpwTeUwhD2sDAy
 tmgcgrkdSFbHUHTg5W5vyOJCwjnh2Gx6nETR5umEm8zun68L7mxeZ4crVdKsNei1E6e1sYCC6Bk
 eionJz4j+awJ1up5X0wgvhAXgMNvoYtOPMoX2uCTswnI72fb1E0LawqGVMuloYjfiDJzMsO4GWI
 JspVsni/cNogHX/YxypcwTbUWrBxSFCvKX1wcC0skrYRfLBJJlLvI5werlx6/4mZU7sBQ41YV9G
 698h/lqzKHNwf+lXKWA==
X-Proofpoint-GUID: K8lV0XE9Fjp6ZOWl9ypUw_BkvYRYYvj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270183

On 7/27/2026 2:57 AM, Bartosz Golaszewski wrote:
> The way power sequencing works means that a call to pwrseq_power_on()
> does not necessarily result in the pwrseq target being powered-on at
> that time: it may have already been powered on before. Similarly: a call
> to pwrseq_power_off() does not have to result in an actual powering off
> of resources: there may still be other users that requested a power-on
> before.
> 
> We will also introduce the concept of "non-controllable" pwrseq targets
> soon which further increases the disconnect between the naming
> convention and the actual semantics.
> 
> What consumers of pwrseq descriptors actually do is: they *vote* for a
> powering on of a given target or retract that vote. These operations
> could be called get/put in line with runtime PM but this could become
> confusing since we already provide pwrseq_get/put() for a different
> purpose.
> 
> Change the name of the two functions to pwrseq_vote_on/off() which
> better reflects their purpose and semantics. No functional change
> intended.
> 
> If at any point users need to know *when* the exact power event happens,
> we can provide that information in the form of a notifier.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I've floated the idea to rename the two pwrseq functions from "power
> on/off" to "vote on/off". Here's a concrete proposal.
> 
> I'm sending it as an RFC but if there's agreement, I can queue it as is.
> 
> I'm doing it in a single commit that should go through the pwrseq tree
> with Acks from subsystem maintainers.
> 
> [1] https://lore.kernel.org/all/CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com/
> ---
>  Documentation/driver-api/pwrseq.rst      |  4 ++--
>  drivers/bluetooth/hci_qca.c              |  4 ++--
>  drivers/gpu/drm/imagination/pvr_power.c  |  4 ++--
>  drivers/net/wireless/ath/ath10k/snoc.c   |  6 +++---

I approve of the concept but am not tied to any specific naming.
So whatever names you end up with...

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com> # ath10k

