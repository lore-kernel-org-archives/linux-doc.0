Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794433789;
	b=RR4drRFGLRokd6+lKX+nc5VVfhXd66B0JIfEzyEIWk8FB3Hr/eK1TaLT5AWwt3alzZqR
	 shhgymlZ0mtFjfDSGnlGg+a2CNYjj3+wXPe0KTbjsYlR7p9UpwsINsygS28aLlHXJVgox
	 zGzwzmtGnfY7TbLoATFWUZNj8sPFrmD8MAaFhT3iiwRTwPmIgiCJMz4xODIgM/fJrFIjP
	 eXz6+Ll/KWORTALBhZ9vb8/0CEJ9ND8FHrchCJosO5Ce/d+1bIOit3o1ohOPNIA5F4q5E
	 x7wxs2dyDSM2ZGrWlyc7SXrR6yfiroaiGs+Oeei5zLu0vWjwmSOijbj+VXIn5uAEJ0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
	b=fGE2X38MCMo39C+ML0KpyetAcniE2VsFtAKg+3XYJ7LbMyQHU4T97vFQaMtqeklgYV6z
	 MqWkxPsto4X7pEKkX1ZpaZN/fnF1cHUKdxEelTnXrLYjyGNMjTQ3iHYnNWWQYPvk+gmJd
	 1p5OGJX0Mq7ecFhejr5vFwmosZaJz6HA5lxB5VZVk2ySKn+X0UxmA+FQPHd3ss6bwGvWw
	 1JRyzdmNUg6BbWSuWJEL/52x8wau2CKQny58u8/GAGtukkoDe9Pw9Ral35cTK7h3Y3XSm
	 emJfwpKFWMdunvNlNJnPeKrJa00vfvEgFwi/zh+B6yBA+RW63lLRFtHSQjxhy5pDGZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GeyeUFFi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071C606A334
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C071C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GeyeUFFi
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABKjitp1265843
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:49:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=5hjKfboVBJ7
	OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=; b=GeyeUFFiqCEKPkYZuQ6WCtcJ+ir
	veBlhkSCp2XR6ZvVC1Xnkgk73qpCo4mRZiSx00pz0ZaPhEttkWlhUPmxfs40TTQ5
	/X8zBYWeMo5qo2ppLp4+UZMJyHFMoiEX2DHlDDezkJ+ymYQXutBVAG3oQhntG9hM
	ZVeerH9U4yDTyfZo8k5T3RGORiWlI7Sy4seS228sgPILhH6xhQjGBjjWZwg6qsn8
	Vlh4ScYyoi1E4wMGavc4pJXl7aCS2fuFIr3busZsxl7CXn30LOVds332fP4+nkTl
	nDWVNpN6J2Xxb3bHvFuoJ6S2atc4WxsC5TivihwZ04AgSP+XyPVs1XTkmTQ==
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hvaejgtt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:49:47 -0800 (PST)
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49166c8a60dso2576806f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794433786; cv=none;
        d=google.com; s=arc-20260327;
        b=exE+7fo6rY/8IIiOToRd53Kpe2LGKXwwaCpTuli6bBrml1s70Mo1zsVPvpEyQV3zWQ
         6zUfDBTd5dAZnlKoXrhvCzcV6SfktaM12R+0Wya2i8ounW7l9PQ0+YgS5VHKEjzgZFiN
         eWF7VND5iwNMJLqPpvPQ6BsgZTd2x/MbkxFS0Mq42rR/UPs6i+Zn+FgL5w2iTz8XG/V9
         2YDxq1QLJUK3PoRyVStuxIxhkwtEma9KERsxlD6d3mb8JlOqMM8PGezWWFzy0F8J0A+a
         /zwf+AUx/eBuGSjKoKcHqPlzFONqGKJb0k6O/tTnY/t3BTQJ8tqeos2Jbvx/sZbliGzb
         GYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
        fh=QvZoxmc8VZXj6Dwp3t4oeVwiTPJu6Ceeyl0GLMcUnwE=;
        b=Ru2IToBeXyEPwbZAK1siecnthafv4GAHdD877mibdKFP8pzSL4liyZ8xSKLLVuv+hc
         h6b6A5Q9ZvjPxOcjDJ7Sahe4O4Z9aghwoCxhe2H3pZ0nLDWVz/CzCLRnDwTRFbjtdsIV
         rG7b+ZXkdSxPqVlicjHYiJXqJgOKAokppiYNbToOU1Ss33EaMiQf+YoWPL6cK1H3flgw
         QaPDNwVqmLNA9/L/VgNAlca/T4AIyKTlU17+i7IZDaks5upO0rKrYz5cRqXs0fvMg/fH
         2pYRE4zXTSEXkwzKacNU/KMHtLl+IniM3Im5amg84zLlrzg/XZ9M26mgvxUXFz/3Sb7N
         47eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433786; x=1795038586;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
        b=lx46ZqOZ7MMjyLUVttGg7YXTpIjNKfHJy2o4RJdrY4mGfBNs6+NuZWqDbyxO7OEb+b
         xg4cpl0fjNC5gVBUocwNnpZUGdMYaKN4Vea+E//tXqhFcoqeIDpoBrC03nRstkfaVOJM
         KGEgoyiXDQ3X5xbjgAbiMUXz9aleuaUemp0dS+QROb93N22Vc9VKooQGQ9iPdgR/j5Qz
         qqtJZLLqpVguWSRHiKBoV4WvkGK3st1tmcl+/qBTGX5aD3czXocNtZJm2BmOt92a8Ba2
         lp6Y6Ynys9Ac2Is8Pp+riTwG/VzpqiPiWzL2tkw843DVPXyUwOj/D/oIV2wJ412PRXp9
         GCKA==
X-Forwarded-Encrypted: i=1; AL+hErFbrz4oZ4zV3BEhnqkbspU0OVa2tYeelYW9ttZt2saHENitwXqRNDTAOzbKAwRtjw7POqC8+e8EoYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AvQgWGyfpKJDKVoO1CKh24xz8pfJQKhapbAtObMTsyvTLo8K7
	tJxPblc7sjE/U94MevCOTH+0WBcbh23pEl23OlOfOSvYTjZpX2ZnmMlOvU6B9HMmNVf5PbcoLPo
	lRSbGlTsn9KguYig/xwd/rrs636g3Iv1ogSpJPyC2eyNJyO9kRsilPJKFMieB5M1n6EJE0bAfea
	rj4+ZzWBMIqLwUBhqcYlytH3u+uCQwKqRzhtQ=
X-Gm-Gg: AYBFou2z18WWnWQ6cu/Q15EBFTRkEyXLD2m2Qhzg662RAcLdficzjsHSQthk82eB+Q1
	rrSknfbiraR0MS0B4Dpg7/a42XloPcqOaMPwmnuWrq/bz8oR68EcD08lHhaXVHDlP+HeI34bs4c
	vcfoT7hnnuj0RimMLh3AOxgfMur9ggxYpdRMdFdRdtI8j5YoF3wDfQ4nle3FMdeBR06MPCEtvDH
	qJGLEoDhdKiaQ0b+UWJv5yuXjDLwlmM
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ba093583eemr60183615e9.9.1794433786461;
        Wed, 11 Nov 2026 13:49:46 -0800 (PST)
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id
 5b1f17b1804b1-4ba093583eemr60183425e9.9.1794433786168; Wed, 11 Nov 2026
 13:49:46 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com> <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
 <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
In-Reply-To: <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 13:49:33 -0800
X-Gm-Features: AclHuK_3wPHrs7nAKCIlAv8DB3IRwLLgS4civoUiRATHWDoZevdks1911kjhq28
Message-ID: <CADh2yMwFu5Gyadm2Y-NHCBtayEvN5H9LUM=Kf-tT69vmjm0DEw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=LZipeTfi c=1 sm=1 tr=0 ts=6af4e2fb cx=c_pps
 a=pX1sPZUoWPGeQgUnKQNIgA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=VU9VbmEmTQsFja8ue1gA:9 a=QEXdDO2ut3YA:10 a=XGGHjNwGSpTZ5T66x7Ix:22
X-Proofpoint-GUID: LREwxO2tukN9k5C0mz34aQ6ZjQA4BeUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA4NiBTYWx0ZWRfX34xuxwpyr/kJ
 8wyDdcmcD5inKaSw+nSlL/ydcLmtGhz7teEHqC2ZXxo6WIWWfUl7tW0LF5Ag9Y5DeF1mHxpnvOM
 Zq+N8foJXgeO8QEfoBMX8jfDWSMWzNUAnqXGmewvdr3oh9jbBdeyy6T8p+MixEjXcUmiYpp0Jip
 8p673JMr6J6NEEzcH/gAtFT8RFZrmqEbLtiM6R331omhDsZiT4VnoE6YJBm8e1/BGR6XVbRwgCJ
 VPXxijxpBUIF7JbxbRoZ7l1tONk28e4RABPpmgw0bBpfXn8oylTWNrJvgkNLQMPQ6BC0ZD+V1Ck
 4c7bjVlVtQ4TIvnO/gL+QfitLp/kuj8EHrFibZENwHnxVysiQzPTIRHLMfdhZrhJT7+vMurKVi9
 37R2IZVUZ7FYkHVrxFptE07fjBtMUEi6EuGZcLv0tdL3kUTkP6vE8X/zyBZwJmDWJLpTGwPUVlO
 xKcX2oGT6TxKcnbI6ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA4NiBTYWx0ZWRfX1gjjcGdRpFiO
 gcOcEwLPXqgFxMCbBqw7KzS0RmXsL6vUJrFS63+osD3N6GlZioDAYorNVowcvPmwWUiQWF0htAN
 +YGiLQIYCPofzRwXHwChTiHd7TRIAkw=
X-Proofpoint-ORIG-GUID: LREwxO2tukN9k5C0mz34aQ6ZjQA4BeUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01

> I think it makes more sense for userspace to just get rid of the rules
> before rotating the keys.

Ok. I will drop the rx assoc objects. The robust userspace protocol will
be some combination of using cookies for state recovery from a rule
dump, and using chains to flush old-generation rules at once.

-Todd
