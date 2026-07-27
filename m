Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624F31F983
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 20:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182795; cv=pass; b=ArlKkon1+VIlhLUQ7y7apg6XF215gZ62DocJyfIRlWkduwXI8b0RVMJX+VmjMty1GuolAqsmovuffDkvjpX0Nq6/qX7lJK/OhNkeltSTPx/0X99PVa/eAWK6O8WApC+N2Boq98sNyZ7+hbJCVPfxAQZ46OWzBlMgSIuybOiyc/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182795; c=relaxed/simple;
	bh=6apOgnwFS+LCUfaanOnBGAzYOkwuFRkixEqeP45hgM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txXMqhfwQrC5JtJLizxkOyavnK6vIT9CXEyP9EDxkZJ5U8vMDitzg/IQ8qJ2MiBIHqZaNj6JJZY4qxPrWfvzeKeGZCBv06Jxrh+yhMlnrwVvgMX1WeavlNH4UM9hVoCgDbwEmZFqDl6cm29ZOsVwN3tX3iXYVnmMc2sCTgWkhuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=agAk9l42; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="agAk9l42"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so3060853a12.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 13:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785182793; cv=none;
        d=google.com; s=arc-20260327;
        b=IvkvpxddphfNgqz/dxX5/ZXrLpRMVHCr9kdFDIt4fZ5WdqX6VNQgrj+1c5xdv4OFpo
         5b6PKAUvfqXUZFitnIc6h18lR7WLkzIaDspNu7S6AeZ7bezvcV5IY4aXSKfHqcGLmNuz
         iij65bVggl5JyHXME8ShkQ3JgWe0bmwGNKbMqvxohCcuLUS9UiGgzUaFGYWSeUKb3q3w
         G0C6neCniKgXBuvZlRc3Eqs8J0ZBzG1rhG1dpVjbdkDb9YQuOzI/GFzJBuSAVzgZsZmh
         OpxEtC6di5elq4LFBwg2bjI5eqeeG+2evTsjRBBO0uN0Ga40886cZsSC7ZqZz0EIqd87
         U5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WT3D5aoPs392vdVyfO0XAxS3rqs8yFAgGjz3WyPghwM=;
        fh=nHvdh5ANGp2r3adm6p+MNoGtK2Fno/0jG0j4K34Pz64=;
        b=hq3/ItzcxVwe0BKi9evEZ1QoUql0zqfeBIuKWRcP9h0+6nW0pQCSkqUh+iq3wojpEe
         mqOd9S2tgmSzvQaNCdiR7bdlsimGu8or0SpC516ZS55axmsZZnKddB8mWYnYjcJNec1D
         V/sxWavlaaEnCOK8sik0FgBO5tVSIY4CiOrz/43ifYv2+M+c2grNIIJwbsAMuot2Q9iB
         sfa5XMtImRxkOCO/Je3IzCMaWRj8/Cvof7jR7n/2mo1F9Muvy6oHCIioC/tbAQpwBlJw
         NKj5y6QvJDP5gXxySDHgwyZB02TFKVum+qn8H9vzmIpZ4jMRPYy4fBurFHn360/d1uo3
         85+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785182793; x=1785787593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WT3D5aoPs392vdVyfO0XAxS3rqs8yFAgGjz3WyPghwM=;
        b=agAk9l42+Xun1Kr1OkJdXs7lFnXZTj2ve7r5VzEm7uwQwstZv8DEyE0bkxKU99yapM
         dTLq3Q2uAb+SE0sJtlRLab/d13ovpKJaiih8QzBZ16Qln8jpgkB3cvY81R8cBMWtDTG/
         P4lVQJggBIdUxZUWnXBNIKWaXghmsHbMKV3aZ48sVjpd7XY/iEoxXGOdvvP6lPYYiv8Q
         Pdlv+6Osqe3ChiCUwNQTy5ZxgP01uKV0zMwxlgILiWoXL4CSqDgAbYgiPms+k8M08r1F
         3YrGWgpzJa/UPuM+om3skihiOpCDPbzqV3/JgvLEct67sgVfLNNVsZvAaGmyZ4l5T+jQ
         4ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182793; x=1785787593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT3D5aoPs392vdVyfO0XAxS3rqs8yFAgGjz3WyPghwM=;
        b=pcjbpjO0h39gwBTjo/vcgnAE7kf/tNf6mlUm3do8Kpcor+k88A3gt/PLlLzye2EuOA
         I0ou7T5IoaDDx2e784XtEZgSmZMiQUyWVHZiLqA4i9WaVLrdft8lFqenI2IbaGxCWQ49
         MxnkMOA1SMTZ66tajJnP/ViBh7fC8uAx75fdXD1p5xs4jUIc+vK/aBJHqxnzaScauFK9
         ME7iNnROzhyWdfk/SAUEXjwhg+5q9qYvr1KkQelDWCIheKYhBtKZ5PT6lOiVRcMRZEN+
         vy6vorRUXtmiQTuXDaA8SPqHkTCq959Kls7md5NQgTyhGnpD8vffbz/npSi+OGMMh5NH
         JgjA==
X-Forwarded-Encrypted: i=1; AHgh+RoCBCUveckQfsb8jfXvh9wwgKkMLw1uSsn9IYKkrAB+26E6/nqdNySauI1S4rsn+m2WeQ7b1nXWeOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87Wa/uT9WEpZtvEC4/S1KYguNTCU6CPSMmqaXM4NIiligJE/t
	jcBAHBTZiWSr3RhnqrES2hbFspsUXsuSgwhxIFSwlKa9plC9EZUetN4CTpfgh5w2jsUTfxzwfO3
	fun6N95aPp6hwoDs+EHew5pTcy9cuNoShuu3txAgEYbb3GtiMe5iIvjpw6rw=
X-Gm-Gg: AR+sD13XbTrvv5Ulir+K8NIPIJlSl7C1u53E0inS3rb/+E9rUsepz3wkQk6GSWw27CK
	U+kYbcD/Z4lIWOuETZYm4ePMGx3WU5zR7YmaF7sOQMJfmoZ1VGs1fbYUENnwxWtaMBc0W7Q5xYk
	juR8TGorqqSKCEeMCtgxs/x3+PGyJk6phxMbmi2QSTn8kF89J/fPGKMZWDt0VnKpkXe30vuDlLG
	Y1Bs+paojgWOfNPY1WcRcdPB/GeUFb41G9hZbmlvVO1CfCNp+rlvFPtbgZXNQ==
X-Received: by 2002:a05:6300:670d:b0:3b4:5c70:ca3e with SMTP id
 adf61e73a8af0-3c6c7cc8bd0mr999176637.25.1785182792364; Mon, 27 Jul 2026
 13:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALzav=cRhFW+zNX6xCnhjJXXDHgyhOxuoX26FG2Ve8+wMccypg@mail.gmail.com>
 <20260727192701.GA1250952@bhelgaas>
In-Reply-To: <20260727192701.GA1250952@bhelgaas>
From: David Matlack <dmatlack@google.com>
Date: Mon, 27 Jul 2026 13:06:04 -0700
X-Gm-Features: AUfX_mxd_Oq9PiU6WIdCESXtBp_uYjHaNiC_kTE5jOYjh-Uu0garCTxaVZ4f-sk
Message-ID: <CALzav=d1u5fuOgodeGKiFKPhMOx5xrdvgOeNqWfj-C7ZRG-EdQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] PCI: liveupdate: Set up FLB handler for the PCI core
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 12:27=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> On Mon, Jul 27, 2026 at 10:40:52AM -0700, David Matlack wrote:
> > On Thu, Jul 23, 2026 at 3:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > > On Fri, Jul 10, 2026 at 09:26:04PM +0000, David Matlack wrote:
> > > > Set up a File-Lifecycle-Bound (FLB) handler for the PCI core to ena=
ble
> > > > it to participate in the preservation of PCI devices across Live Up=
date.
> > > > Essentially, this commit enables the PCI core to allocate a struct
> > > > (struct pci_ser) and preserve it across a Live Update whenever at l=
east
> > > > one device is preserved.
> > > > ...
> > >
> > > > +#define pr_fmt(fmt) "PCI: " KBUILD_BASENAME ": " fmt
> > >
> > > Is KBUILD_BASENAME buying us something important here?  Just from
> > > code-reading perspective, it's more work because without some digging
> > > I don't know what it will end up looking like in a dmesg log.
> > >
> > > > +static void pci_flb_unpreserve(struct liveupdate_flb_op_args *args=
)
> > > > +{
> > > > +     struct pci_flb_outgoing *outgoing =3D args->obj;
> > > > +
> > > > +     WARN_ON(outgoing->ser->nr_devices);
> > > > +     kho_block_set_destroy(&outgoing->block_set);
> > > > +     kho_unpreserve_free(outgoing->ser);
> > > > +     kfree(outgoing);
> > > > +     pr_debug("Unpreserved struct pci_ser\n");
> > >
> > > If this pr_debug() is useful, maybe it should include an address and
> > > there should be a corresponding pr_debug() on the preserve side so we
> > > could find things in a crashdump?
> > >
> > > > +int pci_liveupdate_register_flb(struct liveupdate_file_handler *fh=
)
> > > > +{
> > > > +     pr_debug("Registering file handler \"%s\"\n", fh->compatible)=
;
> > >
> > > Is fh->compatible enough to identify a driver?
> >
> > Not necessarily. VFIO could theoretically have one file handler that
> > handles all the vfio-pci variant drivers. But I suspect we'll end up
> > with 1 fh per driver in practice.
> >
> > Are you thinking about how we can ensure devices are bound to
> > compatible drivers after Live Update?
>
> No, I don't understand enough to worry about things like that.  I'm
> just wondering if there's enough info in the message to be useful,
> since fh->compatible is the only text that's variable.  Same reason I
> asked about the "Unpreserved struct pci_ser" message above.  E.g., if
> a user reports these messages, will we need more information to debug
> it, or is the message itself enough?

Ah ok. From that perspective, I think this be sufficient to confirm
that VFIO has registered it's file handler for devices bound to
vfio-pci, which is all this log needs to do IMO.
