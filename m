Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820627E1DC
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 18:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101523; cv=pass; b=RVAZ+m/wfOi/YlnNG6TexvdooKDJOcpnGXgHkX/SUJI5hXrJlLmvsVXUe0V+VoZblRnTU22uNtq3duhwTNCMFNvQZkGm6Y5OyigWftV03m1aEjYvSPpIe68qGuhaftUueaK5eg/nImqbKaR8THzlSj2ke7b/GC429EmcJOjyYfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101523; c=relaxed/simple;
	bh=V0dB/2hLh2BY18gu/5VxbqVPnFHEO7kUHoe9YwYQ26o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwZ7KEJOMEf9HmrVD2EW30pZlW0lIO8mnrKh9Q5yXX6Eac6vfjPd85Nvr4r3pryE47eaXSR51zjvaBqiWXoWENhxWuiSZ2tHxVsLLj/rKeuAzBIu5ZCc9PuDqr30I3eNteXkGv1hRKgT+bL9N4/cU7siR7ZGsR6oibnJaIsx3FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaYZ3Ut3; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaYZ3Ut3"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43db0c17so5126627b3.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 11:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790101520; cv=none;
        d=google.com; s=arc-20260327;
        b=C33EGLVnyXze5kFkZb/YiTG1f8eEfTh8tbhOF939Xe+r26hgfCx5Ax1uEDwEwQzFjh
         SxvEYkr7o9DOfzMKrS4bD6wAPLqCEsWBA2SPGuoD3R8YV+YbBcOj+wniFaq1y2MH0Rc8
         wFBtQ51QOVU0QoccOOTLL42x1/yS3qftsCJFViJjtHMdJaxbZVzAcK4C6FOG6AqS+Nwp
         xACWEYM+/uDcJ+2UTmDmlsHlOS6NIC2CHa+m3gsKAzayYiEeUYtETFfNDPRiCDeB3SGj
         a2+U7KnqAkFKTpPQGd27XT7nCw+zMzA9WUpBvfh8wHArllj2o2EJRiDcf0OyfXXcplr+
         /5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0dB/2hLh2BY18gu/5VxbqVPnFHEO7kUHoe9YwYQ26o=;
        fh=4LrLv2ZDecMsD0PTTf7M+S24gv8/1hM5Ffx/ephz7rU=;
        b=f9MqqpYioPSv7U0+/tLIOgJAEnJu70h9BaGUx3Jsklmmgy8PJ0Fp7vDvOzmI2DHC7G
         7p79OSmy9YV4K6nA3Ih1kM8ik9yi76/l9b8tFxgTsQyyXWh5BqAtvMVYYny9vwdYVIE/
         O7098sXjagHnIFKKeImoHZLL2PR3V02c4X9BpKRSIIh7sGOkrlfYeuqwUorSVVSWbEKT
         CWdSINLtcqNH6UqgO7nDl/I5Qk2mP+o1k4ky+Ih5K4aJ5mNkepv3tXimIbFMqW4sAda+
         nQQc9E4Hw+nqapp7w91Y413Z1Mdt7UGaMzheR5Soc0iB6UARPN4yJ31m4u7FDIMULSlT
         LxQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101520; x=1790706320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0dB/2hLh2BY18gu/5VxbqVPnFHEO7kUHoe9YwYQ26o=;
        b=ZaYZ3Ut3aJMdUl3eV1GZA6DDidQey7eHo0s5JCfQJgmIMPdBAd17eumcVPpM4zACg+
         rQltV7qFbuI+yqJVImMd2gm8DwH0fWFBOCVJmu/e6ZwvIXYS+fbT7Tu3sxA4RWoSXQKd
         QdXqOD4Qt2O1gCeW/qj0fpJaVSyk7EYOfx4Di7se1Hl3nSfJ2yhMOiR7pZ9z7Ng5jwSZ
         u5c8PcFNjY/k49EgHIQk1rXSSIIOBjYm5ZXYYpltkAu0y863Yv3iZiUwnovkRhIn2+OK
         1Neh+yt+H6xOKsf4mySkUHbUtIqHVmAV4m3u21n4yzEWEAnanXVqvMP29mAWNj5LONmo
         rziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101520; x=1790706320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0dB/2hLh2BY18gu/5VxbqVPnFHEO7kUHoe9YwYQ26o=;
        b=s2Pn/vJefXr90UxjvAFLrpinRZMX9NKsV9Y9o5MKDcHeNcpZripp7vs8HC4yZMVAeP
         kTZBgy39rwipdTjlNBpWnP8yra72SRflL2d0ZQsWnKbFTlUoSHjSRSK7dW8NynXwT3eM
         auid2zMJGGer0/fx5L+uj3K+9jVUttfSgu9EFX4+HD0U0ndjNpAtKbuxCnBd0x+xE/Ul
         D2/TWJ36qZHMxOpzq7njAgQgX9hQ62ur5+t08DAhJbZl9Du9qOJXJzNgDMd2/hIYpZgE
         T+V60nndjyccjIJffy9M1GJVB/CBxzNUUrO2OeYw/NOhZRSjvlKjsZVfT8YPomJ4Uqfz
         Ga3A==
X-Forwarded-Encrypted: i=1; AKwUvBy4gi9PE4wZA4XMeADzUG+aI0jaIBNwzWNczYqxKecmMJ9vuTmjY4Dhxcuhzg+kOj8UxlCZAHbaLIE=@vger.kernel.org
X-Gm-Message-State: AFuF++ny32ddv9r/ydEKMYukn7YE/lsgH6wAll+vf3mbj94slF1V41Je
	KK1eQu8bB/bAqWh5SqXq0Hcf3NGF5wKaBgSgvzjcMnIPssFCLanP6Oy4DPXvEjM/rGbrQNh9lhT
	cmw1iauHRFqdRj6tjqQQdDoY8A9hCJ7I3grw4
X-Gm-Gg: AYBFou3pfCFRWgBEEGanRPqOXUtMCGbdmHBlbiYqi5A06Yf6hBAzdLbg9Pq5qfzpJWg
	XfM7rhdnx5F8nkZxCuG5myjc9oaetXwg+veEVta7zDlrTgtoT1MeD6dEdVvLDCU9m1apQj393+I
	hcClwk5eyPOodGD04/TfK3pHarDtS6d4aeGz9YOdbke8ImYqHm5gR7M58u/5ikL4oo4xpzzjK28
	fzwk27dYh/1MdZSNOrVlmCnbIJcRn4n/jJfEmWoU0OeI0UZDzhfBog6sMDDGGESZjD75R9pNV5g
	Qa/OghliZtdFwTUj1JjhOrhgIak0v5nk2MSEzntOgkdxpCISuhxJTNKC85hbnJSUrLtbV5NtAj7
	l+gdTpy34GQMwecMjJecXzkyMm32JLCsI1PqAzcelwFjAr/X2eRMpNUJMy+eQ+8rSyvrr+8wY1t
	wvLp3yPXUDqsVIEXFUTR2Bhr1C+j5ueA==
X-Received: by 2002:a05:690e:144f:b0:671:2f98:1d4a with SMTP id
 956f58d0204a3-672d57ad1b5mr220702d50.56.1790101520428; Tue, 22 Sep 2026
 11:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOiHx=mJZKk9dT93am0o58Th+yPo2aGj6T4aFWkyeQphPwu4YA@mail.gmail.com>
 <20260922174801.261426-1-chrismelnu@gmail.com>
In-Reply-To: <20260922174801.261426-1-chrismelnu@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 22 Sep 2026 20:25:09 +0200
X-Gm-Features: AcwNN1UEvy6TdjYYAWkeuYOPQ_NK0GTqepljOJUu3EhCkadF-JTRqyfAGfbDh9s
Message-ID: <CAOiHx==_ixY-VNWX=XxqCFoJvE-80i+r2y6SNnxwQe9uZQJL6w@mail.gmail.com>
Subject: Re: b53.rst: is the 5325/5365 "no tagging support" section still accurate?
To: Christian Melendez <chrismelnu@gmail.com>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Tue, Sep 22, 2026 at 7:48=E2=80=AFPM Christian Melendez <chrismelnu@gmai=
l.com> wrote:
>
> Hi Jonas,
>
> Thanks for confirming!
>
> Quick follow-up on the "configuration examples look horribly outdated"
> part. Once 5325/5365 move to the tagging-supported section, the single
> port/bridge/gateway examples further down only apply to 539x/531x5. Were
> those outdated specifically for 5325/5365, or wrong in general?

Looking at Documentation/networking/dsa/configuration.rst, which has
similar examples, the configuration examples are actually part of the
"without tagging support" section.

And since "without tagging support" doesn't apply to any b53 switches
anymore, the whole section and the configuration examples can be
dropped, and it doesn't matter anymore whether this is (still) valid
configuration or not ;-)

Best regards,
Jonas
