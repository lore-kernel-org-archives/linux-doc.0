Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295561;
	b=06XQ8WB+7PprLVCWnuFm8aHMaaguooLtaoXbwWpmJFlI+Xm63WpNQeHYHiT4bxFbinq7
	 NsqslNvb/cX/yogamRHteYacozl/0b9QOx4tmJd/6g4XV66WubDsv2xV1JVquiI4JyhwL
	 2Ydt72JZY8hnHMVZSYvIDWpqZYC2sUa78IA+xhhrNCSsvTSNcn+qZp1CzQrkArsVxNnME
	 zzp3h89Vl4F+zVOvwCavct/4VVtz83dgOcck1dpq/pRVVAbFNNIFjhFR7c5gpCKonO15j
	 wcbEGp1wVSFkNtZdrHa4xzsNyDqOuMPpENEtA0/SnDqGWa1MZ4/Tcrv2AkPDDWnA8DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
	b=5eB0SkJAsRMxqSqmSDjov2DPcBR5bY+GmuDdPyoaDaWOOMnKwnnnKsl/zXDJ+ByAJu8C
	 nbNORGW5UBKFVhJFWwUyafYwQ2NFk4PUejPSgwOB7FxhHCf/Ir8Xh0LAaMC/s7Zda82UN
	 a6TZfbjrrw38XfF0+hCaVckWv+3Bx+jqlIrfObwKKDt9+RE3rGeONl+xKt/ToDUyJa0TB
	 crH9bksBmzP8UJU7zx9C8BJJUaVPbTAE+IAOed3dHO6D8Xxsdn0KZkyDAkuZZjwG8kAJy
	 cRVIa8iXgG4kAvx+BdSmmdDoq5levTGxUlA5PLQWQapNi6o6By2uaZg8Qe2c3ecFUsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bsTu7zHj;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D4606A31D
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 17:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 371D4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bsTu7zHj
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17315315e9.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793295558; x=1793900358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
        b=bsTu7zHjbgIVlcHu3NdjzeuSwabHni1qavw0nf+vr+ww9Wf0DF9C5hRTQELcgbXmh9
         feMgPO+/4tuqfM8ixO/eOgEEjtNreGPgAQFMyJwZGH31gCPA1n74OCu78wEQuUZoxPXh
         Re0mAy8xwDeFS3W/iijqPr/xJb2HHbT2yciOMm7efix+tZrfT9prkpxTd9JY7KQjvAt4
         sQg0i8d3h30HmR9+SPa/U/tlmYQ4fkxmwUYoEQ1gPwZKmsX9wyL6HwJJwbzHysHJ75CY
         FWzJFc/y7kOJL6bmMp5QnxrAGBolDX2zhVB6gPNxL7iaL1nZKqcqSRkz4lxY9EZWDZ6X
         qotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295558; x=1793900358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxKnxxpthVZvnSjcILi92P8UHB/DkKivIP1tzJVYEyI=;
        b=Lwsi/NLrpHofx0sCTVRseIDo7lx7oK9X+7FjY5hesYL37o2iTh6Vsfe2+Wv8mmsyXV
         FlfpeiBELMdK1b9038P0rOlZie2Y62VIsGYRdLMP22OMVcioluYSmUMThBQ3Yjfo2+Hj
         bFt2orbnQz4fd7nlixit5fe928inpqYz12yOlbbS16gF3g1yPJDW35DBye/14z/05Bwa
         edqEuCANfjSAy9K1cBa77/sfMQKp13RDMDMUImPq9BmFiddVMQszecauxw8JSNdSOgvv
         caFjsdpLw4fG3t0dgKRErcbqfWGUO0pEToTMU/jwsrMz5bjVCav84X6pViczfvn6fRvS
         PhpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrIHuGN95Q4BELqV2ospJug+ubWWVA1vOTW06eUA62aLsbvhRUhzdG0rboW2Bh9JDhYjgd6WbvOQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBbOl1HRF6tXCsh8g8+Gq86hRalQqH1xFj+i9k+LGEYFhU7QId
	bCuDyonHCtW7wSC2apssi0IKAP0XZlZrGGZh7JGXwcvKaBd29SbakV10bBawTfEBk+Y=
X-Gm-Gg: AYBFou2+IY17wBjY2ch6RvwU8BBIMxe6iGUL2tR+6PD2q1Hv3OZNCoKIqYgYlddgohj
	PfAMGruN4tEzLCyYJbhl45sc6aq8vNCNOebarx8/8ybPDfZFABE0PBHwDlGI3HpLpssp+1v5S0M
	CQJUKK4wW1tzCKV+I42ZLcUg1Lt/ykidb4egz+nZ8VnNqoe2gFKqssJ5Ij5xvPQTzvyAGuoWP1b
	ip6mxV+su4P9wUaho5nbte8QxKOs99Ru6mN8dkVN49AVGMorWQQLSmKhWk1DER4FettzWJWzYsQ
	ppsCXrWu5ZYzwKZf7yBm8mHWqg1nRytm/GvZ/6Bhc/BvHgVWNFG2YRMIc8sicwWTKN+nd/vK2Zx
	YZcxuW9ieRlKqFfVgaacOArFzEEJZUKYcY8VEkWZv3aM4nGggvGy7CIKM/Byd/URjkOyxm9dloy
	/qNzScHmHM2qYmLn/+6IcwrPLSw5gFomr6ZKEe5JnpME+41omAeARm8I7vTEDt0Ad8DvAq/zw46
	/nUba7QAGwK7WcjslgIJRi0LyudoISeZce/NIPYAA4D6PW50Cd9yhEb7BTcAk2X3gHBJxgWA3w5
	s9riFXmNpOH2mUw+4GWjk3OIbo+jxuJ7gUE=
X-Received: by 2002:a05:600c:b8a:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a96667c848mr135986785e9.10.1793295558589;
        Thu, 29 Oct 2026 10:39:18 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e6df1e458sm627445f8f.5.2026.10.29.10.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:39:17 -0700 (PDT)
Date: Thu, 29 Oct 2026 18:39:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
Message-ID: <auODHyLrfQylISX2@monoceros>
References: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6fyrt6fnoykrkwe"
Content-Disposition: inline
In-Reply-To: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>


--l6fyrt6fnoykrkwe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
MIME-Version: 1.0

On Wed, Oct 28, 2026 at 02:42:15PM +0100, Greg Kroah-Hartman wrote:
> This reverts commit fcbfaffee51a452cc8efcbaa3b88ec4595678424.
>=20
> Turns out that vfio is a crazy beast and people have been "relying" on
> the bind/unbind debugging feature as a way to handle passing through
> devices to guest instances.  Because of this (https://xkcd.com/1172/),
> let's revert the feature for now until we can figure out a more agreable
> way to handle this such that normal workflows do not taint the kernel.
>=20
> Odds are something like what Uwe proposes at:
> 	https://lore.kernel.org/lkml/cover.1790612298.git.u.kleine-koenig@baylib=
re.com/
> will be the best way forward and will be revisited after for after 7.4.
>=20
> The feature was originally intended to stem the flow of unnecessary
> fuzzing reports of "broken" drivers where random devices were being
> bound to random drivers and of course things were going wrong.  The main
> syzbot tool is now not doing this anymore, and hopefully no one else
> starts it up again (but in this madness of LLMs these days, you can't be
> sure.)
>=20
> Thanks to everyone for telling me just how wrong I was to implement
> this, I appreciated the feedback :)
>=20
> Link: https://lore.kernel.org/all/DLIL9H50MALI.3JROXYEEUM3KU@kernel.org/
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> To: Randy Dunlap <rdunlap@infradead.org>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Johan Hovold <johan@kernel.org>
> To: Steven Rostedt <rostedt@goodmis.org>
> To: Masami Hiramatsu <mhiramat@kernel.org>
> To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> Reported-by: Michal Pecio <michal.pecio@gmail.com>
> Reported-by: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  Documentation/admin-guide/tainted-kernels.rst | 52 +++++++++++++--------=
------
>  drivers/base/bus.c                            |  3 --
>  include/linux/panic.h                         |  3 +-
>  include/trace/events/module.h                 |  3 +-
>  kernel/panic.c                                |  5 ++-
>  tools/debugging/kernel-chktaint               |  8 -----
>  6 files changed, 28 insertions(+), 46 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentatio=
n/admin-guide/tainted-kernels.rst
> index a208811ad525..3d312bc17942 100644
> --- a/Documentation/admin-guide/tainted-kernels.rst
> +++ b/Documentation/admin-guide/tainted-kernels.rst

It's not part of commit fcbfaffee51a452cc8efcbaa3b88ec4595678424, but
conceptually we need=20

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/=
admin-guide/tainted-kernels.rst
index 3d312bc17942..fcb8b9734548 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that to th=
e aforementioned
 script, but if you need something quick you can use this shell command to =
check
 which bits are set::
=20
-	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i=
&1));done
+	$ for i in $(seq 0 19); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i=
&1));done
=20
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

in this change which was fixed in commit f1850e443b0e ("docs:
admin-guide: Handle TAINT_FORCED_BIND when parsing
/proc/sys/kernel/tainted"), but that commit shouldn't be reverted as it
contains a simplification that we should keep.

Best regards
Uwe

--l6fyrt6fnoykrkwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrjhMEACgkQj4D7WH0S
/k7pjQf/fZLeX4jg8q6vdwBmv7dGxKbev3ARRZTtVOacOQwftIek8l6UKQWlMwoG
/tiokVc22lkSxsHq47w6eKUKpucHydGzT8Y7OZvHNjOjZ1o9WS00lJRh6uhVTh06
MK6k0za6dBbrOWnTBeTGZuWlLCOQKpDB/6t93V1fIYYJSd0ir3GpvVZzfM16Pk0d
opyBimIxlfjCuxzRbj7DZjzv0I5PbjXdox41VKx2cx60OzFJdN0MKZifLp9yNV4s
s6Tc4Q1oK/Ih66hhbojNkTp6Xyzsy2m0lvku9N0DitT5/VXqoI/mdedlPK7tFWeh
qZAoONEgzf9TmSM0/P2g0K+1mpLkrg==
=/byF
-----END PGP SIGNATURE-----

--l6fyrt6fnoykrkwe--
