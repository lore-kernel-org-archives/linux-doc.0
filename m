Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5911382F03
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778621368; cv=none; b=H7cH0h6qNam86DclRoq+i22PdqHrLdpsugNbiYTB7f+bcte3+xwKs6eUrnIxBEq0sA0bJMYRkjDManIfthpAF8R84Wd976WMvu4G1G9JveNc75wAYZzS9B9S6qoQ5G/5TbNyAChbEZDxYw+R/MtD0hPjiKR0PgMPX5yQ4fVICGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778621368; c=relaxed/simple;
	bh=PVEZ6lDsqfrkheYFwj2coqzGfYHxktZ0uXkER3yjEWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhMB5XJgbxgVy/qJbeTcWHy3J7bcNasQRYPMwGZGqO67g4shGM38JEYwzdDW+jiFVpP/TsfSD2plRT878zWygCyDypDf78HkSsWUEKkOAmHikAp9WMZUoinFi4XGWJfLAUmJBE7E145NimqPeUFjlG9NNlSFkiLCTkvMCcPQ6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O2TqEeYx; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2TqEeYx"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1336742714fso94c88.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778621366; x=1779226166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9as17r1aSDL1/IjkeK3rxFdLzhg/o+IZ2HDHZMfPp0s=;
        b=O2TqEeYxQ++uEzCuAjSrp9S4rZXfnp3qCMLVHPDxioCo48GoTxdEgkrstQufcqRGl2
         5ugnERzU6ErV4dQjNB2XQbZVFCBoI62CIUqgsheQA3GuF8LNEuQIQHObJ48N1rW5bxBn
         p1VUyj9oN/kW8j7kutMQ2q/PtDM1bSRSErzS5XBXPs/J3JALkHzf7dFwE59NTSfuZQZ8
         BvDqmSJMaPdZ7+EqH+kSF0Q/I5Yuuc3X8tw4JhqU9w5umF1bPiJC8sq+Yxs10c8zEm/j
         2HzL7yJ/A4DOrx2RS3k1dt1nwUg6KaO9RE10N46u7bVIHJmPnql+qBD8hqmRPrOBP8ZW
         WHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778621366; x=1779226166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9as17r1aSDL1/IjkeK3rxFdLzhg/o+IZ2HDHZMfPp0s=;
        b=PWABn0XXkUewxwQPaHPFGE2Pc5rlj/uFvtssnPVDWGfL1p+EyvSo3Si1vRzMNVhTBu
         evrNJ5WrgYFBO7AzssidUqwuyCyPadtMCO25MoZzPeXTC5niRJsoyoWgkVTqZUIqCwGZ
         lZFG6QF91XtN0v7riyMHuE2iuMbqeHWxSBdnjxKtXAo/z5Dca5LljpP0vNpMwz/EfGli
         SdQJ6xFTB9li7J1BjGliB5nXjgZTW4DCiUoOgKA2hbzEBKV1zVUoEfynDp8n+FEzZp+b
         +z3OO2YHgCZi0/V1OD0pt6IyemIN52J+Qq4Y1hLxcbZbt27LfJ6NJ/Cb1AFQS60/3viw
         Simg==
X-Forwarded-Encrypted: i=1; AFNElJ+4YRic5DKg59jUU41QHz3tXdqf9xcAvMXtlujNC1SXUJs/Paep7wshEEnMtSyhoIuNIU3tTQDH+ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9MD7DzlHIhL4wUJ+gc8fARKLnxaTN26dC2Ah5goSHW7rPpP5
	iuMLqgbYc0UEeFwt00CBlippr6Znk0XVSHGEU8RTAdJ5ewTwjLjPP6C8L15/iHiFHQ==
X-Gm-Gg: Acq92OGlfhxR4ynTNdE1gIAi/cIW7QR/DFiMvCbBi9qGQRBg2a0EK/vHEZniCXoYpBT
	+NSdRsmVXxSHzhs2fFcDX5IwVKjTbnui9pR9qo1wAXRtMxxrY9wHT5R8zv4rRtQjxk7xtwPW2Ir
	kn2RKns8zQhyBnxK+3qsrL7F0H5fCYZVQW1PNIfcQUdpVWAvdFDkPMLQm4NSCCUpLFgP5+LsOg2
	+y59bdcuPfBP/W88wvXUVGw9pYHOu0g5ulpD+Ob1g0E6shIuNAZG7fIOAxWfKz9TUp4ntg68iww
	G1XJRbkCw5ixy7kdlzLRkgbgvgV2D6hjqCzNUpVnxynoq5uIuGzUxjZvOIWDENY5CUecyC+jrnv
	56W3m+4Sfrnr0yTBwDIhw2caXvoUcKBSgk1mEduFABrI2RDkJxAI1bSW7lehrzxnpelMeNDFdjH
	v8OE1/+uhbrmkC9ID0mgzKJf7/IQH3da4iXUcqHoXjrWg96AKSweVrANXq5CMP6l+iTIrXyGys
X-Received: by 2002:a05:7022:699a:b0:132:1e01:2d6d with SMTP id a92af1059eb24-13401ba684emr108868c88.2.1778621364956;
        Tue, 12 May 2026 14:29:24 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fc59sm23087120c88.7.2026.05.12.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:29:24 -0700 (PDT)
Date: Tue, 12 May 2026 14:29:19 -0700
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, 
	ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, 
	apopple@nvidia.com, chrisl@kernel.org, corbet@lwn.net, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, 
	lukas@wunner.de, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v4 02/16] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <20260512211412.GA2819150.vipinsh@google.com>
References: <20260511234802.2280368-1-vipinsh@google.com>
 <20260511234802.2280368-3-vipinsh@google.com>
 <CALzav=fR8c2tYj9jeOc_K=xoupxAfWMHmk0ipDniSXg6uGiFYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=fR8c2tYj9jeOc_K=xoupxAfWMHmk0ipDniSXg6uGiFYA@mail.gmail.com>

On Tue, May 12, 2026 at 01:59:51PM -0700, David Matlack wrote:
> On Mon, May 11, 2026 at 4:48 PM Vipin Sharma <vipinsh@google.com> wrote:
> 
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index c12d614fc6c4..019de053f116 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -45,13 +45,15 @@ config VFIO_PCI_IGD
> >
> >  config VFIO_PCI_LIVEUPDATE
> >         bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> > -       depends on PCI_LIVEUPDATE
> > +       depends on PCI_LIVEUPDATE && VFIO_DEVICE_CDEV
> >         help
> >           Support for preserving devices bound to vfio-pci across a Live
> >           Update. This option should only be enabled by developers working on
> >           implementing this support. Once enough support has landed in the
> >           kernel, this option will no longer be marked EXPERIMENTAL.
> >
> > +         Enabling this will disable support for VFIO PCI DMA buffer.
> > +
> >           If you don't know what to do here, say N.
> >
> >  endif
> > @@ -68,7 +70,7 @@ config VFIO_PCI_ZDEV_KVM
> >           To enable s390x KVM vfio-pci extensions, say Y.
> >
> >  config VFIO_PCI_DMABUF
> > -       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> > +       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER && !VFIO_PCI_LIVEUPDATE
> 
> Why does enabling VFIO_PCI_LIVEUPDATE require disabling
> VFIO_PCI_DMABUF? I saw the cover letter says "to keep things simple",
> but what specific problem does this solve or simplify?

I should have provided more details there.

When device is getting reset in vfio_pci_liveupdate_freeze(), we are
zapping userspace mapped bars, we also need to use
vfio_pci_dma_buf_move() to revoke dma buffer access or
vfio_pci_dma_buf_cleanup() combination. Cleanup takes the memory lock
which freeze already takes, and there are some refcounts which are
managed in both of these APIs. This was causing complexities with code
flow based on result of pci_load_saved_state(). All this was adding more
refactoring than I wanted in the series.

I decided to just drop the change and disable the support of DMA Buffer for
now to keep number of patches less in the series. This will go away once
we remove reset condition in freeze.
