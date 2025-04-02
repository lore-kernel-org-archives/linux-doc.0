Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF5E2356DB
	for <linux-doc@vger.kernel.org>; Wed,  2 Apr 2025 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598184; cv=none; b=cK0PbTuKsb8dmLLT9x+LR1vm/maPuDw1jc2tRVT70bhLXnppeVaYQ8ex3hhwl+9laZqRIt/QsVX7LJPS3G226686iMjOIUrzXESgSncnWeUqiBHsn6um4DtXWa7VeJwE0dvWD0WWcm08fmBGzb26d8I2KMLv9kqT9WB2AjArgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598184; c=relaxed/simple;
	bh=aUi/Z8n9TTXLD5/8gJowzSAxrFxKSyhU6TOADq4w1uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOmM+f0G4gPT3VQsTYGo5xOafPn5+AKUwv0dt8J6Tiilk9a+yPgJ3yLowTkPRlnrYPmsyU8qOsXq5iNpVkcG0kQNbhkFN2k3IR+dj7FB0h1A3L3bu2vEkSWHXBgGVF0/Uq1l7Yfmz12FcBSMfyOJs105RubqSIX94z0vjCC8MAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b2Sh/U7m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b2Sh/U7m"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso44046495e9.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Apr 2025 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743598180; x=1744202980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aUi/Z8n9TTXLD5/8gJowzSAxrFxKSyhU6TOADq4w1uo=;
        b=b2Sh/U7mr6oQzismt9NyLTxXITaBcbJLsTKvOQ0FOZyWNLzpAhqR62wiqJw5Gs1gqN
         biQr0R34j621HFPCPFwR/a96V1tlkC7Tm72QrtLussMGWP+3vtgnG4A1olLlUc34KNew
         WyghTFcBzojli/Ley5VIiG0FxtZDT+d++/Ket9aV0Tb9HkalhHk1iZXukHofviFmN9nf
         H1IAoCcm/tunke2zSCfxinnVbtMwnl2+FSFKlatx6aUwaONsdfEuR31w0AebiFzq95CT
         vMgpfv0leGJjSCPI5VMP5ERCctl50vdU30IyXRY0x8AI1JNi2m/5ZURMT3xlb0mI0zwj
         5wFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598180; x=1744202980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUi/Z8n9TTXLD5/8gJowzSAxrFxKSyhU6TOADq4w1uo=;
        b=XvhJLDfo6OKnwwXLWYBZNLJxev+kJKQ7g79XHTEc6Qm3nTWeUVoWBvf9hzqITxEkzv
         iPIiRgUfQoedI1UhPX0U/quWz/IF/LbCz6siiC6d1i/TAcaqJG3gDSWVwpWEZRSXSUHf
         LtiV5TQVHP9o3s1mEgpsgPWT0XCmtmbTEVvHOguzIR3TFhbrOP7J2T6oHS0EBzbVy5S4
         jSMARhUeJtOl3aw9x9aLAbLQZyPARcuXi8YA0qPAfUTFieCW3Zzr/Y0mUrwIYSznc1YP
         jOlvp5evmRIeBX0hKaQ8vrIktPLsBlHMGxgwFnOA1yXcurPBSwVMtYz3N2kTTzSx4my2
         I2ng==
X-Forwarded-Encrypted: i=1; AJvYcCW+vDuGgXmKIHAr4i+iPyoIsqBUSpEwphmqt3HgFQWI73ngY9KXDh+QN+ZI0gEyvBYKRe/45kUtpSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+aWBAAaME8sUDWP0qCZlSU1GM3L6+u1tda6u+440YL10mU5c1
	H3vujQPNKHFos409Kyf3ldh25K6GbxOg5duaJczOdbOBpdKI8KeLVcHRuZz1uDc5d8r/4LorzW1
	y
X-Gm-Gg: ASbGncuN0drZSuRb/P/vfaJQAja46vb/xPiTAo+V1Vb5nyPfxVbxSKuXIunyl2zPAFU
	XnBRRuuMD+3nn4/kyXcz3gxoV1Qklryn5uNYhkf/r/44l1mmx/mLd71V6LzJWczbZWnPwNM2rz6
	NtB1tq+KpENYxsSTE1Kg9rEar+WzBF+MpdeVGCQ0J5LqdNafGixuW3XpzBmFFuYjz18OkxzdUvA
	IrfcMYmYJaFe8fm8Bn8RKk2btZPdDswQSJypHOKbze9UobBCCTVKVnbadaJ39mfxydQReVNGOEH
	vxD3+xoZFeETm+7J3ZubsCuqE0re3xCcBpsqwA/4WnXHKXtj5q8ossV8eQ==
X-Google-Smtp-Source: AGHT+IHA46HXuPsXbY5rxefnfJga1zY4ePIGw6eCqg+pFZUSEaQdfx7+YGmvIZW2a9SOFb5L7a+GUg==
X-Received: by 2002:a05:600c:4f0e:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-43db61b3623mr137169545e9.6.1743598179759;
        Wed, 02 Apr 2025 05:49:39 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61116ffsm20164135e9.32.2025.04.02.05.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:49:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:49:37 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "Shashank.Mahadasyam@sony.com" <Shashank.Mahadasyam@sony.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Waiman Long <longman@redhat.com>, 
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shinya.Takumi@sony.com" <Shinya.Takumi@sony.com>
Subject: Re: [PATCH 2/2] cgroup, docs: Document interaction of RT processes
 with cpu controller
Message-ID: <sgwmpdabmhcu3h7yxxjq3x4n6hk6p4m5bsopimfbmt46lokj7k@c4oood4anage>
References: <20250305-rt-and-cpu-controller-doc-v1-0-7b6a6f5ff43d@sony.com>
 <20250305-rt-and-cpu-controller-doc-v1-2-7b6a6f5ff43d@sony.com>
 <thhej7ngafu6ivtpcjs2czjidd5xqwihvrgqskvcrd3w65fnp4@inmu3wuofcpr>
 <OSZPR01MB67118A17B171687DB2F6FBC993CA2@OSZPR01MB6711.jpnprd01.prod.outlook.com>
 <2vvwedzioiopvjhah4jxlc6a5gq4uayyj2s5gtjs455yojkhnn@rkxanxmh3hmu>
 <OSZPR01MB6711D710EC3199A654434D6193A02@OSZPR01MB6711.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2kufip5v65ii35bl"
Content-Disposition: inline
In-Reply-To: <OSZPR01MB6711D710EC3199A654434D6193A02@OSZPR01MB6711.jpnprd01.prod.outlook.com>


--2kufip5v65ii35bl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] cgroup, docs: Document interaction of RT processes
 with cpu controller
MIME-Version: 1.0

Hello.

On Fri, Mar 28, 2025 at 10:45:02AM +0000, "Shashank.Mahadasyam@sony.com" <S=
hashank.Mahadasyam@sony.com> wrote:
> Given the different scheduling classes (fair, ext, rt, deadline), it woul=
d be nice
> to document which cpu interface files are related to which scheduling cla=
sses.
> Like, cpu.idle applies to only the fair class, cpu.weight applies to the =
fair class,
> as well as ext, if configured so, cpu.stat accounts for all classes
> (I'm not sure about this, I haven't tested this yet), etc.
>=20
> The proposed patch is in this direction, but just for the rt class. Any s=
uggestions
> on how this intent can be made clearer? How about something like this:

Classes are implementation terminology but userspace knows this under
scheduling policies (SCHED_NORMAL,..., SCHED_EXT). It might be better to
use that categories.

>=20
> CPU Interface Files
> ~~~~~~~~~~~~~~~~~~~
>=20
> All time durations are in microseconds. The scheduling classes mentioned =
beside
> the interface files are the only classes they are related to.

list of related <categories> is only indicative as implementation may change

(Even when talking about policies I think the relation still tends to be
an implementation detail, so I'd also add something like the above. But
I think it's good to have such an overview to know what is where
implemented.)

HTH,
Michal

--2kufip5v65ii35bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+0yXwAKCRAt3Wney77B
Sen5AP0ZtZaIVCRo3cNtvvg0SOpN8uIKAvPRV5GdXzTIPDZ08AEA/czSx5CfQ1db
EXVjwOZJPy3XFWGw9czhrUmytYWk5gs=
=HEly
-----END PGP SIGNATURE-----

--2kufip5v65ii35bl--
