Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB4F7081A
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 00:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882179; cv=none; b=gsNZyatcwlswDRrAhd/2xfNO/VIQpp3FHs0AxM6N4+7i1Mu079APeyyZ0gyqFqk4SOth+/IOket2lzqJmybb/GFoSsC+EdCNGUZ6BhNPEupKikD51TtFxxg43S8nmd4S7tiZR4Q/gS2j52WQKHcLozc+555CgQCvqfhW3k7Hf80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882179; c=relaxed/simple;
	bh=SiqBsvlUVBV9X2tD7iHdB7FMlNgyz+EJDz9g/wHLMx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEJTyzs9PdsRJfTEKNsm/xrEuPrljsNmW13wtQC9nWQmOhW0SnoeeP7tEE1vI0eBGa6/biK9PQxGGIEmcoDAwfB486GMyMAXv7CLASd3OjyKoNtxViTDISJECJFzzUA/2pcO8xeKd98/KxsIEJysjAUbupAARWLSdGlU5ktYsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7rFcjW6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7rFcjW6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f1f29a551so8746247b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 17:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882176; x=1760486976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SiqBsvlUVBV9X2tD7iHdB7FMlNgyz+EJDz9g/wHLMx0=;
        b=a7rFcjW6r7uDt3uV3PmBelfsOSHGwAHATvEJXxATW+XYosSTKq5AGyirIGO+QdQPDZ
         6vQUrIqZu/l4jMVDiytw6HqVMWmdLJVsf1H3Y7ZGOXTIudixJTz3/lFQsUCKuzPW1tRY
         O3GX8NiiJHkE24LywVW0VHheuriOA30oZfMzoHvZf4AM6HAiMibmyjbIylPaO57ku6iI
         Jb0J5jTN7l06hRGFqACvKK701qRvDM18ttZ5raUoo9KvdDm/8sYUKpeuLRFUYyfsNLGp
         7ILVQ//bgEOSiphPsulS0zA0G8ibFRUmXwnbToG7N9rRrOs3qded4YeoTbN0TRic5wtj
         NC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882176; x=1760486976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiqBsvlUVBV9X2tD7iHdB7FMlNgyz+EJDz9g/wHLMx0=;
        b=VFoSTBR8yw2K3wCOtZNFKIktQcQ4zGytKtlmuygFuxTde2E/TRtBf/7eFbC4Ejn5Vr
         2OajEn7iIzuucUJtuCsbo0lJRjyBeV+9nh3BqAXlZ0VyMnilqSUH8fSo6o9PR3UIZxE2
         ey5zmge2V0aL2Dm2DTcMhg4mJfvuCiZAqk2jUZiqa8OrJekTBBrMkOD6xHXP2x+yARtt
         ZrG1aYqGF9KbnasPUOV5BLW2MO8ui05EilBV7POIUQWoa3KAsOJPQjY8lv6fgt6Xrf6B
         LiQ09DhgZVxfq5mklgyKihdu9WPxddEqUV71K3lCWX4goQK2SCI2ocSa+t5UKruCmML1
         FGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6QIm23247UasObGBCWbRO8Z0ypUbWXinYhPEcE9GIc4RlEygjKialZvpQx8z+rc1mARNHlZA0sC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2zVwGLS8vApIGX/GJC1t/HOkhNP/7nfuKWjp8mgzMggafNETO
	neLr6Er0KfIoYXPOeEn/YDGMUFxXvJ+0qQKSon7YMplTNENAx0d1QdhX
X-Gm-Gg: ASbGncuQJRocFepwXUrHX565y1BJB5GT3DE7e9i1kTJLThVoVQeTL2eEHe/uHy+5WtX
	NYJ6tOX9GI/7pnO450WlWmyyqtUOVXxct5FR+Z41QR1P1pNNYLMTKE4Jy6DpNnHVcoKTPLNcUqH
	fopzWtDs7g3Fo68SQ5T3zFI+8zs4hCZnOCtBypAaBVVtawv76dLhvvkPuBBIYliOMoc6upKS/4O
	93ANFXPeIhiLNpTxrYZuJN79DYb1BmgQYCYX6lrJxpZclmKlZVLbnYDeoWkycuDEC2JXppSAdw+
	uwmGiTUY8SaSx8Jzn/4/dJMg0r0ETlVKGNFkV43lpc7bq+Hrd3763pG4xfJX4+ykP7GfKfvErCj
	2CkTbFBfFrAV5DQnVjadMZ1liMqqWFR+JteLSvJKzHHRQQyK9Wg==
X-Google-Smtp-Source: AGHT+IEHG1de0uoqO9lTHMhoFoIvSH90FZPEhO4rUV9YGSfs1T4dWZ9gPM/Xr/7y7qCcN9U5mlfWcg==
X-Received: by 2002:a05:6a00:80c:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-7938723daa6mr1650070b3a.21.1759882175592;
        Tue, 07 Oct 2025 17:09:35 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020535a7sm16838884b3a.54.2025.10.07.17.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:09:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F13204233430; Wed, 08 Oct 2025 07:09:32 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:09:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 5/8] Documentation/rtla: rename
 common_timerlat_description.rst
Message-ID: <aOWrvAA6AO27pI6_@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-6-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="II6TKWeT/WeCoHc0"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-6-krishnagopi487@gmail.com>


--II6TKWeT/WeCoHc0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:54AM +0530, Gopi Krishna Menon wrote:
> common_timerlat_description.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_timerlat_description.rst to
> common_timerlat_description.txt to maintain consistency with other
> common_*.txt files and prevent Sphinx from building it as a standalone
> document. Update all include references accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--II6TKWeT/WeCoHc0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrvAAKCRD2uYlJVVFO
o4FmAP9/w4MDtIyaMU+Ss/owPly7TFCYgH/WICY1CZthinPMBwEAzV1VA3ObJgkL
f0XErbJOut5p53OZ7XcUvsO9/0GmNQg=
=4qSZ
-----END PGP SIGNATURE-----

--II6TKWeT/WeCoHc0--
