Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD3733B961
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 03:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160132; cv=pass; b=fUd75DTdl8noVpSfRQ5Ht316hWGO0mqqLUx31VTnYVOvG3mPR8ZncL4zU2Wjl6uF/R6v5A301kf+ArCDrkJgu8e0m+5wfmv9w5wPduPRQqpgxkTM5Xa5YecFgbHHDcCbtGTzBQ7pD3OAfA4Mkpd2509S1wCNAWv9Hszd6uRExMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160132; c=relaxed/simple;
	bh=EGx+v+ocxOnrIqVHktB3Pa65p9KA8cju+oJZDVVvPt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GS4NvHGZBVFOHRhqMFV7vbkZ/xh28A89ZLfcICxcvdpg70kj+1zE+XKpsdpBP3UpYnkH8XmCKFjHBL8O7fgKZDJwJzJ9UPrPB96FdSOx1T//pEVHnZD6O3JSzg7LSi+5UcARBV8wUdHUx5E/cYBxjzwxwDgwICGxb6T8//SF1Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=F8yXH9M9; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="F8yXH9M9"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bcd3ac3307so16713555ad.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 20:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779160131; cv=none;
        d=google.com; s=arc-20240605;
        b=lAnIC3Wm2fCyam52OcetA18aKFMKHkJFhydO+NLxk8gcGybq5MdGam8OQSK0z1Bmfi
         dAy1RBDTcmXvN2bausnf/kv2mxDMcsz26slsKk6eCLOyOLh4YNc6MStgfRb5iJSL7IYk
         S1tpagRkTbVZMDo4GNlWSG5wxKsHzjRhLDWs+lGeoRIcMSddvBy79F252Y3G/81agYTY
         cP2i5eOknUes+2hNysLQ6LOLvkU2/mCUbV7buiTMpuiLXJBgafOU7wHjBz24a5S3PBwh
         s/E/IH1qAh9NZPqwqtlqHUxpB6b3FDoh3SB2HUYWiYnHC+aSIQkzVwnDuERPTp6gTDDY
         JqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/ljOIyS4C2Z1cKAQfzZS/JE8nWVXlqsRfYq4oe3gMc=;
        fh=aASs0nB8GEtCbXYqM2Y/1kOqw+SR4pscJTok6KyEo+E=;
        b=bisMKhNWpfqN1MzOxZReL4/AMiTmRAmgW8k8PzYDVg2H7HlHKVzsiK4qzsk7ZpGqkE
         Mc0UDmapO05A2xzlAthKXoX+ovAOPEKdVNbYpTGZRz3vwnt/Tq7JKMbs204Q1Vf/1O3Z
         c98LFJ4ona9Gz9BuKSXpwP4WeyebRH5k6QhVskkCcD+tKpFazOZsgLplKnrMJ2iSjHfg
         u02mAnFNJdP1NNvvX1aIlOc9OcIJUHsLs2/bEpLwHFc/Zc2tKuM1KzbHAMNUhylo/sQ3
         T3gNQb+zI/FPNiCowcMbD6/HGIdLn0XI7xufUzwnY5qT0JJ8GcFOW9Vb6ioyBlpYQEFo
         SONg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779160131; x=1779764931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/ljOIyS4C2Z1cKAQfzZS/JE8nWVXlqsRfYq4oe3gMc=;
        b=F8yXH9M9khoM7xBTiq/PBYj6we74/f+tV/Z/uJPT6mV7Je3uH9cZvY68nhrw/pbZD7
         RrqUqU4nS/8cWUIC1R4mdbluGN50qJ+RX4wUKXWuUuqee5FmTm5qKeyxSwmX3XWckSt4
         dMu0d7W7tOETyqci/K8QzVc3GYwpJSdNNWDfH1syvhH7fEN4MFFYMEeNKQ68Mhsrq27P
         aVWmdDPLEbpYTresSZOQlz1z64+nRMpjTFqoeGHJ2ALbLO+aEVlB6cWJw0QVpcfoc/sp
         ixkqsb6IQ0fi1A96Z9vCngExNZWn0IMxQOFxBxY1sT26lTbgF5vDmU2stZngttp9aQyq
         YyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779160131; x=1779764931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/ljOIyS4C2Z1cKAQfzZS/JE8nWVXlqsRfYq4oe3gMc=;
        b=P5iALPTqOnrM02fUeCC5znagqtEwMbADjYZJHe88vaJm4cmYuxHz+t6yhqjj+oZ+3x
         n+JUcMUW+bUBgPP5NqbEIh/d55u6KJnFWHpvdkA2LlzAw35PdDG2ESvMJJ3iHREKHvIy
         vJen87V3BSbWVTE7F4LwP3A6JEDJFOhev/KHI9vyRCkJyx9/Q5ZI0iQTrXKGOYjfkvpe
         /MA+akf/0iGlsFHemfvIGFJcCRZQcwMxgmLC2Lr3T3kJGraE4RiEzARHD4W24DWgn7GM
         ODcE022usIVmOLp2uBwPY1jsEksy52agRXS91zCOBn096AeSj3p2U88xYaKaNQwh49PZ
         DOkw==
X-Forwarded-Encrypted: i=1; AFNElJ8CxTB77S89ZN7TR31rrdB7CJRxXD0HqaUL3JRRzTViT7MbmhkxJy5Ch8SICgEiRHetfnvs/5EeIRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFNkAz4mLNtGtfkU3lQiIneEaPlueDbB88PXEXI8Qu+LJePBc
	jl0hWoDBlehZfur2GQ0WJGiNsTODfwModa6zy08fga0dyOl9lrLo9kweVxZbk1SzQGgBYEhO/Fr
	udW8Mx45rKj7xhOSoxh0iRlNa4cH2LHOvXkzdQvB/
X-Gm-Gg: Acq92OGSyUIxBPebOfjp3bRPNn+7OmCiSCgVkK6eUbEOFL6aztbz8CEFs1PAiJAvu60
	gIFrsCQZ8qW8si2C0CqLmt7yQ6Cb/X57vFTuTbGXkCF6UDhjpEY31g+U/uku5yjqqUiGQw6C29E
	SC7yb1wcha6bGUKV6eMh1JeotbGY9mIzNqMWWgIMp+cDCnj52eQZQTowi77wxX5WJN14X7XVsZk
	syVrqX/uG3P0EzIbGPUlgRgCAQDMOxbZlRSQXs9FbKnGaEGct4uR562Snxxpaz+eAnez9TaEyIa
	H9I3dnc=
X-Received: by 2002:a17:902:9887:b0:2bc:cb56:123a with SMTP id
 d9443c01a7336-2bd7e8e730cmr128227855ad.15.1779160130784; Mon, 18 May 2026
 20:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com> <aguvV8QCxK28ZHct@laps>
In-Reply-To: <aguvV8QCxK28ZHct@laps>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2026 23:08:38 -0400
X-Gm-Features: AVHnY4Lgk3Y-6PUi_KR7kVZAr36ndNcGd5RqHUXUruMuRWQ1LShUOGvFL1p2v0E
Message-ID: <CAHC9VhTEs7rCaoPG7cWAzyVkN3ztdadHAq0g8mEy_MgCiCe=0g@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Sasha Levin <sashal@kernel.org>
Cc: Song Liu <song@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 8:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
> On Mon, May 18, 2026 at 05:29:32PM -0400, Paul Moore wrote:
> >From my perspective there are two different issues here: should
> >killswitch be a LSM, and should killswitch leverage kprobes to be able
> >to "kill" security related symbols.  After all, are we okay with
> >killswitch killing capable() and friends?
>
> killswitch doesn't do it on it's own. It may be instructed by root to do =
that,
> at which point that is root's problem.

As I mentioned previously, there are cases where we can restrict
root's privileges today, but a functional killswitch would allow that
restriction to be bypassed.  My last email to Song has an example with
SELinux.

> >In my opinion, making killswitch an LSM is more of a procedural item
> >that deals with how we view a capability like killswitch.  I
> >personally view killswitch as somewhat similar to Lockdown, which is
> >why I made the suggestion.
>
> Maybe I'm not all that familiar with LSMs, but we would need to be able t=
o stop
> "random" code paths from executing, and I don't think we can create LSM h=
ooks
> at that granularity, no?

I don't see any LSM hooks in this revision of killswitch, and as long
as it is based on a kprobes I can't imagine it would ever use any.  As
I mentioned above, my killswitch-as-a-LSM comment is primarily about
killswitch filling a role very similar to Lockdown.

> >The use of kprobes, while an interesting idea, presents problems as
> >allowing any kernel symbol to be killed introduces the potential for
> >security regressions.  As a reminder, some LSMs, as well as other
> >kernel subsystems, have mechanisms in place to restrict root and/or
> >enforce one-way configuration locks; while many people equate "root"
> >with full control, in many cases today that is not strictly correct.
>
> killswitch "complies" with lockdown. Is there a different scenario which =
we
> should be blocking?

See the SELinux example I mentioned in my email to Song.

> >Yes, kprobes have been around for some time, this is not a new
> >problem, but killswitch makes it far more convenient and accessible to
> >do dangerous things with kprobes.  If killswitch makes it past the RFC
> >stage without any significant changes to its kill mechanism, we may
> >need to start considering more liberal usage of NOKPROBE_SYMBOL()
> >which I think would be an unfortunate casualty.
>
> Why? If I don't really mind the security impact, I want to be able to hav=
e a
> killswitch-like interface on my systems. If an attacker is in my systems,
> killswitch is the least of my concerns I think.
>
> If you are security concious, just don't enable CONFIG_KILLSWITCH?

Isn't the whole point of killswitch to have it enabled everywhere
because you never know when you might want/need it?

--=20
paul-moore.com
