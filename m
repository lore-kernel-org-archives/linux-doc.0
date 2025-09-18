Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B131CA64
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758237794; cv=none; b=ZwbsqzA9owL4d4zCD5xZhsb41dzFgrmhhQVRFv3YHiou+wpijfLTCQJCyATxh7nSemv2sMoCS5CtoGnEPYAwPeZGH5bJzR925Rj92sxGSPq/+TsRHO0td82nFmrskxtbGCQYl6Sav3z2+ZiWsAfsllaNr8JqK+0wVXjiKG8uNvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758237794; c=relaxed/simple;
	bh=Ef6Rx/N5TdXrlfO8lXio1fR8SoaPImH0mD+Ap5KLFW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egCTVkb5vi9HwFtbFrvifBXf8DDyDhPlUsDjgPeLK1X+wKx6GO+5NM2ZanlrMf0vPpYGH/4EHm5pvVcPCanFkP+VPoY8IJIdRQKSPsvko10rYQd7CabOpfqGD6g+IhJGkBD0Qnsuv4+7Ashd5B4J+5ggTQDIWuMk+ftqSR2W/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luLgGnIx; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luLgGnIx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445806e03cso18076255ad.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758237792; x=1758842592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cywbwc8EdUxJw4qdKc7+s9IRWS7iBCfFJYQJGElQO3Y=;
        b=luLgGnIxBnTH88GFo1W5xRfvjAKInbTT3pyBUnJIazeftoQ+vDUmf1/L1SWp6n+SMC
         bLgC/RsR6L93kaeQEtdHnc+ih5oOGJtVut7TkVlm0yzw2WcIAPJQYJamSfGGXqbAfLB1
         KmcM9XFuj9dL2C/WxiD0mkUFMdMVWk3zH8v2sO0wcVK9Bpbrqx/vBJCFUitI0XjVqYrN
         ZrFbM6PxJ+G5rF/IxbidbCEZDFLvEE+OgH/LThX2tmb6FLZ8LTIni49U/P8C2fxauMQP
         QIWHkK/PVtGEJeI331xdvwUhiBkqhb82KnchApAR/Q9SKefYbmUX0L/d+ZDXZLXs/Lvt
         bH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758237792; x=1758842592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cywbwc8EdUxJw4qdKc7+s9IRWS7iBCfFJYQJGElQO3Y=;
        b=BVtejDqKlrWEOTy6ejudusmmg1Wq4YyXZGMF6Uwxnc98UFbfAIseyOZ+UHW1NZSQiN
         MVurhWs8y9Rbcqe6ZRhay/njMsFlPU3lsrdyfXnAyWOvXC7la1TOms1tFYRmL8sj6fF6
         rTODUEJBEoGv98oyVvtXpN/fPbH3jDz7hFd1dXiUkUv8KZkOmt1rbyTKdQ2J5tv3kmwf
         FYHtgqbemxNPqtTXimg5t/vLDdSdLJqd/sBxY/HGHNjAuklhrArdKG++xqguTnObHJOh
         JP21VsxMwcF3C/nlrHkz2YRPEhp4oaQ36io87imp5onwQakMKh+jk+IvicaIGchMmbIO
         tG+g==
X-Forwarded-Encrypted: i=1; AJvYcCWsdJjntDJSrjZ1Cg+/jnYN/OG97Bi6m1u0b0JAQcPO6/ch3iCDfKd3vlL4zI2sHf2ODexgGlY9zi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSh+IgFDCPrdQnlFoPiDlcNH5BnZCbZwCeXvECeMgJ+Rf664t4
	AE14XRUymVubjUjAuof9JGl399tJL6NEJqDzD0jl875zyan8j8vTW6il
X-Gm-Gg: ASbGncvPatFRw84H/gRlNBePz73OM0f2ur69nJtCwbFE2b5tSZjo26cAsDxBW1V+ggx
	iN3KXXtjtvL6oHu74J5PuHF6i2iIbmsWxy//5d9oQIi/2hqtM9zN8doozgtBcuHGEKgm+tEUffi
	YDo15bVJ+8nKUJbLaobBadH0PsauwyH9n5k64BTm4a2enkkk6wGzBGpCuMcgCs+PH0JJtavW8cN
	tA4jQ41t3YDL+wmNp415IIvmSNx0KUfRROck/ru/JN3/krE9Bve5qcmglUqPeJ9M5tGLjwMn5z6
	ShkZDNEpo++XsrBuQFn7M/tjZ+u0op6z78czK5+0skypMpgMsDto7RHbb6wjRGMnVZKk03fkpbg
	ABWaFGOaUugshX1Ihp6F+IUSNtftydi0rO9NHQcWL
X-Google-Smtp-Source: AGHT+IGpNOwUTJg5vEerN1zVzVrhhiTJaIsAfQYpkwPbjiwSkLY7kk7Blhp0t2/ryk7iJPRhMy3cEQ==
X-Received: by 2002:a17:902:d511:b0:24c:ce43:e60b with SMTP id d9443c01a7336-269ba45c0a8mr19654615ad.18.1758237792166;
        Thu, 18 Sep 2025 16:23:12 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e20bf07c4sm992769b3a.70.2025.09.18.16.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:23:11 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0313E420B4E0; Fri, 19 Sep 2025 06:23:08 +0700 (WIB)
Date: Fri, 19 Sep 2025 06:23:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Philipp Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Philipp Stanner <pstanner@redhat.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/sched: Extend and update documentation
Message-ID: <aMyUXCF-Jlu3wAjt@archie.me>
References: <20250902111209.64082-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qhp/VLK82Ka+Yy/u"
Content-Disposition: inline
In-Reply-To: <20250902111209.64082-2-phasta@kernel.org>


--Qhp/VLK82Ka+Yy/u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 01:12:10PM +0200, Philipp Stanner wrote:
> + * The GPU scheduler is shared infrastructure intended to help drivers m=
anaging
                          a shared infrastructure

> + * command submission to their hardware.
> <snipped>...
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job.
> + *      Drivers don't have to be mindful of this function's consequences=
 and
> + *      its effects can be reverted through drm_sched_job_cleanup().

           ".. this function's side effects and these can be .."

> + *   2. drm_sched_job_arm() which irrevokably arms a job for execution. =
This

                                     irrevocably

> + *      initializes the job's fences and the job has to be submitted with
> + *      drm_sched_entity_push_job(). Once drm_sched_job_arm() has been c=
alled,
> + *      the job structure has to be valid until the scheduler invoked
> + *      drm_sched_backend_ops.free_job().
> + *

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Qhp/VLK82Ka+Yy/u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMyUWAAKCRD2uYlJVVFO
ozP1AQC87UKQORC06R0t9sItFjRkRGzZuHrMM2C41aAjbI9oCwD9GhjvSUEkZs++
clAP/8722HiSPJona2f7L3BBaH4cGQ0=
=kNNY
-----END PGP SIGNATURE-----

--Qhp/VLK82Ka+Yy/u--
