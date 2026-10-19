Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443770;
	b=QK84SR84eOxRcDqleY0MjqdJNoSrlMNsFpCV2azjrugM/jtbd5paFBV0/TMrJyj762H/
	 LR3ErjCNGR9FlwO8z5NcJ16A+zCp8CjFA+HfUrSopBPZ5xnzIpeq+LLUpnzb+VzyzO16x
	 zpTY4DRviV4+87tzvGvkHOuYHlhmv4JPUeuG+FGmyISofuHTmqGtf4YuV77lIIPeDYUQF
	 NF/hlV3jF2/pwueX49rZT8SlIIztfXeHWZcGgQfp1L9756euMItamRhPOECONOreFoHpv
	 U6ZcE+fWrz3n7MOutQZOHdF21MUZwe53ciwBo49UIpn5dnZ0llYBIzbVdoV0rJvj53w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
	b=5WznekHV2sa6ZlFexGloi0p672Rtv7KLBjj73xvJhyvGBnHUMtE8RLwAuQneIltpTjxU
	 TfPFTT4mxAZHO6obY4leYdP/NBjirEMLYjYV9E+GLskKE7q6nuAIDnSnrRGiNNqhZXh9l
	 bysznt8w6KDspuYgTcNu4khMewRsngiSDb4Oz0f8lckh7jlK0apwdYvlL/4x8ClkcP0mJ
	 IkJ+PncCDUsl0OnSKuE8/XTC97H4Ql+ONIEKUEtI2m9iKkb8ESeQOfY3rnGMtZmKgEa0q
	 0rjZ2/+MPwvRkTEvbgbd3zj4x9F2ywGp5isyxhovR1359eMZgKyM8I+5+VPTMhkLlaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWLJ+KLw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T9P1QfJe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6E606A31A
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWLJ+KLw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T9P1QfJe
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJKCne3628160
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=; b=iWLJ+KLwsyLtbo8g
	7uhBHNgEeXH56UX1iDgdr7ckbrl9UcP8hYvhmJnWZksrEdLRGVqd4KePkrhgBJ6a
	9/4T9I4HH+fVyfRKhXGGs8ZUbEUtH7qPUqi93fcBXiTQSw+1ttJ0J5IUeMhne+Jv
	o9z2umVaBQrwb6IDHIwqLQ/gqe0KJVmbPZ3dMq75pfL9gLthJXupNJWdCdG875jo
	mu08ain1Ki9lDk6XdIvQS9nkQ+5BaDRkRcQJORRr27XVIs0hDn0iKwKh1hcTsAVg
	6z7QllGcKXJzalgoqqRlJ1qq/DlC+KVhwj2MMIqnPcMAymgNX3TwJyeMfatct3ud
	OD6Ebg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr42gn0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:02:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so5049209eec.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792443766; x=1793048566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=T9P1QfJeA0AEZqWL4/CDf1T/nxPV0wWEYuvfOMiF0TlNZtef/BbqjlcHotgMDr0bHu
         A6FK3dIEkjuav4cUvsCJUW/uDii5pQ16Ql7bG9/IVBqTccztDhte+7HlLH1j36NHcpNq
         Q6z0G5vfTIFofDy7EJraGk5smaEddgw41DY/kQCHJ2g1eMmASCYqaccGDTvJ+dADRJ6t
         QbLFwi2AzZzuqLRKt65+nm9PridERzZPjOnQYdjWRgb4/AToCGzgJ1BmAmqYzGEalhVb
         md7sDe9ExJzUD97vVBlxzNdYiQ2EhIisn7qgZoKDQFHg7wSUGeqMTsig+drMY+nC4chf
         XkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443766; x=1793048566;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBwZx726/9ho3XoZMIYvptvPiQNJGceesFvYTKcqywY=;
        b=lgBy55DM6j/19t9pVqZefbO6Ux88ac301JJCuveW4tgZrV9OtA09DaagLvLh5VW4cy
         vUWDK118Z+7mAfds+zNiXhbc9c2rO5g3aPYNewK0P+4yHmAVk0+X/axwfm9AiMtp+46e
         S7ULDQkR2MdIjF3ag+6ed2VhdlRt/Ze+l5sa2kk7FCAS3OEIC0wXlPAU8FCk9qlDc8Y8
         mUcgenBtTiiAz6o6P1rV8eyb5ZGGKyCbTupiZJdQSHZ6Io900KFGiynMnnog4xL+ASBa
         UhGYMWdQQ6wO4fkz1viSq+OSp5t5kMI3R9MHMYmPPuUExQkdBtYrLeVE2otE2h/Vg3eO
         OFmg==
X-Forwarded-Encrypted: i=1; AKwUvBz3ivyL+pMFnylQJ4mWs0MmwK2Jh8t8LyDumKRIibUxG0KHqXK6MYW+gZ7czK1vj75TLpSukj1KERQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjkoVKe+Ak4wa9NLywGoA8s1g5pf6rtr1Q9VCPkCfjG6XMugK2
	1eztUV1UmnUawOPrsKtXMt73qwjnikTowsFZESnHuxxcoFpHkDbPIGXPYEQLd3h1VIr+MgOVZm4
	yBYXLP4rMWNsI6YbAaJfhcGou9entQLWdzyUn95MvNCPA256lrwyBIn4rhadeVm8=
X-Gm-Gg: AYBFou1qIrAr7G3lUWoSdkTEoJWbQycjggMdGkE9nwMTdEteSqBBHb4Fd9vZWXT+SPM
	CbRaQm7t/gKRThXpgrBhmCSoTp7FGPS52QDL0fTUwAK0UVt2IYlUQaTY8mVDDkfaWhGBbUgiLH8
	ZcTFB6deobvY1FmtPdSrsvgBmI1lvQesZnUf8KMuG+tlZLiq7S5uCzDfO3jzjm06lAnJm/3sJIl
	h2fbRLYVtY/I0Vy8kKgXSX+LQ8wI61OfMbyHHmKQKLkbgUnSwn1KA2hkeOY9JVUNOXvWxR1dPg0
	vi+yDiMOJuS3363PbCYQwZaXNKS7H07W4mEa3ZIMpsQRnMFp6kEOsAba4hyBD51eVN8X6nU7sH7
	bQ2khhL1R1tNwPKAMRItxng5JRd7CCWYNTeK67zRk7g==
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr12732308c88.20.1792443765789;
        Mon, 19 Oct 2026 14:02:45 -0700 (PDT)
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr12731519c88.20.1792443735366;
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm32711150c88.1.2026.10.19.14.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:02:03 -0700
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
Subject: Re: [PATCH v14 04/32] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20261019140203.00000f2a@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-5-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-5-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX4w9RiTJ/lHdS
 QDmFz/8zmFiXTuFpRJrfmJ7SNqUYkC+KUG+M5XAalu8saoMBImxcNFvKpzQC2BRtcXlgj2Jd0dy
 zFMNP4qGUI2gOQzCpNECYI/YtnsvmtIs8nPhiLxKwTVNRxRm0qIvKXGUo8zIrtgRUe6IJwqH5BW
 9AIcuRP3i9F0bog5HAfXkf9D6b54qq8yhpMmfwzdtUVzUjj6wMgmdFEiw4MJytogwPiZO3dfMjM
 x4OT0RFlUfPyVvEs7E/gVECrkrTghOu1EwqvSwr6j4/ekVhywcAwyj8rxQzr0P1FXXpOanc/S11
 0rbeMs/n9eEpLWd6/1EpWbWOFlPz7x6KRgS9bZhEjpNnNXOYVHiHbk00b0yTrS30AQzOPTyQZXf
 0pi7uUVoZtV30oNkuVIdrGFjrrDjtg==
X-Authority-Analysis: v=2.4 cv=Ve9ir1p9 c=1 sm=1 tr=0 ts=6ad68576 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gIk6nJaUoXxf6RY8mAcA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MyBTYWx0ZWRfX36+dUl9YekqR
 hXLxoaiqmicLOQYK43uH06B8Gi3V9zVZZc+nuNNQ+hNXiPWa3GOJ8gEAHUXTmlChSPPWFRUTvML
 PbwJcIhirbzp7JPLxONE2c3o01YBHVc=
X-Proofpoint-ORIG-GUID: _Ok6P8U8YLjq-k7Cdfku7BxHaM4Q0wHn
X-Proofpoint-GUID: _Ok6P8U8YLjq-k7Cdfku7BxHaM4Q0wHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190083

On Fri, 16 Oct 2026 19:55:25 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.
> 
> Some protocols like Telemetry, though, could be interested in enabling and
> registering for such notifications: in such a scenario each initialized
> protocol instance could want to register a common protocol notifier.
> 
> In order to reuse the existing SCMI Notifications machinery, allow
> protocols themselves to register for their own notifications and provide
> their own notifier callbacks.
> 
> Each protocol, at the end of its initialization phase, can now provide one
> unique per-protocol-instance notifier block, which will be registered, by
> the core SCMI stack, on the related notification chain: such notifier will
> be automatically removed during the protocol de-initialization phase.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Whilst I'm not that familiar with this code, it seems fine to me
(i.e. needs more eyes despite the tag)

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
