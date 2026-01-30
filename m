Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ACF33A9D3
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788720; cv=none; b=YjO2cvff/cr7nsw+NxcwfArA8QfzQQaBn58Ft+cKIvGxVjuyQzGXXieRpbAmIxQHqAmDas3Cc5NymNowA7Rl2qjewpWcMEY9IFFznXx+6OKTqcLTKZxvZFg29sgETG7Rg4QWBKsoiZCjYxo0pGXbZDMGNZmoUZIs+nsx+t3qOWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788720; c=relaxed/simple;
	bh=JHNaQF/tDX4f6NrSy7kAELk8akXPiqvpv6QvjBz8r8I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Fp1cybmaEL7RZaPhPJVaJdPU7vrLrvDyKOyN3ZJ028UudKQ5wceiJLUTqc/EPRJJUHEJqSmTWuflmn17b4dyw2wAcs0Iys+Nrp007ZmBKFv98WBqUZusj1pk8Qbd4BLj3I+kdnU7Mf2jzQuxDH6lvBxxjLuR0BhQRTqKOSAHg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrHHYB5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q605g9Sl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrHHYB5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q605g9Sl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UB8NL91485339
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 15:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQNZhRVTVABmpgTnG4Zg3cj198URaNvQKUlnGCClzJk=; b=WrHHYB5IUzWk3xSd
	mLrptX3mVqYwutQLOSwiXhQDrtxyCqpRwXE7pmXSQIcVZbUQ3UZqG95BoFl1cLUD
	HTgyb5Rjht5SrPoMzWK9ewSHsHjSjBxrHAtRCurs3zg9qAZU4ykYiTOmXSM2BR9W
	dsFgwrbdg3Rs59TzFLEzQ4HcXl9cwwG7SVPQM3FfrHgGAHs5TRWJd5a49dFZpbhy
	giU/zPpIAMQKCggL8MRs/Y713kfc8P/ZMn28fVUqbY/RZkFS4IX8jyHaupnarTPP
	SYDvZec8LT6XzlVCY7kDchqY9m5f8rIndL3rQle4aDC3HcshG19AQr8Q2/cnUe+y
	jpyktA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsfa085-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 15:58:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so679338985a.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769788716; x=1770393516; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQNZhRVTVABmpgTnG4Zg3cj198URaNvQKUlnGCClzJk=;
        b=Q605g9Sli7o3GQC1T05Ku+k47c42bcuQhd9g8zqJqpevLD9hKhWW1fDSB11ZXpi26K
         1NQes3V4DkTnhciHEguIpPUnU+heEx+N3JFoAAm3DJ+8T2VkDtCrm1uugsmNJs8aREnK
         06PgJR0W+q57TV0CZEdnicxnrQZgnaBqbatbJxOIA2fMV9zJne0JxHmCW7FMiIetWvt4
         OR55hk/QPrflZsJJM7ZXFFqVIcrRW/6deu085XCXFY/zZ9Yg3XzYiePhZFR+eWRYCXPa
         bzSCkq/kXXDZyTZGjk4ZKXouJ2QLLVoVM9KTRlhyMBZyrs1cNTmGzv/V7+oVrG93Pcuq
         ifWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788716; x=1770393516;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQNZhRVTVABmpgTnG4Zg3cj198URaNvQKUlnGCClzJk=;
        b=mU8ipcCotxHMZtfTjjz22OH2mklA1kX/RzvoV9B8OPpMZP/2ebaS/nuEBJvkYPHs4v
         fSX5aFKnaaBCN+zBRaao0+d7PE7SasmVnbaWzeB7G5Vgfa9cobGrHgXyVu8B5b5Oc/cU
         kYR13wmbHZpNWLIbc4MLUEGqt1EAqVkAHDqttzE+PM+kEp+gFtDUrZNg+vkYkPJMcMFk
         hEPkGsoxofO6pcWjSptoVZPP7Om3dZQ+a3FF3yXk9BL83HvpQ+6OcZvJl18Bg0HbaE5t
         kt3x0GhWBU4eKaE6E5RIz89JPHVbg85QVlFh7XvSmGGzxQkxVyoIVTQQ4Cvmyj5yWJUb
         d8nw==
X-Forwarded-Encrypted: i=1; AJvYcCVmO3aJviP0sqIT6Axj8mH3GxOY7VLAhlKN3+NaozIcft4fVc9O4FXWBsUbEkXvusWTEyFDlGu9tZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YziqLHdV8lkzzR08vvVYomy15g+39upqKJDU7i358xCM1fYLPAG
	m27cn3dPfZlhFW1+dHAd4ms35XluvKfyCT+w9jhH6gt9hC9M0/BCnDqKuHEcbfdSdp4yNO90ObB
	qYW/eNo/S0prtuNU5ENTw9F6G0VclhxGYHQKSzZO+o/9kIARoEQbTeDv6qcWLDxA=
X-Gm-Gg: AZuq6aK/Ffa8FskI5J2gQozz26moDY0ef0lTrpCdxhQZcm48fSjnx3aZQiyv+3OBqtb
	DbvhXGSLdAfLduqF2/MnaxCdt7avk85Li/DhO+BzhVK9cquK4cvZzAiCHH96CMDVdbMlcTkY5tH
	5C6LQAfktj035dTGpOa3/QiD8tnq2lET9HcR9G1Pxcno4Mvomt+ksEK7t94l8g63zLvq7u6fnQt
	3/InuN8PEAhs/esA1grEUcHP1Pn+5RL6Hq2ph5iJUeK257NDkBD2hO2FX/G/5JzxE0O6dRdSo4N
	1v5L14YKeSO9fR75El3KveWNXZVAZLXL32Y4P9xysYntKfHt95h3tR9slU1SctRq3A9dyG6Feux
	62Lc/KfoG0msC0TZpSfbDJHjDJJONDN7o9icLLxo6niK3uF1j
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr429757585a.60.1769788715904;
        Fri, 30 Jan 2026 07:58:35 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr429754485a.60.1769788715467;
        Fri, 30 Jan 2026 07:58:35 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd4a5b8sm27030845e9.5.2026.01.30.07.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:58:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 15:58:32 +0000
Message-Id: <DG21QMIKJS7W.1OUK0OFL8S3A8@oss.qualcomm.com>
To: <fangyu.yu@linux.alibaba.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Cc: <ajones@ventanamicro.com>, <alex@ghiti.fr>,
        <andrew.jones@oss.qualcomm.com>, <anup@brainfault.org>,
        <aou@eecs.berkeley.edu>, <atish.patra@linux.dev>, <corbet@lwn.net>,
        <guoren@kernel.org>, <kvm-riscv@lists.infradead.org>,
        <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <palmer@dabbelt.com>, <pbonzini@redhat.com>, <pjw@kernel.org>
References: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
 <20260130132458.16367-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260130132458.16367-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: QxRT7zZ2qNnFo8kSHO3mdiMG310H3sRQ
X-Authority-Analysis: v=2.4 cv=EvjfbCcA c=1 sm=1 tr=0 ts=697cd52d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=SRrdq9N9AAAA:8
 a=655hpoqrAi3NGJe9dLIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: QxRT7zZ2qNnFo8kSHO3mdiMG310H3sRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyOSBTYWx0ZWRfX1800An4dSRZt
 PcfkqPMVNjg7hZuuGX0z/oz/cBskn4IoP6q6fk/qvgApeSQP3pkkp04GrzlVQkHof82eN2WfN+8
 hooFVSfi/B2bx7K/KTMVrRwAUNeLbhX3cEn5fnQuDnCFWczwZiGo+VVth62QCuhYt/dmHNbHdZh
 NvH/53vMViugJwI7ijadMDcsVCe9SZxTBlApJMVY3mQq17KK1zguRep7+ZZcn+Gtdt2fOh+mvMj
 xVjbH88A4s/CBTsVb7mShyxO3PV1MnhdBhAy8k+TSMyAVxQNizoZJpXMLZ5eRlU8Yxkf5jY1n26
 oXS1suYdJo48Y3KcU9ZBfXngqzJg0i4XDVeXhbTuZDD4qZr0Xdo+SYVQvGqpitFhXvXabOvcksI
 EcNTm2jHuzfbLh79lwtoHBPhAJ1f2potg7DVbcKlP94QBHT1c/gBnzAe9H8PqUcBTQWH9bu7kPm
 VV6N4cUcyC4+AvaB7uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300129

2026-01-30T21:24:58+08:00, <fangyu.yu@linux.alibaba.com>:
>>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> -	kvm_info("using %s G-stage page table format\n", str);
>>> +	kvm_info("Max G-stage page table format %s\n", str);
>>
>>Fun fact: the ISA doesn't define the same hierarchy for hgatp modes as
>>it does for satp modes, so we could have just Sv57x4 and nothing below.
>>
>>We could do just with a code comment that we're assuming vendors will do
>>better, but I'd rather not introduce more assumptions...
>>I think the easiest would be to kvm_riscv_gstage_mode_detect() levels in
>>reverse and stop on the first one that is not supported.
>>(I'll reply with a patch later.)
>
> Please refer to the discussion here:
> https://github.com/riscv/riscv-isa-manual/issues/2208
> If Sv57x4 is implemented, then Sv48x4 and Sv39x4 must also be implemented=
.

I don't think so, sadly, but we're mostly dealing with technicalities
here.  As Andrew pointed out:

  "The H extension itself does not impose this requirement, so
  technically Sv57x4 without Sv48x4 conforms to the H extension spec."

This means it's completely valid to support {Bare, Sv39x4, Sv57x4}.
The RVA23 profile imposes additional constraints via Shgatpa:

  "For each supported virtual memory scheme SvNN supported in satp, the
  corresponding hgatp SvNNx4 mode must be supported.
  The hgatp mode Bare must also be supported."

The requirement only goes one way, so an RVA23 implementation with just
{Bare, Sv39} in satp could support {Bare, Sv39x4, Sv57x4} in hgatp,
because RVA23 nor ISA prevent Sv57x4 to be there.
Not that I expect any sensible implementation to do this...

Btw. do we target only RVA23 with KVM?

Thanks.
