Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718692F8EAC
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 20:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187470; cv=pass; b=uPGSf5HfvIPxdEJ47Daa62bc50Ida73oKrdrVvakk7GIdXEZ5RrxH6vpia6lRtA3Y7PwGLo4m9OoCFjHZtR09mGTSqz54TDZcHAfRWPiMN82Nj6xivYAGD3r9lrkzw617iQZgOEcJuw5Fv+REh6MelAoCTqr6GKFGyKocWqeZfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187470; c=relaxed/simple;
	bh=dzCGE45kN9A7cRwTX4c6YDKiWHm0lvYyixc38KnjSlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzoA4RoN6wphonjFnxeoO31nPy8luDQM9AMBJnPm7m3uqFJnzVKPDnVFd3hLWvEPVIPdSA2v3zE7SBXgM5q8RTBduuTJHeJCRwGn3tPTfbn6LgP5sJ1dIDCslsQZYdrlb5daPIr8RRtUYEEZHtdqXkSngnVwpZt6rEnB+UVwTFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Ks8qNKOU; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Ks8qNKOU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba6485d219so8757755ad.3
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 13:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778187468; cv=none;
        d=google.com; s=arc-20240605;
        b=GbrParKOMhsVT+DyrmvFj2snCSIWRo3/da/48w6LQ4u7zDKPyaTX+1mhs1q7whothg
         vQh9SNj8rvHDaR+ZeAYzdIEd7abqvWa4ar5DiEsMUkLMF2NAJVAWhV9BmeT5T1hcij7L
         i/XQB9b3zI6ptlNVlKZ/jS8GUayWMUCVVrPhmCd9sMqxweVP7ihULWJg05DCUpYKi+7z
         7/PukcrsJRJIWp9oPySVC6IAK/uJeNvqNBBHK2zDHW2wkG53kBLdpQ6iq8XwPHV/TsYt
         AIsv0b3kWZwRwV4F96kAvklcUKPr3bi5R8sdHr9w5ProkidYj4WAGGhuamjYC0uGSUPv
         fEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w9z2GvzEw9i/nhMRa6wlw8IHkov6Pzg/iLQFCyv25S4=;
        fh=4fxa3DfLju62HHgAeh6NrR6iFSRLtY7MuZ5MM/PXmTU=;
        b=VUUa7EmWpxVuqZlngATN5FdIev7V/KCP7lXQs5Q8AckyNtTRVWG/tzXqIdEdyqcWS4
         N2+7MB6nEffqHWGalAx06qrxL14g1DNtw+GXJJ5fOunLTJ370+It+rTDfMHhVz8VCIVf
         DjtyIoZMR7TjpMT0raOnI+5DzU2iuzzIs4CdRDloISZ6uVD7//ZuX5gVzzUI0FDxIXa6
         naApmbRxJjyJo8UTSOfomLDuABcCStCMNgvi8i73MuWa/NH5mW3QKsE7ACy/tfAQVJrw
         2o0XNfcfyyj4Jc3th55g+NhGZfaanQYtLqD+sdzF1RZrA0JaQoS+kDKYDQjCC4eEAOQ1
         I8Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778187468; x=1778792268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9z2GvzEw9i/nhMRa6wlw8IHkov6Pzg/iLQFCyv25S4=;
        b=Ks8qNKOUoHUd6fNtJlBJb8CTyVXA5nLreVszv/M7Pv++AS2yadUNOK5REbi1j1tA1i
         BQnXYPspts7M4WKCkU1YH9ARq57GZOs2Q3UDFqLDzONjP8oT7KMOl20zT7xq0Rvn5hI5
         jeAs7mqMeV1jhYdIBN+8XPBaES5+ZHsLW64SlgeWtcTzJvSu/e3MB5ZgVSJGe3k3BHPK
         QRI1vKwYBC+BTv2CLKmbHeI/xdeIX7uTE+JADu4TUX3hyYjPi5tv8v149FMuGc0NfCQj
         O/gL5b5Bn5j/LxV+DZG9o+U6AHj69Tdx1z1WMaHRVDDDKZ/mGL67kBogMj2jBFMkhPE/
         E9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187468; x=1778792268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w9z2GvzEw9i/nhMRa6wlw8IHkov6Pzg/iLQFCyv25S4=;
        b=rka8x5pmCbeIrJG5n6mCrUCnBllfyoo3s3pwVMc4CZ8gEhvUJNPvz0QVwlWazXSGJ8
         KdpJVVKbuSpz6XT82KuMqSLCGjmZzzNH+/DIRJ2YcSrqfksXKz3ruZSSYdT4N8Vrwnxz
         mrrB1p0xFCTSebIkvlVqdVUrOYN/cEz9IiEjY4Ex98LjuIzhQkHc4y5vnkcKFnXFpvjd
         /mBEOWXhlcdmpCimXF24N1EG38E3GUHPcPUgSs+bp034GEetpbSFrxbtjF1GApr2Rc6p
         FPHEMuD1ZcpMVfIoThse1dO+jYfOptlfcbHrbKwEZZFgTR34SizGC0R1ZAETsY4YQp9w
         Hewg==
X-Forwarded-Encrypted: i=1; AFNElJ+SKdOpqr536tY9wOMw5e4gNoqSwOoIRREY4FPmRTDxjmjn06O5fC9txe3hVmYYm+VbTR23bPQ/W9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYcFs04pOb0uw1bgEU3COlIjnNFemnNgcI5O8HS81bTXRJoDX
	eIYPSQ1X2BLZs+dNDJCeAUuxUHSoSXqe9sl76fxGfoiNd4J9xOQFw9ZhVQrINy3lsqV6S3I5Le6
	cpEjO1L8Dpesu6pquK2xLJ821A1fq8UAfAKNHFImA
X-Gm-Gg: Acq92OFnbVDkxhmtTOhcEK5tZd+AlLWsBP06uevrpK1T1gE+9lmMogUqT+S5bYAyJPt
	sImjycPWn9wNEjXEi6FLP510tInNnblVVhL0BlOqgrgscwLuUvKw6r9Q5VMj+wnF3VXhxeTRqEr
	D+56t0Avh7NXPqENh+wAJB6AnSikg4DGf8j6HobKkuhW3olXHtLnWrQdXUPdN3DjqR1eVnRohIi
	6VxefERq8/Psq8ht8z483YvFCxg9kbo7YGZTU9N9wda3En2FA8RXCLK46swcd0kyRhS4cfVbArw
	8KyNQiqrkO2GOwGg8Q==
X-Received: by 2002:a17:902:cf4c:b0:2b7:88d8:efde with SMTP id
 d9443c01a7336-2ba78f4e986mr89794045ad.7.1778187467778; Thu, 07 May 2026
 13:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507191416.2984054-1-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-1-bboscaccy@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 7 May 2026 16:57:35 -0400
X-Gm-Features: AVHnY4JwRLAedFRfQ7q22oAcPpo0Tq1zBBEQ_RXTzWDidOJW2m8V1gD0lHHMSSw
Message-ID: <CAHC9VhR0Abikk+2=DWtVu1cEkcwkudKFRJH51BFOh0Qt01wLJw@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Reintroduce Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, linux-crypto@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andrew Morton <akpm@linux-foundation.org>, 
	James.Bottomley@hansenpartnership.com, dhowells@redhat.com, 
	Fan Wu <wufan@kernel.org>, Ryan Foster <foster.ryan.r@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 3:14=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> This patch series introduces the next iteration of the Hornet LSM.
> Hornet=E2=80=99s goal is to provide a secure and extensible in-kernel
> signature verification mechanism for eBPF programs.
>
> Hornet addresses concerns from users who require strict audit trails and
> verification guarantees for eBPF programs, especially in
> security-sensitive environments. Many production systems need assurance
> that only authorized, unmodified eBPF programs are loaded into the
> kernel. Hornet provides this assurance through cryptographic signature
> verification.
>
> The currently accepted loader-plus-map signature verification scheme,
> mandated by Alexei and KP, is simple to implement and generally
> acceptable if users and administrators are satisfied with it. However,
> verifying both the loader and the maps offers additional benefits
> beyond verifying the loader alone:
>
> 1. Security and Audit Integrity
>
> A key advantage is that the LSM hook for authorizing BPF program loads
> can operate after signature verification. This ensures:
>
> * Access control decisions are based on verified signature status.
> * Accurate system state measurement and logging.
> * Log entries claiming a verified signature are truthful, avoiding
>   misleading records where only the loader was verified while the actual
>   BPF program verification occurs later without logging.
>
> 2. TOCTOU Attack Prevention
>
> The current map hash implementation may be vulnerable to a TOCTOU
> attack because it allows unfrozen maps to cache a previously
> calculated hash. The accepted =E2=80=9Ctrusted loader=E2=80=9D scheme can=
not detect
> this and may permit loading altered maps.
>
> 3. Supply Chain Integrity
>
> Verify that eBPF programs and their associated map data have not been
> modified since they were built and signed, in the kernel proper, may
> aid in protecting against supply chain attacks.
>
> This approach addresses concerns from users who require strict audit
> trails and verification guarantees, especially in security-sensitive
> environments. Map hashes for extended verification are passed via the
> existing PKCS#7 UAPI and verified by the crypto subsystem. Hornet then
> calculates the program=E2=80=99s verification state.  Hornet itself does =
not
> enforce a policy on whether unsigned or partially signed programs
> should be rejected. It delegates that decision to downstream LSMs
> hook, making it a composable building block in a larger security
> architecture.

[NOTE: trimmed changelog for brevity]

> Blaise Boscaccy (6):
>   lsm: security: Add additional enum values for bpf integrity checks
>   security: Hornet LSM
>   hornet: Introduce gen_sig
>   hornet: Add a light skeleton data extractor scripts
>   selftests/hornet: Add a selftest for the Hornet LSM
>   ipe: Add BPF program load policy enforcement via Hornet integration
>
> James Bottomley (3):
>   crypto: pkcs7: add flag for validated trust on a signed info block
>   crypto: pkcs7: add ability to extract signed attributes by OID
>   crypto: pkcs7: add tests for pkcs7_get_authattr
>
> Paul Moore (1):
>   lsm: framework for BPF integrity verification
>
>  Documentation/admin-guide/LSM/Hornet.rst     | 323 +++++++++++++++
>  Documentation/admin-guide/LSM/index.rst      |   1 +
>  Documentation/admin-guide/LSM/ipe.rst        | 162 +++++++-
>  Documentation/security/ipe.rst               |  68 ++++
>  MAINTAINERS                                  |   9 +
>  certs/system_keyring.c                       |   1 +
>  crypto/asymmetric_keys/Makefile              |   4 +-
>  crypto/asymmetric_keys/pkcs7_aa.asn1         |  18 +
>  crypto/asymmetric_keys/pkcs7_key_type.c      |  44 +-
>  crypto/asymmetric_keys/pkcs7_parser.c        |  81 ++++
>  crypto/asymmetric_keys/pkcs7_parser.h        |   1 +
>  crypto/asymmetric_keys/pkcs7_trust.c         |   1 +
>  include/crypto/pkcs7.h                       |   4 +
>  include/linux/lsm_hook_defs.h                |   5 +
>  include/linux/oid_registry.h                 |   3 +
>  include/linux/security.h                     |  28 ++
>  include/uapi/linux/lsm.h                     |   1 +
>  scripts/Makefile                             |   1 +
>  scripts/hornet/Makefile                      |   5 +
>  scripts/hornet/extract-insn.sh               |  27 ++
>  scripts/hornet/extract-map.sh                |  27 ++
>  scripts/hornet/extract-skel.sh               |  27 ++
>  scripts/hornet/gen_sig.c                     | 401 +++++++++++++++++++
>  scripts/hornet/write-sig.sh                  |  27 ++
>  security/Kconfig                             |   3 +-
>  security/Makefile                            |   1 +
>  security/hornet/Kconfig                      |  13 +
>  security/hornet/Makefile                     |   7 +
>  security/hornet/hornet.asn1                  |  12 +
>  security/hornet/hornet_lsm.c                 | 352 ++++++++++++++++
>  security/ipe/Kconfig                         |  15 +
>  security/ipe/audit.c                         |  15 +
>  security/ipe/eval.c                          |  93 ++++-
>  security/ipe/eval.h                          |  11 +
>  security/ipe/hooks.c                         |  63 +++
>  security/ipe/hooks.h                         |  15 +
>  security/ipe/ipe.c                           |  14 +
>  security/ipe/ipe.h                           |   3 +
>  security/ipe/policy.h                        |  14 +
>  security/ipe/policy_parser.c                 |  27 ++
>  security/security.c                          |  75 +++-
>  tools/testing/selftests/Makefile             |   1 +
>  tools/testing/selftests/hornet/Makefile      |  63 +++
>  tools/testing/selftests/hornet/loader.c      |  21 +
>  tools/testing/selftests/hornet/trivial.bpf.c |  33 ++
>  45 files changed, 2112 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/admin-guide/LSM/Hornet.rst
>  create mode 100644 crypto/asymmetric_keys/pkcs7_aa.asn1
>  create mode 100644 scripts/hornet/Makefile
>  create mode 100755 scripts/hornet/extract-insn.sh
>  create mode 100755 scripts/hornet/extract-map.sh
>  create mode 100755 scripts/hornet/extract-skel.sh
>  create mode 100644 scripts/hornet/gen_sig.c
>  create mode 100755 scripts/hornet/write-sig.sh
>  create mode 100644 security/hornet/Kconfig
>  create mode 100644 security/hornet/Makefile
>  create mode 100644 security/hornet/hornet.asn1
>  create mode 100644 security/hornet/hornet_lsm.c
>  create mode 100644 tools/testing/selftests/hornet/Makefile
>  create mode 100644 tools/testing/selftests/hornet/loader.c
>  create mode 100644 tools/testing/selftests/hornet/trivial.bpf.c

[NOTE: added the linux-crypto list to the To/CC lines]

Hi crypto folks,

You'll notice there are three patches from James Bottomley in this
patchset that touch crypto code and I'd appreciate it if you could
take a look and either ACK the patches or let James and Blaise know
what you would like changed.  James did send these patches to you for
review some time ago, so they aren't necessarily new, but I wanted to
make sure you saw them again.

Unfortunately, it doesn't look like the crypto list was CC'd on this
patchset, so here is a lore link to the patchset as a whole:

https://lore.kernel.org/linux-security-module/20260507191416.2984054-1-bbos=
caccy@linux.microsoft.com

... and here are lore links to the three crypto patches:

https://lore.kernel.org/linux-security-module/20260507191416.2984054-2-bbos=
caccy@linux.microsoft.com

https://lore.kernel.org/linux-security-module/20260507191416.2984054-3-bbos=
caccy@linux.microsoft.com

https://lore.kernel.org/linux-security-module/20260507191416.2984054-4-bbos=
caccy@linux.microsoft.com

Thanks.

--=20
paul-moore.com
