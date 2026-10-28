Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793228957;
	b=0vNRCSoT4wWVW8zWXndO9mC9TmOubwQhfHby40B2EQo5ZV3BLpv0R6JrWSr2nSZOD0C7
	 HChBulSauDu6PZe94ZiMCq92OzexBLcq79erC8C9SjavJ4qC6rkbzLMXFrFFa+WlFByBG
	 m4UYQFFSvx3t9zSw5d11WaBdQuffqeEkVirLKTG4pGwUVbgZu7RuochHmLu0higxSgBow
	 NIGkaZFwwd8YVnjTVGXaAcwRibo+7Vb+CO7CJ7HpDIkbjAOhfYe/2JI9bDy7CWGdTOXRg
	 fUuQyEo41kDdxiBRqJ0C4/hadZtZX4VpVlhUP+9OfXBphTQkiUgFZ8bB2r1a20PhNYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
	b=F/DnK1zCDHUf5CilIaYF9GZUXoQX/+rIKrLDW0phsvv/sOYtegdJ7qhWIArHgalRRv+B
	 ppGCyWc8FUVuQRAeLQBQ70QnzVEBtO3crBYaW0dvoISh+jqFC11+tCY6FclW50/jR7zSz
	 ol0dkPOgH9cCy7IZkNVTqicMRNe0Vdh9mcuWcvWSH8PlIy/uswf+AJfh/EZYGxXA/Homv
	 ewRPmHQSPxD+SAEY2phB5Yw8O6CwwYpWMbfhdR3z/Lc5sP3X3vEI29C3S6UXjUE2Rywq3
	 ZVw7lbUQQUkCRDZ8kuGpZDp1h79IBsSkzBcZzs8XcEGijxyeEar2LknRN1BUOBCrzRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LD13kIoF;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FDC606A31C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LD13kIoF
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1290974a91.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793228957; x=1793833757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
        b=LD13kIoF39wTxqw9o3IXuiCEF3PlE80ON1nRPtW981M0eQIQFG7esf/HPU0iVX9Bcl
         sfUAYs7fiMaAg2JtLNApz33JHHP+72/FcckuQobdxG60ySGLr+8q/wfUaM25AcV0VApQ
         QszL7Lhg5JUn6mrCU1nvRJ1kqQpb6rVbMDSjpIo7nFQ/MN27abrFiQ5HTW6RkWUNAve6
         MDaEvFgv2Eki0M/G7Al3k13DPPm+ArFUNczeX+KKl8m+i35Iukf2orv4xMQt6sn/QShU
         eOqXh9YcndUD4/vMIUHCoHBfCdyInOCrPBID84xAj3nSBIGUJpE9eKdVWjcP0zU/hkDX
         P33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228957; x=1793833757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5xA2wRJBQ07Qo768sQziuchQxKB2Cjd+x4z5GHdG10=;
        b=F+DMgWuORvfKJw65ybiNq/e3AnKam/b3myNJUqrsIOajyrFP4R1JkaEGAIiqqB6J8d
         VM/7GuJqk3Ev23ASpR6s4tHaXLGbSRB8PUop/tXBK7p83zDx6ZZutM9lgo1boDzxUF/b
         5fiWSXuw0OIE6SEnO6/xBZ6UBgynb8J2MKhQmH0UaTGLZBM2DLPI9rwai1j50+sUxrZX
         uiMZrSvUtBHuiiiZX1Lq/7RBo/+0cGR+ihrJTHBbdU8Mtnp7Mh1uG6toJWIQ62Q8cGfm
         sUMcbNmOhiI94Kbu0Z+oAm/98LCQDe1RmIc0Ep6mpSRYQrHJV1suuljm0SCHiJy93EDz
         ivlw==
X-Forwarded-Encrypted: i=1; AKwUvBzLUz70UPgu4vp4z7w2QIK3Qm04THc3GAjMGfV4uVN5MpHbbxJASYh84QPKU7/TbuML5M6Gos+MUYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYxrkN5eP8X1Nr1BtrQsPXTx8nggRmAJX4Tbk02KAm7r8gn/Oq
	laSJKm4qzDmZiqBCRzbZXQcwFCDr/5umylPGD5cXCGYZcn/dq0cF+XzE+mcoBE+vhA==
X-Gm-Gg: AYBFou1KNZ2Wa/fRZPCmTK/EBDSyvDTuRIYp1PQqzSngkMuJCmCPjTQ/bzBaHtEvzGC
	Q0vJIdNW8Bi+8HLZnHw83ABr0clFG//6+Olwpm3Wopbu9xp70ziTl+Bx+DswfRl+rPvi0g2c55B
	e5ftEKxzldLEgcm+ntyx4bMCgMTk/LUDrlN2Guc9uKCtOuy/0cAFme/slxkx1yhsRmls9gMK1bl
	74s3QJdDuXyiF3c/97eiwcDlS2uEtBIgQGeAdJt7G6as9z2pQQVdKoiEp65rrjcZ+kuJXoqKLyo
	vDJyedd3dB4pDHQ74TfiUBkf2rRGUfRA4C2rjMWBfi4ngqLJ4t36D0hYWAnZPk8eXPNBSDwIfUn
	ASk5gCSlCPqmQbPaL2XM/OQtiMsvFUPZ2Kr466X3Ijs31iZpnrZ3SH3KGY/IHfKHNORRMn+51BP
	hiG6nI5RBQfcIXFAoBjYwUwRK0/0yWvA1xa4W+nbcAthsps6AobkZq7tPi1vXup1jE3sVvi/EVi
	j++7KN+aCOOntt3u9e86iAa7xlHO69YXdm6BUHXv75029CzJ8bewU9n8ipGPaHB10XmYPQCkKDf
	5LtjXudW3514xYtUPV8p22sZqtxj+GJSwi2WSnPPo2i12Qil7O107p2HV85PCudLgA==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3ae58319f5amr2770048a91.57.1793228956133;
        Wed, 28 Oct 2026 16:09:16 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm1327770a91.11.2026.10.28.16.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:09:13 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:09:09 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auKAlcPN0Lt6Y3Wm@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-8-dmatlack@google.com>
 <179322496574.1894369.544573858973645958.b4-review@b4>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179322496574.1894369.544573858973645958.b4-review@b4>

On 2026-10-28 06:02 PM, Pasha Tatashin wrote:

> > +/*
> > + * Whether @inode is on the internal shmem mount, which is used by
> > + * shmem_file_setup() and thus by memfd_create().
> > + */
> > +bool shmem_inode_on_internal_mount(const struct inode *inode)
> > +{
> > +	return inode->i_sb == shm_mnt->mnt_sb;
> > +}
> 
> Please fix the warning reported by kernel test robot.

Will do.

The prototype for shmem_inode_on_internal_mount() is in mm/internal.h,
which mm/shmem.c only includes if CONFIG_SHMEM=y, but the robot was
building without CONFIG_SHMEM. I've moved the definition of this
function into CONFIG_SHMEM in v3 to fix this.

> Looking at this together with Pratyush's mapping-freeze series ([PATCH
> 0/3] mm: allow freezing mappings), I think we should extend the mapping
> freeze lifecycle from preserve() -> retrieve() to preserve() ->
> finish().
>
> When retrieve() returns an fd, its mapping should still come out frozen
> and only become fully user-owned/mutable once a successful session
> finish() happens. That keeps the index -> folio mapping invariant across
> the entire live update until every fd in the session (e.g. vmfd,
> iommufd, vfiofd that depend on the memfd) has been retrieved, passed
> can_finish(), and been finalized together in finish().
>
> (Doesn't have to block this series, we can do it on top or as part of
> Pratyush's AS_FROZEN series.), but I think we must fix it either here or
> there.)

Ok that sounds reasonable. Should we do that as part of Pratyush's
series then?

Pratyuh's series replaces shmem_freeze() with mapping_set_frozen(), so
retrieve() would freeze the new file and finish() would unfreeze it.
That should work the same for memfds and tmpfs files..

BTW, this tmpfs series does a lot of renames and code motion so it
conflicts with Pratyush's series. How should we order these?
