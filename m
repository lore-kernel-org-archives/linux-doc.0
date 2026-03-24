Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813C39DBE3
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370023; cv=pass; b=OLTOcsiI31fPk6yxs9z+e8rFiffZ52rq0mTMnN5QiHmaDAkjwcjZl9bT+vwGVLZqyFbYhXfCoLcE+PWGbHZdxsqt0K0pTqUaZCQLepkY8lRTYRO0UK5gc2bAvKhHUG0uA8WMt20N/TGy3I6vB+81mzUQAakOKDEPF8XCpixXbL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370023; c=relaxed/simple;
	bh=KyZccWfRZPRCXyH3JPYtLHqoTnA1c/Yv1X7rEaPg17A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQCCIvDVPdeWLH6msh+SGnsHMDsVYI8l+mXpzVSUC4Q4lN3NbWrvkqCdBZxgZdnLeArj+MhS/TyObl+nV5B2zRvhuQSC/cdlNQEx6pvDWWQ/C5Yv5MuU2y7qxv/4K1WUaMWF5ZlQAvLXp3sF/2454mHn3WA0HJxKFPeqnQyBl0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HW6Q9NWL; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HW6Q9NWL"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so4759665e87.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774370021; cv=none;
        d=google.com; s=arc-20240605;
        b=FiuPwBi9iIvqDEET6I80nWGjtzdVd/LRSUmigf4ujpSVmOzs76lw6Yn1gHWtOyAyEN
         Q/6vkNkTAx/c2z73kKs0MFtN9FB6eTFW9z2UkegzknjFXuGv+CAquuUFeQsj1uXfQzy8
         zZGuP04E8w1K3HIBaaUsUsT0Z5EahxiJyzobqJZq6gOjLjahBnrLBfnylfOJhdPCIitH
         /5j4dasfLlhMAzqFGg1SjVIBAsnJi7IoqdPHM6EkS4hbwod1PcJOVw3wnovFBRDxdoQ9
         MbvbOE7LuhbuDl92B6SEKmPCFKVfqmWEIHIu1Rhx86nkXkcFjWyPU1tYvEf3ahkxf57M
         9EAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f++PU3wwkpbB0N6cii11zfED2xylkHlgqhKc/U2ncVo=;
        fh=ZmJuy56xANJOQ2sm7BiCab8vPrZvhhbuRFr+IqaeHEQ=;
        b=OKx+WLPhmcP+lpIFTwMr72jkxq2v3wXocl+uNH3yfV0V3BvhgnQ0AV4l95zO/hAD9I
         BK1Yt5cuoORVrPkixd95V7PD8s1OF3lhgZegEEigGW1oaqHx8I+/1GJjaazch1VkLRiP
         9gLbVc0XYH/arGCN0K4XoWuzBFM88QDdP9riFPph2mJuzPwIg04/evSOtgPirTVNUMDJ
         nIMaoI5o3tENHXkJNxXYMdojWHmeyPUawn1QpZ0GlOQalMbiD6UtQkr73KG+1pwvv8Wy
         Jv5qKAt06DixdYDfCYrrshq/hbI6eUugTxtFVNHt4qTZqdD+JFypULNO1V9UAx+NoLz3
         sf/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774370021; x=1774974821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f++PU3wwkpbB0N6cii11zfED2xylkHlgqhKc/U2ncVo=;
        b=HW6Q9NWLycxYs8C8OOQKDxwRZAuJuQI9wdKwP6+z6AcgPywU01ml6PpY55p34Zdi1z
         xwwbe9uS568Mz3uM+ZUTpdl4x8sIZV3+5Xq0wiiZtI5mlflMpQLOP4d7CtoB6BPuukiU
         fZxn4j+WFmsZRFNUGas7J47gd9YQNXgYlZ97JH6kk3lVfdGiEiH4CygTGrkkB/ngLfRH
         q7muSWLsaGO2EqKJDYVHsVSl52GjCMhUbRNY2Xbd1qDKLL8/vESy4wESEkqSxtf5oL3w
         ibHgdDgJWGH8NY7mxCGKFzII/YX2lS3BAQFV/j9ZoJKuXTnRttyweZrCBuf7uekiLjUm
         FIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370021; x=1774974821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f++PU3wwkpbB0N6cii11zfED2xylkHlgqhKc/U2ncVo=;
        b=IHtUeM0AinXCjIepQ4RNmMPr1j1G19o8W3Aw3kH+0ILfbGwN1HwcwLnQRFX1S68trI
         tnan0UAKkSkCIjRJjXuuqY8zyEEEqorsnZmKBgeYMmyQF4ELfIZ8AmhZgY6jFOFzCTfz
         XyWf04uHO9diUNpm+sRNv42+m47rOb4IBB6pNu2R7//OTlnaV+CREI23njrc8k9VlLGH
         D4z3TB5F/xGxE4sVwW27HvFY3CoTcIV4Xn2wpOpL/xoZVQlf4EnqX2xMIiBRwTEFgkWh
         pVlZPAvJmyv9+yf4+0sc8YKO7Exh9TBvYtAKaqqrgDZy8zrUHkpB7FOgYDYghcvI0GQu
         ACxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUohijNUjmsARXJTyTSprHaXOoIEyGBsd1zHw7JuTpgu9Pfiiwy7FAbJ4yWgroP72X/qllAaN65jY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsqLPoruuF9h0AaDjEeGPzlLumAyBAehc+T0nNrqMibqMQStO
	7BSKOm1TWY539qW/6FUyyQB+X0gduglNPkEeM0v5Gn4dJ+iSm/uILRtJoymvsM7Zgv4Uy0EekbC
	S0eRwZHTq2wr/QNIzWxNqq9r0zdh+eRTB/GLbIGy7
X-Gm-Gg: ATEYQzzXRgYxdCHWp7YCPVeFcnTkKf410BUreyrWuk8yaiKE6cB/XKu2+bVfobq72dW
	14t1sdS3JtcIyXtoFuClpuZ4BAzfNzbt4lQWa4waySBEWoHx+3oo+/hDmwQlhO16tR5oQwTi9/F
	ScZvWOf67FQwGOo5e9SOQ4Exdrf4CINTmSC8WNfsTNJya056ZtLXyOUJYsp/23JCKZwV3Te3cPz
	BaYUmpVyqjH9hRV6KYfjtENe5L1/8v9SAk/RNTMHASaQ7LlugONcxtWBdOp07VHH0uAiuVgO/np
	B3SexVd8
X-Received: by 2002:a05:6512:3044:b0:5a1:1899:a0cb with SMTP id
 2adb3069b0e04-5a29b9a1efbmr55664e87.34.1774370018671; Tue, 24 Mar 2026
 09:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com> <20260323235817.1960573-7-dmatlack@google.com>
 <0d2eedec-01c1-41c9-bc74-0133ae6ebb04@intel.com>
In-Reply-To: <0d2eedec-01c1-41c9-bc74-0133ae6ebb04@intel.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Mar 2026 09:33:10 -0700
X-Gm-Features: AaiRm530aoKtDDdSXYb9CaNnVHDZa0HeKfsko4zWVykFU0w66CUzojlEOk9szPI
Message-ID: <CALzav=d65Z1Va14rmoRcx5WrK1GfRvuHmrqK16wJJeTiq28eCA@mail.gmail.com>
Subject: Re: [PATCH v3 06/24] vfio/pci: Register a file handler with Live
 Update Orchestrator
To: Yi Liu <yi.l.liu@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Li RongQing <lirongqing@baidu.com>, 
	Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 6:00=E2=80=AFAM Yi Liu <yi.l.liu@intel.com> wrote:
> On 3/24/26 07:57, David Matlack wrote:

> > --- a/drivers/vfio/pci/vfio_pci.c
> > +++ b/drivers/vfio/pci/vfio_pci.c
> > @@ -170,6 +170,7 @@ static int vfio_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
> >       ret =3D vfio_pci_core_register_device(vdev);
> >       if (ret)
> >               goto out_put_vdev;
> > +
>
> a meaningless line here.

Will fix in v4, thanks.

> > --- /dev/null
> > +++ b/include/linux/kho/abi/vfio_pci.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +/*
> > + * Copyright (c) 2025, Google LLC.
>
> would be nice to update 2025 to 2026 now. :)

Oops, missed this one, thanks. Will fix in v4.
