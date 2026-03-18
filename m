Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52703D7D81
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849747; cv=pass; b=XClzr3x37hEbsyoDPQNoXRDpX4ulsrYpjykes7zD9hOvpBsLWg7DmZLbHDhNbA5H4ZfX534c8b6PmPhG+p6VZY0dVo5dQEZoIL2tXAv71tG8WtusVHiUMbpi9qx2aSk39MBEW96+4FeRYTWLIbazC2/GuhdbnhvLsCagTAlVm5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849747; c=relaxed/simple;
	bh=Sn9jbrHlytwm6vm7UMn5Ci63+904PwFRZxmCisoVDck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTnGaN0VLBcrboVje8cr4jTkIzdzT73fM0hFlDzr9sJqi6qP5D1Rp4RrLyDaYXc+fl7hk3owf/XjqnNFISGcFQ5s2y3Bz+ZUd/Q3zgEAU08jc+HazEvBtkHizUaguaKUXAQ9n/ZMIOj4iixno+F7gtZc6k/yNd5EvLzg5TtzKf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wm0jPzpe; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wm0jPzpe"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-509062d829dso620821cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 09:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849738; cv=none;
        d=google.com; s=arc-20240605;
        b=d0YPuKMkDygiQkNs+G6h3JXK5uLZhm2q/0wOchjhuUfpTs5KMz6NCUiCNTPgyuzWI1
         nLgCDHUQyyMbUqIzE34oTO21zHLzahCP0C42sQWz0m/x8R+O/5G0cFAie63WPeC7cB4S
         4akfkH8nJrkhRaLetlLs5VhWABYtqyvdAzsvwlMSSs/cyG2sAua8Y6jFD0dS2P1IV0fa
         NqWvZ+w+dnQYvg38FMXPndmrW9M5UzC6GHl9xbFmw/wDBcHaKghIeV8WTohqd6A6IkCz
         /uLPOK8fenYPBC8xCiPuLahegpgjXa+bWmrQrD/43oh+6PDOPc6QnqP6Yqwx615JGNF5
         ISKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        fh=Qt6bHLSpRzuCcxJThJGjqUhH5M70JXCOimEKkG12xWc=;
        b=F/myqAc8TsMS4vBquObCuquf/UcihdFe/ru/R4/nMlo/nej8ONvYH6Alze/oCZ61rS
         EthpnxMzu6TK0E2mvS4rW9UCOQxm+Gnm3WC/0d2do3a9hg11eDvmeIAolomticwwCA7G
         g15GCqM/m8HvUMTVszc0f/k5QnGhBlFyBDOESCo7Zj4jpZxwGxnWEZtauYvHOlO/CI+J
         P25VJxxEypVCU638lBD5YcPZZq/a+EHxqsLttGRPBHqLwuCTnVnR0StquJ6HfgUNPWhm
         +6uLZtdxpV1J5CREnc0s9b+3bOggmlHfV8bZalU7nbmTQOdiOqz9LFfpUxz68eIm1jhY
         mxGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773849738; x=1774454538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=Wm0jPzpeHp5dNdtnLhc5H1xUtQtEyN6dAuXQxuM0/SN+dHfWxkgkDLEv16Sd+NSk4R
         W3zwVULhxvCobeOJ60+FPx2K3eBstNvsz1o15jYru4GL4ux6NqrdChHlBZ9x8AUqIq29
         mSh4V0HHJ1KEDYe3hbSIWJt/zucGLqTxfR/1Gy6C4SU1SnJYyWvn9m69CcuCepH7L6C6
         n0wL88/pgPhUZ1Xwjk6REDhoOePUSYUBm/1TlDa4divFXSqbTArdZq/crK4tSKTSMu00
         OMs4vzIJDqWDaaZZ7G+XPePGtrej7nUQn43nj8Vez1JteO0v0mZPWyOk90/G2Tpzi1+W
         Y63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849738; x=1774454538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=h2fVelfNbNPodFqpofJ0QhxT+WsQmdXN9PsLrp5VPOHlJl7boyaP9KmO1IEV1CloCW
         gsOfCWVVktTkObMEn8KHY13yAnEYI9kHoHzEbXQGuu+NmQ0Eo6Hpkj9pTuuTaVgLSygE
         hfPMHvmdLKYEGOqmsOGaz+39JLyWn1KGcYOVmkobev0oMnbG3qp/XqI5B3nlVlM3O6gq
         /c/6SlZjunaLasJdBYObvx82lyDXufOBrpCYyLKIE+17FrVubq8eSTGfqmaEvuDEnDZd
         MtIHhQOt70EESYlKa8UjBRKHQdJ+oWDke+qCEe1R9xRN7MEGYeIz2Uh0xmGYCcJNbB0E
         yriA==
X-Forwarded-Encrypted: i=1; AJvYcCXr+YehsS4lovUAUs85mV0PtT5b3E7kUB8jAGNpxI8J4BZUdCc6GrSXkhh90KLT/tNHHPqKa62IooM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhCUbIfLjaYMwxg/XT0XOZIQwqi0dEH+9ZLD1eV8IR1yeO2Xq
	GdHFSzgOGFpa1cFt+qx5PwPMoryq9ae8jZ3OeJEt+PjRfrr0T2ggDg6mJHy7yXOZbyCe55ymPDJ
	903uthajjLfPGffO0DADb0U1/xADmIqFUToho+6Si
X-Gm-Gg: ATEYQzyhMfc++LqVpOQusZowYpO8nfU5N4+7vbXky5KZjj6GtcRSxvkEovmMfYU1U6b
	NR7RRBUU1gSgNXT4unx+rsd56e8C+S2H12TpxBRCLLC+gc53rY0lp9OPPFGwrq2dIPoo2g5OD+i
	A8iM3QnLv+Es5UBamQKixIakybRICGtH1VcwEgIZxrVZ9+DsU/P1vyxBiJfRnVwIegY2fthQCph
	SKA7BSOS0aZ/GA+Zv59hVK/zNvluTy4l3sWG9yjAW2mbbYAqqT7X4WfbONVAG2VFTTA+VJmnuw+
	UTIJwX/i+Yv2XAybw4dp+lXPOJPIu8z61vDv7mJ8NXqHs0Kr
X-Received: by 2002:ac8:5d4e:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-50b1462cacfmr16816931cf.0.1773849737454; Wed, 18 Mar 2026
 09:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
In-Reply-To: <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Mar 2026 09:02:04 -0700
X-Gm-Features: AaiRm52kf0p9Fxu6EolM9nhc_2BIDOLEzyHhrKwtGPKlzkXo42y6XvhNDeOCJ6g
Message-ID: <CAJuCfpFd-d-E24d5-G6=dSYDpyHkwS=aXzGd6+SzyMkgssyPAw@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] mm: on remap assert that input range within the
 proposed VMA
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> Now we have range_in_vma_desc(), update remap_pfn_range_prepare() to chec=
k
> whether the input range in contained within the specified VMA, so we can

s/in contained/is contained

> fail at prepare time if an invalid range is specified.
>
> This covers the I/O remap mmap actions also which ultimately call into th=
is
> function, and other mmap action types either already span the full VMA or
> check this already.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/memory.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 849d5d9eeb83..de0dd17759e2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3142,6 +3142,9 @@ int remap_pfn_range_prepare(struct vm_area_desc *de=
sc)
>         const bool is_cow =3D vma_desc_is_cow_mapping(desc);
>         int err;
>
> +       if (!range_in_vma_desc(desc, start, end))
> +               return -EFAULT;
> +
>         err =3D get_remap_pgoff(is_cow, start, end, desc->start, desc->en=
d, pfn,
>                               &desc->pgoff);
>         if (err)
> --
> 2.53.0
>
