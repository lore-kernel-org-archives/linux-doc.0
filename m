Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561725;
	b=m0TnR2+q2KQ/+bLZGJf7hMPqeKdhubCsiXZr+eml0FUcFZ7t/HaU7mfVvk4spmKz9ymy
	 Mk1ouuendDOwUXEvy7SdIe98Z9VxQOPsNk3RE/yEavPsqAteGZ4qKyZuLEfjpNHF+404U
	 s8XaBVI7JRg2Xbkfp4xnfFUHsov0BHdYyVKkiszm3Q6s9YwWB6/k7gjtsTVP8jY+UPSV+
	 cJBBlh1gLj1MdjSi4xev1ngme9PzGHZVXXL68g3FU5mICjG1cE9q5PGdmGJM9VM5K9nPH
	 wIiXndTI0b88OpfdGqBfbRS8ORO+gd0NuleoPmbGjO5hmCgOQBj/sgN7l36kygeWa5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
	b=rWkRgzpjj0NVdbLyQKw67X6DL8u20z0WsiPXEIQoaBJoFNIHVi/9NSZqXxFkK3u6ArBo
	 WO3dxPFTvrYzG7kX+UwULoKfyqWXMX83asOzWghIJ7JYWNoAzZExeDvonpAZbpBZgupoC
	 j6a6v2QMxkJiuNWdabyhtI0uUwBy7p214P/tU/p2g8Ymps5oLjrwGOI7JXy1R9YQTs+1O
	 la/c2k9+QQweer14pPpIUkFnMDJyXK8EQhiqYS6BzJXb1RQ/OL4Pw5G9eec2eNCJkQYN/
	 n1i7PdemxtHG1ywD+shUK1WIFLjQ9+nzg+1FCjYnL/eBmVw1jtZGzyJn2IizWAFy0zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="l/iJIxEt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cq7fFDA+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216C5606A326
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/iJIxEt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cq7fFDA+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb4IJ2656345
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=; b=l/iJIxEtbXhbrUuQ
	a5cKBnFyYsoSufAs/EVmTOrxwpo2KYsht9Y9BZN3+1deUoLwxzBSesaEjq05kxOx
	bT7LVGB8NMr1jjmR2+HcM4E8mLnKHerLEPJm5UJO09RHriIu8akQWBLHqIt2bH3h
	DIbL/4Sf+2cRmsieezdoVMijLVeduOGLA0hS+/5o0rVpXSF9Ggee02GKP4mL9YNX
	AfFyD8nKnOdSkpGaoZwKXp+eyeslAVKIoLpeLFjKpODXbpPM0weemVa+rJeGdnWk
	KVgjJGjg0Mi4NM1bjHvL8xZGzLgOIvwgYsgAyCxj3nzvQWsLmqSH0IKjlLdlPn25
	RZscBg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b802h9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:08:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so7984167eec.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 15:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795561723; x=1796166523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
        b=Cq7fFDA+6Kd+Mlrz/HavjzL217sXGedSVjL+Yit+0ZUakI7SYWyf1WEkHBeO3xYO7v
         NxJl4H3Cjr5KyzCUt77oIY/gX52aS53qHi1lMZOgp5ZjwmHN8Dhe1Cbh3Okjtz7f+vx2
         J9I7trWKd9aG68BghmwVEjW0iiTPsdBoi/E0tieaJI/vZnM8NSFXFEIqtqLx+zB38JXR
         eRFXWGral2gCRnj4P8zke7Dy5tN0rDh7X0lx+CnoSLIztYpP8ZAWHF8BLV9Fw/LR83bn
         dmbz5Kf3zv3SDCA7EpSqKr3F8ZvNrzFv5BR5HgDO7wRbC6b/DVfmqPeS6a1ny84+xr0W
         cJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561723; x=1796166523;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
        b=a/GWOC6EEPzStCPIzqgHxdg7dVVt7as6Ls5QSioQ8e0jm2/Hdb8lcmgFi+fuCFbd/J
         VSU/+W48ZpA/tctCG6Msb7JU54kqP/F0gDk/FX9vxGKyRQFgB7UuQ7PWG1s+QxCkIZE+
         8zQY/CS+j2Kvm5YQvX65CXcjPEW2LkWBcZmUlOn6F0Bfh+N4Th634U8ZhLfHox17N9hg
         TS0jF1qJk5P/ovA4iivcwhYI7/RARUzG5E559u5G9xU5vS1G0yZDeL39x0BC4i7UioiG
         AbpIxuTfaSn2XpUcLnu6QzzpiNvMOKYXX6kii1/YkpZdIezBYbw6GIsNQwQgF982jGC/
         yEYw==
X-Forwarded-Encrypted: i=1; AL+hErGO4dBNxdJP3TQMVIa5ElbOU+HT8msrwAZf2BhZWGLfHAb8D7DgKMSpMhHTQG++BdebyRzJbsxaEMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+szQt0GXf8u58zMMczabcj/qZdIwZVR8htv05dEKueMJ3FKX0k
	zJLKqOR4jbuw66vUMfZnoVZBA9xwpZ/F2ZhPYTnFrvAYfvs+QAzn9P8xCAFOusNGfjJQchmKEay
	pBUrS8PXuJk9xx7CMLkqOAHx5j3jYEwJm2hVKv+wLdBBjQOropiRKvKNrT3GsZ1M=
X-Gm-Gg: AZFdTZdXhgGe7rRnABDv4dGYidOoqAX9uQfGl0iRjnwXPM8ryxllFkWkWFy1wInwv2D
	6NSzACAJc56AN10hLZGh3wpTW6qJKj7fiCEP0vHRHjVcFmZ+IcrnR2NEGyWRgOqDDV/aAggVJtc
	m2BO7ocBUIWFoFmQZr6NL+loxCT5A+yv+6PzwFLNt2A7qrrRD/H88QECXKazHdUB7OldOsu0xkj
	tqsEhzpERMsMm+p/h69E5EqAN6NcNJn+rpEmUg0RGTKfrwiNI+sKtmMXM2X+kzDMPa28DjzOAVS
	B0Tk9Se98x7pskQKlDChW5C+WJ49mn9LoZIkKgk2uBk39bHtGFBLNkW02zAhrxPWFJeZKG7Mz/1
	DyKcK4wppdzjgv1Eq4/q/J2a92KikKWAPTvddRAsrihaxFkYpEhaDbPtDygcZoevWoDMSDsoBU9
	+phc9jHheDxJQawY8Ac6UtKGyPfCX0
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr15352953c88.12.1795561722525;
        Tue, 24 Nov 2026 15:08:42 -0800 (PST)
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr15352913c88.12.1795561721846;
        Tue, 24 Nov 2026 15:08:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm55030717c88.14.2026.11.24.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:08:41 -0800 (PST)
Date: Tue, 24 Nov 2026 15:08:35 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 02/34] [RFC] firmware: arm_scmi: Additional
 iterators consistency checks
Message-ID: <20261124150835.000060be@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-3-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-3-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX4C7kboxMAUYs
 nyVD96tcWU/Itbc7kjUgwBVHwbaBGDtzuG7PERmgUit79M9AJN3N/NXdQqxnsakTbYMjNsPmy2i
 sbchXGA08+PujVYHNGrVl/VakjxZKGEuuicoY3g6bABg1lDrhx2m2hXjZpMSUsNBvJDYtTF5lXX
 F5DVjdnBsTQIVsr4X+F6wWi7SNjPp21ogMbKI0EvYwbgXLsdUyZwzOKkjM0zD2+sNAzQvmq9AN6
 5O/KOk3rIgYkDdko1r/Ju37VvkLEPAoT16k5C0qi6CqFnO8iIcJbU5CoD9NfW89aSGFB2IY5qXk
 bZrCUc3cbGKW3zKcU8uTeX/jd23Qt9+JowuMWKVCxEpGbHVZ5dGnK+VEHryUckLdMf9rcm8azSH
 rnWwmPKmL9pGpIMefDUli2NVfSmFDqH/DdjOv6I2DDGDrHx8/RyBBUmWnndAqfgwiI0LEs6LxrU
 sdgJALK5k88V3hMaO2g==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b0618fb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=8EtlKy0l8xtiV7R28LgA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 9TP_Wz8-r3MbvoMEGzmKgOIWpTFymeTC
X-Proofpoint-GUID: 9TP_Wz8-r3MbvoMEGzmKgOIWpTFymeTC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfXxtw1kuo0NyV0
 wLsLwQCgCmR0p1gQj1qahFsRIKtjXHXRkEYiLtVDUfgrQn8l5rBLJGDA18bfXQubI45hgtOakZS
 qU7eDu4dgBsxFrWLguvlCpFMd6dzvNQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240091

On Tue, 24 Nov 2026 19:48:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a few more consistency checks around the number of returned and
> remaining items during the life of an iteration: this is useful to spot
> prematurely terminated iterations that would produce shorter than expected
> results.
> 
> Handling these anomalies in the platform multi-part replies within the
> core SCMI iterators machinery avoids the need to address such issues
> multiple times at the protocol layer.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> RFC because this is another fix that is potentially disrupting for any
> non compliant SCMI platform deployed in the wild.

Looks sensible to me and cutting out weirdness as early as possible should
make everything more resilient.  If there is a broken implementation out there
(and to hit these is not definitely not great) then quirk that when it surfaces.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 36 ++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 55d9cc487916..6dd249c08f5f 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1852,7 +1852,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  	const struct scmi_protocol_handle *ph;
>  	struct scmi_iterator_state *st;
>  	struct scmi_iterator *i;
> -	unsigned int n;
> +	unsigned int n, i_start, i_max, i_returned;
>  
>  	if (!iter)
>  		return -EINVAL;
> @@ -1862,10 +1862,15 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  	ph = i->ph;
>  	st = &i->state;
>  
> +	/* Initialize iteration counters used to check consistency */
> +	i_max = 0;
> +	i_returned = 0;
> +	i_start = start ? *start : 0;
> +
>  	/* Reinitialize state for next run */
>  	st->num_returned = 0;
>  	st->num_remaining = 0;
> -	st->desc_index = start ? *start : 0;
> +	st->desc_index = i_start;
>  
>  	do {
>  		iops->prepare_message(i->msg, st->desc_index, i->priv);
> @@ -1883,11 +1888,34 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  		if (ret)
>  			return ret;
>  
> -		if (!st->num_returned && st->num_remaining) {
> -			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
> +		/*
> +		 * Initialize max items expectation for this run based on
> +		 * values returned on first message exchange: during the
> +		 * following iterations consistency will be validated against
> +		 * these parameters, so as to spot FW anomalies like sudden
> +		 * termination or unplausible conditions.
> +		 */
> +		if (!i_max)
> +			i_max = i_start + st->num_returned + st->num_remaining;
> +
> +		if ((!st->num_returned && st->num_remaining) ||
> +		    (i_max != i_start + i_returned + st->num_returned + st->num_remaining)) {
> +			dev_err(ph->dev,
> +				"Inconsistent multi-part reply. max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
> +				st->max_resources, i_max, i_start, i_returned,
> +				st->num_returned, st->num_remaining,
> +				st->desc_index);
>  			return -EINVAL;
>  		}
>  
> +		dev_dbg(ph->dev,
> +			"Multi-part - max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
> +			st->max_resources, i_max, i_start, i_returned,
> +			st->num_returned, st->num_remaining, st->desc_index);
> +
> +		/* Account for last batch received */
> +		i_returned += st->num_returned;
> +
>  		if (st->num_returned > st->max_resources - st->desc_index) {
>  			dev_err(ph->dev,
>  				"No. of resources can't exceed %d\n",

