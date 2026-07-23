Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0F3DCDB1
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791624; cv=pass; b=ph+w6QHoKBLnbL4h6zzeDlxTa4mb/IoUjpc64sRKcNyiOQfzBYfID4xtw6eHeSPr6vkGimCA69fapaeMPW2NZ9nSRyLKdTUAe8+p1n3RRiRKMgarT6Q5h1tToThjhrrsNhkeBtpHWidcgsDqfqFS92Zb78DkqRUCv65m473U70w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791624; c=relaxed/simple;
	bh=b//sUnMrNPrgR6EPqqnROk2FSBW3tccYwHVa9XOhJ0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bY7G7Mz8h4gOE3CK548+MrEaTPsX7P64D6tUJduB/grbZabMciXXqrmxTFtUwAcqycNSPK9LasHkut6rhRxqQe9kLkJUwsPKSLpOlTRRbn+TjbNc+lplAlTHWo+n4s7V467b1Kx41fzCxh7/ICgWMG6TAWiuDQnEkbvpmihCPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=X3o3WsSp; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="X3o3WsSp"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e5c92c389so25453285a.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 00:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784791621; cv=none;
        d=google.com; s=arc-20260327;
        b=C6CvB7NgFHmpgZo2CyMFt/Rr38m5pSDgcVMmNDbn9WrM0h9nohOy2Rofz7HbKrYahN
         uE1fb02YMswDHT3kkPQ+vezG8e0Hqocqf4I/ASTGTv0IkEjqqiLn6XkNympFideIxZqb
         z/SkeC9TUQnDZ0CnRjECtWieYvT1Lw4dBUsMs5AFlVVA+i7SJGwkb9cSo5754H2g3Kd8
         1i5XGHeMqMY1YixSUJbWQP2OWKjQmJRyz4UQEHJVSq+kdW5zki4ytAVy2vPDQr2Vu68O
         fvZRXKP4XioMfKG4KWYFU6D2IbSCy26HqUBgxdv8XdUmgcD087kMx+AYdzf0+m7s2A+s
         wdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fxFO3X4XqUIh2d5y311IhLxWE4w0WxZ2aZSjb8KpjAY=;
        fh=wh0BbTlXmesxF6I010fOBn8pTQOzQyvVlSTopb4yiv8=;
        b=QZ9vLU34Du9s6+4fbWaN7N2w+qtEnrQTjZTrcDCcNM7FwiAR3pviNQO45mlJls1VCd
         z4RHrGVQrGC4JcZGY48JiqlIwJkv6ViigxZI6m60/U6gf/CtbpDyvcjUeyHe6UYcRyAQ
         fQbHenooulGKIwzOa53kcbhmqb3+X9RBHetnEYc7+FcQ23Wyf86UKXNtw1CqdhhyVR6D
         r3+Ly6hXd8F5tFw2cHTNiag2BgGNrusZUOBZ3N1BVrp0V8cpiB9mB2nE+PAKEYO18fja
         ShM6dBBpsoGWyalR1ApZIxojYKuKSn4QRMlXEK/ia7V689CxncGrbyHjob2R9ktP/E+x
         nktw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784791621; x=1785396421; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxFO3X4XqUIh2d5y311IhLxWE4w0WxZ2aZSjb8KpjAY=;
        b=X3o3WsSpKFcJR3jXdh+qr8BcbBAOwlYAVRlHxhCZ01sHkIfq3AJr0YAc83uNiXkjKY
         zVgpRbm3dvkN3frVlZ4e76+0gnk7puwWRR2EfOGV3t+xTih2wu4V5cNRPxI7N4laKIcp
         KOAVBVldaXCi+DQXNk/98EwciE7qXlj8xHEQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784791621; x=1785396421;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fxFO3X4XqUIh2d5y311IhLxWE4w0WxZ2aZSjb8KpjAY=;
        b=VL5mw9D+IwsWCbZdOV6E7y6srStg6LeOiC7Dddo+pPFlfEE87nRqWk37IKf3Vvjsv2
         SVp+47j2SmjdvvqyP6UKKibt5bkLRyUELBSTJoMToGP4xJUjC24pk2LyULGW3ThubljJ
         aDbK7ofw3nWNgSzP0oMv/5Xjpnqa7AcvZDmrbgrKPxD3xd6MVug1M1jPj0Xch4VIahEo
         z+TjLv8ZZ1IYIwBAXtykM454AJUhWLsnQBsn6JctybXfovsjTo8VysMFo3EXkxylHz1Z
         2n8m1o/m3GEowimVqV8zFq3OkN035RBeV6KkNP5B0pFGHEh0aoSMo6j/e2lXevlnyKAz
         Szpw==
X-Forwarded-Encrypted: i=1; AHgh+RpBu2Ey1m2wggFCB0wDKqkoeeNEhxri71/e99X8PGUjwwUd+gsn1rcvWHIIzUOLZ6SYlk6sLFQV6Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdcdYIEfLNAp7HIjFWB7Kr0o7XaY4Lej/DOCMO0AXu+ula+IiR
	g/7uc2/auYoQaYlJ3N4el2CYityPYN45xDYoUmTU/T8lwJTmHW0TJynNtKWMg0TsOX9XOjNZ/2f
	GzaqLdzz3IqZ5kPg9DeP1pMG6RoOuc5Cacp4UJVRcvA==
X-Gm-Gg: AR+sD11XU3ad+CHlKI/r3SxnK7GJmgNrDrVNQyP71NoaUPzI3nrkFo0WDgP5cv9oaE0
	Tkf25bCjhqebH7IFhZ+HXngS8lLLp24kaG7knocCGPZ/ce+xojEJgXQAl57NfokHY58QYlx5eY7
	/IJKegT3MN2QZQRIz8k2Md94JwCVkiumOFetfURYyW4c/IFQ4kpUYd2kLOLFFTs5k15zUPKMwku
	v0SKqrRZ2zTm9uWFPnFnfmqSUk4nQDFLf+h5D8Hv62jJPXvV0YeIPjNX26FiCNu1eQRR5TVWEN7
	CazlL/xef5HAq0T8iw==
X-Received: by 2002:a05:620a:2548:b0:92e:bc28:5479 with SMTP id
 af79cd13be357-9310384ec50mr192569785a.2.1784791621432; Thu, 23 Jul 2026
 00:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
 <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com> <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com>
In-Reply-To: <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Jul 2026 09:26:50 +0200
X-Gm-Features: AUfX_mzfzrRwI4hZxEkdZS2OluMEiPX8JQa0b2ZxVMGEYubjhyQzQWfbCHdsQ4U
Message-ID: <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 16:43, Joanne Koong <joannelkoong@gmail.com> wrote:

> I had the same impression as Amir. The FUSE_DEV_IOC_STRIPE_OPEN patch
> [1] right now is only for the interleaved case to handle striping, but
> imo it seems a lot cleaner to make FUSE_DEV_IOC_STRIPE_OPEN a generic
> interface for handling any backing layout that corresponds to a
> backing id, and having the simple extent case go through this same
> infrastructure / path. Especially since John's future patches for
> adding the interleaving will go through the ioctl, it seems nicer
> server-side as well for famfs to have one consolidated path instead of
> needing two totally different ones.

That's a valid point, but I still feel that those things are different.

Striping:
  - always static
  - size limited by the number of devices

Extent map:
  - may be static (famfs) or dynamic (general block fs)
  - size is unlimited

Doing extent maps with an ioctl makes it clunky in the dynamic/unlimited case.

> If not the ioctl, what did you have in mind for a generic interface? I
> think anything else would have to keep GET_FMAP, but maybe I'm wrong
> here.

Good question.  A NOTIFY_EXTENT_MAP (similar to Darrick's
FUSE_NOTIFY_IOMAP_UPSERT, but multiple extents) would work, I think.

Maybe the striping setup can also be done with a notification.  The
original reason for doing  FUSE_DEV_IOC_BACKING_OPEN() out of band was
to prevent security issues with writing an fd with plain write()
syscalls.  This issue does not affect io-uring, which does not use
write and so the ioctl can be completely eliminated.  But that's
another story..

Thanks,
Miklos
