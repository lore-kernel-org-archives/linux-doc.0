Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182AD395AFD
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499020; cv=none; b=uLPKievGd+iZ1jg62W5suRbq/Ec8A4rIFSDWiy3Q1qYCSe6yy23BDddGh9fDrfZdDBFrElvsN15MpQ0e8QrgdQMljdtJ4/8IjHR1wgfieMxOErPCVQzKvflY9IOVm7nuaXRoDF3N0WdI4fgJ3ObaFMc+ugbI3/w/oIaHXM3D6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499020; c=relaxed/simple;
	bh=aJLjATifzgiw0TOlO2S9rrai0BaEgmmVwEMl+rz5nfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pc0MV/2r0G7V8Luog6FZwNkK0kzwQsKeWlKwlP0ZN43UCFTkZsZHYg5kQJtjBKVk++/U5ckgUMyOH7IljwOQbqA0TOCcaA40SoeKUu3QsncBh1iw1V33RxiLBqaDqxBJL+0BvWEXSW8ja+EkeztcQS5E0sACcZJSZJbVH9qqY+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=cqgOTH34; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cqgOTH34"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5176ca6bab1so8414971cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780499018; x=1781103818; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GE3cxqAXSaCHVcc+WKXlgfot3UvMd9FsWD9Iu0pbg2Q=;
        b=cqgOTH34C+FJgNcku0jzLOHE06WOO0GzZlwzJWYwQrB3lNzQycQHXHfiRUeg96EJuj
         zu80R9bQFL5szMIu2M6mBNaYBpH2uuiQWpqazM+lJMNdWAWRcXylqfDIgv8pYxropi2H
         iRc+3WEfNnow2lkbOuMPW6GRfaiM778Q5KrvQuZaiIUOThJU7EYYW5BTobgWJeJ7JtWH
         s40eM8WjpSNEsynDnrxTy9rOcgACSokJKDxHm5vmW/Qr/Jg2a1Xh4VuO2huux8eJoVsT
         NHhD2wTOX5APj2DP/CmiOU09ZL057g+NdbquGMcFrC6IizUQHUOeUHWeiSaXy2Kx15Ji
         ZCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499018; x=1781103818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GE3cxqAXSaCHVcc+WKXlgfot3UvMd9FsWD9Iu0pbg2Q=;
        b=fkR/OI6wTbl2xMT4MYHPva0pgUTHG8Lw28Yndin2GsN05ysuk/g2jTr5f+pYABVIeT
         VcQVO1ZOcYk+q8aFKZPs1ifds2Vt1pZI3u/nMMXgsWwVHx0dpNNydgVgc2q9OFKfYX0A
         mA477w50kQEMhnDh2gDxe3h1ztflBhgjPGDDO5R9AULvUhI4xz4ZFkWHmjC6Vn4EQsqR
         0fYASsZ+6lfaQ7uVFAmj3h/kS6MNkx/S3YLl8KFxinQLEenFo878CDdCZ6Rzgl+jA6vB
         S1iSPlQcV8G1OIw2+yHTLKYNZe4lAsqrjRhsPXJsfUa6tmLVuLlnPdHj0VUvNa1a1jw+
         tkcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4gGxiC8q3ZuNBb0lDXoflBtpuAMAMUw8l2oENozQsSBONJfigVBLwPmG+z4/LyG2NRkjivk15SR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqO/ypGPz1T3W/wxWx89bb2IJDlStNtMesA+TQpDEgkqMAt8nK
	gHZc0m7e9YQX8HwhnY5OwV5z9OPgrum9efFebkrMpTMjE4UyPLU1XDhJ6AkHI42CV4/GXDbnjqT
	Lih0U
X-Gm-Gg: Acq92OF4EO/cZqq/KQXIsbblFbfIVEZlRDfbStALPSfreQUMuKC/ZyoOUI6qdWxUpgU
	Bij5Uq0Xc3ObdPx9miESc0grxl5mkPSMGnX7CpE90kj+vKS6ccA+cfeb7mLJeJWJytAb8W61EOb
	G7oT4SrVUPCN99+R7LpkekP+bpN/WbJRjNi3VL8uxEs+m0EJWSTkXb3tnZKuRdwNcJrVH8/+jnq
	0bk39ZWOIClEbm0lldXdtpix9VfPi9n7j3xDNR3OcfgBPQch6cRqcvW0ZP2zyuC9B+oYjalz7Ui
	MBKrINkeJMYRSk2nNwyKY7uyZ2mT90BM3UbSAhJyCOyDtclO2C5x8xcdqPt1IuIjs7MUqoFSVRK
	nDqI4C+9j+6QAyPjQ7uECaMyWUGDoOPQHU6MShqBO+7zYWbK4jFBFNRj6Ehg2RoQ/OYvpkr5d24
	TafMFHPQyK5lSx/vGCwJVg6LoQRUbLgWuw3pyrsASIaR963Pl2+pXHtvVB94i8Gw==
X-Received: by 2002:ac8:7e86:0:b0:516:82e2:7788 with SMTP id d75a77b69052e-51779701719mr41203361cf.1.1780499017835;
        Wed, 03 Jun 2026 08:03:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dd2e53sm25188571cf.24.2026.06.03.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:03:37 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:03:36 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block serialization
Message-ID: <aiA_j7udFaO9TRBP@plex>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
 <aiANtYRRDr5iO5QR@plex>
 <aiAzT9TvGYjITiB8@kernel.org>
 <aiA1slnqPnC4_8XY@plex>
 <178049725439.475072.11560134126837430744.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178049725439.475072.11560134126837430744.b4-reply@b4>

On 06-03 17:34, Mike Rapoport wrote:
> On 2026-06-03 14:11 +0000, Pasha Tatashin wrote:
> > On 06-03 16:59, Mike Rapoport wrote:
> > > On Wed, Jun 03, 2026 at 12:05:04PM +0000, Pasha Tatashin wrote:
> > > > On 06-03 09:49, Mike Rapoport wrote:
> > > > > On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > > > > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..8641c20b379b
> > > > > > --- /dev/null
> > > > > > +++ b/include/linux/kho/abi/block.h
> > > > > > @@ -0,0 +1,56 @@
> > > > > > [ ... skip 25 lines ... ]
> > > > > > +#define _LINUX_KHO_ABI_BLOCK_H
> > > > > > +
> > > > > > +#include <asm/page.h>
> > > > > > +#include <linux/types.h>
> > > > > > +
> > > > > > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> > > > > 
> > > > > It's never used by block set and after looking at the following patches I
> > > > > found that it's appended to LUO compatible string.
> > > > > 
> > > > > While this works for LUO, I think it should be kho_block_set_restore()
> > > > > responsibility to verify the compatibility.
> > > > 
> > > > It should work for any component that relies on  kho_block. My proposal 
> > > > is to use this method for other common KHO data structures (e.g.,  kho 
> > > > vmalloc,  kho radix, future kho xarray). There is no need for them to 
> > > > carry the compatibility string in their metadata, as whoever uses them 
> > > > will include their compatibility string.
> > > 
> > > So if, say, memfd_luo uses kho vmalloc, xarray and blocks it'll have five
> > > compatibility strings glued together?
> > 
> > That is correct, but it will be in only one place: the header of the 
> > client's KHO subtree. Since it is dynamically sized and 8-byte aligned, 
> > it should be safe to include in any struct.
> 
> This is safe, you are right.
> But I have more usability concerns from one side and the duplication it
> causes from the other.
> 
> I can see the downside of putting the version information in the data
> structure itself as it either requires a different header for the first
> element or needlessly increases all the headers.
> 
> But 
> 
> #define LUO_ABI_COMPATIBLE     LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE "-" KHO_VMALLOC_ABI_COMPATIBLE "-" KHO_RADIX_COMPATIBLE
> 
> is not really digestible too. And it forces KHO users to potentially
> track KHO internal changes.

These are compatibilities; I think they are quite digestible, both to 
write and also when the  LUO_ABI_COMPATIBLE  string is printed out for 
debugging/info purposes.

> We still don't promise any compatibility between different kernel
> versions so to avoid blocking this series on the decision what is the
> best way to convey KHO data structures compatibility I suggest to bump
> kho ABI version in v6.2* of the patch that adds KHO blocks and postpone
> this discussion to after rc1 when we'll have plenty of time.

Let's keep this patch as is for now. We will have a broader discussion 
when we convert other participants to this new scheme. If we decide not 
to pursue this approach, we will change this code to use an independent 
compatibility string. However, having this in place as a template will 
help us convert other components correctly, ensuring proper alignment 
and that correct string helpers like  strncmp / strscpy are used—which I 
have already ensured is the case in LUO.

> * sending a new version of a single file does same email traffic, but it
> confuses b4 and quite possibly other tools, so I think v7 is better.

Agreed, I also prefer re-sending the whole series...

Pasha

> > Pasha
> > 
> > >  
> > > > For now, reviewers will have to make sure that if the ABI header content 
> > > > is changed, the compatibility string is updated.
> > > 
> > -- 
> > > Sincerely yours,
> > > Mike.
> > 
> 
> 
