Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36F339396
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784930081; cv=pass; b=Jh6W2cC9dE1UpSwi5KQZuqEkogwzE466N+ly1p7/oagjK75VEPZieo3O0Qvd7WNUE2COosvq4HZMAycRTAbMKFgszasToax0nh5mneS9m61s0T0LB1uSsFIU0XxC+o2TNrxUeKvQZE1Q4VBA3G9uvRtd30LqqVFDENMIiTntWMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784930081; c=relaxed/simple;
	bh=hxJm0/mYjdYZeSe/3mr1gzaZCNknObJa6noZfD0Qc50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4iPVOue1O3OyOjn4N/D0LW+jkeTR63KIz8eezkgWMtsPQ/MMLJETslOI+c0id7THIavtibfir4W9Z2utyUOFugPOUl69byjSYlIQgDqcTdBsPWSkw6PDMVKK80YI0hEOshd4IVrPuX5riE9SxuCRMxJy7KZ6Ws2ReaHr2tXV5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ocg9pKWX; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ocg9pKWX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so915557a91.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 14:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784930079; cv=none;
        d=google.com; s=arc-20260327;
        b=ROt0tJ2QrdehHQdzy9i6b7WV0QXTq7afLMvHVaISkuKOonCYX/c7MWm//lVn7VXH+y
         lOCUyiE433/uAgwEJb7KKHl8upUi7NXF13E2TxxiSwzP52i3iJEfdTLNishCYxgewWBV
         wJH52tZvGdlqYau2xzg+4vd7cu9Pnw8Dm39OUjd34YTZn2yCFcu3Rav2hYNu953HnOnV
         9Ekk6Pmu6CVVdTj/XGnT9UpIWKOstbnvE5UVs1i3nDS9emiVoZwvD6huSoUtE9UN5JOL
         oKpnU2QsoVuc7mWrvHADGNk+QrJcL5KNC1XYp3mbXRQMxXF6BHhKHb7jaYOU4CcWPgrY
         d+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/VuhMIt3y5/j6Le1Z4BNgwX3UBNQKNT5cbNU5pubERw=;
        fh=x4eNnVKiUTj0GVkkJmoo2gTdwDaWqm7aldA32nskkRk=;
        b=nYT+VNagTpmApG141dSfWpvrAaxowZtIqw/9a/HEtHXfC/D80+BbkVQWIxRIcSq0VP
         9M0tggL/Ggf6FTwQf1c0BtihJuzU3uZjqzkFAdi8gxRakawibpLRfmeSSzlrhO++IRzJ
         /UVgO7dfHZbHDRHdH29wedlWbvAs2zKPgPL/HtiGkidZxyKovxgC+BIWV49DLOMp8xD1
         IoP3KMnycX5I0RUyenOt+WyuBNVEDMHBz5D+5it6akmPBi4Qo8X7h9TA5s6VdHQ8bz1Z
         eyntbgUsVqlVvkF0WTU8N4KQmswPakj87sL8Gql7UmHQ3db/5Rr0QdzJxbpLN3Opebtt
         KSRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784930079; x=1785534879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/VuhMIt3y5/j6Le1Z4BNgwX3UBNQKNT5cbNU5pubERw=;
        b=ocg9pKWXVMQHAbsSAA2HkdWmKgc8nzy3z1lceBWhsxnQEdjpwcFAWCXoUoonedX6Vt
         YBUrqMGb7uT0MOl8WJzKM5q+NS1kYPKu6ktrcHgNjQvYBd4RYBFsY8h+0MRcV1TAfsmF
         GLKGVU2IxMmzpkRNQ95I32ORauKa2VWl0L5rdhEwDzidYfxn9TEzv14jZnFkWS02N/bi
         P4IGlnthP6oLChgELfMG9lHKILhSk7TTM4at7PyL7/Pisjp7euOksLWIXqqIXCmMsAli
         4CncAvCgyVHMWeQ0dgn08FuNrGbUdFRTl++h/BgWvxoxuGNKoHWTtnTD8nJlHuDD6xLc
         Nkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784930079; x=1785534879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/VuhMIt3y5/j6Le1Z4BNgwX3UBNQKNT5cbNU5pubERw=;
        b=JFe690lHCur2lgueyrna2wAz2gWnMPadJor5Q0bEkRhTEfIgMCDQIQzElsFEKTUfID
         t3wZAB1vt1qIcgFwGtScEC3vucdS5Q/qKDgBW7d9Qj8DJgkRxlquZbwgjlIXTVe7q9E8
         RhgnEy2TFqEZ8M9hjUfZC3GYfnzh7Lf2e+LDgTmlqbRYZY9R8dStpqJ/MWPZNpmieMGO
         LQG++LWHw9cUG/VrUOBQcVbUYaDapZ3SR2+UoPQ3OTqrOrLeQc5KA9LYA9VOk51Xc6po
         XD6XjGNvcCr0VN0KMsDhZJ7+/pSf+JJEEe4z/xmdTgHduLQ0ELeoQG/KiE9Xqbz9MdVW
         OFIg==
X-Forwarded-Encrypted: i=1; AHgh+RoU6gZwlXLjhJm7KUKUyrJ8CWPjcEHvjhkMx2Ue37O1jM4c1hBa8PXI3GcWV889DyWehG9yjriFnIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ugi0RIihlhom8Yjw/5P7mQVaMp9W9TNdBM1JqS6Ai23tea58
	Cdg8Z/9tkNYNC2QiIdbN0treq73lczCfm4ezF8aJVJZuwmXTlW+upWWq+8+kXb6Jd1WLmd3SGh4
	jctD1tVsRhN8OaKZVr9Y6JexxsLX+G4NtHUaQ2xt0
X-Gm-Gg: AR+sD10Av1cRvyCS8W0KI2Y6PNk5zDml2Bm7xJcIelK4cTQrE1q4rnR2XuJmzMu3pNW
	pb66wkDijg8X3VVKCDiFIR7jEotA4iAdCwjOCuUClfXPLEIwGCOW89TVuM4FRqaDSwzdsBIsGkf
	IFcnFVLCHn50TsJ7ZYRZuWlQMaEfgxddxHDH+TsEH0vOMI0aez49PI/n7+Q+aQW2YxuFvVYcYoC
	lC0yAsM/ZzVf3Pbp4EIqN/YpAlSZxz4Vf43bg/Q62TkDE9xAits3QNrqcoOyA==
X-Received: by 2002:a17:90b:3f0c:b0:387:e0bb:57f1 with SMTP id
 98e67ed59e1d1-38f2975d581mr178977a91.34.1784930078557; Fri, 24 Jul 2026
 14:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-7-dmatlack@google.com> <20260724205506.GA1012423@bhelgaas>
In-Reply-To: <20260724205506.GA1012423@bhelgaas>
From: David Matlack <dmatlack@google.com>
Date: Fri, 24 Jul 2026 14:54:11 -0700
X-Gm-Features: AUfX_myY_bxyw4-P1Rbrabgs4s-tLloBKDJhDTUU1nvReA0LfPMvmIQUGRTYqPg
Message-ID: <CALzav=c8amq1hTRCwHbQOZvhNKtissagzzXX+RGeRgUiKPOcbw@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 1:55=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Jul 10, 2026 at 09:26:09PM +0000, David Matlack wrote:

> > -static int pci_liveupdate_preserve_device(struct pci_flb_outgoing *out=
going, struct pci_dev *dev)
> > +static int pci_liveupdate_preserve_device_again(struct pci_dev *dev)
>
> Could pci_liveupdate_preserve_device_again() be folded into
> pci_liveupdate_preserve_device()?  That's the only caller, and having
> so many *liveupdate_preserve*() functions gets to be a bit of a maze
> of small functions:
>
>   __pci_liveupdate_preserve_device
>   pci_liveupdate_preserve_device_again
>   pci_liveupdate_preserve_device
>   pci_liveupdate_preserve_path
>   pci_liveupdate_preserve
>
> Maybe even more could be squashed; pci_liveupdate_preserve() is the
> only caller of pci_liveupdate_preserve_path(), which is itself the
> only caller of pci_liveupdate_preserve_device().
>
> As a reader, I think there's some advantage in collecting the whole
> "preserve" flow in one place, but maybe nesting depth would be an
> issue, especially for the unpreserve cleanup in the failure path.
> Maybe a "goto" error path could mitigate part of that.
>
> If there's any squashing, I guess the place to start would be in
> earlier patches, e.g., "PCI: liveupdate: Track outgoing preserved PCI
> devices" and "PCI: liveupdate: Track incoming preserved PCI devices".

I'll see what I can do in v8 to avoid splitting the
preserve/unpreserve logic across so many functions. I suspect it can
go from 5 to 2-3 while still having a reasonable amount of nesting.

> > +#define for_each_pci_dev_in_path(_d, _start, _end) \
> > +     for ((_d) =3D (_start); (_d) !=3D (_end); (_d) =3D (_d)->bus->sel=
f)
>
> I think you might want pci_upstream_bridge() instead of (_d)->bus->self;
> see https://git.kernel.org/linus/c6bde215acfd ("PCI: Add
> pci_upstream_bridge()").  I think VFs are currently out of scope, but
> no harm in making this future-proof.

Yes in fact I noticed pci_upstream_bridge() while working on other
changes in v8 and already swapped to it :). It also makes the code
more readable.

> Other than "_end", this looks fairly generic and might be a candidate
> for putting in include/linux/pci.h.  I think there might be other
> potential users, e.g., calc_map_type_and_dist(),
> pci_enable_atomic_ops_to_root(), pcie_bandwidth_available(),
> get_upstream_port(), pcie_find_root_port(),
> pci_is_thunderbolt_attached().
>
> The "_end" termination case could perhaps be done in the body instead
> of the macro since it depends on the use case and several of the other
> loops that iterate over the path already include terminations in the
> body.

Sounds good. I'll move it to include/linux/pci.h and and handle _end
in the loop bodies. Then once this series lands I can send a follow up
to convert those users to use the new iterator.
