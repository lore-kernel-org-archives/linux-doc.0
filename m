Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC88372EE9
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982287; cv=pass; b=gjirH4u/Kcza68bDuugzubzV85anGmq+cJDguJjKugFKhKKUlsJsMdyV3JPD5wZF3CFqLEXJ73vqUT0NovmIqGx8jYBMphJuWvqYSUVtHM1KZhP6/BCfpq0gNsZToyNzMHZfuePNe36Tt6IRyAiXLI05+Y5MoSY4Z4TFoHEZ09c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982287; c=relaxed/simple;
	bh=1LE8KttVtGM+9CpiUlwllHY6AYyzUrNOnEbtRD51iDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7lGIAl3O16E4QaSD4ePRdfk/sIj7DohnkXu2cw165JiWmX2UuLfEmupw8B7dCjgbsrf6yklp1v8Jqe9zA/ZEA9kbZIikdgvIZUhNCWDjWOuEiLyFR3avgPF9zAq0NwDNOyiBqASAa/fpojuP32bOqQsJCS2BAFSQLv1LDawLCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RCSNOXLc; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RCSNOXLc"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38be5e86918so82596111fa.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 15:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776982284; cv=none;
        d=google.com; s=arc-20240605;
        b=JqeVZNS/HcdignDaS+gYHTzQkzv3SmvrFwNBU2c57qERlljeW8AilM8/9/l/FVoGw7
         aYHmzhZaxQAaS2QoQpHji+dXiTAi6mhGuBG7mBGDqn4hqUpzMpHhzDZ4ZD87XNgIGo7S
         Q1KU2xJbn1qRfCyZgiCNwrAkttLnIGgTvA67RcoyfblwbWK6HAUg0nkeiVUJre1zf2hc
         ZaoneXG7+uqV9dH6ixXNFRLHFuMei8MnwYtNzSLOaXoSR8keL29NT15PTIDA3q6/1AGf
         X3+hMufTC6KFCYekfl8Sd0S78oTVwER/C/Ea6HKb1w/q7/7TxcLwYWNxy4oVXR4Pj3bE
         yLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1LE8KttVtGM+9CpiUlwllHY6AYyzUrNOnEbtRD51iDc=;
        fh=KRGEhniwgTXVPAyWrHw1N0xN4jDDt8YCei3jrH6hSEQ=;
        b=Eb5W0L4e2oKGXOyYy9h4mN1tVS4ALIgmRoDf1g2P0XUIoxwvl5Ez2d7wHQ0vYqZpi9
         36XlpMKBMvO7XDKio7X3rkE777JDatvbXBNXwDYjIjFkgE2aG/ap1v0y7D0cCnFck2Ry
         jqnVgNekBx8mxzZs8Ah+V0DpETbAveD+7HUac1VPPozfL+KVWQnuLIix1N225hxEY+Y0
         MBxMYueYjj1a949YV0tBesv97GvyGYnjDUIxRIV9DorAjWQEhIKb+t6YY+bGq+aBVUmk
         CyoKki5BvIW1VeCsPaczRdYe80tpYqZ5rZv1nnX1Y0CZO11y1LHasoYeHuiFhGe/KDvq
         WbiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776982284; x=1777587084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LE8KttVtGM+9CpiUlwllHY6AYyzUrNOnEbtRD51iDc=;
        b=RCSNOXLc2RDedMpLLcSB07VXN1TcWxVckcnL+0r0qTQkGkuKmxa6Pe/0LfyQgxCWVW
         vNQBZwvY1uaaYFeB+fSgwtmyj4ienMzkRenCQenC8idV3GjbKmOk6mSXSimI7SRzo3cz
         T3Ho028BCBb2k1zqzwpXLqDiD+uZMONBNm23qJHHN+l4bgy26AOFaoY4EH/sCzcckY8e
         xmM9z4bNMDGKuvioRZPyI2fAe2qtEHbzZndIcKFq2Iw9MrWPdKIRaTWgMZfJmgN27EGa
         5clB2hQ2DN2VDdmcrWBwe6EqpiPV3YUSOgWd4waYbjZH/B/pKgVxIwJz6cS8ttLniK94
         6JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982284; x=1777587084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1LE8KttVtGM+9CpiUlwllHY6AYyzUrNOnEbtRD51iDc=;
        b=BNEwXmq4dm/QXfQ5X1s0nQ4bhRCq2z6Pq7K6qPGEAPqZyukZyd1KQgHKeolGv1Zs4W
         aDRcHWp3Lp9XfYubEDrd9uFf1qnQnnH4ZJVCV7ilwIXsRaU2783GVJUpU05Iqk/ya81o
         3QsJeq4Dik098bJh83kIdQE7vVAC+yrfAwZAxdagkjmIvx9ukA+7whshQFyfbCFf9BKF
         sBbiJafaLVTZTky4oo35nGBkKfw0grut0/jWLDaClyZLiFGfRoPbQqIF+ys0sZ4cJEMn
         trs1Na2mV3wFmefifHOB25qZleI5mtrskVKJu3SfXJStAeSYFbeDr9Ngh3POcFeuk2BW
         z60w==
X-Forwarded-Encrypted: i=1; AFNElJ8k3ijwA/1GoNqkOGEj2JrfO5tVnj83IHFu/1ZJARpbv5Ax2q3Z6RZjB8fPHJ8iJdDdMNr8Uy2jl+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf4pASW035NmB5EZcwAGLrW1U/QroS0CsZVfKGtgpjX2eFkAGI
	snB3mbA6BFZ0bVflHpxM40QUduFqBFTvR5EGiYLSxiRWyXutgH2k46u1Cjqx0OTuIjA9GOwdaG+
	9XH/QNFoRhSDKRvNVAErPEixPaD6mGnz93b4+X/Oh
X-Gm-Gg: AeBDievgN0YnoOYKSRiXDWGUmEaUcWXPYHHxdK58FA7/IPPZSAwvTEy6CI/7hJHieWN
	KvlX4NU1GmBsZu56PHYWkaJrDx3Td6qsEDpQ0htbC+OjpdebJNyKsFS5fMx5n9cSAHpNEvHg+Sx
	x4OMlK2NtmDRK4U16Xc4+l8+V0LU52gEirvOIQGuIAREMhiQfuwa3ZycDfrWtYubHwc0ZHTJG/v
	za20weRv1XgE7DzyDSXOSNlF92HRC8esgUH+8AN83l6XMY9l0MnhrZ6NcyXqIrF+X58Bzy2Do91
	7ZynOWTQGVs4ajqk7EMEc2+XI0BvUg==
X-Received: by 2002:a2e:bc83:0:b0:38c:6b7:ad39 with SMTP id
 38308e7fff4ca-38ec7818193mr99821181fa.13.1776982283419; Thu, 23 Apr 2026
 15:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com> <20260423212316.3431746-9-dmatlack@google.com>
In-Reply-To: <20260423212316.3431746-9-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 23 Apr 2026 15:10:55 -0700
X-Gm-Features: AQROBzCzQHNRAyujF9tGZltx4kVtGjkMoj2uVw4QUXf8lLhcB6v0kyr5BiRYiDc
Message-ID: <CALzav=dGpHEnEjyp8qc50iZrGeKJ47vjLvwtvkLCyNzOMJhozw@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] PCI: liveupdate: Require preserved devices are
 in immutable singleton IOMMU groups
To: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 2:23=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> Restrict support for preserving PCI devices across Live Update to
> devices in immutable singleton IOMMU groups. A device's group is
> considered immutable if all bridges upstream from the device up to the
> root port have the required ACS features enabled.
>
> Since ACS flags are inherited across a Live Update for preserved devices
> and all the way up to the root port, the preserved device should be in a
> singleton IOMMU group after kexec in the new kernel.
>
> This change should still permit all the current use-cases for PCI device
> preservation across Live Update, since it is intended to be used in
> Cloud enviroments which should have the required ACS features enabled
> for virtualization purposes.
>
> If a device is part of a multi-device IOMMU group, preserving it will
> now fail with an error. This restriction may be lifted in the future if
> support for preserving multi-device groups is desired.
>
> Signed-off-by: David Matlack <dmatlack@google.com>

Jason, do you think requiring singleton iommu groups is still
necessary/useful now that this series preserves ACS flags on preserved
devices and upstream bridges?
