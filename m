Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44EE242D6A
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325505; cv=pass; b=jM5X2YiSfewsZmWlLh7cTLVBZ6h1gKhJ6kLfYAZDoa+oPd8XxsKUxlmhj1raaIg1G2DJLRQsG5Xz+vtREvrgfpq2sxxaXX/HYbBeJJilG2fa20Lw0UNv/9xiVSSnZJQUNDtW2xGc5k7x/V7qXYUgCqmvhvfJ7weDO7Gg/xPLEyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325505; c=relaxed/simple;
	bh=XxyXGFehDCe0pfONU0BVHIsiW5Y6i0tO8AG04f++XSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTQ+Up/m+YGU1Z6OqIsrDEQZdG+ghm8H8IhME4HS86WH3VGICSXUhcpKzPmtqaGeV2qqdGGCKQ9vZCgWBLQm5HRYf3vCNyeFC9yW4chPrTfkZBoIGHiJWb16HZO1jbKsgHuM/dB2m/fITKh2lb5JqZiYdzeusEFN/Daf/p/BhWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GMA/GD85; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GMA/GD85"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e9653b580so119113781fa.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 14:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777325501; cv=none;
        d=google.com; s=arc-20240605;
        b=T2zD1y6u5OmqMRJU5g9NEVdQWNLg8CIxLkS/y5Uk5S8bS0h9A5RaED8znVdnqPnVij
         JPg5Qywpo2sOy1cUjxJxNkL+KS9/FDSzpWjTljG49AZCSfOomsDa7QfEWbxKnBGa/9EM
         KqK28JDKGJuXx/qe7N6gUf0QaXiRV0Q8LPTDCS41gLCYg1cVejd2jQkfbXIyUiZ6ewl9
         FC9PODfVpN+93Ogd8f6d1wfBrccRZmm4Bdm8vK4XOD/ITGdOC2yKcecP1OWM+D1+O5xO
         HpG/eVsAs4SaNZv4aQrtwq1zdlKRjmpvdYewpSUndDVMG4eJFVUwcC/e7Svsapj7jgv9
         l1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4fbSZrcbEX7pFS60K+snXC2z4cFQZ67H6ZAP0NTDTDM=;
        fh=FvK1jsms5qFbQZhO2lmR1IP4rkFCYWMQOhO8dMwrlnc=;
        b=cuW6tAxeCAXGOxatr4BAG6SZcv3hDgMThmakND8jzke/bmxWn7RmL8xcNzJnb2zvpe
         jfHEqxbvUw5updBpwHH+3gDk86Bgvt9tS9s55aHmwu2VPMn32q+hgO7tRgtQoiSYC+RZ
         Ri9c4h3OdJgCFCdjsDrAR2hJ75IXcEFfcpf7MBAJXE3oISZBO9av60uewqTHemiqB38a
         OFEuSaXhJ9Im0YaAwlJxtpiWBrJcDU2EwnKaaJhhji8t+4aplq6l7zys3+ZCgQ5rXji6
         o3hCW112xrpJaCA62vUEi33YojTDYSF04GFyJoHfkp46u3ILDOhLVfJp5hbzNuBIp7fA
         nu9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777325501; x=1777930301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fbSZrcbEX7pFS60K+snXC2z4cFQZ67H6ZAP0NTDTDM=;
        b=GMA/GD85zEEHmut25/kka0RPb4oHoMoH4eR0YGpu24JrcbVz+UsJiiiJ04vxZXXjLG
         rjo+LSj5O6azoj7oMNvIlC+cY1+oOBZk6Tam0PWDBigUfEOLIEKK68cU9FuNAX6cBn5l
         0PGzLLrVEF1cD7rE09HjIsRsdXPF70qaxCZPuB07uLBI7xZ7Qpg3MUC79t8zCIRYIjVm
         j6o47V1iGBrlKzMBGjHplWZSxAGLzTS3GVMVNMfPEU4Kfjl6m27E2azIiE80KbmKgoE1
         wqnDrY/cz9FVJiBgRNzD/wWmGJcL0zoYMGKpDXN+JBTyzJsdgQENR1U9gK6RvON31CXw
         lwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325501; x=1777930301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4fbSZrcbEX7pFS60K+snXC2z4cFQZ67H6ZAP0NTDTDM=;
        b=V0rGBOpUbsxEbN7GlULQJbY7FEPCHFn+D/SbaxLdhxNmWB49ZGSZkKrU8qEyREoNP1
         ytPMvEiVf+VoyAgWPbdiPgPvtw1cRaNOyBtaU/2lldzy/3e0ZR+X3pHi7oMzrs8/Sz7Y
         huOqE6BX/O39QkDYLJmQcpvAltQ51z7itR/x5ljgIlKE3EI8M7KtdPiVpnxnYJUuvd5d
         aHw1J5SRGSESirj+ixVyajWlRjTKonUUXJ+mctZiu7PhR2pOMp9BXFff+JJiAmmLzbNf
         GYpZU1Fz7FOZ/LSaf5LQZf2AH1a1bkGdw+xdfLZdZ7rvbYbYQI7nhgS1dGX2kkbjSgOR
         +k5w==
X-Forwarded-Encrypted: i=1; AFNElJ/eGyu8oMuupyyNpXa0kUj7KmfwYi2My/Q0TZOGs1axe2PHBBrHNgz7mSw0dlARTkLH7BW7gdioGRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84Iz140fPRE9/3ncKJAv/0HvkGuz3Ok73Kyf40ohczUoLgUmA
	LvXKliRjbUM7DsrCjCJdMMKBZqyPG0Vh+lAUqV/fowAhaD+iG226k5emh50oCWtUs+RIcmVkhZP
	s2yTbwfWmhHtx1G/C5T/BLFnLFMgViRv39BnupePm
X-Gm-Gg: AeBDiesYni5/qNZc+uSSPE7l6vTr6OoUmqNo2HpEKycVI8VmmLF/LzMnaBGo4QHpwsR
	SG2XGYlhPE0GMCa8J/EGZNCSKNiVfl7t+4dP2URHI2tTKCY2PwypPHHLGws3xpA7wSovADmyTdi
	nYnyqf5r3CwvqKfBHacIjkxr5/yQX1ub6QQ6t4jEZRzDygMO46d7n8Q7gCRDMn6sDot9a+3HOmE
	LCVYJSmF2Kuj+w2GvR0HRhrHHwmPVpTEo8sfckq+flZSn7K2O3Y+BMrvGoxPYwMjIxRuJeapnQ4
	5UQahENa+6e6q1IrE+kKTP2VVSNu6w==
X-Received: by 2002:a05:6512:3c8f:b0:5a4:505:f62f with SMTP id
 2adb3069b0e04-5a746411871mr173644e87.6.1777325500555; Mon, 27 Apr 2026
 14:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-2-dmatlack@google.com> <20260427210529.GA186381@bhelgaas>
In-Reply-To: <20260427210529.GA186381@bhelgaas>
From: David Matlack <dmatlack@google.com>
Date: Mon, 27 Apr 2026 14:31:11 -0700
X-Gm-Features: AVHnY4K95rEzKgWcXKT0jFnCdsBpr0VFFFUI48Oher6g49BqIzQIKoHjNP8bc8M
Message-ID: <CALzav=c=99653vuRa0S6cyAuTfP-PWFpOdopYArihOBLor6eQA@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] PCI: liveupdate: Set up FLB handler for the PCI core
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 2:05=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:

> > +++ b/MAINTAINERS
> > @@ -20555,6 +20555,18 @@ L:   linux-pci@vger.kernel.org
> >  S:   Supported
> >  F:   Documentation/PCI/pci-error-recovery.rst
> >
> > +PCI LIVE UPDATE
> > +M:   Bjorn Helgaas <bhelgaas@google.com>
>
> I don't think I want to be the primary contact here.  I'll see patches
> regardless since they're on linux-pci.

Ack, I will drop this line from v5.
