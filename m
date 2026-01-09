Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0713E366DD7
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983392; cv=none; b=WfRc+am1bsnOyNsassN+yZlo1pWirEjnwUmvydJe1knkLxn210RUNXzlWLfJP2A9CmcucB1XBKh/2tEQ/vCcsSRxa+4YMb1dIRqV82H8D5hir2XSSOag1gRaW2RiwI5eQFrtBsktHvWeQ+fWg3/3yim9ZW02od5AJ5WZGyxw9pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983392; c=relaxed/simple;
	bh=00yYLGXhb42qUhp3Bu+hEI0Ws2wuU/ekKjA7ZDTW8ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUGrKC5B+9cfFOOPH9XsHzulz34VTKD6nFwulrFpzhK7htM72anNaPJT4hwIPEkyWKz4TGJ1Ja2tsbdbk1YdnVwtABtWPJCZ1JP0mTtJdIQlok7cdlGGXRKX+ewERqk9VmJ+gpZah0nBba9S6gDYB30lXlbOq5d+ibTn4lVbEZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMLkvn9i; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMLkvn9i"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88fca7bce90so46715976d6.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 10:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767983390; x=1768588190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAxsMd9qfhbaF/uFu/ONsXnhJzDpN/ZmkW3TT/4ib5s=;
        b=DMLkvn9i0zKrtfl3buWjSpr1Dd3UkSVxtv0lcl4RFWqfv9XUAjteb3RreFgBUkGN+n
         3iTiW0WeIroU3eMMfKD6QtOjdJpENTY0M5jN38ScYaf9hBw1Sp8fPyODWDHJIUPSMKNf
         sTm+QUuXTBVWtxLJ27IdDpG4XZusd8nfmgOviVhCpnVZHK+avVruXZbtI9+Bn5XdIfjI
         XLf+3NtoL6fbaIsdBK3Rz4/4ekeE13+IwrNAEnABB/8AgtMVgR7XEBwOZztjPUFnsby2
         LVQXS4ANBnLX5w/4KnL84RWfrTiMDGCxSfKCbKdfTdKDhAfVIB/SftzVs9CgwUSHjfeP
         AaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983390; x=1768588190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAxsMd9qfhbaF/uFu/ONsXnhJzDpN/ZmkW3TT/4ib5s=;
        b=jjZdwFk2bcL1BUALXKxvxv9sAaKAtq3cWZejX2O4QXjn4Z4E+MfZuK0fjtn2wNX/Bp
         HvsHY8aYr56p30fE1MjYLihhFyYPDZHXg5lFMXTfRlodvHMXn6taBt57omWcRNcv/V72
         qbQNW0QBEn/ZaHLJ/FH1w3IVrTH/Sbjo3+xMGRe8zx0gnLhNJDwDZAk4sKGnFTp4E61v
         P1/lmUlyGcPaLY25mJ/RVJvx2SNsIS4fCgn4GrSQAlusRWtszDir1f8BShof7myyqFWA
         Lye0dz4wfE/wtqc8hK7kBVMEE96aGKI8BpMrxabBxQDUSx1LocrrUA/ZSQ1jfosqTw+B
         YnaA==
X-Forwarded-Encrypted: i=1; AJvYcCX8V0weazzCyBDHt9ZxvDqSsTDpPTF2cEIHYvFay6BsXopL0Izwf5d8zum6GxtuD8y9WVxmSakt4BI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiB+Y9vTSA1rIoWlh9QxRVtV/wXRQk7czzn7htUBVbRfObkBD4
	i6Jn4kOqX16mtqoD1sj7lB4O+whIQEftIWO+gOhQ68J6aip+p25zpASnTm3Us2vV41T2ibZeO5T
	35666HhMkHjzRyRh3WI6PdK3pEs8xISc=
X-Gm-Gg: AY/fxX6+850Z0Bz52yqH8/B5E34ViAb2o/BMRqYgRe6dNCz2huFxGJLvtq4+SKdlOdR
	hrl4UZ4UE2U35CDL1FedlNs/z3qZlNAqcX/VRD/MFdSndivmZrKFj1T39kdsInpvfnEqWEaYI2U
	X95NTxJPwYl9p/rqdf/OIZKQ5+vxdWNrE4fFmmD/AZOxcZREYRJuHreGYbgMdILK1ebOAFa6rKW
	jhtKWtgtg0ef0liE8EAhozQCYhCAGeaxmSo8MaeQl9drItLEGS/y5C8TmcrEixLlCr+gQ==
X-Google-Smtp-Source: AGHT+IHlq/k6aGt3slZY7iNfrk9m2XRGsaHa25Bso2IebEcIgjfLBSdbUtZ1fL6PzKuJnwZWbWVzCQE+c2rsB6YWIcY=
X-Received: by 2002:a05:6214:268f:b0:882:437d:282d with SMTP id
 6a1803df08f44-890841ae54amr151687936d6.30.1767983389887; Fri, 09 Jan 2026
 10:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107153244.64703-1-john@groves.net> <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-13-john@groves.net>
In-Reply-To: <20260107153332.64727-13-john@groves.net>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 9 Jan 2026 10:29:38 -0800
X-Gm-Features: AQt7F2ol_drdQ3iXi69XhhLUyZBWJiqqNDBNu77Lc8heqKjvvqfcHiuhasXh1Zo
Message-ID: <CAJnrk1ZcY3R-iL2jNU3CYsrWBDY4phHM3ujtZybpYH2hZGpxCA@mail.gmail.com>
Subject: Re: [PATCH V3 12/21] famfs_fuse: Basic fuse kernel ABI enablement for famfs
To: John Groves <John@groves.net>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, venkataravis@micron.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 7:34=E2=80=AFAM John Groves <John@groves.net> wrote:
>
> * FUSE_DAX_FMAP flag in INIT request/reply
>
> * fuse_conn->famfs_iomap (enable famfs-mapped files) to denote a
>   famfs-enabled connection
>
> Signed-off-by: John Groves <john@groves.net>
> ---
>  fs/fuse/fuse_i.h          | 3 +++
>  fs/fuse/inode.c           | 6 ++++++
>  include/uapi/linux/fuse.h | 5 +++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index c13e1f9a2f12..5e2c93433823 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -240,6 +240,9 @@
>   *  - add FUSE_COPY_FILE_RANGE_64
>   *  - add struct fuse_copy_file_range_out
>   *  - add FUSE_NOTIFY_PRUNE
> + *
> + *  7.46
> + *    - Add FUSE_DAX_FMAP capability - ability to handle in-kernel fsdax=
 maps

very minor nit: the extra spacing before this line (and subsequent
lines in later patches) should be removed

>   */
>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
