Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE236655F
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769814814; cv=pass; b=UnDioZO06TAxOOSIIWYC+x1mm2AtcQdmUdD5F4AjjsoQ7s3BrnmO7oHKaz7JF08XlGOf7QvG2JQfj362X6e0SxOgww/C1RsXyqWHRoyXqXWCXi0tRxfivlrpqP4Ir7kgOI8piXPTnYYdO3yOXJT4B1fzQlsjka7IHYmr1RtAOnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769814814; c=relaxed/simple;
	bh=c34Quq+eQsW819C0KqCK2tzNAvjf7UPjPYiue9c5K38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJmtTkyh3X0J3q2RqM45eNYaFpTjt6OYF9KyI4TrUCHanWfOfpKCQRt9Xja1t/0LwAG/3Rs5wdNF1bqs+HTpM3UCCPItC+dPqZqgjeyphPxXzAksa4VJDo5j8YfySqu8za/z1v01mFjhleTjaa7VffV9OqRMHTIiLt8TxR2QH7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlKSw3ey; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlKSw3ey"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-894703956b8so43543126d6.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 15:13:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769814812; cv=none;
        d=google.com; s=arc-20240605;
        b=PhCVseb0mY4EuRYLpmMsWAgpcb/ViBk9qg1UN9yYzfZ28DGE/qyL+lWiEPMaisTrRl
         p9sTasRxp2U9lwVhhyjMfsJPfo3i/xv0hNV+2EAT9Kb7LafqK6c7YJMbph4+oiw3YDvl
         Dms0ktuBRX3Ok+bTjXQsHmYJnh+/xtE/xTbibzTfB1FuZJRMtbPvqkXgEiGoMaEjlZz2
         PZsJXmwslkXB+UXNJ+ju9IU1VAMzeE9w4phGJybHkefHszZIFrZxeSb+DB19Px7TxC7J
         QI/TRfvcLunxiTMJ6SasdrK25dqc6KJh2xno/toe0QyXVmcAK5ZXzmHaZ5vCcK+Ci9b5
         cZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCpt40N6zxEp6+nDSQMAaK5Vngq+apunb1ikLDPBcPI=;
        fh=XJx6EXPpgB8u5LJWySqWGvYcdZqdVcgtYudos5mZYkw=;
        b=eJsuCudijbMt7yFaoXp/d0CydfAc0JnvBcU1OK3LqDfXEpNf2EgfATrWYPizMRPubj
         hD+J9Ou8j5nAwiaGqtncGnRDXZ1mXFq/f5q132RvG7Um2sWI2QrQlnI1XFDFDJuajfPh
         rqlHUK1EJvcVZd0FxBAkuJkwKwAvgc4uftQmZ1rIIKcJoJl3L1ZvwYQXUdy4lGtWPH93
         dtLL2+tos1N/9erUbhXBNBW2vyEDHq4FiI4GwolDKQgo8fYlA71VnebbpImPCQkXST+L
         cAjLfgyTRdSSGwyin9vhVXzXJsY/+3dTn6KYiYUXZuYkDwU2XZV5dXZmhwpWhfuo5E/3
         Y7jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769814812; x=1770419612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCpt40N6zxEp6+nDSQMAaK5Vngq+apunb1ikLDPBcPI=;
        b=NlKSw3eyc1tyXmspzsAwqjEg0L5qtn8VEtydTsA1k/t5kIJxOhrN2xKKdm8BWLN4zz
         rHri9/V/4RaC+06llGtYHBEbstcKr3C2GEYlv+T0zCAcKgW5DwWdrG4GOhekhIpSKNbz
         I4JR2O3IP1Dm1IvYTvX34MyT2FHLc1MS/K0DZp+HKPt3/k3BxZDOXv4U4ca6cPB7X49/
         DzaO0WmFUwSH/KlH3p1SVDNYEkd+OihCUPLw4RbFD24BnLOm47UrWhuqo9VaIefTFdlY
         AutTs27CmaoB8IgK8gsy4HdDweucvKjr0i0a7uD8fogWRB6mEthY6FbUf3gZJSknQ+dF
         rBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769814812; x=1770419612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCpt40N6zxEp6+nDSQMAaK5Vngq+apunb1ikLDPBcPI=;
        b=afYQ7uoBYVo18908uj6utoegNsQr+V26aGZmsyBnkB3aoBJ+1QyzlxiFJ3CgjY9ZN8
         2p76ZvYZ/BbC13UBb5Vbfw7TO0H/GXq+CFtvBlsj/9rvVDCBZE8JpnD7estqB6Nkh0+7
         Bcaoo9NwOKG33W7n12qdfwjQrITd2TuacGE9s4LWnScrUPFbAUvA4SGe4pnMX5Wkldxz
         NbYNYAb6wpatiD+juAWSyxE1BO5bn0RW7n6PlRpLXc6YfjB16xqTUWM7/mMDOZeNLUdg
         mXO0+1DqRY03XtAlpnUgz4AigyiKNimWgE2e8/yw69RnneVeOrYMRA5gFwHmPPnsqx7+
         wo3w==
X-Forwarded-Encrypted: i=1; AJvYcCWLM9O1qrxZgdD1rij3zetAdLJ3TqLlmykn8nxHEkqOPB1fTO++ZwOcDyr+l9ifybAOkRBqSzQo8lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCXX9b487ucIcvPPuj8v+MX4jwwzQQIX4zuwxK4TxFAbY/t5cN
	v7yO+G32PG54w3+XcSbQHT3XrqljzA58F/lSvDMAVtfbGrl9kAGhCt8a03DSYlTyQ/tqXvG829m
	Y8xv2r43o9ZNZpvCAFTqQ0z49dfth2zc=
X-Gm-Gg: AZuq6aI5zpgnpxbolFlfbhkTu1G9T1cLV+9+7HgeeqtWs4wgKpGVxp3p/I18iRdJil5
	H3VSg40sXllgivCQxt8aR9ujwCxpr81ox75VeC8jXJ+IAtX07Vaq+dc1n6EEwlngMserPI5TR9Q
	dZTOFQdyPFWORI+jPz5TKmGc3X10khxQ8hysP7BQXrUuK6X4OQeENh7eLlZYMB1I6J9Xq9TIiNx
	sS6LDnCR3ejILE43I12HMiRK+5CVbUbRVtcq+YUS7nj1T4bseBW58037Bc2SZjryYnC+w==
X-Received: by 2002:a05:622a:c8:b0:501:502b:8c6b with SMTP id
 d75a77b69052e-505d217b5a5mr58752171cf.9.1769814811697; Fri, 30 Jan 2026
 15:13:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118223344.92651-1-john@jagalactic.com> <0100019bd33b1f66-b835e86a-e8ae-443f-a474-02db88f7e6db-000000@email.amazonses.com>
 <0100019bd33e43bf-bb49e98f-284c-475b-a027-13c7271f67bf-000000@email.amazonses.com>
In-Reply-To: <0100019bd33e43bf-bb49e98f-284c-475b-a027-13c7271f67bf-000000@email.amazonses.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 30 Jan 2026 15:13:20 -0800
X-Gm-Features: AZwV_QhZcPdEqRRUkE10n-Q1UjWagCWtvDsztQQ9CRVvisVS-xKBB72jFQNvlFU
Message-ID: <CAJnrk1YNRNRrXVydX6=5NAic3fu6QggbA5xV2fwywP27yZu2ZA@mail.gmail.com>
Subject: Re: [PATCH V7 17/19] famfs_fuse: Add DAX address_space_operations
 with noop_dirty_folio
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	John Groves <jgroves@fastmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
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

On Sun, Jan 18, 2026 at 2:33=E2=80=AFPM John Groves <john@jagalactic.com> w=
rote:
>
> From: John Groves <John@Groves.net>
>
> Famfs is memory-backed; there is no place to write back to, and no
> reason to mark pages dirty at all.
>
> Signed-off-by: John Groves <john@groves.net>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/famfs.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/fs/fuse/famfs.c b/fs/fuse/famfs.c
> index b38e92d8f381..90325bd14354 100644
> --- a/fs/fuse/famfs.c
> +++ b/fs/fuse/famfs.c
> @@ -14,6 +14,7 @@
>  #include <linux/mm.h>
>  #include <linux/dax.h>
>  #include <linux/iomap.h>
> +#include <linux/pagemap.h>
>  #include <linux/path.h>
>  #include <linux/namei.h>
>  #include <linux/string.h>
> @@ -39,6 +40,15 @@ static const struct dax_holder_operations famfs_fuse_d=
ax_holder_ops =3D {
>         .notify_failure         =3D famfs_dax_notify_failure,
>  };
>
> +/*
> + * DAX address_space_operations for famfs.
> + * famfs doesn't need dirty tracking - writes go directly to
> + * memory with no writeback required.
> + */
> +static const struct address_space_operations famfs_dax_aops =3D {
> +       .dirty_folio    =3D noop_dirty_folio,
> +};
> +
>  /***********************************************************************=
******/
>
>  /*
> @@ -627,6 +637,7 @@ famfs_file_init_dax(
>         if (famfs_meta_set(fi, meta) =3D=3D NULL) {
>                 i_size_write(inode, meta->file_size);
>                 inode->i_flags |=3D S_DAX;
> +               inode->i_data.a_ops =3D &famfs_dax_aops;
>         } else {
>                 pr_debug("%s: file already had metadata\n", __func__);
>                 __famfs_meta_free(meta);
> --
> 2.52.0
>
>
