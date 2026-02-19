Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504C325714
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505376; cv=pass; b=uPk5oAvzodW+G0pNHUao0MjAdMU0q/wRAK1gg4YieneAPFuRhFSw5tsatakDSAETiz6UhSoMTM7gId8urfJgsgVhjUlkNpYsI/jTdMYyjevtSVCGd1DGdZSEptO/+5YdHZ8gPV3cwIctktoxP0zxvkMOBsMN7H1VSw2vh2HgDJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505376; c=relaxed/simple;
	bh=Ttdv1MjLTh7dlTy4W0gmvcT80sPMOwSYIvTVAnKaV/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+F6LlCyH+w2+UKojFq1dG/ttkBP7as6yUrvqZtgoHbguw27q7i6Cl3gSF3WSnOWnYMOGgF7200nU6MhHjKBVDoQKpyV2ICsrll94K/89ivbJl7TBpGnfoczVMeTBHuCJnHryt5JJQveCD0zX92y6K9efRO/4dkpsaT87dy423k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORMQlgyK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEAPeelV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORMQlgyK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEAPeelV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAnQkS2004741
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 12:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ttdv1MjLTh7dlTy4W0gmvcT80sPMOwSYIvTVAnKaV/0=; b=ORMQlgyKYehudRvH
	X3jtjWranYueO8iQYh56j8V+M/VbmrIi5XMGEhCgEMEBBgPPQFs98kiVXarwuG0t
	14sZ1Ac1iONOZIN8zVy0zlieAp0PbJLFuw+l3QKAtPSvnk+yWXQPIVeDz7DeHjUz
	ml47D+yhAOAJ6SQvA73WwLaylzl2LwWyO/DxtnZPKHdMMx2pibdNfFYwgkZBQpn6
	L2DKM2B768BEbADem92UFPA/9i2MhEzUBDlx0nIHtFk6x5sxHn1/tjSDPS3VdsQ4
	fMD4KVoh2XCxenUxX45DQjBghYIFKptf3kTfzJ63YDuPgbVNR6FfySMTLLGwPeFW
	spx5Ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhx6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 12:49:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso888234a91.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 04:49:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771505373; cv=none;
        d=google.com; s=arc-20240605;
        b=Bw+u1WP8dK2JbyJvO6zHVIsZOQbUKmkTqoGXr+s7iAVpSOKJO1yco4DslkqEjQf/jp
         mZG9FWfrPb3C2BaMKW7+tyO9mcZDwMhOscjGZu7OUm1VoEq0TVgudnvi7z6qMwE7L64E
         GbuhYDEpCihNK0WqvCmyvVmY2K/m7RFV4mX4nd5KXvVzVbnES4V7W1bBQ7k4Vy6Xc7+1
         X94yUWTifo7cxL+f+5StQMx+BhSouDATNU7b+62T3zntxNLvW8R4gVTRYsJhicNcxSbV
         I/vmT5KJrnqHHGGdDeP4hTmNOc4C6VmAkqVy8ca9gW5TW/EAibNYNt0rGJeAWQte1UmM
         RVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ttdv1MjLTh7dlTy4W0gmvcT80sPMOwSYIvTVAnKaV/0=;
        fh=9aQz8uMvJH8LjpTM+NO0Z9gVpoic1tTuKNXhHMyTKL4=;
        b=jDjnKq6DHeJlZDSx1FojYD6rtmhe+Vw/GO4XoB+tN3dZbWJ7xc8vK+Ix/D9u+9xxUK
         2gZ90iD4wOymjLnhjH0iuk6JOpeX9EFCmn8h4ruy8rZIm4LWRo8ag/mAXOAQqElvOYjM
         u5swFRilrj/Fah89WkYbHnb6ZARs0bmLuiW5FgrAnBdYnCXAtDjHGv/3bfuMP9i+BESB
         mgsIOr7rRLy/usXIe/m/TtLRxgmOgUfseqZPGavb1kwy8nBqzGMw2HQYDcfVWgQVQoe2
         b0Mosop/7VA0gZy+z8/pvlFnqqx3fq/hYSfzUUijjWo7c8ASxXiN93tir/T9DCVylFEo
         p1GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771505373; x=1772110173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ttdv1MjLTh7dlTy4W0gmvcT80sPMOwSYIvTVAnKaV/0=;
        b=eEAPeelVoWI6gH5urXvbCQX2egO0HPWPArdZZ5WS0v9Yh5spb0TgazHmVRdiRnzXvS
         XuYwZY+7eBnRHbiNtBpaQqxF/DAuH+I2x0tjTd/QqHRaiL2VGAEib0I80oBKA62kUB5E
         dcI1g5UIV0Wsgu8SX8erdQI5qByavFs2e5SUnPAy8J05K0Z8P7I/K2yGScjCFLzQ3Pfx
         mZSP06SkxHZd+5SgzfHBuSyoFl+5JECPXEe3WRsdZPliZKTn3h7LCpzarx+p0wZji14y
         3p85d/AcvyjOThjJ+sNwMXr6FFUOgMw9UVolFep4oQNS9jMz8A97sVrJOj3yVJxsnuEa
         9NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771505373; x=1772110173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ttdv1MjLTh7dlTy4W0gmvcT80sPMOwSYIvTVAnKaV/0=;
        b=FqNtd1OBPdF459n5lA25f6CNbRmgx3oNQJb4U0Aoc/PQKt0ABN69H+CuZkKy28va1J
         Usi1YNsqYQ9Q3vip0TsQzmPPThCKmIwzPm5AYWw4Qwo71FQJhP+0CXlTztLReehY3I+m
         faSkAJxxXQPxZMU5KkmSBTa642yc4nrdzwHvpNBKVQXmhse4bvpfj+6urlWcKQULjEeA
         RAvX7dRiQbKM3dwksvtPosOvd1bFYzRQhvZtbH7qDrJN7oAS0sAQW/RKwF7INjHsAvFT
         DFX/tqNYpD+b8hLv1xW0987+QDwJhKRMf1GuSKt6aAThpLZPT2JATIS8O8SkA5HkZ3Gf
         xOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFLgrbJ5hrk7WUtxD5Yzu7YeGS2Tyh/JjfnV/Vzela1O2mv9WbJwggyMNOWE0lhjCxianeLF2jcak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFvzaqEK250FcM2Znol28AXrKycU7TLn4PU/rut0NKH2LX4x4n
	3MaigamgjUsGALlME6T43y/XP3TUU3KDPHLRfDCD6F0A/C4qzZKBJ5JLGIVLkCS82nIXHmECJsh
	eIP0rVmZc0xFuSw1TiU62dObHsFHLMM54gnIL/8n67iR2AxETB3VubTb4FBTnPU2uOqMo6T8WJL
	Ynl7owb+IgGtysw/ln/u1A7VBZdcZitqmCPnqeRA==
X-Gm-Gg: AZuq6aIT4IhM+msnz+5tV3Up6r0sA3HgQAL6UmavwHVzvcUhAx/+QnH7MLO35dWNR/J
	QCgKn4JK+GoIDuh0TldiMC5aP5NdDpgypihB6JiGd+LRNDZ4kaeIG1YF9D5WgCdhBCi9rfNIbsh
	FC2qOfupSz00BwzqR2ztDnoEruNs0nJKZeqFTWbZVvTGEqFVfQ6exS7+HoQcNO2gqOTDCqfNwwP
	qR81Wk=
X-Received: by 2002:a17:90b:2541:b0:343:6108:1712 with SMTP id 98e67ed59e1d1-35844f9bf28mr16822427a91.18.1771505373223;
        Thu, 19 Feb 2026 04:49:33 -0800 (PST)
X-Received: by 2002:a17:90b:2541:b0:343:6108:1712 with SMTP id
 98e67ed59e1d1-35844f9bf28mr16822399a91.18.1771505372734; Thu, 19 Feb 2026
 04:49:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aUF2gj_0svpygHmD@vaman> <CAMRc=McO-Fbb=O3VjFk5C14CD6oVA4UmLroN4_ddCVxtfxr03A@mail.gmail.com>
 <aUpyrIvu_kG7DtQm@vaman> <CAMRc=Md6ucK-TAmtvWMmUGX1KuVE9Wj_z4i7_-Gc7YXP=Omtcw@mail.gmail.com>
 <aVZh3hb32r1oVcwG@vaman> <CAMRc=MePAVMZPju6rZsyQMir4CkQi+FEqbC++omQtVQC1rHBVg@mail.gmail.com>
 <aVf5WUe9cAXZHxPJ@vaman> <CAMRc=Mdaucen4=QACDAGMuwTR1L5224S0erfC0fA7yzVzMha_Q@mail.gmail.com>
 <aWBndOfbtweRr0uS@vaman> <CAMRc=McPz+W4GOCbNMx-tpSav3+wuUrLT2CF5FhoV5U29oiK6A@mail.gmail.com>
 <ana2ugshqjicqscwpdgo6knv53n4zzuwqp376qil27spco5vwh@ck7wmplz52qs>
In-Reply-To: <ana2ugshqjicqscwpdgo6knv53n4zzuwqp376qil27spco5vwh@ck7wmplz52qs>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 14:49:21 +0200
X-Gm-Features: AaiRm51o4g31g965N2gH-SXwl6Om40wgrXBqrOnB0nlpO7IeBLGRHVAFs5LGkbM
Message-ID: <CAO9ioeWaFLo_iirfTEatoL+MXDXoyS1OvSV6SqT3xUs5LmWpqQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/11] dmaengine: qcom: bam_dma: implement support for
 BAM locking
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: fhtk1SFAqHdpmbHtNdSJO0YoFGcobA66
X-Proofpoint-GUID: fhtk1SFAqHdpmbHtNdSJO0YoFGcobA66
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=699706de cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=CNITKJuBw3o7r-kFhd8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExNyBTYWx0ZWRfX6i9/4hxIntGf
 /QAI26B+F6/41+di0hLCNJghKRtohjVr2b5XcfP5RDyA2BWIGSdSTk4ExTAFvogVBUeQXBSlLWG
 kQBnS2MNfZySemb7CEq94U80rlV3exvnEOjiMIdheCZq8trLk3MJFoF/ylBAx15TodGongI/uvJ
 XUTZ5ucEsOexQHpQSgq45buULG0p1hUvxXz1rrOKdNkDy4rynZ+2+QVj/uFMFuwwnC2slr4Vnyi
 TetDLHU9zp1S9tdLiaUYWr9lOOmSEm8QhTLcQkaCgFCKF1AMOk5U9+BAPAYVpGe9c+j9Igc7g9v
 7FVhRxMlt2ZkFvM+nv5DFUPlebMldPY4sb6d042jMThUsitOguO2WG3mx494k8UuiP4rTGG8v1m
 5WxbbCLRL+b5FWZ8CQj2tVfCPDEhCFULd+2LT4QRklQdIs1PZv4X4cTx4H46UUXbHEphNeL7eBC
 nMx6ihs3GdOqqwlkGjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190117

On Thu, 19 Feb 2026 at 14:12, Manivannan Sadhasivam <mani@kernel.org> wrote=
:
>
> On Fri, Jan 09, 2026 at 03:15:38PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Jan 9, 2026 at 3:27=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wr=
ote:
> > >
> > > >
> > > > We need an API because we send a locking descriptor, then a regular
> > > > descriptor (or descriptors) for the actual transaction(s) and then =
an
> > > > unlocking descriptor. It's a thing the user of the DMA engine needs=
 to
> > > > decide on, not the DMA engine itself.
> > >
> > > I think downstream sends lock descriptor always. What is the harm in
> > > doing that every time if we go down that path?
> >
> > No, in downstream it too depends on the user setting the right bits.
> > Currently the only user of the BAM locking downstream is the NAND
> > driver. I don't think the code where the crypto driver uses it is
> > public yet.
> >
> > And yes, there is harm - it slightly impacts performance. For QCE it
> > doesn't really matter as any users wanting to offload skcipher or SHA
> > are better off using the Arm Crypto Extensions anyway as they are
> > faster by an order of magnitude (!). It's also the default upstream,
> > where the priorities are set such that the ARM CEs are preferred over
> > the QCE. QCE however, is able to coordinate with the TrustZone and
> > will be used to support the DRM use-cases.
> >
> > I prefer to avoid impacting any other users of BAM DMA.
> >
>
> Sorry for jumping late. But I disagree with the argument that the client =
drivers
> have to set the LOCK/UNLOCK bit. These bits are specific to BAM DMA IP fo=
r
> serializing the command descriptors from multiple entities. So DMA client=
s like
> Crypto/NAND have no business in setting this flag. It is the job of the B=
AM
> dmaengine driver to set/unset it at the start and end of the descriptor c=
hain.

Is it really granular to the single DMA chain or can it be required
for the BAM to be locked for more than single DMA chain?

>
> > > Reg Dmitry question above, this is dma hw capability, how will client
> > > know if it has to lock on older rev of hardware or not...?
> > >
> > > > Also: only the crypto engine needs it for now, not all the other us=
ers
> > > > of the BAM engine.
> > >
> >
> > Trying to set the lock/unlock bits will make
> > dmaengine_desc_attach_metadata() fail if HW does not support it.
> >
>
> The BAM dmaengine driver *must* know based on the IP version whether it s=
upports
> the LOCK/UNLOCK bits or not, not the client drivers. How can the client d=
rivers
> know about the BAM DMA IP capability?

How do blocks know about capabilities of other blocks? If there is no
API for getting those we can encode platform peculiarities into the OF
match data.

>
> For all these reasons, BAM driver should handle the locking mechanism int=
ernaly.
> This will allow the client drivers to work without any modifications.
>
> FWIW, NAND driver too is impacted by this missing feature in the BAM driv=
er as
> both Modem and Linux tries to driver BAM and currently Linux BAM driver d=
oesn't
> set these bits leading to crashes.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D



--=20
With best wishes
Dmitry
