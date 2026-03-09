Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13F1F181F
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077577; cv=pass; b=LaAxQpKQRMHHUjuvmwLrVBzMZzUjIHJW18Louav4T0DGpyoZ9PaLg4eih9HOjGM+oerP4DKghGw9XRuYqjNBN71v+tZGQoiD2Ku/bwlbxjnBc/iSzfXi9ZM1rFaYeKLj6ao4vveH6V8mDgCw5i5CkpdEKHvuQUQqeHJXL1EbKsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077577; c=relaxed/simple;
	bh=UzbVfxnpIrUZlx5xzEFDYneUs+jd4yOAM+H/ydSkGnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWkV0m9kUdwQB45yrcesu9mBrkzsIC7tOnRtl0Y0BQP5gZtvdZT8aWEstWDR4zdy7KWOJl19+j9pOfORJdiNNX0gjZgcsc6Wh5Eh++bBZVnJGjGkS2ZhBxMAgqPo/DhqGDBaWP8KJ54OJ8keQzdc05ueGDAbohFt93KV/7pv1iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BOqnSEKX; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BOqnSEKX"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so6333628e87.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 10:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773077574; cv=none;
        d=google.com; s=arc-20240605;
        b=At3jD6NC+F6wWTaaAZ8xjKZYnpH67P3p0UyR5DmGk4lRiQS5TP7ckP49Nw6dyF+O6K
         ZFzbM1AddhpxVwe1hg5VAOEoCSw0Z/E8E9jHkwshp+NyK6tzE230nt07vU+Icm3NXXVs
         MdnPCfYR7LuMcDRYcr2ZV/XPfKOkAjtviZAVTSii9NyNR6T3J5QxYvcrOFu4xXEGAbEF
         u7G0p75zxrxvP8S9vlZNYt7dd7A05tf5+x/Gqco7smJBoprOUS+Hiy2W+/i/7515mluQ
         gEBlegyol8YpTMVpTTftl+ZiBjGS9z0f0Sy8UinTzCzi5FTLp5RkaI5t1n+dTjfT0ghs
         +wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mL+d40KjyhuL+4bMpXUsYaQzeUUDZaEOQ6AdzLVzNPg=;
        fh=/xg/8jMHiMZPm7IGYCuWVe2arsNAmyNZIzjPjNN1nas=;
        b=De1P2Ndh8MLpOkQjnfMoR0re1eHaRwbIYEbQgGyNvMdKP9Vd/41PwQSepz5BZQDS/w
         7cdvsTZQvnyWozxiT2DiRWs/zf3B3UnifkrElztmIIEo4d6pruzxGHBH8w/6HGe/myqD
         BkoPc/gXntHPFecF51xMcQ+b2k5LqHrG6adN4n3nrqQ9PV4vIJGNraLjxISQ4tan2j0A
         hD8Q/qJsqLccTsEC9Cup51c9uS+n7dFDDXG0QLpJ9NPVIAwQoVz2YgD3Q3pM7hfRAWBO
         kFp+6l0oTF+vYo0lQG4VhnxkERYG2SJoOV+hjyRK3aNWCOcXcP42pmJy+gj4dNOxtkqS
         7T8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773077574; x=1773682374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL+d40KjyhuL+4bMpXUsYaQzeUUDZaEOQ6AdzLVzNPg=;
        b=BOqnSEKXUTbxSDH9TGikZ9vPUeq1YbVH2M4vnF6ofADIMO3AXxAhideB7H2xb8DqCd
         nW/+X93/6a4U2mz8iJEiRMNYSfA1UtCJCn5e5M7hm+yRTZHkT7HgVL5W98GrqnT4URxi
         kWpClKHjsRtCTfXVRdKyIsn3LMAC/6oNbcCMmt6NZd6q8/aF8OBKgaLSGGfZHI2Falg8
         SwbNG7WNM0Unw4TFKK3ZaRZgklVCY9rMocJJ17TrGshvEC2WJk9ZsUStHJH6hOEQieaQ
         CRXOGIvCsGgXQ4PRx4gvuJbqcAF6ruDgGXBMVYgRrofZqpMrF/VMbezUX+TvRBLpjWNq
         Q5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077574; x=1773682374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mL+d40KjyhuL+4bMpXUsYaQzeUUDZaEOQ6AdzLVzNPg=;
        b=CPqgzTV+sDVAhcj0TAA+ot6GP3ysWYFgPXcSZZcOlly/lTCeKq3Yd6EWUT8ed5QoUs
         z0LjlT4t6eP5bsBKf+JlvU2YsE+oRyeNwt/TItiUe1ryEpEHqJIkjq71zsVqy8QW/enQ
         iXKzkd48d6sk3kBwK+JXF7lsHD8xIc/+6a+DMZlC/BQEZfLPgfcWkkRQUWY5aX8U1q9j
         ibgwDL/9vzwU+Ev6Pg6JqtMGDzkM9CZPAkSIfGbqMbaaaPVOEaY+oxyXkn5s83D9ntUe
         DOn4F1gXTnb++77a+wULNtyB2oJY/5ST1P/6GDbpvncqGaLbkGIT8TvmEpV5D81e/Oar
         lrMA==
X-Forwarded-Encrypted: i=1; AJvYcCWqf7ZI5DnEzwzx6vyi6x0j/vaAqaf+f7Ly4tc+dxpFpe7LLC2m3WXfWxcM0KFUuzHXDDRlNeSjKVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YybUmxwwchoS6qzuZmI97SaBdgY2D6waS4IltYkK/hQpDajoKNt
	nAaVDmx1vLbAZbQwamYa45QX7UnAaSQtKjCeTgZjgLrOzC3u6PnzYi9oUaVbXPn3SY9KSA+IzFW
	YGZd1o0IXt0vyIszIe+jKmev1TzNDl407qgu6GDFV
X-Gm-Gg: ATEYQzyhxCoeqesqT0GkEzwJSssruRQWfVP/5mCv+TIvUNqCa8h43Zj4J1iIRoA4kQ7
	M+I+d3OCqtrRsteCBBr652YW+kZ21fxf1hwP5b2wvk1kH6aXsjTQawn3dtnmJqcE6EhU5Jk8yWJ
	5DpbeEDPTbMo0oWQZGjh664002Qz57mOkNqBGIObOPQp0Ae6rMJoFKHSz1MhdLIYx3HvTnN8iY3
	TCVgo3guzGcbNI5cbYCq9ngWznjBonPoahGEmXPBde4+o5aHWoKoDSfdjY0eYdtms3u7F7LWxdp
	fom97lbL
X-Received: by 2002:a2e:9e89:0:b0:389:fc6b:943f with SMTP id
 38308e7fff4ca-38a40b72dbbmr31791631fa.11.1773077573745; Mon, 09 Mar 2026
 10:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com>
 <20260227084658.3767d801@shazbot.org> <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
 <20260227105720.522ca97f@shazbot.org>
In-Reply-To: <20260227105720.522ca97f@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 9 Mar 2026 10:32:25 -0700
X-Gm-Features: AaiRm51UQkPGi_THgF8Q61sl9tHSSk61beTImuWL9a-lckj5dJAcnYvj7LG9bmc
Message-ID: <CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
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
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 9:57=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Fri, 27 Feb 2026 09:07:48 -0800
> David Matlack <dmatlack@google.com> wrote:
>
> > On Fri, Feb 27, 2026 at 7:47=E2=80=AFAM Alex Williamson <alex@shazbot.o=
rg> wrote:
> > >
> > > On Fri, 27 Feb 2026 00:51:18 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> > >
> > > > On 2026-02-26 05:00 PM, Alex Williamson wrote:
> > > > > On Thu, 29 Jan 2026 21:24:57 +0000
> > > > > David Matlack <dmatlack@google.com> wrote:
> > > > > >
> > > > > > - vdev->reset_works =3D !ret;
> > > > > >   pci_save_state(pdev);
> > > > > >   vdev->pci_saved_state =3D pci_store_saved_state(pdev);
> > > > >
> > > > > Isn't this a problem too?  In the first kernel we store the initi=
al,
> > > > > post reset state of the device, now we're storing some arbitrary =
state.
> > > > > This is the state we're restore when the device is closed.
> > > >
> > > > The previous kernel resets the device and restores it back to its
> > > > post reset state in vfio_pci_liveupdate_freeze() before handing off
> > > > control to the next kernel. So my intention here is that VFIO will
> > > > receive the device in that state, allowing it to call
> > > > pci_store_saved_state() here to capture the post reset state of the
> > > > device again.
> > > >
> > > > Eventually we want to drop the reset in vfio_pci_liveupdate_freeze(=
) and
> > > > preserve vdev->pci_saved_state across the Live Update. But I was ho=
ping
> > > > to add that in a follow up series to avoid this one getting too lon=
g.
> > >
> > > I appreciate reviewing this in smaller chunks, but how does userspace
> > > know whether the kernel contains a stub implementation of liveupdate =
or
> > > behaves according to the end goal?
> >
> > Would a new VFIO_DEVICE_INFO_CAP be a good way to communicate this
> > information to userspace?
>
> Sorry if I don't have the whole model in my head yet, but is exposing
> the restriction to the vfio user of the device sufficient to manage the
> liveupdate orchestration?  For example, a VFIO_DEVICE_INFO_CAP pushes
> the knowledge to QEMU... what does QEMU do with that knowledge?  Who
> imposes the policy decision to decide what support is sufficient?

Hm.. good questions. I don't think we want userspace inspecting bits
exposed by the kernel and trying to infer exactly what's being
preserved and whether it's "good enough" to use. And such a UAPI would
become tech debt once we finish development, I suspect.

A better approach would be to hide this support from userspace until
we decide it is ready for production use-cases.

To enable development and testing, we can add an opt-in mechanism,
such as CONFIG_EXPERIMENTAL or a kernel parameter. For example, adding
something like this to vfio_pci_liveupdate_preserve():

if (!IS_ENABLED(CONFIG_EXPERIMENTAL)) {
        pr_warn("vfio-pci file preservation requires
CONFIG_EXPERIMENTAL to enable!\n");
        return -EOPNOTSUPP;
}

Once we feel the support is ready, we can just submit a patch to
delete those lines, and there will be no left-over UAPI.
