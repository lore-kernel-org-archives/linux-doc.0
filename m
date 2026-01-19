Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2513A7836
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841017; cv=none; b=JGXZEa4cp6J0CAKkKK1UoZWBpGWg/48aJAMLAi5cp97JhtioaW+XG20VqGYoovyqexhHlgaFyEQydIzM/hKQZSSgMc37NW6F1E3J4yqJC/vkxtnS+DnPsxxDIzOmq5c391yM84LlbI87ItEhezupX1tWs+JYUim8ulBiX1F0zj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841017; c=relaxed/simple;
	bh=CQ3IL8fqKnWIgvRv+IOv0Cfz8J1ZjzxNV5oCIJJcLY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Udpbg5Esb1pm4RoFn5bykhcDVwvTZPbm5JhA6SbjCI7xn+umHWr7h2Yy04RYUoH1Lt1kofASB2clZppkf/EJKWXyCLmFY5D5GeLn/zb1QmBbhFk2Z3F9S39ZFRtBoT6kBpqJVtjS37QFYffby/x2splJG+wXQRuZqXnJflKSuNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkkHIwzb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkkHIwzb"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so7600360a12.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 08:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768841012; x=1769445812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
        b=EkkHIwzbfTJKzshmxlDOiaxtn4vBhGJ8hV4EprnGWkmuC/r1b41pPCDsLJyiC5AW5r
         CLWhGZucaUydM6cEu+YJNQ5errSDWpQMGa4luhsuFC6Ded7q3E2uHG5piLmTpyaABJ5c
         MeVpTUfm05SLfpHgXfRlKQ6y5fwlEypURJCR9owfvjJtiQLYKgBpQhhUqOBuqI4ZbVP9
         AlKzmFKgcTyQq1tExcoY8jyWZQuleBSdMijvUXJCRjmQgiKX6YuNKehKm76YncoVewKJ
         tTFHR0K6sL38se/gLII2739FwexAo8CVaidTZSlCOXo9zz3u6rXjjqqsloC6fgpkPenc
         uVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841012; x=1769445812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t7xapJC59KqqTTsHRvPEloTsuOjJhUfycEcUpCAL4U8=;
        b=n+xAfPwlDh1ybg4jGrl7JFObjMjAvsZt2r9nUjko6bQN2J9c53LjMoJqd5GbXeV1B9
         tmErhZVkkpu6OM5CwjwZuOdHly9wcYfnhhqtlMhTm+DvVy7stRZtZFqMHB6h+xMxJWGp
         beRziCs0p/sfOSKjDfLVAuLTxJhJ4IplzP/8NKrg6fgkmb6lpmhuOk8sfMIfodDEkDMN
         pNONTlm0G+jQh1/LM9cxQlBbKTLn1UEtlH+7DyjZ32bLxRUvyRShkM+UUtCvWugZrCVp
         rcPOPoCArrnwBnikXevR3T3BCZIfqhmQAkqswgrRZgQJj0mqNl4FLT79+bVDyERfWO38
         BNtA==
X-Forwarded-Encrypted: i=1; AJvYcCVywQYU88LGtxfgR59gQyhMWHY+4pQ0joJMGdQTdrLjP9J+EQy0kZIlshQJ77zvyNfYWRrFU1IDVIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEW5mOOxGmFZmGaUck3AHioogFyurWMRMsc/h4IeLFAx76nQFO
	pLBlo4SBORc7x3dJ5tjx7kobvZffLIMD2lrUd4dzBIIaM73k9l8nVmVhQT2+pkq9KUJUS/5Xo/u
	t+KpZLF2qtTDF2/g+jy+52zeekXKvHJM=
X-Gm-Gg: AZuq6aKuH+lEGqjWggDV04f5E5bouMDaM7bfCS+2G+g9Sovg6c/oKC2s7Bmgj51rDOr
	9z2XwdWK+zpnn7J/TLcnTZEtBg7GN6Loyu9+F+HkgSJeUbzLq46crQhld78woHavcX12ll1txg1
	nI43KsTYV/nuWErstd81YQdG/R9wPI66YrL3n7QUykI3OspDM1PPvGsoO/rSQ0Bin5UiCKN7lLy
	g7UV/qYwtt70AaZNoBigxPBf8TzHONeVLqXoHMxG2eBx24rrc7wr8ivHWubYo+vfKACXtakdoDW
	gpaA2HjMqlPKJzBeGaqOcPFMBmsy6qV9LtfpB47d
X-Received: by 2002:a05:6402:5106:b0:64c:584c:556c with SMTP id
 4fb4d7f45d1cf-654bb6192admr8530585a12.30.1768841011353; Mon, 19 Jan 2026
 08:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org> <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-27-d93368f903bd@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 19 Jan 2026 17:43:19 +0100
X-Gm-Features: AZwV_QgQ6YFmczFqASwqjyOa509PoCTPsOB-sET1G173IBHOd4X5kFjH9N6z5MI
Message-ID: <CAOQ4uxjyTdf21G1Y=_5Eox58drVPA0gAMeSQZxh=T36_yzssNw@mail.gmail.com>
Subject: Re: [PATCH v2 27/31] fuse: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Carlos Maiolino <cem@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
	Andreas Gruenbacher <agruenba@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Dave Chinner <david@fromorbit.com>, 
	Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-ext4@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-unionfs@vger.kernel.org, devel@lists.orangefs.org, 
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 5:30=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indica=
te
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/inode.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 819e50d666224a6201cfc7f450e0bd37bfe32810..df92414e903b200fedb9dc777=
b913dae1e2d0741 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1215,6 +1215,7 @@ static const struct export_operations fuse_export_o=
perations =3D {
>         .fh_to_parent   =3D fuse_fh_to_parent,
>         .encode_fh      =3D fuse_encode_fh,
>         .get_parent     =3D fuse_get_parent,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };
>
>  static const struct super_operations fuse_super_operations =3D {
>
> --
> 2.52.0
>
