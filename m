Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8053093D8
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718925; cv=pass; b=HfroT8lwfHM97Iv3ME3iMJIm0HV2Y/RXtreVBrRNXlOD/+or7EFzq6LXy7B20gbfBXrNxHVhu5TiTAZTWpiXKx0PxYTKZuswil7cCb7DjL1SHxwOo1aDOvbJ5cQHPyVc16/DSRfRZrW5AaYEgNeJkjxYnvPt5WjlTtDOi3dL0zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718925; c=relaxed/simple;
	bh=WMHI6RHUC26ebl9/TVkwR2rJeC5kBjFPfSnTY/Oar1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTD5Mus+yk5kWz96nN+BWBbTyXx2kmXccwwDQ57qwn08sZp4FoGcln94XlHH2ipY1j5xJJ5S2ZFMuLwNA26B5heorq8F44Q1j2qZE4dDWdxOhqVm9RyglOgh4JiqlDLH8iDCzw+/+9fZ3iTLIaCr7vvGuUKexJdHWG+Zzhfr8yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cyh2ZdDD; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cyh2ZdDD"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-661169cd6d8so3742a12.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 20:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773718922; cv=none;
        d=google.com; s=arc-20240605;
        b=X8bpk5M7Ryenjs6o+nH3ZBBOEBiSuz6npPAD+gey0xaYIgexQ5aGklLQo4UyrsJps4
         6ZCI58/wEx7b4rNU0I9tRDgMD06XlDKVx6e8+vFqA4czQ3wQ5oBqoy+qmknm8QqFu09t
         AbU+hA46U9hFmKBUP13L0961dGmSDm/jIM5kZDtwkniqEy3Jdvh8MIhziO4l0Z/XMZKt
         Je51rsfKqYZq/nBtBJP4UWMEpQDhVw29uMu5MqOWuKpvNcV/ArxKzqyEXQ7Rsbkco82e
         w98rCvlCInxQLX653MxDbDUBBfKEIvskbctWB4RH/eePRQoU2M7/G1RmNy3UeYE+pDQT
         Q2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        fh=k0IbHf7iAB9h3elcrGe0nWmUOUYEfRS22n5hqR+05S0=;
        b=Z9idg8XFrbTvC3yR2KsgR4vl9pO/rq0Xev+yUPtMnm9yJj59/Rb2ndzbtYPG7kPMgT
         p0cmRU3PhbPtZWL2S7uOvQnMXsCKx+lChekP+VkKlFETe3swgoQNegkCFNHNT8lEm2GZ
         KSlOdbeJdBs1TTAYZaKfJa744IdJKRZZTIzchK/lEm1LZDdaQlKzQ4JIOYNZYy4XV1mn
         /SLs66l6s1kKeLDQxR7Q4JJwDkWbQhQA25iPtZgd6jFSLEHmUl+zhES1ZPKoQOnJqe5c
         IpTIcNxCdH5nyz2rWt5yyKtAa6wDXUu5VrNgsdJG/KZ8Wrls0EX0G1+z7qDGq+42by5T
         t4jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773718922; x=1774323722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        b=cyh2ZdDD25f0Dcfzqn0/fTS1Bga/5Iu+bb9UdhDFPQNIA51BZAHkfSliATWdhbLUcl
         sOHWrtsy2Cd9yl38Ox6btyowj5g2gHJJzLJfanN+CYAsvcO/BImZK3+yFQPksOjSst4R
         YxA2YDu31NoFKwMCouBzhi/5/N2cQnY2vq8vFHjQL9NAz2wwweLtbyQOhm+5PUrmrNSj
         BO3N70T5CON4JQc/JPoQpRwgCSEZzGNqswZuC7HmiGpZDUrc5OgCugAY8jwCrbtSx5KZ
         dD0f45YCU5fBS++odpfk/GilBzxm1tK6oo7rcHXQCq2IL1OYuGHmm9w1/6V7ar73F5yT
         DH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718922; x=1774323722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
        b=nT2aeLFdNnTbp4uNQeB9UCJI1XTodM8CEsvbnVTBid4HpcUzuMhowUhsZLzSxxhRQp
         opUe7+zTyMe6+DTGPUrkZszuKD2167Ore9DNTmPt28AzqdpqgQ3xG2HTQ90VyT61CjQa
         9ChDK/5B1iiq46nP01MeQL9Bvqc/VkdGS77y7T0lyypMwRyEoT5Qa5I7yFU33mSEnU7E
         1PUIhD97LmHunTkzhS9OYBXe8n71X4UUN9l3vngch6b1M41eja5Wag3b03n4cQ23Q3i0
         Fp/uvrSrfgFerBL03Bzjx1xGF5KOlwA4iLa/RoQB0ehWeLfdhkgZTm7Ms34rwOXSg6Lj
         iTIg==
X-Forwarded-Encrypted: i=1; AJvYcCU/G23Ev6mP3S1Y5MPWv13rGc9jN8L3PzNSKvRNdsaA08ehOyBMlX/9prVQPnH9I9XyETpdU83f7JU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPshbMOQlSMNUwiz6UC6ajkBj6SKN+LZ2ldwJ3Ks392JzzGDzl
	Txxbz9ic9tFYkjA9XhGkT/Zaj++cBRY7DWriQZpmzvEz87T2exivOF8LXe1GxQDAF33C7Y6UU6R
	6UFO50t/f4RI7iGcCoNoDkavj0zCK7W7fqsZ4w96N
X-Gm-Gg: ATEYQzxzPTfuy6e4MIZn7HsK2rbecrMscPJrfNtrZHmGEe0F2KwxbPhTXM8JnP+escD
	dgdOBju1K7quKN5J61LI3SOj4anS9v+C5PrS1LZQjDoI7esy6yRXjjqYdCswzh0HiqzYuhjF12I
	AkfceolEm51khHXC4wglPxDhiXmH+Ki31QrcKV6BM66E1oonLe313nN7bo0nq1yEGIOEM32CR0m
	B9V2IvdbTnizVcG0H4eyOOamGpJ8uE93qxZf5g4iUzFgp2XyyyTn1+lBEjhBb3sj9uajSJlaOkM
	FlD4TQ==
X-Received: by 2002:a05:6402:5047:b0:667:926:56e with SMTP id
 4fb4d7f45d1cf-6671449f938mr28406a12.2.1773718921655; Mon, 16 Mar 2026
 20:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev> <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com> <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
In-Reply-To: <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 20:41:48 -0700
X-Gm-Features: AaiRm51L9yY6IK4TcJFLhN8NGwQS7Z64sx0O9EJzSXirWOtaRRhN6Ww7XVogluY
Message-ID: <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
Subject: Re: [PATCH 05/15] fs: afs: correctly drop reference count on mapping failure
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 7:29=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> On Sun, Mar 15, 2026 at 07:32:54PM -0700, Suren Baghdasaryan wrote:
> > On Fri, Mar 13, 2026 at 5:00=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@k=
ernel.org> wrote:
> > >
> > > On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> > > > On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@=
kernel.org> wrote:
> > > >
> > > > > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap()=
 users to
> > > > > .mmap_prepare()") updated AFS to use the mmap_prepare callback in=
 favour of
> > > > > the deprecated mmap callback.
> > > > >
> > > > > However, it did not account for the fact that mmap_prepare can fa=
il to map
> > > > > due to an out of memory error, and thus should not be incrementin=
g a
> > > > > reference count on mmap_prepare.
> >
> > This is a bit confusing. I see the current implementation does
> > afs_add_open_mmap() and then if generic_file_mmap_prepare() fails it
> > does afs_drop_open_mmap(), therefore refcounting seems to be balanced.
> > Is there really a problem?
>
> Firstly, mmap_prepare is invoked before we try to merge, so the VMA could=
 in
> theory get merged and then the refcounting will be wrong.

I see now. Ok, makes sense.

>
> Secondly, mmap_prepare occurs at such at time where it is _possible_ that
> allocation failures as described below could happen.

Right, but in that case afs_file_mmap_prepare() would drop its
refcount and return an error, so refcounting is still good, no?

>
> I'll update the commit message to reflect the merge aspect actually.

Thanks!

>
> >
> > > > >
> > > > > With the newly added vm_ops->mapped callback available, we can si=
mply defer
> > > > > this operation to that callback which is only invoked once the ma=
pping is
> > > > > successfully in place (but not yet visible to userspace as the mm=
ap and VMA
> > > > > write locks are held).
> > > > >
> > > > > Therefore add afs_mapped() to implement this callback for AFS.
> > > > >
> > > > > In practice the mapping allocations are 'too small to fail' so th=
is is
> > > > > something that realistically should never happen in practice (or =
would do
> > > > > so in a case where the process is about to die anyway), but we sh=
ould still
> > > > > handle this.
> >
> > nit: I would drop the above paragraph. If it's impossible why are you
> > handling it? If it's unlikely, then handling it is even more
> > important.
>
> Sure I can drop it, but it's an ongoing thing with these small allocation=
s.
>
> I wish we could just move to a scenario where we can simpy assume allocat=
ions
> will always succeed :)

That would be really nice but unfortunately the world is not that
perfect. I just don't want to be chasing some rarely reproducible bug
because of the assumption that an allocation is too small to fail.

>
> Vlasta - thoughts?
>
> Cheers, Lorenzo
>
> >
> > > > >
> > > > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > > > ---
> > > > >  fs/afs/file.c | 20 ++++++++++++++++----
> > > > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > > > > index f609366fd2ac..69ef86f5e274 100644
> > > > > --- a/fs/afs/file.c
> > > > > +++ b/fs/afs/file.c
> > > > > @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file=
 *in, loff_t *ppos,
> > > > >  static void afs_vm_open(struct vm_area_struct *area);
> > > > >  static void afs_vm_close(struct vm_area_struct *area);
> > > > >  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t=
 start_pgoff, pgoff_t end_pgoff);
> > > > > +static int afs_mapped(unsigned long start, unsigned long end, pg=
off_t pgoff,
> > > > > +                 const struct file *file, void **vm_private_data=
);
> > > > >
> > > > >  const struct file_operations afs_file_operations =3D {
> > > > >     .open           =3D afs_open,
> > > > > @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_=
aops =3D {
> > > > >  };
> > > > >
> > > > >  static const struct vm_operations_struct afs_vm_ops =3D {
> > > > > +   .mapped         =3D afs_mapped,
> > > > >     .open           =3D afs_vm_open,
> > > > >     .close          =3D afs_vm_close,
> > > > >     .fault          =3D filemap_fault,
> > > > > @@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_=
area_desc *desc)
> > > > >     afs_add_open_mmap(vnode);
> > > >
> > > > Is the above afs_add_open_mmap an additional one, which could cause=
 a reference
> > > > leak? Does the above one need to be removed and only the one in afs=
_mapped()
> > > > needs to be kept?
> > >
> > > Ah yeah good spot, will fix thanks!
> > >
> > > >
> > > > >
> > > > >     ret =3D generic_file_mmap_prepare(desc);
> > > > > -   if (ret =3D=3D 0)
> > > > > -           desc->vm_ops =3D &afs_vm_ops;
> > > > > -   else
> > > > > -           afs_drop_open_mmap(vnode);
> > > > > +   if (ret)
> > > > > +           return ret;
> > > > > +
> > > > > +   desc->vm_ops =3D &afs_vm_ops;
> > > > >     return ret;
> > > > >  }
> > > > >
> > > > > +static int afs_mapped(unsigned long start, unsigned long end, pg=
off_t pgoff,
> > > > > +                 const struct file *file, void **vm_private_data=
)
> > > > > +{
> > > > > +   struct afs_vnode *vnode =3D AFS_FS_I(file_inode(file));
> > > > > +
> > > > > +   afs_add_open_mmap(vnode);
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > >  static void afs_vm_open(struct vm_area_struct *vma)
> > > > >  {
> > > > >     afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> > > > > --
> > > > > 2.53.0
> > > > >
> > > > >
> > >
> > > Cheers, Lorenzo
