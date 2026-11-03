Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793674781;
	b=Uwmtt4ZttaX1vYlLZRgkezWrBtofSa2h8IEbBQDT/1+ibIrP6V52O+uH8aRPr15TMroq
	 LymqcinBpG8I+Hf+4yxSuFz6r1gkK+ouannilQ+4jkkmW57bunBGJ/LJ224sLpkjFct9f
	 xXhc326DqVp0YBbI24AB5REIFU4Yeu5HLg60hd+8fpb0xqlwy+8XKfBMQefNjVaE1cWaK
	 i+sWXD3HwY92aTT7l15lTcAOerDZxtQIuCrGDGzUOl+qiaQsLS/PTBYJOCtn6HPJ1GVzZ
	 lHrvAynwL2laUeAALKYVWon1hxBgWsnWF62ykUcOAfBRglSbR32fMNSyCKjmW9xMMVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
	b=O/mNfcz09HlHqcaH4XstdnQ3M6W9tKiUvDR4rEMU/suAj+d0Irkn92g0lB8mxflkEMuM
	 YDRNKLDUVb5u//3gEFYJmAMEYGmF9P8ANnG4l5o2SUMs5EGc/nGGnlzI0SJi74sGS6dvg
	 XvEDX8JCphZsEVB3kt9utPgx9axOAUyME/YUOMoPBhCZsARPeov9Bn6ToQhIND+DW0SPq
	 nxkdtjrhKZ9dVrhCL4pH4hoUMDAgxlD/h/wEA26cPNXen2swBlmNnh8FvO9wX2/VSkt1c
	 MFf/YmAh3Ct2kiVwe2AIMVSWD6L35X7VtBGXOO+hUtyZLhhvxl3vn43/Oxjv9funh1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxfVsNTi;
	arc=fail smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04842606A326
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04842606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxfVsNTi
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-945ae2daa66so190762685a.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674780; cv=none;
        d=google.com; s=arc-20260327;
        b=rzLCNr8z32p3JQerupSLkxIUU1FclCSZN0KZGtGeBmwrlL0WAg+YusBNHb5mTVhG/W
         /3SRpXvPIMy3VJNubaMYLRWd0E6Kb2TpaYv/bYek5cj5umETimlGc4olCR8PaScbVtMJ
         Uro6BTNelp74oe8ECv4D0JxHfLneJBwcLWNoFC0GgyBq32eFbbbDU124SyRE5azjGigm
         c2W+yqCBGD+ZmM42C40IC2S4P080Zr8sgroUcMKmNP3U+igZWHWdIxICtxdNsHfp5Ui/
         PTSiLhwscuRcM7ydYF9LkEfp2GD0ayM7mgQAmyAx4DgyKQ5PcBQCk4f3ca7njNbthDFY
         SfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
        fh=UpB3aOixqy07PR5vjDco8M9lm+zM8E58si46F5dVP/A=;
        b=i6EzgpHC+TYN/UzB1RPfqmZsBcdHYxCKqnaRmgvOIMN5R4h7zqp8hl72WOytEwkJOk
         vrXtOXdk/p4RBbDx2nRIlPEAomO9mRmLgldrl+jVTG0V9PmOMHy6JEMfTeKzHxJwRgql
         Tr7wdfFUwqJmXjF7+9BsGTl+59gW9wVxJaJRvmQYGVc8tR9W9nksOgjlK3yrYR+DoJsv
         73r38FrRztF2Geula4AeKFoKMPX0y0N9FSIEvzG8LM0EfLdboEcFseqt/BoQMLYcGpHE
         KCrSaTUhY7g2jdkCHcsVzrkuB0BncNCuCbyEY9HRD/0ME+mwbW98uRYJvRArLr+uCqxu
         Hy7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674780; x=1794279580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
        b=hxfVsNTidTjsBGtP6601CST1oHitZN2nus7W9dblSW/c82gBLKVzny1zTKlxjdlj9/
         m8N2iJc2oJI4l1LFRNbTR2KScqiO5Lzr7fHU1uye+r7vVy2rDY7MDFMuEALSXmvt2X4V
         NXi15GhQeCfqvQr51CSoXuegUit+9hns7fE1lNw+2ywywWNCtqHBtwvKIN2wc0YJJZHG
         9J5N+o15i5nLIJpgXcqTzgSVfeRPWaOBYEU2lS3U1zjlnRiEfThGOvo/OTDOW9IpLyET
         q/xzhOUlDcyjSboZiEcnBTdIGduxNWOllpYVqJ+wA90DPFwm1MePufmhpYjhGt3FuRGn
         eCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674780; x=1794279580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
        b=J+45pzR3nC+xi0Dva50Xdb+pFK89ZkmnjvWdU895JDJVUmd8ReeIZwShLRoSuuMNbf
         HolGmPhZPXR/Xh1sb/rV5QaLu0se+mAuuR1R9lH8j9wSPgG00OyxPDndlwV5JGkie0xO
         KwwV2ciThPP8SiVAMhBflXIk1K5si5Hl9t9+P79s716BeZysiFRzQUyWkFiAEYIbXcEq
         a1Sb5V8N+Nh857W1o7zklzXFNACM/jjh4gjRFXK4MCO4RCFqbwEptXyb2cHiXgVRqR0t
         hriWqET04YSyLyLeIaabfcZsKOddCenR1QZ3jNiNqJBOF1WENeAta8UBVLh9pFFXZnU0
         jqHA==
X-Gm-Message-State: AFq9FYI2TTFy536CZYtIMbmWO/FqUhNJe4pO/eW3XvTaj43+Cr6dEXRV
	6l+Ppao1F1qW/VKkH7/XTjfKC3LekvrdfwHCQYAreN4Rrzzsw1h1ngATr1msCnZiBN3o12KDamB
	jkSBtqLCLfqvWjZHL2nCb32C9fCK8H0A=
X-Gm-Gg: AYBFou2JHKBxi4+j1Htv3404PN02SHf7IQWhLWpMC5D7J9Zo+2qrtOG09UUKWHYEDef
	XJo4OKm0ugm5s/7W/IcLLR9N3y0u65/WlRoCcAETrek/PzO94+I7YWT8W64mpNRdNnWnS/1yvyg
	f1OK8yn3JFcOaV6hp86IYYKlvkg/3l99jKo8LQ67JPva/TXfY50liIUnuw8HjRzM38ef0laYRqf
	iupdzr/ChdqZkPHkpmgsJRn3r3uHf5PpsTwMPdB7px1PnrtJat9SOGUtE70GbAhcR1Vbo7RfOoj
	+LlhY9UK9LyiIwgy/QCs5CrRsbOwfz3l1fPC9w50fl3ICn0/j1/m6aIXL9agZ+9grLNt0c05s3c
	83J6yCX4Q0QT2D8bXpK9RSTATjpmQYD3oBDW1zy6DpdZtYANPYfnq1P7H6l80pC3Hr7erftLKMp
	wQ8W/wVH9to1vfSkCFDvT3MgKL1bvLWkT8XQUJzavc9Y1i9FlEVc8zy7N5dY/lWfQ/3j7dNUQhj
	GCzmfk28whjSCgPFaA3LSUEWg==
X-Received: by 2002:a05:620a:6845:b0:93e:c12c:9b6f with SMTP id
 af79cd13be357-944217f95e1mr1933054885a.74.1793674779845; Mon, 02 Nov 2026
 18:59:39 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031143216.70219-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261031143216.70219-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:59:28 -0300
X-Gm-Features: AclHuK8h87ta7bqm7ozuVZ0AIAHgpaG1kuMoeC0yrlnTQ5hMVApU96qRCBz3KkI
Message-ID: <CAMAsx6cYSKDhNeOcvQVfiPestU+F44u2yXd3JDhTnLCX3fp-ZA@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add init troubleshooting guide
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 11:32 AM, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> wrote:
>
Hi Gabriel,

The commit message has no body. Could you add one?

> +2) **O bin=C3=A1rio init n=C3=A3o existe no sistema de arquivos raiz**: =
Certifique-se de
> + que o tipo do sistema de arquivos raiz est=C3=A1 correto (e de que o pa=
r=C3=A2metro
> + do kernel ``root=3D`` aponta para a parti=C3=A7=C3=A3o correta) e de qu=
e os drivers
> + necess=C3=A1rios =E2=80=94 como os de hardware de armazenamento (por ex=
emplo, SCSI ou
> + USB!) e os de sistema de arquivos (ext3, jffs2 etc.) =E2=80=94 s=C3=A3o=
 compilados no

The original has no dashes here, only commas and parentheses.

> +carregar o bin=C3=A1rio init =C3=A9 uma etapa de transi=C3=A7=C3=A3o CR=
=C3=8DTICA e dif=C3=ADcil, que deve ser
> +t=C3=A3o tranquila quanto poss=C3=ADvel); em seguida, envie um patch =C3=
=A0 LKML.

"painless" became "tranquila", which reads a bit loose. Maybe "o mais
simples poss=C3=ADvel"?

Thanks,
Daniel
