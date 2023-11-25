Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="WbhAdX9d"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFA21990
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 18:42:34 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5c08c47c055so23398277b3.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 18:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1700880153; x=1701484953; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:organization:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyf0Z+cxJ/W3oT7C0OJIc/PCTRVv14uANGjF4ZAEDSw=;
        b=WbhAdX9dfnA7LrwPupxKGjkvxS7jwE02Cn1jJVfEgAaC1FaJfUahy5FavBIZkDyEZg
         k5lm1jucMTHd2Pj+vtlZpSmfHs/OOu82NVbX/EoWDDcXQIigreyCpvlmfjhD0t/JSygZ
         SIU7Kx64/wsg3bAwkuPgh07AitGqqPS2HGs7KzbZ/b7z4/ChGhwN7gZCedS0eJRz1ws7
         8B/aqQNhzQuQKaXdF0xJpzPFAV3prlLqFid8QNObx0Ct8M146TEig6wZ5b93eRP4TM5U
         cpzeg1KKYuw3d3pp1Qv+fqINLfVYPa6W7rrxzMZFdV2pZXuu4PxITfLl/z1tSs5JCAPy
         LibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700880153; x=1701484953;
        h=mime-version:references:in-reply-to:organization:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyf0Z+cxJ/W3oT7C0OJIc/PCTRVv14uANGjF4ZAEDSw=;
        b=Nh3GfKpmPng8uhVzyTfy0ZUxUgAaq+PAaMN+r7Web6EXtfN6Gqlu0Qhy0bs0UXFkR4
         PLkDMJ4aDu/zuPGiUollpuWeiF79mzuJrbeK/u/P2kQBrlg+AkKlW7O9aHcMAMGPVbuk
         gldW3eXMnM0GDS6d+BR4zJHdR8w4YCSuJ89wEP+AiLvZxD9LAqJlXPPNJdZZ5wVfImJE
         GRbOKBSSpKbS+4M3kQxNsEkMfII1Gzm5DnZLFNF8aH36zbNN402T4RPgGjgvYu2FN4zJ
         7buyIVfORbyxqF63QYexpiGsDTfwOIiJj00GPJUlaKXe0kBBfFBTCH7sERV8mgKn2b2B
         w50A==
X-Gm-Message-State: AOJu0Ywl5etgX61asdAQVrFCVCJN5TKMAtCfhSYFV5glklbOLVQoC1Zd
	Ts0LbFSQvBO5Vtz3d1Kd6wGdOuQd/TGLXkW6cGo=
X-Google-Smtp-Source: AGHT+IHtZ42ierZtnGi10mXOo6CZvlvjnES3nwJxqf12LEm+cLdiRM+zBhpCVnFUTB+pTVenapmVnA==
X-Received: by 2002:a0d:d54b:0:b0:5c9:d870:cb18 with SMTP id x72-20020a0dd54b000000b005c9d870cb18mr4916615ywd.21.1700880153184;
        Fri, 24 Nov 2023 18:42:33 -0800 (PST)
Received: from lux.localnet ([2601:580:8201:d0::4da5])
        by smtp.gmail.com with ESMTPSA id d196-20020a0ddbcd000000b005ccf7fc2197sm1371945ywe.24.2023.11.24.18.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 18:42:32 -0800 (PST)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 1/2] docs: admin-guide: Update bootloader and installation
 instructions
Date: Fri, 24 Nov 2023 21:42:32 -0500
Message-ID: <6005603.lOV4Wx5bFT@lux>
Organization: New College of Florida
In-Reply-To: <87leanw0ms.fsf@meer.lwn.net>
References:
 <20231114030208.30479-1-hunter.chasens18@ncf.edu> <4525208.LvFx2qVVIh@lux>
 <87leanw0ms.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4890171.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4890171.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 24 Nov 2023 21:42:32 -0500
Message-ID: <6005603.lOV4Wx5bFT@lux>
Organization: New College of Florida
In-Reply-To: <87leanw0ms.fsf@meer.lwn.net>
MIME-Version: 1.0

On Friday, November 24, 2023 11:56:43 AM EST you wrote:

> But the makefile is looking for "installkernel", right?  Unless I'm
> missing something, that's the one that will work with "make install". ?

The `make install` calls `/scripts/install.sh`. `/scripts/install.sh` uses 
a variable called $INSTALLKERNEL to search a few directories. If it can't 
find what it's looking for it searches for an `install.sh` script in 
srctree/arch/$arch/. `kernel-install` is part of the systemd stack, and can 
be invoked as `installkernel`. It gets invoked as installkernel during 
`make install` through some wizardry I'm not super familiar with. I guess 
it's more of an install binary than an install script, but there's no 
`installkernel.sh` on many current distributions. Just programs that 
pretend to be `installkernel.sh` which might confuse a user looking for 
such a script.

I suppose it would be more accurate to say something like: "It is also 
possible to do `make install` if you have lilo installed or if your 
distribution has an installer compatible with the kernel's makefile."

Thank you for your feedback,
    Hunter




--nextPart4890171.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEFaTi3I3XEd+IzfdZZz/o+CKADX8FAmVhXxgACgkQZz/o+CKA
DX8Zigf/eTnaLygqZ016WcuPu9H/SLzLYeVu13uhK630jtWnzObk61wTEo56mqO1
+xHspXMFagC9nXqk+yYAZIYoWzZgJRjTBKvERV1wYjEqKhd9hFeBm2Zb4nj3WYkr
sN3QuVUfcJTOrhwRKiLV5ukpjkZ2iPbt3A6awVCwXbV3Q6oeXVqR8yRohhewltkw
k/U+50L9+JvADEMtg5LvVpwdrx8hVce+eU92iAoLRuRpZMaNZJFmARRLISKflitd
Ylwnd/EJlgtblNx0TcqphRvYWThkx4CZ6ubcZ1u5TCIgkNnrYSP3DuFBBZYnpLTT
c4MMmcipAHWRgpr8GyQCAlYn9GcrSw==
=c9Gl
-----END PGP SIGNATURE-----

--nextPart4890171.31r3eYUQgx--



