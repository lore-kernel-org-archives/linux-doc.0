Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C439934C
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127431; cv=none; b=Kecg6nTGUA/j5NX1R/9FUG6iwddrFCs0xOopCRHf3wHJbabcxeljxXsaHQO9VfOcQvA80yQnfgCxhHvz3te/Q2sNjN467VgqbhSNdeAkfiF+ZWkatQX9chat6XE7vY5IrRu3d8jKVugxN5RzFHXNpwhgdPRIrXqf5WERGK+zl2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127431; c=relaxed/simple;
	bh=cO02jLM/sX3PxApH0smnLkC73bA09isiSv76kmh21do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mM/ZW1otPjk7FbUoaYVWh+KSIZ+E+7adEDSZ9MGLkdyiaOj7sm73ixomc3LGTiwVaRh5z75K2Nx2VhMosaf30Anyl4VqBwgzpbDD8/Gs+kxOirdl04Ya5qbAZu9hEp2K0uhM0izbv6lT2JlvUzUyJO1VoSCrzVgfWYAjEJb5zTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=KblrSsBX; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="KblrSsBX"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4865b9e16d4so1541151b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1782127428; x=1782732228; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cO02jLM/sX3PxApH0smnLkC73bA09isiSv76kmh21do=;
        b=KblrSsBXtafZ1DBp8YYJIPsqO89QH+yxCrcaFuxVjXq23msNMPqpIugz9OoGNZ6twO
         xHc/MO79RKMKyqGzgBey1AO+xzSxDo0fT0pSYnikmIMdfMlvW8cYEMGKF2yNP5qjSBbe
         sRNd01qcZTp08aN04bJW6bTfNGfcnUs/YLUYfpq9aezuOegZ1KLY73Lyp8UVWbnRRJlS
         l6HZR8HHjyNHM2Rjk3Mfa0UTaUoKkKwnwwb7lK4gh4llNcSHjTobynHr4sUzIViUFCMH
         yLZsDjI+I4IM6FI92lvI6arIjjO8Zv9hj7LXQ/u+TnFhfPxVo7tObmrjFJAgjjPNpOLW
         Pl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782127428; x=1782732228;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cO02jLM/sX3PxApH0smnLkC73bA09isiSv76kmh21do=;
        b=IWnCR9tY75lFCmbvRNzJYsoxmCFDdjALyKA7YT0gXCNK2p7ceiqo8KTz+v1LylvETU
         IfN6fV75Wy0I4sD5M1Q8s0GEdc0Spe5wgr64asy9JZzmSCVN2IEaP3Pgx3CxK7PR8Dcz
         DNF37sGSesFfHTUT47jzPKlsiSK6uTetAOcZb9wfsRJizaq6o2QGAHiOiYmv7ZyhUuRM
         oMuV6to6a2pX3bok5JQ+Y+kRmUahtGKtMY4n0Rc7GuPMvpSvDhCmvwW2fwuuHda2oOXJ
         dfSzGGfLT+Tae6nuUpEyUnXBMZUjl3Fu5SqOSDJpKBe4QgjCP2n9ZXiSBZoQgM0nJJa3
         2MLw==
X-Forwarded-Encrypted: i=1; AFNElJ+4Omi4nEW226tJnUsSY1mlUIXPP+WiPS3kmTX/EYytEeUCG/fxaDTmLVuanF4G2cEvjIB2unGwUtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/oUPtmXM54QLszVkKvwe43MmEvksd6KF6OMIy9kN6luYNK994
	z3GU44matuIxtBnpZCTKJQdgOy4QkPjYKhc7cMfgoxR3aY5kv9yzCpitxv1gzNXiIq0=
X-Gm-Gg: AfdE7clIKjDayLXXty05NEGiNy69qAH/KQy3IOmk/9K8Khw7mCelrQww+cKqGr196ee
	g4J3BZg5wEKX57r8NSezA7OTMYuz55FSu52hNaVFVrZQGtXFeflKKDcXk0TQLUnyCx0smhjez2D
	041Em6BdMI9R2GrAh9GTkZWrGIgp9p5SK1gBXaqZU+80e5KD/AY4b+3s/YFiRB2blRbSwqN983C
	AqzcTYzqgg81ouyuIUSYi/Z2B2Oe1YiWlbD3Hf2simov+bv+jQUmJbZBCvTtsMBke2CeIIfOr0I
	EWetcCGeqdsNAugVayWRYTn4Ij7shdFCTg85vfdWTK1P7kfEKOvzCKqNdEt0HcfjayDfu+HQXl8
	44Swjp3/qGJQJEgx4yqH6EwR1rn8RiLwlS5/LywtDpn3bC4fj1pONuTObcJi8Lrnf3yZysTatJw
	ohQNKzWFWMbC3fx/AEhe7S55myr082hpy5FyLhuu8fdrE=
X-Received: by 2002:a05:6808:1717:b0:48b:1e49:24a8 with SMTP id 5614622812f47-48b1e493095mr7671785b6e.11.1782127427953;
        Mon, 22 Jun 2026 04:23:47 -0700 (PDT)
Received: from [192.168.254.51] ([66.97.168.37])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aec0e5e53sm4403466b6e.8.2026.06.22.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:23:46 -0700 (PDT)
From: Benjamin Coddington <ben.coddington@hammerspace.com>
X-Google-Original-From: Benjamin Coddington <bcodding@hammerspace.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] nfs: remove the fileid field from struct nfs_inode
Date: Mon, 22 Jun 2026 07:23:44 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <343F5ECC-7662-4301-8D89-ED039594EFF0@hammerspace.com>
In-Reply-To: <20260512-nfsino-v1-0-284720522f4c@kernel.org>
References: <20260512-nfsino-v1-0-284720522f4c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 12 May 2026, at 12:12, Jeff Layton wrote:

> v7.1-rc1 contains patches to make inode->i_ino to be a u64. With this
> change, there is no need to keep a separate "fileid" field in struct
> nfs_inode.
>
> This patchset eliminiates that field, and the inode number hashing
> machinery that is no longer needed. This shaves 8 bytes off of each
> nfs_inode.
>
> Trond/Anna: please consider this for v7.2.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good,
Reviewed-by: Benjamin Coddington <bcodding@hammerspace.com>

Ben
