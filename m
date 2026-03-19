Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5C3E51C0
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933560; cv=pass; b=FANQymxTtxhTxhdV60JBHgfJuGJTM6XZH/OgD4XX97izy+rRAUfj2PO3AKXQYBXfd+fdSJYH6ALpNTEfpGxq9b2yq0hwZbY/5HF5KiGzGSIH2oliwbIcGPbmnJVEo91K0ZE1xxelQuPBXnlIb9FtrMI/O/6/h5oooSMyi6cx4KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933560; c=relaxed/simple;
	bh=457BRqSPz9m1QV8ngyY1vCfliC5HfzIQsOqy3zeBt18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evrSTk79VKxJQ545napSQvW1M/Wy+NvUNtlEx4ynEjvXaDuW17qdd3tgBU2GZBhvwHJYtglGmT2DNVm4HPMzHJByV2ugbu6hQOGTwLcCA/GstVSHptB8X2eY97R4J/0So9wNEVl4VCxnIPi5Vvp9R4iPaWwUf7Td5Jc0VfxW19c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rESW6C/j; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rESW6C/j"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so12087a12.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 08:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773933554; cv=none;
        d=google.com; s=arc-20240605;
        b=XKS7Sj86K35tnF9MHpRWuh1AUJwBO+tvmD5HMj8i5Yi9jYGMI4+j1nhY3tBu5+/ra5
         eIAaMGHA3xY2aIeDn9vrnP8HvtEuvlnuhLquk7vyLmpdiXBz2QEitmkf/LELflRnUa0M
         p+/E0mCTc01XtHcbrq+ZTGbrO2frm20n0i6yJn1NIhoCQosWEp1eRTF4V1xW1C8Oq9Mm
         bM5KMPrnSykgAkcz5zqwzbweiNUc15z+GaW+zPMgQ+eD4Zt3d2Zx0pWAjvKTVt9JNTjc
         2G4lnIh42Ob4pZ6TTF8deVUURcLeEMkqyaRk9TMhshW7dm9P63hLFUU4xom/kDYytm/5
         r7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+SkkA6JHNTO5608C+WgUR0GK5zpsD2f8nbksELlrew=;
        fh=StuDDaDQEw/5u6t4QI8R413d9SyYbz2zS0D2I6NrOKc=;
        b=grfHr0e2+xYKMtKYj/WQ7V5SnqHPfZENzsqQdeG4/4zUvpCgnMB+OJle5Xk31TwTLq
         mqL68lCQa9hTmiBUlcuoU/9xoXN0ce5l15gQMnAetFlJaPAvOXhVMAJA7rStgOq2IvC+
         Y0I+Lf49arTCRUmfkWegS7BcxRqSKwzQSP5SPdnqdd2RScvFYXFXQycko3SM3QBE0sNa
         0a1DhVmd1Sp8K+zOMF+B1T+I+dCMFEE6nIzZBlqg2jdLEZPny9K5cebqY1PPTGnTE9Lh
         x1IuioqFys0OjJQmbWMH3hYXquYVo1k9ZNSz19IzbYGMrop8U8sSU3ZpyPt01DIBxIHZ
         BB/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773933554; x=1774538354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+SkkA6JHNTO5608C+WgUR0GK5zpsD2f8nbksELlrew=;
        b=rESW6C/jNJFpvL+aJ7M5geNS/4ke8FBW9rsf1CVnzwimTXrNJVWg02E4Shxil6uO1G
         lc4a7WaGjTIWhTruq1H3hjF+T8lB+1RdmXRomKkJUWw3O+iO0U8LoeZ+YUFkc4D48FpV
         5snO1parSBc/N8g1ipHp/1JZoAOCq6ISic7RLkrJA8c63VZXLqGqpjdQE29MOh9ZyOJg
         qy+Ns9Cjg4FKMrrE95ZRo0eGaCv7ZbXocsg8pfU9hkUdPHhYtzDufVt2OE+YFfX5Pk+v
         EMdlxlcYAdjDG2WfjZtx8100VoYGDn0plVZ2VAwk62MgryniBOO0pQR48+YE2MZemi30
         3FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933554; x=1774538354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+SkkA6JHNTO5608C+WgUR0GK5zpsD2f8nbksELlrew=;
        b=TWXoNTcxyf6wmEIN8COQ44pABLuYT+Aq1zVs66OrPmoO4PoFK0B4CUWv8Pw3JR8nnX
         L8RML72SNbGMjdb8pIv9YGPRIfp9Zd0423llW4zS5AqEi87XGXz+JVRHgYrIfv5awu3u
         zyhFN/9roTbQXel13lDT97evJCETg2Lts2B3lGNaTzXdW6LK98LWtygEOgvYEaqRSG1B
         26weveeu5mpOLFOdAK7p6bXizKuZitBjPuYwyxu9RoXdWEOpMmhVuKjZKafPVLaa4/Y2
         93w1tXfhaIL6vgktqu7G8W4gcgNcN75foknmgEOb5rnTCThUXPxGyrY7pe3965eGp+YO
         0S9A==
X-Forwarded-Encrypted: i=1; AJvYcCUkoKX6sZbMFBJUJ15Iatpcs3/ZBrSNKxFtxkAN5Q/t7iVn795a/bXy5Dfk9tVNrWuUqp1L1/6yhAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVJ1UlK/2IPIrd4vcXbr090ozdumPQ94OwRiDL7LMxSLOmLkYM
	MVQgS7Qp/+Nquec8gNMP63IBf06uGVigLjBNAmX0BBZUFlIF6sRnwU04Kxia6VqRaGdoc1nJbs0
	T++1JY2CEDy6xEezeN8QYPS4dzefPvL4ZiwnMN9+q
X-Gm-Gg: ATEYQzwkfFurFIIJl+2z5tbXw/7dkViRbGrMc879zwI69lzkAIqKe1MPEWkrBL3YCOf
	RV5tOsXw3DhAxG4m+zi5t/o867J4ajXxEx+poHgQhPAo2Gv8PtLHps7XKTtH6B18dJSCZ9u2FQ9
	cda+l9pE3+dbAEYCt6+hNX7cfpJYtLcqtON/wRdgBI1x4PTLcKDXTedhGvHUxIfB1fkJi91Edl9
	aK3J2EUVlqFMiqzHfhkn+Nq+QjtCJcPiOUiwJ5Rx704ZH6OLfpHyBbcQ9zs3g6jqu0ldvKqZGqD
	v+aEaL05cSAiHOOuiQBSdSnert1Ymmalafiq
X-Received: by 2002:aa7:c305:0:b0:665:4aee:2091 with SMTP id
 4fb4d7f45d1cf-668597c91b5mr35260a12.1.1773933553516; Thu, 19 Mar 2026
 08:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
 <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
 <CAJuCfpE5qZmi43EeZiRcy78pD6YvJb5n_xnoUJfwEjomowu0=A@mail.gmail.com> <8cdad898-b306-40fe-a367-efe7147f83b9@lucifer.local>
In-Reply-To: <8cdad898-b306-40fe-a367-efe7147f83b9@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Mar 2026 08:19:00 -0700
X-Gm-Features: AaiRm538m687pN9OvrM8BA6vooI_JX1puVDbGEAq4CrmCygBr1Sq-70iE-ogZ1c
Message-ID: <CAJuCfpHXqtxZr5s84jCcz513a2pgMeDoobsLBJH9pSON49cM+w@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] staging: vme_user: replace deprecated mmap hook
 with mmap_prepare
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
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

On Thu, Mar 19, 2026 at 7:55=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> On Tue, Mar 17, 2026 at 02:32:16PM -0700, Suren Baghdasaryan wrote:
> > On Tue, Mar 17, 2026 at 2:26=E2=80=AFPM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs=
@kernel.org> wrote:
> > > >
> > > > The f_op->mmap interface is deprecated, so update driver to use its
> > > > successor, mmap_prepare.
> > > >
> > > > The driver previously used vm_iomap_memory(), so this change replac=
es it
> > > > with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> > > >
> > > > Functions that wrap mmap() are also converted to wrap mmap_prepare(=
)
> > > > instead.
> > > >
> > > > Also update the documentation accordingly.
> > > >
> > > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > > ---
> > > >  Documentation/driver-api/vme.rst    |  2 +-
> > > >  drivers/staging/vme_user/vme.c      | 20 +++++------
> > > >  drivers/staging/vme_user/vme.h      |  2 +-
> > > >  drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++--------=
----
> > > >  4 files changed, 42 insertions(+), 33 deletions(-)
> > > >
> > > > diff --git a/Documentation/driver-api/vme.rst b/Documentation/drive=
r-api/vme.rst
> > > > index c0b475369de0..7111999abc14 100644
> > > > --- a/Documentation/driver-api/vme.rst
> > > > +++ b/Documentation/driver-api/vme.rst
> > > > @@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be u=
sed to read from and
> > > >
> > > >  In addition to simple reads and writes, :c:func:`vme_master_rmw` i=
s provided to
> > > >  do a read-modify-write transaction. Parts of a VME window can also=
 be mapped
> > > > -into user space memory using :c:func:`vme_master_mmap`.
> > > > +into user space memory using :c:func:`vme_master_mmap_prepare`.
> > > >
> > > >
> > > >  Slave windows
> > > > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_u=
ser/vme.c
> > > > index f10a00c05f12..7220aba7b919 100644
> > > > --- a/drivers/staging/vme_user/vme.c
> > > > +++ b/drivers/staging/vme_user/vme.c
> > > > @@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resource=
 *resource, unsigned int mask,
> > > >  EXPORT_SYMBOL(vme_master_rmw);
> > > >
> > > >  /**
> > > > - * vme_master_mmap - Mmap region of VME master window.
> > > > + * vme_master_mmap_prepare - Mmap region of VME master window.
> > > >   * @resource: Pointer to VME master resource.
> > > > - * @vma: Pointer to definition of user mapping.
> > > > + * @desc: Pointer to descriptor of user mapping.
> > > >   *
> > > >   * Memory map a region of the VME master window into user space.
> > > >   *
> > > > @@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
> > > >   *         resource or -EFAULT if map exceeds window size. Other g=
eneric mmap
> > > >   *         errors may also be returned.
> > > >   */
> > > > -int vme_master_mmap(struct vme_resource *resource, struct vm_area_=
struct *vma)
> > > > +int vme_master_mmap_prepare(struct vme_resource *resource,
> > > > +                           struct vm_area_desc *desc)
> > > >  {
> > > > +       const unsigned long vma_size =3D vma_desc_size(desc);
> > > >         struct vme_bridge *bridge =3D find_bridge(resource);
> > > >         struct vme_master_resource *image;
> > > >         phys_addr_t phys_addr;
> > > > -       unsigned long vma_size;
> > > >
> > > >         if (resource->type !=3D VME_MASTER) {
> > > >                 dev_err(bridge->parent, "Not a master resource\n");
> > > > @@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *reso=
urce, struct vm_area_struct *vma)
> > > >         }
> > > >
> > > >         image =3D list_entry(resource->entry, struct vme_master_res=
ource, list);
> > > > -       phys_addr =3D image->bus_resource.start + (vma->vm_pgoff <<=
 PAGE_SHIFT);
> > > > -       vma_size =3D vma->vm_end - vma->vm_start;
> > > > +       phys_addr =3D image->bus_resource.start + (desc->pgoff << P=
AGE_SHIFT);
> > > >
> > > >         if (phys_addr + vma_size > image->bus_resource.end + 1) {
> > > >                 dev_err(bridge->parent, "Map size cannot exceed the=
 window size\n");
> > > >                 return -EFAULT;
> > > >         }
> > > >
> > > > -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> > > > -
> > > > -       return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma->v=
m_start);
> > > > +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> > > > +       mmap_action_simple_ioremap(desc, phys_addr, vma_size);
> > > > +       return 0;
> > > >  }
> > > > -EXPORT_SYMBOL(vme_master_mmap);
> > > > +EXPORT_SYMBOL(vme_master_mmap_prepare);
> > > >
> > > >  /**
> > > >   * vme_master_free - Free VME master window
> > > > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_u=
ser/vme.h
> > > > index 797e9940fdd1..b6413605ea49 100644
> > > > --- a/drivers/staging/vme_user/vme.h
> > > > +++ b/drivers/staging/vme_user/vme.h
> > > > @@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *re=
source, void *buf, size_t count,
> > > >  ssize_t vme_master_write(struct vme_resource *resource, void *buf,=
 size_t count, loff_t offset);
> > > >  unsigned int vme_master_rmw(struct vme_resource *resource, unsigne=
d int mask, unsigned int compare,
> > > >                             unsigned int swap, loff_t offset);
> > > > -int vme_master_mmap(struct vme_resource *resource, struct vm_area_=
struct *vma);
> > > > +int vme_master_mmap_prepare(struct vme_resource *resource, struct =
vm_area_desc *desc);
> > > >  void vme_master_free(struct vme_resource *resource);
> > > >
> > > >  struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 rou=
te);
> > > > diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/=
vme_user/vme_user.c
> > > > index d95dd7d9190a..11e25c2f6b0a 100644
> > > > --- a/drivers/staging/vme_user/vme_user.c
> > > > +++ b/drivers/staging/vme_user/vme_user.c
> > > > @@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_area_=
struct *vma)
> > > >         kfree(vma_priv);
> > > >  }
> > > >
> > > > -static const struct vm_operations_struct vme_user_vm_ops =3D {
> > > > -       .open =3D vme_user_vm_open,
> > > > -       .close =3D vme_user_vm_close,
> > > > -};
> > > > -
> > > > -static int vme_user_master_mmap(unsigned int minor, struct vm_area=
_struct *vma)
> > > > +static int vme_user_vm_mapped(unsigned long start, unsigned long e=
nd, pgoff_t pgoff,
> > > > +                             const struct file *file, void **vm_pr=
ivate_data)
> > > >  {
> > > > -       int err;
> > > > +       const unsigned int minor =3D iminor(file_inode(file));
> > > >         struct vme_user_vma_priv *vma_priv;
> > > >
> > > >         mutex_lock(&image[minor].mutex);
> > > >
> > > > -       err =3D vme_master_mmap(image[minor].resource, vma);
> > > > -       if (err) {
> > > > -               mutex_unlock(&image[minor].mutex);
> > > > -               return err;
> > > > -       }
> > > > -
> > >
> > > Ok, this changes the set of the operations performed under image[mino=
r].mutex.
> > > Before we had:
> > >
> > > mutex_lock(&image[minor].mutex);
> > > vme_master_mmap();
> > > <some final adjustments>
> > > mutex_unlock(&image[minor].mutex);
> > >
> > > Now we have:
> > >
> > > mutex_lock(&image[minor].mutex);
> > > vme_master_mmap_prepare()
> > > mutex_unlock(&image[minor].mutex);
> > > vm_iomap_memory();
> > > mutex_lock(&image[minor].mutex);
> > > vme_user_vm_mapped(); // <some final adjustments>
> > > mutex_unlock(&image[minor].mutex);
> > >
> > > I think as long as image[minor] does not change while we are not
> > > holding the mutex we should be safe, and looking at the code it seems
> > > to be the case. But I'm not familiar with this driver and might be
> > > wrong. Worth double-checking.
>
> The file is pinned for the duration, the mutex is associated with the fil=
e,
> so there's no sane world in which that could be problematic.
>
> Keeping in mind that we manipulate stuff on vme_user_vm_close() that
> directly acceses image[minor] at an arbitary time.

That was my understanding as well. Thanks for confirming.

>
> >
> > A side note: if we had to hold the mutex across all those operations I
> > think we would need to take the mutex in the vm_ops->mmap_prepare and
> > add a vm_ops->map_failed hook or something along that line to drop the
> > mutex in case mmap_action_complete() fails. Not sure if we will have
> > such cases though...
>
> No, I don't want to do this if it can be at all avoided. You should in
> nearly any sane circumstance be able to defer things until the mapped hoo=
k
> anyway.
>
> Also a merge can happen too after an .mmap_prepare, so we'd have to have
> some 'success' hook and I'm just not going there it'll end up open to abu=
se
> again.
>
> (We do have success and error filtering hooks right now, sadly, but they'=
re
> really for hugetlb and I plan to find a way to get rid of them).
>
> The mmap_prepare is meant to essentially be as stateless as possible.

Yes, I also hope we won't encounter cases requiring us to keep any
state information between the mmap_prepare and mapped stages.

>
> Anyway I don't think it's relevant here.
>
> >
> > >
> > > >         vma_priv =3D kmalloc_obj(*vma_priv);
> > > >         if (!vma_priv) {
> > > >                 mutex_unlock(&image[minor].mutex);
> > > > @@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned int =
minor, struct vm_area_struct *vma)
> > > >
> > > >         vma_priv->minor =3D minor;
> > > >         refcount_set(&vma_priv->refcnt, 1);
> > > > -       vma->vm_ops =3D &vme_user_vm_ops;
> > > > -       vma->vm_private_data =3D vma_priv;
> > > > -
> > > > +       *vm_private_data =3D vma_priv;
> > > >         image[minor].mmap_count++;
> > > >
> > > >         mutex_unlock(&image[minor].mutex);
> > > > -
> > > >         return 0;
> > > >  }
> > > >
> > > > -static int vme_user_mmap(struct file *file, struct vm_area_struct =
*vma)
> > > > +static const struct vm_operations_struct vme_user_vm_ops =3D {
> > > > +       .mapped =3D vme_user_vm_mapped,
> > > > +       .open =3D vme_user_vm_open,
> > > > +       .close =3D vme_user_vm_close,
> > > > +};
> > > > +
> > > > +static int vme_user_master_mmap_prepare(unsigned int minor,
> > > > +                                       struct vm_area_desc *desc)
> > > > +{
> > > > +       int err;
> > > > +
> > > > +       mutex_lock(&image[minor].mutex);
> > > > +
> > > > +       err =3D vme_master_mmap_prepare(image[minor].resource, desc=
);
> > > > +       if (!err)
> > > > +               desc->vm_ops =3D &vme_user_vm_ops;
> > > > +
> > > > +       mutex_unlock(&image[minor].mutex);
> > > > +       return err;
> > > > +}
> > > > +
> > > > +static int vme_user_mmap_prepare(struct vm_area_desc *desc)
> > > >  {
> > > > -       unsigned int minor =3D iminor(file_inode(file));
> > > > +       const struct file *file =3D desc->file;
> > > > +       const unsigned int minor =3D iminor(file_inode(file));
> > > >
> > > >         if (type[minor] =3D=3D MASTER_MINOR)
> > > > -               return vme_user_master_mmap(minor, vma);
> > > > +               return vme_user_master_mmap_prepare(minor, desc);
> > > >
> > > >         return -ENODEV;
> > > >  }
> > > > @@ -498,7 +507,7 @@ static const struct file_operations vme_user_fo=
ps =3D {
> > > >         .llseek =3D vme_user_llseek,
> > > >         .unlocked_ioctl =3D vme_user_unlocked_ioctl,
> > > >         .compat_ioctl =3D compat_ptr_ioctl,
> > > > -       .mmap =3D vme_user_mmap,
> > > > +       .mmap_prepare =3D vme_user_mmap_prepare,
> > > >  };
> > > >
> > > >  static int vme_user_match(struct vme_dev *vdev)
> > > > --
> > > > 2.53.0
> > > >
>
> Cheers, Lorenzo
