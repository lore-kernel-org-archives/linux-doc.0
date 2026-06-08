Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDD548C419
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930600; cv=none; b=PzO5IsvdIRAmlITiMvJY/8S17B0+JvJwytFREy18HO5ROzPkkczFk4+QVfPjquYuAx0Lj81+aHM3oNe0Pa/PZLVfGt18AdhicNwEgVvc23zcSiYqq0t0q7Oa0AuoOVX9ZaTEJOaroBVHoMDEn5XkrG8ta9RzxyyzoDmrBHoOmAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930600; c=relaxed/simple;
	bh=OLvBvUjkzfMn1Cidy+KbhXvOT4PjxRs8Fx8SkFfpgFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxeJYJlycW1/rEnsOmk6NGT7FvIzwT/JaE0qLvRcjBMpagywpjpnv008fs/jm5KeNXiwO7DJOtvunQ9c4vZP1uh652f8peUv9hVs1PA6LUV86rc3BvBCa/Unh8Lf8fEGZZx1J7nIHKl2YJEsoVO0rX1z78mJ8yMZSueb0jjdJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Vz+OvLtn; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Vz+OvLtn"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51761d27612so52510491cf.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780930591; x=1781535391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XaEoBFZ0wQN7RayZ7ZGkzrqQNmFAZboLFpyYk5DAFk=;
        b=Vz+OvLtnDLdBCYdORDQbcTs2rusiLhkpjeqFPNwcEwNYhHyk8d3HB1v6zbUMCJ5XRX
         OdLmxiemRs9Nq3Ze9ymf0puQVhplsbuC79pY9rYuwI+Z9phnw+j3hy/zJFBtxB13xRbv
         1rTtisvq6/5U5/IICAE/yCjNhCrY8TyiBsEm05EZw1xHhkrCYMzYiI+za5pcgONY9njS
         KToSzx3NHOQPJT0JfAgkXtwsWAqttV4Uz+plFbKfMtxysrFHaBAld+Z+Bgk9ZeY6YUfA
         8tZgX4ceZ8Mhhqm2h63FvUkzJDK7ePx9yr4qg73vB2smkNtwtJFiVO+UkFQUcTBqzJHI
         Y5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930591; x=1781535391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XaEoBFZ0wQN7RayZ7ZGkzrqQNmFAZboLFpyYk5DAFk=;
        b=jv+P3QtQCU9CyhCs1LO2bJEqqCl+GHj9Qr/XVyBPLJawn+7QiVqgQdXo6qh3HkjGSp
         WiNwJHxxAXt7w3kOQa3gNzfsTNXixmLBZ3FHoPsbYdL5LOEcx/z7tEddy9kme6ON1WVz
         2sfHwc500TPQGif4Vho7fuwY7SjXbL6hYPh3/8ZmF888/7mS6i4WwZmOXDBPy7lZPM7J
         fZ1hcn7UgP0I1Mgc+qVxtfPH0uZpD8ZKgYtwnumhSBdx/B/DL1F4aJHm+gVAE2sFIZuD
         um96LkcnbVCqcv+3pooSdGVQWWiTushz7R47/WTM9AaB5KVztOxjvaf0fI3MJZLBEXez
         NPow==
X-Forwarded-Encrypted: i=1; AFNElJ+f0mr5h0/t0TcjobUuP6G5JVEqvWkb/dypeyfjMekejh40qXNYBl6n1hC9wisFQSz8Fw+TKDwdpMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjERTM/RtVXkGmgfyPUmavpeC7CBQXgFi+Q8NkMalrYSAGSxj
	eLpfWNzU4qRiJzEoBrdH3SNI0rAMxXP+UZr3TYWIZEsBK8v6G4pLomQ1DBlXZ8wIhVI=
X-Gm-Gg: Acq92OE+8bZrJe7iz89WXCZPvQVmyXrRTtsVtXJebltTCDUivbxBNM3PwecflJRBYW6
	C62BBF/iK33KvVjHs3ntO7oLkrh4D40RIMyBMkhQL8IwxZDVloxFy7On6e+S3ca84vRUS8GtdcQ
	J+m6cz9fWfhq8XvILcRGpNcF787EeRTHw9LT2GAOJU5hJ0DwCz8jpOeMw8IX4zTs+AkO5+Ncdur
	JXmO4dQGOaRQh5fSgyh81DQSafzt2eqL6pOUOgJqLz/cJD4DYF427MhwOa8L1Lsqzqzrr17g4Ru
	skRAkoIaE7SpBmelsM7zRhws1hmex2QI8jbkHyq37AoxQCPdnj+P3v9YzhrCKXKOou/pNIN//Uv
	cLJp8M6Y8r0zygm8nrQUfYYVl6h+qS6zXm4oCRipFJb6YO9XNUEx+Wg/zaTYmsuwpQoHHREtrTT
	XGJ+YZSOYXaNspbZxvIrtuNkbg8Rn9gSXPjlG9hzOkDx29CsYeqHPiPdZ9krj/ug==
X-Received: by 2002:a05:622a:1648:b0:517:6d75:a2cf with SMTP id d75a77b69052e-51795c5a18fmr245549391cf.43.1780930590664;
        Mon, 08 Jun 2026 07:56:30 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dbd2c9sm158664971cf.23.2026.06.08.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:56:30 -0700 (PDT)
Date: Mon, 8 Jun 2026 14:56:28 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, jasonmiu@google.com, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [RFC v1 1/9] kho: split out radix tree tracker into kho_radix.c
Message-ID: <aibX8oS4toOVaCqm@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <20260605033235.717351-2-pasha.tatashin@soleen.com>
 <178083348873.1648214.11020626647820932506.b4-review@b4>
 <aiWYZhoSOAruIIM3@plex>
 <178085518028.1648214.13339471022594901667.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178085518028.1648214.13339471022594901667.b4-reply@b4>

On 06-07 20:59, Mike Rapoport wrote:
> On 2026-06-07 16:20:50+00:00, Pasha Tatashin wrote:
> > On 06-07 14:58, Mike Rapoport wrote:
> > 
> > > On Fri, 05 Jun 2026 03:32:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > 
> > > It's radix tree data structure implementation, kho memory tracker is it's
> > > user. Please rephrase to keep the semantics clear.
> > 
> > Yeap, I will update it.
> > 
> > > I don't see much value in moving kexec_handover.o to a separate line,
> > > btw, the same is true for luo_core.o, but it's not important enough to
> > > change.
> > 
> > This is purely for consistency. I wanted to use the exact same style in 
> > the Makefile instead of having two different ways of declaring the 
> > object lists.
> > 
> > This:
> >     luo-y :=                                \
> >             luo_core.o                      \
> >             luo_file.o                      \
> >             luo_flb.o                       \
> >             luo_session.o
> > 
> >     kho-y :=                                \
> >             kexec_handover.o                \
> >             kho_radix.o                     \
> >             kho_block.o                     \
> >             kho_vmalloc.o
>  
> I mean this:
> 
> luo-y := luo_core.o		\
> 	luo_file.o		\
> 	luo_flb.o		\
> 	luo_session.o
>  
> kho-y := kexec_handover.o	\
> 	kho_radix.o		\
> 	kho_block.o		\
> 	kho_vmalloc.o

Got it, I thought you were against making the consistent :-)

> 
> 
