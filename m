Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C51F95E
	for <linux-doc@vger.kernel.org>; Sun, 22 Dec 2024 05:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843841; cv=none; b=LmH/fj14AMyMvcqq1aS38GwjKOXsRnsPWXOICAsAAM9s1RPtr5XinjDdBHGcrmPvSnVjvOq570T8e7O/Po/nklLXMquTlV04IOswCB0oaZQCl1IKFO/jJ6VopMNkHhO0HNG/pQRlBBlULO65qe0TpDZJg7/5qUs7R+IILdsDmZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843841; c=relaxed/simple;
	bh=5t7THXeYLUSycCBIfcIjI9AFeum3p8DXxikqHy9ZaHM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkSdhFXNqD3ZnL0f21Poc5BbUL9XPKTcz3ZZmf4Q1Hn9W5qebz+gK97QB3wMJatgqVdAxeZqU6clNM/Nm3+f1LtwXsrjhwJWtqo/i7x+MChGaignW62CrofPBGanQFaff0OJ+LRKgv+5Q41k/jKpX+BQKoiirMzkjAVKgeb/EMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EgT2JZqg; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EgT2JZqg"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-8019338c2b2so1957123a12.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Dec 2024 21:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1734843840; x=1735448640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aRqCUQOlRgtZiRc2AC0vsaNCGW6lWCvjfZ2K0ekwaBA=;
        b=EgT2JZqgSnDa3jNbgSKubfCidXRBQO/djx0s5jlkVzbd7F1jq07Lsie5FpxYja4rYf
         rizS66cHY60SO7rlIacC1NNJVwxPtyXlVipVIQKHlxBOFFU05GbAX60Yi19wH+CZHODW
         2DX8yvYpiM4fkHTetAtlgnVqNLHMgEV/6byeZg8xwCGqvPdOBKorIAryXmsqn3wrLDfK
         VJHwluc9PCS+LLgsxAztSJOdvbtLWa1RTirRvSDwtuCB3KEnoVYNS55znWXY2gxdVgQi
         KSMRt5MwQ4AnPl/RU0CMZG+C5qtiVQgTRMvUN5s7vHKY1w7raZDSYykWUx05ROBfvvqH
         ziSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843840; x=1735448640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRqCUQOlRgtZiRc2AC0vsaNCGW6lWCvjfZ2K0ekwaBA=;
        b=R7hqw94txMY6XD9i2DRLtwR86laHXGWF71snynzQ1DfJg5Hcu0qGo2xFTBUefxa57I
         6rTWPopDM3gRmbFS//c/eJn7Dj1mgrNPlAsYvny/qaITmBBClC6UlDYHnzxchAFohcfp
         sFpbA42Domi4tHprwxYGNwA3prGAFNKXVWFsrkR3Zm7nXEMQwdBlNrNzOSsTlGkc7flu
         vw628bduRO8LLSATp4R8Lb0mGBNQvtjmcMU0FSKgsVO/VlYqVk0lgTHmBp5QBeG7QXp5
         mhUTZeEPGM2gdvf0HeQ4n5vPRDt/UKn0wHZ8WJAHX4XoJotS+dRsnsA2LKyj/keZzaxP
         u2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBXRF6uaZkeWf6rU3fuFlJFR0BKoHQjj0OPiDAAm5EWeNvXsMuUumo3JTAM+rZedCHpPxJ2n0Dqt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyijjCcYDndzFU+D7s+HK/G2MIprMgvloA1aXAp/0wgKQJsRfRk
	xBBm5+OosiGsXwYaREAeeU7o21AW/nKEYfuD2Gaw1UeucU8M/o9lDC1eSrgloRk=
X-Gm-Gg: ASbGncsihTciuX574fNXR1wwx5q6x2J6wsFTRjGaP7GupbAgZ8XrzMfdsf1khtzNiY2
	EAaRszchagoEUcFxL3IGN4ZLaXTJuHskhArTNaAAW/XVjppmrMuL++MLCCWxUCfOamVedkDrTrY
	LFjTc8HSWUOQkVlm7HkALRQryNCv6Mlf4LCHWPoLGtgG1hllf6APT4UuBVzYthg8Vy4fnSKvEPn
	cJE80CYDrIaC2MX6bFiWDA9EK69GP6CkphCp6+mh6NOPzXSFglvkS55AC8wYocnuz00C7Bv267Z
	Z+UP7cc=
X-Google-Smtp-Source: AGHT+IEz6nqPahLXccgfO9cSrt88CcjDjg2Jbhh4D2ThWhv0YE8dqXggljaBjhQgpLKbihe32IQpgQ==
X-Received: by 2002:a17:90b:2e06:b0:2ee:ba0c:1718 with SMTP id 98e67ed59e1d1-2f452ee8cd4mr13567612a91.37.1734843839761;
        Sat, 21 Dec 2024 21:03:59 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F ([75.167.163.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52dfffsm7819678a91.5.2024.12.21.21.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:03:59 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
X-Google-Original-From: Gregory Price <gourry@gourry-fedora-pf4vcd3f>
Date: Sun, 22 Dec 2024 00:03:56 -0500
To: David Hildenbrand <david@redhat.com>
Cc: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, kernel-team@meta.com, corbet@lwn.net,
	osalvador@suse.de, akpm@linux-foundation.org, chenhuacai@kernel.org,
	kernel@xen0n.name, gregkh@linuxfoundation.org, rafael@kernel.org
Subject: Re: [PATCH v3] mm: add build-time option for hotplug memory default
 online type
Message-ID: <Z2edvO0X6H_IoMRz@gourry-fedora-PF4VCD3F>
References: <20241220210709.300066-1-gourry@gourry.net>
 <5e958aaa-b1ac-4512-a592-0e1612032861@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e958aaa-b1ac-4512-a592-0e1612032861@redhat.com>

On Sat, Dec 21, 2024 at 04:30:21PM +0100, David Hildenbrand wrote:
> 
> > -config MEMORY_HOTPLUG_DEFAULT_ONLINE
> > -	bool "Online the newly added memory blocks by default"
> > -	depends on MEMORY_HOTPLUG
> > +choice
> > +	prompt "Memory Hotplug Default Online Type"
> > +	default MHP_DEFAULT_ONLINE_TYPE_OFFLINE
> >   	help
> > +	  Default memory type for driver managed hotplug memory.
> 
> We should call it "hotplugged memory" consistently, which it is from a pure
> core-mm perspective ("add memory").
> 
> "Driver managed" reminds too much about add_memory_driver_managed(), which
> is only one case. Maybe just drop the "e.g., page tables" from the examples
> below.
>

I suppose it's accurate that this also affects VM-hotplugged memory,
which may not necessarily be "driver managed" in that regard. So it's
more accurate to just say "hotplugged memory" - although even that's not
quite completely accurate according to the definition in the docs.

Either way, will change it to "hotplugged memory".

Probably at the point where you have multiple sources affected by this
change, you need a udev/systemd setup anyway.  We may have to revisit
this later, but I doubt it.

~Gregory
