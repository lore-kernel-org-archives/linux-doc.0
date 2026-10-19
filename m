Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442101;
	b=pJilEcwRqMkXyGfem+lN/ftyLyqBqJw6LW9tm0u/7XXWD7kIYP6G/f5gombcU9BEp9Rc
	 t1qXQIdTZrpDJZE+RuhkpjQifagMbUCd3emqWlq29A0vOndiLCXDPRAQPFdviQGMDATf8
	 EhDu/1bh+u57ID/ANy3aEiPSa4lwt7n2DzTLJftfK9fx1u1s/E9rXiDVfwmCwC+qEKk+g
	 QeLtb+2Uq2o8W5R70JnZ45kim1nMU2Ej4C39U2X1omCpoEYUdSKgPSzqv31iei3wOUm7e
	 NgeajpNccT3XX0np6qA3v2Mj4HiVhCMs76ixWUO0+U/oKpaDbxFi4Zt+9lbCI57jkrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
	b=0UoNTXJ2KJNgPSnsqnrmN836znYNAJwMwYnEVZkSY613LfbKNNphia/B7w7TDBg6/qfu
	 oxXBInxYt8AHXW6tpEw57mvSiMBp4dpPITzo+u3rd7f0BmUi+CvmaMwsSwtEKfiSo2EXh
	 H9SQCi8o7oz4h4gslDzwzRBnFtV030+jFgbmbLIcs2sBVxCggQ3SlzMRprthwrD07o1LT
	 Tt+UIzAXUdRPSE8iALBTAAothcXrplJjQafBpZ2htRsjXmbB1VJ/Bxo79ZCOLM13H+KC+
	 hlOpT8kOjhOufbM05zWpMUxhJ8qPlF7bTDrP/9BtE0mQJeznE707iP0Ys8ljFItB2jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a48FjdXZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bMrzkhMb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3779606A331
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 20:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3779606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a48FjdXZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bMrzkhMb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJK59X3627975
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 20:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=; b=a48FjdXZqNLtjTFD
	iyc/k0OfwXT3cpSVDLRUGRko5vq6AuZVieFgGNU2Yv7ocQQ9ARRhlC16fynBejck
	NAkck9VFRxTb8BtGNbgKiy6lfCF/OIg3W4i3UbSbOislRk2FK4XaVAJvrrE1BS1l
	MCEc8dDHCfv4BDykfD/qinKWyFygbfoO1SEpZde9j4nCRECqW1qLjOvsFDFa7bwm
	n01RV4pK02kAnbEcnD84ZQA16lVDqu9rNl1/2R5UqWYoZOiEheVeFZDjXx1PTEE/
	1hnhrh1a+TjCOd6+zVwpHnzA2EB0RUwUx4Dx1Qe7HbRCKPPkace9fz9NkVrKls1b
	rfFPyg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr42gjbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 20:34:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso3696761eec.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792442099; x=1793046899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
        b=bMrzkhMbYN0Jau2w4HqkH2XXtRi5Q0LnaaAs3po182YjBnfwMgx2JDfcuDC/excmmI
         tGDnJtMaVc7gJp2WmCXc1v3E3zljZpz1KtYt3dArusGzfTonFU528h+LokoqEFvJ4yfT
         29w7oX6TAcsBGBhIqvVYN2PcxzR1Azr25Vmy1MecD+7yZCEc5ArHT9t25AYuD0j5w/u1
         i5hzkjdGgQDj1PUmhyGBafea6sILD2Tfdzl0p3IDJ8hzTOm1LktG/vb0GFx41Okfwiov
         Gqy4Fu1TZkA5Y/ipE9opZ9z0wbQFU9GZJK7B9TfV2bBMysRQSaeeyTWwF5iyEuzoaXfI
         a1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442099; x=1793046899;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxpI/j7tSygFqEOcpnrDp2XkhyVuL60i0HFuGyDuJN0=;
        b=jWT0tUIzHMzJr/xa0vS2bH+P5LyMf8/XM1r3liJ0UXKIuFZKIkMc9hm8DEzHprMnK+
         wXQ73yWAOEN83ntLeAq/WtUZBQdLEP9xvXe6SqJsMyeWBBaiRvaL0tBTBbfQh8skEjgh
         NnsFIbaG+44/+Ec801xAjMB+LHHG0dbrX4yXL4fVYfSD/xxCleKW5ULWLSomyQvzYUlR
         mjJBenopzVeIXYiBty0V1SQLHBuOERIfyzDCnYs5DquJqtCALhRyEI+dDXmQor8aranK
         sumYkaFUGp19butidSYnV0gz2O3YT4GODlFcinYScooAI2zAav+arsZoUk2CVT5n87BE
         6mIA==
X-Forwarded-Encrypted: i=1; AKwUvBxdcpfQmjvW26uzTqUCmdfmhbERQy8RXAMzXKzHN4fswC3f+W8scyMIskFDv61YMLHqASDLCf6P4mU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK31U7Budu9RI7nfVrJNMzoWBiIAp/XULY35dAc1CponpMGG4wY
	fHNgZjH5qDyFGBfpIv9zGf5nmTL3TMQpFvp/vuDgNLBNKiGVCoLkTrpsay053oy4jUE5G00DbCc
	mEbQLoyWL3wpxSGVOpKwS/3hy1ZySCj+B+rQteR7k/OWBVJeumJU7b1MyJ0IdkU0=
X-Gm-Gg: AYBFou32gAucQjX/mxg1OnSIYVEdj05rlaufrieI8wvXMSAvleS3qFlMrhlSS4Z6wzh
	1PXIhAUd29d+Ni1oSYq7tqcuXhgEpXH5UOlLgSVZP7F64lL5G/hTW5xuRpxQMpdkXi+bsg5tY1+
	FK/Z37onoAo/lQfh4mUiN9O1ZtWnOd4JU31CdH2I1CopDW3ac0nAmvkbuJ6v+7olQ/WOP2P44cY
	hV+6CrGN+r3xIaBmBHLZVKQ04GdQGt6j7C+/qU7SfpkQp1xGlDnTqpxzC7Trl9ajUG1/vwO3yAM
	a88a15ttRUO/cf2eqNeQH7RuRPWsbLTteE6R5JUqMI1j0d0BBrVK1HimBeMlRMFADnKHPkHj1Zr
	V+x6LnEtR00/kG18G8qKOR/6p/NVu/Kim8QbChPpHLyM=
X-Received: by 2002:a05:7301:6447:b0:359:2729:1797 with SMTP id 5a478bee46e88-361a224d1a7mr15667668eec.30.1792442098789;
        Mon, 19 Oct 2026 13:34:58 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:359:2729:1797 with SMTP id 5a478bee46e88-361a224d1a7mr15667603eec.30.1792442098201;
        Mon, 19 Oct 2026 13:34:58 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm34045005eec.18.2026.10.19.13.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:34:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:34:36 -0700
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
Subject: Re: [PATCH v14 01/32] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <20261019133436.000035ae@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-2-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-2-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX/f/i7SDXSDDE
 FTBBCfgGBSAHCdbLFvLP4ICrR0OXhL5JBaxDded9gFi4OJerpWqXBUrs682GKEdekgQ1Xdw95dh
 8ZtBkjNYfEFAS6D80Klap1DR/4/qRCEYHBvPGy6uoF5xJQx/O5s8rUMdI1aObn4JsFX9cEaB0OK
 wudDFQL9CAIwPgTDX4+ZGy4949dOZum8FMUlFSJYIaBc1xK5f0hnrgFBQQ+9PA/LJ/jajbPXFkY
 Vy44NrEtjHhC7zmWAUKghAzvTCSmqGKB9Tldf/poF0dZR6HQszO4U+7bddTduN27HC60V+9l2/B
 OCm+c+gJzz5d2tzrVnBW0EeEjoK0rLZO8Av+oTyN7+/368rOWm+9jAUcmwq8xup8BxeeM609V+Q
 B182b/kTuv9+EB378BLtK6fFFClGAg++0Ij1n67KpkwIMZoK5G9iYul8nhnyg3CK3ISZktJAztb
 xC8CCfVEamBH4R7b6bw==
X-Authority-Analysis: v=2.4 cv=Ve9ir1p9 c=1 sm=1 tr=0 ts=6ad67ef3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=g_d9z9Baj32627wmS2EA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MiBTYWx0ZWRfX1TlDPUwW8laN
 1AGE6Sg/rUqATYsUSg21hGQtqmsHVtWgG0O8I5AvQJupZrMzn8Hl/gDdeUKyBTf4eWfaoNNlxoE
 f55Hu4i6EQcANNPuq4qhzYm8XlOj3QQ=
X-Proofpoint-ORIG-GUID: fnqt2Oh9sA3GoUz7fX96VS08a9XmyfTN
X-Proofpoint-GUID: fnqt2Oh9sA3GoUz7fX96VS08a9XmyfTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190082

On Fri, 16 Oct 2026 19:55:22 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMIv4.0 introduces a couple of new possible protocol error codes: add the
> needed definitions and mappings to Linux error values.
> 
> Note that SCMI_PARTIAL_ERROR has to be handled specially, so it needs to be
> distinguishable.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> ---
> v12 --> v13
>  - use EBADMSG to map SCMI_PARTIAL_ERROR
That's a stretch given definition but I looked back at: 

https://lore.kernel.org/all/arK7kLlrg491EsMf@pluto/
and appreciate the problem of running out of error codes..

Guess it is the best we can do,
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

If you do a v15, maybe capture some reasoning in the change
log or the patch description itself.

Jonathan
