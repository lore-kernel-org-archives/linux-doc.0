Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D4C29C325
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 23:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773359979; cv=pass; b=oxc5DN6VmE5u3pAhhBcZpqWTa8roYK5yiFxtQKjvRji/mD3oD31McemrOGF3b4EPTS2B/5U7Gbx8ysit9Z57zcy2q04Z3SSe5yijFFJnWFbH47LmVw/Vhk7rYmJy2i1HWtg3JRhw1l52wfZMmnsQxmJF+aqA5EFC93eZaaaV1ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773359979; c=relaxed/simple;
	bh=1zdseJZthmAlaXVprefIuSRm9wyRW0yNjPW8hV/PHVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUC1X1/Vltr2T4oZ2CQux1pTNUVZWKgevALVE+BW9qXa3WWTzEBzZvNQPS4qhAp9r1NUFTD47EYWF69yywxeY0F2UmA87US8fjJDN9aOQyyRtUhcyvRX6k3EJ1PCIQ/ufI33MqUDny/Tp81rCX1XGnjuJxfq2bwZTv5HnTCa0ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RkmEZcdt; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RkmEZcdt"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a133502accso2035411e87.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 16:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773359976; cv=none;
        d=google.com; s=arc-20240605;
        b=iRxVUz+vUOab0Aa4F4JuEC07Y7T8ItOFsW7LaVGqWQdJeNXdcByHzBmXYtGpcgmmAW
         YI9Xg1u5Plb/o1zcQj3+qqRnp9XmPsCMsUPCf5nOnYKttXX8c0qyAVupuo6YrWwxhiqu
         fm519BPE76DWPGpgmWFgERoDYVxFaM1SfPKu+UbzzGQSM63hb3fM6YlOmIaeJwxXzT2+
         yZThPCY66ov195NT6L1Ngo5oKwb5tQ07c1Zmw7L16+B5/l6WP1iQGPOSdwqeNAH6gvmj
         c9AgjISnL0GsQcPySqRV8psS3fEShjHnEgIakJwBSouMLvuBP1jSvIm4PlOQOOA4/Rrk
         nInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bTqNpGgN465Yvz/rSl1CgTF/afuaa3OeIu5BLYs4TjY=;
        fh=SkFAUpKzztHEs1Jym8p+x093Blj+7BAKT2TwNOJjcaw=;
        b=KZMfI30oPbzbSQxgdT13O9Jk+S+pRbL6yXT/JirlfAneNlmq6YdiSaqtRHjIgmDMAB
         IGC4JNyhWwhOtbZPDZ8RDlXIZ42H3hxyj2iUeGoG3Ht2wZPKNUJrewJgjRVVlgnGMhYB
         u1dKf8wwYY2VanTJUsA+iYRwNONWndlPXbCwu59G6fL1/7PDUNhqTtUZI01mQD9haAMo
         JddChYuTPlzpmJvspG/eTCP/EiPmpHtLCxuAxFmkE3HnxeFi/k8efdKKf75hght+kUBi
         EXCcPZcArup88pY0aLralwHa/95+E3cU7vhGsCbd2QlU2CGSqqqx+4biawdVRtcCW0p6
         ZCqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773359976; x=1773964776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTqNpGgN465Yvz/rSl1CgTF/afuaa3OeIu5BLYs4TjY=;
        b=RkmEZcdtr1j4T203+AgdNif/AeG5X5f/1bCP+I5Zs/0LgC/vP+ngz4UojDOK47EfIx
         7HlcAy9/ar6CQKOyybquYcSPQVD7b07IKfX9BhAoXUSaRp/MQKkbEGeYjTVpPFdf2ENp
         4o33T2NKwsoLK6i7iQJKn+HCbZjSMxyPEHZT6RdDyyBZZ8hWDoEMnHUOp16OQ0yddkXI
         +NJdC4279BUGbvBuRRDIYtswcc7A0X/ExruRWEJpDzfyI59JTMkjG8QDFd4bWiU+Rh1K
         Rw05XxoRsH9FMeKTe5mtKDe/ik0SucsyU0EPiuCq82/NdjPOVfgNK0MBnILv8uhbDCon
         x/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773359976; x=1773964776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTqNpGgN465Yvz/rSl1CgTF/afuaa3OeIu5BLYs4TjY=;
        b=NtR5NHcBi0J/QuzGbYkXcRCWbKi/1KHfZVp0pKLn+FeE5vhO2/QixhARhl/XZR3L1X
         6R/bx2QiVLawKHh/xbYcJDwpqDV4I7ToniVWNTxGurhh8KzqNS1iSdaRWGARLm0iUsLY
         PmJebFtP1bECHyhnE+Fz/KJJyyfb6T3MORbTZ7pUbZGN10OCV1Ez6JZS0SYjVMeopQTE
         m1kPYz6OSqlM+SNOoVoGu3hxuDYYtmE8BqGtfEuHAdWgnWTVeOW4z6r0TNl0vsrxQhpC
         QShcoQ3pRPW79V3OAZ+jHfXuA0UiSRXDsszimrMG5VXjFjQDwLkYyCp23YmSWU9Ycglk
         TJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXK8HjmCqyj/qMnklS3xRaRDlo4bDu6bpOzUslDGsQ/24sFefYQu/UNWjkm439yBYOQEYIndE8Oi1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVpQut6h5QDDNFgV4Q+4BBlj4VMJNkdKbmPYRozImAFSXEvfQ1
	bXu9n1ClTO6B7tLnQqczvny3ky0+IvYHUh/4yeBP5WphjJaexLCFs+TRwJblbesBF+OMga4/VE5
	Scut2i3uA9ZIJxIHxFYj34eare/WsiPv63NPTlkjE
X-Gm-Gg: ATEYQzwYmTTavtuWRxynpcUwbkqKwzpsaETpqDEy0xAsr+6qIdBVci7iolQm0v2nvg4
	EeqrGKcVNXtWcWS6VNxODn9zNlQ+MZ+4jov5WTwpFzTTj3zzvMWAWuf3HoGRSVvNgjdJWdrPUbY
	z6h9YCd2iV301yCVWj/ekuOt3I9egLhemBnr7LyPqI0ambzglaPtlUyQ8H2K1D08MDiDC01w38e
	oC+zf7MeVG4MWNYxaiGWRgxeaErOnzEWbr9TzcYDc1UEv1qAF58e3xFMSspc19jbZ9047JTW117
	MmTVgjlj
X-Received: by 2002:a2e:a98b:0:b0:38a:8b28:f9d4 with SMTP id
 38308e7fff4ca-38a8b28fc87mr2205331fa.41.1773359975972; Thu, 12 Mar 2026
 16:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com> <20251218155752.3045808-5-pasha.tatashin@soleen.com>
In-Reply-To: <20251218155752.3045808-5-pasha.tatashin@soleen.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 12 Mar 2026 16:59:08 -0700
X-Gm-Features: AaiRm53g7VGNXRbyX9cPaNdq7ZlceruL4-G4Q2GJaYwWhokxL7AnPTywHH32ZSk
Message-ID: <CALzav=cJmgG04+Ba82Rnr3iKpU0gKD5WD3oF-_43rdD7T+REEQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] liveupdate: luo_flb: Introduce File-Lifecycle-Bound
 global state
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, rppt@kernel.org, skhawaja@google.com, 
	rientjes@google.com, corbet@lwn.net, akpm@linux-foundation.org, 
	kees@kernel.org, davidgow@google.com, pmladek@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nicolas.frattaroli@collabora.com, linux-doc@vger.kernel.org, tamird@gmail.com, 
	raemoar63@gmail.com, graf@amazon.com, Bjorn Helgaas <bhelgaas@google.com>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 7:58=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:

> +static inline int liveupdate_register_flb(struct liveupdate_file_handler=
 *fh,
> +                                         struct liveupdate_flb *flb)
> +{
> +       return -EOPNOTSUPP;
> +}

I think LUO could use a cleanup to return 0 in all the register
functions when Live Update is not enabled via CONFIG or parameter.

I think all of the users of these functions are going to want to
ignore -EOPNOTSUPP. memfd already does.

> +static int luo_flb_retrieve_one(struct liveupdate_flb *flb)
> +{
> +       struct luo_flb_private *private =3D luo_flb_get_private(flb);
> +       struct luo_flb_header *fh =3D &luo_flb_global.incoming;
> +       struct liveupdate_flb_op_args args =3D {0};
> +       bool found =3D false;
> +       int err;
> +
> +       guard(mutex)(&private->incoming.lock);
> +
> +       if (private->incoming.finished)
> +               return -ENODATA;
> +
> +       if (private->incoming.retrieved)
> +               return 0;
> +
> +       if (!fh->active)
> +               return -ENODATA;
> +
> +       for (int i =3D 0; i < fh->header_ser->count; i++) {
> +               if (!strcmp(fh->ser[i].name, flb->compatible)) {
> +                       private->incoming.data =3D fh->ser[i].data;
> +                       private->incoming.count =3D fh->ser[i].count;
> +                       found =3D true;
> +                       break;
> +               }
> +       }
> +
> +       if (!found)
> +               return -ENOENT;

FLB users have no way to distinguish between "there was no data
preserved" and "there was data preserved, but it was not a supported
version".

This is especially going to be important for PCI [1] since there's a
big difference between "there were no devices preserved" and "there
were devices preserved but the incoming kernel isn't compatible". The
former means there's nothing for the PCI subsystem to do wrt Live
Update. The latter means we should probably panic the system.

[1] https://lore.kernel.org/kvm/20260129212510.967611-3-dmatlack@google.com=
/

> +/**
> + * liveupdate_unregister_flb - Remove an FLB dependency from a file hand=
ler.
> + * @fh:   The file handler that is currently depending on the FLB.
> + * @flb:  The File-Lifecycle-Bound object to remove.
> + *
> + * Removes the association between the specified file handler and the FL=
B
> + * previously established by liveupdate_register_flb().
> + *
> + * This function manages the global lifecycle of the FLB. It decrements =
the
> + * FLB's usage count. If this was the last file handler referencing this=
 FLB,
> + * the FLB is removed from the global registry and the reference to its
> + * owner module (acquired during registration) is released.
> + *
> + * Context: This function ensures the session is quiesced (no active FDs
> + *          being created) during the update. It is typically called fro=
m a
> + *          subsystem's module exit function.
> + * Return: 0 on success.
> + *         -EOPNOTSUPP if live update is disabled.
> + *         -EBUSY if the live update session is active and cannot be qui=
esced.
> + *         -ENOENT if the FLB was not found in the file handler's list.
> + */
> +int liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
> +                             struct liveupdate_flb *flb)

Alex Williamson and Jason Gunthrope both suggested this should return void.

  https://lore.kernel.org/kvm/20260303210733.GG972761@nvidia.com/

I suspect liveupdate_unregister_file_handler() should as well. I don't
think there's anything callers can do if unregister fails.
