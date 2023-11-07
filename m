Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6A27FD
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zul2s9N2"
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FD410D;
	Mon,  6 Nov 2023 16:25:14 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc3388621cso47154485ad.1;
        Mon, 06 Nov 2023 16:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699316714; x=1699921514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KvNevDILmrFumM2oQIUBMvMXYtsYvLzdrTujg9hVkHI=;
        b=Zul2s9N2KkSupO/TwA8UHr+KHM7UiZM3IB+LVdsZRPKHAWdNbdyV1q8GVJe15D+0Br
         /ikMyE0wcNDlnhrfmX25lUyLq4gyt5Ma5FzTMVz2XPO2yl7Eke7nJQWGxvvlpHQ0wpSe
         vIhhzDTVrUb9z9zP40iyYM+xrhPZMZfRtfR4W8vRn4uG1SkqkRZS/Jh4Qay47PIG8xog
         Khi16id+QOq0tgs9kCuW8YSVvHrUPyg8Y1VfWGWp7bVEWXOOOjneZaEt8kzEO96lTVvx
         xXiszhidi4TZb0YvWV5Q6Sz/HD4DBYj+KzIlSWVRjHYoNW3Y3KnqQRVocsk/QUIhRwih
         dusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699316714; x=1699921514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvNevDILmrFumM2oQIUBMvMXYtsYvLzdrTujg9hVkHI=;
        b=IQJ6KTzEk03TNEHrYet6bDo62UWBqSksV7kwJIQpS1/wNU48BmtUdwMTkvXneqsnk8
         /1TSWCKPoim3hF7dyfQqu5fY9tPuGrSuXhmkTZUu95jTEWKTubkQwlISCrZQUkl9ebsS
         v9iNtDAugmGws3mKs9x+qk31AvwjohtxBLa3eCaWPO20HeHzQRGvwwKBJB9hDNF6qJ0M
         +lN4/FS1zMC/QZCjWTTdNK3i6nElZiqU3808JQOGMwH7MORj7ISErTduc8ZJSbwIiQzE
         8BN7d7RxEtYG4dqB44BTDm3QFjlipt0JdN8DK80LRwPGqpQwuBv1QlBrCwJhBZx8VcS3
         JrRg==
X-Gm-Message-State: AOJu0YyMSJp+Y7NWgcpAYwABaAaD7MvCnfzmDSVZ++oaf8IiiD3d3iHT
	rKb5+PSYYG48galZc5oWqvG+jbx9+tk=
X-Google-Smtp-Source: AGHT+IFpEJjW+6bQ6vlcdu8jbIyxxRW7ZMOKGK03NP4M1Mz4NcROaycZ11XDShYh+2rBgXl2g25WXw==
X-Received: by 2002:a17:902:e551:b0:1cc:51ee:5faf with SMTP id n17-20020a170902e55100b001cc51ee5fafmr1650822plf.7.1699316713622;
        Mon, 06 Nov 2023 16:25:13 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902654700b001bb1f0605b2sm6573600pln.214.2023.11.06.16.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 16:25:13 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 63C18817FA85; Tue,  7 Nov 2023 07:25:00 +0700 (WIB)
Date: Tue, 7 Nov 2023 07:24:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hunter Chasens <hunter.chasens18@ncf.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: Re: [PATCH v2] drm: amd: Resolve Sphinx unexpected indentation
 warning
Message-ID: <ZUmD2u7qZS9XWRRz@debian.me>
References: <20231106201739.29507-1-hunter.chasens18@ncf.edu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/im2KQQsxOjeQDIO"
Content-Disposition: inline
In-Reply-To: <20231106201739.29507-1-hunter.chasens18@ncf.edu>


--/im2KQQsxOjeQDIO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 03:17:39PM -0500, Hunter Chasens wrote:
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 517b9fb4624c..81b8ceb26890 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct device=
 *dev,
>   * Reading back the files will show you the available power levels within
>   * the power state and the clock information for those levels. If deep s=
leep is
>   * applied to a clock, the level will be denoted by a special level 'S:'
> - * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + * E.g.::
> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>   *
>   *
>   * To manually adjust these states, first select manual using

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--/im2KQQsxOjeQDIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUmDrQAKCRD2uYlJVVFO
o3+ZAQDfjlESW3+XuDhrOEojS9fqik7nCHXgYFOPvulyC48CzwEAmlHOs12KiwgZ
BP9nE37zIUNmEkWjNU+PCfws51OmbgE=
=JkyO
-----END PGP SIGNATURE-----

--/im2KQQsxOjeQDIO--
