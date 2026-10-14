Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6441686D
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998200; cv=pass; b=TjNOKotRyYtysdYTVrc5JCg6zvxqGryrV866cZpWfjJscFlheWi242tyjLHp0wutlXObg7mVA9UOsGujiS5pQErG0cSfYNhZok4DQ6P9JbECNbIZrB8uBDg86Rl5WlU//HdSzHF6CrdNGVXfLeE+Gagsu+E7wR73kul8NoNiz3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998200; c=relaxed/simple;
	bh=n+P8pdNJr8H9eqpeBOYRiQuM0p60+SoNiR2bMXH5/Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbNfItJNerpixEW/BOG8oAssf+cbhTVuJ2DGRH31xS2hFuE7qDheGf1gtK+rX0XYsspLC7itpFOCJuov4w1M07X+xQa6mepMUNrCszi9jHRFKtyRzFVWMhUTZoa2CIS5iDepafZF8P31Q3dxJKK23amW7Ug1RtkBMG5c0blwuds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3gXTShF; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3gXTShF"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917997ab0d9so53719806d6.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 10:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791998195; cv=none;
        d=google.com; s=arc-20260327;
        b=ovkBoP2wyfoy0G4MhWc7DfDgzAeF4nhkMrEiAP3EZQ7hENDBdpYgtlpAKlREi8L2Cs
         j5TfGNds8C+ShH8aK8AwLN3brB2kaY2tM87LkH91T54r3g3ExfAKtehPhJhwQdBs2Z1B
         684Px04grGP8KoX26OL2uvocklsW9MJed/dJh+BAew2i6Kqr0wDT6Vvy35Alz6Q1u2PL
         iyA5YoRBVrvmmhOeOfh1AK/aCmBHTCfNPWDdzH7gk3L1jhN5kV7A5+QULBhWpKmLqbcZ
         lvZeld1zq2P+7XZnrwktTmsLjbJ6AFCsJBOinWBtoaLJ0/4n2aDD+M9STBTOlBjBtao/
         jwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wlg/8gEVBdbdfN7cd1lGPe9ZVLLaJOIvL7fxrk2fyow=;
        fh=dFNmdrP6NDDYV6geJLAmreHAphErhhQC54VuUrg4lGA=;
        b=k+uN2JJ0viNLAZ5x8rPnSDu0DFgXMNK1+ZwHWcN4d7rkyycPdQN5FOO6T5Ug4pbZNG
         0J4R9zhyWstRuunWTs8yHh16SFpLMguAMKNVPju+aud/Upab4z1bOTlgs5OZfB9PrW/s
         0RlYO/muZFwDxUsONwVhnlrx1c4vU5c2mH68EGEMDW0cBaCBlQy4Bjv73f7qlFFYFR8Z
         Kou9qPCi8YsYctZklqBvvcb1UJzFKqqumYaNh4AKRuLcsqs4dcVil9uM1ZqX/7/gBwcO
         nljKG/AnvX9RDXX1rUaDCJ2u1NqIC6rJQYmbtL16PcBJc+mrk9Ju8Pmrw5IXEyyGRSpu
         dBgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791998195; x=1792602995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wlg/8gEVBdbdfN7cd1lGPe9ZVLLaJOIvL7fxrk2fyow=;
        b=H3gXTShFT2OSkacagnG/JE5TmD7+8mWaNR04btyNiHnV7EIQA2W0LIcT7Z1v7E+e4i
         m+n1VKx0ydaeSxES6Rk4Nzxf6Y2LiENSxzjG/zD2Xv0BLUcotMRNnEl3cbLac5dDUqO9
         SjtfQg9ZJpchZJu5wfqdh5XLB8JFqaFXgvbnNWlMBSA8RV1tGOLctvtEKV+OXFHzUhRN
         nn/dMcH6jXeef2i5timAGb2qkbmxvaS7Se8MMXMk83BpX9qjeYM0T0TbLOcYialYMjwJ
         3zBSMWZPb/y4eJmlJ6fY1eCVsadTm3cJPUVpAnsh2Xuc5bVEe31K+foE4uA8s05zVjY2
         Xb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998195; x=1792602995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlg/8gEVBdbdfN7cd1lGPe9ZVLLaJOIvL7fxrk2fyow=;
        b=fZcQioEeOHYlEp6Ucs0k/C6O2EoNpi/vky7DscbSn+g/U3fH31NvCHW7LJrSmxJuOQ
         W8kDT9F95PsFV5LsaqhpCcpveC+9GUPOqCoKNWJ2Qb2hA/qcLrz7NglTFZkFQpJzpSZ4
         4/aRtxB4DDy7vwl8zwq+hIIvb2cKKzNMPeACzqcHr0tJqFTX3HA1tO3jDx7wQeJmnPJd
         bzGQEWcxw8HQP7hopQtR1mPTkhpFdjvIYeJBHY4W+87ewCI/ktqBMTjRuaZH1aFju/pM
         ItSJURUP1VvSyRQNno5xRy0B7Ohmbxse21oLRn4XcNSoYyiIb+l3jFGHuLniTvuhf2HM
         trFw==
X-Forwarded-Encrypted: i=1; AKwUvBwMbV4NATzPuDpqmtvKtriCpVrkqCtIcWxrTcHTh3ONXkzsbHnjo77ounvRqdhhdB5E6Ok5HnIH7i4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdxavvvz4Xo3RdUix6wImXEwzzQplhD/T2GaFKZE+DNJR81QGM
	WbqRS/Uw0ywEKPr2XUJ0pinm5I9+bjrkL0lrDuN3VMzxuK2DUzWB7UUJyL7jToi7U4V8AwgMvxk
	XqHemf0Z9Y0OpW4ysbZ3OxwxFWhxC4Mc=
X-Gm-Gg: AYBFou3CyL4vpm04Z4NIt7vH4+AUM74e4zchFKtyTqqw7DrR2da3YTyOyOigXvI/itM
	EHAU7WZWbo0hgINWNkq6089PgpT1sBWly1SiVV8YmQzhg4WB3F2QTZYUEcm+fMpyAHagDTmgBwL
	fE00j7BoWyedDzVhpPJYLSiuBgdJ4PzOXckVpZ0Dy/4JDGb6rLEVbJSiSffQa+25EcNrdO0trFT
	w1QzQ69C0UGErWUGH5HssrZ0+LRzwxCcRdzA0eyVSYa9hnGLgzBEOEduUoB+jq9JZLSU+SDmLNE
	QnhnGqXXH/aWIv95P+Xas6xvsJiCy7z0SqI4KzjUNQI73kGoIHSkxdIvwwTbv0BDXJVxWxBVnX1
	AbNCGPN3LlFhMWH8I0bRgHdcbWtlYh90/g8GGSg+KciDBb3uwbj/HhclE5hix1JqXITjh
X-Received: by 2002:a05:6214:21ed:b0:914:15ce:ed88 with SMTP id
 6a1803df08f44-91b55310e0amr276240526d6.3.1791998194886; Wed, 14 Oct 2026
 10:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791933697.git.lucasadramalho@gmail.com> <ee88fc5b7ff27dd1325b8a80414615d300b1558d.1791933697.git.lucasadramalho@gmail.com>
In-Reply-To: <ee88fc5b7ff27dd1325b8a80414615d300b1558d.1791933697.git.lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 14 Oct 2026 14:16:23 -0300
X-Gm-Features: AclHuK_YabWgvVn1tya9tDw8zLhW66tU6kX4gs20bjAwBzgAQPFsSDGlNH933TQ
Message-ID: <CAMAsx6cEyoHkYOS0_M-NuqN0mxswKdpbzktffPxDhikV_w3cDg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] docs: translations: pt_BR: Translate stable-kernel-rules.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 13 de out. de 2026 =C3=A0s 20:46, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> +- Deve seguir as regras de
> +  :ref:`Documentation/translations/pt_BR/process/submitting-patches.rst
> +  <submittingpatches>`.
>
>
> +   Corre=C3=A7=C3=B5es de seguran=C3=A7a n=C3=A3o devem ser tratadas exc=
lusivamente pelo
> +   processo de revis=C3=A3o -stable; devem seguir os procedimentos em
> +   :ref:`Documentation/translations/pt_BR/process/security-bugs.rst
> +   <securitybugs>`.
> +

 Because Sphinx labels are global across the whole documentation tree,
`<submittingpatches>` and `<securitybugs>` link to the original
English
  documentation.

    The translated Portuguese documents already define their own
labels using the `pt_BR_` prefix. Could you please update both to:

    - `<pt_BR_submittingpatches>`
    - `<pt_BR_securitybugs>`

    Please send a v2 with this change so we can get it applied.
