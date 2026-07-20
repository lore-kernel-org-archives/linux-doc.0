Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D97416D1B
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 21:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584520; cv=pass; b=SUmO948i6HgyU9W+3BWdkxWYXX7TnJsQWFvcBc6Wro36pu1HFM0LemlQ2PQkmLASv/SLw5XuQ+46XqWmPHK+ENn7lAePx5yjBpe4osUr1ODPXV3VwThjxJnbWrsNhj1OrppLPeRpv2nr1+E/Rp5FvLuZ9gQkId7Bm3QD7tq1Mco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584520; c=relaxed/simple;
	bh=D/j1C6kmseQgrsCTCw4oe5cpvUdlEQPiJRprWhYCNGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKWsQ8ZIFQ07sXK+V4AWsNCX0Tg37dB70EpZZeK26PmlRa5sCioSD80Ics4YIo33QIC1ycRdpSZVj99FQO45/xjcxlIJbxKG+eItpNvmYPH4fj/MT6rIcwGZESx6hhKG/Vy6xD2LxyVp2ELUUQZ3tES1r+CvWOsflwLFKa7jHMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HyBpl3yM; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HyBpl3yM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38175907a56so3237644a91.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 14:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584519; cv=none;
        d=google.com; s=arc-20260327;
        b=Tvx/k/uMHUsPsTourWaRDGw98p0IXGUqki/GZxMf7r3kP6VULUuDdj3M9UmybapXtA
         B0/EeNnKYIrjtNult/L3VV8akTNU2LUFoZfbr94frdsBujicGJCqbAfv5Cm614+lNA+e
         9LOdFGh7qun78MKGklVilkqTiveHk29bQDb+RuE1+yzQl3Bn27pk1C+n84IQEZuYCM/z
         X9OsoDn1xlQm3sxFlC7POkmm/1QXgA3Jq61nPvKbnvcbH9ERbR4y3QnTKpDwCE/TXqJB
         b5N+uSJkw3CoefwmvnZhvSp3TIpgJDAn5tDdbNOmqWwLX1xG0oHVG9dzF7u8rAfQ6lnr
         8IVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9mE0sfVA6cta9/M5CvPkkpA0kKt/DbFANSsjRo5aapo=;
        fh=6q7S+jzVS3Y/LwQIBiMROC1JR+L5FmWLGDWr/UM9Cck=;
        b=RVd899i/WhTS+6umiH3LUB8Fsmy34V1rYVuJR0NlXtdsbwr3u7P7mwF1vUUcleLs+r
         uXEbUSv4/4+FjAfE1Ak7hZM+PO6sLPLT68XzImxG4aQBWn6h/243psMDBDhW7hlFcE5k
         LFL9+arq42PhYApNH2uWOT/VQbNb4i/Zvh13VwmXICebcrmxx/JBYfZeCaOP8XxTNKUS
         Kbsys8xNTNUWnpYJalCZcRf6zLYxGSLA/pWIpUSnzdgieYLV8nC8BzRdZ9381bfPHHdB
         4rBosUd7pnp1ub+O4ST5KYkUr7Ep0AdIfWc0sT7jMh6NO1hdbzRxWY5/V8QUD1tLiwRh
         9hZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784584518; x=1785189318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9mE0sfVA6cta9/M5CvPkkpA0kKt/DbFANSsjRo5aapo=;
        b=HyBpl3yM61QnFkKtCw8LP2AtzFWYKLyLtX9iwY0cdcwHN//wXoZ9CFrKQ3CKsW7Mch
         UQDLFShbpbST00elNCg296D7gtwMkWqlykU5tYPomdU7qTcuDFI05E2JBpLPqd36imMF
         v2zbuWKwwsy49/ccoiBayIDxSYL+ps76X+RQrCf5GpZ63gav80UswM9opZ5bJPuj2k0L
         uO4jbgVf3lpLrkgtaO2TzmUPIPDXFcTPHcCkuu745ItUXVh1+ExuYy9lWyLZ+b486nMc
         aDeu5sk60qg7hVSFaRMm9pZAGvBSGCdvOTbAwNce3VD6aOCLf27KjKMETSpnsc7QYqyb
         J8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584518; x=1785189318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mE0sfVA6cta9/M5CvPkkpA0kKt/DbFANSsjRo5aapo=;
        b=eHyNxd8M30puTCLiqT0xVRhdaq6mcuN9XLntu2cTws25oe4lACZFgDUMAne2Wb1MG6
         ghr/xmBzGVaoKkcqtZrUE9lqEmzkVQx2h5ZnFG/Ljoc7a1WmQDVVdkaeouDHagNpcibh
         4y4TDXQ/0cL2+HQhJYBZwvIWHQz7/2+TvSQ4sxlBWwej1JFipE2HQodmMw10VTCyhAYA
         4+UB5lIGUcLLVHqy2cANmQ13tO+m5D523daSxc/AVQZbiV7qHh+aU86kU3+qYYiMyxCG
         DzaUDTYU+8FVbPNBY399CKUE8YFLwySFnAE60xl5dPLXugcHkrVC1ulB5Ye4cPHqb76/
         cHjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoW8ONj/lZWavSZ8QMg8k2beJaacT/xX94XTJHf57XZDJ0kXZHVBMXKxYRLlLYMhMe9UmA0QRqzHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2fAethP/T/xLI7YvdxmR+TkDskldf86IYuADXNSOv7waoXtrg
	iFi4YkZcYJDzGUNWj43XArXsx4Nmqi6CK+Acf5AHrPyk20y95whZughplfptiTBQcJZKJiptWJd
	U/Vqdku0Gd/UZM+FUlsNAZZTilpzVomWwBeTRilgx
X-Gm-Gg: AR+sD11618GNbwGV3Qf1KaiHaRY0WpSgZtTWogBdL1W+5CznQJ33UDboaRXRn/QO+h+
	vGzmDPP8pqM55HMaGjTzDV8AZ0MCksbVq+4r3G9uDG2fuskuswU8DIOAn/BrkYwChVpJM1CEEhi
	+wvNbifvidridWxNqfn/0rU8pknf01NS0/klqe22hSmusqr1WkL0XjmTeZZV+gAiaGynJiUW904
	NVpHr7XhRwfR1h0hveLcGWUNH5z510k+8grEEJr8qntx/CiTNsIEhOIBtlT9KXr4piGEPM9
X-Received: by 2002:a17:90b:1d01:b0:380:8bb9:aba9 with SMTP id
 98e67ed59e1d1-38e3d13426cmr20701271a91.3.1784584518042; Mon, 20 Jul 2026
 14:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4>
In-Reply-To: <178432481253.189683.3297727348836286619.b4-review@b4>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Jul 2026 14:54:51 -0700
X-Gm-Features: AUfX_mzVY7YuVDoFqhrPV6EULV5udJxArm79VLoT9W377bOVTdCDKuzAWRnUCOk
Message-ID: <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 2:47=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@google.com> w=
rote:
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 03075ce06ac9..df6a02240aa4 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev=
)
> > [ ... skip 76 lines ... ]
> > +     /*
> > +      * Hold the ref on the incoming FLB until pci_liveupdate_finish()=
 so
> > +      * that dev->liveupdate.incoming cannot get freed while the PCI c=
ore
> > +      * has a pointer to it. It's better to leak the incoming FLB than=
 do a
> > +      * use-after-free if driver does not call pci_liveupdate_finish()=
.
> > +      */
>
> I am confused by this. Each preserved PCI device must have an associated
> FD preserved with it via LUO. I.e., vfiofd would need to be preserved. If
> the vfiofd was not reclaimed, and finish is not possible, that vfiofd
> would still be owned by LUO, and therefore PCI FLB refcount would stay
> positive.
>
> However, if finish is possible, and this is the last vfiofd that is
> finished, FLB will be freed as soon as the reference count reaches zero,
> which I would think is the expected behavior.
>
> What is the point of holding a reference here, instead of only for the
> duration of FLB access, i.e. to make sure we are accessing a valid data?

The duration of the access is from here until pci_liveupdate_finish()
because that it when the pointer (dev->liveupdate.incoming) is
cleared. So that is why the PCI core holds the reference from here
until pci_liveupdate_finish().

We could avoid this by deleteing dev->liveupdate.incoming and,
instead, fetching the incoming FLB and doing the xarray lookup every
atime the PCI core needs to access the device's incoming ser struct,
but that would be inefficient.
