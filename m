Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F72372B32
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 18:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626481; cv=pass; b=NugXXhrYTrl+e6g0E+4Ngq8hJCR4PpsQGlz34f6wjvYf4+HgbQ1PwbZ3CPo5zLfYLedtNlnfiThavNpIF4vgi5xzkdDrqDSXABbQDohv0oBD4b5Y/ysyujEFiSDIzutibie5ovr+ET1659kJofEF/Ktful7pOhe85QN5jrpyab8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626481; c=relaxed/simple;
	bh=Iv/R1VrCmh7DPMnIVbKr+xqiK5DjA15w78PbjXQO200=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfHraDtvhYQuuhwHnaMBbZXbh6Uoq8LNLwUzI9XvZWePEiiQR0e340WxI5PirHqUfcx+RREGQ/VQMeT2EXpjetQGawJrDJ3xIjCmnmbnA+AHhDvuJIcpGiS9yqPgwU0E1d3uaoxVpytCdhtH3U5djyes5qZtYDL51GQN7sJwMBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMqWeIwI; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMqWeIwI"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-501506f448bso789301cf.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 10:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769626479; cv=none;
        d=google.com; s=arc-20240605;
        b=gB3VlDYxdPp9eORsUKBCH1c7D2f73A04pvWzg3BVVyO8v1LkTVlO828zth5H/1o/Dh
         n3RgzgPsa1QrqPJNu1bUb/MXuYk20u7d0hkWXveJyb/4PKzzEtD5Dlf1tNyxjp8ryu2e
         RO1A//B2Ts34dlm3gQQQfvFgswDdW1871Xkfah6rwgD91JWaL/g+to/rntvQgH/a2v9r
         aLXMcYTMW7p9S8amr90grgT2CeRMw/yA1TEMw+PJBBD8a1ikngPp76HbTI1+wFZyjEla
         ljuKTrqVEAgeP25jeKP+3CdcEnhs08JPkGBDkBDAzYtjYSncJN9PJ96DWn94AtoECvpA
         jHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EQD+zhNe2TBSVN4C+gGjdPZJybKoBQIJM5cDvqByP90=;
        fh=rDf0HYeK/A0sGdKwqydD4TiScfxfu42Wtz0WboZiXDU=;
        b=TRO5+8pcE8YQCKhQeOvGmYl5ZOkDiMSxuSSjJk/cyGWQ05WsNNBR43OIaZP2fqK/ug
         yvJNWf3cslq+zCdLZDEkRWU0LxvzO9WVlIoRnSJMly9DK/DPqj7b8QB9wVZoHJDtvZUW
         7/6x/EqD/xsl2iqgwW1UFprzStHCpDdvlm0pNYwzkE67/ABea1e0GkgT6O935xDkH14l
         RCIvjscRugEuZascpu+z6syW151gdApo7BZtSzr39FuKmV5oiZ33NSFVPy3uLlnCtWw9
         U974X9YpX4KuKQ50pKcSd7Pg/6D3us8h6Ogqggiz9nxCDGe8vU95Yl9v5F2Ux+Yk/8NH
         boAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769626479; x=1770231279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQD+zhNe2TBSVN4C+gGjdPZJybKoBQIJM5cDvqByP90=;
        b=nMqWeIwIAlKYcQIFhefA7zNtavrmv2uZ1Rq3jpT/gQrF4rV7DhVyyMlHiMWHWjMLBC
         dkXaLYPg57lLfsY3ZY8e0H8v4bvI/UCaEew+WU/YHJQuVZF5765U3AN+toFuivAuYhYy
         yblY7vDQ50Q4nsFIpY9Mto3Ehw0CGGg1kQwpiyJp73rAHafr+u4GfnCSYTsAxeA9bZPE
         dN2GVo80uQViIUaIyHRJPeoMblJGhyzc6DmkWyFCXcXY1PjPTOH26nV3AokrrDa5y679
         oE5oj4IfSJ65MBZ1Y2iPt/1OrlufxJRgRk13ygoW1CzpqiV07uTW5U+vrfgsIbits/cX
         StSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769626479; x=1770231279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQD+zhNe2TBSVN4C+gGjdPZJybKoBQIJM5cDvqByP90=;
        b=EMe+5nRuxAQn6TzWS8o/J0uESJ0u1LBPc/oowjnVTb51xwBX22bz+ckqRvwV8VNBQn
         U6EXDyaURvix7h1YJqR6PHDOECXZYxNqZuL9mkQgSwbn5C/oKbbAsue6cq4w059EYd4/
         3SRKIGxhDDL7jXOYU1VT8xnZqq3SCIsjFi9mLy9NuNLMYtFmpixJ02iSVyMPtyQnjCgJ
         YwsI7ebQT9+ubuX6PtqSeQvRdnBjh24dlc5WuJhspxIJdXBtYtZnNAwrk15T9FWdlM3/
         DIhNv5rORnkib/40CHnAtpPrdQsFqAYNhxKwdXzKgRYVYleRgVX4sBrUzAgfEoXM3k0X
         +dqw==
X-Forwarded-Encrypted: i=1; AJvYcCV46sLSgTc1Za0XCMD5Huy0RJoJ7RnY33/0ycDrwb33l+ce9PsAJf8EWyIuv0NHZWa2vhcsawhoea4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUd9+RaYxKND9yhJGwuWcIw2AI+U/NBJY7v3MXRnjP77iSw3DW
	DLqBuM9Bb0O2Zd7bRbST9oors2HP0p5ezVRPBwP7EVG4eQIq7wfSlvCIrecjrnE/OezPdMqSUOW
	3EAnnwUNZ3EHXJ8ioDqVd8yAzzrtz6fo=
X-Gm-Gg: AZuq6aJjTj/U0fyHHFJczdL/pn9ZaIE+YlkD6xRV+ZiOwiAITb1Od3PvfPKoqI8KRky
	BANDLN/fGYFWSc4Eje1MM1tii8mv+Kp/Nyfo6VADN5XbwoDOIlo/3oWb9SJsiJ+g9FROoTcr5Ga
	k8lHnGQ2LD04LuVYnO6LNk3ElNkIU8o+feOsCg/6EoH6iw17BrWNq8oBcYOV/o3Mpwr/Fi7o/SB
	q/0XhZ1hvpBEcJGpd24T9VWVqn4bAul08yEturi8la8zksP3VuxPCAv78rPIenPh3rWBw==
X-Received: by 2002:a05:622a:1b91:b0:502:9b1f:ca4f with SMTP id
 d75a77b69052e-5032fc14d15mr83239651cf.84.1769626478464; Wed, 28 Jan 2026
 10:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116125831.953.compound@groves.net> <20260116185911.1005-10-john@jagalactic.com>
 <20260116185911.1005-1-john@jagalactic.com> <0100019bc831c807-bc90f4c0-d112-4c14-be08-d16839a7bcb6-000000@email.amazonses.com>
 <aXoarMgfbL6rh6xi@groves.net> <CAJnrk1bvomN7_MZOO8hwf85qLztZys4LfCjfcs_ZUq8+YBk5Wg@mail.gmail.com>
 <0100019c05067b3b-b9ab2963-ace5-481f-8969-c11f80a74423-000000@email.amazonses.com>
In-Reply-To: <0100019c05067b3b-b9ab2963-ace5-481f-8969-c11f80a74423-000000@email.amazonses.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 28 Jan 2026 10:54:26 -0800
X-Gm-Features: AZwV_QgXH_eGEFbh8Ufwurz5i77r71GDNcEX490YVb0oLl5TmaOznNxDkpKSA1U
Message-ID: <CAJnrk1Y6HayeS-C3sOEOc_CgaS_K=SedZNpHASAXAkgZyp3Xsg@mail.gmail.com>
Subject: Re: [PATCH V5 09/19] famfs_fuse: magic.h: Add famfs magic numbers
To: john@groves.net
Cc: Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, John Groves <jgroves@fastmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
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

On Wed, Jan 28, 2026 at 6:33=E2=80=AFAM John Groves <john@jagalactic.com> w=
rote:
>
> On 26/01/27 01:55PM, Joanne Koong wrote:
> > On Fri, Jan 16, 2026 at 11:52=E2=80=AFAM John Groves <john@jagalactic.c=
om> wrote:
> > >
> > > From: John Groves <john@groves.net>
> > >
> > > Famfs distinguishes between its on-media and in-memory superblocks. T=
his
> > > reserves the numbers, but they are only used by the user space
> > > components of famfs.
> > >
> > > Signed-off-by: John Groves <john@groves.net>
> > > ---
> > >  include/uapi/linux/magic.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> > > index 638ca21b7a90..712b097bf2a5 100644
> > > --- a/include/uapi/linux/magic.h
> > > +++ b/include/uapi/linux/magic.h
> > > @@ -38,6 +38,8 @@
> > >  #define OVERLAYFS_SUPER_MAGIC  0x794c7630
> > >  #define FUSE_SUPER_MAGIC       0x65735546
> > >  #define BCACHEFS_SUPER_MAGIC   0xca451a4e
> > > +#define FAMFS_SUPER_MAGIC      0x87b282ff
> > > +#define FAMFS_STATFS_MAGIC      0x87b282fd
> >
> > Could you explain why this needs to be added to uapi? If they are used
> > only by userspace, does it make more sense for these constants to live
> > in the userspace code instead?
> >
> > Thanks,
> > Joanne
>
> Hi Joanne,
>
> I think this is where it belongs; one function of uapi/linux/magic.h is a=
s
> a "registry" of magic numbers, which do need to be unique because they're
> the first step of recognizing what is on a device.
>
> This is a well-established ecosystem with block devices. Blkid / libblkid
> scan block devices and keep a database of what devices exist and what
> appears to be on them. When one adds a magic number that applies to block
> devices, one sends a patch to util-linux (where blkid lives) to add abili=
ty
> to recognize your media format (which IIRC includes the second recognitio=
n
> step - if the magic # matches, verify the superblock checksum).
>
> For character dax devices the ecosystem isn't really there yet, but the
> pattern is the same - and still makes sense.
>
> Also, 2 years ago in the very first public famfs patch set (pre-fuse),
> Christian Brauner told me they belong here [1].

Hi John,

Thanks for the context. I was under the impression include/uapi/ was
only for constants the kernel exposes as part of its ABI. If I'm
understanding it correctly, FAMFS_SUPER_MAGIC is used purely as an
on-disk format marker for identification by userspace tools. Why
doesn't having the magic number defined in the equivalent of
blkid/libblkid for dax devices and defined/used in the famfs
server-side implementation suffice for that purpose? I'm asking in
part because it seems like a slippery slope to me where any fuse
server could make the same argument in the future that their magic
constant should be added to uapi.

For Christian's comment, my understanding was that with the pre-fuse
patchset, it did need to be in uapi because the kernel explicitly set
sb->s_magic to it, but with famfs now going through fuse, sb->s_magic
uses FUSE_SUPER_MAGIC.

Thanks,
Joanne

>
> But if the consensus happens to have moved since then, NP...
>
> Regards,
> John
>
> [1] https://lore.kernel.org/linux-fsdevel/20240227-kiesgrube-couch-77ee2f=
6917c7@brauner/
>
>
