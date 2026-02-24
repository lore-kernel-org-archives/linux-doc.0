Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F833A9DA6
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954649; cv=pass; b=sIKC8EY6g8EdIfnrRQ4e3d0UHmR9Lhq0ISbs1BlgTp4KfnrW3EkDlDvSQxVbvMlle0QMbi0nIgVyGhePUAsNN6zP100WFfltBF39Sfxxm7n6UP0ZRf7vnOb4mz30KXB8bVBTq64H3cG2LEfBwKagmMpUX9Ehn2Q1yBPLlLc/N/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954649; c=relaxed/simple;
	bh=NzE6Dg5T/WZzjhrxSxryu35IDaiffOedvMQkCnbUBbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ll6AuRxAOyFH4tZEj4LDltYyARGbUYNMweHVeV060pyjknHdHaMCZrXu4HSXErPTgBxPZU/LtQawnwA4P30aBoOqR0c/ppoIV1vi4TFnqBCjPc6aqsmo3G+RNaRs/9yAz50BTNBD/gy+G0CjpMzeHD7SdCnh/YYRxcz0m9B7avw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O+yyE1qx; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O+yyE1qx"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56641200d6eso6478197e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 09:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771954647; cv=none;
        d=google.com; s=arc-20240605;
        b=WS0u4az69IeU2U2n2vOfaaN9FED4GrxF/ePMGi9q2RV7jpmaSYLYMCEo0gK5JSRhDb
         CfB0fUcNGHR1WbjJfnb5yLLhqH8Mj0rKxV2N/qPaaxnrmY5LD+Q93e+8svtbRxubnLSv
         I0Vaqfvj0B5j1uNyRP3wMvfZJYnTWdzcu6DLUIMWFBj1wAQ+BdKe09AAkqvJsszMEXZ1
         fDrNXLKxBE66dQfPDC0IFdQpqwmSNTWvdowg0fCIutfUhINFJ+P2qNrFGGrI/odcYo2J
         RXz1Q2I2qS+01uh+ElCMefkKn4H2g5wroFyRaROaL81cmvUhRnKX53D2v6rEX48vOc1E
         SpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WVyG+GjslObEPoiorlcEtEb0lbImQuwl2+xBSlYjPvU=;
        fh=RgUCMQtNBhAD2SD49Ffgc7CaP9ngJcSZtpqdrmMLiJE=;
        b=lFYjrICYnxklsGKGffwz40cYvdEGKI0HLNtFR9ixLmQ4py3O/tfS9q66uHOapnvi5U
         K6CmJxsxMrgTacfUXr09RP5Ftm96iR0gcGHlEQcWX67wWcBs5K6B9IFthOsgpHwE/J0+
         BeAV8xXvKnXYhLpizWj/wCc9x1hZhhyUVY9Ggo2dX5ZK+u9YGzfYt0EzjOkIPe3O3xJK
         qTJu8MN7OZB4apY8ti8b07rpY4NdV7vt2ab+elNfDTkLvDrFWQfp61OP2d1FZLmVRrbb
         vfOGvkXW43G4MKtUGuz2fjo4Rrm2kTENwwGAixXxEdKnAhwx1XRs7YVWXjDuX0qWQXIZ
         7Y3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771954647; x=1772559447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVyG+GjslObEPoiorlcEtEb0lbImQuwl2+xBSlYjPvU=;
        b=O+yyE1qxUOAg6dKVlAaP7DqeAKGiTg2vj+80mJTczPFmVifUrvXeiRAUTHwcY494hs
         nYb1zcEenz5Pr9R+S5wX2fzs6WzUVhJq3NHDLMU1dUIaQLuUMHJZppn+L6jA2ywQRraX
         e0mJSaajncxDDeSLw5ZGMRSxhBxvuucjh4gIMTqlxMEn9XOaUjH+JZpANuq66YMr/C77
         cVNZr4KOfDMzrm6CHNWYiua1MCYdmhCYINFR4ZAoUJe0W+1ywY/RGZKP0jA5xVOuFSPN
         CedJgKBY/KmNHzfLvo3a+Lt7jvxYnRPAZFJmKLozY4jiCcQo3hZpYtW8JIF7cczZ3JQp
         WWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954647; x=1772559447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WVyG+GjslObEPoiorlcEtEb0lbImQuwl2+xBSlYjPvU=;
        b=hxIvvTXTlJnngK+UgiSHeEBrdHi0y4i3XWvxwDAP66EIg1IapNG0uoSgs5d4HOniaV
         yNms9UZy3ATCvJ+pj7USCxPE6LpRptnYGjsq+w5AVNjNq2SSEiiolMAxLFRK4m5vQL8y
         J0vywevqFOaPuvZJV1ihb9jn5F0XODbiOkNMRSphJoCvdHVwKaVltyXZqye/JsY2Rjb0
         zFb+jyXmxcprhzLJiG+2Ic4rQ3wa9bGG3+r+c66f/w2tgjdj0etRW6brl2co8g8bU7ZH
         LTPJMZfbVHOk0hsEIzHSwGln4KrbU820ITRwhh7Ojb7aE7fnmS5bkRzNgSiV8VHYc11r
         b5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRrzcxti/g9m9hMo848IhkReoycz2krzm+V36L2wILp6AtIpBqt10NXz5qCLqdJbxTy3c4hcp8rBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZytlr6Fc0I1z83toP1PFySgluVEZeK1q8He8sKhVRkducNN03
	RBvF8odLIQ9Y7k+repPJx4HHCawhJIllB0gl/kQO1s8W9Vp5hk5YidN1QLwWm2OOT3PM33BWutT
	scOcRfR2CjGGeOINVOzmmcM/10QuxqT+gfccJJ0Qn
X-Gm-Gg: ATEYQzz4C5vQdosMW0jtwENv3BF5FOKTbVppv67vul+2DcNOiZW+dCjoT7v7vLn7o0J
	/eAnD2Pho6jr6V5hECIellgVRJ7aPwxDu7OIWriHiHAflDTOjWWMfTV7yMwZnqMzg4sRmoXpwLV
	PeyPRNmcMM8wEbLs9Vv8aLxvTF4bQG0R4cVokqP6wv/QyAM2RJ8Ird1zneBstW2leT/HqNTe6Wd
	s2gdXyQeX5p72H8sxri7In3SEVasPW3G6I/yHoeepUy3YVMcNl5/SX7Hjupbpu4AW5nLnr1MO0U
	vrf1uzc=
X-Received: by 2002:a05:6102:e11:b0:5f5:3835:4796 with SMTP id
 ada2fe7eead31-5feb2eebe4fmr7234443137.15.1771954646379; Tue, 24 Feb 2026
 09:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-4-dmatlack@google.com>
 <aZ1xAyN0vgLWIi5y@google.com>
In-Reply-To: <aZ1xAyN0vgLWIi5y@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Feb 2026 09:36:50 -0800
X-Gm-Features: AaiRm51zYRUGqNlquBQBjZ_Ao68Y3fgUdHKViouV8m9qg-AcIptaKIFOE6taQzc
Message-ID: <CALzav=cMsDyUrOPgkr5ouROPmsEAN2icsL266M4FxY3P6BNd1w@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] PCI: Inherit bus numbers from previous kernel
 during Live Update
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

On Tue, Feb 24, 2026 at 1:36=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
> On Thu, Jan 29, 2026 at 09:24:50PM +0000, David Matlack wrote:

> > +     if (pci_liveupdate_incoming_nr_devices())
> > +             return false;
>
> Following the comment on Patch 2 regarding propagating errors, the check
> if (pci_liveupdate_incoming_nr_devices()) should be made explicit to
> distinguish between "Preservation Active" and "Retrieval Failed".

As mentioned in the previous patch, the errors mean "no incoming
devices" rather than "retrieval failed".

> >                               while (parent->parent) {
> > -                                     if ((!pcibios_assign_all_busses()=
) &&
> > +                                     if (!assign_all_busses &&
> >                                           (parent->busn_res.end > max) =
&&
> >                                           (parent->busn_res.end <=3D ma=
x+i)) {
> >                                               j =3D 1;
>
> Looks like we over-ride the pci=3Dassign-busses boot param here.
> We should document how this change affects the pci=3Dassign-busses kernel
> command line. If both are present, the inheritance required by LUO would
> likely take precedence to prevent DMA corruption, but a doc update & a
> warning to the user would be nice.

Good call, I'll add a log message and update kernel-parameters.txt in v3.
