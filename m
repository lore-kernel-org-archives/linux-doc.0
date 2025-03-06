Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224BD1EDA10
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 09:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741252188; cv=none; b=S3b14coT0xnAH6mp5FvY9TJfNnklv596ngwiujYIX7tYxF/OiCE7e6JoPbRYQQ/MUfvng7ENxoJBVaqk4iVFOkcCnR4NSTwBbAQCQswRM+bRYBJ69dnxHCzX4PyTedxQflHSgsY79p+VJZPl4RCtj2hbV4j9juiNDS9HzudUHAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741252188; c=relaxed/simple;
	bh=x6I7LCwo+Avhb00YGNpsl7OnqLaXiIjRV7k9qsBtZn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKY4Jxl+8Q45S00MF6Pn40OYFSBxVIrjq+bet5sWu8Oh8782+QM95iyA0cil0aU2oxKXSHFX56Xj0Bs/HL/j2KwdDM9pfjpl7qyhWHi1hAKI0eaIOGadYcczsJcJUWtYpqAabsNOmEALFpmOhUa+MqstMwiOulOakdJqauquQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RyiFEy7n; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RyiFEy7n"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-43bcfa6c57fso2131385e9.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 01:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741252184; x=1741856984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x6I7LCwo+Avhb00YGNpsl7OnqLaXiIjRV7k9qsBtZn0=;
        b=RyiFEy7nRr/HTwiO/5ZTGuYoE+i/fh/1bDIFrTWy3YOPTA/QDGkx4dUWpeGBRKvkSd
         GdSHtAfIYsZZ9J+m5I2D+D6TmrhhORxeap/n6ItbH5d9z4K1F4PnEoqnLtJR8i11dQ0o
         /Pu7UUA73RJGQ44Z3IjfUpCRU+KpExKMGdnmLnk5e8cEzxrGcNpl31bueQC6uCaqsNQ/
         OcLE8sEClHEkRAPduOwWmAzsSjjJ4Zjk3IJM1LZPFr8D6Afzr1wZ+vpdxe3mNMIsq/v7
         Hq7Bw2z3vO8zdlzokl4pds4wW39YmG5AZXQJsvloZl2uXm/E+JH3npJAvDtx0FP8tQOU
         d4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741252184; x=1741856984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6I7LCwo+Avhb00YGNpsl7OnqLaXiIjRV7k9qsBtZn0=;
        b=MVeLTNNScIJmSbu7fGmxiwWRT8QcISh4qR/z6L/OpnaV8LTgltgH1PcqZ0/4CPu7s5
         Vc5GLj7dJH8Ajc20dy2uR3dKqWdpFVlDrnzsmYJXR+qlCmdP7EWyaco9NcLuXDL0Qdu7
         VbssMuhM2fL1wTZvAFuva0eflu6Bt1D9uyyvXBuTULvMVv7g2CeIwwRZjT95Rgywx8+z
         QYIavR8ajXhyZF74gKy6uTOoy6BT+voGHLHlBgD4tF12udk8TNrcUsIMMvoU9x/huSqV
         76zvijvfDlu6bi7rn/vTvsuvwfO1OGOQtLEwMHrvcpBB49j6Duuqjh8CP5QQBCMWe6YJ
         vhAg==
X-Forwarded-Encrypted: i=1; AJvYcCWdwTj3wWXlH3RpQQLa4d/9pnYwGbs8SYu3iG+lE4KRi/UkbFSq9tFEQR8Bo2mFXxYy4wTI+uS0euo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu4Ulmc3eIn/2t5kr73EuQFDCZfUzw/VPt1YjAm8flUEMgIyTb
	TiN2020KOA6ttAEzfUcHsKn/2vbMwUZKMBehD5rhF/ZRNE6e+1fB5DomsFIsI9Q=
X-Gm-Gg: ASbGnct2bZu7Ls4leYbsdod5QTlY6P1qTa1i8hZd9ADYAsC/kyX6M8JHZBf5kiAaldW
	J2Dm06g4kIMiVIe490M8T1kQC1OlJECQ7ZMP4SgIdFXFNnjNGdWSEPgvkiZFeXWVi8iEds/0lob
	sknFW9pvIK4/y+zSpIofdlKuMexOZHhRante5/Ydks2ihLywhxyMsPXUzaTLdZbUJfeLYvfrgCK
	n3MnLXkM3WUuA9IwJ6eRpDK0JdC9P1xpb84Y5PM9BsbH8h8D3EjkN35Q9YiwM+4wENTE3dDTyTs
	yGGWAy/RcOqtdf5vFFSiGUZfNRSuY+oXB8quqnOSe8J9s/U=
X-Google-Smtp-Source: AGHT+IE20SfeQZTIROwzNnAwSpomgWzOj7kDG/AFPKSGBYaqpQAWmZKrf9xz0kYJLQXsIi86AmqWOQ==
X-Received: by 2002:a05:600c:1c26:b0:439:9274:81db with SMTP id 5b1f17b1804b1-43bd292a806mr64639955e9.5.1741252184269;
        Thu, 06 Mar 2025 01:09:44 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0194f2sm1405811f8f.54.2025.03.06.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:09:43 -0800 (PST)
Date: Thu, 6 Mar 2025 10:09:41 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Eric W . Biederman" <ebiederm@xmission.com>, 
	Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH 2/2] pid: Optional first-fit pid allocation
Message-ID: <ajz3vdl7yqu6a7dtl6dpqm2ea6wfac2jovbx5zl54dw2g2a4ab@tgs4gq5hyim4>
References: <20250221170249.890014-1-mkoutny@suse.com>
 <20250221170249.890014-3-mkoutny@suse.com>
 <20250306-esskultur-sitzheizung-d482c4a35f80@brauner>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jo3sx6jdjxyyuo56"
Content-Disposition: inline
In-Reply-To: <20250306-esskultur-sitzheizung-d482c4a35f80@brauner>


--jo3sx6jdjxyyuo56
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] pid: Optional first-fit pid allocation
MIME-Version: 1.0

On Thu, Mar 06, 2025 at 09:59:13AM +0100, Christian Brauner <brauner@kernel.org> wrote:
> I strongly disagree with this approach. This is way worse then making
> pid_max per pid namespace.

Thanks for taking the look.

> I'm fine if you come up with something else that's purely based on
> cgroups somehow and is uniform across 64-bit and 32-bit. Allowing to
> change the pid allocation strategy just for 32-bit is not the solution
> and not mergable.

Here's a minimalist correction
https://lore.kernel.org/r/20250305145849.55491-1-mkoutny@suse.com/


Michal

--jo3sx6jdjxyyuo56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ8lmRwAKCRAt3Wney77B
SVEQAQCv1kf8EBaRDF66bApU+yr8h9OYOK0rqy+iUFrGxAXfSgD/TWrBYLDNn9YJ
LVkBPIKqH3tjY6+xjhd+d7lU6a/0Sg4=
=1oAV
-----END PGP SIGNATURE-----

--jo3sx6jdjxyyuo56--
