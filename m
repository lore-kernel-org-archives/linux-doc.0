Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23FB3208
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762425201; cv=none; b=CXTAZzTKmMUQO4kBQENJCBUii1PVEse1k91AYORh3sX9R/SScGoOK5rO98MtGrrDKhVbfHnzN4ykJ6kaaZKtQgpw/57Y7UPEAd+0904gm1YaR06nYBA34r56mkyQOii7DMEMmu12Y54Ue1Gnz986Is+CKv1aqIQsBgUrNb17f4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762425201; c=relaxed/simple;
	bh=IQipCRpVFfui25dKlyIy/WSGyJHEdXiJ7zhFimN9ZT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRlj/a41foo9X5QgQWyagUrqny924UMhHkPMnnVdZWnrr1rhkm42QZbFgImvB5DNGHRxh0GW0SQ3KSdBGqI0SLRhYu3QeGUVcrGIZax2kWcrOQGWpQgR+uQG3byo7whFvUZe0wm7ALgM1oXP5JknM4982W0zlch8i+A6Xx9gUvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fq5vMYFt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq5vMYFt"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426f1574a14so461582f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 02:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762425198; x=1763029998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQipCRpVFfui25dKlyIy/WSGyJHEdXiJ7zhFimN9ZT4=;
        b=Fq5vMYFtNBf3r66JZJZRoTBAVXW7EyLf+8vC5W1ol01pFX6UubaTJ4gouBU7fDYGLb
         F5RiSk6l6AJVRVHYmOmm9r1F5xRMA5W/T716DSxiglc4zNIMxSPALy+A22oQMk7N1YSw
         MxBYi7Xp03pbfp79nhdiECcsyufVCb0zlYhGtsW4SNABeOFqzbJ+Z7t/JiVyRn5my725
         yrSji4uw0l3WlTOJZeT9Db+vBqK0WhzCiADkuqfpHHxlZ4W5FueE7RXaE3NuLvMcrDJr
         NaxLI+x9PrZtjqULm3mbwBiUjqSw/jrMUExDGE/v6OxVz8PGRafTG9Jk7tGMr/MVIG69
         IfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762425198; x=1763029998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQipCRpVFfui25dKlyIy/WSGyJHEdXiJ7zhFimN9ZT4=;
        b=M8OsHoGIfvaXhnnlE/aGhtr+dep+9dFP23tkTQIgCGXh3OrYaccEGduDi/4srVnB4m
         c7WXZujmZrBqSman1CTAuqWMnir//ajVj4ILiEs3IsfYUWe/hfJQ+4RN/AuM3Vhyj6P1
         5bEvtEz3GJqhR9OzGv3tFB8hqRk/3/2wBgVz3T0gqQxuj56Jfjx8ebdyhNy70sMPnrWt
         vUzQPVX458zmB05tCPAeB8O3DeAch7DEnyI9hELmDVyl0A91SCcCnM0qV4m7mdPn15+E
         XaSeh3gWnvShkhtsbVvDjrfAzuQ2yp+aksKTQbEe1Pa0Ey0vbyrV1aXrSEozjKMJEpBi
         0AsA==
X-Forwarded-Encrypted: i=1; AJvYcCXvrXgNhOTBD2oNfAp847HBuFFKzjMYjtRI8o3cOiONiq7kDi8BWjEzCydBXZzpbOcbGLdiBUkJ3OI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmLxWgI6IQtSZEWpG91n45NaVe09aJT2iHYWBLmcNQjpZTkLq0
	DWt91s+yBsD1oVThhFZCELcFCAnO5V5SUZwzA1D6bpa+E59byA/9jRjJ
X-Gm-Gg: ASbGncv9yC55grmRTu3ygxg6kRfVeVMbKLOhjeyo0mm+nw/NO0XyyS7oY29JSLIcxZZ
	fone8gnsBObcIZPCUIZ7lm/YYfz9aDFdAOR128dVAcigFPA0bBYy5Q7HDL4yr8LkZk99ipg9Bsc
	Rbyu6iWrVH/oDLkRHBozJfj53f4PaacJLfJwAxgpD2E5MYgcC7nZ51Fvje0wgRGLgm9tChYdc23
	BxJ4iR2JzlX6KBGpZLEGBDGGgtn5Nx+fi6ipkyWxTW68SjD7vrBcpPDGDb+igH8oTKgy9ei6Lia
	0KReBjNGaay3/Um08mntvees3ebKbDJLL71iNxaZaxJpGsLRqMegygyARAitm5ijPUFyQmbmu88
	ROt3GvctTFRGaw3CEr1Pdn9ebXb4Vs26WzxOm/FTeqSuPIiAwJojqSXqeZgwoSR8fkYXSkjppiP
	PFfsiCv+97YDOiNMIIr4lx6A==
X-Google-Smtp-Source: AGHT+IFtY317gqE6KkPCPF8CEMqlY4XSqSHpCQgEggJ0wgh6u+xUqljo6I5F0N5V/IXa3Sh4CqPFig==
X-Received: by 2002:a05:6000:615:b0:429:c9ab:2cb5 with SMTP id ffacd0b85a97d-429e32c817emr5341842f8f.2.1762425197999;
        Thu, 06 Nov 2025 02:33:17 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb403854sm4173231f8f.5.2025.11.06.02.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:33:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 046AC420A685; Thu, 06 Nov 2025 17:33:12 +0700 (WIB)
Date: Thu, 6 Nov 2025 17:33:12 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/ttm: Fix @alloc_flags description
Message-ID: <aQx5aAR3DjengjVt@archie.me>
References: <20251106005217.14026-1-bagasdotme@gmail.com>
 <f935574c-67d1-4a7c-bd8e-e9dff7aa97ea@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmZmydHKAYCDjdz2"
Content-Disposition: inline
In-Reply-To: <f935574c-67d1-4a7c-bd8e-e9dff7aa97ea@igalia.com>


--rmZmydHKAYCDjdz2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 08:28:15AM +0000, Tvrtko Ursulin wrote:
> I assume no one merged it yet to any branch so I can push it to
> drm-misc-next?

Of course!

--=20
An old man doll... just what I always wanted! - Clara

--rmZmydHKAYCDjdz2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQx5ZAAKCRD2uYlJVVFO
o6KUAQCdWlX+bS8tZGT/WzXuutPy13eM3ApLgSLVthbWq2XiFAD/dr6KLftQULXk
HX5cf0yZ85lJ3S9nW+31ZKHhTSUppwM=
=gYHU
-----END PGP SIGNATURE-----

--rmZmydHKAYCDjdz2--
