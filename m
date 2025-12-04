Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1087C21B192
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 01:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764811417; cv=none; b=M0hBFkfl79QazETYjq6f42r6lgVnAcHo/0vM/Se5nOHZg+LI7sbchTJxQsWIY5k8aaHvyIWHQ3EEcqMUBncUXwpUY3z/hJxVQA7K01aO/3iW9mSAjukxe9jQHrVg9ypLY6CencG8LM0u9EuQTX2ieCaNLg9ZjgP4GJLDJ8kvJbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764811417; c=relaxed/simple;
	bh=Uvh0yZY15GEtzECgHRv5Oh5uDOtYGTU0PpHMlDzRVdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfZWmBPnI5lmA0BaIERRW27ZPfsmX3S4cANtQeKhydRF3SEITd0n+1HY9637tkjPct+L/ZqI7S/Lusf9XEH1UdRhOh4TT7ZhJC7L0cfyM87KqvZzTxiH+DO1y8dFhg6u4kaVDXPPOKFzL9r18eOAwclW59KTOdlja2VAqfSaP9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvQ3suMl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvQ3suMl"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297dc3e299bso3588795ad.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 17:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764811415; x=1765416215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J7S+3a6m2SRWGZPl86oDbuprI5NM42FY1cIZzP35vOQ=;
        b=PvQ3suMlPaJXqmdBRMHXxiJp6t9XM25yQH2NNqv15ttJH5mDrZkWPajNBHTCKOMcEg
         sCP6Mgs+3Z6QwGFUQ0g/8mr8FbvXtJVUNDyLKHpptUEgyaJ47kFwsrg2R38fDM81KeAM
         VFonyjEx3NAwYlvsHq+GJxiJZcV2/r3836Olv9uT94M9N5ALvExa/h7rOZzMKlJzftBT
         X5IQGB2pF5EyABCxw7M1v4wSSHyLNG3cqUZdvVvpyGpsBCeAo2wI+5hKQ6LcWHpYBJSD
         SSofsUWuHvRV08D4+jyIIXACpWTrzn+DwpMe7BqSZiiEeGlbKbDweybRH4ltTtdZ0Q7p
         CMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764811415; x=1765416215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7S+3a6m2SRWGZPl86oDbuprI5NM42FY1cIZzP35vOQ=;
        b=w4CfHKcBWvIwBlw3nf7zq2XKCSC+rmXr39IIFhOYwPS03uKSCzy6rKbpmu8LTvRaWI
         351CfUU5FhEGnOhv/JLveHoHkSHnNpZvympVg/5GJY2/qFPOjqwYkNHkIvCUvGn3hVXU
         5F0jNr5ZzmBUn4Z1+075phNqZGUWltQFQRLYMN4fLeRR+DLT3uX76zwQMMwFZXc2ZlgA
         SuimrljoMbVS+JvQhuIRUuNOUoMPTMgbzH8dym3Em3qpLDkVmCUBrKzvL8WF6OGn1H6l
         cgOQA+KclIXnSgGItGkDw6BVt14U3dIOvqQ6FFcd+lu9Ugk1+v/L+Fhn+C9+JinO1WFv
         jEww==
X-Forwarded-Encrypted: i=1; AJvYcCWVlvhS80Sl8397KBl0yYpZ7PtKSwWifAdRLKZhIbCf+tXI3C6RxQpYxHzLySU8QyUNg0U/NCP2M0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIQiHtgnoU37H3IzTiyNERfdPV2Su3BKsyVU1/i8itFE8YpBTW
	n9tbnXtK7h+zDAhmzCB8B9rIhvxA5MGa78rOclLTuAIcZ09jGVlwiceu
X-Gm-Gg: ASbGnct0Iry9adehe5icB88QsbvoJB3fLh/63QtWqE2ylyTxYzuppmr9Sp17nkiYkUF
	OA1ivogHWebQ+vA6IUZKiuFhwzp9zPMaAKT9Qj74UStdQYOsI4yNG1qvHJ0QVs+VeKuIW3EXnCn
	kUOKKKFf4vmB5FU+k0/Dvres6D2z59oj7lyjrnaPoAqRKOR8nMEk75X/Fkxy2SQSLsctDJp/F9E
	nRMHqzBjlG1TgEqL66IlV1nlzIqlFrDLWSFecDcKTGBOOXRf/Ss9C2hsFNF3OA4VjyHHXB6XXQ7
	jXhWYFHn2pSFk/io16wxHQG4ZLKtzEILQ4YwyVou1/YElUhyCZ3iXrxbR7VrAIBol3YtNHVnn2T
	q8aRY138lBC9cBplO8EXGrlN8VYmkoGoy6Nm+0aQdAPzOcmxaaL5jQ7T3C5rtRO/VXSuF/1s9sl
	542NEVo8KpnLY=
X-Google-Smtp-Source: AGHT+IFO7v+xzv9ChUChipH5utZ+kiuQ/BxDExY4ttC5HF2DSTum5pVPJ5bvBYUxIBOnKh910HxSJg==
X-Received: by 2002:a17:903:1105:b0:297:dfae:1524 with SMTP id d9443c01a7336-29d9fb658bcmr15363485ad.16.1764811415111;
        Wed, 03 Dec 2025 17:23:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9d0sm1674715ad.29.2025.12.03.17.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 17:23:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id B8348422D89E; Thu, 04 Dec 2025 08:23:31 +0700 (WIB)
Date: Thu, 4 Dec 2025 08:23:31 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Soham Metha <sohammetha01@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v2] Documentation/rv: Fix dead link to
 monitor_synthesis.rst
Message-ID: <aTDik5tn_5TR_-9B@archie.me>
References: <20251203182121.52759-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ExQ7Ve6pZdT2zuD7"
Content-Disposition: inline
In-Reply-To: <20251203182121.52759-1-sohammetha01@gmail.com>


--ExQ7Ve6pZdT2zuD7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 11:51:21PM +0530, Soham Metha wrote:
> The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst=
' in
> commit f40a7c060207090f41998025fcd1cfad06ea2780
> ("Documentation/rv: Prepare monitor synthesis document for LTL inclusion"=
).

[also Cc: people in the commit's SoB chain]

Nit: For commit references, please use abbreviated commit hash (at least 12
characters; I personally prefer 14).

>=20
> Update the reference to point to the new filename.
>=20
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Fixes: f40a7c06020709 ("Documentation/rv: Prepare monitor synthesis documen=
t for LTL inclusion")

>  The wip monitor is presented in::
> =20
> -  Documentation/trace/rv/da_monitor_synthesis.rst
> +  Documentation/trace/rv/monitor_synthesis.rst

Thanks for the catch! Can you also unwrap the references (which are in
literal code blocks) so that these can be linked? Like:

---- >8 ----
diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Docume=
ntation/trace/rv/da_monitor_instrumentation.rst
index 6c67c7b5781118..9eff38a4ad1ff4 100644
--- a/Documentation/trace/rv/da_monitor_instrumentation.rst
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -162,10 +162,10 @@ For example, from the wip sample model::
=20
 The probes then need to be detached at the disable phase.
=20
-[1] The wip model is presented in::
+[1] The wip model is presented in:
=20
   Documentation/trace/rv/deterministic_automata.rst
=20
-The wip monitor is presented in::
+The wip monitor is presented in:
=20
-  Documentation/trace/rv/da_monitor_synthesis.rst
+  Documentation/trace/rv/monitor_synthesis.rst

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ExQ7Ve6pZdT2zuD7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTDijwAKCRD2uYlJVVFO
o/hyAQCZTtG+Npjdwceg3B2fWEbRK/dfQs5AlrpJpTI4YvX0SAEA3EOr9AbpAW68
ivyGkRfmr5ezDnFob0+1riZRH8AzDgQ=
=SD/G
-----END PGP SIGNATURE-----

--ExQ7Ve6pZdT2zuD7--
