Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D01726CE2C
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784198; cv=none; b=YktUC7XeT2+lHbt5EQ1CEJC6u103zdKgcLgKJKzJixJjNSbaIViwlP4JQwZTEhsRYBtRRLFYR3eWM5zpHYSFg8PqUnsZGtCc0zVumkomFgiAYxF4gv1/M8blZJKU8+L/PvFK3iy/LNYAp/va5NMwq2M3bZ5OoT57KnnwCaWeRks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784198; c=relaxed/simple;
	bh=h6uyuSEc+eNvYFBj77azLn83ZPugJ+Y+tT9TsC/zqGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAtg7C6d8U0Mx4vB4J/2OgAO9fQJBC2pzEyjsbOGIOWOzIsBGETHGmHZO/a3WTAdMb2IFhwX8JgByShlGNmZXU1VJWIJFL5rJ96TaKy5pLfz1+4NBhVylb/iXj1vPQos5hHq5vHr9MTwWSI6W85WY5FhpzcaTsq2qFMFqb2dR5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=3YiSGee6; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="3YiSGee6"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a44b3526e6so8084031cf.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750784195; x=1751388995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6uyuSEc+eNvYFBj77azLn83ZPugJ+Y+tT9TsC/zqGg=;
        b=3YiSGee6B94WNxIaZpSvPOqK3E9JufS1dmYD+Owe77Bm0DpyCLKOEv87acM8aqaWnb
         mTR+1mxeiuiwuwU17Vj0KNdTrfktJanr6QJ3lEBxAk+I5S0tqBkDMvb30dGCAPJqMaWc
         9ByVPWs1+mVQshYVHtIBayIbX6xTipV2zsKNVmuwK26w6r+gOC4Ux3Mm32+z+9vJF0CE
         3YJS9v6Loecj2BQGubKXCHdyjOwjgZ8l7FDYBKnEdZE3rujGouam0bFWgQzJpEm1C+hi
         WsMp7z9wRrBra4mlyLzw4t+QpD9/Iw8QFFv1MJSTcTAHV1HLOCtQDLhGgNFaY61Rg5z8
         ZB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750784195; x=1751388995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6uyuSEc+eNvYFBj77azLn83ZPugJ+Y+tT9TsC/zqGg=;
        b=GucQgRE7CXL+2BGwiqXNn9gBQD7NM2kwUXXvWAbdXWt0IKiEGv3pLjJHrqi0IfatiH
         EnqNhTT01bXT7RTSjFYMurpEg3Fd5y9PWKQu6RFaWdDzSQGylyVOrEWsaaziUWLvKXcV
         aziRT6DR2NYNnMstXy2hzCdqwqR744viVFgXMtsFKtFjkr4jIfIbZEh4CS+5h9m1Q458
         VOIg0N6mpv64eLqyybbRRkQ/pzTs98xLnExkYVh/5lnv/SeTYkPFbsdEiRrHrvUsCSHv
         0roYN3UB3T0JU6FWfZGRgyae4ogX/gAST9sNz9Kdq+krPE9QQoT5LqKOlitgMG3e4koa
         A+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVIObmQU4/mJwlqF8HXrBL/gdl43QRMDTMGtWFOstkoRcxQ2JYqlj+nfSpgPJz/WiUbzpm6/di61ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLaHznqEXQrk+zh31nFoOOdddmg4/XeEhG6dpQx/UuIqOOrOoc
	xYg3ShLXnVSTMGkuw6QTB4US9G09jZwY7lrSXA9rujSrcc77jLkC3LcxR4OVq0oYWAahg2zCUeN
	NxEBHgHEI9QWZ/CvJFkJROWQn26Q0rzhEwpqDJThZkA==
X-Gm-Gg: ASbGnctJYwrkD1P+d482ipWvTCMhKNaNnlSKPvcR99tpfGxfpZcq5DH19HGaoJOEkZZ
	3J+roaNBKTh98XLzCTv0G6ogBNqws+bi+iZVS8BXRCeIFhiwYnzSyoEi44pz5YIDYL0yw6cfqKf
	1bgKHMDxks3jYRvyZVVBTazJ2dnXC2Kwe1bgLMC7q8
X-Google-Smtp-Source: AGHT+IHmzhS+s5DWVIpBCV+GDgZgEUwIzmCN1Z+49uE3dFHG2eUFqSxiWqwoQKMZLKfKxNV1yxiPBpy1n5RYjTOahB4=
X-Received: by 2002:a05:622a:1101:b0:4a1:3b18:598a with SMTP id
 d75a77b69052e-4a7c05fbd48mr986921cf.5.1750784194975; Tue, 24 Jun 2025
 09:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mafs0sekfts2i.fsf@kernel.org> <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org> <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org> <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
 <aFP7wwCviqxujKDg@kernel.org> <CA+CK2bDqO4SkUpiFahfUx2MUiE8oae9HmuaghPAnCwaJZpoTwQ@mail.gmail.com>
 <mafs0ikkqv3ds.fsf@kernel.org> <CA+CK2bCA_ggpvbY+MQPaAHsN7MOzV7D3=MYvfAP4cFwhThJpPw@mail.gmail.com>
 <mafs0frfpt8yp.fsf@kernel.org>
In-Reply-To: <mafs0frfpt8yp.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 24 Jun 2025 12:55:57 -0400
X-Gm-Features: AX0GCFup8zCy53y0VodnZFfK3G9WBH8l9G1BP-xRmeFAKvueDCp8EdT_3Y4SA-k
Message-ID: <CA+CK2bDFh8Rv-gUZ-st1H4JVFmm7F3CBjjrY_8RTEO-i1SY+og@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 12:12=E2=80=AFPM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>
> On Fri, Jun 20 2025, Pasha Tatashin wrote:
>
> > On Fri, Jun 20, 2025 at 11:28=E2=80=AFAM Pratyush Yadav <pratyush@kerne=
l.org> wrote:
> >> On Thu, Jun 19 2025, Pasha Tatashin wrote:
> [...]
> >> Outside of hypervisor live update, I have a very clear use case in min=
d:
> >> userspace memory handover (on guest side). Say a guest running an
> >> in-memory cache like memcached with many gigabytes of cache wants to
> >> reboot. It can just shove the cache into a memfd, give it to LUO, and
> >> restore it after reboot. Some services that suffer from long reboots a=
re
> >> looking into using this to reduce downtime. Since it pretty much
> >> overlaps with the hypervisor work for now, I haven't been talking abou=
t
> >> it as much.
> >>
> >> Would you also call this use case "live update"? Does it also fit with
> >> your vision of where LUO should go?
> >
> > Yes, absolutely. The use case you described (preserving a memcached
> > instance via memfd) is a perfect fit for LUO's vision.
> >
> > While the primary use case driving this work is supporting the
> > preservation of virtual machines on a hypervisor, the framework itself
> > is not restricted to that scenario. We define "live update" as the
> > process of updating the kernel from one version to another while
> > preserving FD-based resources and keeping selected devices
> > operational. The machine itself can be running storage, database,
> > networking, containers, or anything else.
> >
> > A good parallel is Kernel Live Patching: we don't distinguish what
> > workload is running on a machine when applying a security patch; we
> > simply patch the running kernel. In the same way, Live Update is
> > designed to be workload-agnostic. Whether the system is running an
> > in-memory database, containers, or VMs, its primary goal is to enable
> > a full kernel update while preserving the userspace-requested state.
>
> Okay, then we are on the same page and I can live with whatever name we
> go with :-)
>
> BTW, I think it would be useful to make this clarification on the LUO
> docs as well so the intended use case/audience of the API is clear.
> Currently the doc string in luo_core.c only talks about hypervisors and
> VMs.

Thank you for the feedback, I will expand Documentation.

Pasha

>
> --
> Regards,
> Pratyush Yadav
