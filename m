Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931213D810B
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 23:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776985773; cv=pass; b=PnObUCiGX2ehZEu7Br8GzxU84S948n0GwFg6r21uOOSQUobrQLXw/NXjxcEINAJ84O4Bl54B5YalHk0ILiNC18AFkuOrK1h8l1pjmnj8EidtaV63KgklAHsjGUNh997rWUsCZf+PJWlwvXjAID7lY6DzIiC1IhQgA3hI5jwhmvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776985773; c=relaxed/simple;
	bh=VSDvtpQyodvkH89hy45oW/Z42kZp4O88fgmSS7BMvzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOHjsqje0uIIyg3ynMyJix+Rk8lnGSOtxPfJEyhirIo0tzgi3Zr+NmagMUeWWHHf2I2MpSw4UEYR/DLjpmeT/WyMOHrqFZ6TRgBvyyNPlg8SBJBWU4+z8DZQv/YRtttQKe7Ir338i0OZ5KUBDL7v2RyqB70eDqRlzBKrGgXCg5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VqmA597z; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VqmA597z"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e68e4389cso76411951fa.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 16:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776985770; cv=none;
        d=google.com; s=arc-20240605;
        b=btaHu5F5qmKuI948L2gOjbhY8iLhettraIjrYGQOwsU8QYu/Le3Y3ERi4XuH3oz1pv
         hNkxCqZ7smNbIQiKidIbbjGheF5kI6llHTkRudWpt7CanWWLrNNsu/wAsG/4rTCrMLJ5
         bfwqU0724zZxfpmJ85VC8YD3OwLVyHr40rAnwu5eJfMriXp3h/1QaPBpjSlDkpLsNT1Z
         /1LAEzwm8ELY9gnHuuXx4CSIIdiF4WiNak6KW3iB866zuAuaEqyHylT0VRQ8sKjdITd5
         wF1B5zvkAfEKQ99U5D+DM3sV8VO50Ud5wTQFLVy8fJWxF2R/ufQ/uCpYRTcniM0zMrtF
         XGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=du3muYvsQpTSBNV17AfC1+OtrIQr2PLFz51edOhTt/Q=;
        fh=lKuBM3nAdO8HdWYRppYyGWEInymKdy2pvR0yVT07cHM=;
        b=j5PkN0BLjQpjTcZHnSC68NBIp0bL9i3N1Eupe4li4CY8l54/41X1kcQjx1sTzOqLBj
         eIHyrnSeAFstTFLfiXQ56vhWtOv7I3Lg2ni3P00cZFsp6hDugcMt001hFcQaYU6NiN5o
         tXTX5yAEVAYb9IGjkB2C9CeUsEcSnlOpil+/1O2xhXM9O17VHQGjhb3aIdu0T8fQL/ej
         xNgoMiw0o+rUXREJIPihuX1SxVGa5XWAteYkkWKoSs1UjtW35mysFRmVxeeXz49D+kOs
         CpqNmP1+4uTJU8NM8tHHf4GkrASXwz9zPwillKvhNlHbSGLh+hjg91Iq6RmjRBbS8vRr
         OL/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776985770; x=1777590570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du3muYvsQpTSBNV17AfC1+OtrIQr2PLFz51edOhTt/Q=;
        b=VqmA597zpWPLJykZ+qVtHxQMIF57cL7+JJDjRu7DOn15qon3vfMNKNm21wFO0ihqQr
         a+DYoC1AesbkgDijJF4s9J5H/xrQBR1u8s9yOO6g5YfrCK+lsegit/Hol6g9DMw8wQLV
         xYMJvMUP0JqsYvWAmnvV0ipZgELNNx/fs5E6rFOg3lekil5oKXntEvDynEcjnVaMPxDn
         3DQAatSeUa8bCmpNzqNw7dxfdAX1lNp5gbU8/rQ42J0ZuFEGsrpaNRx+R8J98e4x5Ahz
         xu+5ds4dWTs2kaboCtwWxxbgYL+QwxJ2FolBvn2of0RruQY0ktQ9nwwBlSO5a6dV9VOF
         b2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985770; x=1777590570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=du3muYvsQpTSBNV17AfC1+OtrIQr2PLFz51edOhTt/Q=;
        b=TzmvbmJ5RlGZtq983q7qxWQy/hyE9r3QNqkBmlhllxr5jCNagH8oOT3Ad2ymeS+Sxs
         ckfvsAJpx0eCjQgi8cyFNES3j1ro+dC/yKd9wAhJ7X8eb3fMOL6NIx2EhUCqTkW4Jarc
         XtXjnqFuXLOGc3KDpPrPPTrFeJ4H+qUb5IsbBg2wz9iHA+bK9bSiiwV5gy1N+KEJtrTO
         Ugw6CWZ3WO5h73nIWtKPzianl+PU09lh8qWY60JzsdkhXfz30SPenh0I4x2ZdXMN8JXx
         nqLbQ7RMWj3aemaWSnyeaM8dwJT84W28W89aopC5n5UbGDt9cxhGRwYJMi4HIVxj0Izw
         dvWg==
X-Forwarded-Encrypted: i=1; AFNElJ8uRaSh+WUHZRJxb1PsDgW3/WKPWSw3dy/z7KBS6LQmi65PpOVA5Iw3pgfttoAyIktOdvYA7kGjPYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSHIbUlsfWG6pdb/1m/f3ztjy8f1ABeaV6ETvE3eLmlTp0X6L1
	zHcTACK6SXJg8mBcF0DptouT9h9c6esK9bZ+4WQRCS7eJtxr7X16vKrL+VHwJhJFK2XOTuoDEa8
	M5CHgVMYcAhctndc2GUFWWybZvsPuBX9/b7LTWZys
X-Gm-Gg: AeBDietnlExWfn9b2Tfb8xCv72MldAwZG1j+vwhPTfWnAl0lv/se3BvM0v4RV7aO+43
	WmUqsYTQheuPMkMxQtWVbpHlkq8kK7UURB3WFDI8SNIBodweOm/w48hI27xFl3F/hFLLI8Jo47u
	miWmnMhLSDQ67m8EwMXzxZUPbIcjzzmoLVZCAORoI32+ffYxCLpnoym06b6OnTw+8mlOjpYs/g6
	pZwrbQcMNNrquR4nYC+0MqYHPlr2k2UxYRugqox/0hsaEW3EZNEQxaCY034xgeBU13vgweyQONS
	TZZAAl57ffWhFh0Txu9gsqj5/b5VJQ==
X-Received: by 2002:a05:651c:418e:b0:38a:965d:79ac with SMTP id
 38308e7fff4ca-38ec7845ffdmr82161421fa.12.1776985769266; Thu, 23 Apr 2026
 16:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com> <20260423212316.3431746-9-dmatlack@google.com>
 <CALzav=dGpHEnEjyp8qc50iZrGeKJ47vjLvwtvkLCyNzOMJhozw@mail.gmail.com> <20260423225253.GA3444440@nvidia.com>
In-Reply-To: <20260423225253.GA3444440@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 23 Apr 2026 16:09:01 -0700
X-Gm-Features: AQROBzCagtk2g3nQiz1XNHTS_Y7Vpcsrr0LE0644u_NVwvd3XuR0UjLC-oW_vCY
Message-ID: <CALzav=fraXLgGs-XMc-=whMPhMbS99twFskGtV5Eo=UQ9mU5Fg@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] PCI: liveupdate: Require preserved devices are
 in immutable singleton IOMMU groups
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Joerg Roedel <joro@8bytes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 3:53=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Apr 23, 2026 at 03:10:55PM -0700, David Matlack wrote:
> > On Thu, Apr 23, 2026 at 2:23=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > Restrict support for preserving PCI devices across Live Update to
> > > devices in immutable singleton IOMMU groups. A device's group is
> > > considered immutable if all bridges upstream from the device up to th=
e
> > > root port have the required ACS features enabled.
> > >
> > > Since ACS flags are inherited across a Live Update for preserved devi=
ces
> > > and all the way up to the root port, the preserved device should be i=
n a
> > > singleton IOMMU group after kexec in the new kernel.
> > >
> > > This change should still permit all the current use-cases for PCI dev=
ice
> > > preservation across Live Update, since it is intended to be used in
> > > Cloud enviroments which should have the required ACS features enabled
> > > for virtualization purposes.
> > >
> > > If a device is part of a multi-device IOMMU group, preserving it will
> > > now fail with an error. This restriction may be lifted in the future =
if
> > > support for preserving multi-device groups is desired.
> > >
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> >
> > Jason, do you think requiring singleton iommu groups is still
> > necessary/useful now that this series preserves ACS flags on preserved
> > devices and upstream bridges?
>
> I have forgotten why we introduced that? There are alot of funky
> things about iommu groups that might be important upon restoration..

You had originally suggested it in this thread:

  https://lore.kernel.org/kvm/20260301192236.GQ5933@nvidia.com/

> Like if you preserve one group member but not the other what do you ?

Yeah I imagine there could be some tricky cases there...

I wonder if PCI core is the right layer to enforce this. Maybe this
fits better into Sami's IOMMU core series since that is where all
those tricky cases will be (I imagine?).

> Even if you have ACS flags there are cases where groups are still
> aliasing DMA..

Hm, if a DMA alias can be created after boot time enumeration even
with the REQ_ACS_FLAGS check, then
pci_device_group_immutable_singleton() is not really immutable.



> Frankly, multi-device iommu groups don't even work fully last time we
> tried to use them in a VMM. So I think I would not expect them to ever
> intersect with live update. Blocking something tricky you can't test
> does seem like a reasonable thing.
