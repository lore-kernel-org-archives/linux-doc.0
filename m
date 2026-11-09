Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262065;
	b=17xpiTO6zawjOUfLfI5rYP0pN/Npi15CfctH+FZ7nq2klazu4rZFTuV4hLpVxniKTrff
	 /ge/EADKzFNAe36gRnSBJql1EJF7QB67fP6NNdpDz9mDhPjXIgvAeRDynKvVi7Um5qbp/
	 5hD85nrsguiQOghVgBsu/KkxA1/65Wx/7LryyMgt6YsJ+CfiSoIhXMIRI3Vvm0wW2gdcV
	 Wui2WQBJ0z/nagf7j+8fzIgWvr8Pub3NaZh2/ZBdb1GNqcLmuRKEYhAmfi+js+4v5d/P3
	 l5Z+3l06WBbZ0tzxROilbNMBRJRjwkMi62zw5VhraXnflVG+xpS4KddqrZTRo19qaYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
	b=ftchYs+bl1gtxwPpiyWnDxddLgxYf/y5Ts/5o4I1XM90w/J51v4ZqnhvyvKGXPXQ2+U3
	 v6Spf5tUFgZqtXTG1t9dsZhVwLK0CvYDsD5mKf2/Uo0LcWEdZrw9Z9FiLRHLJBGl4GfrQ
	 x4DNlP9f8ZFLLt9mGc4tCU4MYZEr5CqN5Adanve2+axyGKH9YZ6ByTM2aISa/ouMtwuHH
	 0H7+t8678tUzW7o1D+4mEPEx3tMKUgSAE8tYs44WzgBFNFiHCyrLxadZhiT4JGyO3wBU1
	 4mzehCRkDrGa/ybN7h23zARdPqS+c40SfgLQ0OGxqR8rFmJOJh47flVuAU+FbzT2n+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k27vhz8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMzEZUrM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCD6606A332
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 22:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCD6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k27vhz8w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMzEZUrM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAP091401243
	for <linux-doc@vger.kernel.org>; Mon, 9 Nov 2026 22:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=; b=k27vhz8wVvvcrL6l
	474K+JnAqSvQJwpwRco1Wu24Vl/Nep5ME71Q9GOO0jRZzox6C6TRlfar/s9scZQ7
	zuITRoLj06qza6O/7o/KjvESXHDjvM/TsyhMmq/+Fe4bgKFtB3d3v45ZD9dvkiAI
	8JNiper23JeS7ZR6dptscHWBxIyDAh9siyzyINiOLiDsCxLc4ggeH+TiTRAggUxW
	jACzqyP4Sro70axn9Gvqk3+WlZL0s3FWA3kcTDzYfhK+c7WsJRUx3tusHxRg1ava
	7lAa74keKoyQ5Rj1tjDDFg/X3chbhJB8ydGW329Jeah4miF9OF6lvJ6O27HNtnpc
	04txSA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2krjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 22:07:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37390b2989bso2438286eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 14:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794262063; x=1794866863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=aMzEZUrMwnW2UADO2U/ixUjBB/Gr7Ue5SOidcVfDFUetWdgBSsmVophpgAU9j9iSSd
         ZPMy44Y0sLrgdyvI1eeeYR4sSO8kMyON/CX0nALVbZKE5WijFY8UhuUZCXPndosLUvQY
         CcjMcncwZtYYmmYjGueaw+H6ebO8j6yVoMGRs5kmYutWy/F8fU6Kim4gjOiVNpscTmOx
         ncw++Qv79AvwnP4I5PjRcupP6rmGwI2e/kbmtfyQNaOs/gJLKngbnKYcqo9znjJi5EtS
         +6eY7cU7B6QZjstj/rqMjc6woxwRZzXrIGnddVWaF2ZV72R1x0/QmNBXwQGV6R2Yj0uk
         HNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262063; x=1794866863;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=chMXqPfoRyE8b64vxDRiniJ+1YmI/oqRfyzDMNdsGc2WgoN6S51f/qP+Us20eBhoaD
         3GgMh2xSz40JoR7S+yyY06djIWB5zTtuROi7r3ikn6GGKv74MDJdhzfkdaU2Ua8Y2PnA
         J7RKtrZcEUKPkFYDiAuAuM9bJhAy0lTQBaBX8qFmtKncQNrarCtybvBNsIFDTaz5iwME
         hu5DlITuKmiLdXRvX8DWlLivKvSmgoSW5g8IgC5vY2TfEgVxPEObcDUc7Ipmfgt2s5h/
         ZfXZG3vJNvbbJ3QbO/l0Tg+WBsqxpN12VC09WTR4z2KMH5Bsfu2gT4aOUuVYomPNGWSq
         7ewQ==
X-Forwarded-Encrypted: i=1; AL+hErHo8bVDl9hGDeYRbjxRWjt7fLejidluYMEX5+oZnjYzaN73HDbsFVS8nzpkuoRygF6XKWGFSoeopCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9si7iGzPZaVoCs+bBkzTzpWY4EpxTnav/gXgTdLHZjNsl2qJjF
	3SLtOo3r4tMD4ikRB+LqKVF+yOuDn/lWZ/mzaE72KshofgLB+FmbJEJcasTZGdmUWGFI0zlrPom
	lAExtaUgimfpIOp/HGQZyj93+98qjelkhrHyttTFWtEj2en3j63pYjOEBS0SL74A=
X-Gm-Gg: AYBFou3lxBTeCi2chAfnReIqoknmcAuaulVaAoAmkXknECyZOPoWZOLDNelCgsiX5Fb
	i/tVFcfmv9gKTaiA6vfGXSCuW1OgdajLgalWR74q9TM9sc4Sen9T7ULog8t+GscLuuuRCyyhNtP
	nOYYWO3JTInkEhga3ovWUId+rCb1Z8aUOwM8jsDMKEFYeqPqNyeoMyP87V59rzH6o5obAXd7f1H
	IG4hlYydvtkIBS+vx1WJbqBdomY6khPC27K2slsPzGl6ju6yr5Ha40VI106s/ikxbJfhEWu+WWs
	9iYUMZfzKIPBYAH5Z7OIVR+ericNG4oEiFx7dAeY6spCrr8qvaFNjEWpEb3RmfB8106lJ+Dd0GI
	oh9Sm9IgBHmJ/dWzU6bwp0zrG4Kga2+5MyFKiwMcgWeT3UhBJox/Q24x0q35lHvQZOcRVm0wkJE
	8vYS34wgoC7V/KqQJuVgjA5CA2Qg==
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785349eec.34.1794262063185;
        Mon, 09 Nov 2026 14:07:43 -0800 (PST)
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785302eec.34.1794262062597;
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm1256570eec.24.2026.11.09.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Date: Mon, 9 Nov 2026 14:07:36 -0800
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
Subject: Re: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <20261109140736.00007915@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-5-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-5-cristian.marussi@arm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af24430 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=4nPJYbkOPloEEcwyAJsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX1dR9BpQFvac3
 26goapTsitRMD5f9nQDcX8HNSUe2pzou9jMl/giczCea7wWrPAPqP7wKdeth6eYXY3QpwFV9GAY
 GR56s09+IGuFn5qHgIlGcTp1TnDbHRx6Cl/Xhp1ikJqoWejYSFdasghQdJIsHlS/VlINYwO8roF
 psIcbZq+0G4w8NiLpCOT03jX4c6RGvZxAv/s7Mu7se4lWmgvDP+ekgbvSko5qoNQyYqeTlearDn
 osvawJ7JSYEmmZD83Ttp+TBRnzX42OGH50xRTIxtufJdlJnnpq/Pin+wwdWgz2KwiUTDeEVdFVF
 dh+Ah37Vs63t9TdtZIGMQwiyCx2GC4hxZb9amUVdmNJ/P+d9QFerNAoX+GwuoXvARfIbcCDLhL7
 AXjGAh0meQpB0DkqKN+qaOZw08b5WnDx57eHMKv6WVH4qc5Jv1mQQHTPs+EldkviSytPUOVh4wU
 K30oJDrKYz2efE0oG+g==
X-Proofpoint-GUID: lxvwJcbsL0kryWNw556vqN40V2cdk3R5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfXyx6p2v5otDMv
 Vn8m8nuzte0GRvGAp2/7d3nn6SgHRyxREFyfCf+MCQdugZPiaURudxPeM/YrZsVlYIKqlTWPF72
 3e5yZfjY2ecdU9phPdNigjmmhCPt/fE=
X-Proofpoint-ORIG-GUID: lxvwJcbsL0kryWNw556vqN40V2cdk3R5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090088

On Mon,  9 Nov 2026 09:11:50 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols to register events with build-time unknown sizes: such
> events can be declared zero-sized and let the core SCMI stack perform the
> needed safe-net boundary checks based on the configured transport size.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - better commenting

A few bits of feedback on the comments.

> v12 --> v13
>  - improve variable naming
> v10 --> v11
>  - account for ktime_t field when checking boundary
> v2 --> v3
>  - split out of previous patch on protocol notifier
>  - use max() instead of max_t()
> ---
>  drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
>  drivers/firmware/arm_scmi/notify.h |  8 ++++++--
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index bc046f2f83a6..a30589c9b377 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
>  	if (!r_evt)
>  		return -EINVAL;
>  
> -	if (len > r_evt->evt->max_payld_sz) {
> +	/*
> +	 * Events with a zero max_payld_sz are sized to be of the maximum
> +	 * size allowed by the transport: no need to be size-checked here
> +	 * since the transport layer would have already dropped such
> +	 * over-sized messages.

'such' here to me refers to the first bit. That is, those that are "
sized to be the maxim size allowed by the transport.

I'd just drop 'such' and have
	 * since the transport layer would have already dropped over-sized
	 * messages.

as that avoids this potential confusion.

> +	 * Note that, though, while this protects from buffer overruns, it is

Drop 'though'. Doesn't add anything and leads to odd flow to the sentence

> +	 * no more possible at this layer of the stack to detect zero-sized

'not possible at this layer ..'

The 'no more' refers to code that isn't here if someone reads this code
once the patch is merged.  So if you want to refer to what changed, keep
it in the patch description not a comment.


> +	 * events corrupted by truncation.
> +	 */
> +	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
>  		dev_err(handle->dev, "discard badly sized message\n");
>  		return -EINVAL;
>  	}


