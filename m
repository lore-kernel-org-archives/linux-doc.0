Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587BC3CB544
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 19:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487316; cv=none; b=W2Y9O9JuaOx2/cUbia2UPuBfEKVflA+E7QwcNgL4cv5Vu+azmKRDYKpV9iFjHw2AOAQZYD5ncwjx0AnXpBnzqdFTBftK0VQaR69BOXBJUtSUGtEFZ6li+L1CO9V5uj6xDvON+SIfODx8gbwvK89RYsjYdN5MKqAC90kTweP7+yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487316; c=relaxed/simple;
	bh=VpekPW+lER9wN5l4mPLLCT96aosom/Cgc2osOvqOym0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfgweHg7141o0SLzA6+lGIdwwZD967/Yn8RDT2TbSgGv3hKkGSvx2+PMHVWGjC3TERcmAUYhcciLvIbS5GLo0TQjaGl19q5UZn3V1WHzBgmTRSMjWFFSi7tpgKm9aoPZZVebzKFw5ahUZRbeTMvwiEv4Txnm3jJQobQCWE3VXIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z425sjj6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z425sjj6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2217507a91.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 12:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487314; x=1792092114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hyWGN8x92BFhClfZ4tQgIWkJPd/YlyiaqFtPEUdqMkg=;
        b=Z425sjj6z0aZOL+gNs6rZhChu94+xR68lKMIRPzr7bUKpW8AkrFYG958WRZPQEhJmc
         yCC5571oK04ZvaKBPg/15c4HPSmuforOChkzKpfXS6XKoEARqru07o+6A55DjSMRMWql
         /kXLvHLd10bZCKKYxmeEBNmtwRs7aFFVFVRXPzKjkdnVxgdUBok+BLJhLwzLLZXYIcKs
         obWXJWWq+q/W12TXWeleumDX0sFUldxGzIG0aoG8KmT4setvMAMaQIef17efw0XJSdoj
         9aQft9tUlqt1HfpItSRGFDprtTdCU3ucNOHMxWWgJIJwZ1Y09waQVJ6j4fl71HzVMYYP
         7d0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487314; x=1792092114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyWGN8x92BFhClfZ4tQgIWkJPd/YlyiaqFtPEUdqMkg=;
        b=hb6FVeo8Oy3ZiBvH+tozYy74RDt7rFGdZUnk+h4pC/x0FrAJ/350EyRkcnoEMk3TJT
         303txDy/H/O8BY7SShE/+JVv3k5hoAg/QHubIR5sTZdCaRaH35yMHP9MrjTPmQEYFNDJ
         0SFeqLarOcdbZ6rxshNfd1PlQMM5wmwuytMq1Km9bSYmJt3B0XVYN1za0eI/sDmtmBOm
         hDcGyZ7gU0PSItenUUOrOhhRWry+XfnF+E99A1tjOHyve+DnLMgjuqFgvBBBPaQUEHt6
         9YCTX+wvP0sBJqw3t+ZynPsDkN+W+QUve6BK/QVJk5UNSZ2EVkCFhaNSIq/Z42qtm4Ze
         xMew==
X-Forwarded-Encrypted: i=1; AKwUvBzQSBGbBY/CLaDjvfGqX7CjbVEMwpNH0DCoi8stVaC6GXd9X6TR4n5z0IBC7xu1+4j5ef/3ksPmV6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+H/VeadnHBkYys1/+v/qu/wgxa3d0GjuIs/FQcWvAfEqcwmu/
	oZ8dRPrMtKk4FxUh19j9msnUkJkap38h0tRBcy0W78Kql0flAP6dZU/m
X-Gm-Gg: AYBFou0qD4ti8IhFG0CtbQYstEaXMSkUz8x3bP7JWbv69sf8K9N9bwHVJKsg5UpiNCo
	HeU9JXuvV+frKQ1Z5l0tkfP+OKQdOIFHUXgPsLrggs6SjQQ+cWdTyK+t5PhUcbNA4MdoJidZ9b+
	DLc3hDDcHMgBpM+q+KA64LkKiyx1Dj2l+/8vZfg21TZEDIA0hKLS9k6jTwDlXJJKJrarAhNyfpT
	+llaspgMVqDAbh0J0svVNyq04FxCN1RsfWWF7xItvIcj/BldUi7BTlM9P+T2HpevEBDUCocETFB
	HZd3d/qfE9PbmEn8pEuR/ZkJXMOvi1bi+j9DVuXYlZmasvIMCl5L4hf7SzqCf5/3q6D6AdZIAlZ
	qhSKNNIMJqjCcqBO3vRPF7xlx8qKLBGzmd5cpInyNjR5VpVZmpMC6huVpbLn2qatiXJ7z00rJsv
	4yOeXPf85wkBXTR1uySZvDKUNbokCZXQwVXm0aM0fWgq1Oe2DGZsrqLeuYaWYMRfbxjH7xhMJCL
	A==
X-Received: by 2002:a17:90b:3bc7:b0:3ab:22fe:b142 with SMTP id 98e67ed59e1d1-3ab22fecf9fmr1055731a91.1.1791487313011;
        Thu, 08 Oct 2026 12:21:53 -0700 (PDT)
Received: from skinsburskii ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm74973a91.4.2026.10.08.12.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:21:52 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:21:50 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fuse: add negotiated per-inode open and release
 suppression
Message-ID: <asftTiSldKhdNEYA@skinsburskii>
References: <20261008-fuse-per-inode-no-open-v2-0-39c60fe97728@gmail.com>
 <20261008-fuse-per-inode-no-open-v2-1-39c60fe97728@gmail.com>
 <2621089d-f087-4b0d-89bf-3cd1218b5f66@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2621089d-f087-4b0d-89bf-3cd1218b5f66@infradead.org>

On Thu, Oct 08, 2026 at 11:17:46AM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 10/8/26 11:06 AM, Stanislav Kinsburskii wrote:
> > Filesystems serving cached content may not need per-open state for most
> > inodes, while still relying on OPEN for control files. The connection-wide
> > no-open behavior selected by ENOSYS cannot express this distinction.
> > 
> > Add FUSE_PER_INODE_NO_OPEN to INIT negotiation and FUSE_ATTR_NO_OPEN to
> > inode attributes. For marked inodes, use the existing zero-handle defaults
> > and normally omit OPEN/OPENDIR and the corresponding RELEASE/RELEASEDIR.
> > Remember whether each handle was opened locally, so later attribute updates
> > do not determine the release behavior of existing handles.
> > 
> > Retain RELEASE after a successful remote flock operation, even when OPEN
> > was skipped, so FUSE_RELEASE_FLOCK_UNLOCK can clean up server-side locks.
> > Servers negotiating remote flock must accept this RELEASE with a zero file
> > handle and no preceding OPEN, including after an explicit unlock.
> > 
> > Keep the release argument allocation for regular files, which pins the
> > inode while asynchronous I/O completes. Honor the hint for internal opens
> > used by file-attribute ioctls as well. The capability check excludes CUSE
> > before accessing its non-FUSE inode as a fuse_inode.
> > 
> > The per-inode hint does not suppress OPEN for atomic O_TRUNC, since the
> > server must perform the truncation. CREATE retains its existing handle
> > lifecycle. Connection-wide no-open/no-opendir behavior selected by ENOSYS
> > continues to take precedence.
> > 
> > Update the cached hint from LOOKUP, GETATTR, SETATTR and READDIRPLUS
> > attributes. Preserve it across STATX replies, which do not carry
> > fuse_attr.flags.
> > 
> > Document negotiation, cache and handle semantics, and the server's
> > responsibilities. No additional access-time or open-reference accounting
> > is introduced.
> > 
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > ---
> >  Documentation/filesystems/fuse/fuse-no-open.rst | 49 +++++++++++++++++++++++++
> >  Documentation/filesystems/fuse/index.rst        |  1 +
> >  fs/fuse/file.c                                  | 26 ++++++++++---
> >  fs/fuse/fuse_i.h                                | 17 ++++++++-
> >  fs/fuse/inode.c                                 |  9 +++++
> >  fs/fuse/ioctl.c                                 |  3 +-
> >  include/uapi/linux/fuse.h                       | 13 ++++++-
> >  7 files changed, 110 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/fuse/fuse-no-open.rst b/Documentation/filesystems/fuse/fuse-no-open.rst
> > new file mode 100644
> > index 000000000000..4526512d358c
> > --- /dev/null
> > +++ b/Documentation/filesystems/fuse/fuse-no-open.rst
> > @@ -0,0 +1,49 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Per-inode open suppression
> > +=========================
> 
> Documentation/filesystems/fuse/fuse-no-open.rst:4: WARNING: Title underline too short.
> 
> Per-inode open suppression
> ========================= [docutils]
> 

Addresed in v3.

Thank you,
Stanislav

> > +
> > +A filesystem can avoid OPEN and RELEASE requests for individual inodes by
> > +negotiating FUSE_PER_INODE_NO_OPEN in INIT and setting FUSE_ATTR_NO_OPEN in
> > +``fuse_attr.flags``.  For directories, the flag suppresses OPENDIR and
> > +RELEASEDIR instead.  This allows, for example, cached content files to avoid
> > +open round trips while control files on the same connection retain their
> > +open handlers.  Without the negotiated capability the attribute is ignored.
> > +
> > +The kernel updates the hint when it accepts attributes in replies such as
> > +LOOKUP, GETATTR, SETATTR and READDIRPLUS.  STATX replies do not carry
> > +``fuse_attr.flags`` and leave the hint unchanged.  The hint is cached inode
> > +state; it is not independently revalidated on every open.  A server changing
> > +the hint must arrange for fresh attributes to reach the kernel and tolerate
> > +concurrent opens using the previous value.
> > +
> > +For an open served locally, the file handle is zero, FOPEN_KEEP_CACHE is
> > +set, and directories also have FOPEN_CACHE_DIR set.  Subsequent requests
> > +identify the object by the node ID and may carry a zero file handle.  The
> > +server must support these requests without per-open state.  Whether OPEN was
> > +sent is recorded for each handle and is not changed by later attribute
> > +updates.  An existing server-opened handle still receives its matching
> > +RELEASE if the inode hint subsequently becomes set.
> > +
> > +Remote flock locking is an exception to RELEASE suppression.  When
> > +FUSE_FLOCK_LOCKS is negotiated and a handle has successfully performed a
> > +server-side flock operation, its final close sends RELEASE with
> > +FUSE_RELEASE_FLOCK_UNLOCK and the lock owner, even if OPEN was suppressed.
> > +The server must accept this RELEASE with a zero file handle and no preceding
> > +OPEN, and use the node ID and lock owner to remove any remaining flock locks.
> > +This also applies after an explicit unlock, since the kernel records whether
> > +a flock operation succeeded rather than tracking the server's current locks.
> > +
> > +When FUSE_ATOMIC_O_TRUNC is negotiated, an open with O_TRUNC still sends
> > +OPEN and receives a matching RELEASE, so the server can perform truncation.
> > +CREATE also retains its usual open and release semantics.  Connection-wide
> > +no-open behavior selected by an ENOSYS response continues to take precedence.
> > +
> > +The hint does not make an inode immutable, grant permissions, or suppress
> > +other operations such as FLUSH, FSYNC, locking or data I/O.  Servers supporting
> > +remote flock must implement the RELEASE cleanup described above.  A server must
> > +only set it when its access policy and file semantics permit the default
> > +open behavior described above.  Servers needing per-open authorization,
> > +nonzero handles, direct I/O, passthrough or other OPEN reply flags must keep
> > +handling OPEN for those inodes.  No additional access-time or open-reference
> > +accounting is performed by this feature.
> 
> 
> -- 
> ~Randy
> 
