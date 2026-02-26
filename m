Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BBE31984E
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772067139; cv=pass; b=Yjt+STQK+1UzK2KUeSiwYVEZy8vFSmn9zrTiD73ngHusEAdbAINSCQ21Pb38MJqExOiCoCGDMAG8sGbyb7FRwUVZqhMhIrG2zVc6a1EJHigTt+6TPFyl/A/54zGIhY/QQ/YmOwEiNldjWfwb203DhfZhY8TvlbpPttUWtLvAW0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772067139; c=relaxed/simple;
	bh=5UM3OPrEzy38BQ/z8lTr67s9jTiNGfLCQhFUKKuIZuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ne8t0KZphlUtf2bX56nEN0Khvkp3SLwctyWJSqMISbd+DpMH2rlLr6kUMNYoYCI30HTFAPCFvh2wFQmZL4Xtej4sL8u2qyk1PEEQ4F0VxZ5SOL+GYeLzQJFz2JwihfrO5neCNFXrYZu4N2TtXz8pp0Jh7iuNwf7bQUnPFltzTyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Isym9Zp4; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Isym9Zp4"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5688b639a19so153013e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 16:52:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772067137; cv=none;
        d=google.com; s=arc-20240605;
        b=iE0OOaXq4Jnsh69UXMt7ZGdCeRX844ZU45nViavD/raY7p79iatU8Nn8orxmjzZLPm
         Pb/gURlYdWyCbevrHyPUiyR5R1m3ePZxLdyOrG63hZd3viGcLz1JTeDhU3roWp5gq4ie
         MtytzisKuct+62JGZ8Ea+426CRRCaz1d1gKw/2ti3ckNlF7G2Culs4cJ0LsevkbqjRST
         0u2NJz/SwNVRskzNGWfjrNlZn9y0Vna/NBdRr12AYWA4zRj+1zfkP1J4Q/R22zsv/E7J
         7rcL9bWEBO7n7N2ta/yGBxlDwdJJ2hG9FYBNjQ3o3F5pM21E2ncGsxadrmYuK7on0dLj
         3gAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tit/ZfajxqvE3xISUpVUeXJRv5DgJC6ZdqyR1I2SKAc=;
        fh=5TXTIryMmEgdnrZiCPmZzrowV7YgsExWr7YrJrr71+Y=;
        b=aHzo0MYXDEk/ipefkojvXb4paxoQqXUUypFA3WCpaWf+5GPfegKnaDmvfWuIDYd5mP
         kOEVbSePmziOIvxklQ36NBNpjoD/Cq1BpRReTBU46cxIXstAYnISUDTogdKTu47BvMyq
         HHDcY4vnLWowbvsLlwaUqBUVwnxvYht8RmcUw/DrSxov7Jd7ps1ylkxr45CgHtxt9Slw
         EhagWmUIlbWgjgrRGU9fVyeGZyFIma6DPnDGFkYyyErOXGg7wzSSdvAVCsibDCIJhOhy
         7Q9z9YOOTP43FEBKQauJw6ttKGs0O37T4/DTjE0NP3p3k8cMFznRckAlq7pKzZPjWhZJ
         NDCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772067137; x=1772671937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tit/ZfajxqvE3xISUpVUeXJRv5DgJC6ZdqyR1I2SKAc=;
        b=Isym9Zp4jjzR+PC3c/BniSDPSxJbrLU8884r+rart9fG1ueJm/2EFzUZ54EEDwayeH
         4TElbvJ6sEuwu2Q91jPlhwmiNC15kR69yqOPhVJPvW2wHKUiI3ZQuEvDaubPPR5D993m
         Hnp/o4nbcJCA4D1/8p1P4oraDX5owxN0FTeHHx1eObgCadot88UiLgxyonvldRh4c++g
         zxEIpMNtWGmkw4Kjsp4F1Pk6APFcQZ8azzng1d+4eZdwvQfMelhgLDii/TcG/monS+0f
         1Zte2TRT8ls6qpt0pJKTAa4dnhta0PRjvHW754pcnzj+v1EdXGsgPbefOu4Ncl8P2vbY
         cZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772067137; x=1772671937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tit/ZfajxqvE3xISUpVUeXJRv5DgJC6ZdqyR1I2SKAc=;
        b=mZWOvpk4plAa/ytsHp061Zxs4GUZMJ1BkGKZ0FJjequxxC37sS0SGN9FurWL24QTY/
         PKI03VQyhu164xShz0wTDqsPD4ckstuLnD7ptdj6tH+P74zAY27DceW0pcXLXwUsX+pr
         GWW9v/NG1xBrbzvT4DdGcJZHcLUOJYbUrOWzzE4ETg5ecRBwPJqMfkD1v8TO/EqfPUqs
         8HrzW5EmaANDIGXyrPNPwyiDsSyG5d7H6gz/Mh17pSFkR+dLJC0+Y9SiNZ76eZri0xig
         kGNqZNaei9DEWSuxYRq4VTZCksBxS+kXpB63AQ2S0aY0Yl/Gd1Z7M7XgBX7xp00L7vCD
         G6qw==
X-Forwarded-Encrypted: i=1; AJvYcCV3UXGt7kAuQrn9UcHpVgnKOOtMl4J5oY02uCVjPlRJkGFtjN2jW2hh9ssInLMIRAeeABpGipoX7vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4CgzrFxKtg70kuUwjZt0jq7uvr+EM6zRghs5lUtk8R507RX8Y
	j3agrMfgM33T4LjZWG8TMXTb3sdFxHLHutdHpMuCfSk06cvPRV1mAN8kq3aImqhbbUnxZwCN5IB
	if7CB2E53tqARDg95bOBcc0eRE5YEGZLSLA6ZX0U1
X-Gm-Gg: ATEYQzzMSmjNuD2LkVIuNKQERkTgj73dn9qXCdjyv2kubDaGvczawxLVL/Bh59RDt/S
	wgDlOsPQe18pntY0AgcSuq1O/YEVTPUycsyVxNdF57LMZzkL57g/vmIVdF/N5ppLBrnpLE7r0P4
	EIZUuJRULdVqlosxkyu3CvzMfGUZRiQeB1lVvToj1hHMnpRKMQuFYKPCLt4OyBURvqXThyKWs5W
	2bXGEFtuyq2IEg5TX9hZf4kTT8VaV7Jq1uMvOnQGX0Mdj7Tw8s9GpO6xJaeChnL5UcjqborqEnP
	eoJrv6Q=
X-Received: by 2002:a05:6102:3f0d:b0:5ed:f13:e58a with SMTP id
 ada2fe7eead31-5ff1419f7b6mr1037473137.37.1772067136513; Wed, 25 Feb 2026
 16:52:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-10-dmatlack@google.com>
 <aZ606sDJxtfNF6qW@google.com>
In-Reply-To: <aZ606sDJxtfNF6qW@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 25 Feb 2026 16:51:47 -0800
X-Gm-Features: AaiRm51I1tTdJRO5CbbBFYwdOmR4S6VSPvkujC59eyupuwvOv4iLZLnGYRmW3DQ
Message-ID: <CALzav=cH0-qqQJTOjDD7pHzsFeZOir5DoC3f1hhDg=jqK7vdgw@mail.gmail.com>
Subject: Re: [PATCH v2 09/22] vfio/pci: Store incoming Live Update state in
 struct vfio_pci_core_device
To: Pranjal Shrivastava <praan@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 12:38=E2=80=AFAM Pranjal Shrivastava <praan@google.=
com> wrote:
> On Thu, Jan 29, 2026 at 09:24:56PM +0000, David Matlack wrote:

> >  static bool vfio_pci_liveupdate_can_finish(struct liveupdate_file_op_a=
rgs *args)
> >  {
> > -     return args->retrieved;
> > +     struct vfio_pci_core_device *vdev;
> > +     struct vfio_device *device;
> > +
> > +     if (!args->retrieved)
> > +             return false;
> > +
> > +     device =3D vfio_device_from_file(args->file);
> > +     vdev =3D container_of(device, struct vfio_pci_core_device, vdev);
> > +
> > +     /* Check that vdev->liveupdate_incoming_state is no longer in use=
. */
> > +     guard(mutex)(&device->dev_set->lock);
> > +     return !vdev->liveupdate_incoming_state;
>
> Since we set this to NULL in the success path of vfio_pci_core_enable()
> I'm wondering if a failure in vfio_pci_core_enable could cause a
> resource leak? Because vfio_pci_liveupdate_can_finish() returns false
> as long as that pointer is valid, a single device failure will
> perpetually block the LIVEUPDATE_SESSION_FINISH IOCTL for the entire
> session preventing the LUO from reclaiming KHO memory.
>
> Shall we also set vdev->liveupdate_incoming_state =3D NULL on the error
> paths of vfio_pci_core_enable() ?

LIVEUPDATE_SESSION_FINISH will also perpetually fail if userspace
never calls ioctl(VFIO_DEVICE_BIND_IOMMUFD) (which is what triggers
vfio_pci_core_enable()). Or if that ioctl fails before it gets to
vfio_pci_core_enable().

It's not a great situation to be in, but this is why can_finish()
exists as a callback. Userspace must properly and correctly restore
all of the state in the session before the session can be cleaned up.
And the kernel is not going to handle every possible edge case (some
files in a session are restored but some are not), at least not
initially. If userspace gets stuck and cannot recover a resource then
userspace will have to reboot the host to get back to a healthy state.
