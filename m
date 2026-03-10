Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4893E869F
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173681; cv=pass; b=L2YpBXUfYhYC6SUbj8TFgJME7sjVqXQgziFVBd/1ilIBke++9qUseAt5hdi+RMDzyCYSFJDZHz6K3xWTz546Fwqwkpo+i8jUKs1yQ5j/2MInaRjS6jdfsV2ZLzoLjMo5eOKC8srJiQsQgVSLbbkqaqi9BQdDCL9c4+hTrNTVowU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173681; c=relaxed/simple;
	bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+Hv9kMtExG6SuvkODxEtkrYbGKtWw3IviDE3/7ulqjYEyvTnDCVXoMviUtzxwszQfbx5TR4hBIcwEvO4oWURiqRHOUS5itFho3nLLUYoGGwVTogV3Rh6fqnV7qpLnJpBXzRZkwTo1qFVztlBPRL72AdJCZzcL6JFiH8O6fjRyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMAvSP0D; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMAvSP0D"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12c2c5b10so872522e87.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 13:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773173678; cv=none;
        d=google.com; s=arc-20240605;
        b=RRct8Ty88a1JuDZdHfUR6wHxK9wwOwEaDUBKjhBd4rwSmghqY3pnMREfqd3WMnJy2I
         zEM6eGyRTM+1kFjAq1ciiKB9fZ79qa/simPYSJ6tBPsljl29KDzlisl3u3j1FjDUfQl2
         Yi9YLlTTbBfckz2ZfYhSyl+yKkdduHKZY2Wk6ZlcRkbf5vl701AVKCM3A7CcwavKdUQ1
         5ht8Izm/JczF+C/ZbeNzDsKXgkWCOpmlXHnFELQZx6KAdjWz6V8FvhZ+wrqlGkL03liA
         QPq7KNNt/VB/wznRRizw/GMXSBQzXX/QDdYoJzXH7NjvzK90wBGvU694oWim9v1cFsSd
         1W+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
        fh=DEibMebeVRSSolMJAV/y2/fUcHsLo8O6R4CPL+0cbo0=;
        b=k4JF0Jbja3DF3k6XqtQBuc3zoonK0w33dutEptyBNo9DLZil/87E+7/IauPlKYdiaP
         f/HdcIO6LTv7Co/HOsrIISvPfmGp88QksiVEoaiwYBE7mDX5015t58nk2P+HsWmIH/h5
         3z0jXk6kTBnWIebJeKshglvSzYYyebXkOpg+up+cwaeECUX1vKPSkhvprcIZ3PAiBK8r
         CdimpWOOa/xs97aff9VJhJZG+iA75OPM9Tu1+sjHfUmokCuGBW7Fs1SP1IzeMgTqGy52
         3sAlgYYbSfn/Mk2oSUKo+NxNUVi7GX+6gWtnNThduocTc9WzQ5/rd5u7Bmy7KF2Aj/Zp
         1RHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173678; x=1773778478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
        b=AMAvSP0D0mkeFLpGLRsxzt9dXzufCksXmLfSp9pES8MSwxWD7K6AcRTBcGzvamXuip
         HKl57RaRdSHexpqh7x3ks5iWCKHJ0R9D5Vne3N8nNFTuVcYN5OkK/6l/M7yzBH5vMgPT
         eg3jLaa6jh5gzAIV3AN70liQ2PVcWXFJXGGfCTonwdOtVsNjtB0iPWOaltoLtawv+n4T
         kZvrEcQciW80HLHJL7bbI+SPSXYQVpI+zi0F3Te8RRrIVGkwQS8SQmFyPkKYEyYfAt66
         7qLeGwb/Xnm4pS9qu7XO91Strbxg0RM2EdRWlsYqBzoGCFo+WkUoK2d8otARQl+Zszs1
         1rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173678; x=1773778478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JCnK0AMNUESWhNDknJ31xLnBOZD/YQdQDIFIYsdNnW0=;
        b=VR2pFqi1IqyCQ+zWX1pi3t5UQ6NLzxbamxQieSOSUN3Pbf4DzReOuqwSfSeqBSW/Rk
         BKi+FgjVixFcUTlLXMcsvbpQqkoAH2ENeB2QLCATtOCLQwN1hmhEj1Y+/vrrcRHFvBZb
         rfUUqb0mpbEZVqheyczS+56+kMwkRaWVBHMzuyuLapfiVpXSw+PNm3iPUWmJedeN1+AJ
         Llr4Da2sDIdF7InvskBbGPGnosLhkBH90TL38KUcqtVHDCcOkWENZENbCN6WcxZgbzch
         PCl0WB1+UjOcOdE4EnCxtWc1Ab2qMzEPm1/j/coB+3eovOfozKpq1xUgRFNwVNqPkMge
         3hkA==
X-Forwarded-Encrypted: i=1; AJvYcCWlhuVU0V/8nUJ3IJcL5IfVkk5HVesoa74SQ77fjORsHvTThR9YmTv3rhP6iMv2wtcewy2wgM5x+TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxx6WVtemytp2tQNaZdZ14xcodIg5OrHsS2GNBd4ULyD5lpE92
	L6Z3aBl0DDZtzvIojG94uoeyT27OaQpkXxJMvA9VOwri61BrtnedkJl8pEarNz5HZAytti+76uE
	bcxAbLo8rdBxj+iktXgb4imROMfJNL7Q=
X-Gm-Gg: ATEYQzzH6IdyFnIwLeQ8Tz1Ad4fbypL5Fy8Pn8iIt60P0HXODZtFz2jsMo7NW/xzU3L
	SUgqG5sKkrk54xct/8KQmI1MG906Vxy55DoTSi5KF75dHheUI7MmGzlG/lBBd9umx9wABdZ+RNA
	5m0RKsdgsfdW05rTAeXGdA8+tElWMjfIntDfzIJrxJTDiSWDkupeTZAQoTgCu/CznfCkW/5AugE
	jLmQ6oy3bo2vtXt4R+gBWNR0AeXqds0Fk/EYJTya1S5icPpSb5xj3dfYUyxsRgii1hRKMbIqgzA
	vxHa63RAU0YLQV9ZEi2MNA6ffbJp6ZggY+mRclP2Cs5qEwKbJeO03OE4DNDaqcaNeUCbbsKqxrH
	hBfAOGN+olxqKFt16k/q9YX0=
X-Received: by 2002:a05:6512:608b:b0:5a1:4526:b8bc with SMTP id
 2adb3069b0e04-5a14526c6e0mr1985879e87.8.1773173678191; Tue, 10 Mar 2026
 13:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com> <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com> <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
In-Reply-To: <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 21:14:22 +0100
X-Gm-Features: AaiRm50_MESA8RwRkbA-1d6RC2ULGLODPfpxbpwL-zrxkxJSvvasen3MhAf2yGY
Message-ID: <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 4:33=E2=80=AFAM Carlos Bilbao
<carlos.bilbao.osdev@gmail.com> wrote:
>
> TBH, a reasonable case can be made either way, and there are no written
> rules on this question AFAIK.
>
> In terms of precedent, the Chinese (simplified) translation keeps code
> blocks unchanged, which I suppose avoids giving the impression that
> non-English comments are acceptable in kernel code.
>
> That said, the goal of translation docs is accessibility, and since these
> are illustrative snippets, Spanish comments help readers follow the examp=
le
> without having to switch back to English. Personally, that argument
> convinces me more.

Yeah, I guess it depends for whom the docs are meant, e.g. whether the
reader is one that will afterwards go and read code or the English
side of the docs, or whether it is meant as docs that external readers
may want to read to inform themselves about what the kernel.

I don't know if there is a policy for translations about this, but if
it doesn't exist, then it may be a good opportunity to align.

(Relatedly, machine translation on technical topics is quite good
nowadays, so if the intention is that a reader may read the English
docs or the code afterwards, perhaps it could be nice to have a
suggested way for them to read those docs via machine translation,
especially if there are accessible/free/OSS/... solutions).

I hope that helps!

Cheers,
Miguel
