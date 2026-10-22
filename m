Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792642370;
	b=CEyiTO3rkw5T3wGvGZxdvqS9IUGZtUMJ48f/kC3q0Awph2jTWTpA8wrSsrfWd7IUV0iu
	 O+XSm30RynyzLlIy0/xCROqi6+hz6uq4Ei6aMXv4kqBWJnD7MZLzwOklXf3IZTw5gNNy6
	 7C61Fkj6Gqf3QdN+UTdRnCG2dFo8aUPrhVuiSzLiobFmmYMpmhL03s02xrApn2Plvl6um
	 B+EUtoW8+aaa3cqi7I5KX1zlv5oM9P6HEjbuDfkT0ypXMGvcOQnB8nxSYpWXsDr0SwT9q
	 dDkDnDsVJtJl/eXyt8qtWOjLZ7UaYgUaVIemwKnDUuRCsyMN9SQTYZk1/LeqcNdx3uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792642370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
	b=Z+dLzFOQZOmtKH2sIRWfApdFOYYB4Kjlw7POe5drL8xJgsVGYbJBh6h53+/4Mmm+dn3s
	 smugrQSHhWGu7IXbf5SytL1boVedmKSTOrrFGeG4iEPRz4g81OWwhRNgeF48/fZQ9o/tO
	 fYytMcLIIumoZy2BJNERnQwD91Qvcg7Cpz/qNZ7qzporLTjRvqQLOrG6dumJZUzsZ30Qx
	 avv27lJZFeEItwykw9eGgkk5yNtVxUugD5RArDZXJJcVC6ztpmEO+RcUCDx7EAVDh+rcI
	 kuz45zGO8fHretCprftRZtYCMkao1ma5IbukAQRsUI0FMu3aFSjax7P+cQ8mgVgc7Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kp3I4RPG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Vmx/aWcS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA61606A31A
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 04:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA61606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kp3I4RPG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vmx/aWcS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jTsi2476985
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 04:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=; b=kp
	3I4RPGst1xBcpDpOejvDpwFc90UDpg/3VqfDe3C7cVxEJGZyCP9uP3FMgVMCJloy
	rcJJ9LyxLzNbey5T5ScvLurlEQvD6f9tYaGyEcxGoPkDLjoJMlQIDz/XtiDvKRIB
	djn9MFbd7owI6BYVETwxlQzyw6c+dzM67HcwIZFch/xPw2kWs0xFAd83hX6E2GE7
	yotQ9smROW6iN0tue04HmyDnMQaDNFJca/ANOeAVm8Rja3J8/9+A7rIZJNIn7fJT
	gbfwVY1wiKaT2UEA7FSIBNDxCWGulzxAeqt9DOs3LqaNt4di+uyTlpUMgpvKL6cg
	fgf+C1KINGYLMm7cXrMQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2kkgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 04:12:47 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so2291288d50.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 21:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792642367; cv=none;
        d=google.com; s=arc-20260327;
        b=Ul4XQ0zfKSBKcgzzHmMppqBS7JmvsWS4RGKnFTOXfY/6syX1PTFrKX7Ni6x7Yn4aJ5
         krSE1d5wIGfcJaJDgr/NoWzVL0ymkou4jGUHQNKatOiDZWAg40JqdrWyMU0/bOEFUch/
         vB/OYErl4C2JzQeG0qXEapwmuyibeRyfqwi/ci4dp4ih8F9qN6VMIcdtIp/NkfPowUK2
         SzuxoXbnbTDB+o9owKZXcSnyipwc4LRHJwDjwRmbVwv/6x6HSvY6vBrbqeEhuvsZi9df
         NsgQDPLAHoUSYrMQPMxCRW1nlJ0Y5WDdnHDiSI8qfxNLGegoPxQcMvUEzL1n4opGUP43
         kIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        fh=tDAgABi65jee4ne9YUYNEiJL5kGtxkNqSt9Mv6D6ncc=;
        b=T3aYjEYtOn8GXB1kUCE4wwLhvfCuFan5ZWbwC2THBhiGdzrrpzSY0o662IeoyNma0/
         CDEZlMV8Mu/7J000t3nrlVZOUcwUV3cS/qom+9b+UDM4/a7vr0CxHKXxXVz2t230R9r2
         xxIpmbU5LHdwoiQTLHJP4mJQmy978C65eyFDDTp4BwKnsv7pDJSjsz/QikGBvngSpB28
         KJMuJYRJ8HFUJeSAcpsbky1s+todV7+IjjLnBtNYyPM30vRCgeoZF6LzcjbvuJkrXGgB
         9kg7vLDCjnVJlAFGRDNz1bf/h32lqi5VV58AK50gShmHH0Z0vAmsiZyhD114wnXblG51
         n6tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792642367; x=1793247167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=Vmx/aWcS5MVM2uKjypxdnBC8t4h5kKOU83Nf1hqqRZeo/Op4zBCcfLnpIClFp6/P8Q
         1FSJoIQpJIgNAHMrfhw0gSXEMXjmNLDGegDSQ88YDhvjgPYdtDSjWG/UsDus4Ri6coFW
         KPFImLwwbkH1ibDYOPF27cLmAGZOzdNvnlJLi76VSigRc1LSW60N10Aoh9/UZiSBMKx2
         p6R7qiBaxnN+KmEfatSkl/hh5+veYAaB4QoN6sBlOQAbc54g5Eo8NQFxDzpRSNAH8Hmr
         NNtgtnq02B3+XJYfXSBNC3ZDdQKPesCI7lxXk/kfkdcqd4SBamE5vVJomW6KR5A2HRRi
         GtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792642367; x=1793247167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFvh/3Uw91jbtXCdw8cETloCk2Qba5GfK3RNi0MxwyY=;
        b=OKTDYLY0wrGnUrDiVjJcN0vEjE2ajPYHpVxYEiFfrsa0fHW6rtTBnSF6kWQU6vW522
         /FxpNAbT0rnb/dlgz5HRVgU5RllsxBngYI/G9tja40+zN9KK9C8lLJxIX8VnkU3tQj5f
         mGb+QUJtBk6uEe/YbPsYsgf7DSi2pgkoKY1nYNpUoon2tq9j3PLRPMFBbSXr70oGbKzU
         tdVHnDFvk9aKN0xU1kAkhKoybb28TIzFKZ9OWykDFms4/uPLXrgPZUpNAydyo8ylwBWR
         PJakEA6RTccxTQk1ypQ/bfHUolV8oHB47xhwRGuD0OF8U3iDfHA+f/qX0baAd64q5wdM
         tS/A==
X-Forwarded-Encrypted: i=1; AKwUvBzAXRpSd/JMa8S8Z0CpES28VCr9KM1lHKKxbI5/9WjwU2lPMEl8eewGMlkfKrZqcGcWoopUwiQo9X4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcKor/dhzWTz2SPQh9TGH+6K80j3Nd+U3eCm/BD7W8LxQdWguV
	UydA6BjQ8WDqdE4nI5XbcBGVciXSQNA8x+HjwqTtuVPg82x1kzdcF7ftopB+Jq/2217HgpWGuDT
	BYM5XgHLMy9CNNadWqNyG0VNwRCdnwknturQXXO652f4wbmStlLpOjbP3XEJEeTAxphW847lmOH
	OB5cRlpli8rx+Ej4rGaEOHYRSLKKnC67cpWRrkhg==
X-Gm-Gg: AYBFou1aoKgUSquhdztx6maURC/IOtoGXwsg0IkH+w3sGxroBVj8QbddYRokGlBiyLv
	FDZwctFY0iZJBlZ5gdW9n1jzOvOA7EFQIKOHvA8jQmO/2/pxDvOk/ytOjV5CBcglAU0mPpNhuX9
	GaHbd9lMbfggCguB0Bz9ZcCnynVB0zGRnx5m/56EuJswp3XUceeGDycX0Aw3c=
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id 956f58d0204a3-67a0e4bbf6emr1062067d50.35.1792642367548;
        Wed, 21 Oct 2026 21:12:47 -0700 (PDT)
X-Received: by 2002:a05:690e:488d:10b0:679:a898:7d8b with SMTP id
 956f58d0204a3-67a0e4bbf6emr1062061d50.35.1792642367081; Wed, 21 Oct 2026
 21:12:47 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-2-52fd8be98dcf@kernel.org>
 <CAB19ukEkAOMnPpi2jVFz68GZ_7cwYmNtrBkxnfEJtFcPb7PJ5Q@mail.gmail.com> <atPhE6rF0Uz93qF2@thelio>
In-Reply-To: <atPhE6rF0Uz93qF2@thelio>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:42:35 +0530
X-Gm-Features: AclHuK_KjNarSdeGtOiebAPfz9T-Tt_QOkpNIpxbMPcQ9dxWkRZQBbqOt91xNeM
Message-ID: <CAB19ukGGcDgbewvdMf-TBCYSpN3ksvbU_tJSJdRx0-EKb4Ze_A@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfX/eQTFhL6GqnH
 G69gTtOCiOxDaps8paDsZ17RBueoa+VbXuf497fCKb2ZArRHJIJJiYKYwFepXIPnx5XBQg7UGmE
 qTH8fl6C855Q9nTW0T5/pHbZMUbpbU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxNiBTYWx0ZWRfXwB3lkIMI2cqX
 wurMmV9DmYVySPrZe1IAET4+reV4GyrVV2LpQLzYYNU8apkSEMQp1xE5Yr/66UBZGBz3DPBwI5J
 D359O4j3Zg+XEq+M8qqIg1myjNJJWMAxLSHTpp+eNhSGPAuVku95ghpPX7QAOr5oUBFvrAcH1MH
 TttsoEJo9GADl6c5+d8vlHBk7M8yCl3cPi34xy3x3MjWALJ73AXr9iL5l84xIzGyGTvs86XaCot
 Qly1My2oFTzE+oljMh6EvBS42ix75F8pNDtK2NWjEk05aPhlghlZ9IK2KullycmyHg3x/0CmTtn
 JAxlJriBgYgWFvcpy0k37w6L91tGTtV4nV6RuzyJTqPDFnYO42QB5w4Bk151WHbHdY6Xnb/H8kK
 /HZYF90PUi+Ju5xd3eVZbuEER/EnBKg4yp2a7SLOefIWstpC9t88re6CGtFUEjY23rc1Q5YL7E1
 pafbprb9PgVzOBRGZ8g==
X-Proofpoint-ORIG-GUID: njQVPL84tu6_dz_MfDOp7RIwWaT8YO9j
X-Proofpoint-GUID: njQVPL84tu6_dz_MfDOp7RIwWaT8YO9j
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad98d40 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=IpJZQVW2AAAA:8
 a=jDNYHvWEAysQCaIWslsA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220016

On Sun, Oct 18, 2026 at 2:26=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Mon, Oct 12, 2026 at 10:23:57PM +0530, Sunil V L wrote:
> > On Sat, Oct 3, 2026 at 12:45=E2=80=AFPM Drew Fustini <fustini@kernel.or=
g> wrote:
> > >
> > > Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> > > RDT_RESOURCE_L3 schemata.
> > >
> > > resctrl exposes a single capacity mask per resource, so when more tha=
n
> > > one capacity controller backs a cache level they must report the same
> > > number of capacity blocks. The same holds for the other capabilities
> > > resctrl exposes once per resource. A level whose controllers disagree
> > > is left unexposed. Other levels are unaffected.
> > >
> > > The set of controllers backing each level is fixed when resctrl is se=
t
> > > up at late_initcall. Control domains are created in the cpuhp online
> > > callback and keyed on the onlining CPU's cache id from cacheinfo, so =
a
> > > CPU that is offline at probe time still joins its domain once it come=
s
> > > online, provided a controller for its cache is in that set. A CPU who=
se
> > > cache has no controller is left out of that level and a warning is
> > > logged once. A domain is published on the ctrl_domains RCU list only
> > > after it is fully initialized and brought online, and removed from th=
e
> > > list before it is taken offline, following the documented safe
> > > traversal rules.
> > >
> > > Assisted-by: LLM
> > > Tested-by: Chen Pei <cp0613@linux.alibaba.com>
> > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  MAINTAINERS                      |   2 +
> > >  arch/riscv/include/asm/resctrl.h | 147 +++++++
> > >  drivers/resctrl/Kconfig          |   4 +
> > >  drivers/resctrl/Makefile         |   1 +
> > >  drivers/resctrl/cbqri_resctrl.c  | 831 +++++++++++++++++++++++++++++=
++++++++++
> > >  5 files changed, 985 insertions(+)
> [..]
> > > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_=
resctrl.c
> > > new file mode 100644
> > > index 000000000000..f10a24761b25
> > > --- /dev/null
> > > +++ b/drivers/resctrl/cbqri_resctrl.c
> [..]
> > > +static int cbqri_resctrl_setup(void)
> > > +{
> > > +       int rid;
> > > +       int err;
> > > +
> > > +       for (rid =3D 0; rid < RDT_NUM_RESOURCES; rid++)
> > > +               cbqri_resctrl_resources[rid].resctrl_res.rid =3D rid;
> > > +
> > Why can't cbqri_resctrl_control_init directly use
> > cbqri_resctrl_resources? I feel this initialization is redundant.
>
> This is similar to what x86 and arm mpam also do since it is important
> before any resctrl code is called. for_each_rdt_resource() will get
> stuck in a loop if the rid values are not initialized. In contrast,
> cbqri_resctrl_control_init() only handles the resources for which
> cbqri_resctrl_pick_caches() found a controller.
>
> The initialization could be moved into cbqri_resctrl_control_init()
> before any early return paths but it does introduce the possibility that
> rid initialization could be missed if cbqri_resctrl_control_init() is
> ever refactored. Given that, I'm inclined to keep the current structure.
>
Sure. Thanks for the explanation.

Thanks,
Sunil
