Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055939A80E
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409684; cv=pass; b=JkDoFGtKVfP5ivCyy08oyR7FDvS34tvU++P8UxzTvya99LCsRRKRO0XPz8t9bgnMZ2z2E5QmeJFDqFy7S7SIhqLGghVpdwtKIWfaSNAoPDqWncnRa2Jn+BFE51RpbrTKhiwPP0JR/niDRF9xLWSYPxZxrceJE4Y7CVbqRHkvD1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409684; c=relaxed/simple;
	bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWmYaZO23LcCsAmFeoehsFAVqu/b5vPxX1HeHtDgpz9YtZhZMkUwnt8wOifNbZwNDcwUruRwUPP51s6aqOOMh6H/pNmgegftxuTo5NVDZ9Hu76CQvkRjZDSAXXjtXc1f9cfXQpXPFntMzdiWA/3nhhv2W0iYac8yPeg/5Siw1Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXEATy8n; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXEATy8n"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9697a691b5fso1113120241.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 00:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783409682; cv=none;
        d=google.com; s=arc-20260327;
        b=NnGlz9yamxdbKqZ3eL4Il+whVmOFWppCSlP4JShxjBzI62hMvUYr+wBkU90xvhktrq
         I+1OCjgHkoshqBW5qgM6DeQmAkv3J1TQmleMmmtxUW+0SBkciH44NzYQ40ORlPQHd+13
         jZ32isst//BNWXE76P266BYhmXUVQTVE3SkUZFoYlaSRMJmRLWl4BnrgDaMAQKmLyGCY
         AF3hxEl1SbYafaA+XeNOI5qa89OaL/ycHucaI9pOAHYxCMs3f6ML6R2vy7+kysbvzgr/
         B2oLfHMLupXHp5CKySllh3wE7nbIC2Zn9Ww/1imIvJai2y7qfjoLx5cbIucjpVms5nkj
         Y2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
        fh=kWv/fvXDWjav9B6z0MKi8mSFr9FSGy//k9sCwOhz0eQ=;
        b=PGfw/V+l1EX2p4KTFOFN+RH5yYcACx28WHNWlkVWBXO739SSrx7sTZksXYrxyfOomJ
         BQMuU2gZSV6Ej+4Gh7JFETEtYNxA26rlI+Y8+NNm+RitFE0rbsXBM+NFX4JErPNYjHIi
         8kjk53gVkcXb1/l5xpRb5YeWMJQw9MiGmvki6+3uxWltO7fHpMtQMLe3wB5Om0R/uvVO
         QzZ4CPAdq3q40oMJWcazgVgbnE8nDZC3Bmy2ztu8TTSxu/aZ6+qGRkT6Uio61G2OdWbX
         N1E/7HCWwxC73OCjIerbHjKb8nJKr5pzjHt8YEqLJ345kcOIePUfPpHPXDfewb/GSJPC
         xuUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783409682; x=1784014482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
        b=WXEATy8n5nmiIkjbUALQJu8NTgAUfw9rkLHmCJ+sqwbx8v43mUf41mGwNqI3ww1eIv
         f+rURbCv130QBmHDJg6KtHqvtxpiRWmAECNO0qYpNmQnrmq38ILD5YBNSz+vdN5+ttP1
         9PkVDAyrgnz0MWaA7+gpjWYPlMjnnGK1IoCEg2a6HCXch+b06GCrh9uQbldo5StNKYnJ
         b4ccr+TNLDhQLkOUCEb7M0RomImvbt3IqFOAuOWVJR0nlUw4diPYgeeQrBWBEdaf+wtb
         BgxK1Sati1M3SOj+cks0BpoJwQEXoK516ESHN7WMana9mTTxjl4qp77/zXMNc5/uglob
         dRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409682; x=1784014482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
        b=R1E+vW7t4nviZ1EUTzx8PEioU9nPkVDB7klwGJjpnW+n9i5LOTB3CfBVcmWKkcCjzZ
         cfa3zDAPBrAJWSItXiWbKoGFa14O14sTwBr1BS29YvDv2DlZrm/XQx4psf2954T3IRYK
         GLzmSNo1DXsgP/ph3qF+Q7aqpbKIkPK+6LVFFbM+9DPcB68NDVoQgrErVKuMRA4P0YnF
         ns9uGv2kHWQ2owO+putoeQ8O2TGSO2FxsYSxy0FU0R2KVY0lZ1kbE8vGMNQ4rUpVuXmN
         Eu4ZyJai+LjaSPtIdkA/iNzCWWtNR9F0ZhA+VallJdvYOGLDmQ9GLU+O8rc4gfCIQf3K
         6PLw==
X-Forwarded-Encrypted: i=1; AHgh+RouSDiexWpDB2WNUmkg8kvU2XJElUIl7Z5NYC75vSYHpRRsCQEyWwqq4CXBSMIEAqLMmA1cpUeKwRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1WFeYD3X8d5UL0Qk1F26KcxmxrBNpMp+CzBdVkET7UFW51+Y2
	624pzoosKhZxzyIA9P13vSiqinKbeRWWK9O2YHhYQ6ofiwKjtosSEfp39iJU5OU2mSn5yLe0uER
	8MXjY+NCeJ928GL0yHFMiJHjfAARzDZM=
X-Gm-Gg: AfdE7cmViG2GQ+76fHbBpBLThiKiFPvMTVe90Cn4Fp9kLlvhBd070C3JL4IM3U1V72B
	S4+zEDoKsWhkM23zP8qqxbA6AHrlR/IPdo87wTSadE9TEwhn6MSYU9VLRHfPzyGwrZKg9IHxFmO
	T76SXz7rW/21GnX6FFXp1m3VAr+jneaYp13uPz27sxj/l6KW+Q/dsynnMOJ/zTpisMZN2BaB5Dt
	9x368i1HXU0lh9e3FnaS2J4zMt2vCoo/CMl4gnaAMD5AFYLsVjlpVzAcNp80n5cm4hXwu8ID7Wz
	mzcR0TjRCYMa+TJRXxUxuUDu9D8Ig1gYRzWOBz97wOsKLgxry1wELw==
X-Received: by 2002:a05:6102:3e2a:b0:738:bd0b:7560 with SMTP id
 ada2fe7eead31-744b7deb7cemr2332001137.23.1783409681711; Tue, 07 Jul 2026
 00:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706181429.264791-3-manuelebner@mailbox.org>
In-Reply-To: <20260706181429.264791-3-manuelebner@mailbox.org>
From: Yehezkel Bernat <yehezkelshb@gmail.com>
Date: Tue, 7 Jul 2026 10:34:23 +0300
X-Gm-Features: AVVi8Ce3oNTa_0Utv4RmJYoO1RWlSx8qCKfj9t6STEcdzl3r6UbwMGHukNJ09HE
Message-ID: <CA+CmpXtP1QuiQ7ZJXW=ceC0+Qidmc6kYwTfRmc6L4nDma_zn1A@mail.gmail.com>
Subject: Re: [PATCH] docs: admin-guide: thunderbolt: fix sentence structure
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajmohan Mani <rajmohan.mani@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 9:25=E2=80=AFPM Manuel Ebner <manuelebner@mailbox.or=
g> wrote:
>
> Replace ')' with ',' and add 'is' to sentence.

s/is/in/
