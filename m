Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC2F4DDB41
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660156; cv=pass; b=BDIhktCKrat5LixrljYfaW2i5JA+hzBFMm3OSOvmQX0x4AaHcIQbkEZihmFTma/LT82r2kKECAqaBji/thrhwZdpo7IRJd6IY1N183Cw32sCjaQ0soLVSEFVa2lUCttWn/1OoQ3gnnL2DFjNtzk/XtecVuaZypPMSccx8x56NVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660156; c=relaxed/simple;
	bh=MkUdFfNPXdgajb+rcjncmrSL91PHLhj9SCk6H1w5YvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0FdVf124s7TVZYponFyfxFBhwTQKoBq0v+agrcJdOS+pDWRNfOdVNmYNKa1fGhYRUdr6W8RcWXsn6HHgh7oPl6h31C6ueW+vJJy7/b3UnHs/oGPVYrqeOzKen3puy72fgk5eC7PxgHjdP6Sv/xq5jW4PluvEB6B2uhqGthxRuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA2vp1+8; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA2vp1+8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-912355b1bf6so2850846d6.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 08:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789660149; cv=none;
        d=google.com; s=arc-20260327;
        b=KE65l+YqNaCAkRViD+OCiETcZ0U0h3MboZ9tBjQSRdBqJyExZT8T5tlPd7KDsn6i6x
         GVRIALN7TtmR2i1RQrxSV7/WkIak3u5bXscYqFAutWY7jbi6TVolyhiEWaDBrRE8R7j5
         qcoU06D6BrVuA+DYNb3/cxPI5W5XNFjJdPOExyRgck79sjyTmRrDLQwUwnCC/7AIhdio
         Fh88dwU+CBeAOZiG0sfIHVfwa6ojGffShYIyz8hEgOIyPXQDRKTut43wnfzrQ+f1Ion5
         wUHfEKXv9oU75QzFDWUsAjO8aWqZao9Ldbuje8cVLS1URxnsS9STKSh25CVdZQ2Ou/ZV
         a2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kVbNW9nYkTQQZyk8jzXTmmCW1z4fY6Sef5CqQ+fiU28=;
        fh=QxUX9CkNoVOpyu1GzgVZi6E052+2mdDdLgf7Fo+TTdw=;
        b=AxWynv5eatLUeSbPBeLHGsO7PQ5tUpR7fx0nwmyRrYgNd/zVsud2IBPmL6w7RipfCV
         09dHv2zjgxNc0VJjPvKfucUmcNhorMfwXf43xCAq5EXHBVnmlwABfx0aVj2tU6HtuznI
         lPaRq7MFF/gWb3/2KJdk9PjdniByKOdxxMMfFCVzVxg0Ndz1maoeyZK3VSWae9tmpgVz
         3Z4r48cwsOjNqhJA/GcGVjz4z93lrB+TLiCBUkqertQrm8gHpQtIOOlA2sj6m+yjq52l
         Vmu38XNc8tjcNawpY+EdgDTCvN1FX5S+6mOe7tbkkkdc81fDV+PFEFexSMHeCiQTGwuj
         9+Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789660149; x=1790264949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVbNW9nYkTQQZyk8jzXTmmCW1z4fY6Sef5CqQ+fiU28=;
        b=MA2vp1+8yYNltTbn6zmtae12ab7v0FU1gDQheiNI7X+p5NuJ9Vy8c68YxZ0AhxQ/nc
         cwnjAnon59gRZ1F6jb300vi4pIp3DP1Mnag3pEwdbvcf9Ijw5K9Vwwo3/Uvo+mLlCufX
         tXqOdxk5eHd071gDKOGNQZCpjUMY1a15knlZbbBzLYmrqRzf61fJkkEvPOJ4V6j6rDPg
         5GyNtMtPYND/OPtAaSwvQZk28IL70ksMoWIjdzD6nzQx0bqbUyM3iXfTPFg+txir4UU6
         JtclYKMREtiL4IWNJ4EyQ2lpexnZn7P/vjU6KAL9t7dG6OLTqrXwX0Ow+7qULj/0cc7S
         TDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660149; x=1790264949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVbNW9nYkTQQZyk8jzXTmmCW1z4fY6Sef5CqQ+fiU28=;
        b=0euVYflBLP3n6+/uUKfGNnvuIqvFBfFZKcHHkLwDHogPynBRA5WY6k1OsuDSQXpHUl
         U6x1mhiNdmNTYrmKKuYIg7HV8yW/B66kMBm8ad1XrYX7EY3wfsLIgQAdoxEY45qrhRJw
         ZvMzaH5OP97SD99xrQw1XjF8YPJsirjmqUsl1eh1h445RzsO3hUy+f3wMwP+/mp1xLPY
         XygANnLDgLFQEeskGNy1sbFjJFrIPQqmI1hPxhTrGircrMnWhW0I4behMtCYk8cxUm5k
         HpXFx30FKm6cn1tZupR9fUR3OnPM/rHsMBvTqAO84J82TKyMAhcvRnUz58TYsosMl3XK
         Z1mw==
X-Forwarded-Encrypted: i=1; AKwUvBwqBWk6RZYWRvVgAQyToriMo8SR5VYbjQJYBh3qed9AuqV4OjNopt4qYyWDn286ccdTuD77EbC3ugM=@vger.kernel.org
X-Gm-Message-State: AFuF++nZdT3IeERDd7puRmVWR4PC1e7Ev31ZCowBB5VMOAbM0YVn9NUE
	i/SMHGvNxV7AvrBLE+U1WMtJ3q59fTuZu4bTt4vlYk4DGWqxdbj0BzU07z6UqBUasKgKKx/3ppL
	TgeKnDnVBKzl6ufhr3cPbAhMEHUEaa7A=
X-Gm-Gg: AYBFou3bJP8qCpsPRCfcwpDp4ezVbh5otl5NIPheCnUM47pCgsoQfn/Q8eIpmbhNOE7
	35moexhHzolE57J7CCqbHYsirQmGmV+rkrIaCvYOLAuyjCN4r9Tis+cHJP4KipIokJFBA+I28yq
	ZBOzaFn9lUO1s6+tlA6XhL+oid+1jk2auV2kzA2UNPMokNSrfnJr7Y6iZy4LUdu7kBjgCCjc5KR
	9zeBSL5JRJzflhjiMWXyRKK32gTVS+fPljeVH6dRkVQVQsvikf/bmtXTkd7pgUMU0e8EFwcoLg+
	fbGSumeX9z3TWJ7RPgkQhOE6BB/7t3kFriFOOKtNNWnF0fXS37gT0jR882UM8hI+leQ+fBND29L
	KjUgr0ypdWH8EVzEE7oLKaQcihUJ1/7U4fvP0vMjQdMFRXs4QRkcJxiR1IZ1ghGDAI3oI
X-Received: by 2002:a05:6214:23c9:b0:912:517a:7242 with SMTP id
 6a1803df08f44-912524291b6mr8701086d6.21.1789660148526; Thu, 17 Sep 2026
 08:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916134637.216062-1-lucasadramalho@gmail.com>
In-Reply-To: <20260916134637.216062-1-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 17 Sep 2026 12:48:55 -0300
X-Gm-Features: AcwNN1VzBv9agm3gNTB8NdYr1TpRSTGqcm9esYX-ZHEuTBXEwsWrey6DNjYUI_Q
Message-ID: <CAMAsx6c5-s4kiw7C-F0tt7jZ3Bu4BBHoPmtuhoRK1-K0Gtcq8w@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate maintainer-devicetree.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 16 de set. de 2026 =C3=A0s 10:47, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate maintainer-devicetree.rst to brazilian portuguese.
>
> Assisted-by: LLM
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |  1 +
>  .../pt_BR/process/maintainer-devicetree.rst   | 76 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-d=
evicetree.rst
>
Hi Lucas,

Thanks for the patch. I checked the translation against the original and
it matches one to one, and it builds clean with
SPHINXDIRS=3Dtranslations/pt_BR. One note for later, not an objection to
this patch: pt_BR lists the maintainer handbooks explicitly in
process/index.rst while upstream reaches them through the
maintainers-profile-toc directive, which still points at the English
files; your patch follows the convention already in use for netdev, soc
and kvm-x86, and I will sort that inconsistency out separately.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
