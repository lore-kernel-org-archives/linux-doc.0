Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC2D38DC69
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087087; cv=pass; b=FiyaUhqRq604lUD5WsJLJ85Mlowj1Xgc45Je/d9OCsOXC9MSi73OUMDQ+q6BpvdADB+8rxgYZ9nwzHQ1KAUXKno+jhywXYlC9O8uvPXKsvB/POlL1Gad0GPfB7gBY7fedS+9ejeVlqFGMyW6ZasR7N7CxNtseq3O1JQW8BVYcPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087087; c=relaxed/simple;
	bh=aYeG3TvwCti6DUHhJVtNhHSU6TRfPUG21HK0z7VRJBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdJF5iuleuSVpT6yOGwuV0lmJJAAPu96j+qjeRlcW5fHe2/ApmvHeofU/kArDYneCv0mSntfJZnp3Eaa+l35tjBeYnM0l9+a8/iGN6K4TSpTtyNFw9RO8RKrou7vRsuPEmUO/MaPfYivAifMxH5ZN2XTHCpF8aH9cV4Buc0f9zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fh4RRbWx; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fh4RRbWx"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672ce86b21aso511383d50.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087085; cv=none;
        d=google.com; s=arc-20260327;
        b=eiwF+2QCwAswyI4e6nzkvpXrbhTZbPI+rNJMaCZHgVWyzlH9iJFyhtsQqLKm5appJW
         vnb4RzXMCunA86HZpmB3b6u8oI4fM9dpEln37/x7zHO8cdPEqy2/DyTJCE5oE99qNkWY
         LVptrj6M5EAjbxRFrekOMUAIRdoySxd5CThpLO/uYx2tSL8kKv2GAkCuyCn24IdTNUsV
         LGXEByltJJtUeuoIJbDkSOYL0p+ukRnlBv9QNKF58nODFSaG2cpzy6Ues1NWCGGebQ5b
         Dt8FqtRQfu/GN1el3Dyvy0pEQDIoeV+0E03n7w/THhIxCLdN3QclcIbniCTDtEp7rZJp
         ao5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pG5k92Op6QLpPwOb1OdXmxTCDLwjiDDGxMEx9C1NwdE=;
        fh=KxCLC5BCkIqRj95CS7oVTSAE7JFNzbnI3dojb58dhx8=;
        b=NK4gRwYPxRYIDaPj4E+iHa3G+sAWYBS0FAo6sDWmy5r+VfO3FGK/K307BMcgnpiSIp
         3LD4u9tqxZe2t1PF6x9B4LlL8cvtvSZWEvSezIZdsH4bROj9fpsZG73vkMSpoalzxe8s
         YNz0wEqic9QCYcScfc2BRHqqmTDzH/M4Rsz7XRFX7Ypg/au8xG0u/UMLc9CKGTt1GczD
         1MF/vKnVUocjr3leHVrbf5cHF0x5rI/J5YWgf5aMWjR38emj7rc8pI6nU84n6iND0GeH
         oJ7z3NGEkgTjOYO48tEAo95m2zBa5tkwn+K49dqPKeSoF6z719JMep/jCQ68KnEbNNKi
         6eJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087085; x=1790691885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pG5k92Op6QLpPwOb1OdXmxTCDLwjiDDGxMEx9C1NwdE=;
        b=Fh4RRbWxWXm173srDAMTj0FYH47rW5mA/PW/1dKJfpuixZRC1Xz+J/fYGauv6d4y3Q
         A5OILFL2pywrv83N61kPw2OuDPF3UrFcvkMLOssYyNfL14Tg8U20FZX2cnsPmoOORQhu
         nKtgCBazO7vk9j76OogZ9mlwgWvylqJdNtS6rn6LvPZkea49ApamU76Kj1dJaXkGXk/r
         CUFKMNxcNUgMFEhFNF78tvbutiZZlk0KY1VBOiTSZJSBpD9+purBaR4PNlwyuLYZeY3Q
         8n+2cC448AHhsEHqANFB+7J0YIDkD6HWCr2hkxVFoupX9Npx1uSR3U6eWcD29u/Fz0DM
         5Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087085; x=1790691885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pG5k92Op6QLpPwOb1OdXmxTCDLwjiDDGxMEx9C1NwdE=;
        b=FKppQ2fMn2daOxOcwf2P1df/0MGhXwVE/u91p9yCpIqVu9D5AHwZe0gqDUukQpbLAo
         VgGBO0pbxckGlqC1zqQWWTMbUYLExkS41P+mcx3bNAFw7egKT1TIkY/qx/7PoTVrENBH
         EfNPeKWvnKHZ4cNfyczTDGwXXp4TNZfihHvu7VBjdCtdZQM5H83X71ahmU+kImR0cHpG
         3XdHuN+rSg/L7tPy6s8bUbgAb/F4g5mYp6Yih3/ejbVGTd++VJ/Zcxj4gjLM35i6Wfc2
         f4qc54zMh5/vUJkW00VB7puaAYHiHBaAOeOvXliDfzPLIReRExJBf1pfotoKT+ex870n
         ucQg==
X-Forwarded-Encrypted: i=1; AKwUvBwsJ+Ss6+qQ8Y17UlImMIJsLBIKyLYVheV6Thke2rtyoGp3NYwQfdTmFj+MMCkf6kISrZUUQc6cgSY=@vger.kernel.org
X-Gm-Message-State: AFuF++m0veJ02mrIi+7Ee9/SECCkBfDXDzQKqXzotyFarEh+hYmQlaSM
	J2ptV8vf8g0JSCacLA+e3vT6FKMxK2S+z58r49IjDmb10mMeWAAl+EeKRy2x0bJe2W6AKhzw0Kd
	e0TU5uRDFdze9yGPoodHM8fKr7gHubKB9/MZpJgI=
X-Gm-Gg: AYBFou1cOpf7PXuIjaFgjjw1brOk5k2vnvsoxbNXGoUaFNk0WWuCfCtX1N7sjzrd/H1
	bLxcEXuP3ygjT4MiT/S/QW/EWFKJHEAxyG5VFB3ighcWD4j1atr2sqcuiCjBAWl+iG1jwRg7u4/
	aCoaK8r4giNh2uWbXO6dtMUDawyWwDcqX+X/P4DB2Y7ykr/5W+2CSURTboYPq0UNKoEMNTAZPi+
	MpOE4M6ddz7VCOntk2mcPpQM2cpC2lq7Dqmbbdle9KLpmmERSsTNLw5vmGqG0q5kPP7ULBcieNr
	JKHOOuItR3I3fy6ERTfTvbC8vAeGl4saw6Dakmg+u9VJ4roKW/HvfVgamWXouI8mHwHhC9jH562
	YggKPXhpwrrDRzVMr5gou1CHR4YA/Jo/igvN/0YPzUoYFmgZpO1osowmfDxVKU1En7U9uX0c+z9
	zEZP0=
X-Received: by 2002:a05:690e:4399:b0:672:99e0:ebfd with SMTP id
 956f58d0204a3-67299e0efc1mr2230921d50.149.1790087085189; Tue, 22 Sep 2026
 07:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918042835.156030-1-lucasadramalho@gmail.com>
In-Reply-To: <20260918042835.156030-1-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 22 Sep 2026 11:24:33 -0300
X-Gm-Features: AcwNN1UDCd9pJF-zNSIhDzl0RLyxNuW0CxJ41yZspJK_ynX0yqYCCaJogYj0QE8
Message-ID: <CAMAsx6fv6Uw+QsYdHcS0yddB5VOqYbeBjV78-RuyBez1nUV4fA@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add debugging index
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 18 de set. de 2026 =C3=A0s 01:28, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Add a Brazilian Portuguese index for process/debugging, mirroring the
> section layout of the original. No debugging documents have been
> translated yet, so every entry is listed under a Todolist marker
> instead of a toctree.
>
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../pt_BR/process/debugging/index.rst         | 73 +++++++++++++++++++
>  .../translations/pt_BR/process/index.rst      |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/debugging/in=
dex.rst
>
Thanks, Lucas. The translation looks good to me.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
