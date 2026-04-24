Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74293DC4C1
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777041339; cv=pass; b=QrS4SzWVBXZtRvgbjwJkZQOaoo19RCeO+keZN109DXOQePSiXaT0gDBIYPErOsVfV6/6sfNty+qOYLIjdEDLWSMOXUe5Zd97z/IwlOCSGWAZJi7/XoV6a6LJrvdG/7CkjCOyr1wPdGOzG4uWGF4eRKDP8XXeUtaUDnopQ+iSJYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777041339; c=relaxed/simple;
	bh=p9jt1gHiba+dFBOeRmZKFoj/PrXR4D3UohMC2L6rPSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzQoI9fZASr9IZNuLYXlL60HJj8D4oKnSHwQxXImn1dwNGwvjABpAYPy5+I6DGE+QWpr28T4oNXLQzG2Uofuokr1i2uP6Cjyfokj9iIi86iQBoL0Mffjxol3anzrrvNJ78DMvq27ivYQ5UNQshAIrF0unztONCbGtq/3WaS7/IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CG47VSy+; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG47VSy+"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba8472c1613so1011376166b.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 07:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777041336; cv=none;
        d=google.com; s=arc-20240605;
        b=LIinzblWxXKd6+ejj915E1q18+I2y67KzjcjfjVFkjuPgzd3qkreLvmAmFU3/5EZVV
         myS25FWzEgwLxUu2EfkrCe0kA9IdwvmJp3CXgn6JWIKe+bql1v7gaiWIYsMe/CRedIo3
         0x4BhMI5xRrVsztL8dYdhybUFVxV4va+xd94m3YJ21tE1dQ6P/5o3DZn6YkeI/IQA5SB
         D2ug6VeJeI+K3c8fMPtOePx2vzwboOygpEGiHvZwt9A5CntiCgkH2eNLJM+vip5zxk4o
         C8TFhWmk3rxi4dJOabQDqeDyysiPNkaRTj7nbu6USMRDdn2txVGxFbzTit8Ymz82gRUQ
         CYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wytk7xcJQB1xNQvFPDmiI04wJ1luZnUZ5xfDJ7i2YWg=;
        fh=TqA4pe9495As2Dg+e8L+YCif7wHQvDTVg2tVHZScdnQ=;
        b=DQvHYyNrzKH4GFpZR/F/CpjpwfQ9D3YipYwIvMlF9AtcPN9yE18Qt1X8rCpCp3bibk
         EkOgDkvfEgH5Sjtejv65h/UUR08CA2xPB0cKuBfso5REaK2ob0JBMBxrea0PaP0UNcdS
         NxcAnvJ/IDs28svr2oVCKcaiyw8A7LLTM/b3hL6g0JVnPHr551PAFeyFVA5MWLXOEMN+
         MrUeox6nBzUqCFscSzJLFSMsrxk8JxPosj+Oj32f3+rJNJdSNodsRg2afd1S/ClNeTRH
         Thl4F1Cr98LaJzsUMmUBiribnZYlAkvsRdPLToh4TeHbAPYmIZS40InRoUNQZV6n5plC
         e+TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777041336; x=1777646136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wytk7xcJQB1xNQvFPDmiI04wJ1luZnUZ5xfDJ7i2YWg=;
        b=CG47VSy+zOLdWI83PngziBgYIMIxdBsxYBEhf9wVb6IlTbadR3sgMoJLLOAP0P+Ekj
         o9xF05II94+16RyKjQJJM19hCib6bmSSmcWPol7uFjuKXRX2zhmqtfQVrJxqoq74Km0f
         apDMbRbr4g7F9xsFG6PUAQkFjjLmD513Z8vSBZrsteix3q9Bgmx4ZNM8/Qfbu/rhGCOm
         ORsqrVeGnRuSLTj1vu0r+bk3/9PGWnr9vJyrgjxem/5u8WDQuqhKATbtmBvpQXwLj30M
         nz8bkepCjFYiPV0qCfCRlGvexr46XSw597ZWK6e6tJ1tF0tibJHIzfH+Nu0mH5qvWtlI
         If1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777041336; x=1777646136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wytk7xcJQB1xNQvFPDmiI04wJ1luZnUZ5xfDJ7i2YWg=;
        b=KQ4T0oFS6x6/vYseAVVwcQ7CiE6KwFDUH+EMf9GocpRx9jD0bKfM0M1VotkVO/nZ/L
         jAOmq4H5o1gsuTMFjzVU9wSXoTzjSK2YQJqF0e+IXIandgBjIxziwbpuu5cpI993o+gh
         l6lQFotLZQkX+gO1jy2iUhqCOf2L3gXw9X2nYmWtHLb58up75ZSFh1cOInhAHdgmEXup
         MDErYqAhPcsnsJiU2mvgkAsT5EYq2yWLW4iu847faJPlVGSQ/AmeeMgOQNYm5SiPpEkj
         YoAIrMV3yMinxG3VQWMRsAm5kJZO4+zXTH0+dH3jGAFe6V9b33bglaycGamIgReO1V80
         1xRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RROe68UeafCTci2VIqxO0AWwpO/iJRsY/fzp/1Mcqj8w6sYa8PQKqwaMPeniIUjx5woggrKxV2Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUDfvm9uy+HFzJQEES6G02LtG89g1yeBLB6qBpe+L5P3QoLTZP
	aEivCDDOZ0W6SIgWNR+wM1CEf8nYy1lHinZ7UDs/9b52fQuuSqnraB4oGt+CSylGSvOl/+65Oly
	rYWYeyMHIDZwkojrQfTkLHQShlY5hNVU=
X-Gm-Gg: AeBDieutizrA8vWLuY22wStBz9bveBx533JIW0xfMzgjksrSt22xFAxLLxHCSIrLQm7
	3alXD6jCMCSw/YIu79BkRgxVegoASLZJAx6TlTqL64rBXIacybHXGfAEwLD/gx0IU73hwZpEmfr
	Fp86fOW92lFgSCQ4qkrgvmmMLqMS+a2wGY52jQk+y3XLwpBRBew9hrhPDWKWmm/bJpVjYNQnqDa
	eauAwrH4uDZuwQvGSyOq7h2vTV2RsjE9jEZRvgR9+vtnHYzmJ4AmBCsFjQ5szSIZRri7Itrpt6p
	kWPVsw/n5Nc+9r60eYasGL80pWe3wNXsYFY3hrwc7py7wXAcM6NB
X-Received: by 2002:a17:907:d93:b0:bae:58eb:674c with SMTP id
 a640c23a62f3a-bae58eb6a09mr81309766b.24.1777041335826; Fri, 24 Apr 2026
 07:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net> <20260414185740.GA604658@frogsfrogsfrogs>
 <CAJnrk1ZgcMuwfMpT1fXvUwBBiq9eWFHWVeOFQFFKiamGGe1RJg@mail.gmail.com>
 <ad7Tps4tkNbndd9Z@groves.net> <CAJnrk1ZWVsKW2dhAWdBkCQskoTE+hmOhPFDhyz4EtExn=GdXGA@mail.gmail.com>
 <aeFDCeqZDPI3rm3s@gourry-fedora-PF4VCD3F> <CAJnrk1ad6t6CJV+xnXwhoNHrHYA3htuaVdDq47FeT60cPBzj7g@mail.gmail.com>
 <aeHXQ2EW2ivlLb_N@gourry-fedora-PF4VCD3F> <CAOQ4uxhXTTyySG3tXnqNnP0edbbwUxfeeC7=CypDSyw_Mod48A@mail.gmail.com>
 <aetxDlr0e9ILFIcg@infradead.org>
In-Reply-To: <aetxDlr0e9ILFIcg@infradead.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 24 Apr 2026 16:35:23 +0200
X-Gm-Features: AQROBzDRfaDvwqj3ChfxGHta3IykNz6mtcAvKLit3KlwoyD0SfB9SEJdl9WFDYQ
Message-ID: <CAOQ4uxi2sb4rCR9_xTD3FFEwiPXxDG-sYzvAWqcjMQi1+Om+gQ@mail.gmail.com>
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
To: Christoph Hellwig <hch@infradead.org>
Cc: Gregory Price <gourry@gourry.net>, Joanne Koong <joannelkoong@gmail.com>, 
	John Groves <John@groves.net>, "Darrick J. Wong" <djwong@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Bernd Schubert <bernd@bsbernd.com>, John Groves <john@jagalactic.com>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>, "venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, djbw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 3:33=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Apr 17, 2026 at 11:06:58AM +0200, Amir Goldstein wrote:
> > If this logic was to be placed in fs/iomap/ as Christoph suggested,
> > I think the rest of the UAPI issues could be sorted out.
>
> For that you don't need it in iomap, it could stay in fuse an be a
> generic striping API.  Although IMHO doing it in iomap would be a
> lot cleaner and more efficient as well.
>
> > In any case, considering the sheer amount of discussion on this thread
> > I have scheduled a cross-track FS+MM+IO for Famfs and DAX iomap.
> >
> > I wasn't going to include Storage people at first, but since Christoph
> > mentioned that stride/offset iomap could be useful for block iomap,
> > I included them as well.
>
> There is no overlap with storage.  Any use of this would have to be
> file system level striping, not stackable block driver level striping.
> And keeping the rooms smaller is a win on it's own - anyone interested
> can join anyway.
>

OK. Changed to FS+MM.

Thanks,
Amir.
