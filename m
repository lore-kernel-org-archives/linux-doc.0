Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28E30CD9E
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475300; cv=pass; b=Gch4OBZJh+WXX1BD+eOoV3quR3nDX7P7mz1LmyM1dsgebzyS1ThRqgpekixNXRgTXpJifuP1ByQ4o6GbNfj2EDv+XP4izyfW9kI1ByFga827Wes54AjTnjsQ4FagEYqj2xOjWp0ZNr2r5G1dXxlWJ6AaXdGvY1BW0rzb5jJ1JXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475300; c=relaxed/simple;
	bh=BTi+4ARakd9uxctTdqjtJnxTFNq/yPeOIt/d2iLvfuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvP/apoN1a++RF2d5/lsKEnsek05CkvtkGjKDwkoqlvD3+6S1cpa24q35u6awVOscCg/JgovrVN65yF+ggfaP1w6F8JNBZDl1UUX3bQYzOxj480FQ8cr3TgnHi+d5v2xJvv7TCO0TTA0MVp5RygRa8diTBRR1i26+3pLyKc5h5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bTMZwI8Z; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bTMZwI8Z"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3870df2331aso12937151fa.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 10:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772475297; cv=none;
        d=google.com; s=arc-20240605;
        b=UQsheAPIMSUSCS+NGh5K2GSmvHUZwamJhVyLcWZkHZE0gRgyZ/qS4ZNfWDqVuIW8KS
         bfd53I0zgVQCJHnRrOkCQchosnUQQrC/UF/6EzZ+hEas+cFT2v703bsHRvQIpqH8rehS
         wKcImW6jzURsq9Mgp6UQYMJQB9j8lw2uA/E0wGvoUkwJ9fUYKPOsiYmmCr/PtqQS1VI2
         t4Lcm9QfBeJ2aFXD9aqlc3CMUgsCANIhRDetkcrhFISBMWGdWxZ6dwTMtGcyTpeG/QYK
         UqFIfgD6ss216goW2tL0qLMW4jt/83sIYpQKdBADXhnqwXP0+ezga10pKQUlSPbkxkTk
         pZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZw46QiejIxPJc1G5DNZGnj4KsLWM6jIVrYLGkqOkHQ=;
        fh=MBvlH0bgONfj59/2MRpPCbs0BMBTvXQPsoiyLYr4A8I=;
        b=OvvO2KfDVxPPJJ8FO5M7jbFqSGzRUu4DLfkDF5hg5rHbn/3QfwJGNn4eO8gHYcKQez
         2HIUmvcN1KWDYN0b+NSdqAE+k0+/id8k6dMoeD5kKC83id+W1kFDNqCupNwq8Q6X39fX
         Plx4h1kHbKE02ptTHpfaJan2p7AchojJl009lsa1zWAgtkjrICTCwLVZsYXIfB7Gex4I
         psxu0QH6orJJ1eGo46Bo61dyOgOLwX80w6hF5bD0mjjwZHjGRzuvcKstN1s0og9gfWt4
         TSn+g8i6z0g3sHRzKhPWmAx/4sv4bzkj9FNlZ/929xIvLrQTTpO+PnH9jrUXTmrjn6+0
         VFXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772475297; x=1773080097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZw46QiejIxPJc1G5DNZGnj4KsLWM6jIVrYLGkqOkHQ=;
        b=bTMZwI8ZdQqnj4AgTxkJe6IjG1pfNONBuMwDLAvSla2GHqfEkX0h99WhB2RdJaxT+T
         ujJn1WMtH6ol/zVwaursQALwAzikhqQRDXCXEVQw3oUlr3T6wYY/W1MLeTLqR1U0ivhK
         o6px54O0EN+5JWoPVTj/QKoXmNd1VRfu++gSIhoN5AiBjhlmwEUJsUfn/rAaKxPB66UU
         TgVupI8uG5Ma/tMs0zMwft7t0/FZmOkm4e6VdgXJ5uE9PhQ3K1eQqmyVK7Xy56dQ0n+C
         EdIjgD9nrHWAmhLtECRerfHkXFdZoUUZGd/7Y3fpDuU4gxAd0M745lS0yWkTmNo9M+Rj
         J7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475297; x=1773080097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZw46QiejIxPJc1G5DNZGnj4KsLWM6jIVrYLGkqOkHQ=;
        b=UC2dWvt5Avb1kkaXpUq35PygBFZjIQqnxUI6lh0n3GbSNtus3S5LOyC6qhnwFx0X02
         oOdfA2c+2Fe3pRvW7BKSDPFUBG/+72N1UCUO9FtPAKGqiEjai02spGonNj5sk4Tar9TZ
         S/c5VkngNXfOE/1U9KLTI7MLgSWV03W9T90UEQa6K6katMTKDsHmyclxN7VKkKFNv+Xv
         1qt8tjS4AaA5EAn0DyJR3Y6qzH3tvU6i2816GzfSYWtBDjXV7uybUMEL9kQ47lS6XBXT
         U5pioj0AKZi2fDWUVQIRpbF0WB3W5WbWWxnA1qvzxs2Y/MHE2kI9y0gfyaJ8lckq26zB
         w8gw==
X-Forwarded-Encrypted: i=1; AJvYcCXZN/I9lvrpztHnpHHDL/I6Y8+U8L/cVL1Qtm1Ei/XWkeUDb/6gQYM0AUTtv+ElYN37zgZF/gzF8Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8eCt5XsWgDem+Yn2iLWNAfm+p4wRY2FUQjR1MaGpxxZv9nOme
	5Era3N2SCrfltgMAct3njtnbgdEp15jamkil0qjiBYiNCB4fFNM9whn6OY5Upsynfh4zAVDB1B2
	YcT4FFfgj8GcyGlcsqnRjA+rf0CbvuYSQAzUyEDTE
X-Gm-Gg: ATEYQzwV9sdo/uh0b9zcdBuO+i9/C3gCWxs3qN4YCk4YCjhq2ifbfJyuQVkH9l3INi2
	tWGeW1lk2nEAvE9teyfSZnKsSL1TSrweOe9oMgM9BqvA5GDBAvtgsEjunoAzJ08mqORt42VeJCW
	77J1q09BBoNkGG9IgtItJNCOlnK0h61K16EEZRSVj+d8Stp/QIkqEUq8PntuEJK6Db72cl/UMzB
	e819VtRI6n8MkjI1F2akXDDkMolg8LOL6PUU4gF9KWoHtVsxgW0SZARc7vmBflTzAtzVradXkZ8
	0gMtgkw=
X-Received: by 2002:a2e:8094:0:b0:389:ed12:9731 with SMTP id
 38308e7fff4ca-389f1e29849mr81213251fa.16.1772475296490; Mon, 02 Mar 2026
 10:14:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-4-dmatlack@google.com> <20260225224746.GA3714478@bhelgaas>
 <aZ-Dqi782aafiE_-@google.com> <20260226144057.GA5933@nvidia.com>
 <20260227090449.2a23d06d@shazbot.org> <20260301192236.GQ5933@nvidia.com>
In-Reply-To: <20260301192236.GQ5933@nvidia.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 2 Mar 2026 10:14:29 -0800
X-Gm-Features: AaiRm53G4DyTBgh8HthgkNXd7A4lLjemXkfCrH3k_RfrPJCtk91UZa8WxDGHRMs
Message-ID: <CALzav=eJ63gitLatAerrjEc+o3VXcRor3XwA7_o2PmKYnMwCuA@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] PCI: Inherit bus numbers from previous kernel
 during Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
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

On Sun, Mar 1, 2026 at 11:22=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Fri, Feb 27, 2026 at 09:04:49AM -0700, Alex Williamson wrote:
>
> > Not only fabric topology, but also routing.
>
> Yes
>
> > ACS overrides on the
> > command line would need to be enforced between the original and kexec
> > kernel such that IOMMU groups are deterministic.  Thanks,
>
> That's a good point, I think as a reasonable starting point we should
> require live update preserved devices to have singleton iommu_groups
> on both sides. That is easy to check and enforce, and it doesn't
> matter how the administrator makes that happen.

I can add that in the next version.

> You also can't change the ACS flags while traffic is flowing because
> that changes the fabric routing too. This should take care to enforce
> that restriction as well.

I'll look into this but will probably defer it to a future series. We
need several more pieces in place until we are ready to support
traffic to/from preserved devices during the Live Update.
