Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15636233D85
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767657556; cv=none; b=M7Mw9ZtBWdqNRSUfWywve99Z9I6QLvkPb2q+s7j08eLpCiE5mTDS23pgHSvOH+qIiphFE+a90GTo7DWBBtILHNTrpn19hVdr+nEDvZst1I+2xImctS8VwV2G9fFnnu4XQNtslcFmQ8BHmTA8Bj984bggJ+cgdvwCISWVo1JyYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767657556; c=relaxed/simple;
	bh=vydIrr+Gml+SlvhYbGq0p6Gx/f1mOX2506u2ezdMwxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPSr/f/v9olbypYJTDKKJQ5xTcsRFMN9vYkgGEImLPtUCgBaCL5m8RbjuZx4xLxfxDQVo8zFJKGAB++GoA9A7Oyb6d/CEDXbvMTSb7hqroVpCV91XMxEC9b3NbsrlqLOA9F+QFOpgspuLVXVttX6MX6LnZzMP9aeS15mg2NaOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNTRF0LF; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNTRF0LF"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a09d981507so3398425ad.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 15:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767657554; x=1768262354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Td42PUfrOWAuQeqqyPhN9snX5r+zsGZdxP+4d36YAws=;
        b=cNTRF0LFDf14zMY/D07mYc4H7AhMRuwnR+cz7bZx9tFlW3oSnQLMDyDGGrt6kNcAyY
         +d9HGOgIXS4/oxDzAiAPYudaZPQ9Ov39G8t9tT9tM9iNu2BLPDDQACqRta4YOFuJ7ebC
         UW8ltwL9MkIV3CxS/ntTml5vZSxWycmCD27pQ+757W3HWw6nulxyAVUAxCCa1hCdT22T
         Bff8+D8nKllb/9gz0hN+R5w6bjJX0BhEX1cnFMU67hq2zRLZk+1ePacLv08LboSlGcpY
         joaMZaxNJOmUVL3sjTtzuWSzJYhTUmsGwhRjI3+/lEY6lAD7qXCYANZfwqwF/iRTe/uR
         BCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767657554; x=1768262354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td42PUfrOWAuQeqqyPhN9snX5r+zsGZdxP+4d36YAws=;
        b=vMkLDJ7jU3k9BNHlRG6RYZLo45/g7FCY9jESahTVf5umJ3tSkRsxj4AVL609vzAf2M
         QMn++5//LlJAhsAwOCN4bCaQTuzdKok99AE6dhv9r5yn6j02a2JHgnZKRxmNid+BKHjD
         CtTEtNkvW4de/gH3qFahY/ejntEHSCvqcevwSvHHETvDe86fxrI1RyMMTu53duUiZMJU
         MCNlCD8XZL+/+I8U13GoptdP5XdhwysdOjgJXlgkE9WpWF+TCa1jstUqRg04UCeAiU3q
         vqOqD5GJ/a1FO38OQiWmZ/CqdFy7hovvaXqZTABe0DIPEd9yb790Dm4JuPPVIZgE4qIN
         JsZg==
X-Forwarded-Encrypted: i=1; AJvYcCWxNKaQ4n6fjjBX1Ba9TxeV6a8Cuw9EL1q8QgvllRlhKzJ2f9y0+EXdJa44ds3+uSlpzpb+kuJU/44=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoVbOPRiqBqWqgZmQZVqWWz1IkpgyKunPJMGEpphlFH6dT3YcO
	Wl3v91/cn5sDb+PoOOOY349JhWrsQdUFSaQ9K9pN4ofPRLIWJb4RfoBM
X-Gm-Gg: AY/fxX7meG/2Y8EskUVMy2wLHPP9QfCHORLeQyRw44j/IE8FfVeF5sIveNARqo9ggXH
	M0yncz7lQe7ZtS3m+zPDAj6P2NBX28h1uDeCQpIMuTQEaajbC1VD33Nw+CFNkQd/xkwkxoYe4nm
	QzMEuKiOucAhKjwQCPq4efnLtZXQI03I+Fu5vHnLL7kh5VjeQyrz/w/gVSQyLIPXfv/WRza4Hyh
	KlEm7g2rYurExMIdHWFBhHKRz/+oaYS6NFcUDz0vj3xhFtxwv10i/RKDykjF9aegVFzjNPPP32C
	xSGy2OiAW2OYMi5FSs8HQp2WbaYQaGL809VYOc9qMQSPL4ETeS1nedSs9CA5Ya7HjIJmOzMo6ld
	hVGO0U5bHrpwOEXLUQTZvGiiIKp4esj0LlWnIYgwUuhVe/EIBNkMDrNOezjXpuBfdhLvyR0Ywcl
	8Ap+ZbLlvuf8+yFxKRIWP0dDZF4Av2zc/KucdrpM1k5JbhPrNk8+LnZDbQvA==
X-Google-Smtp-Source: AGHT+IF2yujLQdtPUNjYNIQaaHVruUByq90dGhW9WF1ysuwMpC9YYgi0f8b7TmopRm+oHlRb0Tf74A==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e80e:b11c with SMTP id d9443c01a7336-2a3e399ed7emr7963145ad.10.1767657554271;
        Mon, 05 Jan 2026 15:59:14 -0800 (PST)
Received: from localhost (static-103-70-166-143.unpl.net. [103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm3044455ad.75.2026.01.05.15.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 15:59:13 -0800 (PST)
Date: Tue, 6 Jan 2026 05:29:10 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, 
	Benjamin Coddington <bcodding@hammerspace.com>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [linux-next:master 1503/2671] htmldocs:
 Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <aVxP9K7mNMw-yChE@kforge-fedora>
References: <202601011410.4vVaIDB9-lkp@intel.com>
 <745448ec-d69f-4f0c-ac02-08c5d757569f@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <745448ec-d69f-4f0c-ac02-08c5d757569f@infradead.org>

On Thu, Jan 01, 2026 at 07:36:48PM -0800, Randy Dunlap wrote:

> Benjamin,
> 
> On 1/1/26 5:27 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> > commit: 977de00dfcf87e8d95f55dfc247955dc2f9da14d [1503/2671] VFS: move dentry_create() from fs/open.c to fs/namei.c
> > reproduce: (https://download.01.org/0day-ci/archive/20260101/202601011410.4vVaIDB9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601011410.4vVaIDB9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    ERROR: Cannot find file ./include/linux/dcache.h
> >    WARNING: No kernel-doc for file ./include/linux/dcache.h
> >    WARNING: ./fs/inode.c:1607 function parameter 'isnew' not described in 'ilookup5_nowait'
> >    WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
> >    WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
> >>> Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline emphasis start-string without end-string. [docutils]
> >    Documentation/filesystems/api-summary:56: ./fs/namei.c:4943: ERROR: Unknown target name: "o". [docutils]
> >    ERROR: Cannot find file ./include/linux/buffer_head.h
> >    WARNING: No kernel-doc for file ./include/linux/buffer_head.h
> >    ERROR: Cannot find file ./include/linux/fscache-cache.h
> >    WARNING: No kernel-doc for file ./include/linux/fscache-cache.h
> 
> fs/open.c is not used in Documentation/ (where the lines were moved _from_).
> 
> fs/namei.c needs changes like:
> 
> ---
>  fs/namei.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20251219.orig/fs/namei.c
> +++ linux-next-20251219/fs/namei.c
> @@ -4938,7 +4938,7 @@ EXPORT_SYMBOL(start_creating_user_path);
>  /**
>   * dentry_create - Create and open a file
>   * @path: path to create
> - * @flags: O_ flags
> + * @flags: O_* flags
>   * @mode: mode bits for new file
>   * @cred: credentials to use
>   *
> @@ -4949,7 +4949,7 @@ EXPORT_SYMBOL(start_creating_user_path);
>   * the new file is to be created. The parent directory and the
>   * negative dentry must reside on the same filesystem instance.
>   *
> - * On success, returns a "struct file *". Otherwise a ERR_PTR
> + * On success, returns a "struct file \*". Otherwise a ERR_PTR
>   * is returned.
>   */
>  struct file *dentry_create(struct path *path, int flags, umode_t mode,
> 
> 
> Or                         &struct file \*.
> without the quotation marks.
> 
> -- 
> ~Randy
> 

Hi Randy,

I have already sent a patch for this here :

https://lore.kernel.org/all/20251231153851.7523-1-krishnagopi487@gmail.com/

Gopi Krishna Menon
