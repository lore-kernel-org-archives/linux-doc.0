Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550723F26A
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766019570; cv=none; b=fjtwxzqO65dnzW7Iigbbb0DdTVLuOZTizt8W0IvLFqxwqb6pMxEGxXnfvKD3wsHFj9GubwEJwZ3Yz0pnbl6vRnMt3X0ekd/3U+p0/yaQa3p4Yc2/qyc4/hiJpAlGn6OpJrtfhwA/3NoAhrFjRB6VZvSkFB9ZhD2PQFlet7BlGoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766019570; c=relaxed/simple;
	bh=FPMENRAt57ubCRxfjLzcF+5Snhpf/6c7ZPbigIQkbLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vl0bO9uu4hU0HbKbxsoCO0VUhw1rY0UmDzuxBZHdVdWNb9OX2gnJ1ApplgXV4uNrkrl0z6yzTQ8416+VRaGRn6FLAyQgz4C7CNHgHdvEfgHiF0BwbXNtvECSpkGvnIvJDa1DAQnu1g33vrCyjj6GtV6dsNuMRGSVQf/bKYV188M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=SeD3zVkN; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SeD3zVkN"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so99079a12.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 16:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766019567; x=1766624367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PPCL6/y7z3/CEOFmp8Lif2XeKIDUmNh/4C8MEQX3rw=;
        b=SeD3zVkN3111ayrWIi/4RXdJ/Vra/wDGEidciBJZU6BPnX0zlynkiHQsPGCOpPy+Kz
         91OjysYFCoOh6ZQ62laWG7jFNSVQmm7HQBOpsGl5ISrSdfU0WtH+y3Z4SzR/tr/BC1Bt
         Sf1MbyOS5MMuel0OtJmWN+55+jgjdVp+UN0uxNDna7Vhqf2LkQYjoltiNirdlQz9dQPD
         yTygSGL6hnxFvsOT9s7utGqHrcFCTfOZX79bGa5d/fTquq3ULNV8MaExEBhrz3etTOIA
         HC6d13i/7y/JyTieZZ0sKYRtbxM9CpIuD28yNSKEiulYZ89C7o+7cdhfFsT5J+SgWYYN
         vlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766019567; x=1766624367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PPCL6/y7z3/CEOFmp8Lif2XeKIDUmNh/4C8MEQX3rw=;
        b=Nr+Xqmb1G/8RwZ+w42IEa45kAbyxxdjS4gyvUqj/3v6DcHqM2lafoYmkgX7tuLzKz4
         eMZNGKKl7wuv/k6mNpkoQwrRElYwVy+6ct4oLt7wGOHV/pL5W08WoA/kOS4Xgi1om4HT
         3OI8khk4UD5sVAk/7misi4VvkA2zojDKzAgtdxUuouS5BzsMfkB8iQllx66YE7eDJE0x
         lm3qdbDZpObuRCnnDPd29AeenbOJHKCSNaw8sc3sJYhAch5ThIlkiM6f/Oay9noklA07
         iozKnYjBBZ0FypL4lXdjRs5Qsf4ztnjPJkdhoW1Vem/g/5LFpAUU0ovDE7mu5h61D8lK
         M/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5VZAElHjLzNRXBvC8ZD3X9d7A5zjtEQCygINlSfDa6mBwXCAKjB11S5NCAFFz46IymuJdcZI2SRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyktZBBypydNVg7EV8jqecI0wDUKa3HxoTkktUDTgJEA69a3Df
	RsJAq5ioCVcI+BL1q/sRhF4kloAvZ+Ud+BwharTcjznvWatE6wnvsYhdSanJE6Piu+GnbzRmSCY
	PcYWWYlFnieKGM7JWXQz4ylPoYvo5Pppel6DpLJxrjA==
X-Gm-Gg: AY/fxX6eFT1E75zV3JyBkDkDQbOcAZ88Cb+kLOjn1PCpdrOj4uJWmivFyLLbCnQmHrf
	C5koKjmxwXU6JIskHsGv50mzbpBizsNwKAqEEZ7V4/L+SGdKbh3R231rnr5FcTIK0ZhaNrHT6XZ
	VO/GnPIZlPGWEivnAPgHiXj298kCnmPZInrmblld8/XfaXwGUG52/wE7yHiYK29dCvgGvmiufZg
	1ID0mXeC4w34kH9YSTspXtvon6NicvW++ylaNZuGn7AZ5AM2M2sfAn+Lf1eh1AkJKeQR+C0rw9a
	RESRv7ipcpzHmP2/7hZzKbz5
X-Google-Smtp-Source: AGHT+IFx9ffWc21rG4psT22kose81nPaCccfbhPkdHVZfB+qDflR9MAT1n08bDGSRJoJQIBJyKqvxMeFWeXCiGrpOHo=
X-Received: by 2002:a05:6402:40c8:b0:649:6b4e:2839 with SMTP id
 4fb4d7f45d1cf-6499b30896amr18067579a12.23.1766019567186; Wed, 17 Dec 2025
 16:59:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
 <20251126185725.4164769-4-pasha.tatashin@soleen.com> <20251217144758.4cb7fc20f6fe32a36e8e52ea@linux-foundation.org>
In-Reply-To: <20251217144758.4cb7fc20f6fe32a36e8e52ea@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 17 Dec 2025 19:58:50 -0500
X-Gm-Features: AQt7F2rGMD0sbeNn6J8mWDXpcf-6WIYHb-5NK3iAuPwipvOFDYSdceCMXc5vciQ
Message-ID: <CA+CK2bBbAEngUx0E16c69=RH+C=eAU1nn3RtJCtUNz5B5-gqjg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] liveupdate: luo_file: Use private list
To: Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	davidgow@google.com, pmladek@suse.com, tamird@gmail.com, raemoar63@gmail.com, 
	ebiggers@kernel.org, diego.daniel.professional@gmail.com, rppt@kernel.org, 
	pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 5:48=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 26 Nov 2025 13:57:25 -0500 Pasha Tatashin <pasha.tatashin@soleen.=
com> wrote:
>
> > Switch LUO to use the private list iterators.
>
> Seems kernel/liveupdate/luo_flb.c now needs conversion.  Oh well, I'll
> await v2.

Now that list_private in your branch, I will send an updated FLB.

Thank you,
Pasha
