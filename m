Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4103FC2
	for <linux-doc@vger.kernel.org>; Sun,  9 Nov 2025 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762647477; cv=none; b=F80VJ8Rj5edf8mhfHG/hjotWofKgSpsXoklJb33vGHAZIk/dl6z966CLja2EWN2LOAFwEVoNmeJr1TBGr8SHd8G1d6BbS0jdCyxIZQD6dXt5D0zPyzJqD5kk0Cic8wJF/h6G9hV+tAlYOTy+YxzYTnHyKK3N8fo/vX+YXtzmB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762647477; c=relaxed/simple;
	bh=X4o0u61EUL2HL9e6hUwjhKpFF2BdKLBjbpfp6Ho3jmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6vxhCKmp0AAGXkB2vNpKKCw7wm3oARwH1O3feunG0A1qht6PL2p6k4WXPFTvcVkXwv+SiQtMW1tli7lWMMNBfn1qkT6bymSKTCELJhCs39kntOYDUHv/rKhfL4i86M2f0LlIm28oeC7Rr0iCOtTJwoNl044jlnU66uy7jEUYzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTxeXNwX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTxeXNwX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297dc3e299bso10206965ad.1
        for <linux-doc@vger.kernel.org>; Sat, 08 Nov 2025 16:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762647475; x=1763252275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X4o0u61EUL2HL9e6hUwjhKpFF2BdKLBjbpfp6Ho3jmU=;
        b=NTxeXNwX2pXjExTDqCWCgX/YSf5pesI3441bqIBMeRUvTL/pT0xkWHhuUndt/jEC+D
         dJZuTFzLm8afw42G0XhtmJirdu3vF4kjJVlmlUaNVxwgPOpVCIY9w6IqBLSsFK5dPri8
         4dpnq5ip87u7mgZDtwge8VfvQkxYXtyX3K7nr2GX0wgEBvsILNck2LBD0J+ci6tumMxV
         J05bWl9K02BzPhjNB9y6ImRm6l8KEcD/KvBgGoNaXeeFnhjV9QnSbtWVXIkA1qsx3zca
         b+73uswo43tQK+M640Cw8KEm2zoHfok6L/o8bnnznNliAABKTLAjaPNnSKIZI8tDtrw8
         f6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762647475; x=1763252275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4o0u61EUL2HL9e6hUwjhKpFF2BdKLBjbpfp6Ho3jmU=;
        b=SIneg2o1xaXYeoTvRshNKy38OhHDUbpn4tnUXL3I1FpvOwYIqVEKL27aCsGJN4AWxp
         wgffNLnDgCMZrqlnH4cvXONQZ/IYhNs8CIdlSDloX/98VMFjtWZ1DC8VeaRTcM6g0tf5
         Mb1o07smhmK8xQBU2Pg10CwtjPuBtSTjXxOMxHf4epTKWzbltBlUeA/X5RHE3R4JbTe8
         eGsNGrcBhVvnKIMaW8u3+qcBGFiY/ZJEzDgC1In5OaQMgvpLr92GRilurHzT/bw8kclH
         X8WYD0M0/TcDBPkoLphfVjN3eXzZDrxs/DyoV41vgftlU8dA/2WEjeduxE/mZwQowcPM
         ilaw==
X-Forwarded-Encrypted: i=1; AJvYcCVgzrtkSOXdIR6TIDsXjmidrrmfdkhtV6GIYakeX4wTIxYxmp5Mdd1/zfKnWJ4R1jZtBe9Of7QIf7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ekmcjxKHSk3lqyEcdLRMmUYjtgmOXvM4t7k2g1TlkEgeVPTz
	H/MyHODw+UJCkBMK5zAP46XfMvkqm5HaRlDbgOZjXqE4Wu8Df+3kq3nU
X-Gm-Gg: ASbGnctD8yjNgQJtb7l0+2fcQQNlr9I6HEH99vwq/aodukU4ehmkuSQv06OFzZSekFU
	uF6IVYHXWQlGTY18ZMwQBqFoJzm1DRdlsEn+dIS7v4ZEJWDgpF+AAg/0MmYleOCBMsawMga4Vn+
	LtnuB90GdM3Ce3lan1q97gjvCgZxNJquruhLzLIXV1OBPlvEYAAj0Fb+/vxcdu6V5XfjRmpnuq2
	6iYLJks4QRAnXSefzdTnqlevFTsZZXQvLFgQ0JDfbbuSdMqAT23fVLJGSz69tFry5jX1vyQ9Ysv
	pbJ/eteRPFJBKqCcfUMSRZ2tzE9w9tGYZ0zKCnx4H8RcLHNH4K/u4FCJKPZBecNuz+w5ODScOPE
	DI4KHH5CyAgyRjEPA97W8Pny6XJ7fdUK+DYO0MC28Sh8RSxxuSFW6MpXlFIsU6BNpyOhSLPgM03
	FPVsW/q016dB8=
X-Google-Smtp-Source: AGHT+IEfpVtgarftoP1khEWPmgwWxs779ja9LAfhLZz+cixPanXCR7edT9dDIbRToxxMxKm1XIXjag==
X-Received: by 2002:a17:903:ac6:b0:295:3e80:9aa4 with SMTP id d9443c01a7336-297e565ed75mr47522485ad.22.1762647475301;
        Sat, 08 Nov 2025 16:17:55 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c7c5ccsm98771565ad.57.2025.11.08.16.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 16:17:54 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 0DC0C420A6A0; Sun, 09 Nov 2025 07:17:51 +0700 (WIB)
Date: Sun, 9 Nov 2025 07:17:51 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: pierwill <pierwill@gmail.com>, tglx@linutronix.de
Cc: bp@alien8.de, peterz@infradead.org, jpoimboe@kernel.org,
	pawan.kumar.gupta@linux.intel.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierwill <pierwill@users.noreply.github.com>
Subject: Re: [PATCH] docs: Fix missing word in spectre.rst
Message-ID: <aQ_dr2_Dd0peHFi5@archie.me>
References: <20251108192216.28534-1-pierwill@users.noreply.github.com>
 <aQ_c822L9lSTtwl5@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9vluvyLBrSPG1L0p"
Content-Disposition: inline
In-Reply-To: <aQ_c822L9lSTtwl5@archie.me>


--9vluvyLBrSPG1L0p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 09, 2025 at 07:14:43AM +0700, Bagas Sanjaya wrote:
> On Sat, Nov 08, 2025 at 01:22:16PM -0600, pierwill wrote:
> > Corrects a missing word in the hardware vulnerability docs.
> >=20
> > Signed-off-by: pierwill <pierwill@users.noreply.github.com>
>=20
> Please use your real name in the SoB line.

Oh and you use noreply domain instead of real email? No wonder why my reply
bounces...

--=20
An old man doll... just what I always wanted! - Clara

--9vluvyLBrSPG1L0p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQ/drwAKCRD2uYlJVVFO
ozNoAQC/cv9wmVg5pzceAkHar2sbEKcupnJkqBVZM04fNz+p1AEAlnie/f98i76k
dzvJC21RaIzAnCxgRtQbAgJpE3BoqwA=
=LIp8
-----END PGP SIGNATURE-----

--9vluvyLBrSPG1L0p--
