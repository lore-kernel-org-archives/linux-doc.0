Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816689;
	b=GuGzLQqfp3CtP2HqdMV0SNjgGgEcTvxIZ12AH+ZKin7b9mT6grabg8i3uZa0bx2iybHL
	 nmwvZSx24HiQeNX5fRHjRCV2eHmPn3hhkwFmzyrIl4pUC4lFcUv74IE55YRo8eqU0Iohu
	 awluKUbvsP5Is/g+2S+PHLiFmWuzCi5Jhs5fnu8NnxJwhmEN/W+uNhxpyYACTOZQdOL/B
	 TwzWIVqomj8ThYiqRyJYgCuvMD6Q114hx/VBab/Vq9OqZUGa2fHDtjhMqMg8Xke0jztlx
	 FFoixbnFYjyOtTtDk/K5zHpv5yPa8nraRJ+cWOjqrU7Bxg+vtmU5ztGHDQ3jkalISSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kyRnP5kwtYUNzzZDX5JFK75xNgkANSF11ZGqIG35Fvs=;
	b=MM3LQXRdCoX9xDFbOkAw3WmKfxhY89LcZAR3RKj9FxldDyqGgUZeHtGQSj3t5Ij3mUSl
	 8kEcxbd1HA5NzXjPnkBASCJadtYr+nxVjrZ2TCWfk0XxgtS6KHSVMtQR25AFO0Sh03N/y
	 b1bZg/jVUpxjqzIXfFJKH4Gjftw6fl73xy2tF2QssntKp9mpVeqyEOj2L00MdLgY0hzMp
	 zRI+a0dv5KpuPUWM7sAr85MFMWriuS1G2IiW04lLpms1d5M000XpZzpjhbvIWBVMg1WuA
	 GevXOD9hQpDT0Rv8KI+xFj+X/+l2zfcnwpGWF+pnwU3WpnjTVHu1y+c4qQK3BlzZ+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yp//CuVQ";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9F606A88E
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B9F606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yp//CuVQ
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cddc250d815so1107859a12.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 00:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816688; x=1795421488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyRnP5kwtYUNzzZDX5JFK75xNgkANSF11ZGqIG35Fvs=;
        b=yp//CuVQ6tdrKLYMsacnTGDNeVRcyjdQPnqJDsgEXE5mjxTaLLY2IDkO3w7/4LERF1
         ck7lG4y3JaDaUuNlqPyw2Mw9nWyIr3hTyvIRQGAxPWboDb4jfNOsmx6E0ddI2EvZKXNf
         1EzOJ94n3fEeNM6PndtETCPxRl7lBlNQjikHLpISJLcNFSAbjSYybnM24y/0ZkDvOxM7
         fEsYH31XCbEyXeZUpITz+ilx7YDm40vc5mYDu652koEjNkgebqAu0ci2xgm5lQXExJez
         uDWoyq2mr6ENsOBjoSt/enoPs/pdnn9oYAXO/OjDCyq+Yr1IhOXlKBP6Zs04H8UGUNDP
         8XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816688; x=1795421488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyRnP5kwtYUNzzZDX5JFK75xNgkANSF11ZGqIG35Fvs=;
        b=F5Bjio4xI9DiRygiTLHbU6XndIdVyoEHhxXGXAqZdB1bZzvL7VwVngAAFmiEqrd22G
         bT+Srk3pgBuR2dLiWs1RDvSAlQXpSf8qD+YPpa8KkLawJhucPB9DqVo1/HEW1FXYzXOY
         aLxJlfm0iLfXO5BGwbl2AhnjNaSm4Tyg1fNjwwOY10ZOrTyeqMGaI/s+JiBslNcPq5wE
         m2prWCxkyipzyp3o5AFdiz0PpylczsmpkODRJyWe+vugEJXWU0+kEITtL4sqtNGEpEZg
         aIrXY7Jzp12U14VKJi/w40kgRnV946W+rbGeEo9plWmRReS7+pvxS5ybEmtiP4GHPgX9
         S/BQ==
X-Forwarded-Encrypted: i=1; AL+hErHtc/GFMYa9k8VM4l8u3rArvkBzcY5Nbjx6/9txWx5SnA+mgC+rKW64kVek17Rvx6Z/326g447b5Xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DzyJOm/yYjK2aQRnf67OWQ3Yi6LDIB9L0pAKO9WZNm1h+XVK/
	omjIPm/8oFTUgngoc6QG9vcLB0dW7UTP77dWwawZDUsW0d8SzaZ7sbW+
X-Gm-Gg: AZFdTZftPIiCtTYrOupxL8cGQKafBIwvIMtSd5UMbSW0jHJ9mYQGRcKIahYVk75X8w7
	kpMte8iSyX+T8Tir5IYNnxGE3t3m13zC1WJ3S0h+p5Ssv3Tr3N1RKYsWySHovIkYHIXtMnqglsB
	Gc/7Y8KVgc+5iMGBhPstpxn5NpUQ3E7UIlHRK0C+1wQyZ2mPXFrjtFKBWPo0h+mAZQCWsCTJdBg
	BJwQMcD//dwYZEiQDVqr1R3XkZ3xgQYaCUK9txgl8/WjkxP6oTIPWAI1PxW1Ev5Y+kifIjyqIcS
	Ssa+WHUwfRHWYypAyqBatg6ZsuAPv96Xvdn8bNJibRst5EO8kxZQVmgKnAqDmnQSOHMjKfmLJAD
	dKLY2+EzGk4WWC54LFKxHjeDmoLHEYVVyOHBz7WP/KCDrW51CpmnPAdUwMMMIHd/rwIDPbfsqXF
	Z/8jyfbBzki1DEziKgkt1bZcVSjEn6O1UCxiLmXjXU86WHs3Ql+JlDgBRqi8GrW9YfdewPzW1SM
	VgjiQEZsP5Lnx452NitGwZ0cPhId449qQkQll8s5o9l2VVUOCqIkDQrDROhim3Jbaa2vSaBm9jr
	W5SfGuJv7xjk8wUHP+IoYQvZED0=
X-Received: by 2002:a17:90b:3f8c:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3b1b0b48069mr13299563a91.24.1794816688457;
        Mon, 16 Nov 2026 00:11:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm15087388a91.17.2026.11.16.00.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:11:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8D91E4240780; Mon, 16 Nov 2026 15:11:22 +0700 (WIB)
Date: Mon, 16 Nov 2026 15:11:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] fs: porting.rst: use literal string to avoid warning
Message-ID: <avq6nOcr_EddfFuz@archie.me>
References: <20260924183915.400588-1-rdunlap@infradead.org>
 <hyk4puvpheleitf4kt74aamqex2ytuxpda2iki5bgzoteldf23@pccvy6sdmerx>
 <avpzSippbZRkaki9@archie.me>
 <2571c5d4-f7c9-43af-b6ef-12f7414d4709@infradead.org>
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
	protocol="application/pgp-signature"; boundary="EWd/PLZe3Dyxq7Kb"
Content-Disposition: inline
In-Reply-To: <2571c5d4-f7c9-43af-b6ef-12f7414d4709@infradead.org>

--EWd/PLZe3Dyxq7Kb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:39:24PM -0800, Randy Dunlap wrote:
> Hi Bagas,
>=20
> On 11/15/26 7:06 PM, Bagas Sanjaya wrote:
> > I still see the warning on current docs-next, though. Has the patch not
> > been applied yet?
>=20
> This patch went thru the filesystem tree and was merged into mainline
> today (Sunday) - Linux v7.4-rc3.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--EWd/PLZe3Dyxq7Kb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavq6nAAKCRD2uYlJVVFO
o7F1AP0SXQPjS8cB1zqpVD7La05w+0/TjhT7iNLWZNRXCiwExgD+MEBax1sxKgvv
9TIo24H31S5uSJmAUUhyTxRhJN2ieAc=
=Qfgg
-----END PGP SIGNATURE-----

--EWd/PLZe3Dyxq7Kb--
