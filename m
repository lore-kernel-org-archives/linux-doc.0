Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978F1146A66
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 02:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628388; cv=pass; b=AKzcsPjwVleAHLCuG0WB2kxjW+DgFYSOQZfvbwlX44tSpV+XWpyphWtSStfZqo3sLJ8QDCRbwWlxoi4vMtiBv5BIiTziUpQWdfzCpdx2OytE65gfeDwyPkPjFAEIWsLNjY8wTwsq8RN2/3jeaTADsNdiF9eEHhZ1uXqmVi3VLxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628388; c=relaxed/simple;
	bh=P8upWlYrnSKRURZkcwVOV+h6+eQ68h1jm6EnGvbVBq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWeBMN0bqY5AOvK2JaUy4FvL1WAM3qgJLXm3OHyZ6h524Mdi6jCDnqB7XbspD+GVsZnYGRvRKLzqPAs6HKAaSW1L4WFr4qij3IY2nBty2ZT5ANmBL6ZDjWS1mBuLU4YOOS4eFMWmVdPbcZXI3SAcKCzbnn22zNkilOAjx9g4bf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Os005hha; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Os005hha"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-509062d829dso709051cf.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 19:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773628385; cv=none;
        d=google.com; s=arc-20240605;
        b=bUfJruCPVhPzUdUw0SuJ/kf5zS6EyS59TnGDP38gerpXELr6F1iYpdp+VMtr5q27RL
         3WZ3En2K0dZarByazkBBr+kYVCm1u+hznkatFili09wUNWUxTGV66a/twRQyGLerfVnv
         Eon4DYn7NgGrFQuKVulRmZfvlTbXozjvR7bhFwcCInwvuuAekxqGtPfVTXcxQpAMP8g4
         DDs5DcM3vlyRAij3HNnOwFTNezR5wnMlgIuCv9t0pjXSciUU2nja/ur3kmUnS7tuXxT1
         baLmKOI5rfs/dknTJM7WgnK0V47U7CZBDP3hqBGWfoWosaANiNcNQsDyoV8+UACn/9bA
         MdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        fh=2l9OEamLzFaEG2IyUr6zccKdOx1nBhGhE1aylK3WE2I=;
        b=YJywy77CAd/C1uYbprDTgbsJiy/0QhufoQN7eHpIaQmLa0ptcFlZ0nGBl+mri8JRxg
         EL5KBmQiL9nlCHjIyu15XoBo+IaSTA8mj8OGakD4AMAa20UW+AyC2pyfdsuRceLxOHGk
         rO1IFIRDtJ0GQrPLP2NJKnEH7viTR9R5ftW5Bx9HTnO2J69YO6RpdggBJeuaM7mvgBPI
         SzXxlorwG9E4vvV3Ti4PiD2OcbqcjQErlgjvT+zTK5wK2u2iM5meH4P68mwqjVx1d8ra
         pD3h9t4f/fPS4Ew6VhHJ67Hd5nP/k4BHgWcuCZ7uXX9GMqTQbq5TODL3iuacCmWIdBdi
         qR4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773628385; x=1774233185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=Os005hha9utJ0zhLJOYe43DqwRJu1UsmQb6s+HI6U/vIkdMMHKNfni2DnM3UjY2ppG
         Pgldse+NU/KSqsNIKnhLsbu3tV+y5WOf7u38Ae1jXCGJ+TALOgC7DlZBap+ebz4BPH5E
         nRNEReY023lXBY4rnzTVP/LQogEO2pekM5ob8tnZjzH8wkHt+SD0VxbFEmVw/IXm5ykT
         zenhaSk0a2HdP0Y9lApDdeu+NjIkaHvZvyqrN9+GDogwYjuU+8lnmWqykOgeBlgiP6JA
         /7T3vubRR+T2OKrdyYplaKBWP4WvlYGo8Iw+KD28NlBJmyFbtK2bzcP1n+j5ThCSE+rA
         UXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628385; x=1774233185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
        b=h3i0x0mZT2u2ri6NM2UlJKplZHf6eerL/6hjo748+LxEuA7k1N7g/S67nHlhCbVhDj
         3REG/iU9Sg9oQj4P1ihXSjtHC3o9OubQSyuhfYijR1XctCzns2HMbGS4L/M8xnSsfFaK
         PWMhAUkQDA0RS9NtU968zfl4wabHpkElfd8WKPYO4fZcoe6SGQvwhbYLHRq3FWBLq20U
         sEUzHOR9S/yjA6Un0VLt2/HF4RX52PucDaj78YRNTyi8B4fAvOSLuzbWtd6K5/DZDLsT
         ra6bVrYrzVKZvemHTveB4X+qIKd5aQ57+/Ofk/RyPlDQarqwWCotWcI7LyXfgtP+DFaW
         lm5w==
X-Forwarded-Encrypted: i=1; AJvYcCW05vANxi58jPjTfM7xB+Vj2JxAJP9QBJhnLOB6FCUdHlBvOPXO+LAr96XgbXxs5WtvO9cgmthJf70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEWymX+VC7rInVDt/dCLO32jY2dFvhXDcs10UtjluiLkbv5JNJ
	sdT1wk4z8LmfOgyvYWCTyXj3F+apc6nwaa+v5jsUnD86bhRQ87JbaJembNvnEId+5Wsm9qLL+of
	chCSqSTilVEuY6ULhJe25JExl5DdN3XLDDkR1RKJZ
X-Gm-Gg: ATEYQzzIq3lkV4Ut5wItp+BIZSgf6oTo42jRMjvTSTSYA/Kl79NVosnfnGR7l8kEKyG
	n9h+MTGkgG2sUSiQG6cjWq/fyeyKCs+Bp+h0ywbyKkmfB9vp00Xy3V7waBgzZBRDppey6cNq3+g
	6H/7uhNjq1J6sTqIIJfnuRb61ndQ09k4c1eODUytCKdH4FOsU/NrfCmn0khsEaJgcuyg/UHqmPF
	906lxs5Q/Xan5JPeCOlhoOsE/Tgvi99J4UDD/2+5Jki0ZfV0aDK/sd0bUt4O7CTu2H83FQB4h61
	fyWCvw==
X-Received: by 2002:a05:622a:60c:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5096a92ebdbmr823271cf.1.1773628384887; Sun, 15 Mar 2026
 19:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev> <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
In-Reply-To: <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 19:32:54 -0700
X-Gm-Features: AaiRm52_478_pqzpMaMH6nJQtQvcaF-xKuK5uDWZ-u00xGMYRYKMJPl6M-Q1q5E
Message-ID: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
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

On Fri, Mar 13, 2026 at 5:00=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> > On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kern=
el.org> wrote:
> >
> > > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() use=
rs to
> > > .mmap_prepare()") updated AFS to use the mmap_prepare callback in fav=
our of
> > > the deprecated mmap callback.
> > >
> > > However, it did not account for the fact that mmap_prepare can fail t=
o map
> > > due to an out of memory error, and thus should not be incrementing a
> > > reference count on mmap_prepare.

This is a bit confusing. I see the current implementation does
afs_add_open_mmap() and then if generic_file_mmap_prepare() fails it
does afs_drop_open_mmap(), therefore refcounting seems to be balanced.
Is there really a problem?

> > >
> > > With the newly added vm_ops->mapped callback available, we can simply=
 defer
> > > this operation to that callback which is only invoked once the mappin=
g is
> > > successfully in place (but not yet visible to userspace as the mmap a=
nd VMA
> > > write locks are held).
> > >
> > > Therefore add afs_mapped() to implement this callback for AFS.
> > >
> > > In practice the mapping allocations are 'too small to fail' so this i=
s
> > > something that realistically should never happen in practice (or woul=
d do
> > > so in a case where the process is about to die anyway), but we should=
 still
> > > handle this.

nit: I would drop the above paragraph. If it's impossible why are you
handling it? If it's unlikely, then handling it is even more
important.

> > >
> > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > ---
> > >  fs/afs/file.c | 20 ++++++++++++++++----
> > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > > index f609366fd2ac..69ef86f5e274 100644
> > > --- a/fs/afs/file.c
> > > +++ b/fs/afs/file.c
> > > @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file *in=
, loff_t *ppos,
> > >  static void afs_vm_open(struct vm_area_struct *area);
> > >  static void afs_vm_close(struct vm_area_struct *area);
> > >  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t sta=
rt_pgoff, pgoff_t end_pgoff);
> > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_=
t pgoff,
> > > +                 const struct file *file, void **vm_private_data);
> > >
> > >  const struct file_operations afs_file_operations =3D {
> > >     .open           =3D afs_open,
> > > @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_aops=
 =3D {
> > >  };
> > >
> > >  static const struct vm_operations_struct afs_vm_ops =3D {
> > > +   .mapped         =3D afs_mapped,
> > >     .open           =3D afs_vm_open,
> > >     .close          =3D afs_vm_close,
> > >     .fault          =3D filemap_fault,
> > > @@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_area=
_desc *desc)
> > >     afs_add_open_mmap(vnode);
> >
> > Is the above afs_add_open_mmap an additional one, which could cause a r=
eference
> > leak? Does the above one need to be removed and only the one in afs_map=
ped()
> > needs to be kept?
>
> Ah yeah good spot, will fix thanks!
>
> >
> > >
> > >     ret =3D generic_file_mmap_prepare(desc);
> > > -   if (ret =3D=3D 0)
> > > -           desc->vm_ops =3D &afs_vm_ops;
> > > -   else
> > > -           afs_drop_open_mmap(vnode);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   desc->vm_ops =3D &afs_vm_ops;
> > >     return ret;
> > >  }
> > >
> > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_=
t pgoff,
> > > +                 const struct file *file, void **vm_private_data)
> > > +{
> > > +   struct afs_vnode *vnode =3D AFS_FS_I(file_inode(file));
> > > +
> > > +   afs_add_open_mmap(vnode);
> > > +   return 0;
> > > +}
> > > +
> > >  static void afs_vm_open(struct vm_area_struct *vma)
> > >  {
> > >     afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> > > --
> > > 2.53.0
> > >
> > >
>
> Cheers, Lorenzo
