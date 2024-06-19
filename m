Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA94B74045
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 06:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718778968; cv=none; b=boE/eoqm91B4uL9MkFSygMHb3SRY+YqqFnvwZy9AfG2nRQ2KLjN2ZKTA6syrNf3owo2CeRlyQho2Q7Uwq/mgWXif/u1EZ11+nvTPp46wKbVkeEfsBADzVlotXQrksWgR+fAvJvxyFxlvKc72ATPmn++iduV5i3Im3rYVv344UAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718778968; c=relaxed/simple;
	bh=eFoNHEsNU8rN9fD1bcCS2LpMK1sY2sSZroJWi50MjlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/iYdsFcmHWh5o6zAsZgpCQCa/YM6sZ3KOaUO9h+2PcDZ1xT/KBMV3drkve8JzFVQRUV3mCWFNeNUhmLV9YKn2xPF4uinbgogGFFdgYeRcstCqQ7cnAZVh99QFX9CTjuOm91I3vuho7Lvkwi76f4/3yGEGrrxGkG/EUzjLf1Pss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nqRATEGi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nqRATEGi"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f275c7286so5561159f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718778965; x=1719383765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hlGoj1WJJZ3FnqOdHCOQOom5O1x4l3tplNmOT+ncro=;
        b=nqRATEGiP+rfYWpa3pAxVTscTSlvd7unR978LqRsryYyB/QQ13HYztf+h4269m7rUy
         DltqPtIyQRpCEBF9TDNn90/js3lCZVWci/RPVIBgFmzXf/iXtt7nKuGE3Pdtud3RVdZa
         7tX4gLprFNDbhgLfQ9OV7y4xCblrRPxUjzbA2zxalJQ/aeEVUHir8mFowGF37F+OyrEK
         L1PgC4K0sHsi2z0VJswyPvEShjhvqyiTKsJyje9+z4e2ZphHKc65C8EDu32aeUbtebGF
         A6FbjEr3PGxzIOXMzAvZ0lj8GgKalj2xdI5nmUo/cL7dfeBdHuqJ6xzDbsiNetPup1D7
         xPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718778965; x=1719383765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hlGoj1WJJZ3FnqOdHCOQOom5O1x4l3tplNmOT+ncro=;
        b=a9ychFRIKtHtZsccCYTJdEiuDSCUX3GqXsfYHQIYPN0XPqqLljMOCXod/BqpkW8518
         uLUStLKNhAxjpcJYW+z3wN53rX3fW1CPWLiRYXyCpdFhqZlcm+IO8Ou045mqyLrmQFc6
         dr9UbvG/dBZI9QMBOcecYKeZ2vBzg0lLMQO6QsGO1qhrgOljsSpUiLLXo0KkCC48ELjf
         0A6E7ZEBCO7/ARwgXHBoeF9pH7sa1zwww/rPhu1ROCP5LNu1kC1G/xMUgliEjfGoyYHw
         B0St5wKvPJTQP5fHwe3mVPFYO8/tLQPEhZElBy7I0i0zxJg/eFUXsyb6OXk60RMRCSRL
         4rpA==
X-Forwarded-Encrypted: i=1; AJvYcCUqC6lNpI4ZIFPPDITxd+J0iBpkA6f4xzjKjXiOCEftiWijqvDLiPz6jAZGmPZ3BmiT8bAzMZkY6XEHhniyICFqm/qJZ1M0gdFQ
X-Gm-Message-State: AOJu0YxThnM3ATpC9opvKty3n+j0LETKLYXYJNGTocizU38LPJioPX2i
	NXCg5OfQ4S1AKeG68QbKqc2NDcd0xqfN37QH15G7BOhR87bWU/7MBVSUz9T5W8L0LAXE8DX0ZbP
	Esbt9RG3XrL8sTOYujncpScfrifIACxsoedj9
X-Google-Smtp-Source: AGHT+IFmJwrN1XtzxVor8Ksc5pIRoSEYDV4HvFEp9czSMYJ+DnMAA3sRjTwtOF/ttR1vYn960PnYiUWt7/NrxEw/MPE=
X-Received: by 2002:a5d:4d4e:0:b0:35f:1e09:ac7a with SMTP id
 ffacd0b85a97d-363177a3931mr1215725f8f.15.1718778964729; Tue, 18 Jun 2024
 23:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617170545.3820912-1-jiaqiyan@google.com> <20240617170545.3820912-2-jiaqiyan@google.com>
 <20240617121348.4ee672a1d6bc9202b3ad0e08@linux-foundation.org>
 <CACw3F51wq4H-Hoxvm7GgCKodAR4Wy28hwBD=VngcF-fbxyRmUg@mail.gmail.com> <1a40217a-240c-4efb-5c2a-fe885c0109ea@huawei.com>
In-Reply-To: <1a40217a-240c-4efb-5c2a-fe885c0109ea@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 18 Jun 2024 23:35:52 -0700
Message-ID: <CACw3F52agKixs45J67AevQi3enmgU-UufdVBfM_YCSKAUV9+eQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mm/memory-failure: userspace controls
 soft-offlining pages
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, nao.horiguchi@gmail.com, jane.chu@oracle.com, 
	ioworker0@gmail.com, muchun.song@linux.dev, shuah@kernel.org, corbet@lwn.net, 
	osalvador@suse.de, rientjes@google.com, duenwen@google.com, fvdl@google.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 8:01=E2=80=AFPM Miaohe Lin <linmiaohe@huawei.com> w=
rote:
>
> On 2024/6/18 7:17, Jiaqi Yan wrote:
> > On Mon, Jun 17, 2024 at 12:13=E2=80=AFPM Andrew Morton
> > <akpm@linux-foundation.org> wrote:
> >>
> >> On Mon, 17 Jun 2024 17:05:43 +0000 Jiaqi Yan <jiaqiyan@google.com> wro=
te:
> >>
> >>> Correctable memory errors are very common on servers with large
> >>> amount of memory, and are corrected by ECC. Soft offline is kernel's
> >>> additional recovery handling for memory pages having (excessive)
> >>> corrected memory errors. Impacted page is migrated to a healthy page
> >>> if it is in-use; the original page is discarded for any future use.
> >>>
> >>> The actual policy on whether (and when) to soft offline should be
> >>> maintained by userspace, especially in case of an 1G HugeTLB page.
> >>> Soft-offline dissolves the HugeTLB page, either in-use or free, into
> >>> chunks of 4K pages, reducing HugeTLB pool capacity by 1 hugepage.
> >>> If userspace has not acknowledged such behavior, it may be surprised
> >>> when later failed to mmap hugepages due to lack of hugepages.
> >>> In case of a transparent hugepage, it will be split into 4K pages
> >>> as well; userspace will stop enjoying the transparent performance.
> >>>
> >>> In addition, discarding the entire 1G HugeTLB page only because of
> >>> corrected memory errors sounds very costly and kernel better not
> >>> doing under the hood. But today there are at least 2 such cases
> >>> doing so:
> >>> 1. GHES driver sees both GHES_SEV_CORRECTED and
> >>>    CPER_SEC_ERROR_THRESHOLD_EXCEEDED after parsing CPER.
> >>> 2. RAS Correctable Errors Collector counts correctable errors per
> >>>    PFN and when the counter for a PFN reaches threshold
> >>> In both cases, userspace has no control of the soft offline performed
> >>> by kernel's memory failure recovery.
> >>>
> >>> This commit gives userspace the control of softofflining any page:
> >>> kernel only soft offlines raw page / transparent hugepage / HugeTLB
> >>> hugepage if userspace has agreed to. The interface to userspace is a
> >>> new sysctl at /proc/sys/vm/enable_soft_offline. By default its value
> >>> is set to 1 to preserve existing behavior in kernel. When set to 0,
> >>> soft-offline (e.g. MADV_SOFT_OFFLINE) will fail with EOPNOTSUPP.
> >>>
> >>
> >> Seems reasonable.  A very simple patch.
> >
> > Thanks for taking a look, Andrew!
> >
> >>
> >> Is there sufficient instrumentation in place for userspace to be able
> >> to know that these errors are occurring?  To be able to generally
> >> monitor the machine's health?
> >
> > For corrected memory errors, in general they are available in kernel
> > logs. On X86 Machine Check handling will log unparsed MCs (one needs
> > to read mci_status to know what exactly the error is). On ARM, GHES
> > logs parsed CPER (already containing error type and error severity).
> > The shortcoming is logs are rate limited. So in a burst of corrected
> > memory errors the user may not be able to figure out exactly how many
> > there were.
> >
> > For uncorrectable memory errors, num_poisoned_pages is a reliable count=
er.
> >
> >>
> >>> @@ -2783,6 +2795,12 @@ int soft_offline_page(unsigned long pfn, int f=
lags)
> >>>               return -EIO;
> >>>       }
> >>>
> >>> +     if (!sysctl_enable_soft_offline) {
> >>> +             pr_info("%#lx: OS-wide disabled\n", pfn);
> >>
> >> This doesn't seem a very good message.  There's no indication that it
> >> comes from the memory failure code at all.  If the sysadmin sees this
> >> come out in the kernels logs, he/she will have to grep the kernel
> >> sources just to figure out where the message came from.  Perhaps we ca=
n
> >> be more helpful here..
> >
> > For sure. I took it for granted that any pr_info will have the "Memory
> > failure: " prefix, but now realize there is a `#undef pr_fmt` +
> > `#define pr_fmt(fmt) "" fmt` just above unpoison_memory.
> >
> > I propose to do `#define pr_fmt(fmt) "Soft offline: " fmt` above
> > mf_isolate_folio, so that any soft-offline related code generates logs
> > with the same following format:
> >
> >   "Soft offline: 0x${pfn}: ${detailed_message}"
> >
> > If everyone thinks this is reasonable, in v4 I can insert a new commit
> > to make the log formats unified.
>
> This sounds fine to me. And even better, `#define pr_fmt(fmt) "Unpoison: =
" fmt` can
> also be done just above unpoison_memory.

Of course. I just sent out a standalone patch for unpoison_memory to you.

>
> Thanks.
> .
>
