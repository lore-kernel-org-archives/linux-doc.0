Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcDGsYj7"
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E915FD6C;
	Fri, 17 Nov 2023 22:57:45 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6c4eb5fda3cso2773520b3a.2;
        Fri, 17 Nov 2023 22:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700290665; x=1700895465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmkXYXE30FSJCqGwVrvQdeF2n4RTnA1NPHyhBfzNcpI=;
        b=OcDGsYj7JT1Yw8AJhJaXi8VPEFrjj20Uu4qYRjA9ezvFiuFuTrV/F0z8cas9pmS32h
         3HuaOIBYwGT1UxFHbIVJUiQRU+tnl+alFQfmEn+mCnLbbzG+szpVmi/91dN1E02J6bHS
         56rbNotg1wZCvT6qjy9ZSnt1eo0iesT7hOKQsO2Ovfh4skEpoWbuOSZvIDVo7eGJyuEk
         xBpNvB8NEDXQUNQhmwDZoRhwkRF1vVYwuin/iLXQkTi3DGVTFw3oJc8FPUuXcNGnk4L4
         gFXdCBxcgX17yLKTndVOjFqjc/6iH6eanGWh9t/CHFemO9UPVr3jcLaqCwS+LPVe5Uxn
         O14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700290665; x=1700895465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmkXYXE30FSJCqGwVrvQdeF2n4RTnA1NPHyhBfzNcpI=;
        b=c90ZBlk6W7qEoi7CSk2GzncmF/sOagAa8i01lzuU59Nox6Ym5aYMZTjppvwOTowMma
         GjhnIYSWHf3ikhIJZFIGtI2ZR8YvoTVaNA06KEm++AvJGrz3Py69bMjoeagfOjAciLOr
         G2K+FpdrBu/OvFg57nyK2N0gfIm0A1njeBebQrECkXJEkN3HbASfEtxXV+Lz2jlK0fp/
         y8hTE9P2U3MKoNoKidXbbhKfPVc+pvegtRt4jaF3DM8CTKYIOPmTwe0SFLsChuHdb4rC
         QhfSXiGq/fhu16hR5Qt6/6U8h0HrOnPeLbLnfJ/z5usHuNfro8koPSzUhrED9Cdj8eVK
         +MVQ==
X-Gm-Message-State: AOJu0YwDeAIa2IfCZcbAVQQiuIkcfYVvTOqmQdFnkhKvm/sx7Szuf8mM
	2mvSDubKMYfbfHPvhNYniFM=
X-Google-Smtp-Source: AGHT+IHrWN7H7iZZ0PjIQhwXQnMmrfSgbCkXI+vE4StHgq8rE2EHS8OY7+87OGiINU9TSN8DQGTDww==
X-Received: by 2002:a05:6a20:3ca5:b0:188:290f:3da7 with SMTP id b37-20020a056a203ca500b00188290f3da7mr1917449pzj.14.1700290665104;
        Fri, 17 Nov 2023 22:57:45 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id x4-20020a17090ad68400b002802d9d4e96sm4093213pju.54.2023.11.17.22.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 22:57:44 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 9F579102A830C; Sat, 18 Nov 2023 13:57:41 +0700 (WIB)
Date: Sat, 18 Nov 2023 13:57:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ariel Miculas <amiculas@cisco.com>, linux-doc@vger.kernel.org
Cc: serge@hallyn.com, Phillip Lougher <phillip@squashfs.org.uk>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: filesystems: document the squashfs specific
 mount options
Message-ID: <ZVhgZanTGYE94p1t@archie.me>
References: <20231117161215.140282-1-amiculas@cisco.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OOjyLEvCGlxJVCOw"
Content-Disposition: inline
In-Reply-To: <20231117161215.140282-1-amiculas@cisco.com>


--OOjyLEvCGlxJVCOw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 06:12:14PM +0200, Ariel Miculas wrote:
> +2.1 Mount options
> +-----------------
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +errors=3D%s              Specify whether squashfs errors trigger a kerne=
l panic
> +                       or not
> +
> +		       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +                         continue  errors don't trigger a panic (default)
> +                            panic  trigger a panic when errors are encou=
ntered,
> +                                   similar to several other filesystems =
(e.g.
> +                                   btrfs, ext4, f2fs, GFS2, jfs, ntfs, u=
bifs)
> +
> +                                   This allows a kernel dump to be saved,
> +                                   useful for analyzing and debugging the
> +                                   corruption.
> +                       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +threads=3D%s             Select the decompression mode or the number of =
threads
> +
> +                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set:
> +
> +		       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +                           single  use single-threaded decompression (de=
fault)
> +
> +                                   Only one block (data or metadata) can=
 be
> +                                   decompressed at any one time. This li=
mits
"... at any time ..."?
> +                                   CPU and memory usage to a minimum, bu=
t it
> +                                   also gives poor performance on parall=
el I/O
> +                                   workloads when using multiple CPU mac=
hines
> +                                   due to waiting on decompressor availa=
bility.
> +                            multi  use up to two parallel decompressors =
per core
> +
> +                                   If you have a parallel I/O workload a=
nd your
> +                                   system has enough memory, using this =
option
> +                                   may improve overall I/O performance. =
It
> +                                   dynamically allocates decompressors o=
n a
> +                                   demand basis.
"... on-demand."
> +                           percpu  use a maximum of one decompressor per=
 core
> +
> +                                   It uses percpu variables to ensure
> +                                   decompression is load-balanced across=
 the
> +                                   cores.
> +                        1|2|3|...  configure the number of threads used =
for
> +                                   decompression
> +
> +                                   The upper limit is num_online_cpus() =
* 2.
> +                       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set=
 and
> +                       SQUASHFS_DECOMP_MULTI, SQUASHFS_MOUNT_DECOMP_THRE=
ADS are
> +                       both set:
> +
> +		       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +                          2|3|...  configure the number of threads used =
for
> +                                   decompression
> +
> +                                   The upper limit is num_online_cpus() =
* 2.
> +                       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +

Regardless,

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--OOjyLEvCGlxJVCOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVhgYQAKCRD2uYlJVVFO
o0wEAQDCEx69r/MxTfIs1EtCoWEgiy8qma4H4G3Hd+wpZPOUEQEAnI7JrM33/nsT
qlXLZWbFFQA7dGEauPJSvUjCjiSKeQQ=
=bOD2
-----END PGP SIGNATURE-----

--OOjyLEvCGlxJVCOw--
