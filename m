Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E838239D
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053905; cv=pass; b=DpnpjLZ9Hl+t8HIPxrh/i8M8eIIo/SpfiWO8qNEkl+TvocdnD0AzT9nckWplD02/2tMGhxL9aH8OvPHPF2AOdtZSWauzxog43rPC0j33GOow9eHD/hh89vLNszSIFxqhhUTz8dYGC/Ozy00Q4e2asRbHCxDaA4e8Od7aoEutdEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053905; c=relaxed/simple;
	bh=bOQl++HQp38ecokFc6DKNKy+x3lAP5zWzCNZdfvs83Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfYBS37bpEnDzCmB9iVuixQQ3Ur5+fUpO1YyOaq7NVS3dXoGz61lufMHVbw2wRB49b4mC2GOlGH+wQu4Zn9v8/L4QRPVYN3gJ4/yP4XVOaHTkvSM/G3oVztuhgCcOZPSA0Il72/IJ0UdearzfU0ObTYp7wByGYwesqyyVN0c6Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cn/yJCMb; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cn/yJCMb"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7855bfd6ab6so2200777137.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 08:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789053902; cv=none;
        d=google.com; s=arc-20260327;
        b=eW5nO5D+5aFiw6n4iBQzsHnVh9xNIIu62cuojIKoNhHIdGSDyfzIKJuhvHGLAt9Nfl
         Xc425ldyY3Smxp69mxBHbVvuqZ7ixxLuC/eKXV2IHzPp7VjA/4x1cKUhtBEY1zSy0+pw
         V2y45GU6+Ivu+B7A8pHjGA5BbV4G2avdThQTxEi5pN6QAhFdETtpR0ODej4yd2uXbm/A
         49d8d5nGeLRO3e9ze7ysTNCDmfWZ+VXUNCQbQPWC6S+ue+qPezkbkACI6qtjjTJeMpFy
         Leqkmui+0RCnb3aIgOUHqM+Og6mXMs28ZUtcMpJ5H6sXMHeAdZhnzivgqmMDAtb8g5ju
         wI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJtAvom7TmuKLxSMog7d2kQ4do95d+Yb5DU+2shbOfU=;
        fh=ed+5m1HG+SLW4j3djLPAadBui8HWri8tn/SQofCirZw=;
        b=q+weSwb/MYrtCGAwKV9dMrOwBCatZ1V6F6gTMSB/3jzyOi0pV5FvqnFkcietRmX35L
         +f6DzoLRzH8FD6XFCIUNL3XlLH+11OLgmsvce96pymFLpvjSH6R2m+mYqYyWuRyNfL1U
         iWi+KbMErkY4Ces43g/yzT8l0+A+5ofJ3RHh27JYeffe4HqYpiRTxHEmtADNQXsTMOzR
         2LGIIxG9x5K2Y9fZMNgyHeWzztT3Vogtg7amd9XFSN9r0rY54XLH5Z/HSi03vFYzvJ23
         ctab2lPcczTW5c5ln7rygyJ/UrgJCK9S4xZ/ihHXT4SH+rti+FbJZ+kXLe8OOndcDBhk
         O2qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053902; x=1789658702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJtAvom7TmuKLxSMog7d2kQ4do95d+Yb5DU+2shbOfU=;
        b=Cn/yJCMbocTJjB6xv4kScaBFDV2f2HxFL/OGyCUDrqr5pUeRYSpjt9Kg3rd/wtQitd
         8s8mkxRB4QQb9Wc4jFIIrKnQQP7yHiPC3AGCsGhLy6pA8MyyMHjMgns5H6IMxPstxzs2
         bAQfT13UCgVWsP6wv/74I6xsyIAkXbN9FsBMJLt0r/WuvyrXaIc9EKieA0kUoa8ekU/6
         jvOuGeR7Wg8EqP0G+wWUWU6lIVNrbcdjijAg5+y+pvGjih6zsFz8Vihi4yr2QbT8ZNii
         l9SMDyzZwOQ7FKbPqKZLc/dPNxJPmiUeJ5UMqFyMbXX0BVD+4nYAQ9KeyYnGJU1OWtFW
         iLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053902; x=1789658702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJtAvom7TmuKLxSMog7d2kQ4do95d+Yb5DU+2shbOfU=;
        b=VcoNufHVncECvQXuMMIU+HWmasnSUkPZNPXyISyUzG0SExSE+Ta5uV4hKZw4n5ltFI
         KfK5pK801vsjXv63ARw8bmDQ27vmHKVKOW6aT/mpn8NojNCuNI247DUYDnYD8ZuiZ/w0
         HswxgDWX0JNEhKWfV+4ZSFFtNkBv3/uYzMrV+qpgtLSThYXjyR6+GQzfLLpE2rMoyC5z
         P751/m5jGaE+CIrAjIzng+NxCJAa5zS2mQdyY+iVrkQp3iPcHvV+KoxWvghsuMh9GuJb
         je2i+hkpMjfCG3bJhXjKCq9ccqQHoo7dIKgOHmT+7ehbppcXdCHLF2Kxs2drFMS/ST5c
         sYQA==
X-Forwarded-Encrypted: i=1; AKwUvBypdGM8JdIbyfAazypOTbN1oBaxWyl664tbfbr7lePEZOK4ACfPCA7Fd7J50c+CK7Dxsa8UHFOGWvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n6yGpCrZVILb4nqJJ2ORYrhUI67gjsfWO3cg+zj8nyq8CYn7Iw
	JKOlf40udokmtFwSCRKp8QEnh57k7mAUID4+ACbaojtzIM96VXgaN7rpxRuFFhN8KTEfwiQ701R
	b7NafOubCqVz5F7SVI2/zVze1dudHH9E=
X-Gm-Gg: AYBFou2Kl3VK4/lNMgIEz8SPDHzXp9GduGXJZxEKf/UCOw7pYbdkx2WJ+eIbePXmr+s
	RZDuM+fkRo1e2tuHki9JYMd2+BhXUudBYUUr4LpX4PwdkGS9k6+YnDtfb4cAdMMvN4SFUAWeBHH
	tFhyJ3JRyajySgEwLTPbppFGEheaVNz5mZpTe/T6ImjrlqW/UWe/sCLhiygWAe7SGYQjK/8GXa3
	ORkYKbstWX6qNukrlCwDdTPEVR/YRzFaA4lppvXWgXBNUxTSetxKHkyLFSIekP5A2IKcdM+oV7+
	IposLHyF1To8OUqmS7U9TM5yWFSCuSwymlu+E3vhFe36Qv3LUm130VVubG9gjkp6WGG9lGFKCbw
	3hK2QjaFIFa/JHJ1A1mj8eMFk0TwUsNdSEcBwGKC58H507Gs1V4mHvH5l7XOWwcaABZpz
X-Received: by 2002:a05:6102:b0f:b0:784:b9ec:910b with SMTP id
 ada2fe7eead31-78a4ab294c6mr21019932137.12.1789053902190; Thu, 10 Sep 2026
 08:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910151204.1248-1-silvapfabio@gmail.com>
In-Reply-To: <20260910151204.1248-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 10 Sep 2026 12:24:50 -0300
X-Gm-Features: AcwNN1UP8bgal5cv8ishyJYf5JOsCycwT5IK3DfxI2RbZj5muVzNAW3W3n-dDbk
Message-ID: <CAMAsx6f3DiyOkfmy90T_SHxkmMxoJm9kaoppAB3uPq1WT6QXtQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate stable-kernel-rules.rst
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 10 de set. de 2026 =C3=A0s 12:12, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>

> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
>     Requisitos m=C3=ADnimos <process/changes>
>     CVEs <process/cve>
>     Lista de verifica=C3=A7=C3=A3o para patches <process/submit-checklist=
>
> +   Tudo sobre lan=C3=A7amentos -stable <process/stable-kernel-rules>
>     Interface de drivers do kernel Linux <process/stable-api-nonsense>
>     Conclave (Continuidade do projeto) <process/conclave>
>     Manuais dos mantenedores <process/maintainer-handbooks>

Good morning, you added the index to the old index.rst, please add it
to process/index.rst instead.

> +.. _stable_kernel_rules:
> +
This label can cause a conflict; please, if the label is not being
used by the repository, add _pt_BR to the front or remove it.
