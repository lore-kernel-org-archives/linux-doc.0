Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6314277026
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043803; cv=pass; b=bfwyymnIIW+W3GOKQGwuLhkSML2b9fKC8cMEqQM7ekv8Bu+sGzl3NqSbqtZ9wZfqbOXoQ7U5qzvL055P8/WBnfxo1PlL19N/3zR90QWD1tLK+16rijQEEX/DWWEKOM+ZEZKWOo/Z5V5NWSET7fmbvSTypWvtILsq5Z0LitXy5EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043803; c=relaxed/simple;
	bh=5BAMHytd4kvzuUgndcBud/UrnLOdHAgpwSexbphb5p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmT+7GfAsAJlGFiB/4cyX5gvl97GEB6NrB1Tf+QgOOEKZ51QCu2pSIBAZ1j3JUJuQZ7ti98Sv0LMG4mdCPfa2Yc688QBaQwLqVjWz/S8Ac1Mtbg70OXeGYbVX14mcrcEPB+HlHby9/sTirjnarDEn+/IwFNsXfya1jQ7pIl6TPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUwJnVOR; arc=pass smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUwJnVOR"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-124afd03fd1so10101147c88.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 10:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772043802; cv=none;
        d=google.com; s=arc-20240605;
        b=UvJ9zY23NIxggqseCj6EebcEGBRO4SEHASU333XpCirH2tINUf5Jdyhjkd2eWCrQrt
         HF4jPI7/Ke7x7PnKW4IJKvb6Ojlskte8HWRBbrDCpH1KL3qBhZU+IPBeA2vk1GdbSh2W
         D4zfmkFOpmDUyy0/hZFKVF/oUAxlj046V5+BPNkdx4zlKc6oNQDl2KygyDuzcdDiqn9n
         nskrQvl1Hbrjut0jg6a2PxeMvW4XajexRcox3e3jNInHysItpS+6TP8iI7f3s1sG2Xgw
         5Fe2sqK5uWscDOhD42e/xjMgy7OquomMvxSwGZU06WUXUw7qdkERKhm0iHaW3dB8zKcu
         6zPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/xa2NxgBV56+zcp+pDI4D3jQAyDOvWbrM47gZNUvrNM=;
        fh=XRFae8jDKK+0POSVjFjI4Ujh1FRfw6d3L6zg5wyi5qM=;
        b=Bn4+NGCOMG3PlYn2VLdLe6T9PW7vq+Q/IHvbUTszl85zkXmlbB8NN1boONwnWLJXDe
         wB5Z16QNO36nG3INSVU4fEonLMtA/d9TENXZN9xE8tXCD28oVn6FACaJ6F3Wxqe9cOMQ
         jOMefsoaRp86b/xyVw+SrzHFwjB+Mr8KOmwlU7W7YPn5ANOSPYVwJztksgD75F1t5w7z
         Djdea3XroV34mMoEQkHOV75AwFK4tfVjCiorzwoBmj7nZwfm2MgvF+9WXqVVy8KnPx5A
         yQgPFIkG10/29OsOI9zvw2Jw7mhqdIqa9kxfzoRpUpsMjyENo8gVh3W18XQBeL0XfIuC
         9aEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772043802; x=1772648602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xa2NxgBV56+zcp+pDI4D3jQAyDOvWbrM47gZNUvrNM=;
        b=YUwJnVORBiebkiK94qllkkfj3T/ItETMXbmGt0Al4qUauV2c3sCnLhe5DjaQZ2JLDD
         8npgdn/h6sSQ7kRiJJWEq1Dn64Ezg4WnF9P7gvdAkJzgfDKQ4d3g+qvi0KIURAvhwFu0
         q4e1Erq5mmMFw2VuEqTRY4prw3NZryRelgD3MkBkTsOxkvVS/DCGOOvbfWzxPCXPe74O
         9AVrTb/MYzG92OHUOwBzNqSvP8pkjxPKf2qnhEcpl8gPimuIjgwtRYuYSIOkPc5gG2HG
         k/Aw0Tp41x/hLiK+uqAQpe9zoMkzVcTknJ0CSS4nWxFmOOfEDJF36xhCgZl0Zl1y7sTA
         lnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043802; x=1772648602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/xa2NxgBV56+zcp+pDI4D3jQAyDOvWbrM47gZNUvrNM=;
        b=cepqHEzw6sZ3KUa/LmGXrPEoikzFiSEsRcWuTi04v3DmaFSdEAuMu6ETSZ7JK0q961
         fXGAnBNYs7cl3nX8pogZc5+Y5nZZaVUAo/tGVlyNrL1xINs6BWUSMtg1WZ2NA0XRTsBX
         h+2ImgvlgAHr+1ZrgHY5OHIYQXr8Gag7hqgQQr77qT47akeBdXjuJaOCxCsE660UjmA2
         zr++E6DNoxivKzh+1ee5+GzeBUyuKmS1uAP/QD2GM9tbyM+B+L6//AYfSWXHXAhwiiHz
         +qXddtutjEyxNxN3hFIG2ixSdVq9iykOOKL3703HzHX0H0ZGKsddrUHeq0qtWYmXkwIf
         bN2g==
X-Forwarded-Encrypted: i=1; AJvYcCWrFtQSpN7TnAqI1fvpB/Uol10R/55I2CS1PcWVXYTZZS97OZSwABESMsx/p8iTeFNy0qKTNzdomII=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaHMU3dlSLJ/gJQAI/JZHjJ0d5nX+eL1KjQPA56wpdl8p1EXDt
	aAS9EhOU73Kgg6HjkLcE9sKOJfEMgDgLqIygR7lhsv8xOBuNVawGusuF0St74yy73ULI4Fs3TEl
	j5tBQJB/EgwfrAcbkuw/263MEhqAWwQ==
X-Gm-Gg: ATEYQzz+IPyuwBFW6BlHqDhFVOl7G4NmUmQlNNpxR5ZnWl6H8XDBjSk8tPvxcv9yYOK
	NHGQmqdSoPtRpgihHYfoEhTiRyegKxayo1WZ5UMa/+Cf4bEihLr8CxndREzShKL0HhO0zzEodpl
	Za9UP8ew++SjIVTOA9IyaTVPTOi1pOqJeDCkekqOwi6S1HJrQBrfpxbf22nVowo9V9p9+GohGS7
	0Ymmm22SchdgIMXlNcf/JEScbAVyKi89jwUrg7S22MYKo9/RQU0R95IWpIJFCWMRZIQVS0/19g2
	r4JN7kQ=
X-Received: by 2002:a05:7022:1605:b0:127:3214:c862 with SMTP id
 a92af1059eb24-127869c8215mr555717c88.40.1772043801261; Wed, 25 Feb 2026
 10:23:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223123232.12851-2-ravis.opensrc@gmail.com> <20260224014011.56624-1-sj@kernel.org>
In-Reply-To: <20260224014011.56624-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 25 Feb 2026 10:23:09 -0800
X-Gm-Features: AaiRm52SmZr4YLw7ydgp3VDu-h8ez3jJibjPYgTRa_tIkzg4tH3npe4ZI2HnusQ
Message-ID: <CALa+Y15MQecahb-FfeQEJK2uwFdC7VxUH7GHCfSvy3uQ_jNC_A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/4] mm/damon/sysfs: set goal_tuner after scheme creation
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 5:40=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Mon, 23 Feb 2026 12:32:29 +0000 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > damon_new_scheme() always sets quota.goal_tuner to CONSIST (the default=
)
> > regardless of what was passed in the quota struct. This caused the sysf=
s
> > goal_tuner setting to be ignored.
> >
> > The comment in damon_new_scheme() says "quota.goals and .goal_tuner
> > should be separately set by caller", but the sysfs code wasn't doing
> > this. Add explicit assignment of goal_tuner after damon_new_scheme()
> > returns to properly apply the user's setting.
> >
> > Without this fix, setting goal_tuner to "temporal" via sysfs has no
> > effect - the scheme always uses the CONSIST (feed loop) tuner, causing
> > overshoot when the goal is reached instead of immediate stop.
>
> Thank you for catching this, Ravi!  So, this is a fix for the RFC patch s=
eries
> [1] that not yet merged, right?  I think this fix is better to be carried=
 with
> the series, and squashed into the broken commit to not introduce unnecess=
ary
> regression.
>
> So, if you don't mind, I will squash this into the sysfs-schemes part cha=
nge on
> my tree, with your Co-developed-by: tag.

Yes. Please go ahead and squash it into your series.

>
> [1] https://lore.kernel.org/20260212062314.69961-1-sj@kernel.org
> [2] https://lore.kernel.org/20260212062314.69961-4-sj@kernel.org
>
> >
> > Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
>
> Reviewed-by: SeongJae Park <sj@kernel.org>
>
> > ---
> >  mm/damon/sysfs-schemes.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
> > index bbea908074bb..fe2e3b2db9e1 100644
> > --- a/mm/damon/sysfs-schemes.c
> > +++ b/mm/damon/sysfs-schemes.c
> > @@ -2809,6 +2809,9 @@ static struct damos *damon_sysfs_mk_scheme(
> >       if (!scheme)
> >               return NULL;
> >
> > +     /* Set goal_tuner after damon_new_scheme() as it defaults to CONS=
IST */
> > +     scheme->quota.goal_tuner =3D sysfs_quotas->goal_tuner;
> > +
> >       err =3D damos_sysfs_add_quota_score(sysfs_quotas->goals, &scheme-=
>quota);
> >       if (err) {
> >               damon_destroy_scheme(scheme);
>
> To follow the order on the comment ("quota.goals and .goal_tuner should b=
e
> separately set by caller"), I'd prefer setting the goal_tuner after
> damos_sysfs_add_quota_Score() call here, if you don't mind.  Let me know =
if you
> prefer keeping the current order.  If not, I will just make the change wh=
en I
> apply this to damon/next.
>

Agreed. Please make that change when you apply it.

>
> Thanks,
> SJ
>
> [...]
