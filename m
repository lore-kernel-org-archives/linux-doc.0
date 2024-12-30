Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012ED1A23A0;
	Mon, 30 Dec 2024 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735555546; cv=none; b=dunj4lOsduBu65ZMyjEGYQtFeCTrISEN95Jy/+njx4vsQI2fh0XB1Y0TI0Uk9U47CVreP37XzgjRz7c60wKXFUrm/lpLuMMd7jwxg8b0zRsK6nNbZYhCU59Am/8/bMQnz2B2O3g2rZnEajLjs8WHckMdZchjSrJpmjeKaXlT3p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735555546; c=relaxed/simple;
	bh=MyyqxY+4axSmRerXkxwEbonseAsrrxLjwMRyANk7ESw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXpVqZjFGepM9x3SfyN+kJNEDSu1Ylb44PcCS4Asp6VcbuRXL/GewahrnxgV9TUceb0cY9gdcd+J7nNvVsGl0CL5f/x1U7/4I/Y0bNLG7TvsFwNZ6G/a0fCn+Z7v89sdx/wKR06uOesmIcFB++P6IAKasMtOzpBSdHhtgB7lOjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iM1Cbfmd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iM1Cbfmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D494C4CEDC;
	Mon, 30 Dec 2024 10:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735555545;
	bh=MyyqxY+4axSmRerXkxwEbonseAsrrxLjwMRyANk7ESw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iM1CbfmdpVzoyI8x+QFDc+ZXRLcQn1eTnmhTncMXettOgfE5wf131/jGVGxbOFFG0
	 srjphgvETKgJIIwUakwE7qoEI1lBvawxFHgBrmJAcrgbPzKT3vbGbGR//9f4RccN2I
	 cdy5i1xLvOAhtYkn+5wowpL3gkz3CsMV8Qgpxd1LvIbuRHrfva+8c429PIw9ABS0LR
	 5pmF4bUApzg1ip+NFaO8yraUqwL9KYn0qYAgnIXBgVS49a2ZwQo940ilDd1ykmRACS
	 34gxQGKetzeog7UGL6t3TRQXJ7JQ4ZmP3tECUcf3duirve44dQ9TQULD8Pe2iZlgp0
	 eSQjBpuHylg0A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540215984f0so9524801e87.1;
        Mon, 30 Dec 2024 02:45:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+AJYYMSELVtlkYhhPrvZcXkQhI5M9ZpPnWvp9KaP1enfFZFhznsXu30FFj1ZVp5mn5Rgoc5Sq5Z0=@vger.kernel.org, AJvYcCXsrrXPKK6PdyZJAmZi7tnU+F1OnJaA/GWgEYox/zZnVgG6KLw0BQCTrZwsVC2C+3b6yYuOMxIKVNgAbU3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw0Y16yuCafpjuQdSpWMP3hVHxTF21pL2wnodj0z4X/di4uOyh
	+MSXh7crQmtQmICckrKofn88OiXnuIq+flTVdoZ+d6tqcST/hxbXIqgIGMVOblsto+Bm9aOhJTZ
	XC3ux8Hrd347gd2seyTBfWKnUC94=
X-Google-Smtp-Source: AGHT+IHCbf2MqBDIBOqbtKgTRZtmq9pqbJ286H6wKyQZ2huLVRI5M5aYcYxJQ026vr4Lb0jBQzcljJdFF6Qrwzn3g6E=
X-Received: by 2002:a05:6512:280a:b0:542:250d:eefd with SMTP id
 2adb3069b0e04-5422958ecc8mr10949972e87.42.1735555544132; Mon, 30 Dec 2024
 02:45:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733305665.git.ukleinek@kernel.org> <6fe15069c01b31aaa68c6224bec2df9f4a449858.1733305665.git.ukleinek@kernel.org>
 <Z1FbOrGjaVsGKIXa@smile.fi.intel.com> <mfgqf5xpjnyud3qm4hwycbnz23mfik4pzry3h7fi2k6khokbgd@facrmygrrqnh>
 <Z1H5UqN-egUs0GhJ@smile.fi.intel.com> <zsqtlottouotiklytvbqapexuopzxlasqod7ynohu4yhtnr7no@j2zqryrst7qc>
In-Reply-To: <zsqtlottouotiklytvbqapexuopzxlasqod7ynohu4yhtnr7no@j2zqryrst7qc>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Dec 2024 19:45:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASmmPT9YHK1=B2KpqtFLQ4z5PWkARhFJzKhEkX7QZu0OA@mail.gmail.com>
Message-ID: <CAK7LNASmmPT9YHK1=B2KpqtFLQ4z5PWkARhFJzKhEkX7QZu0OA@mail.gmail.com>
Subject: Re: [PATCH 1/2] doc: module: Fix documented type of namespace
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Matthias Maennich <maennich@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 11:46=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> On Thu, Dec 05, 2024 at 09:04:50PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 05, 2024 at 11:55:54AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Thu, Dec 05, 2024 at 09:50:18AM +0200, Andy Shevchenko wrote:
> > > > On Wed, Dec 04, 2024 at 11:01:10AM +0100, Uwe Kleine-K=C3=B6nig wro=
te:
> > > > > Since commit cdd30ebb1b9f ("module: Convert symbol namespace to s=
tring
> > > > > literal") the namespace has to be a string. Fix accordingly.
> > > >
> > > > >  In addition to the macros EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL(=
), that allow
> > > > >  exporting of kernel symbols to the kernel symbol table, variants=
 of these are
> > > > >  available to export symbols into a certain namespace: EXPORT_SYM=
BOL_NS() and
> > > > > -EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the n=
amespace.
> > > > > -Please note that due to macro expansion that argument needs to b=
e a
> > > > > -preprocessor symbol. E.g. to export the symbol ``usb_stor_suspen=
d`` into the
> > > > > +EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the n=
amespace as a
> > > > > +C-string. E.g. to export the symbol ``usb_stor_suspend`` into th=
e
> > > >
> > > > But C-string is ambiguous. Is it now okay to use
> > > >
> > > > static const char *p =3D "my constant C-string";
> > > >
> > > > EXPORT_...(, p);
> > >
> > > I didn't test that, but I guess that won't work. While you could argu=
e
> > > that p isn't a C-string but a pointer, I agree that the wording isn't
> > > optimal.
> > >
> > > So maybe make that:
> > >
> > >     ... the namespace as a string constant.
> >
> > ...a string literal.
>
> Gcc calls it "string constant":
> https://www.gnu.org/software/gnu-c-manual/gnu-c-manual.html#String-Consta=
nts
>
> My C book (https://www.amazon.de/dp/013089592X) also calls it "string
> constant".
>
> So I tend to keep that name as it seems to be the official term.


But, you do not call it a "C-string".

EXPORT_SYMBOL_NS() is expanded into assembly code.

See:
        .asciz ns


So, will you send v2 with "string constant" or "string literal"?
(I think either is fine.)



--=20
Best Regards
Masahiro Yamada
