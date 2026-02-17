Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A6D338584
	for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339714; cv=pass; b=qDJvYjjQ4PeZZ6tTq5KUeK4BxFlFElJEykjKust9pc0PQxMQcOxZ7Lts3Z1w9G4yApNbF/VE4HpLwUx+iq/kJMAK4+5DDacQwPSd+KqAUbioKmmw0C963FV91PfFLEnP8BgV8dZCH1n1k6qw5cXRco1a5ge+jX3KFDKN6S/jzKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339714; c=relaxed/simple;
	bh=BdwdGKvnO7fFw0MoaFXmtoP5xcQ32uwyD+1ybxKNc1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaxxiphA84lj22xC+5/26ir4KZwyyBNoBpmOouA1NwBBMWa8zdvYOpJUD0Uptlj6ekuvkUmJHj8YW4hvfx011FiCoAWlMZn9cc+PEFrFeixRCnjHHveuZZk+c4y0lJRiSaW/y2nM0ewOlP3phwpjcMn8melPF3SWW4Oe0jAr3HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cz3swEMt; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cz3swEMt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4377174e1ebso3252124f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 06:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771339712; cv=none;
        d=google.com; s=arc-20240605;
        b=O5N7yeHdMayXxM/hOSGClZzKYPIJG57EfVLlfaLRaK+FJzHg9aohFxs5JIg+l4uc5o
         PysCTcORLjIdr+ykpsi09kbYuy6JD6mcRw5daiU5feV8xovvN1UBQ6mhOkGGvywcw2DM
         5hrva3KjK/KK/Hz3JuZUMGkQJ+NXenlsscA1AzKQwR94J4g8xGScFOgwLA09PYVo5R5Z
         BIxoqXf0R+OsDwaMU3XBZpyqp1b2OKz+BsBDzgeeHF0wEIaQCM/dAQ1V2Yo4XrraAuqV
         KQtzdXWY85DK+N2whqZxctWKzilm9HWDA2TRN2pFrTcgi/m1KMWAo419dHLjuec0FtjU
         pXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eLr2cRWBw8S0/OXlKOzbRmg5bkPMrPDlaj10p1kdwTE=;
        fh=hFg9F/zq+VRiVl7JmXZciPTbIixTFeqNWpcC3zQfgic=;
        b=caQ6oKcYB2AxdZpbd29KKsUuM4e7nj/1Zuy1Z4qCzu4jex28kG1oQv5P8KJQJKdfYq
         x4WA7qclpxrFZEPDE/7YSQl9m/sO1W3jSb871RoDQl35tkItwKop3YXU7jejOVePxJQ4
         WDKfOLAnenuUIBs+yLT9VC3aPZbwIueQlxyYhkjt68NcsAgow1vKY2lbY/EcpQLee/jn
         PTwdOpY1cUG29mwYMI7xkmhMIbKK8Oak1anv8UOtvSPRq1nj2ZJ5BFNdJw46yRul4rWY
         MiRsFgt4PoiLPqqs4Xp61KnlqpNUQfS4P7EaokIl+V/gTg/0aUkKe974tyTZCpt+yAjW
         +Ufw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771339712; x=1771944512; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eLr2cRWBw8S0/OXlKOzbRmg5bkPMrPDlaj10p1kdwTE=;
        b=cz3swEMtk3PN2RvOTaW1z9hz0lQ4TdrxSP5U4gFFonwIFdUREVJHg2O0IHPFiUgqAI
         /uLteasIn9nknhnHTDUkGJRc/i5uKsLd3jaXqFXT6zVXHjGWz3C3yloiJNOqXQcqBBsV
         jCokeQ61LqCfTqKJ2wcPo/zgjmO2BiS6tkgRih/Gi0XRIYCABxADDHT98I2HVyvzU/A1
         djJbUeL74d4jMn70Bev0C9NAjMdbKk7xepPqG4QNTrbsgHaylLMgTa9tfmO37CODknEu
         +E1/4EBZQWP3owZXPGPNAZJoaJoGF/43yIGsyO5nvGgSTyu+nuWPqb8WztbMWQUYhWMi
         OoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339712; x=1771944512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLr2cRWBw8S0/OXlKOzbRmg5bkPMrPDlaj10p1kdwTE=;
        b=U8FQMFbvAM0eV3UhpFfdLckU+Tb2WkvvQxIdWXJ+VFqrrPTrPmy1ABLblr4GMxt8w1
         9oJFN+E6nvRhtHZRR0DEEkBlqJmYmFnTiT9EV5DXeDEx7CMpCGD0JYohF1BCuzVOaIxw
         bTietCN01OQAfy9WvDWyYbQDYOZ+rFs71N/BjdHqdhnYCRvC0oCEk9KBUxtG6uIxamHH
         wotvMZeF89Sl3fUyFs06t5UNMGSMHsXbaUtQGDPLsnbxfaB6q8os4CezZrCVSrZtdi0R
         E9v8slSbK8d75N5lWR62mDZ/Vzdav2CL1zQy78nk5T2WOdanRmo7Dhf7/zyssQAYjaWK
         Cb2A==
X-Forwarded-Encrypted: i=1; AJvYcCUSXN6Q8rOUshs5vS/U06D941nOnDXQz6g7QhQArIf2tWgwgW2OizxBTGIo5G4KDRaX2vPU0AouRRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz9bkgbxFzUfnydSGRSuaD+TfNaIJszTrcVEzSIIZ87Bgt41vI
	80LxOYHjKqYMjCAVbH7PHnjGhWazAvoTYkT/+7CJXEeIAdTyU/pLPHf8rksJTLt/P1b7n92EAUE
	2Ye6BFvyMxwMTWG7KJKqTMNT9+YLLa21DuN00SUmH9g==
X-Gm-Gg: AZuq6aISjr4UA2QhuAipsy8VO9BW0PXjtKW24jwBbSAF2AWRHWbkOvBKdNPPemDkVs6
	oKsQxftYlpKG/idYCZedjVsTh6mN0H/s0FjcnyolAMvM4aWJDreBOx+3FIwnlOYhf2tRcmuEPyw
	/pKKNhT8nWsFKvHWwR62LWB4kVNgRGlzC27uxfJBozQ7S8z2+qJO9A9//v56r5SG5lpqhC9NrN+
	TXXEx7El38Wd/WkRPDCaF8+tKdnU3FR/JUmN62lUdDbBU/DKCe0nFzSNErWCbjovdf9Gt0ehX02
	BcG5HzG41KFoskO8feodmVFUd6et0wQ7vw5Zaa8uCiKOhSilNV+NWoztGgBc+kNQkr4fYUuBeob
	xmE78
X-Received: by 2002:a05:6000:1a8e:b0:435:8f88:7235 with SMTP id
 ffacd0b85a97d-4379790e98amr27190797f8f.33.1771339711651; Tue, 17 Feb 2026
 06:48:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206182336.1397715-1-neelx@suse.com> <20260206182336.1397715-9-neelx@suse.com>
 <64126c50-063e-40e4-a536-233cce94b65e@infradead.org>
In-Reply-To: <64126c50-063e-40e4-a536-233cce94b65e@infradead.org>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 17 Feb 2026 15:48:20 +0100
X-Gm-Features: AaiRm51hHUsbfTUEHtSwC9qIQM4TJ160IJ28Zz9PQrmVkFY3H02cMBpf6HPloMc
Message-ID: <CAPjX3FfLFDS5Q32BzbhPgohsX250f8+JX_YbKPLVaGqVGcfV6g@mail.gmail.com>
Subject: Re: [PATCH v6 08/43] fscrypt: add documentation about extent encryption
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	David Sterba <dsterba@suse.com>, Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 19:43, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 2/6/26 10:22 AM, Daniel Vacek wrote:
> > From: Josef Bacik <josef@toxicpanda.com>
> >
> > Add a couple of sections to the fscrypt documentation about per-extent
> > encryption.
> >
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > Signed-off-by: Daniel Vacek <neelx@suse.com>
> > ---
> >
> > v5: https://lore.kernel.org/linux-btrfs/7b2cc4dd423c3930e51b1ef5dd209164ff11c05a.1706116485.git.josef@toxicpanda.com/
> >  * No changes since.
> > ---
> >  Documentation/filesystems/fscrypt.rst | 41 +++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> > index 70af896822e1..8afec55dd913 100644
> > --- a/Documentation/filesystems/fscrypt.rst
> > +++ b/Documentation/filesystems/fscrypt.rst
> > @@ -283,6 +283,21 @@ alternative master keys or to support rotating master keys.  Instead,
> >  the master keys may be wrapped in userspace, e.g. as is done by the
> >  `fscrypt <https://github.com/google/fscrypt>`_ tool.
> >
> > +Per-extent encryption keys
> > +--------------------------
> > +
> > +For certain file systems, such as btrfs, it's desired to derive a
> > +per-extent encryption key.  This is to enable features such as snapshots
> > +and reflink, where you could have different inodes pointing at the same
> > +extent.  When a new extent is created fscrypt randomly generates a
> > +16-byte nonce and the file system stores it along side the extent.
>
>                                                alongside
>
> > +Then, it uses a KDF (as described in `Key derivation function`_) to
> > +derive the extent's key from the master key and nonce.
> > +
> > +Currently the inode's master key and encryption policy must match the
> > +extent, so you cannot share extents between inodes that were encrypted
> > +differently.
> > +
> >  DIRECT_KEY policies
> >  -------------------
> >
> > @@ -1488,6 +1503,27 @@ by the kernel and is used as KDF input or as a tweak to cause
> >  different files to be encrypted differently; see `Per-file encryption
> >  keys`_ and `DIRECT_KEY policies`_.
> >
> > +Extent encryption context
> > +-------------------------
> > +
> > +The extent encryption context mirrors the important parts of the above
> > +`Encryption context`_, with a few ommisions.  The struct is defined as
>
>                                      omissions
>
> > +follows::
> > +
> > +        struct fscrypt_extent_context {
> > +                u8 version;
> > +                u8 encryption_mode;
> > +                u8 master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
> > +                u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
> > +        };
> > +
> > +Currently all fields much match the containing inode's encryption
> > +context, with the exception of the nonce.
> > +
> > +Additionally extent encryption is only supported with
> > +FSCRYPT_EXTENT_CONTEXT_V2 using the standard policy, all other policies
>
>                                                 policy; all other policies
>
> > +are disallowed.
> > +
> >  Data path changes
> >  -----------------
> >
> > @@ -1511,6 +1547,11 @@ buffer.  Some filesystems, such as UBIFS, already use temporary
> >  buffers regardless of encryption.  Other filesystems, such as ext4 and
> >  F2FS, have to allocate bounce pages specially for encryption.
> >
> > +Inline encryption is not optional for extent encryption based file
> > +systems, the amount of objects required to be kept around is too much.
>
>    systems; the amount of

Thanks Randy. I'll amend all these in the next iteration.

--nX

> > +Inline encryption handles the object lifetime details which results in a
> > +cleaner implementation.
> > +
> >  Filename hashing and encoding
> >  -----------------------------
> >
>
> --
> ~Randy
>
