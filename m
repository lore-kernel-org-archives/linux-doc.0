Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D714A0B9
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453875; cv=none; b=sjt8r+iPF04fXSnc2IwfPn7W2kRux76+oJrKuu78J3PavmqOOdaK6gj4RYKIF+hE6jykAgpNfRFZ8yawIrMgG0DX+taxyHZE6ua9F+dVjGLNgoTcrJd4gW1nBdKlEZIXQ6xLAhm0gIFeD8NFBUpzTJ+XENaVwEtXcADG7x2cSnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453875; c=relaxed/simple;
	bh=IddbzDZ5HWjh54mxeeaNAxq+2x7hRqa/vsPy99xpzJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyPKf7qy5y77uFfChv9pp2XIT/P/1J8R5HX2p4NSZAnUCV+VeyyL++Z8nLogO7nrvcQwhcgTk5NUyZJQDZaNRQRlHn19Bco57NjsTo/PdSwCAU2VVF/3aDOVD8pF7lfw1AhP+rGtUM02AmHxiRWeH86Bf8cZgUAPSEOhgAK+oSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bF78MDLf; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bF78MDLf"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6efea3c9e6eso40011937b3.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1734453872; x=1735058672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2RqZ1iTuiwe0w1Bq33bMFV9IQegQcbvuONqKrlBbjo=;
        b=bF78MDLfSbxA5wMJtBKdDDLy90Z0PpC5W4LX9Y6mgvw/mEE5mqCMPNhO1lULrT1IAi
         v8AkdgOtPFko9HOoG8rXNdYiONd+5SR7WqI57KROLC088cazPOV3IvYl4vPB2q0dYZpA
         Y35WWrmxIR+7yrumUnmJYNjase+32G9AEa4zsLlGdDETmGDEAX2SPfdMPTC4VaofrqNL
         hZeiWVFtEi4x/r5xlhmqiWVMlOSPI5pu8W4xqLx+mDC6iX8nSM8hn7p2Xuq4rR3TRV4B
         /dlMyFl8I6pfeEeJiDbAzcaRKfSjfSKx0QH4/+J7HkztgCwe9CnJQo3omlSWM5VGq4FT
         xCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453872; x=1735058672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2RqZ1iTuiwe0w1Bq33bMFV9IQegQcbvuONqKrlBbjo=;
        b=jQDHOVTtcAOHplvkf1XOoWIaUYMU7+wtKB0wL6d/m077YVfaUppMMSxmplvUYGMYYU
         Md8mquBJ9pE9GUbh0h1PHGgw1yEzRzFLmcGDrMt/DNBhnYGYbOB7CZfanmwe8q+Z2MaW
         fLYUM/FjnfdLjxZI0F8j2URRCgFvg+yP2J6ddyC75/1rw8Lf14841xoNDtobzmAa34fK
         7zqyFDzoEHSyoQUmOFhUrMMB7BkCyJ4cqWC0tAhOWYqGRTOKFBr3RgPNM1wCCavpi18q
         x/h4W4jZWuLJcYnkY2au17Ql4HgZ/NCqp25Lrc2RyZrmX3+ofqDwdpiVUIy0Rv+49vKk
         30Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVk+J4K3YYGWZ9N6a3PcAzZnbElwErDSlo16B9+DrhG5+LGfDyIdfJ7SbxJ/Q6z6SV28CDp26e1UIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkOHglVw0Nq1xj8ULzafu6cOou7BsKqpXc12CVXPrCVeCLT/+
	oj9MPdGHKVknUaDMCIA+3ApfQdUF/mZI+O2/G5Vp/g+6lSg5PrlMiWAdz/ScvlTB7kTf8n8UvEg
	LKCy0ZsYNRzAVprQt4RKdEJrL2Ufej17Alw2V
X-Gm-Gg: ASbGncs+TjfVv2JndiQWVq5RVnCVUtXyHt2fn/zfDLCpAbzwnwdKRhN4tUb1Ah+nJoF
	lDmsrAd+KSoroG3KhWLgXPyzO3xE5adq1VmsZ
X-Google-Smtp-Source: AGHT+IHzqcrxGq0lg+OZOnITp7xku/OCQjSoNpcPMUQryKBaUP5W83erdFqKWvmsUKKSg0Lo+y4IN41xlRpasiS2KwE=
X-Received: by 2002:a05:6902:160b:b0:e38:7d0d:d7df with SMTP id
 3f1490d57ef6-e5300052ff3mr4121093276.50.1734453872299; Tue, 17 Dec 2024
 08:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216234308.1326841-1-song@kernel.org> <CAHC9VhSu4gJYWgHqvt7a_C_rr3yaubDdvxtHdw0=3wPdP+QbbA@mail.gmail.com>
 <CAPhsuW4e8xcmZj_qrONSsC8SDrtNaqjeFgPRo=NE9MDiApQkvw@mail.gmail.com>
In-Reply-To: <CAPhsuW4e8xcmZj_qrONSsC8SDrtNaqjeFgPRo=NE9MDiApQkvw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Dec 2024 11:44:21 -0500
Message-ID: <CAHC9VhQgS1n5RJxFmVxohng9UL_Wi6x_0MOaPAeiFTFsUxZd0A@mail.gmail.com>
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

On Mon, Dec 16, 2024 at 8:24=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> On Mon, Dec 16, 2024 at 4:22=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > On Mon, Dec 16, 2024 at 6:43=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > inode->i_security needes to be freed from RCU callback. A rcu_head wa=
s
> > > added to i_security to call the RCU callback. However, since struct i=
node
> > > already has i_rcu, the extra rcu_head is wasteful. Specifically, when=
 any
> > > LSM uses i_security, a rcu_head (two pointers) is allocated for each
> > > inode.
> > >
> > > Add security_inode_free_rcu() to i_callback to free i_security so tha=
t
> > > a rcu_head is saved for each inode. Special care are needed for file
> > > systems that provide a destroy_inode() callback, but not a free_inode=
()
> > > callback. Specifically, the following logic are added to handle such
> > > cases:
> > >
> > >  - XFS recycles inode after destroy_inode. The inodes are freed from
> > >    recycle logic. Let xfs_inode_free_callback() and xfs_inode_alloc()
> > >    call security_inode_free_rcu() before freeing the inode.
> > >  - Let pipe free inode from a RCU callback.
> > >  - Let btrfs-test free inode from a RCU callback.
> >
> > If I recall correctly, historically the vfs devs have pushed back on
> > filesystem specific changes such as this, requiring LSM hooks to
> > operate at the VFS layer unless there was absolutely no other choice.
> >
> > From a LSM perspective I'm also a little concerned that this approach
> > is too reliant on individual filesystems doing the right thing with
> > respect to LSM hooks which I worry will result in some ugly bugs in
> > the future.
>
> Totally agree with the concerns. However, given the savings is quite
> significant (saving two pointers per inode), I think the it may justify
> the extra effort to maintain the logic. Note that, some LSMs are
> enabled in most systems and cannot be easily disabled, so I am
> assuming most systems will see the savings.

I suggest trying to find a solution that is not as fragile in the face
of cross subsystem changes and ideally also limits the number of times
the LSM calls must be made in individual filesystems.

--=20
paul-moore.com
