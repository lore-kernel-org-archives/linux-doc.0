Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A126A0D5
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804925; cv=none; b=VnnTFsoVFyNomsBc70sV6acIJQP0cegtFyWyz5nrJpKMY5ZUKyUyByD/9ZWTyWtCXQdiRj/7n42Nv52Qo3YwACJK6BsdkMhgudPQEXatBJWUqoio2Ic0dlB03S3Oo4MWUqgKgA38NhEePICkgFAGgBbm9TmuLttA4KzruLMaU6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804925; c=relaxed/simple;
	bh=oZ/oMsImSwXy0iurVEV8OYWOj1EK5Ol1S2elCURr6o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEh2/nZt3L5EgXUrqJAswZ86MkHYRoZS8fHhHX2VfVRXxjaM1AZUPt6SqxQ/+ulalzkoNRSCrF6IlgrB1YKWJy99WcgJd25VQ7g1V55TAibhCZ/SpoPHPycFMUGVMdxDbY0x9gDo6gc03FD5B8wjc7K60f12A4iuhRcAUHsrUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pPMk8ro8; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pPMk8ro8"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b30d09da9dso37858771cf.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1756804922; x=1757409722; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KlEqu4WxUDiABf2a30g8zFkM2TpzDalMOcCpeUi3kyM=;
        b=pPMk8ro8+Yj2e5GcMg+nnrdCbWMa8u1B2AHCvpmpG4WYnwkCAtHfQf/mPrDcLvVJzI
         vfoKD8hrHyXIyTaeXOhT1Iyo2KSngHpPf6d+8aO/AmL8zWLxIItynXCxDE9ZcClhxjmK
         LGk4n+XYjMdT7QESQ4oENa+2wZK2c6zlQnh8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804922; x=1757409722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlEqu4WxUDiABf2a30g8zFkM2TpzDalMOcCpeUi3kyM=;
        b=rI9y9Stf+hzmFlYEFrOYgH7BhmEUgvc6w6Bj9uc+Hy2eujkFRddzxiLWaMDSjDbZbS
         SM8t3Ld/ynIAzohgv3fWxQLbjl0828cgRKYiqtCV4H25/H1wIUXbr4PACXF5AwhoNkA0
         FWDjqRzJHanzR5Ct1gKAbtCNGfhqESRNorXGtiLZWwIVZjKGQOgIycRMflSrB2Yh67nf
         C9EcWmCwkC+xu8chfvwL/pjJ7iUFQHrvzNribpvRpqMVnrkaqaYJVufvu/Jl+6lvSMuH
         Uj6yTXA9EsDktrqQn+iUcVVA7bVNJhJQ4/CurkTzQlZAqRy/Ar1erXfZQ79Xr6+XBtWh
         x8cg==
X-Forwarded-Encrypted: i=1; AJvYcCWDMLWkfyPH/J6ZWIlEPi5/bmpMk9N8IT8IbcfDaUopLXHBU3s38/0ctIOEI+V4aa3D3n+uNocff18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHW8DoGGql+kIA9GXbdQzOelyHjsoB4Izn/3yinrzj62VRLjR
	M+Y6JLTTYA+ilbCqNWSM68jOeonzAjA3yxBroC5wwRsTc4iFwKQ0yw9OOeoU41VWiUuoLMmwSIu
	l74kLTGoLos14J8y09huenNixygqqWQA4KRUbHxjYzw==
X-Gm-Gg: ASbGncu2GyeJzUhv1/dvEhA2Mfha3Ge6Z849gONKzvkNWiVsJ6lOAnl2GE89K6vHZlG
	ceoduuvbzA13+cNFDeyrnceLhhLY12k5y+4NYgxj2LMdecofDs5GDfgj+Q/iWWNtuZ/8aUJlV0i
	U6kUzlk/7DP7w9mC/G6dNjy5iMQJVQQ594WmWDA55Zk3AXSjX2p2fcIWSHJ+CKhjoF7jdjIIiV9
	/idEoNtgw==
X-Google-Smtp-Source: AGHT+IHGEIqkQ7T/iYNa57/nLq67pz6kDXn62sDrEEuPOwlRvgJBGGtL0MCc4sflnVaHrwo9btUA3j959kBW+PZAoRU=
X-Received: by 2002:a05:622a:1448:b0:4b1:103b:b67a with SMTP id
 d75a77b69052e-4b31b9c3777mr140959691cf.32.1756804921620; Tue, 02 Sep 2025
 02:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829235627.4053234-1-joannelkoong@gmail.com> <20250829235627.4053234-17-joannelkoong@gmail.com>
In-Reply-To: <20250829235627.4053234-17-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 2 Sep 2025 11:21:50 +0200
X-Gm-Features: Ac12FXymFicVPinwbFSWp8veqgoTeVOVPPlBCbz_Zbd4N-bMcdXkFmiPs4wTQ0w
Message-ID: <CAJfpegvjaNZSJcyNWxyz0gQk-_9AXqcPuX71m7yoT2s0cd53iw@mail.gmail.com>
Subject: Re: [PATCH v1 16/16] fuse: remove fuse_readpages_end() null mapping check
To: Joanne Koong <joannelkoong@gmail.com>
Cc: brauner@kernel.org, hch@infradead.org, djwong@kernel.org, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Aug 2025 at 01:58, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> Remove extra logic in fuse_readpages_end() that checks against null
> folio mappings. This was added in commit ce534fb05292 ("fuse: allow
> splice to move pages"):
>
> "Since the remove_from_page_cache() + add_to_page_cache_locked()
> are non-atomic it is possible that the page cache is repopulated in
> between the two and add_to_page_cache_locked() will fail.  This
> could be fixed by creating a new atomic replace_page_cache_page()
> function.
>
> fuse_readpages_end() needed to be reworked so it works even if
> page->mapping is NULL for some or all pages which can happen if the
> add_to_page_cache_locked() failed."
>
> Commit ef6a3c63112e ("mm: add replace_page_cache_page() function") added
> atomic page cache replacement, which means the check against null
> mappings can be removed.

If I understand correctly this is independent of the patchset and can
be applied without it.

Thanks,
Miklos
