Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288B125A2C8
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755504178; cv=none; b=nBoQRSCeMyDIWUdNf6yAtIBn/wBWDTLDV/R6bNFKk3LGltuA6Ri4jStbsRs/ORCJBHEgbiU8EoiR8D0v+cFnCtIyh0FEIr6VLbBt5XaJGu0xPJlmy0gHTt0R7fiScBJ/r9WwVkkrcJ1IOvEDn8AX+PToC7/9ogV+gSzLtE1zRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755504178; c=relaxed/simple;
	bh=BTDvtIT10/Y7dpj6Bwu/egzP7OKMQ3oLE5KC8jPsBrs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iq0rsfvnFBLEmRW9efZgpTDX8cEGvEqRjwmU8P6LRALv75pFJHH6eBxEgiMaA69OVtoz4AgI97EQAda9mufyw3RNnUSi2lUj769R1J2rnBOAhv8jIF8EABfPd6N0b0ZrnXceg9jPXz/cdaTwg/vshwXgxwlvdGnBi9JXTZ38jKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UmKpTFJZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UmKpTFJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755504175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BTDvtIT10/Y7dpj6Bwu/egzP7OKMQ3oLE5KC8jPsBrs=;
	b=UmKpTFJZgVRbvB3GOQlsq08+4K9d+F4jRERJSGY/NYDEaCgNfL7wOM7UFjK/DlER9AEyfj
	uru4qI3v9Jav8z/L6uOtqUk4M8HmHPwSxzpLxJevdWxBJiSFziND90+OLHZIdrT5L0zOW5
	MuHu8ReIm0troJRnP2K6LyQZAcmNSjE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-4n-xcaopM3e6zR2e9bPh4A-1; Mon, 18 Aug 2025 04:02:53 -0400
X-MC-Unique: 4n-xcaopM3e6zR2e9bPh4A-1
X-Mimecast-MFC-AGG-ID: 4n-xcaopM3e6zR2e9bPh4A_1755504173
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a92820fd0so37160686d6.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 01:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504173; x=1756108973;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTDvtIT10/Y7dpj6Bwu/egzP7OKMQ3oLE5KC8jPsBrs=;
        b=UpPlYJri17eco5mGJwWya1lqBqRc9jdw3bkpnFpZ6UGVU3tbraBNKxr0BSRZqtDjRQ
         e1sBC4ECOuwgO7LfcSAm0ztyW4me0wXCVHsfLGpM4o8uZQjrFopIlO0Uimf9XHN9Tbg0
         KBtKyXNDbsjGTAzz2UWzbJChMWNh0SYeKCfjAcWqEb26tc5dsol9jTM3XnVzlGmhe0UV
         M2D+OpMGjuOe55p/IRFERDFQ9mPRRtTnnfnA8pRKXKFofuJSrBDNRluNIV2JtQVdDFRZ
         BloYbSWdYnh5jr5+xKmAGHbACmR+CjULXL+QMygJhZepfjGnPoJGk9x2fZ3I5xNr0dod
         E9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR94jGt3ZeRi0l6tPzbfkm2rY1OZmjrO4tsSiM9I22whBGQnL+geefOUHM19bE14qyuGR2MGwL5Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsLz4E6MfQZ/2VbKNLm8ZV+sOYuUMvVe13kEGd7i+3CVwMxLgW
	zXo3IXJ0q370WqINaG2UqAXxpgkltWaltKoi/ekLyZYDZnkMGA5CjSJBUBRXBOkxsTqa+KJsYdl
	U1U5U7dxDBdB5TCwPIIyPm8WA1+2YTYkNTfXhsMDsTjwGVGMWuEyA0PPd+ulHgg==
X-Gm-Gg: ASbGncuSHjYKMZ2dkwDkS1mm/ipQ3VXHBIV7HrOYPFreEDEvA7Ff1boM3VL49LAeRpP
	3uCdbFfwIoLRUa2BoFZ6W7GjoyEjQHdSicuzwGcEcDTakirc6V0TiZu1JHfTepvlVi3AloSdWBf
	J/1iTH3dd5cXocXsvb4XmER0UWjOzRKFur8aJYe1ZDY5oDQ4lbNQ7mjqMoY/7TloiZuVDmCIUN0
	50fRYyljk00Ub+BoO6djQmGauVcrp8cmF9yBadQ4NWBfgvpcB/lN3dbJ62XzxnUrx6p3qgEYIy8
	5p6YHdLVoBg88SmfYhfRqIKbg3J9P5WwMOlP3oEkIY0emdaLZyba04k7V4Keiy40Yw==
X-Received: by 2002:a05:6214:21e2:b0:707:5e7e:20f with SMTP id 6a1803df08f44-70ba7a8e0c9mr127652476d6.5.1755504173108;
        Mon, 18 Aug 2025 01:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHbS9oN+bmVLXNWkCtLoe4KkJAUB/SBpAzOahmwwKpbcS5hEqU1zFKZK8VNdKmOFa0tdBVBA==
X-Received: by 2002:a05:6214:21e2:b0:707:5e7e:20f with SMTP id 6a1803df08f44-70ba7a8e0c9mr127652076d6.5.1755504172501;
        Mon, 18 Aug 2025 01:02:52 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba959f401sm48756146d6.69.2025.08.18.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:02:52 -0700 (PDT)
Message-ID: <93e01a77105007dff602ab9a2a9af5b4cff86522.camel@redhat.com>
Subject: Re: [PATCH] Documentation/rv: Fix minor typo in monitor_synthesis
 page
From: Gabriele Monaco <gmonaco@redhat.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Date: Mon, 18 Aug 2025 10:02:49 +0200
In-Reply-To: <20250810111249.93181-1-krishnagopi487@gmail.com>
References: <20250810111249.93181-1-krishnagopi487@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-08-10 at 16:42 +0530, Gopi Krishna Menon wrote:
> Specifically, fix spelling of "practice"
>=20
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Thanks for finding this!

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> ---
> =C2=A0Documentation/trace/rv/monitor_synthesis.rst | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/trace/rv/monitor_synthesis.rst
> b/Documentation/trace/rv/monitor_synthesis.rst
> index ac808a7554f5..3a7d7b2f6cb6 100644
> --- a/Documentation/trace/rv/monitor_synthesis.rst
> +++ b/Documentation/trace/rv/monitor_synthesis.rst
> @@ -181,7 +181,7 @@ which is the list of atomic propositions present
> in the LTL specification
> =C2=A0functions interacting with the Buchi automaton.
> =C2=A0
> =C2=A0While generating code, `rvgen` cannot understand the meaning of the
> atomic
> -propositions. Thus, that task is left for manual work. The
> recommended pratice
> +propositions. Thus, that task is left for manual work. The
> recommended practice
> =C2=A0is adding tracepoints to places where the atomic propositions
> change; and in the
> =C2=A0tracepoints' handlers: the Buchi automaton is executed using::
> =C2=A0

