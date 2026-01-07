Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D10E2E8DE3
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821452; cv=none; b=lrxlAVDL0dAH0SFVErZATHmUzCnPyyP8P3b36yL8S0wnr68ufB8XlcSDuUqq2lbZ+CfsP5fcfCsiD1yDKl3E1+BxaFWKJt2WB6gNwiC68b89BqB8ZVNT1GVuhURQJZXV6Nmf+Apbr9N3V7HcAsOaHapwUN2KxsKoz0oShLXU2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821452; c=relaxed/simple;
	bh=hJBhEZEn2IW0Qs8Ce9poSTsX2HFP1recNbm+Qx+TfOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGRpL/GIp1rqcLjyXp4DlyDp90yP0p6U6F5EmVsmLDojFjtyAAJrGJd9O+PiwDQxBFsq/f/jvr8Ex48JBEo8i1SILt+kEvcN+V1TzMb17mDKEREecoP5lkDdyXZ3Ii4g4USgcXN0xFLWfVcbEBn7JtfhUNW3HyYtdXo40rby4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k620oX6k; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k620oX6k"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3ec41466a30so1122416fac.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 13:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767821449; x=1768426249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgyJxKcUhgy66+q0k0EwvKHt6dTWi7O1SwlvNA4nT9c=;
        b=k620oX6kftWHDnDeRjmIEer/+zMgkbptqwQN/iMdDylr09K3ufPyVnfXo4YiSIh1uA
         37Q7ccohaGiHSeMyJPY3HpkSMeabsbyia9fxbcPZWbXYa/y057+G/CU/usYGfIr3LwHU
         v94gAyZs2dUGI4cUoKL1DEcP/6HZVRLfPR8BJ5ItqNThR2onBRZnfnAr4W4uilFDuPQB
         yXd2El8PgA7qNs1hZTkDtPIUjd3G3MnWRpUTzgB0CxiRDfTSYRl2OF03yjawJkIqQ/MC
         lV91klAR4LJVkvTetxZv5qeSxSngJBJBhwgskucop3zv5gS0gqh2PlEWbsshAVOq9KUI
         IRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767821449; x=1768426249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PgyJxKcUhgy66+q0k0EwvKHt6dTWi7O1SwlvNA4nT9c=;
        b=CXeVhcbNclb3Vg/F6Ui8J27nEndzDDKunVR5Fvf9K8g9Q6ZxzXRxWtGorOShl6VHhZ
         C3d6w6wblhTs9ALgVFRrflEzhlnPWvLk33ZlV6f3OgmeNWiDY9YvR82Uils6ZfvGXZD5
         GT+buezdoMyeuXODY8LktX7Xe5eoPAqOpUEHVi5Hcg9vE+WLeE9bOV/t95hTqUqYvGWp
         rVLMqAO4q2/EeygGpkqIen7wnHb6glxpvAKAFPM7Ssu+KNALK0n0dO23ACEspu25TAH3
         wfIiDGWxJYtLqriYJVcFGl6BAJs4QQI32/zI4xk6i6WTd6KN55dncZYz0A2+AuqtRCc7
         DMbA==
X-Forwarded-Encrypted: i=1; AJvYcCV3tOK1wUZ4xfW20s60+7i99e8zFuyeXXcki4L59mmnEE52HP2RbysTI5R9lKKN1kz99W8xwyX1od8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4sZFKiDhDgmZvVhJVAraOBUlN1qZF5qUFr6kR5rxza/1Y7h5
	+dDXIAn5bKb/oEFAu5l40xPybriapGMOpvXaZwn6kBGR36zAV61CiNQa
X-Gm-Gg: AY/fxX7GT3bXVEVe1mzoq/2ePE8oQcwtRKtZD3JnAAHODu3Q8XY++4XtYN1P6++o+fq
	k+y7XeMouordKz2ERHrm+tCTrpuMT3KibJh3JXTBXpRvjN/gkJXPnkVSqgaOzd8KGl3BKacoBcA
	6hg0boY67GN5PbrAMI+n9ekz3H19F4KfrdXkojEmNQhBJJVta3EY5dX1SaAZLRE8zZgpKfajk7u
	N89TONDK99Z8zro70FvNdjQytnxTqAhrT7Xoss+q+2LCs7aaiWqBZegdx1flXyF6sgsA1RG30tB
	/2sp5wmhWseHNyKT1+VE8QywH0kkhhrNkc6SK8ku1UJ5oHSzNbmTCAPgQagUKicgQnPo2JDOUXI
	vdKXiRlpBIemvjzpAAa5u7041K4N/+vanlUd7MOaxPv/fVQ+jq9eADzNIQxqXF7nPO5tMkaQQYN
	csnc4OQI3T0eSiAv3CZsEXbKa0YA0Du+vS58Y+Ejn0
X-Google-Smtp-Source: AGHT+IGBpBXjThN1EPukRyzeQDjnIkWKrC19wevk+xy19Ke7HdDQYha50/3EOc1Su9/w3oCaFtcjKw==
X-Received: by 2002:a05:6870:4191:b0:3e8:92f2:caa2 with SMTP id 586e51a60fabf-3ffbed0d56dmr2067280fac.5.1767821449438;
        Wed, 07 Jan 2026 13:30:49 -0800 (PST)
Received: from groves.net ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4e3e844sm3874317fac.9.2026.01.07.13.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 13:30:48 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
Date: Wed, 7 Jan 2026 15:30:46 -0600
From: John Groves <John@groves.net>
To: Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, venkataravis@micron.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH V3 15/21] famfs_fuse: Create files with famfs fmaps
Message-ID: <smqodjljwvhnssmq4ho3hicnomzyrpsawy65ykxhigrjl7yawu@xwtbxjamivk7>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-16-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107153332.64727-16-john@groves.net>

On 26/01/07 09:33AM, John Groves wrote:
> On completion of GET_FMAP message/response, setup the full famfs
> metadata such that it's possible to handle read/write/mmap directly to
> dax. Note that the devdax_iomap plumbing is not in yet...
> 
> * Add famfs_kfmap.h: in-memory structures for resolving famfs file maps
>   (fmaps) to dax.
> * famfs.c: allocate, initialize and free fmaps
> * inode.c: only allow famfs mode if the fuse server has CAP_SYS_RAWIO
> * Update MAINTAINERS for the new files.
> 
> Signed-off-by: John Groves <john@groves.net>
> ---
>  MAINTAINERS               |   1 +
>  fs/fuse/famfs.c           | 355 +++++++++++++++++++++++++++++++++++++-
>  fs/fuse/famfs_kfmap.h     |  67 +++++++
>  fs/fuse/fuse_i.h          |  22 ++-
>  fs/fuse/inode.c           |  21 ++-
>  include/uapi/linux/fuse.h |  56 ++++++
>  6 files changed, 510 insertions(+), 12 deletions(-)
>  create mode 100644 fs/fuse/famfs_kfmap.h
> 

[ ... ]

> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 9e121a1d63b7..391ead26bfa2 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -121,7 +121,7 @@ static struct inode *fuse_alloc_inode(struct super_block *sb)
>  		fuse_inode_backing_set(fi, NULL);
>  
>  	if (IS_ENABLED(CONFIG_FUSE_FAMFS_DAX))
> -		famfs_meta_set(fi, NULL);
> +		famfs_meta_init(fi);
>  
>  	return &fi->inode;
>  
> @@ -1485,8 +1485,21 @@ static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
>  				timeout = arg->request_timeout;
>  
>  			if (IS_ENABLED(CONFIG_FUSE_FAMFS_DAX) &&
> -			    flags & FUSE_DAX_FMAP)
> -				fc->famfs_iomap = 1;
> +			    flags & FUSE_DAX_FMAP) {
> +				/* famfs_iomap is only allowed if the fuse
> +				 * server has CAP_SYS_RAWIO. This was checked
> +				 * in fuse_send_init, and FUSE_DAX_IOMAP was
> +				 * set in in_flags if so. Only allow enablement
> +				 * if we find it there. This function is
> +				 * normally not running in fuse server context,
> +				 * so we can do the capability check here...
                                         ^^^
Oops: this should be "can't" - we can't do the capability check here since we're not in
fuse server context. Will fix before merge...

[ ... ]

John

