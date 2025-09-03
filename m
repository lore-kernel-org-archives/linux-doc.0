Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A813A258
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912983; cv=none; b=Flm3TWz69MVd/16Ho1sNVmZ+j8oB7+BEY2GaTy9+89C3ppC9V+ZCNgcvFyQT2qNgmzL1ERtJ8uNhFuYQeTk9ZLp7NH3Ha+EUA5nq3ykqMHIV94xJv90XmpaiUDIdUK23XTGlWEQjXhWKsL8PHthcrGX8wt78F7uxLE/gJ41zrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912983; c=relaxed/simple;
	bh=DRqRsdGI2QjzNoSdniWIsQFCTY4AzQlVFo68JVENFAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NodURP8gHsr+7Vg73cE+LNoIrzoqHXUeDM5xyzh7c9C6zntlWlReOiEj6KQ5cwHcfc8C9keonO+CT7i/e1/KH/SoZ49zlxmS6/aIlWh4paC7V9937UEORsgn4E1Go2+SXoBm6r9okpLrfHSXvpuAV3APdcxp8WGno+Jdl8yQ7t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECQLL7nO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECQLL7nO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24cb6c57a16so64755ad.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Sep 2025 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756912981; x=1757517781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRqRsdGI2QjzNoSdniWIsQFCTY4AzQlVFo68JVENFAU=;
        b=ECQLL7nOHKL6AgzP57fp+Du09qVWga4sTKkkdBx9FIX8bqfd/iB3DPGlyFotw0nkdT
         UX/u2+L3QEdgiL9huIxpRoNuDvHFCuQzmANvnAsMiBFwtUgb86UmdyzS+Su9Tiu8MAWz
         jMy4Ii/RSkS85L90s3FLZy2TauZJvi9mDI37/uRHbORA3XHuNL8/fu94irfYVG//KPdd
         bG9ASEfdVpU769VhbXgwyEkrRiqbYBU5ZPLDiI3M9CP55hUZZo5hzT9qryWRTz13J/5C
         DjyEngPINtM52lHAMM4bkwTcT74r0qCntVwG7bwsQUhaXYQW0kQnHUz1yZDKXhy7nW9+
         7uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912981; x=1757517781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRqRsdGI2QjzNoSdniWIsQFCTY4AzQlVFo68JVENFAU=;
        b=XrfPJF9tGLFbDcE8YNdS+vcRuQFIrFLMVtEd51ICSwzqEZTGGRmqkVnTXQmVaKUInB
         ggb5l5/T5IcUgF1xkAYOm+SCl8w4vawTiMCEF23G8p9ju1wNl/56MeImCT+tzttsUsAe
         p3t7HHGtr7IL5XIEX+WKdCBRqX9gbbfs6UPnMcVd2dBU3Zr41geF5NV8+kKZtbIDydCQ
         43FUQqZv+MQc8KztDBFI7wDpv/XSxDcViU2s/Vmj07GgU4IfHuHvvSHExCDLpYZz7xgO
         VX9VmwT4bsNA+AMFmPPNXyzWkne7iXx3xM7Eb3GR+uf1o74J7Whur3PkQ3jNie20qS+z
         Dnig==
X-Forwarded-Encrypted: i=1; AJvYcCWhA+kQzD6ZtlGCWzoavPIjz0AnqLZvk5VajGwAxxZooZy3aXd7v+oyk2qONUizUg91sao6WKvs+ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcfXBL0rof038ZojnxG42jy9T03AYfRu9laijve9QNlfBKwpV
	fCWQK2FeQiTBhVydV8V2jdyu0FEFC/WSHZSdueDkJ5lwa4t96ud6rPiQKsJJCyumNxnheQpmJLJ
	zf9+75stqFxziHDZbn72pOQ3ubI53Lyg=
X-Gm-Gg: ASbGncvx7n4NM4fP95/UC2u4sdT7ok3W8YlLCNbVOhwsDMr7aATBCnQIx14cVpmxyQY
	lnSo3LJSSGF7Df4hIj4ZHLfjvLYrhOzbKYRnN1SKSrC9Pzy4DueUAoUbs1wiG8J4tqKCHP0tllO
	QBaGCxzxnb5tojheL/GOGOrJxj34vpm+yfJOsLmo3pYnLbYXR/hfr2CGNtCkL7PDm+b0SJTgBea
	xrOKifyYVu7Jka0BDQ2DW9K3b6e20N+oBVCapCds+CkKFUXX3uXIzAtmZ3GK1A4mCZ7Clf/3/aF
	rUNKH9OwHcFDp0P8FQud07SUx36/k1krgFUf
X-Google-Smtp-Source: AGHT+IHFm3/iQmvZ1V0Eu9tc93BSM8sUYNm54UaZC5/CwbnsV+UENfgNLgusC84WuZFBviqKy8wjw9fxH1dS32ySotM=
X-Received: by 2002:a17:903:1d1:b0:248:cd0b:343a with SMTP id
 d9443c01a7336-2491e0f807cmr140414145ad.2.1756912981211; Wed, 03 Sep 2025
 08:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net> <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan> <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw> <20250903150729.GP3648@pendragon.ideasonboard.com>
In-Reply-To: <20250903150729.GP3648@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Sep 2025 17:22:48 +0200
X-Gm-Features: Ac12FXwN_tZXKtfRO7KZPDHRbedpKbASLbs-zNL0mjsFMzURym4LNhE7qF7tiUM
Message-ID: <CANiq72kQGPciacU6hMz5ePxafy9hk9yL7nPf7s-4RJ7vJBB=Lg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	ksummit@lists.linux.dev, Linux Documentation <linux-doc@vger.kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 5:07=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> If you really insist you could print a message telling
> the user there's another Python version on their system that may work,

There is also precedent for this in the kernel already, e.g. for Rust,
we do the warning thing (or error) depending on what we versions we
find etc.

The user is the one expected to fix the call to `make` and/or fix
their environment if needed.

Cheers,
Miguel
