Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F99D387364
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063703; cv=pass; b=mbWRlLTpmnR/QaXC95q//E89qYFITwJx+TkZAgXMpUycz0b7xozsW/vYB78HyQrx+yU5VhdQ6uD8GAldadCGn9fz7T78AvNP46DtuZkr0HLQ+g9A16Mb+iVCd8Di5qYeXw72MAAxURgffFm/ciWlsaOiP5f7+Z0sq5r5qKOqRRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063703; c=relaxed/simple;
	bh=cHKbWLM0axLoVNaLpqGFg3zanhbcwqXxf0qoCpGOoI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS7UXj1JkYyR+fHZjw4XLgBtOnVaSZzdfMiKG20X7rauXeHalpqvLA+4fsqjdP3rWudmQz476DxiSlDVEqHBN4pyKac8IH5+KUNXzdwYqTE2NCZzzskQMDRbILI4QX+omiBksznqFFfBKqHcMF6CaoFotHlF2GViX8OR8fMiLE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=woN/zIFu; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="woN/zIFu"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5069a785ed2so126051cf.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 15:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772063700; cv=none;
        d=google.com; s=arc-20240605;
        b=XCCfnAh+W12HLHfK5mtOGzp22jFZjEC90kIA24iKv1tHBb/I+YVDbaUTwfCr3CsDZd
         CVVOSVrnClHdcKAW9imnB626X9MNfy0fz6KzVV8PJfWZFgeJ4AX5dMlKPg52f4fynt4Z
         7dRBSpxrUvPKFKoGnq/MjXv5CJDG7ZdRTOug3dsCNfYOm50H5u431PXCuG3gaKZCZtev
         pZrZx/7oHQ5kvirRKD16TCKLtm17zJXqe7f+YJdBB7gFx/k2Sra5grMmRFbYc2pt5Q/L
         gTNEk+D95yCkOPbgWxQXZMEuI7SXN6gTZSsr0WktTYIHrm6hIJiOjkzDWXjlGqLwRVsd
         l/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/+d/kouLLf9iKHdyjkzWOU+gVjFz9R5tJbv1KqoUtQs=;
        fh=8HjxVjx6Tdk2iTtlVfWKyq48Z20VjShhn+h8KCCn4P0=;
        b=EGI8UggPFq5IUdN7SPJ/OH8LgY7CLP59lDXZYKRcf+vyTvRSmnqZWC30DAO+3AXIMw
         BORuSmAA6U3p9x4IykKcl3iTImswokPcb9tm0PkTVCN+/+jIvsu0XXYEgHeb+DWRf95E
         OehnGSwRzN9FQs8hgIFdhWSzSQG2HPhIygwWf7rWNcszuGXwOMlrIYHhEbTdDhIehwiP
         kGj4I89E/Dhxfy3WXbOPB6GnUbFCmy0tD2cLhkmi9z0vQqhvf5ZnjU3o8mg9y71xnchl
         HM1lHVsEJEV1SGtNEqj/gAvljIBZdmB3eSq0qSKCTbhyGbZiSP2A/2v0wBTHgrDEd1FW
         /x6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772063700; x=1772668500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+d/kouLLf9iKHdyjkzWOU+gVjFz9R5tJbv1KqoUtQs=;
        b=woN/zIFu6BKihA15yC78RP29swvjyWELyfFC7nCXXjDp0MOYz9MeqkJAX7NZQgR8lr
         Q6jkd7crlbvBi6GHsRTr3yoQSm2ujmV+ZhBoLcjyGSGsmTM8gKVN0R0f+0jkKtwzIOLw
         UDkRV/IyBCd/7Oe4Jdj8DarsdRyaf4TOwiNfQOPJ/sUOz2m6p/8DAv8R/qEVBBxyrHDb
         8Hmz6XcJNmZud90aKSuqwDfE9JJQvgnrsw3+1maq7lPpkCXy2pgyH6X3XtN2pdlvbJ6e
         uG1jocZ16krKPFLckMlHcZ6Xv0qQ+NW3yR0d3FSAPtIZApnFPXupXpYF3IOLnBNdAJf3
         vIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772063700; x=1772668500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/+d/kouLLf9iKHdyjkzWOU+gVjFz9R5tJbv1KqoUtQs=;
        b=DH6WXNSToL8gU7cEYyFtYtidnAPu/kFtujcUPF80SH7fG8WZpKeZg02aI6AAXOc3y5
         sE0RQmR7lH+53ZYpNShF5Xu5y1ZaXs0+0xwZl1vLDxXCmkNhPI9qW3ej7goQL4+nS15J
         i3fT4tZJyzDyCnIUd7Jr9AtHJqG1pYpWJny1UGIQ0Q5cW+AWA5VH9V0Ha2nOi+NnCOjF
         H6C1WAxlhrDlm/rYkdtJAq6IKgJ7SR+zBV3Vqn7NDWyqVcK1PaFnrM/nR4EPqCE0+8xg
         8vAyJ2/PLHW6IOXM+WOhTdFXlQf1UHSBRzRbQtSInIrWgpXmUjlihzDWmhX09Ct0s7xU
         OveQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo34hxqILlLuQDdyNMT+pvRYtcJNDr3cfyBQ4ceJmGjj0e4Ix43XXo/ICB0hXznV7H7jbmLkHmN7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGmFs/zux/iC7M/E+yNMwm1buqbqK9u3kal8lvLNNjW8dDdufI
	qb2KLoiL8Hr5J+6rm/ALj9xbRpCUMYlDWPqQ+eprhnkGdlTjJo58a5SoQ/Y26csCvlTrzK5a0c8
	2o7/npqXchYdW8syJDwX6Xy6l1d2yss33T2ui56vx
X-Gm-Gg: ATEYQzzvmi7iFynJ05uIK18Za+4CTUt3Kk7A18wx9olsj7+xU2e82s38kQA2g+bKvZ8
	tralUie3f2zCYTrctpBRjbZVE8YwKCJc319UX1oPyhFjQTzfZCno/O2dgcnW7OAPMJGA9Zl4NLf
	X/HPXJQhXuBNNCUiF0DTQ4uJwOl4XMzq/yee6phxLtHcvSFE0OqxASArt95CoSm9pWeQLpaTLJb
	rk2cjdEism40ViSKAuyT6uhK5ocpFmnrhSbLaRZb5ylxheqIaO5HYI7zaQYdiuZ4c6hLog+9PfL
	1H2tOSj9JPrgBdUn+QbMTTAc+1dp2gfuK8r9GJy34w==
X-Received: by 2002:a05:622a:4c:b0:4ff:cb25:998b with SMTP id
 d75a77b69052e-507441e2d95mr4895751cf.12.1772063699005; Wed, 25 Feb 2026
 15:54:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-5-dmatlack@google.com>
 <20260225143328.35be89f6@shazbot.org> <aZ-CnywNgMnr6f1k@google.com>
In-Reply-To: <aZ-CnywNgMnr6f1k@google.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Wed, 25 Feb 2026 15:54:47 -0800
X-Gm-Features: AaiRm51g4hX409PKMap5bNDNnG0XAykqCRndojsQbHHI9mzip6hP9-Z2S9ohyZI
Message-ID: <CAAywjhR4Azqx8hXRap0eLUrwetYRiX8TALEM=b+1BorPc3eJdQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] vfio/pci: Register a file handler with Live
 Update Orchestrator
To: David Matlack <dmatlack@google.com>
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
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 3:15=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-02-25 02:33 PM, Alex Williamson wrote:
> > On Thu, 29 Jan 2026 21:24:51 +0000
> > David Matlack <dmatlack@google.com> wrote:
>
> > > +int __init vfio_pci_liveupdate_init(void)
> > > +{
> > > +   if (!liveupdate_enabled())
> > > +           return 0;
> > > +
> > > +   return liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> > > +}
> >
> > liveupdate_register_file_handler() "pins" vfio-pci with a
> > try_module_get().  Since this is done in our module_init function and
> > unregister occurs in our module_exit function, rather than relative
> > to any actual device binding or usage, this means vfio-pci CANNOT be
> > unloaded.  That seems bad.  Thanks,
>
> Good point. So a better approach that would allow vfio-pci to be
> unloaded would be to register the file handler when the number of
> devices bound to vfio-pci goes from 0->1 and then unregister on 1->0.

Yeah maybe a kref that gets inc/dec in probe/remove. I have a similar
problem with iommufd preservation, but I think I can handle it based
on the number of iommufd open.

I am wondering whether this file handler registration kref stuff can
be moved into LUO by adding it to LUO file_handler and the modules
only call get/put?
