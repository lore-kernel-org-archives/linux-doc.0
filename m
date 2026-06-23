Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6BA3C1413
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252410; cv=pass; b=kmgWGlLvZKtdSXS7A5rdtDc10bqPezovx++5gOW1IxVxU3KkGAu0jkZiSt1NICz57VnLmQrSAZWD1XKOHqBg1eqgp5N48Vg/dCd9f/JDrLsD0fqalc1U8B5G4HiINXrxXwnvtoAYdXYunqQsJni8Of4AKANnewR1HglpaDlsqc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252410; c=relaxed/simple;
	bh=P4Bjcc2g90rCZwpLUPfcYDqywWWZ3CPJdaKkyPaUlPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOMn/Ceny3OYRY2LTf/XzCKe0f9m2EL33lON1GST8QL0ERnMJfO+WfMMYKvJ2t3tLB+7OYVGqDLatVPZuDmNa7SahgjEGq8Dk0qvot271G7HT4GWsAvyRGd99G+eYsaXVp6QfEm/vF2t49YIVLcRyCa8yz7chXderF34KWUnpdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nn0nxI0L; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nn0nxI0L"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so542716a12.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 15:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782252408; cv=none;
        d=google.com; s=arc-20240605;
        b=Kxc27JmVWMy2YKNAlKKh4rUnrHwuVHQ9A71gK93J/dSdl2io1ItdiNgPRlMLc+WNLO
         u8qmsZFKc56VeMjBzZdS9f9T9f2AMRgRZWwimNNPzBdiXfnZ1Xdy7OIvh8Zo0cmjfLMA
         NYoBwxQ+iFzeZC8cVC0/yeNqCUKkW+ye5CAK0RfaXjkMeCI95WrD82LH+j8fvlDu+qpI
         PN2e/KBrM+yTAtmgjtSG5TW9O0dBp9zpOVh0uzCQ9lETmg2Tls6CBx5B38XbeD4rZFkV
         h5RaL6oDelnvcX8GAFHia20CQYw7UUrsVTz2VEtDkLP4H/Ov6slJYe0wEHJKiwCA9IWg
         oulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XoJED+TBqNpCfXx2/2rhI9BnHRUNSOFVPTrIiEf4/tE=;
        fh=PmYmsPQO1lvpdTqTOc3txIr2c0vLUu7pe0f1Ymt7aEI=;
        b=gev/KzoZphaD/OukZtAdeJYZSRwLtk5q34UD+8CT5Do2D2/URQpYSW5hg/R6UQQpZc
         R8Kh7IWmEDR7d83/5p6xYRX9ii+3MpmVNDuA16XDX0PuToyL+BA6pjcAD7NDDmCbRoeq
         8ALAlZ6PvwksBAOXvaOJpWiG4CHX9nJBT7WKiO8CPGuZuAWAvaTbYkceq47HMxajmE5T
         0VNVUIaK9HTYn9HGXr59ZT2BPOt/YCdTZOrhMV7oh00LrbIg+p3ut8SEN6/9I+UbYk/y
         q33Sq+cQqMT6NnMedZXop+3cte2VPzXv4He4VWA7jpNnWpeAadJo5nVc7LZ0DItZmTHY
         9Jkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252408; x=1782857208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoJED+TBqNpCfXx2/2rhI9BnHRUNSOFVPTrIiEf4/tE=;
        b=nn0nxI0LL0ujyTcRYudT83wXs5YAnXQXPEvbSakGfIUPr7OauhwhUAVByUfyjQsE4G
         3VsbLDTuZfm9pKV/RMoJiNnQOQzLQc9H/0AewOryQVRgcxSvH5ztRM7Kj83wf25Mwcj9
         tT23LPx8w1vNREnckrRCKp4844JqBv3D9kF2pbiKV1kxe6KD637tqtGmMFlMlxqj9igW
         g+/eLdjtEpl2+oM1TQfM6LU04V51mvvZ2U3aGgGrbAb5sJtR/X0gnWQz+nvIMxXvQYgI
         6bF65nHrwFEpZvHRk89RCsMlJYYmm6sSo098xDc1b2Cd+3xphLPphdQhMceBP0zCVIU7
         uIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252408; x=1782857208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XoJED+TBqNpCfXx2/2rhI9BnHRUNSOFVPTrIiEf4/tE=;
        b=PaNNZmV6AYtTeXCWJ+McQWlGk+uFnmDZdt5DPOwfAdhpfcwHte3MeupzYRXryEew3W
         43VRfEWnsovfqkIRcrULN/+ea4vLbgDuh4lyRAkO0nDjqSVOqA6KyQlOrBUPKpsnHxMh
         2ExhMlory5TdvBWTjstV7gjOkcbiBQK2YQH6HJFk47OQdFiUDnIjbN9FSueF5IShcxRb
         VFX8UkO/kQWLRoyQtKMTtXuvgFtS2nR03YLgnPiGuwso6o+daAh4YyxSuf+ZevOFNYny
         ljHZ/JeA0AhudPRAoABqcoC1T5zW0AIZ8awhTATuIbCgu5EtpIDcAwpkAr52QuZm0x9Y
         +TrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mlQY+bSmV7j79EuE7nh0tCxYvDMTDgFAvGtPrHE1G5/udEaWdgsgFufWeD7t0U0oKcXcWqtCcgDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgtAIiOOrqI7uxwdkiS2ECKTCvkk13HIEQ+qoIbTYXWeq6WQLK
	wNyTjTOG1AJN2rHSs08oAVgTnJlMmJT0oB36n0LlTlbsdYFXi1ADPu8Lc11QRhad/gYxv5yGsvk
	D6EujfhQZSPs7PleIKiKAuVc1EqFa/AY=
X-Gm-Gg: AfdE7clMHg8PqQFMPC/wG/Dfi1sXOzaByxnHv0O7A18L4yOfdlBgNXJFEnDzcvwLdgZ
	oKMK1DPPvZ62pKJ/OmtcPJZ9JvanlQcYmRfSDESxG4Z/B5ORdBHyL7TGrnO1X/o379TeDlXvlQ6
	WNjgeA7j7tt7+1StBLA3YodmSdbaGM+wtw52I3r2PjJpr+/+mbxS3A2RmRhxPU73qjr3kAsaMzC
	P4m7rp72VJ9RT0cVCB2VcBhzB9H1kvJ1iMDdEj6z1wPZbpxXtvBhDH/htgrlxpvzhLINx82AeHN
	dnzrl+De1EtaSHvKUVgBAmjcQS004ZoBMsl+brzyWkXpocxGLuEd6mPOwDWenSSQtCZv7xL8c0D
	JTeY5RDZKGiWZqbjojGsRI/U91T3lIQDaC3T/UKxSt9qq1g==
X-Received: by 2002:a05:6402:146e:b0:68d:235a:cdaf with SMTP id
 4fb4d7f45d1cf-697f377116bmr189804a12.5.1782252407504; Tue, 23 Jun 2026
 15:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622234803.6982-1-ebiggers@kernel.org> <CAKxU2N_EGTWkvtPOxQXBroxGVXDf1atPoFVyRRu0wHOtEXVWaA@mail.gmail.com>
 <20260623214730.GA3281861@google.com>
In-Reply-To: <20260623214730.GA3281861@google.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 23 Jun 2026 15:06:36 -0700
X-Gm-Features: AVVi8CeboaDakYuMckubiPixxEKhNCjPeUq6olU2uxCUHJDj2YuT_JoocSvKBZ8
Message-ID: <CAKxU2N_yu1LZeNxEUkhahx_5VYML7PZ0-EZfP94p7SmpWbO6qg@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - Add af_alg_restrict sysctl, defaulting
 to 1
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, iwd@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Milan Broz <gmazyland@gmail.com>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Andy Lutomirski <luto@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 2:47=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Jun 23, 2026 at 02:28:17PM -0700, Rosen Penev wrote:
> > > +static const struct af_alg_allowlist_entry hash_allowlist[] =3D {
> > > +       { "cmac(aes)", true }, /* iwd, bluez */
> > > +       { "hmac(md5)", true }, /* iwd */
> > > +       { "hmac(sha1)", true }, /* iwd */
> > > +       { "hmac(sha224)", true }, /* iwd */
> > > +       { "hmac(sha256)", true }, /* iwd */
> > > +       { "hmac(sha384)", true }, /* iwd */
> > > +       { "hmac(sha512)", true }, /* iwd, sha512hmac */
> > > +       { "md4", true }, /* iwd */
> > > +       { "md5", true }, /* iwd */
> > > +       { "sha1", false }, /* iwd, iproute2 < 7.0 */
> > > +       { "sha224", true }, /* iwd */
> > > +       { "sha256", true }, /* iwd */
> > > +       { "sha384", true }, /* iwd */
> > > +       { "sha512", true }, /* iwd */
> > > +       {},
> > In OpenWrt, https://gitlab.com/linux-afs/kafs-client and strongswan
> > seem to be the other users of the user API. I haven't looked into what
> > they need.
>
> [Please trim your replies, thanks!]
Not sure what you mean.
>
> https://gitlab.com/linux-afs/kafs-client uses AF_ALG only for
> "hmac(md5)", which I already put on the privileged allowlist due to iwd
> also using it.  So it would still work by default with the current
> patch, unless it needs to use it unprivileged.
>
> (FWIW, a use of a single obsolete algorithm like this is also a good
> candidate for just replacing with local code...)
>
> https://github.com/strongswan/strongswan already supports userspace
> crypto libraries.
Oh lovely. Looks like this needs fixing in OpenWrt.
>
> - Eric
