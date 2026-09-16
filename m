Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9ED50AC1A
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566422; cv=pass; b=ZP75kxktS0rKHQcpjI7WksKMvUb4n1+2SUWqIv9tRMXbFDLbALRBfTSExgr3hTuk8hEcw7M2tRV4rQjnYoEMTr2cpwNf7rxtyShb5mwksX0zyPdiUZx6oGd6hQ8f5wWj32ENs4g4JbbgWm8L3C9p8ZV0zqQhpJkNFcnhZVXVYAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566422; c=relaxed/simple;
	bh=sJxhKOHXJ2nevLGj1got8mOBVf72vjimaOryXufG1nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5ibmB4LDV3OEKrrIPPOFonRLSU5MaPMLW7KWJjDV4d0RrBptAMtN3No7abRYXiy4nFc48dxa9AkFH6OJapKTSq6vxzOfFWxIS9sMnVOaKoJzuio0bteKLNPtOaoeASiwNOcBL1v0dcOIqljA/BZNEtHHukAbFjTQTyNUm+nbrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Imtt8GBH; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Imtt8GBH"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so11686566d6.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789566411; cv=none;
        d=google.com; s=arc-20260327;
        b=jP6OfiJzjcFDiJzt1H8ZFoRJlDq1L0gCr0I1nyK6w1jTItofWwOy7UGRyoJCnjs45z
         TMubGFkr4w/tZiUQZpTxrlIv7qqjs/rQ9kmGIgprdIPRjcc0N8wC1bxNMYh8r23/Paqi
         mrIkC1H2IEpRWnJ+SpNijocPMZVrAlNg/w+ZVi6ny5S+ElLFOw8fkibscaxr+ls0hNDq
         93GbuMkb1JVaONYWia15+Hl56fiTDpoJJSfpgte64i4OfmMj396WSn+QSx2mF8kWIj7q
         yMu/tQew2HA9HbTrVr3FN4Mm6NrC26hw6lLwZz11g+T2ieeTp1+2A8OT4pI17InuVkKI
         UwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNlbuIUKzk+IN59gcDlkyrsYInag481BPrfC7brj0ww=;
        fh=wwObLxGq2qvuY+LdiyjwS4w6hOpSUGmH19RjBfj2Cwc=;
        b=b2zW1HrWsT5QfoWpByPy92i03gZL4wNgS6EYzN8Bj5aEnp3lvcA1pB6/U7XUipi8Dg
         6/yetHeJU7R34h7+ZpbOYVDxWdOB15Lo05yckQBv1EKMerHD7u77n5bcb6KP1k55WRbq
         LlPJAwokHmBuVbUKvq2no7/+ouC94lAwLi/jjeqXvNEZXs5FhhiA7aOfNewEWwu+mkFf
         HuV/lA69039HeFrEf5p6Acd4XiVHZ8VjHfVa6h0zggShIHPGZbA2YL1MdpoFTFHhUFa1
         mdTAsS29iS+gPOH82iDcQ94qxkJEmz2uwU5uXC1Ozuy9//QY70v6JkzAxlqlZMMLKNC2
         MVeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789566411; x=1790171211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNlbuIUKzk+IN59gcDlkyrsYInag481BPrfC7brj0ww=;
        b=Imtt8GBHR+6tSYn5YWyw/ijCEE97efKptbJGybpaKJejOV4VYM/ECNOi82DysUA32U
         5wqSGd8WKHeDV5kbEHt2WQWP4KlVwjeiNSjA4E99IqY7hFf8+eJVp1FQI/kLkeZ/G5k5
         aPrZzUsXhLIYZ1UfG52gs44k7C4FfHU/M08z3NVqfvQlOaWR+DZqleqQQpHJY5Yu7TpR
         gBoBBnWumm7fkPD3SktP0nnpwu9oYCjKcumIHx6B3bqRl+7oW+nwy/hp+LQ5H7Lg1KVd
         T1iUP8YzNkr7JcKwP9O0SYVrStNpl+dIh8mGOqJC87Bu9dHj3VHB771IyFDtKfMaSx2U
         WAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566411; x=1790171211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNlbuIUKzk+IN59gcDlkyrsYInag481BPrfC7brj0ww=;
        b=mpItrcDRomga833nAQTBvbjCkqXZ/y7Azj5slP/Iaf5wNcFkapyXJnQwu8fOZsHqJC
         p1Dy8HDMNuxK94iVYQZKggKgPOFhhRN2BZesQBt0TH3yV42ziwzNmztoS91M+oVFyzyy
         F2utLaEJtk8YLs13TxEUQu2E+Ycv67tC9guKJZ0KlMx6VBUuix//eiLrSSrTSpr2Tpso
         BHuUquZ9oKTxvAm2/UW34ChF4WP2EViRSGp+cYzxmLebbUpCM8YD27jZtJnoJMjOYCnC
         ougoRkShAH9PJMSUObxpphXYg9YZ9h/nIdFDEtMTACRpcdl/7AqoSF+m0K0XJxYDsvUr
         ROKg==
X-Forwarded-Encrypted: i=1; AKwUvBzVxUFJp6i5Jl4rdwP3AhjhBBoNZj9JHrBbBufVIJ/2fNqq7AVL5Tk+nvSCeBG5iohzcykWQxAqu2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mCqUTOXEazhl0Q2B684V9IlJK/eKS6O3Rp6zh5lvUDBbu2VGOn
	dx63YX2EX1ZgIFsTYe1OEopmNoid9i0tLLGYIRjQzSnsP291q1DnVenF1nSyHABKiWBONBGF1TN
	JzxDe19E00+DZOiEkGLnOa83j9EsQ5iNdZuGie1o=
X-Gm-Gg: AYBFou3oQimitzDBgpxCb0jG3AMPIxhERtlXV5+GtMqGRU1pmKDdb2evuxcH7R8udGw
	p2VePgHzQ7ZUjK14N6Lb54vgNX7EPQLAjelcD/c6VKi9lB6tvwuZkxW2mmf5VxYBigHEEt1d4KO
	gfXIVGksMlgxcAaK5FWJ6bsbKpOeGTlQf5W/5n1s0DvfmDkjnRfxjogpk03SJjNzlH26d1dLhtk
	MZSCE+Wjq2Dr5fftpGOa1s/QMV6GTOWDl1nQk+iuFOfvD4mUJ6ZSKfIh9llDDQKREeWTus2yQs9
	0xHB3IZxJLEhXekm0fmVEJMRK6zOFOzY5wBjMgpEOgw7fnWdDzX8haf8vaPiIxDK/q/xRIbmEfV
	pn0mqQdwoq+bI1ebD5eOPdhzORWoRVp00CWnKl0KaGFOEd+loL8XbH6+HX+dJl3oW72Y5W32U0o
	z4vvw=
X-Received: by 2002:a05:6214:6353:b0:912:3dbe:9ca9 with SMTP id
 6a1803df08f44-9123dbea6admr38189426d6.26.1789566410533; Wed, 16 Sep 2026
 06:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910195100.1701-1-silvapfabio@gmail.com>
In-Reply-To: <20260910195100.1701-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 10:46:39 -0300
X-Gm-Features: AcwNN1XRUTKZnZT5SnZML_eXHyjX5-2oEW5oJxfIiqKT7PaeGHtX5L9Cx0hgweA
Message-ID: <CAMAsx6dCHyX6n6zAa+qR_EfK8pPz4b9TPc2CGpkYSnFW4dUEBA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: translate programming-language.rst
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 10 de set. de 2026 =C3=A0s 16:51, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
Hi Fabio,

> +O kernel Linux =C3=A9 escrito na linguagem de programa=C3=A7=C3=A3o C [c=
-language]_. Mais

The citation names here are the same ones used in
Documentation/process/programming-language.rst, and Sphinx citations are
global across the whole documentation tree, so all eleven end up
reported as duplicates. Building the English file together with this
translation gives:

  ptbr/programming-language.rst:50: WARNING: duplicate citation
  c-language, other instance in en/programming-language.rst
  [ref.citation]

and the same for gcc, clang, gcc-c-dialect-options, gnu-extensions,
gcc-attribute-syntax, n2049, rust-language, rustc, rust-editions and
rust-unstable-features, on lines 50 to 60.

Prefixing them fixes it, the way it_IT does with [it-c-language] and
sp_SP with [sp-c-language]. I tried [pt-c-language] and the build came
out with no warnings. The eleven uses in the text need the same change.

It would also help to run a full "make htmldocs" before resending and
compare the warnings against a

  make cleandocs && make htmldocs 2>&1 | tee /tmp/base.log
  # apply the patch
  make cleandocs && make htmldog
  diff <(grep WARNING /tmp/baseched.log)

It has to be the full build: SPot catch
this one, because the English document would not be part of it. Sending
a patch that is already known the
maintainer a round.
