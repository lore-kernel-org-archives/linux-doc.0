Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079634EF1F
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504180; cv=pass; b=bq88zUv5iGpl6SXurkKLepT8KMGEa5ESgFCi9lAZYrpwI0R4Dsk/PZFur8bf1ra6uy0NEKazb6XHb64WtLtYsTZJMNLscf9wfg40p1Z1QS4uZG8tF1cUJ/F/jtFh+qyqA2Ztywh++6wXKAmhYO/5/S387Ftk47W4D7sw//M5tN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504180; c=relaxed/simple;
	bh=K1nSbZ9JHxGXe1PY43kUIDIHZzf9qdHZvIas6we9lUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoHql5zyG5nxh5yVD8KUqBBri/8cVFwExqzWYMPaM+DUDz5J9PhUNYfGZLTHbZmyjKWWAXSXoRBw1eDlqB5NdtyMJA7OI3UDHN5UThiao+TV0G0nEwtthfDN7K+xpBMrCurZtcq+l+PG4b6JQ8FpzeIY82a2R/nxJYAwMjb949Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBg63wyp; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBg63wyp"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40f0e14b9f9so2168829fac.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 09:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773504178; cv=none;
        d=google.com; s=arc-20240605;
        b=k761Tt5FeXemw9S9AyWnDR23L3wzkBLUmJ3e0eLV2SiVwXxPJfvJbTYP3HbArPqDGp
         Gb/F6h5U9RVpx0FPl25YoEXm3nR0TNO7ZPeKKYtKjwCujm0gHD3OJvEnvW2oJvJIj5km
         o9LoxySAbSAO5vs+UD8ObvAN+ED1ZSYnmAHGAUTg8rDKzr27QGCZs/qsVttnj9xLi7wP
         f257n9p0+E0jMUpr4frx7uuFAAbFXL0mQDlc3LZYOX4ed1hK0PiuO3Uh7kbhK7YCLvzk
         pmi1a6td3dSqet5dzkFQktKJge7EEWeMafo77JhJX+fQ1q2s5mg8cwAzWeo/esMuls0q
         Luuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K1nSbZ9JHxGXe1PY43kUIDIHZzf9qdHZvIas6we9lUA=;
        fh=IlzcUq/fJ04UtJXJj7jp0XNIeHBp/27UulFemof3X+I=;
        b=D4Kh6SE1eLHAq6fBUztrw9WXbgkaspWRD5BjKld2Zz2qexLm5h8riYpNGX48NV/IrN
         d3Yq/rALNrxX4eJuHrXlDlFJfoKSZ6ce43sw5DF/rp19uuqnFEiV8Cbso3TN/4pFkO6B
         /L/ZLGdlt5Gmb3kVfNyVlpoLxM7WT3lpSfqfKvuekKhe3d2o7idtiqbtCe8EgKA2nYjZ
         5UphPYTgVFDivnli5N8+pvAxQ+CR3G1E63iuMuIaMocH0tF00aDVhHlT6nAGoS1cnVtK
         loVBPUAEJ2Q//HkVMSlrlp6i+Z0wS6FrH+cozz0SS5bVWPkKZ0mG+zxuWdPgCVgxaR2+
         DYkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773504178; x=1774108978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K1nSbZ9JHxGXe1PY43kUIDIHZzf9qdHZvIas6we9lUA=;
        b=iBg63wypI43kobGYhHYO/GflUNyx9VhBy47RCTX72xO6gV0Z2qz4mwXwHiqHMt9qUX
         qDqeVT+4v1xJDFGha8rklvlvUEokVRvDIv9m/DrFOoARYNW1ncCYAOgMmZMaoYDNEK1S
         6qTDA4unJqsQCd6ty5diVXc73TncwQluO6TU+7XBkUgsinPMYNMNv3zuSQ3oqN46QxdZ
         RoJxSDlF4xm0IQGwlvzQsuDTDBQZkK+3Kj7AHR53/bG6FkSeGkI1tdiBYo6CYuacbEy4
         b8CL0p+28Z6Q5ksVkrWWGX3EX7y3F40p9UMaTSHGv7SfdLj8EhwfqBlQ2OpA+419uyGQ
         Phmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504178; x=1774108978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1nSbZ9JHxGXe1PY43kUIDIHZzf9qdHZvIas6we9lUA=;
        b=AXxilM6aRz33YyTJ2N5dYJIlqkZUI/Pb1IkuwPkOxyKLr2rMGWvDZxYJzvmqWyk6i1
         CV7XM9TDQj8K2p1OW4T7TRrJd5f00xA9TqlOt2//GNwt+dV9a2ZOGyNinqjZUwAl53mG
         Jbegn+KxYjRrzTDzP1VECgfzVh1wWI0I2Fm0Za05r1jlJoxBKnIgdbBmhS9r8UsakCJM
         aeHbbVRsIUQPTfX/y0XTjMVsI01ezkXDaR5qta8S5AsSBkVCdCKgKT1fAVkeWMBTK9+I
         U+z5WxQ7n/ekUjw2S3t9knc1cI7RIaVs6dH3RM5uAaO+Q7DeIHy/Gkzk1XQ/aRyvMyZl
         6WRw==
X-Forwarded-Encrypted: i=1; AJvYcCWNwZLa9P0yTO4vjzP3XEvyLrC46SRbUWnX/qZpxsLd3ypG97tDmnHpYEwy/4x2xkoiF8c9SaKsXTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ4capmkFhc/h0LX2O8KHfIegsHSYodKlJT6jiaC60MD4QRswb
	MLaPYtCwMQ880rJMZXE+4UWHBcmguoxrnbC7a2O1Y798n5eQ9m214UZUMhbRPJuqEaIeZ85acZI
	qfkvvhVH/8pdY1bCm54BuYHV3s6lvYLk=
X-Gm-Gg: ATEYQzxiKKysRWiV5ZhWqmYRCiduOouWrHhwOHXxHM7wwOkCHecLF7KcBChGxD7tavC
	yQuxk6XQuLtFyjmqV1uNSdv8CCY6VVJyMpYVYFPNV2UUEhweZZkyh1DOymVTfwWNMEspOpxHSA5
	4X18zw6NrCc9HZA/Zb7VOs0phvsyS4/386zl8UGrBEwh8XfbwZwP6cRhaH1ekTlmc/WtEoOVxSD
	Rm4kClWSQfbx6TxpxYObqjrnK+vkRwuLuoyNxcMX3490e36p+sbsQiCfZOfLo+BnVfMZZ2F3JVa
	QqY49cqvPr+7KxHbSQlYww9z5XHmgKLvFP93hkjQ8pckC8BXZS5oNc4K1bMgw1Un+7te3g==
X-Received: by 2002:a05:687c:4089:b0:404:b83:89c7 with SMTP id
 586e51a60fabf-417b93e480cmr4169901fac.44.1773504178550; Sat, 14 Mar 2026
 09:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314152538.100593-1-xaum.io@gmail.com> <87ms0ajtvy.fsf@trenco.lwn.net>
In-Reply-To: <87ms0ajtvy.fsf@trenco.lwn.net>
From: Kit Dallege <xaum.io@gmail.com>
Date: Sat, 14 Mar 2026 17:02:47 +0100
X-Gm-Features: AaiRm53vF2z_1LkGKcLWkMd5jzeE0yJrpkWR1I2_02f7198yoOzbZrqld_rmUCs
Message-ID: <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
To: Jonathan Corbet <corbet@lwn.net>
Cc: akpm@linux-foundation.org, david@kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

The material was written with AI assistance (Claude) and then verified
against the source code in mm/shmem.c. I read through the implementation,
the existing comments, and Mel Gorman's book outline to identify what
should be covered, then used AI to help draft the prose, which I reviewed
and edited.

I'm happy to rework anything that's inaccurate or doesn't meet the bar.
Should I add an Assisted-by tag to the commit?

Thanks,
Kit
