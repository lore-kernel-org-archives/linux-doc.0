Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE23EF0CD
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 23:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784589571; cv=pass; b=Y3UUpZr89MIcVy4udJ1YqUi6O0GDFUKz9PTedHhYCQEaKD/XDSaXzFYSaZD8xfT937Uo6vkdsidPC+rupqFrJxgSOYWl/KnLpyUtebKywTzYnBHJnM7wKdEaEBkTXAbAQLGT7ursu0uFBd+fWld0QVtrWFH6YRx0WKX8s3Pu8ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784589571; c=relaxed/simple;
	bh=VD3HIlbzEb7dewmVIFSfcvhuEGHcgLIWaCYKVXgS20o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2YwIsGgzVPIzcaPNFf0fakMLAKBqb5SFd/rMV4bKB0dXwgOZa5pw3s6IVQVWg6g8oGSeemKcIr8xxNAtXPM3B84zDDtti65bnl0Uu/sEQPRzlEaszV9Gf49h6Mh4DEOuN9UiSrr3mZfpUrfHe8i5RXUvww6qUCl03kqLib2e68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s6vDnXlJ; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s6vDnXlJ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382ef647e20so10115341a91.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 16:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784589568; cv=none;
        d=google.com; s=arc-20260327;
        b=VpZ5nxG7aO8CAearZQQweuQfmLz7sx6kPiORR/SlId6oSbDXroCEnaiAChQEP4GPCO
         O+XKGJCo+ocQW5H9+R6MW+X4Zg0/DWbdRRxFWGxFfrsKouCZFGD58dTUIIheMjjkTzG+
         cihzvKiDuI6bN/1Cc0TX0oss+mXBaaC5BloeHDNFdiECSBdsrbaeZqEGsFl5AuT3Utmn
         mG9Z7Ui6dnjgI2bOUCa9bvzZIDsmJBkiI/y8Bo1foPJ7i/mR+MNfM4UmTKJNe1uZh6uf
         cDZ1BHVqnX6ilOomK9XkkEhOlE8J1rYbAkPJVIMQErNRp3gA8EaAhTIGQpJ0jJfL1mZv
         URvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PYpxNurdbA4XJ/6Vuk5WIdVnSVbgksTgEkNwHBXbZV0=;
        fh=pV0Zyb1Hlvp0C9Y1zKZV1558i/bGDfeSxVoUXMYgJVI=;
        b=qZb22FtY3rlWxJQK9enVJSnmDvzbaOmaveRqQ60s5y0nx+98yiHA7pnQSVVpgCVoWq
         hrf9qwNKzEuTVLHej//H/4+VNWi60Nnr/1ibp1mON5oDtf0YrPti6kGu4dJh2uywMV9z
         WBf2QT4nix/j+krAA6ry0i+319C93FgEbpvPWDZ7A+K6p9xFCBdeH6V5Wut8FqksmbQw
         KeTgOhDkioVwgYeWkGcZy1rhCmJ+1ZmHmalz5JLiW7bPyQ0gjtMogL/ZgbB7MiX1Clzw
         GVIWNBYxImKho250rCOJO6r6voYu0ANiUQCJ0OG4m78uMDnJj/XYfaPm+6esYF9hKYUR
         Pl7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784589568; x=1785194368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PYpxNurdbA4XJ/6Vuk5WIdVnSVbgksTgEkNwHBXbZV0=;
        b=s6vDnXlJ9z6NtpY49USEaFFyzDZGDp/vEPjToHrnv6bTvXKZ46obqIS+jfPx26/GB/
         fdHybSFsTRU/EBqaEZTJ1Q0SRXj6U+FG4F4efVXl+9woIAzVa7Nz3MBYSUVk6cEylAMt
         uFb8Gjxb6QpbfBWgcVWYMIpRALkPzuvfCcSRcUxLfCjzIfRpgv+nXJRbmxHdaGf4sjwX
         VPtDITY3b9/6bSdUyPBA9S1QuTvV23YrkJ2/lXP/0OHtIoiY6pdjZEw7Chf7KDFA9m+U
         0FL+c4alVP+/ag8KHbxkXAPn4JVv7ogGNkBtzbbXv8ZSaMj7EU63IdiTOcfRlaWoKX13
         odgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784589568; x=1785194368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYpxNurdbA4XJ/6Vuk5WIdVnSVbgksTgEkNwHBXbZV0=;
        b=KYdcEtiq28tGjMpiXn5QQex/oVcgV7xqfnlnFAzxRoBML0myKAWrhT/2CWSiAPclTp
         30d1M2NuqV9B4vsPclX43EYX2b7vRJX0L5wajd13ulBqIegYQS8todsASOQECdx7/sxK
         uYy1QrbwN4xzmqPsumVKATeHuw6N2EbBrzOQsjC/85sdofDGWvPqhYoUabXaCZQCAxZv
         nDfhPvw4WK/CayfbBLPF9Q67xgH9o7qzHigjpATgmLr2yfb2KvLYXgSO0M7sWaPGVUg1
         ZXa4//r9v3RlX/EDJIk1byJokGvYcKDX00lD3+Rkoy1HnvJzzdNUbv4AIrSZtqVdOlJP
         SKBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4JiSh4MH5FffIdqW/AoLHBBboO24Wh25Wv56cPHJr4t/RmMhRVzJwAw97H6sPLTNdCsDO9lzYQzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44AP9RafxqEcqy01O21HxS2gd4QGutdNrTfMT4imwh6F3btMq
	9F5PMUNsjiUlrV4E/3219UQdZUfvMlxTXg/1OoGx1Ua+OqmYa+rf7na8D86VQSKlupfsx+j7ELD
	8ilEIIrWHJo5qgm1c7NdskpdzND+9ypBPR2VAoHmL
X-Gm-Gg: AR+sD13UWzgsgfON0qouhHN3yDH/pA6SwrZZg6BB+V/w065TNCZeQ+wvOon58CS1jHB
	cv14kBg9whbm0cWnSCQOJhc8FVp+m4+1C0inS39s2flP2hZy/VdTwaQFcJ9zsH5eqjXrO7Rk+ua
	15Qj5Wa3i6eocOzvtiBSOFJmtfS0vYzYHryD4kKJiDuzWuj+WQZ6EzevX2+3pL9SPFBItu3VHVH
	mtmAqOfzBsWrsL5McuUszjIxxZVTl4p5Frb+4C8o0OLy1WRusUT0TCyBJF3CQ==
X-Received: by 2002:a17:90b:5905:b0:381:23d5:693f with SMTP id
 98e67ed59e1d1-38e4b534bedmr15548062a91.28.1784589567330; Mon, 20 Jul 2026
 16:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-10-dmatlack@google.com>
 <178433098576.189683.2364970585754668266.b4-review@b4>
In-Reply-To: <178433098576.189683.2364970585754668266.b4-review@b4>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Jul 2026 16:19:00 -0700
X-Gm-Features: AUfX_mzMp9DAjORlO4Z9lJDkbL8nPaOLaXiKeGO1DzMTd_1FqdXSUAFnXR38zlo
Message-ID: <CALzav=eZYfYYKAGEzk4TsGFLp1TPb2iFePNmqGsjX4jEZNJ9XA@mail.gmail.com>
Subject: Re: [PATCH v7 09/12] PCI: liveupdate: Inherit ARI Forwarding Enable
 on preserved bridges
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

On Fri, Jul 17, 2026 at 4:29=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Fri, 10 Jul 2026 21:26:12 +0000, David Matlack <dmatlack@google.com> w=
rote:
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index a95bfe5eff77..74a11e520f0d 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> > @@ -816,6 +820,20 @@ int pci_liveupdate_enable_acs(struct pci_dev *dev)
> >       return 0;
> >  }
> >
> > +int pci_liveupdate_configure_ari(struct pci_dev *dev)
> > +{
> > +     u16 val;
> > +
> > +     guard(rwsem_read)(&pci_liveupdate.rwsem);
> > +
> > +     if (!dev->liveupdate.incoming)
> > +             return -EINVAL;
> > +
> > +     pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
> > +     dev->ari_enabled =3D !!(val & PCI_EXP_DEVCTL2_ARI);
>
> unsigned int    ari_enabled:1;
>
> Sashiko asks a valid question, what protects other bits in this word
> during modication?  At a very list a comment is needed.

This was my reply to Sashiko, not sure if you saw it:

.  pci_liveupdate_configure_ari() is called from pci_configure_ari()
.  which also sets dev->ari_enabled=3D1 and is pre-existing code.
.
.  If writing to dev->ari_enabled in this path is indeed unsafe then that
.  is a pre-existing bug.

I figured that a comment wouldn't be needed for continuing an
established precedent (it's ok to write to ari_enabled during this
path).

>
> --
> Pasha Tatashin <pasha.tatashin@soleen.com>
