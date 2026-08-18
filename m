Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4983ABDB3
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 17:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072553; cv=pass; b=ULH8zdrCeM8h/2+9moMeV+xv0Pgiv/MRiufNFQKWQa1mVfTnBrMi00e56i4ThVRJ3jIdwxPg5yEZ/tRYollCBn0gvR77E2h5bnFphak/n7bCw/Wo2AmwR3eOZ6RTaB5rhNfA5l24bGevG7owtfFFs8KKH+vmW0BLwRUy5l8R0pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072553; c=relaxed/simple;
	bh=CT5neSn2K0bN9/PkbCJ3i+lCiVuxNjc3dREsIOEIXME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIpr+uXS6vEadY1+2nHG7uKt5qVG0aRRG6HrHx/0e5qeShZA3DHvtAiRLwptxlk6rxPFu8wV+RZdHzcWB86hFcJXa3Z3fpZrO7vEd4PWDKe0RdVZIW/IRKICKJssa1xGO6lh/iCrtrReQby2jmezts2KRw56tnOAUEwY0RcN8uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CzNZv/T3; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CzNZv/T3"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b3119957f0so108529e87.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 10:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787072550; cv=none;
        d=google.com; s=arc-20260327;
        b=LUCt/mFzjim3Ad5xKQzVejtu/ZYyNzXUkxAuzIzRZxvMLQSbgJ6LR1GKSe5qeCRVNM
         wZ3EvKOiWEdWGcpGYP93H8LUWvYR6++lodX5HZo4M9rddBZMPX4I4ol3MwxlYz6vGxuq
         Fpriva58irjqAJQAt8z7NCgUZtrlaVw6ZJm4JtpLd29Xa9R6XZglWptNgb5wy/gyHF3o
         pQNtrNVhYPwteEV4MnC/a/6vLcmJPGfhUCKreQvdSq9O/S6ee40DjhWGQfPrJjaY8Ebp
         me12o349J9g+k4OCg/zFv5pV1T4iA3zEiZlRy4rCcdy2gu/VK+bmznkO5KMVRitqBuRA
         92Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gjtdIb6WLQbnwc+hZbvzaCjPXgJQSb26VEMl+8tkzq0=;
        fh=mHTRHw7GHn79elV38GjimjujTE5xDfAiNuao1b8Mj9c=;
        b=n7YK2q1VOFasininlIvEJIi0cJk0r7EmCMQfhy9nrXynVmZj/Se+LANAScyMzTRzkl
         9uW2+QdOHxHQi+h8sY8zIRldanEM0+AbDMRnHnJ46FnWh5xE8idDn/q3LnTgE7clGVkj
         ROMb1l2luvhTA+/A7ok+g9mhQ2ZNCqmclolSQeq9qgCVGcFypd+xJipXifE/CK19eDNH
         pG066kkV3r1kITVNpMeWkB7YqgHrihT6Gbeq1LZNn4syUEXNcXsiz2xKGNr8Bnvdm+hc
         xaGQAvzDE0RRa+i7leziHVXh70lTq+xJTOTswyWMQafhQv41/6Nbpnyyq/sql2jymuwJ
         9Ylg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787072550; x=1787677350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gjtdIb6WLQbnwc+hZbvzaCjPXgJQSb26VEMl+8tkzq0=;
        b=CzNZv/T3GML5P4agqAOGW7n3MQajSGnlLUs6x0tO+CvLjGfBFARXz+JSSVmVqAOmyP
         K4aWAsjUOKQu1W0L472UDKk90G0GCtdFkVQYvWjnwoB0n/gSovpZpoz/g4JRimMG6bC/
         R2jFCnSS5HOsG6l8Z2FLpbfzBsXJDofKXsiTFTANyppDSvRUMH6bobVl/6Fyq6dNdDaH
         0/13FGC2CLNvFQe++4YFw3DN2UTXvqOD9Q0vuYJcMBadUR3gjPLwcw4YgGEuNOMzP3HM
         DjnJaTA0Q0UwBckAsR1SxvAsiuwrL5eZ7OvTn0aqLlzvzKZx3F2J3cQnZzAnsvtKARe0
         93Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787072550; x=1787677350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjtdIb6WLQbnwc+hZbvzaCjPXgJQSb26VEMl+8tkzq0=;
        b=BbwR/9UljoqAidxBgFnm5QQ+RYE5zolYPlOhMTJYmYvzRnoZQp3qQxag1qmEhK6Flw
         2ZI1q1KjMsiup8IYQ/6+lG8cds/+1bUlPQTGRsMcmS+sgeGcuPSiRMdkDvBl6+oqz3E0
         k6M8J2Zq7cANt5EYLJeKNk4pXPWVpv8ZOfrT2Da9hKLj399RTY4dkVBpbYAODWNuecK0
         Q519FFJIf/+hac/2j2NMQr0Oyi/wsC0OEXGkx5hvYUNVDpTYfW3DAIlKG6LL4/4l/1ux
         qT4e/DEuqMoBBMMOv2TEg4rgYhwmnI/dYoUm5mFEaTcXfWXeP9AyAVoCx5CQCGGPL6LS
         RPSg==
X-Forwarded-Encrypted: i=1; AHgh+RpT2JnBtiA46AEN3k0/+7wx6DPbBAyeFFEpKgknQazrMgbTYOP62gJzjG86YibVrk3cXp+QDwjEkVE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw71G4nwaNbXSSoJmUTZar+lo6j/nNY+bkt2W/9sHer+XdJlkbI
	N02gfngVHEcqvVEzAyreiCwq604NO3ci5UH3Vmw1Wfz5cbo2dZ7xWfLJSkkO0LKQO5S8B1bu2CE
	NLs3kq8BYKvLNlR1ZjubAS06fxzJU+aDDAAXn4/wv
X-Gm-Gg: AR+sD102NOuQmZqpoSDNkPBzV5+tXPDrLkfx4MnN238rZR0fiBrKzWJTCxGVQR0Yd12
	Z1KZwUyn5dEe/jEG+zpZZFseahj9a/0wagq0R1AlfL/FnlWyBFsdZa2LngaMPN0AkWNOYZ0qHc9
	ila5Yk2xfiRUmIqPMLVlbTMIf133mfninmsmk1jg6i07gCkAkY5Gx8V5V2yJ2nu91/h2LuptkBD
	BynnFLEAKcxR5SZNs2e0FPID/o15gm7o+vzW8Wlyzgtu1Bc5uznHDWwiLxwCHANOZ/QhUSkkzBx
	3W7fIoaiH2IyKV/eMyGSirMvm83AvN/svX3ksNEW/Gl6
X-Received: by 2002:a05:6512:6686:20b0:5b4:3ddd:8996 with SMTP id
 2adb3069b0e04-5b470676e75mr1757831e87.15.1787072549336; Tue, 18 Aug 2026
 10:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com>
In-Reply-To: <20260728221007.2098560-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 18 Aug 2026 10:01:58 -0700
X-Gm-Features: AcwNN1V4a25Yv0iJ76SrkHBknW5LsS7U4x19BfrVjGgcR0yRKfOyORXyqOEjm-s
Message-ID: <CALzav=ezKW25+1h=xQCRx0TQDtpADKpXQcKfz-3vbapz5-zwvQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/12] PCI: liveupdate: PCI core support for Live Update
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
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

On Tue, Jul 28, 2026 at 3:10=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
...
> Merge Plan
> ----------
>
> I propose we merge this series through liveupdate.git for 2 reasons:
>
>  1. There are some LUO core changes around how FLBs are refcounted in
>     the next branch of liveupdate.git that this series depends on.
>
>  2. We had previously agreed that the files covered by the PCI LIVE
>     UPDATE maintainer entry would be merged through the liveupdate.git
>     tree (which is the majority of this series), so this would be
>     following that process.
>
> This plan still needs to be Acked by Bjorn Helgaas as there are some PCI
> core changes in this series.
...
> David Matlack (12):
>   PCI: liveupdate: Set up FLB handler for the PCI core
>   PCI: liveupdate: Track outgoing preserved PCI devices
>   PCI: liveupdate: Track incoming preserved PCI devices
>   PCI: liveupdate: Document driver binding responsibilities
>   PCI: liveupdate: Preserve bus numbers during Live Update
>   PCI: liveupdate: Auto-preserve upstream bridges across Live Update
>   PCI: Refactor matching logic for pci_dev_acs_ops
>   PCI: liveupdate: Adopt ACS controls in incoming preserved devices
>   PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
>   PCI: liveupdate: Freeze preservation status during shutdown
>   PCI: liveupdate: Do not disable bus mastering on preserved devices
>     during kexec
>   Documentation: PCI: Add documentation for Live Update

Hi Bjorn,

Pasha and I discussed this series and are hoping to merge it into the
liveupdate tree by the first week of September so that it has enough
time to soak in linux-next before 7.4. I was wondering if you think
that is a reasonable plan and if you have any lingering concerns.

Thanks,
--David
