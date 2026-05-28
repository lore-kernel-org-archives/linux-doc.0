Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE935C1A9
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005129; cv=pass; b=A4zD0t0dfY7BOlZF1IXTfCLgEc1QA+alkpZsa4RK7/uMHEDeLiW5M0A2nrp2rfVwhAk3prRlu2ti0cFld6FGIkl5Yf643mFNVcDa7ejbNAjQrpGEx/DTr4oW8NVf7xmQVx7QHtuQdsJYubQh5nP4Pdo13f794ctyAqisJ3gX2Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005129; c=relaxed/simple;
	bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/Hy0fozelqf2XRikEAdjgvJlSxVIsFp/tVl4Oreb35/1rvYjr9lkruQBNEzDcPR7rrSk9BS0lfT0NkCMwDQstL6k+uAlsig5cF/IDI0/79AuFekN3pTW72uazLG72cp+Yfox7S1HquyZ7bz0DjzLNgSrAM7pBbnYu8GZsFMTk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpgXaJ46; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpgXaJ46"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so64861eec.2
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 14:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780005127; cv=none;
        d=google.com; s=arc-20240605;
        b=RjRvfdH6UClZN8FmWfRak9RAp1u6HP9CHB+K5YDlvo3iKZ1EbA1Z40xwv8QzeYIJ9K
         hBvymEXBCXrp1dDRbyl4NgGHmhHXwIh1+qlh/bLpDimcCN1mZpOjm7Lc8tg/B24ehbU8
         jNXJETqU1ZzFUEEzq0po8ovlaK1zHzgO52lzEDxVz/ZWuQoBRPI/YL/KPmYR3Ac+/FHr
         6H27Zj5k4HTRJeS3E5mi4KTJG8wWiVvMkk/ALjexx5jhymv1oEinwb5UNbjABQHUGc19
         tr83NYHbqFF92ApBQE8r9BouV8WDQ06Izqx2+MeaZwnzpwPlNOQ176/eA4TzXaJBCMbe
         LC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        fh=O+jjO8CKloIKBFM4chngp8b8WSLeD7Z7O38Y1P4tf4k=;
        b=kewLVj3qt33IZ8gI+twdXaIGP9syDq+tY21cJeaDEF83RP9+vYlMjl5X4DDj6f8JP4
         Jm7vQ0oWpkKYxgHqJToMn9Sox1OC+XMOqk37MFdwj+OE3+NKYNRZPNsglUQDZQLzH5Nk
         gFwzFhvxwl6th102XTK42sZ7aqJeNfh2yieFB5SZD2NvriXzJ91NT02NZAY1YnAlnIG3
         QY78uBV0BFxVqVjjpbDhViLNdy5+LVw4i8uFbFYrJafpjoX17pVqPnoHDXZM8ZLqso6b
         zCxISX7lhD7yBWvXb9VY2p7kk384emB57amrBwJJRHsPJke9oc6AwURwp3WNxn2AB7Gy
         TvRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005127; x=1780609927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        b=RpgXaJ46mOIYQfu1B61ow0UmPJ//3sn047uZ9Bieq2nvF50lmcQUIx7yHh7VeUEJHN
         CALAcKF7jpQ7DwhGBotMLfr9Z0AgWp4bXka3af6WasjMR7Ib+QIpXoasc/STB4LzQiDz
         ys/9a4whTK/QX2lvIhSw1Nflae1p6z3ooKArBSyc6LbkZv9EgO416zXwKJWC7lxkkuzc
         JCYYO4ydHb4VzfmEvp+iHkTISk8SlRL+9C2DTMTIn6muFQ/70ZQA5cLzA8ZlTVtjWAsT
         aITCGfsDm5xRyQV0g/H2EbjmgeLTBMcdvMYQZ/O3V3nrlwMgVoHqqLLxqS4PePQaaGuZ
         ljhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005127; x=1780609927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Inb/xKxFXd5Gq+skEkeIfv78O2SJYuecAkaftJOgBi4=;
        b=Q4K4N5eEkNIIyfiJ8Pjp6plm+6A4L3Rw0DcwRAPMcj2ZP8eIobCF6youBAgG9TaCXF
         SPYO7xvndTAda//1BdtkUGMkz09YuwlrEu6CYelfTC2zGAjW2QC6gQ3oThpmrRNZHvhR
         yL31kmf//HBNBsFPDSxY2HEYa13Y7msIonmtciMOADXn4vWqUl81W0oo21kviac46I3T
         xZC1uKzCNKVq1VhSzTCJ5aSgtfCz6IXeFSt8ST7E3NnmzghowN+MX5J9YvnNK83keVUO
         WZZTyEMZsyrbZVDiqRIm5CqUgNJVjyjEST/+8PGbAtP6Zh45xmWLy/LI7PodizEszXcs
         yagg==
X-Forwarded-Encrypted: i=1; AFNElJ9PbQR8/7qORSKptRf8K60GE4xtXDLFTjYX4TobIU8DI2nxezc00ZMsm54m/KSJrTuQCWQ6amG1zHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBB7c/mKzNNkqmjedXxSMNNetVCRIsG68xEV9YtvkOKa8MOYc
	PQ23u9rQiu1z+5/oQ4HLpT5V9KehCtKxUOIUTkujCRVD+9uDsxbe+JHZLBNKIPJ1qhdoMSbWBqp
	rtDOMAYkc5qIZFKM6Lg9728b/WjC3WZo=
X-Gm-Gg: Acq92OF9qZFRxnu0hztAHTt/X2r/Ht0dduLgLyyhTj66fsISW5tMsoBHLj0ZGLTovir
	5smW/rmsByDVk3vu1of4JXxzA2BzlyQL0KBpCCxprzqniY5RQV6efHizAI43QDRZQLmcbjmcUjy
	chBppvYf+T1JBTFrOjIsa71pnQ4m6c3DLwagWtTkxZ/0jhAfiXAgYzs21wx5CnvDxLeohbNf3DL
	2Ge7rRKVoEX4zzXBDTvZsngXyFCecm/Z0RCRpzSEiR0iQ8XZRkYlVsmSNcLqqaXRfKLH2RwOtDA
	795D0JYvkMwMGwsndvpytUDTm9PRvL/dBEpW7KX/KFz0zU3ZBrwrqpkkMtP8/UyaOy5K3wdgSEy
	S5Q1A8f1+ZCQbS2sztjbKodheJqPXuLImpw==
X-Received: by 2002:a05:7300:a984:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-304eae25163mr79142eec.1.1780005127399; Thu, 28 May 2026
 14:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 23:51:54 +0200
X-Gm-Features: AVHnY4KsYVj2Jopx_r3QMdCgeZbmquWS2iLzmSMqMdc_bkNyvnbcslo9ojp-pAQ
Message-ID: <CANiq72=tdv2xVLnXaYuvOLXkAYBdFnTFPohKxb9Tc-3QC0Zs9g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:41=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> change-id: 20260528-im_back_baby-1ade32dc049e

I noticed the change-id -- welcome back! :)

Cheers,
Miguel
