Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D712DC322
	for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769822326; cv=pass; b=Yg3kqcP21TaThIrzhlBuAyPsvdDB1b3BdlafATSCzyO1ISf454wLKN/zHcDZFRVc4471h8l7p8wpnDqr1d3Tsl3XMXz5v2uKUsMHmPNKDiU3wcKiGA0uOy9RMMxRqkQpPx6lJ9qZsiIq6+iggLYdWCTfoNyTyiCeBVujeIs0Zdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769822326; c=relaxed/simple;
	bh=NJyyW3LrV2W0dVysafPoC2cjKhBb+MYi76erl20GHWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzRno1TRgPGECGLOxXOklOITsWb6H6O5EKuBu1vYxnrM8HBawmINzJOAgooSMB3BSCCsRLfAC+W0Bt1QAo2Y72li5Uf5Tmiv7/naAIl709SI5yO3PCmM5g0ZzwkBbKtZQP2tMJze//1JXHbPhDcwf51BimhC9ULoPASn/KzXjzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSNneL6Z; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSNneL6Z"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8947e6ffd20so31183566d6.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 17:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769822323; cv=none;
        d=google.com; s=arc-20240605;
        b=PlkJtz8KtB2+KxaH097gp40y7z3FmWxgTk5cVPy3lAaeq5V4brsOa1nwxUtX0yz0Ze
         gpZVGLdlf0MBT8r/97hCDVsbZ0q77CKJJa87tPPQzd3KFcl6Wy4V8TAXSRHuYguvHeH/
         jVOBBCmbLqx/rdWVuJNE59OyWTUMlw2EYxH20p6m7jkjNPQXnIS61uXNGNcraGDnQZGw
         iyQYZumbpauE+Q1lmEV7EtU9xk7mY/OlWTW0oEVqwyCKfUnQEmFspvefNx9HcGPNEl2U
         zoKL+dOJCU0v363Wau9LyNGmHkP95W+Vlu6KN+6eYTLNjj6N2xhGKf9EmvSpB4NEWH8O
         SkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9hrsBRNghnIovdQhJmal8FXOCZu37oJsf0hDL/41Z4=;
        fh=hngUqDxd8tZ33gt8WRpuqZUnuknieNUOhMUPCzWkbvc=;
        b=WsHP4hH/oT+TqwqhNdlqukxKDOSs76dPb0d5pzHUNYcZtvnv2rTQJV3r/8K82j2vZq
         xV3vyvX3Jn1g8pkwK3yLadshCdw4/AGmAY35695cC2TNFkun1czZY+qUk5Xnb3PpA0jT
         EUY8lHcDevZZEOuuFYnWV6tKzQUXWDIrBeDZSkrWl0dff+1EnIWwISFvfPVb9aXAHqo+
         KKQxEX8fzvvEq+Ou6ff8eufcyia0w6l2nCcQb+edO/5S2ZcCrCbK8c+1m6fl3uP3fLs4
         wqogf7W/JNQWIfSIgbnbL8TpVi9GKnCGIpcJwQ1jW8BAPB9p1x2pUYyJA5MgkQZmbfMR
         7bjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769822323; x=1770427123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9hrsBRNghnIovdQhJmal8FXOCZu37oJsf0hDL/41Z4=;
        b=MSNneL6ZdYS1vduzZenv+A58CJIG8UdamLkhXnr/8M8qRF6bLvW4xnwm/VgGelXIFl
         Tj/cfvczfvA6tQ7Rm9CtQeA/gDpKESzHzdYX3VXFWA/1KF0MBZHAykOv0tVmtfUzOKda
         qId3vRNxsCijXl/sjwUwZpmCNLUFkJl6DAozGBUgGOerPhHa2oxWGbTNjX9rkGalHfOX
         VED2q3zf5UT5E7EZl45MKecY9pOLuq1uWqbZQDFz7qZcHEA1CXd/HtVlQdbZ/UHBJF1x
         eJo384AlDBIPIADVGL5ZVUe+CTjBbQm+HXsDgVxVYtjifhX4Cno7a40hCza5Oxu0el8S
         3CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769822323; x=1770427123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C9hrsBRNghnIovdQhJmal8FXOCZu37oJsf0hDL/41Z4=;
        b=XG3UN4Z/+I0oqwa7J6ZgD/UwBOSbdpuA8tHBjAlyDJgWHtQsH5VY+dP7G3wp7XhWIi
         B6vDoQCnA1GK4pCxiWkARqmOeCu7al8kn9pHRr9Le2Y2VOMUEKEAzGuLBdpwb4faKpGd
         cXtntpzj8ypxYGHMP5QTDu4clLcSj3IyKz3i94te31hnvkjYyY6w9Lnsyr9msIbtJLj/
         m+AP5cFcQtg5vhRPGx8advmAMvKbtfNabDdxzDWo9bptUkrhnsbu2kv4lAPK6VmBttkd
         EZxSGiPFdI6ktIYjv4bF8RslCjumGZGECwq48hh4F0lIx2Cca/PiHflbosIEBvIMvAAB
         xdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGHhCDb5neJGOcOCVE9mCwF33aq73HIiXlSAXcNXJs/Uwy0zrONCY3v5g2elCtnPEbMzRvCKfteV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YynCLW+SHB12vyG4nob+PCYPfO6k/WzA1wdUqUAy52VQr8Zeuu5
	uI9m6j9WAEAdDE/OOu2s1pk7c1k8cRwttGvuu8U2h4Xu+tJB77lR6XCJubr3j6+90vandbobD3i
	TPo6OKUTRyPZkFDb3iBXckF7h+5wavIc=
X-Gm-Gg: AZuq6aJEZ+UCQSdUrBiOn+IHwEhtwDnx4NwEXSzftXxv+CEqUH1SXEOzqJpLJCbvj3O
	TYuXaotuOxh+m+FatXRWpKgoe/a6N52+8fDB1wXUrMgHT1MUZWxUrmM53hFVA71c/Zldi8hnSec
	tP8bXlS7M3LDcDr0wvIq6wvZuarUj9ooKBCnXEqNo5mq5PalwzeFgUGdvfi7sM7vLETDtB8RUc8
	frJu3UlmQsFN40GXOthMw6+hbFhp+phj2JIEpCOgSijHBj6TE9urdnInfBmPSsgJBVGCQ==
X-Received: by 2002:a05:6214:29cd:b0:894:2e09:335c with SMTP id
 6a1803df08f44-894ea06291bmr70047416d6.53.1769822323137; Fri, 30 Jan 2026
 17:18:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118223516.92753-1-john@jagalactic.com> <0100019bd33f2761-af1fb233-73d0-4b99-a0c0-d239266aec91-000000@email.amazonses.com>
 <0100019bd33fb644-94215a33-24d2-4474-b9eb-ddae39b29bd8-000000@email.amazonses.com>
 <CAJnrk1Z9BuCLZv576Ro9iYUPRDpW=1euG0rQ2wC_19sBcR18pw@mail.gmail.com> <20260131004119.GA104658@frogsfrogsfrogs>
In-Reply-To: <20260131004119.GA104658@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 30 Jan 2026 17:18:32 -0800
X-Gm-Features: AZwV_QjdwrW8pUbs14BS2iG7wgbYWMrbtNkfExGV1HlyGRZYGgSvmv1QKkg5_Go
Message-ID: <CAJnrk1adQktTTv=9_G=G_QDTkEZyCQgsPDd7QSGwwTsWk_4fEg@mail.gmail.com>
Subject: Re: [PATCH V7 1/3] fuse_kernel.h: bring up to baseline 6.19
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, 
	Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, John Groves <jgroves@fastmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 4:41=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Fri, Jan 30, 2026 at 02:53:13PM -0800, Joanne Koong wrote:
> > On Sun, Jan 18, 2026 at 2:35=E2=80=AFPM John Groves <john@jagalactic.co=
m> wrote:
> > >
> > > From: John Groves <john@groves.net>
> > >
> > > This is copied from include/uapi/linux/fuse.h in 6.19 with no changes=
.
> > >
> > > Signed-off-by: John Groves <john@groves.net>
> >
> > This LGTM. We could probably just merge this in already.
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> >
> > > ---
> > >  include/fuse_kernel.h | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/fuse_kernel.h b/include/fuse_kernel.h
> > > index 94621f6..c13e1f9 100644
> > > --- a/include/fuse_kernel.h
> > > +++ b/include/fuse_kernel.h
> > > @@ -239,6 +239,7 @@
> > >   *  7.45
> > >   *  - add FUSE_COPY_FILE_RANGE_64
> > >   *  - add struct fuse_copy_file_range_out
> > > + *  - add FUSE_NOTIFY_PRUNE
> > >   */
> > >
> > >  #ifndef _LINUX_FUSE_H
> > > @@ -680,7 +681,7 @@ enum fuse_notify_code {
> > >         FUSE_NOTIFY_DELETE =3D 6,
> > >         FUSE_NOTIFY_RESEND =3D 7,
> > >         FUSE_NOTIFY_INC_EPOCH =3D 8,
> > > -       FUSE_NOTIFY_CODE_MAX,
> > > +       FUSE_NOTIFY_PRUNE =3D 9,
>
> This insertion ought to preserve FUSE_NOTIFY_CODE_MAX, right?

FUSE_NOTIFY_CODE_MAX was removed by Miklos in commit 0a0fdb98d16e3.

Thanks,
Joanne
>
> --D
>
> > >  };
> > >
> > >  /* The read buffer is required to be at least 8k, but may be much la=
rger */
> > > @@ -1119,6 +1120,12 @@ struct fuse_notify_retrieve_in {
> > >         uint64_t        dummy4;
> > >  };
> > >
> > > +struct fuse_notify_prune_out {
> > > +       uint32_t        count;
> > > +       uint32_t        padding;
> > > +       uint64_t        spare;
> > > +};
> > > +
> > >  struct fuse_backing_map {
> > >         int32_t         fd;
> > >         uint32_t        flags;
> > > @@ -1131,6 +1138,7 @@ struct fuse_backing_map {
> > >  #define FUSE_DEV_IOC_BACKING_OPEN      _IOW(FUSE_DEV_IOC_MAGIC, 1, \
> > >                                              struct fuse_backing_map)
> > >  #define FUSE_DEV_IOC_BACKING_CLOSE     _IOW(FUSE_DEV_IOC_MAGIC, 2, u=
int32_t)
> > > +#define FUSE_DEV_IOC_SYNC_INIT         _IO(FUSE_DEV_IOC_MAGIC, 3)
> > >
> > >  struct fuse_lseek_in {
> > >         uint64_t        fh;
> > > --
> > > 2.52.0
> > >
