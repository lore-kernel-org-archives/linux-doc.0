Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392227A907
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 23:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783554053; cv=pass; b=B/vmHuq9gL/3XzMId3fYKtNjRCNA6dS+SiA7mvDuIwboBlujpaaUkqoeD15FmDfDL1ewBIxDwRUAY3qh5T5hWV//Nyica593eGEn45KiV9t5pR/3mRea+7oabd1N9S3wYrq8DUBn0su8tw8CBTYLmy0y4bvVF4yFuvR3ZOb96W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783554053; c=relaxed/simple;
	bh=aWtLtj4iRp90NZJB2jStosr1Mlq1Yx4ltH+17ZTnNKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keYEMZAiS4jlROsKEs5jGpICNz72I915jgiaxqGNbPEkn9TUo5PhxL7QupAFwIeClQjzGfC1KjBT7UBtBeFf43fWkyJhIvk8y8JGrpBo/YJmU6waxhF4h3GWICSDzYfebYDbuHuh8zt8HKciiZnOf3hQhBQw4ogOyIOgGU+6eZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrv+5U6D; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrv+5U6D"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8efbafa1bacso9076296d6.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 16:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783554052; cv=none;
        d=google.com; s=arc-20260327;
        b=ad5IRiarZckjZPko+17v7gkvKDmDa5PW6+pRWm27JqY8QicLIh4Dkq1aZ+F3QO7HGz
         uOxxYHBfCHKn7zL2/br8AkyGTAC69woUig+HzysD5W3KMTv5aOs947VRKIv4ZE9CIRz5
         5MjuCtmB3QpRe/R1Z7v5kklHhcpNCt7ZUvUltjaofqp/RVT5cDpk4QfsdQg/YeZMiTca
         LEfyysHMvMCHhPJFsEL1MHxrh9RKrqQpUohQLgT66i05Q4FAj31o9sW9/McvlHhIHqm1
         uUCJLeOoZu13+MxTfndz6aIgwgdTaV05Jf+QdCKW3Gv/FsS4HnMmN9wmSpHtuN5D9aCZ
         zeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aWtLtj4iRp90NZJB2jStosr1Mlq1Yx4ltH+17ZTnNKA=;
        fh=nSU9rmRBPnErh/cfMrt9smGRLPrN9S4kzz3toct2N+4=;
        b=BhAVpLQAhyqD8Vc2jf5nDckGOLsYwsBNSbxp2kFkd4lxQgBC1GhgDNQm8uNI0nefoT
         EZqr2ngBkEKf+qVoCy8922u1jfNOq7gVi0/fngyYXR70lDqC6CfLQPZsbZzbfmjJ3raA
         07LN2WvS5pAGJPmuA216iKk4QxK/k/YFokv1I1Y16rv4c7uyXSgSL8KrqJ4T7OoEd0Af
         WjyRTH3vuJ7yUvpkvd6I9oTRBc3JmSCqsaF+HjteZVhHK9s5VuPqCQ7WKElS2E4gJ6mY
         NeBH0weZEF9S6xopRlXwrKp/iaUGnk87fcexnZ+iZU2adrTghFBVBmHNKrDVYQAvM3Yi
         9wUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783554052; x=1784158852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aWtLtj4iRp90NZJB2jStosr1Mlq1Yx4ltH+17ZTnNKA=;
        b=jrv+5U6DWA6aoC0XuFkvJvnipLN/QO43fbHIklwDX3fzQePzwejEulurjsj4ZTE9qK
         MlZE97yveNEgYuFEsubBRmcT4EIstttqCpGL5FO4eN39UH9p/GzdZJFueed/I+xmYmMP
         GFil4vngROKeGqfwfBPQXuA9QrGvRXUYDIw+HHBOHPdi96O9gBFVfBs28zO0C8aMP2j7
         JP3omZGJzeAvMTZSLxuGHfMngtT4oUb7JyAVBoy6SncUdN7/DP7oZkq0/bOkTccElv75
         w6eKdmH46N/eNIe4sEDSM4J888MP8hcg2qmxMtvJ6wRMDCcRibZgYOVB4m1vmzWcQTJ6
         7Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783554052; x=1784158852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWtLtj4iRp90NZJB2jStosr1Mlq1Yx4ltH+17ZTnNKA=;
        b=d/Iko2kmCIWgPN3FHqUydIV6vE/GK/Qu79DX8LQBQzKZJE5L0h2pe2g9z32N2E6Wj9
         GThTPSRkAoQP7c+6F9EIdDtjhE/ItmKn5HbBnTStk+eMTUMpzSMrBS8bf6HjNL+T6dFR
         PjXBv3bK896BdIPpJGKslYzBRixMeym6W7tWsgecRCGNs5aHorUISViXwJMCgBX53vGp
         y52/wUsPm43LIACddBhVhCMSAj1/UTT/ReUZIPlzBvFLOUMymjxJ2WX/+uU/ty2CBbni
         E6Z+E4L/A69uxHqPqgdjNVa/szVBbBpKLzaj4ayhvwHNQnBFiWDZVXccMXXts5y+uQJk
         1A7w==
X-Gm-Message-State: AOJu0YwZ873Ax6TqQgreyyYRcwPfp2LJl3oAm/VPDC7nEg5mfU7eeZ1D
	7CPBtcADoil2vGs1PZ14yodJQ1LY9kR+1xwmACc1i5YDrzHC7QV/W+BoGYsMxYClNZ8JpTO2Wvk
	WV43BsI/cB/6w9VCRrlGo6D0Pa5RphpE7LHO84HI=
X-Gm-Gg: AfdE7clPGacEjf33nJGuvyF5rVXIM+2iSohRzQ+JIJxwPLPpT1++ieKur7Ix/8GSbD+
	sc3pUPcd/gPjPFrXvI1xijYqR65OeqoRC/e3GA+ArRot+Mk94SbPmlaHbXf/DTTkmF0duk/sz6p
	qPZEdX8mLemxsNa82mtZoJeKrYqKzObVbpl3s+xlcE3o9R/AtkgS0v7cfN3ZPmZwhM0tNYNTNIr
	c3UpQS3bs+pTRjGdPvIpXhlu6SZT/HH4OJTZswMzsnU3iNxmQw5R8btJ9rfMOLWTjsmWw3t3kOe
	qxMbx+aJz3u9/BG0/lPyT4J9UIUdfqgH5/lLZeLpJ8P5ASaGoGQSsSJhNi1iSY/tMuPn2SlDd8/
	phWuknt+N4N8=
X-Received: by 2002:a05:6214:2344:b0:8ea:184f:c15a with SMTP id
 6a1803df08f44-8fec1d7887bmr51017886d6.17.1783554051454; Wed, 08 Jul 2026
 16:40:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706174905.34552-1-matheuslinuxdeb@gmail.com>
In-Reply-To: <20260706174905.34552-1-matheuslinuxdeb@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 8 Jul 2026 20:40:39 -0300
X-Gm-Features: AUfX_mwsc14iuvAqdZGdq4NUB0wK_a8_yMc6JV--Q8PLthENF0SuEHgX_KadFnE
Message-ID: <CAMAsx6cQkozV2f9eix7fsrXH5EG041OSp4+8OrXdGbOpDEik4A@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: process: Translate stable kernel rules guide
To: Matheus Patriota <matheuslinuxdeb@gmail.com>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 6 de jul. de 2026 =C3=A0s 14:49, Matheus Patriota
<matheuslinuxdeb@gmail.com> escreveu:
>
> +.. SPDX-License-Identifier: GPL-2.0
> +.. _stable_kernel_rules:

his `_stable_kernel_rules` label will cause a conflict because it
already exists in the original document.
Please either rename it to `_pt_BR_stable_kernel_rules` or remove it
entirely. I've been dropping these labels
in the current translations, so feel free to just remove it.

> +Tudo o que voc=C3=AA sempre quis saber sobre as vers=C3=B5es -stable do =
Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Regras sobre que tipos de patches s=C3=A3o aceitos =E2=80=94 e quais n=
=C3=A3o s=C3=A3o =E2=80=94 na =C3=A1rvore
> +"-stable":

Regarding this line:
> +Regras sobre que tipos de patches s=C3=A3o aceitos =E2=80=94 e quais n=
=C3=A3o s=C3=A3o =E2=80=94 na =C3=A1rvore
Why so many dashes ("=E2=80=94") here? It would be better to remove them to
make the sentence flow more naturally.
You could replace them with commas or parentheses, for example:
"...s=C3=A3o aceitos, e quais n=C3=A3o s=C3=A3o, na =C3=A1rvore".


> +- As filas de patches, tanto para vers=C3=B5es conclu=C3=ADdasamp; quant=
o para vers=C3=B5es

Just to confirm, wasn't "conclu=C3=ADdasamp;" a typo here?. It should
probably just be "conclu=C3=ADdas".
