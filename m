Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D648C0B
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 00:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734394935; cv=none; b=XKLdGydrjoD71+kpfPqEcJl5H9Ico3xPjiCdk3EBwQ3IetAuLXObYMCV2ICtUJvs9DOABGg7fz/q5sS7877HzB+IeI8zIhLYegVKM06tkvxvyrmnlmPSofgVemPY0VO1wtNz3/+rDN3AUY0vmDGKsdnxBgpX5jK44n7bjG1mkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734394935; c=relaxed/simple;
	bh=mZ7KBxRiNIDejZVpUVQ6nlPgNNXf0zptNyEy5l+UnBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gscuqHxaN8qzf7a4+lLVveerFiAhfMiBxEibzEZmlqSksaWd8h8UU2ITOZ9CNo2DwUQeyE/2N8BBRPiEYnaANr8qFQEAiN+5EBifUqUDmiSfvqEc6WSWm1GGwAvCZLaQxQPQ0ux6oVCtU/SlDc4NXsNfvELzFxyGRNx6ibx9Qjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZUtbvR7P; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZUtbvR7P"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e387ad7abdaso3588578276.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 16:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1734394931; x=1734999731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71UboNKp8PBgSM3OXXE6el32SNwss2VOEFU3BrAALk0=;
        b=ZUtbvR7POJzs9AMT/ZxyccuYJWBODImPREZFWPi03Z5mV9bDqC6NUA5V/OPUvk+W6t
         VpAaVnfBDy7rgwHdBoCnK0jjZKH5tRdClFIsdessEWfEgVb7cnDyhbnGU4gTYBf465Mr
         eKoEQU77hFpzBLRElM9+AKvusZM25SkBpIMLI4Rw+Y+HgjdodPrpxpxb2r2+m/FdjoBp
         SN7q4j87wN8UmWasJn5aWMrx+TVYKxNX6T4h0TPH09/aLsSvo4LsyOUv1ViF2Zb++/le
         JJG/adDh1hMN8rauQle9yCgrMHO5yZcTcIcay/gMbn9AMRmWVxTGLRC4zDdrY5zfpFZx
         +k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734394931; x=1734999731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71UboNKp8PBgSM3OXXE6el32SNwss2VOEFU3BrAALk0=;
        b=ZtCFNJwq9fMXbmbEW+I8jtZQ6+psHOnsZTKMljo6o0hsthZS/gQwfEIf9zLTq1C3C6
         digSFKF29iwH5QTaDa+r5LAoqHhSZXJBii8kULmX37ceObi3xkCb38oFB/VqOK4lEg3E
         +y3FoQiaP82fOLUv5Oyh9fWekqy671xjH01gncKeF8N8bqjK+/tZF+n9rrEJOoP0Er7M
         SbiZ+vG0dpbDIlS2FLWIYQZH6n3dM4Kk4cIlpTCKbNAhOms/lVvZ2gEyDd8L6QnhI3Bf
         Sa6975k4Ph0xDrZan5Fa0v8WKg6/1pnsyIaR+DivS9QYleAhCkZIOPH/LlarS7eAHVyw
         8Ftg==
X-Forwarded-Encrypted: i=1; AJvYcCXvLmAtw10VSB4xy1e2C2EPzaN24emG9+Tkg+Ao0uug6g0+KvfACP/JAEBKMzBQbv27U1eZ+i6viHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0atUyFbMmCX7goST8IGVY+HyEOWDJxCZkff/g6QFEbzCo6JWC
	6u+mrx6P5zeFGaiNEG+9fhsg+Y8vuWFvHZJOP66EmP2DgMpg6EcXjG+HwhN8LSI+CS39qXrt14s
	1BF6pm4B2tfVmt/35/P2t7x3I9hXfioqp7gHs
X-Gm-Gg: ASbGncteS8u6Z7l8pFH4h2XWKczQbB5q23aPXv3GDKQ2x5/tmUSGMKXQzp8uP/DMI6y
	id1q8DAfUx8Tovk4h0Q96k2q210JQHKUDCCsX
X-Google-Smtp-Source: AGHT+IHf0wZhbh7sOURNOzivfR+3asRXLLCmwV8fbsWRDWFE4TZAL8JlZRQzwQgdHYf9FYWmcVo2zFP8s+2cEpINRbE=
X-Received: by 2002:a05:6902:2006:b0:e4d:89e9:6a7f with SMTP id
 3f1490d57ef6-e4d89e96f63mr5429340276.50.1734394931644; Mon, 16 Dec 2024
 16:22:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216234308.1326841-1-song@kernel.org>
In-Reply-To: <20241216234308.1326841-1-song@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Dec 2024 19:22:01 -0500
Message-ID: <CAHC9VhSu4gJYWgHqvt7a_C_rr3yaubDdvxtHdw0=3wPdP+QbbA@mail.gmail.com>
Subject: Re: [RFC] lsm: fs: Use i_callback to free i_security in RCU callback
To: Song Liu <song@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-security-module@vger.kernel.org, 
	willy@infradead.org, corbet@lwn.net, clm@fb.com, josef@toxicpanda.com, 
	dsterba@suse.com, brauner@kernel.org, jack@suse.cz, cem@kernel.org, 
	djwong@kernel.org, jmorris@namei.org, serge@hallyn.com, fdmanana@suse.com, 
	johannes.thumshirn@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 6:43=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> inode->i_security needes to be freed from RCU callback. A rcu_head was
> added to i_security to call the RCU callback. However, since struct inode
> already has i_rcu, the extra rcu_head is wasteful. Specifically, when any
> LSM uses i_security, a rcu_head (two pointers) is allocated for each
> inode.
>
> Add security_inode_free_rcu() to i_callback to free i_security so that
> a rcu_head is saved for each inode. Special care are needed for file
> systems that provide a destroy_inode() callback, but not a free_inode()
> callback. Specifically, the following logic are added to handle such
> cases:
>
>  - XFS recycles inode after destroy_inode. The inodes are freed from
>    recycle logic. Let xfs_inode_free_callback() and xfs_inode_alloc()
>    call security_inode_free_rcu() before freeing the inode.
>  - Let pipe free inode from a RCU callback.
>  - Let btrfs-test free inode from a RCU callback.

If I recall correctly, historically the vfs devs have pushed back on
filesystem specific changes such as this, requiring LSM hooks to
operate at the VFS layer unless there was absolutely no other choice.

From a LSM perspective I'm also a little concerned that this approach
is too reliant on individual filesystems doing the right thing with
respect to LSM hooks which I worry will result in some ugly bugs in
the future.

> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  Documentation/filesystems/vfs.rst |  8 ++++-
>  fs/btrfs/fs.h                     |  1 +
>  fs/btrfs/inode.c                  |  4 +++
>  fs/btrfs/tests/btrfs-tests.c      |  1 +
>  fs/inode.c                        |  2 ++
>  fs/pipe.c                         |  1 -
>  fs/xfs/xfs_icache.c               |  3 ++
>  include/linux/security.h          |  4 +++
>  security/security.c               | 49 +++++++++++++++++++------------
>  9 files changed, 53 insertions(+), 20 deletions(-)

--=20
paul-moore.com
