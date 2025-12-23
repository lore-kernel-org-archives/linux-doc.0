Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBB8145348
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 18:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766513857; cv=none; b=jCvsIiSa+9WN1Y1l4+vSs1FBiDvLDGXaqsAA/DblTsb8DcG0dXpWy2MpO7h5Tv74TuL8CAtsDejDELtioiU/TjXT3TMxNWZZlkZxqk4I+R2FKBwRMr6phss44NwKrav+zs1q8FfXNO6wWLbYOLu6h6+UHSMdSbhK/7rUTfine88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766513857; c=relaxed/simple;
	bh=+2RXmFBnuoUZNP9t3XSeZExCz/tGXq4+QrVc7VKG6+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUlK1AmVyLNxHJxajxpu93AkM1eFtaKOOgrOHJhg59MZpXkVLcwnK8EN1GHb2EtetGYMlV+3sRHnflRyg7M5hct4PzKZCupoyWeySJaTpM4LM5dkPqmdt3s7Gu5nvV293RsnSF2gjeSE6L6gXh1gnKuq5+kXI0FEc4ZdXxMGIRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=K6RIEzDe; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="K6RIEzDe"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so8514850a12.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 10:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766513854; x=1767118654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2RXmFBnuoUZNP9t3XSeZExCz/tGXq4+QrVc7VKG6+Y=;
        b=K6RIEzDeLWR8YrR65usBGB8vTsK6JuB+Zcg3jNFUp5rlfprAwTrBYB8+Zl0fVby9IF
         gGJ8bPGXLA0PWiP4W+QmesMEmYf9VFvJCKHzqHYHpKB40NF+R6BLDmOgOg0OR8FiCa7g
         lLA4Au5VYmxEtqlrXGVYZvpxl1pqydmTaXn61ze5sHYaKvPugGNGNq6Of0kR83QA710Q
         fe8tN+aTkfhmdNq5j0jDaPBLa+tySSUiuEjSMp96U/eTWjVTzxrRYzM6Zya1cer7HrYl
         oOfJkL9pMqFyB97m+578BkIt23/GLL/L165e5scf/IKCieLOzAAV9W8hj0EZ6mQA0SJd
         uf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766513854; x=1767118654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2RXmFBnuoUZNP9t3XSeZExCz/tGXq4+QrVc7VKG6+Y=;
        b=OtLoJnfcb3NWHqERBiWgookkPjMNivo+ho6KikKSnyLqtVvkpTyPT0gs6RQKy6W5lk
         k6I8pHoxlcemjMqS8YGLHNty+ChH4rxmlU+SuhyWjGcIIRmsNEHs/hGy3lNHVeZToWvd
         b3UVgksI1K7X6YoBq6U1dkWPEF39fnsoYK8MA8Wx6Cm3aieDAFCTJEDypcV5iB9pdhfi
         vmppdinLks09g0D74UEO5Wmi7ayQDKhargDkR+x2ZciLVpXr6KS/JPKN6pZxDZNWp3x/
         PpJxRuMYLapZoeSGhAZhH2WikBTqUPrWe6ijGSQYaMa2W+DCc3Gw44QuYO8py/Pj7T6X
         FW5g==
X-Forwarded-Encrypted: i=1; AJvYcCV/dxfIl3VlleQ1yY/UEnAmHPGX4ueWO1RSlCMKKxV28Z13Vo4m5gPop7IOJZ4Y5fqNVqLoIyt7cI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCnva/aNOkfkLT2b8Dkhb/g/OdNNAo+uKzA7x6VoDdzTZe5zM5
	fYv1EmrUoLpgEsKBqNGgeAaghrha77fWMzTxM9AmI2rfKoRbJNpMc7jL3Rq6OT+OzIzp36/knzH
	RWNXvnOqv+i0WaQFcsSPJBlTVS4KKP0q/ZcJ7F4EnMA==
X-Gm-Gg: AY/fxX7rV+OPg50JuMLekH3kCo0UfK7bGSIg0CK95wlCEBUAlFB3VctoZREB07SXIhn
	VZn2P+q9jPeveqn/iPPoKt8S3wuzV1yzrO4TgwUYnT47L11adIFZ18xjZWWwVF2A6GaxCG4fCxH
	8Ie2m9ZVDUqQ82CzcM+aWlrBnBDlAzAuTv69m3wuMmGpewCJy/whkiX1rUt4lEx7ajJok51+3+A
	7oo7tH0knP+BW0jspXJe0SHPRvtqm9Gty4BfWgpaplbMoZSrAxGrP/YXLms9QScpUEWbPAmxdWU
	EuK70ScPPgLfN/QsL3HVtSDvPSxjjpuBmAtK
X-Google-Smtp-Source: AGHT+IG7R8OufzxbkFMNpnBpqEEtRO/h0PChaYqg3fbSuA3NHtdOdOdeSWlvgqHDikQUpiHUXPkzTwN9tQJ5alYq+AI=
X-Received: by 2002:a05:6402:5112:b0:64b:ea6b:a884 with SMTP id
 4fb4d7f45d1cf-64bea6baac4mr14256712a12.17.1766513853843; Tue, 23 Dec 2025
 10:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206230222.853493-1-pratyush@kernel.org> <20251206230222.853493-9-pratyush@kernel.org>
In-Reply-To: <20251206230222.853493-9-pratyush@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 23 Dec 2025 13:16:57 -0500
X-Gm-Features: AQt7F2o9lKh-MiYjTN0jydTh4lXfEZrS5Ed5W1ywUvAOmrIraj_P1WZBiW42-WU
Message-ID: <CA+CK2bBeJwACBiKsuXLcbzC4m0zLhu0yNg2HDGR=AQGeEVCJjg@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] mm: hugetlb: disable CMA if liveupdate is enabled
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Alexander Graf <graf@amazon.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 6:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
>
> Hugetlb live update support does not yet work with CMA. Print a warning
> and disable CMA if the config for live updating hugetlb is enabled, and
> liveupdate is enabled at runtime.

Could you please elaborate this commit to explain why it is not
supported, and what it would take to support CMA.

Thanks,
Pasha
