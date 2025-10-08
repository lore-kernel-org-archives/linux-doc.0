Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790454763
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882136; cv=none; b=kPoh9jhQQ70rNid0dUhu4x//jmkPGK7goA95O1UKGf6WJhwbH/bBHU8jGIzGKQZN6OIWFmBrlQ3OCuokShU/Y64NZuOX0mAIMe53nE3F7nTCTwy1awL9MJvQc4lI7QqscTVUNjmsMLDNttyH1ozxzuSmF/n3Cf2G8DkO1uJMRps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882136; c=relaxed/simple;
	bh=TzNbj5F09hehstERxCAIDX4BS8a4whqVaxlUmycH1V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeyEGIstTg7oUwppsoi2aLQ2LlHaymCzIvpP98+U1yUUIPa9o41sdogcj0DeDejWmh/YYXNowndBRCEY/ocX12GPVNqY6cv685uAhu1NJjOVqWWoCJAnNpAzaNmvyK9QZlDn6KfQII72vqqtvWpJjZsCqWltSbZdv0XviusBBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uvc7zp2Y; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uvc7zp2Y"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b631b435d59so1166338a12.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 17:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882133; x=1760486933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzNbj5F09hehstERxCAIDX4BS8a4whqVaxlUmycH1V0=;
        b=Uvc7zp2YtLGsPEPTE4M12zTHbD2E/n0JxnU+r3OqlxYyEciMsvIPMCoksg80JJqgyd
         QUh74XE906/BgKc7yuwprYfYm+VR0eI8MxtLc2EQtbGj7FYdarFXCSTPmwZNjrQP9xuQ
         ikD5iRbJJi5H/6S0Lz30BmN8e6pz4DXZhqCt23GCtWPq5GGUIliS+8D3v1800ymu/eTu
         Crlc+xRJsqDsuFGWoAB2ByxQAmp1rWkB915XipFdpYIqZxRsRyY0xLTtA3wnJiaYFZ+w
         keVCBKiL5CoSaobO4WjOGKd6ZJxBXG1zicxQp+72rzt0vfrjiSYayZt6OzKloBG3wajK
         WWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882133; x=1760486933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzNbj5F09hehstERxCAIDX4BS8a4whqVaxlUmycH1V0=;
        b=iRoXkCnUm8GHWjRu0CHGPQ4MFeYkQDHYrLcinmv/W1zDcWnyiwzEo0S71oRwx5CbUP
         eCYGNGggxYUXpUqonznnhEgwqswQSJUuSOb18QQCd2xGLByByubg/oXLsO0E8HCimeoi
         ulyHhRIDSlVMHwnhTNSpvqMX9oyenwyWZnCOq5J3MToakcnGPfrRXMTN0pLqYCxRrobU
         EI2p/vG34jzan9BVUISC9dKe2ej2s2bkQXwyFRp0c0bXQqyR5g3sZtPfgIsw9DMiDNdB
         rFJsSXwAT5lp+NZyCYSCC/tdBgGdLAlh1GshqntiepmzL1O+AR38u/kM3NMvuBH8lukr
         5+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX26dV9ROtFHnhBYGLV1/rch/HVJjG3P87rcAUk+CE9O5sMHrhuZVUykuhvvkTGJBeufBi1BIcnAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5fje39HxqeLe/uuQA72ncwXV+tU9nYGLkGmmFQqPMzOxziOu
	zw4W+bqtzIIB0KFrK/U8puoGx9OhKLiQg2WAuWI5M6Am9Be4wtL/tO9o
X-Gm-Gg: ASbGncujPCi22pOFyNMNlUfbM2I6jTVQQvhPdTZ6Ih+vlFV3tGjNmLoFGoIE70MQuR1
	rWVL6SrxXzP4P7hXK4WUciiJbLul16rBYapSAv+503zdd/f9dcsZn/2eT2YX9qK/f4pjtdbQ7Ks
	kic4EYsmXYtEq9MsvTEimGrBrd9vaYXpvRjHz/xIHpC69VYf2LpjO7knq6fY2rFVYK456mQZZLe
	p4kmjcGS2jIZDrvQXx5wPysP25B+QEP6/ApJ5wyR+GE7teshIkjmxbnXkwCK7QNKx5RT8Vd86tt
	Frqb0Fqrjum6xsTcpDUTewHRnfs2OFgIu2E9wDwYNZUnWZlQZK/vIz5Irg6OsblABZnljwZ2aGt
	PM4W3nd7HiQyghxmXFsoE/01caF3qrnWw01QCemWZ5E0katmAtg==
X-Google-Smtp-Source: AGHT+IFz4iqQnGC++UNb9avJGyf7WNgIxVS5Iniz0mvnqB7gDtzJOUwL4fBGjQJWpj0aVrcA8Elc1Q==
X-Received: by 2002:a17:903:2302:b0:263:ac60:fc41 with SMTP id d9443c01a7336-290274030a0mr16042285ad.48.1759882133374;
        Tue, 07 Oct 2025 17:08:53 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1267d7sm178391575ad.49.2025.10.07.17.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:08:52 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A68294233430; Wed, 08 Oct 2025 07:08:50 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:08:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 4/8] Documentation/rtla: rename common_timerlat_aa.rst
Message-ID: <aOWrkhlBoKDH4fRi@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-5-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UKApmRWlee9TbfyG"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-5-krishnagopi487@gmail.com>


--UKApmRWlee9TbfyG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:53AM +0530, Gopi Krishna Menon wrote:
> common_timerlat_aa.rst is intended to be included by other rtla documents
> and is not meant to be built as a standalone document.
>=20
> Rename common_timerlat_aa.rst to common_timerlat_aa.txt to maintain
> consistency with other common_*.txt files and prevent Sphinx from
> building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--UKApmRWlee9TbfyG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrkgAKCRD2uYlJVVFO
o15NAP9cMZH7s50QpPUQSGh96FcYFqRpcCt7ov3hAmYqpMrSTQD/ZF0oz7pf16FU
vZKihKt7nGCu8ziutqKJOZ38dw3sEQg=
=whcv
-----END PGP SIGNATURE-----

--UKApmRWlee9TbfyG--
