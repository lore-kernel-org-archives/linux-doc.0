Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1583D9022
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844247; cv=pass; b=mFYbIODYBIJDnz9tnn6N4MRr6bV4q2ZX5lYybenZf8wpWSUxYjz1U9pRwnQb2O0XCmOey+8JbOyxT3/Nt/UjqEy1TU48GAE4K4OIioBj/AiyjTd28s7rGHtQ/Y4ZhFFIpY4qibYbkKTDrsX/nqd86EbWPht7NsKjR7DS8P3qtgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844247; c=relaxed/simple;
	bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/C4+/vkHZM0/a/ivI3VUUGjRDRsdav/siTWWV90a/Qya4XLLyz8fmAKplG55O8CFmSsvgwS836oZaZ05aojW1PakKl+HjQz5OQnt1BL2Cmy0VM66IebdERW5an303CSfvyv2V5fVdVJ8hR0L8hlPO4iGPKvtaAWRbMjNn0uXQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvLgOGPz; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvLgOGPz"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12714f01940so437033c88.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 07:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844245; cv=none;
        d=google.com; s=arc-20240605;
        b=PK4RjwOvrJdc+q/t2FHx1RaCbidHK1WR0lZTYT1dD+tTjM5VVlV7x6K5PXPx+fK/Da
         U3mVfM9QudAP5g/l76m5mqWB1woghusDzj7Zzry7hLPGlNT05EoQc15bn7ficlpd5FkQ
         aKGxkC++qC4rJPrGQ3efSqofmjtGqi75uIwY9ZPv+hj2xB24ZnQFkezJpGw2NqDmrqQB
         Kvt3FO5fGjA/EUbKJrZKKDWRy4m/sbXPf6OON01EHXqwOzAUcdhtiJxqrJfanpi+g/Q7
         aR3vdWNBus9cr6W7jOxWPlbm7AdJvr+m2Vvreg0TCB5DpYnS2h6oXfnZMcagRScTa/eS
         6ALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
        fh=7k6w0PH1R8osQMvwq/GNVX/EnFA+5kZO0XjwCcCaK8Q=;
        b=dbzIS2zVSRId0yR1roaOLn8BIVNr5LzayzAMX3I4AZ25bo1GmUVN54Gw+PmSfbi8Te
         ndCGsFbNBowN+DiGTa/LObmpm9Q3rH+9ThOvF3EM78EDGfKoDSqOaFPShlRyNLdI8iM9
         YZx47RZJ4fUAvmX9kxUPYHWOyk9kUBxQqxqjjOvlK8KxjrgV7ya955Y1qmqU2GLj+UvO
         tBUKDSrI27N2aBsR1jxbQf5+mQgeP5nOTU0v9ZL08vDbJCJ4U4jJaE+2yfxSzUE9drRk
         PKtmKJW7MIpIjqwyBOh3rP2nLqIFT9vHZTbKqnrrD4exoS2RFK1/1K/dwhX5AgDWFoib
         VZkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773844245; x=1774449045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
        b=WvLgOGPzBVE7DbcyREPvzipwUVhh3y9mBh1WrEZZ2YvFrQjfWy8/tOqDK3DmG/LPgw
         TVA2wM+PqVVK1OEumdDSOA2AJrXy1ZeNHZsgVBFC3KIU0d2MOAEM8c486BlzCA6Fq8gm
         /WT9lH8UW109y7UeozteDGT7NcxKwRGj1NU7nPkRNADh+b8Xqo8DeocrNYe4cd+YCk7W
         BdXV51BcQdBLRReAAsjjBCQLPo8by9cd/pkhPO4L7EVfuz/yP1+aeLPQAD1zu1H2mcCZ
         aGqGFfTpIvaD9qGhcoKxlKhe7GZYZkDzWBiqE4kkesXwBH5x4yYXpuicQMEqu9pVSg8N
         f/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844245; x=1774449045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
        b=oMGF/hY2k6PmNNj36ee/48BHxuBbKhDBUl1Kj1GPS5oOuR8rsgKPLh6H6T2TXcPVJV
         8G70EihxW35MHD0BCuQoX+1Xm512ftjuEy/zrhK/E5TZzy/P+MjZB5n86LCBTl8nZWk/
         ZaUFBjM5dBIkH4brmFi03ADI+aihPEP1kEF+Q6KbMfmpiBmdAkj73xvdGqy0CxaIiwPE
         B7xy1foljgyTMPgYMo3XioZ0G9n04WD4Axuum7fyQUGv+NHhcrAEYBcUgcetYaeFaeVY
         vc5m0aO2QvnzKh2eI8+bVaps/RQz3Lv5lEK1wQlePrKTL7IFp5N2sf7KCBxcBfBajRY7
         Bdjg==
X-Forwarded-Encrypted: i=1; AJvYcCWJgPobcSR/RTjnT0hsLGf+cg8yuqrGgz5WI67uJEe6vB2AHzIaM484ygWWp57PQvnLfN2akZhC/aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzasUDXkTBAWlIL3/O+9FeiBGTpqGAlvBcIti+wBJS8dwnukL2z
	SoAwkPopjk3hoeMdYckIPSlkBXZFV8hgpOW93OzeWdAJkT8DTLXHiFc4zsc4wuOaL/Ll6/NfQHW
	aC6G7Pn/fHOiVWBIHGjnX6FHDXlJWS2o=
X-Gm-Gg: ATEYQzxqAPMjXxGsIDl7aTpCGMkEvKkUZUNqNzJzNma9jpVSvRTXAKamAAEUBKHxtE9
	/vc2jNDi6037Ij5njQNJFi80fAW7/tDkYm031sfLFjJbA1jhwbhSuzJcfoyyeevrU6+TjbvigAE
	yOS0Gbd73hfnZPAqyB1Jq2J19M3jSD8DPKoAE8hkif6Gu+c4QzXCugW6U3SEg26QzEJ4E5jP9lB
	Lk0qGLds0HkIWgsodPQMa31LnEXBaZZSm1JOQI7IF5j4fY6Y3sl+4V194Z9+y03BZ3W6JdqYlRU
	B8xJrARO050cw0h/Y6F4OaJre+dp+EocOq+FeHd2AMo93XMHRSW4eyoRWSNxYZPSkwkaFO5zx8E
	HjWwlHgh3
X-Received: by 2002:a05:7301:1e96:b0:2bd:fa8f:77f4 with SMTP id
 5a478bee46e88-2c0e518610dmr846274eec.4.1773844245396; Wed, 18 Mar 2026
 07:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com> <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
In-Reply-To: <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:30:32 +0100
X-Gm-Features: AaiRm50bVmwgAQrBl1Sd2LWxaRmG-ZY7uRxgxq5LrbNAlb0we3rijRktUCTLM4o
Message-ID: <CANiq72=GGicUCODkY3C8U53wQfsuRYeu9GiwrM5eFhkP99kiHw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 11:59=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I'm not sure we have discussed it in detail yet. Both are used in-tree.

Yeah, we have discussed this several times in the list and in meetings
-- please see by other reply.

The handful existing ones I think were all created by Lina (so perhaps
some were kept as-is to avoid extra modifications of the patch -- not
sure) or by you (so those don't count ;)

Cheers,
Miguel
