Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560889;
	b=aXeoQkuV8ivCpH21wdCHZWcjBSMsERIfhpKpN80vDTglnoZ7f806pj7JUEn65uyu4CGd
	 Si5WhG86sVYRt3l3kQKDsoL5kZL4l3Z/DIpeRrxA05Bsq4Phu0wkymowWY8OdsD5maO17
	 ++SOXVIBn99dBb5k26XU+B4e4HyVQO+zHSiRJr60bmn1CiPl6sOTRzpG5bnV2xWvgv8aH
	 mMRjnhSCpSugDoDo9fB1jiytQmQ1GEyZ9d6CxtAdrwnPj7lJvm6cUJAQ+WUi/HssAYcOP
	 R3SNh3l6rKfFbDDifu3EdMhX3qn6AhvAw3wNSQcZ6kyNpqCuweARO7mJRARZyvwL6pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
	b=lBxjstf005obctEdmrom2IDRnyQk2WLtfVlOQ5qQiTVxRb/lmuu9QcK548fw2EhtfZrD
	 +uwSDimjIwE/32/xmw3CDujzB3nvh3ZfYz1Ingr05azUr2z0foWo7MaohJ0PDOna2SXKy
	 NqQwE9/QRLGGJEpuPYQAp7xU4gc8o+6n6QdBmPwXItyMlCU4m8vrOdg0Ag2ZrFkyi2Bl3
	 3KFX4N/umRWrVC4VF99F791nKbJNOmmpRBaxTqNsGB/pZPNcORTbvHZ4R230u7NchlfBy
	 CBBLRPexhfTSlUkDmDJqkQJZB2kjyAE9qoh9zcpyILKIjxj+NcgoJyljXyJ9OhNXGLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="V/w7y3um";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oses93L2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861A606A323
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 22:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A861A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V/w7y3um;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oses93L2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMahZ32170327
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 22:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=; b=V/w7y3umcyAD9MIl
	VnL1ez7G5fhzewN2uskuv0SPL+7FXEazH4JzJmpVog2kulJYMyAgFa1u4PSpwAqZ
	oSm4VFbgDw6HEaVCYuj1DCfsMAfS7/vVEpujX7FmskO6h3wndc/zLWmCKC2xl4G0
	WRwJFY7/UAOcxMedPFycyUpcPX8fCiTIR6zp1Tddc01VOInHgnV1crSNkNDaUUi5
	UFlOrKHu4002kc5CsA41Z/uS256uKowa8Byk7CyjX6jc03JgYrHj0Q1warQWIs3R
	LlmEUMerP84BYiKvXumNjvkGCgwGY7yq5Ifw9tudErkV5hlAmHonniuUO4yE539K
	tWoLGQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpm9cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 22:54:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso5731804eec.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 14:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560887; x=1796165687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=Oses93L2JMO5dpD3s4NITc1NBlis4TbqT8IYENTNYIgsvUgRv2exX069rGaj3GPkAJ
         /+mC260/t9SfZ2wVnh1brZNqemaOmGzJqgpNckpIjGBX+FSFRZLq9KRqrs6DSIkYbTUw
         aG25AkT8PM0phEWzeD7dWvzFlf+bHBQsL/b7QstRvrNu+pGlkWYqUfEYDWFGMHSyvH7k
         18rRZzRwp5f+5yvqXH/I+1AtBh8Uj/5Z7pV4J7tL1FvV31xPsO90n1WaIN0PC1jpckME
         FPUHRwssyMM1srtPVOIVSa0QZAMyKQF8HwYOHTUaYiBrgb9FdGz1ws00NM2+ED1I01+t
         V3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560887; x=1796165687;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=ONFVwN8j5w5PhK5xAKLCQdTmAdkRpw/eJIk0MUMDcvdo3C0hoFaNNGMCVidgZkvivk
         eq75XhSH48yRLgqauI4PfHcqn1yF/Vk/qd1uCAhBP6OSPSq+48qAoXhyv/9dVBAh2aU3
         qo8JBdzjE5uNKYUeiuxRuj5x+0xukxIrdW0IBpIvse7gdLZjsgXTDGgtf96XMpPORUYH
         QeKrkVfc5Jqqs0TjDc4FiEMSA6YmmJdlQbcrQixOh6+oX5AGc/gduSUsz2vqa2e7NuGr
         DJfIrrEz1dvlQYLk67Ui1h1T048oaT0qiJAIG1Im1msDt6L8+Ba8FJFgbA0s+cybpm3B
         Tfog==
X-Forwarded-Encrypted: i=1; AL+hErGg20l+zaLaijJQuXqkWnWnOSmDR/JCIYcpAUI3KXOlH1cKGtOg2XPM/xUdhjUlA9FOsa/Zxqj+kJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82XQPSxoCgoXdsCN7gJ48uIqFmW66ID0fzt0TSuqNUkjK/qUrF
	D482LUa1qJjhy5rceKWHQuHQlOL/HNcx0ieMuFA94rahwq5htyvGHBFWJNegx99ZLNCz0c2OCvt
	3A8piGmAoBM4dz6minm1fedIXSc8Y2KFS8GhS4VW9flHu2TumTW7Q00m0lKlpe4M=
X-Gm-Gg: AZFdTZdJzGkG4ea4ys3TYIW/dPZT9wz3Ua24vYvNQ8H+fi/sVB7dhBs2OxH+MIkCiTQ
	udISxBbbbVltP8HP0FmkywaEopwRuCohMThAyt+0uOaptyKlEr+5iHl8v9yL7Pg2OB/YKbKFb9d
	UiouRwcg8VmSMlJhIY79bNWG+LK2VZMdcMTwW7Fvt1wDmZGmaRZ6qYxmS/TWJlbhe8szglEc29B
	x2D5Vk2kGHxjeLPfLNOgXDxnTo75+XCZutEHyc05DSUbVAx9N9BIbu+3LLGRxAG279hf4MRUadJ
	fysQ1Skt8f3lgKEtPaiOplx+SD321VXp92L9HluX1Ehzd1SK5SlisL49xuDF+wUfK/IucHzSBhJ
	MvSwC6GLwM86erPlfbo+uiW8KUS6Vkg5DncULcKhUpDu/Cojh+Zx4T3SRR2ZZhCqgPz+x2jpNdQ
	0DK/N2LvVOx3isIzzOgfUiS2AsyUKy
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710288c88.5.1795560886627;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710269c88.5.1795560886049;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm38075587c88.12.2026.11.24.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:45 -0800 (PST)
Date: Tue, 24 Nov 2026 14:54:40 -0800
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
Subject: Re: [PATCH v17 01/34] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261124145440.000017c5@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-2-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-2-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX+SMM9SR5wYpX
 awvMYsS52jVRS8tosuCDX08772eiTQWE6u0Cd1IEf0DFXm5lSkcD0b4ZFKwEIEaj7+jsYkK1cpb
 uzAWYUelWUQ3RsyhzCN+mDKkhQ6H1SbalYxpFw5R+UNqPZ08E8YRDYu1yNaT9hjPoIk06haKwc0
 laEkSmzsjYL57psTd995zCraoPDJ72Z8KWvUJD3fkDh+5/TFmwscSSbWYdjzjvmsk+5+76FPnAa
 dlbg0TQ9kVhZSPq5Ew31lVzDiY47pF7tfaID5ZkZ5g02n7bLPa0tY70deo8RDi8laCoMCH7MFyT
 gsJi5mYFskkdRZYMJjAc5caLe+MHgs28Gq6gb/kNeNe52M/7EgCLTmyO226TGcdh66LPMXRrWoX
 JXLgo94I0kUrfr7APaXLkRAJ1rO5KseayJvITqLX2vPhSSJudXB5w4AseVitHgBDcjbkMUR4V+n
 BtkACOnmNUnB4Ol3xCA==
X-Proofpoint-GUID: Ckzmdgu88q42uNg4-PDdfZ0JEwgwr03A
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b0615b7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=But-FDUsNSCRHIe_eGIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX/Z3/xuoXdQlQ
 pr9sohWuYYMG1PfZeqiUPOjk6sz2fop+Q7OQ/xOfjOqe7qm73To8x2PDpU0g4vYs5lrcDwrIRyt
 EezD5id+LPpdUM9JVvu87RUQTCBpgUo=
X-Proofpoint-ORIG-GUID: Ckzmdgu88q42uNg4-PDdfZ0JEwgwr03A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240090

On Tue, 24 Nov 2026 19:48:07 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and inconsistent multi-part replies.
> 
> Fixes: 36b6ea0fc6bc ("firmware: arm_scmi: Add iterators for multi-part commands")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
You answered my question on this some versions back (wrt to where the magic
size came from).

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
