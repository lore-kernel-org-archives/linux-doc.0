Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D9818DF90
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239947; cv=none; b=hIWGaYa/iWg4AIDurM/cEOGbqeYvcl/spyFN3ast7nW4S2bjWIxXkpZi0Naz8U28suXHl93fyh5eUNqXd72T8KxOCmeNy36JpxNhqJplQIZyp9n2szFNRlmEEEGNbW9lizlEHChuApwIIzV2YSNCIe3/dF6OWdINA7lOg29YkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239947; c=relaxed/simple;
	bh=Jt8GhVwIJ0PpckxRD1fsDLeovdyYkY5mRPIrdTE2am4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Amh8yOGbWrMeFtKwVbt5c5Cxfx/w/20+Vg1t6CPccL4fGEljRsRWCuw6k4zx/iOdJxfGszx0CALoVh7Yp21ATdLsfoLgLsObfc4hvR1egtKzjst/UfUXzAB+9XV28XEo5pv7QIn2jzDS979VkVtCknvKfNEdJUwFcUW7nuCmMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gP39tfjU; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gP39tfjU"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4608dddaa35so209341cf.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729239945; x=1729844745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jt8GhVwIJ0PpckxRD1fsDLeovdyYkY5mRPIrdTE2am4=;
        b=gP39tfjUGJ1EjMYC51xJxXti4iXlZ72HS7uRUTDEkVt+wNwISXc4oHkHWkatvNaJCd
         hmcFG9k+8AiXTqHV+gL5ZTBOe2J17xWbTA7cIDK1UxuMTLLEwG8Tdt9bQNVoPilIo8uw
         eO1z6WrI4mqeNeRkhMjk/MShY1siq8NdgHeywWg8HnARsDkrFNZCy0TE/OmwLqxLIuUJ
         /PONy+sYskwvp3KDMg/Eg5Z6V6LZpAfIS/23wmEOd0p1Ym8LK/sn5ScSqGFuk2Rk+m7u
         UPxqS1szvWogQ7wuZERs8dDUeby0g94CpkN60Ck1ebcdrHMRJi208WLcDJUiI2QFYNSN
         Akdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239945; x=1729844745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jt8GhVwIJ0PpckxRD1fsDLeovdyYkY5mRPIrdTE2am4=;
        b=r6mkgqsySaNCaxAFw5/1s+ZgfuqIyRt+tdy98p3lBrEDS2KBXHlc838RUWhQATesjJ
         O+XXd4jXXLAjPB51hUP+t8n5sECPgp3Z8qtAxuMiWuk3nOXXfEnBRt8oP2xOeE/Z5X0s
         LcBIbbFMMQCtvF8wsOBMlW25tGWRE3Q4W+0Y3wdBNa2b7Q73XPq/2q3La8mc0PWVn/nS
         xp3aZ39pLJbzI5dyYKowN2TNPPcxVFYLFiqFr4mSYKPc4c9SwwZLt2GB+FOOErkPG5yu
         oh5yd9TyH918k+WpIs/BbKFlWLsrzVSG2+G8eV3JTran7+A0wGwGTaW6sywnzut7c0S7
         trSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuLcL92DCYEU/DuVqod3CUy1gTQrr/stL98nWpFCm1C2vkj+NmItjrEZUYn7/g90RCVn7SnxQTTMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgu0A/xDdpDsoB3HsXOa1aXNrOFNdC1HR9V6/QCx37EghzmnWA
	2Vz4ALBpwBJTb4FsfQnFsj0BTkNUDGasBRK0MIY04vK6YU+YHE83TPbJyAulZczPPpj84fhjGCL
	EOOPTnw2PcSeYXnwAYaWzj0ZgN1gKIc6/nm3h
X-Google-Smtp-Source: AGHT+IHszT2qnPF+/LrLvnBLskmo08I+R1ZWTRt6h1m3zNH4bLio3oPTJJT+mFXQ4HXBbS2kLPhvZ+c25Porc+DAyE0=
X-Received: by 2002:a05:622a:4e05:b0:460:463d:78dd with SMTP id
 d75a77b69052e-460ad73909emr2542951cf.4.1729239944790; Fri, 18 Oct 2024
 01:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008125023.7fbc1f64@kernel.org> <CAMArcTWVrQ7KWPt+c0u7X=jvBd2VZGVLwjWYCjMYhWZTymMRTg@mail.gmail.com>
 <20241009170102.1980ed1d@kernel.org> <CAHS8izMwd__+RkW-Nj3r3uG4gmocJa6QEqeHChzNXux1cbSS=w@mail.gmail.com>
 <20241010183440.29751370@kernel.org> <CAHS8izPuWkSmp4VCTYm93JB9fEJyUTztcT5u3UMX4b8ADWZGrA@mail.gmail.com>
 <20241011234227.GB1825128@ziepe.ca> <CAHS8izNzK4=6AMdACfn9LWqH9GifCL1vVxH1y2DmF9mFZbB72g@mail.gmail.com>
 <20241014171636.3b5b7383@kernel.org> <CAHS8izOVzOetQH5Dr6sJzRpO6Bihv=66Z2OttGS7vU7xjC=POw@mail.gmail.com>
 <20241015124455.GH1825128@ziepe.ca>
In-Reply-To: <20241015124455.GH1825128@ziepe.ca>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 18 Oct 2024 11:25:30 +0300
Message-ID: <CAHS8izPLyTa=rUbFo0B29HWHdmLV4rF4q3qC6XkgksGMSFxjyA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 7/7] bnxt_en: add support for device memory tcp
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, 
	pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	michael.chan@broadcom.com, kory.maincent@bootlin.com, andrew@lunn.ch, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, paul.greenwalt@intel.com, rrameshbabu@nvidia.com, 
	idosch@nvidia.com, asml.silence@gmail.com, kaiyuanz@google.com, 
	willemb@google.com, aleksander.lobakin@intel.com, dw@davidwei.uk, 
	sridhar.samudrala@intel.com, bcreeley@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 3:44=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Oct 15, 2024 at 04:10:44AM +0300, Mina Almasry wrote:
> > On Tue, Oct 15, 2024 at 3:16=E2=80=AFAM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > >
> > > On Tue, 15 Oct 2024 01:38:20 +0300 Mina Almasry wrote:
> > > > Thanks Jason. In that case I agree with Jakub we should take in his=
 change here:
> > > >
> > > > https://lore.kernel.org/netdev/20241009170102.1980ed1d@kernel.org/
> > > >
> > > > With this change the driver would delegate dma_sync_for_device to t=
he
> > > > page_pool, and the page_pool will skip it altogether for the dma-bu=
f
> > > > memory provider.
> > >
> > > And we need a wrapper for a sync for CPU which will skip if the page
> > > comes from an unreadable pool?
> >
> > This is where it gets a bit tricky, no?
> >
> > Our production code does a dma_sync_for_cpu but no
> > dma_sync_for_device. That has been working reliably for us with GPU
>
> Those functions are all NOP on systems you are testing on.
>

OK, thanks. This is what I wanted to confirm. If you already know this
here then there is no need to wait for me to confirm.

> The question is what is correct to do on systems where it is not a
> NOP, and none of this is really right, as I explained..
>
> > But if you or Jason think that enforcing the 'no dma_buf_sync_for_cpu'
> > now is critical, no problem. We can also provide this patch, and seek
> > to revert it or fix it up properly later in the event it turns out it
> > causes issues.
>
> What is important is you organize things going forward to be able to
> do this properly, which means the required sync type is dependent on
> the actual page being synced and you will eventually somehow learn
> which is required from the dmabuf.
>
> Most likely nobody will ever run this code on system where dma_sync is
> not a NOP, but we should still use the DMA API properly and things
> should make architectural sense.
>

Makes sense. OK, we can do what Jakub suggested in the thread earlier.
I.e. likely some wrapper which skips the dma_sync_for_cpu if the
netmem is unreadable.

--
Thanks,
Mina
