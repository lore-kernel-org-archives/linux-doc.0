Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22A360EED
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704458; cv=pass; b=H4VTfvLVgjHEVkYTyVzVnSdZmpCkYF2hUJHI5qEezS3RODNNlTA2G17SdWtnRzP2dDuA3yQVwx3Ce5TMCktBUAvDZNU4ggPqcbBe95bRw6etXLPKTLX4OtO6QSv+URtHK5HvGTSSYQHwTiLtPqtaHIehS8qsTV27jLO1eKyAQ0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704458; c=relaxed/simple;
	bh=QqaIYA8X3X6Tew9rng99hk3rmPCslU/eWwD53qMGzFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRJndSIKAIqmM9iyokNuOaNdCBfk4G601cIPRvguc0lG3FZGFcRZxkKq35byWZqfv+JkHzpLibnlZ+hkJImwWay0FkY+8qbVIWB4M4m1b+vog5NbIfK0zmnOwfep9UQ7XS8GdyzrfCK1aKGRGxMj3p5Cdduec//DnWCd5dudtis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AD9fcV9D; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AD9fcV9D"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8b6dd874471so94179346d6.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 13:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778704455; cv=none;
        d=google.com; s=arc-20240605;
        b=hsFC1QfKjNEPFyD3cTbdj9TIuuOTHeZ6H62cMtwpoX9Z3NZliquzQIIt31HD6uGmjo
         wYGdlbp0496L+2pF2pPFF3jBIl+bdmNAC6sLYo3IK3OE3xycpY+5hSomW7oPxybmWIRc
         HydDaI0L77DaMBUtKI4BL2jYw4GcYZ/4NffuB2Fvtwy/X5mGAFRnlCB7WyNLW/iM2y2a
         BIr8G0Z8LvM9Lv8ikLrGK2V8gx70iKfptRFoOABQXHNz/y24IzBN2IDhaOSww/8vMP1a
         QGyY3gdOnZvRjWI6d5e1T5Bm4QBx4jFkD15rEbIUl2OWLh9L5KlJeus+RoJt9iKYZPA9
         rPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=;
        fh=WCcUwLYFpyPKVqs211CnDPJ2pQKRuP5YsrC4dWO0hx4=;
        b=X6IowdfXdriQcFk7Hpbr27SrHCSB+m6ShPt2+AMLZCha8u3oAmcabzyZ9D9npb3eMF
         IUbcV/tpnZWprPqwQTxlCLcILeteNwgaD62WhdJp6TX1cXF8ByXSY2LxkKL1XbEb6lEG
         gqfkBV6JRx1Sh8lUxXG6t+kpbDxMbqgon2QaP5gRMmNNaNUzydap0Q1Gn1X7/QtMIkxs
         9B+Sa5dq70iSlRpjHrVR+bk4OFvDOJyPbKQ9Jnpvnv1eAt8V76GAzE77ixNbaXo33VrE
         uVwE7KKjqRP4CyqKIZ5DjDrHj8JKa1ZoGJ881EahEpmCf63KVO3F208jQ2ht+DKl9VYn
         dvQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778704455; x=1779309255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=;
        b=AD9fcV9DHYgDCefhJ2zSXZDp5IsgxaGD+U0MOWxRyeVB9HxtlwiRupMCngACCv3gN3
         DM2QnrQXjV+sYmnB7buk4J5Dt6tGrh1OPZBWVQB8b9fCQmOKih3ywWgVh1komLd2T6S9
         Iw0vFCUrddNFBUe65lmXniDofheSzrnXitWFheF975H4HOv5OAkzK3mkvFZBQzbbEFO5
         3CBUV04Gi5ikM28vxU2ZcJDeIaaPgXBzn1SOf42ImQdPsuYoVzWX98ke8U7+4SKfTYHq
         rgiLecCrmAZpjPBD/RK6amLrzQARySCD79r299h/pV/nX/61R2SXk8dj58MY+M4wHe8N
         AnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778704455; x=1779309255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YffvRc4ueiaHAv5vxRd/K/yTD1qBPNZn3LhENW3N4xg=;
        b=flBCawcbhcFq9sbTrbev3y7NDGEL+EUSesrStui9zDU07DO0ueduFy9c7skAhbhrJL
         qRSRZ8a6Zfds2v3kU6gXGxiMewx5b9cmTVjYBIZZ0gHlV/ExXcdktqcofWx3cM/OBvrw
         FxMMNUyPaliozX/jqvyN7ljOXB5uYJmYjr2s0uol/RpbSs2sFcYcfdBmzWP2cyc6DWVc
         XYjamJNlh7irQklkTOs00uTkru6HgLjiSJxYn69uGXtriJNzGTFR4NVUsTNcuKM2Y8uq
         HWUuHEfGGmf/FIG7rn45drlbIfXvkPPBROyEB9luIe83C17b4n04kZkNlrPNyA+BFSsW
         WeaQ==
X-Forwarded-Encrypted: i=1; AFNElJ87JXcS4qnalSuUApYG6BmngSutYhTNC5fSn/DEBQyjurkAozNzrEwAsBn8in7A1g6PqS5uOUQSOl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4gQ7oz/3s46Sj2GrkShVqlRtfrZ+XlbBaukao1qFrNDpI28D
	5XDtcEYFDI/p+OAAtmDXMH411jkoqXKVTGk7y5WTpraJrT1NxJbbjtPZ+FDswLQFcrqkUSOUQZA
	3cn/yLZyOC9DeJXNlP5h3milFMs1ufAc=
X-Gm-Gg: Acq92OELaAiyr8/RPHJIAqHnMk3YVYOTo1MEg3+zMd1k6Qmoxt0SqA0uNmwBle9ifmL
	3fUGE1zdRJ0yQ/08z7a4EKB1uKJLfmFG6+FWooDV7df3KdX5n/KIlQw+mKtyUYkNdxF0FUOH1Nj
	oQCRK12cwvKF7K1qQUNLb9Ee1WnLlDC17VjKXe6OPAyw2NjNPWRiQoUjeoLuA4oA/Xq409w9Ixg
	qUMnV1dN+uKo1icCaSM/meY+rzgqxT760hGH688o6qIsFPXtool6l+Yf8GFdT+ZONRE1JpfUiXJ
	uIrBd8Gbzr3LLeq974+Gnqo9DuqqciekO/hvEL2JadO/c26T7EimO1Xf7qkuwJQrghSNwk7m97e
	o+aN28fgk2+g1BzQ/+LufGEp27bjaUGaEliBzZRDcnO4GcMoBZbFaaDMsw5iFMEr8FrI9Y/7UcY
	WBa4vjBJIssCQD8OdNG0gfTQ==
X-Received: by 2002:a05:6214:8009:b0:8a0:846e:8850 with SMTP id
 6a1803df08f44-8c7b9d6a34dmr79395336d6.20.1778704455206; Wed, 13 May 2026
 13:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
In-Reply-To: <20260512053625.2950900-1-hch@lst.de>
From: Steve French <smfrench@gmail.com>
Date: Wed, 13 May 2026 15:34:03 -0500
X-Gm-Features: AVHnY4LdSaGvyovg6RvG5pKhPWnEZkoZnNgrzQdw3V-htIBym1ah9EOHikjxM8Q
Message-ID: <CAH2r5msnYVb3hhXHwqDVHGGC1h4E6mLCRS4ktCrQoD9zdUW81g@mail.gmail.com>
Subject: Re: improve the swap_activate interface
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just tried this on 7.1-rc3 with the swap patches (full kernel build,
on Ubuntu 25,10) and boot failed with out of memory which I had never
seen before.  Any idea how to workaround this with the swap patch
series, or is there a fix for this in the swap series already?

On Tue, May 12, 2026 at 12:41=E2=80=AFAM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Hi all,
>
> Darrick recently posted iomap support for fuse-iomap, which was trivial
> but a bit ugly, which triggered me into looking how this could be done
> in a cleaner way.  The result of that is this fairly big series that
> reworks how the MM code calls into the file system to activate swap
> files to make it much cleaner and easier to use.
>
> I've tested this with swap devices manually, and using the swap tests
> in xfstests on btrfs, ext3, ext4, f2fs and xfs to exercise the different
> implementation.  Out of those all passed, but f2fs actually notruns all
> tests even in the baseline as it requires special preparation for
> swapfiles which never got wired up in xfstests.
>
> Diffstat:
>  Documentation/filesystems/iomap/operations.rst |    3
>  Documentation/filesystems/locking.rst          |   35 +--
>  Documentation/filesystems/vfs.rst              |   40 ++--
>  block/fops.c                                   |   15 +
>  fs/btrfs/btrfs_inode.h                         |    3
>  fs/btrfs/file.c                                |    4
>  fs/btrfs/inode.c                               |   72 -------
>  fs/ext4/file.c                                 |    6
>  fs/ext4/inode.c                                |   11 -
>  fs/f2fs/data.c                                 |   50 -----
>  fs/f2fs/f2fs.h                                 |    2
>  fs/f2fs/file.c                                 |    4
>  fs/iomap/swapfile.c                            |  165 +++---------------
>  fs/nfs/direct.c                                |    1
>  fs/nfs/file.c                                  |   21 --
>  fs/nfs/nfs4file.c                              |    3
>  fs/ntfs/aops.c                                 |    8
>  fs/ntfs/file.c                                 |    6
>  fs/smb/client/cifsfs.c                         |   18 +
>  fs/smb/client/cifsfs.h                         |    3
>  fs/smb/client/file.c                           |   16 -
>  fs/xfs/xfs_aops.c                              |   48 -----
>  fs/xfs/xfs_file.c                              |   39 ++++
>  fs/zonefs/file.c                               |   30 +--
>  include/linux/fs.h                             |   11 -
>  include/linux/iomap.h                          |    5
>  include/linux/nfs_fs.h                         |    3
>  include/linux/swap.h                           |  129 +-------------
>  mm/page_io.c                                   |   45 ----
>  mm/swap.h                                      |   92 ++++++++++
>  mm/swapfile.c                                  |  227 ++++++++++++++----=
-------
>  31 files changed, 471 insertions(+), 644 deletions(-)
>


--=20
Thanks,

Steve
