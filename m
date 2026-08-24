Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE336604B
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570108; cv=none; b=JD1Kv7ok/vAG9M9OgXa4yPsW5FbBWg4CqEk2PMJyw42qe1GO7T1jzSifrhzkuxdpKWO9M0qQywiFXV0TIbVEko3d5xm9hhu++SjWOCUP1FTajXUr0ojLAagMwvvPDr/O+uUaB0ge8/NBX9CoFC05gvM4ZLvd4izjylugJjcue/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570108; c=relaxed/simple;
	bh=oRJiAzViir+kVKHmOKnk6SlV+utqT2r3sgM5NS339/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEXr1k+8kphdvCON/jlHLtATMI4iKNKHObgHQsSlykt/8P3uO7AD5/xSsV+SUtn+uwx0NfR20nALEZDsPcjfSaq/3dCII6PBmQo0uF79JsQwXF0CgT3SdTs1d0F5XVoPUAhhQIq5aKGf0IGmm6CVW3HbA+uoOHZpEBPVDRk6KP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A6UPhr0E; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A6UPhr0E"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so499515666b.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787570104; x=1788174904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6C0CZnkn3wpgcl7INjKPJg3z/EOZac/GnIdlTsK7Uk=;
        b=A6UPhr0ESK+MKSMSLgbDSir05TtVEm5VNHxKipO6D677BZLFS3tu2pyRTiFSAHX3fB
         URqJrSOsA32fMMN1Jlp1rXr8+i0mo0IQb5Wa4tUOwZ9y32VXqCqkLvY+9MH/QqDCkvqD
         dsKQBYTdk1opK6zcSj3RJ7plGbfJuKAWCNANNK8twwHJzQF4f5IYf5GQ+FJvwuBePm8o
         JrIFvURwk71Xl2JJKAyE0P8ZpyR2PDMo3A1ya6ZPEtW6jr41cba3bQ8opc2uUp8Dt8eO
         pkwENcIZP9Fl37Gs6fVbhf7jtl68V6fnLmdbTD+b2E+7nf9KPCTf8gVYXQbE7OaVWbGb
         IYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570104; x=1788174904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6C0CZnkn3wpgcl7INjKPJg3z/EOZac/GnIdlTsK7Uk=;
        b=iCqvkzO6WgcLuK5ZU/xZZJV+SMy1fHCAI9RIqvb4PztvTSLN7xtKFA+rGn7Q7CLe+E
         N+dwhifeBfCxeKE6e3djqdpE7JCs0+trodyfNov51Zw4Trh6XK5WcU2H+GfICdogZ35E
         nBDVCBuVfhR0Agk5pbyMsxNB8aFStsRyC6FRGu8KWOvvv9U65qyBWsUPFzRB4VbZS34t
         26R1hdacO+uOhy4bsw5vqiUOvcjq7IziFXLeC2j+2JxZQB/Ci/5VsBdMuePffmzDxF4r
         C40sWc3SB++RirZkcfdGHLfIEDfoOhXJN3flSMJdBdWgFfZlMVXXDhLDqOWklP+Shyg/
         eDeA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2d7d/ITrjLXinJOqL9t4bFanzlVicvFDIkqtQzLnFxosgjsS8oeHaGg1yb5HSbSM7Hhgja86PAMY=@vger.kernel.org
X-Gm-Message-State: AFuF++nU5a0yEV0lQQC2vtIXhwO4WUh/L53iXl5n2+uuORLsDbymjQ5H
	9J0b3OeCUFtgpmQSVSX0J5rPKzqezwWdCEKGhm0HYrkXdCm40ahQOGnTIY2rxJvCvNVqJyuaYt9
	k9sOVIzY=
X-Gm-Gg: AR+sD11K+6Lm+7x5lkSuKz/JzQzLdRFtcu3VNdZaTXopNjVyUzFifGEkTS9Gi+n4MCN
	WzSlOGAl+//5NHgd8NZPQouthb00KPh/sn6lNdCeu7Z4Qbu5rP/FrI1gCn/swBaS02iXpeibbBI
	++OampPREpaBdrBSePBDcjefvGY/V1+mOC/RkJLluUccceaS2L4sXYCSEnd5KLj4iu48F5MunQt
	zy1prgjIO7Y/zMXBob/A/Uys9MOILQ0csXXmtHGd9r6VUQpBlBxfLrRCq8Z2AQSxW3gIkvDu6Av
	EBywdRzFU9K30VEgBASp50e3ljhhBDusx3uAHjlwLo00LBk6k/prOD3bP6NH1Ycuq3GSvCBx88U
	JgtMyE1O9Q7smyrMz0uW9qdv+4d9PYDIsZDiNYTlMy9xzKoiS1R/ZnDWKmPzShMjYXy6P+OCK+r
	l4mtvH9/mz3V+OWoFA8C9ZaYJWRy0fuaCkoR+xBWm5LiHlCoUBTf2r6bshOCYtIgsEj3lVFSUmB
	A==
X-Received: by 2002:a17:907:72c3:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c249238c382mr2060850266b.2.1787570103710;
        Mon, 24 Aug 2026 04:15:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e025158sm8989092a12.11.2026.08.24.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:15:03 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:15:01 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: chenglingfei@foxmail.com
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: cgroup-v2: fix misc.events key format description
Message-ID: <aowmLvkC3xed2QQI@localhost.localdomain>
References: <20260824-master-v1-1-6866b77e1f62@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4gvoy4outf2w4u4m"
Content-Disposition: inline
In-Reply-To: <20260824-master-v1-1-6866b77e1f62@foxmail.com>


--4gvoy4outf2w4u4m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] docs: cgroup-v2: fix misc.events key format description
MIME-Version: 1.0

Hi Lingfei.

On Mon, Aug 24, 2026 at 06:55:04PM +0800, Cheng Lingfei via B4 Relay <devnu=
ll+chenglingfei.foxmail.com@kernel.org> wrote:
>    misc.events
> -	A read-only flat-keyed file which exists on non-root cgroups. The
> -	following entries are defined. Unless specified otherwise, a value
> -	change in this file generates a file modified event. All fields in
> -	this file are hierarchical.
> +        A read-only flat-keyed file which exists on non-root cgroups. It
> +        shows, per resource, the number of times the resource usage of t=
he
> +        cgroup and its children was about to go over the max boundary.
> +        Unless specified otherwise, a value change in this file generate=
s a
> +        file modified event. All fields in this file are hierarchical::
> =20
> -	  max
> -		The number of times the cgroup's resource usage was
> -		about to go over the max boundary.
> +          $ cat misc.events
> +          res_a.max 0
> +          res_b.max 0
> +
> +        Each entry is keyed by the resource name suffixed with ``.max``.

I reckon the docs won't list the key names verbatim. The proposed change
somewhat hides the potentiality of multiple types of events.
To correct the printed key name, I think a smaller change would make do.

@@ -2991,7 +2991,7 @@ resources (res_a and res_b) are registered then:
 	change in this file generates a file modified event. All fields in
 	this file are hierarchical.
=20
-	  max
+	  <res>.max
 		The number of times the cgroup's resource usage was
 		about to go over the max boundary.
=20

Thanks,
Michal

--4gvoy4outf2w4u4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaownsBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ai4uQD/RrY84oBJ8Bs84pOzH7FB
rHTP8CDMfg5CJTS6eAoPcsUA/2X9rTi382aQqXYBW9yPdA2hZ1iwAX8sR7Z3vN8L
JMUO
=NO3C
-----END PGP SIGNATURE-----

--4gvoy4outf2w4u4m--
