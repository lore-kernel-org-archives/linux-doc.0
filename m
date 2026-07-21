Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718C44AB6E
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784675836; cv=pass; b=hefePaSjC2frxEKGsWZCmdwqDdIPAgUUi2Gp7+pJe50jShPo1eG2joAfWYI2PVPOEX9IaQUG5Gi54lHmiontsdSvC7nOkPhopAnCkMLWCJM33p3PdK3RVS+hC7kpPxb3if9rYODWQ59kZ7Hf9dYQwxDXJhgOL2wTWO24DZi+0Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784675836; c=relaxed/simple;
	bh=ixJiEIB3IFCdgmVozwXQ5lsPDefOeoRv/OC6Bg1emsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYnWmGkdRoeXewbfDD5igInlWkOiOpeE32kx+rlDAfRCzfkmAnpyVRb9bOzCpFuHWQh5xozdVV0W2r1EretijQdyRMQQsQ+jKHnwKo1Ha/tUulfw+c6zzLMRxN8ajoKLFtSvVshxq137Em+DRuzOMMf04Vvo/MVoqfGMvJNbOVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tYHqs2Vj; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tYHqs2Vj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca7c1176317so8742955a12.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 16:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784675832; cv=none;
        d=google.com; s=arc-20260327;
        b=Qy+PS/qqK2NRr09C1M5ctoud8Jq8EKRobBY3PgrsVk7Nrr6i0OVD+ltyF6o+jnwDu0
         21H2QblukKlnFZCNGr6gg4cCmQktIBaTrIFw1k5rZ98tyg3uGQc7c/Psh2w8mqz8GSc9
         59wnCEoD1po8emLXpnpjkSR52ExhDz2WDrP1TcoQBW6ml7boJYXLcTfiv5liankiO1LV
         UrRkGY6GUxGGObkDA2A5lMC0ZvPLQuUnxaEI6/HAOWuJuhACjShTTy8rIcOttF4qZQnr
         TbO9+96eTf7xxGxGmGNC4M82Y7mAVUoKdLIHRl5VQYQoGLJxh1NuGvecfVysyxXQOAAD
         PEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XZ7qRUkeVcw09Vx52wAPeyyp7zrSxjZkAHO4XaqMzD4=;
        fh=8MMN4MliZ3qbreq/zfL3hHjNm61A2KEkh+IJOLpeAQE=;
        b=cCOBLHSqEe+VU01/9M5Y9+RCAEm7pZHDtQkyfd3fOA+5c9Onpqu3BoKf++cR97t5Yc
         t4qWqD9CGBVgAZc541ZkNXwfUli3vqyY2Sco5JdHuPHCNr4JD3CMLaF1vKA7GKcNO9cg
         inumFP56fBq/oOup7NM4whCk5GR5KDAOWRdz4vgUK3RCcU/slWa7wGzi6SOuZzO4zbT5
         oqfdknNn08CL4MZG/iKuxoVFzrxY/1AQkBph0MmFtK8rOt92s+yR+ot2PqEiJjccSNph
         rVpY+e7r7wikl3NP2aVgxbTGrC2O2eodprCi311bOvquLT0WfQYCcYrlMOgJelFM3MZN
         ckJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784675832; x=1785280632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZ7qRUkeVcw09Vx52wAPeyyp7zrSxjZkAHO4XaqMzD4=;
        b=tYHqs2VjcpDzUVPn3ZYnf9NvsMr45MZoprS6JSOUBCtUxTvWOu42atJVl/cqH5knRl
         ZLMwHTYoJPc46Pb3FuZxvyG57aLmB9Sr6tCSzlCe8p/xJR2BXgfsCQhU5WNlwSJegFzc
         fWaIMLEzDkPSoJRhq4WRmZ8x6b+ObRMUd69bids2GmHDB4DEZOaFEwJbPutY5PAD+XJ1
         BMNjOyb6scfc9pVy/9kE4B+3dro4S+MWaugAyUSNq1hSCG0/Hy6jur7XTYi/4ZGw/taY
         xcQs00LVabzjB/B/g09vI6kMSj61tmVQUx+lLJE1tdCqvbtbhGC83SWAgzVEtJXVsnW7
         NjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675832; x=1785280632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZ7qRUkeVcw09Vx52wAPeyyp7zrSxjZkAHO4XaqMzD4=;
        b=C+m4hmktM47Rd4Tc4EzcYj622rupmrBCo/7MFyf9um2aWThT1UZc2Ruclq2RdhECdw
         I50zEOjefQSViXk3gxnaBNu6yRBZWHjrKTkeoLrCMEtNOL9zwf41O73mVLW942H+3vpw
         Mt0LbDyvsYG2pji/wOKd2RI6v5S+4t46I1KAeqJ/7AKmsh2NO+C76ygf47RGsm7X+FFP
         lFtvXTL94HuXZ8FXfajfCQVMNqDDkasoK21ROPbQaq5VfQUHIpP2x93bcnHuHh6Vx9EV
         fSl/BK8lUnVzMfkBTqAW8SSD0OsVz9BajWtSvsUqC3IgeC7m5Zqm7woqNngahHL7J6UN
         FXZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rou+BtVp2Xya0GCuG4GsxXVP07WgB+u+DaCKi1wZSglkCs6qsrzpcGYL87G3p4UOV6BzwB8xTBT/Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVadLQUyQS++kbGY7AFGbcYE5/mHvtmmY9MCnypqSDWmHdiu+
	+p5MEhF5nvdGA964MNzqBLCmAyjC35ioQaJtFqSVo31mXl830tOhxIu5UKpIO6Gz9usZ/MtJJxs
	NLb8h2Ra+9FbMxJXQlqc1AFK6mC+OkscBxPL26j1F
X-Gm-Gg: AR+sD11Q3x2qFbYOOEz3oOeEduQxpPZ+4FRNSHF1OYB2kAjB/ky0uHDAhttvSE9SSTM
	u70nt5gbMWKyAjaY3yMJTGeo3YS9vjLm52cOjt6NdpcXj1GNmypwlutBfuk9brtbqWVWnrM9QIm
	oB9zlapi/7J4nQlmS0TaGrXyF8Z/4cu7RM4xmPxKqRWKyQRqxWGDmtKrfI7L3CfglDMSk2VbPX/
	9T2pMT8uOkrYfFNQjW6MUSXUm6yzvWf834KymGAK2pkHY8PRz4PpO7UzewAyw==
X-Received: by 2002:a05:6a20:1446:b0:3b1:cce5:9140 with SMTP id
 adf61e73a8af0-3c3ad8537d2mr21934058637.33.1784675831570; Tue, 21 Jul 2026
 16:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710212616.1351130-1-dmatlack@google.com> <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4> <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
 <al_3nOssZoa6RoCq@google.com>
In-Reply-To: <al_3nOssZoa6RoCq@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 21 Jul 2026 16:16:44 -0700
X-Gm-Features: AUfX_mxmcKg9wEWL8G2cbUIPdoOXypA3DIQHnJ26Qr2Bjm3tZvSdzwlvs3nabeo
Message-ID: <CALzav=dvc_bdmFtV1U2APfs1FM-6Zi5=VShcAYQjZ0wwNRfC-Q@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:02=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
>
> On Mon, Jul 20, 2026 at 02:54:51PM -0700, David Matlack wrote:
> >On Fri, Jul 17, 2026 at 2:47=E2=80=AFPM Pasha Tatashin
> ><pasha.tatashin@soleen.com> wrote:
> >>
> >> On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@google.com=
> wrote:
> >> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> >> > index 03075ce06ac9..df6a02240aa4 100644
> >> > --- a/drivers/pci/liveupdate.c
> >> > +++ b/drivers/pci/liveupdate.c
> >> > @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *=
dev)
> >> > [ ... skip 76 lines ... ]
> >> > +     /*
> >> > +      * Hold the ref on the incoming FLB until pci_liveupdate_finis=
h() so
> >> > +      * that dev->liveupdate.incoming cannot get freed while the PC=
I core
> >> > +      * has a pointer to it. It's better to leak the incoming FLB t=
han do a
> >> > +      * use-after-free if driver does not call pci_liveupdate_finis=
h().
> >> > +      */
> >>
> >> I am confused by this. Each preserved PCI device must have an associat=
ed
> >> FD preserved with it via LUO. I.e., vfiofd would need to be preserved.=
 If
> >> the vfiofd was not reclaimed, and finish is not possible, that vfiofd
> >> would still be owned by LUO, and therefore PCI FLB refcount would stay
> >> positive.
> >>
> >> However, if finish is possible, and this is the last vfiofd that is
> >> finished, FLB will be freed as soon as the reference count reaches zer=
o,
> >> which I would think is the expected behavior.
> >>
> >> What is the point of holding a reference here, instead of only for the
> >> duration of FLB access, i.e. to make sure we are accessing a valid dat=
a?
> >
> >The duration of the access is from here until pci_liveupdate_finish()
> >because that it when the pointer (dev->liveupdate.incoming) is
> >cleared. So that is why the PCI core holds the reference from here
> >until pci_liveupdate_finish().
>
> I think LUO gives you guarantee that this pointer remains valid until
> the FLB finish(), because all the vfiofd that were preserved have not
> finished. And when all vfiofd have finished, LUO lets you know that the
> pointer is becoming invalid so you can unset these in the finish()
> callback from LUO?
>
> If I understand this correctly, I think by keeping long references until
> finish you are replicating the vfiofd bound lifecycle that LUO already
> gives you.

Yes that's right. I am taking the approach of not trusting drivers
(i.e. VFIO) and having the PCI core maintain it's own references so
that FLB finish() is guaranteed to never be called while a device has
device->liveupdate.incoming set.

Alternatively, the PCI core could avoid taking a reference and instead
check for driver bugs in FLB finish(). I previously explored that
approach and ran into a circular lock dependency between the FLB mutex
and pci_liveupdate.rwsem. But I can look into that again, or just do a
lockless walk of all PCI devices and panic if any still has
dev->liveupdate.incoming set. It will only happen if the driver is
completely broken so panicking seems fine.
