Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1355C31A
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997388; cv=pass; b=ahU1ApescdFXW8RKKcvZS6+tmOAwQYkZf7iyC2I3pW9gTpWTHfxbss0ucQU11zgI7rU14deQ22xsUXeI5QnFra3g8qKhKp20bwR55b4kx6+/9dFXg66+oQOQBKZN8DsJ87fR1zdJXQfizYcoBNv32zje9yMv5gg1gRvL7lFuFkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997388; c=relaxed/simple;
	bh=X0/63h23d4RMhaW6j99etRVwb5HigSuyzGIZ3M+xFDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h089Z3eBNVlc93KneEzsss0VY9DmQVgj9AJ7mtOmNEWLnW6LPe+dahypBZxUq28R8QakqTqTEuU7jsYlWwYIpVIKvWXqiVMJc8M0JatjtcUHYO0GXlK9a3HPd4nYYtVXjNSxA0EODrIszSQxXcjXvmggWYcDy5ijAeHbnPTw4Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMBAfSah; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMBAfSah"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso2182031241.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 10:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791997386; cv=none;
        d=google.com; s=arc-20260327;
        b=nn+5IEpuQe4wFCnPEGhQlfmdLNtyTflYpWGf05Be/gKpWyZEqOtzi8d9r7Vf9nXM1k
         OEX3AbQ5KRWPHhP0cM0ys/JQFiAAFvgpaBQ4vJ+SAtggWzNKXZoGb0zFm3hKhQztNhhZ
         nm/WpKFxtTPHPwE0rgqAgp0VHbHBpsCUupL/L8rk+khlBdQ1Dpoiz4OStGyfM0wz8OHF
         0/oDXe+/njy9SjejKjNpQCDYgFOrlAGsP8IE9PxIeL0DqkVxe3ykIG0yDc+3NLg+eYTZ
         Leu750IGU/KcZDBzzsl+U1IH/Ei+QOd72suf6RFuvvpAS6LUs8Zb7FXVXJvJoHAPyVIU
         0Nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKSkT6scNX2t+/rtJq+i6cTIZ8UL66Szs79srg+q1rs=;
        fh=NmTI4qRy3z8xavZof7y4UDtg1bVdXCH+wnPed/MONqs=;
        b=VSzI3sPTWm4WaZiLb1TjoNPor9Vumsyhyn4bRqeRIVurM+EA0jajBlZF3bbar2Hsds
         e/63zPpR1WZfrYIwah5lMV+C0QndPhJAVEJUBBKf2cEoTJvqE2tipIvBi63HkrPZTLWN
         /yriQ1rgOIa+pXpHPvyCv/72paBF3vBacrqw5F9AaNzoZ1E2IlFsm7R0AyJ4yQyOP/5k
         q/yR/jj5IrbRH67DxkH1jq4GFBZhUG5ZiGBH5Aqdr4sR7XalFGA2VPPcCK8CDKK6OW+E
         gkN46k38hlDLXZPChbALZKPw+u9xFJ53xLti1RyvVx/Lq21XFIeFmeiwuextkEWMqzOW
         8cRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791997386; x=1792602186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKSkT6scNX2t+/rtJq+i6cTIZ8UL66Szs79srg+q1rs=;
        b=VMBAfSah8lb22/ugMKrH2ApzC2OCYCkC4xBO1VYYp1wP6RgGFysJPQMeXvw8z6SAch
         I2jfLrBB1VPexoPvcH6ea07NjwoI8yKB3zlhTBsuF4V1nSczOD70mMTgUUO1t/dCMvnR
         g1Axj2IKj8WZJdyWBZU+EHzj4ZfSH0grMCX27O1kf54v7Tnu34Y9nKke4T4Iw78JSEkc
         QFQhxPv7fZFXolfSvL4eqJNbeOYS0YUlPBqUnyezm1dJHvKxKg6hxixE7p8/K/Qnz0mI
         4ZlHZuYVnPNrg2Y3n9MNzop6OiBzCBh+V6kti8OJVFogS8yJBVqoPRrRabH1UxXWS38d
         0+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997386; x=1792602186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKSkT6scNX2t+/rtJq+i6cTIZ8UL66Szs79srg+q1rs=;
        b=QhmPRdyg0NHXdH5m/Y8WcgKvdlb7Qy9i5P9XOFjaC2IauijuD34b2M9ysua7Ips8AE
         eVCzJsUMhI/z+Pml5JHifqp8fC4VdJRjKIzsTmocl/qy7a7DTvTm+EIhiGQLvFi1l1hk
         7uJUAicSIcGfjWthkW0cZLWqcQ2WmINhO+7Ls5Q6CuEBgaaOhJQFb1VM09HmMA/RMj7m
         uScxiGyaI+1eRvhPV95Hmd5D8RdCw+GPGjgZlZLdJ6pFS1NaSf/bcNChJre5C+kVdPga
         Yd2PVtZ3UmuB/Jfr7zoig4ZrodwuVqB8Ir5ccUIi+LtO8aaQRL/69jD3ReGPzgXrVbux
         wmFA==
X-Forwarded-Encrypted: i=1; AKwUvBxxe0WLs4ScteQ1irM1TVXaNJhsN5W77enyp9VsmpbPTn2zHk8Elqb2k7sNEO7gacIRwEn9dEtV5Ds=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDDvqTxsNvd3+aASbYBzZqVfUtQg7JMYnquuvrqEagT4eS2ntM
	VAIx+sBgkDHHCUXyMGKlR1A/7Nz6mJpeiCphuNxFjszDpZc8QMqp0+iC8o4TW1o+FGmf7kyx3t6
	5O6B9+QlxGMboT+yZX/SHqjE2Sq7rJdo=
X-Gm-Gg: AYBFou2cgW1096UpicotSE+0gIC1C7WZDldXE+SCZlR8wwnRkPwkeocLizecfXkGKsL
	CyuZCZ0guAmrMRDLoe+U0X9JSffX/YdNmD6+Nf9t8bNET8c9mmtn0220UwrMFfq1k7BALOXKOwD
	zsAIjqhWr8cjJ6Ot6cidn1PEb8Sy5GkrVXplXW17dSkmKPoLuUiHCXT2fS1ZUpl87ilt6UTfEum
	ZqjIILYLUG3h1LZiDOyUy6eVGPTZwoUWuIJuoicTaytYLomD1t1xcd3VVhKB3a0GEFmHjSHMwTz
	PoqcfdutDUTb6f/sxsexSDAzp2A6ATrAfbRQsbca35Ab4wsO7cTcxXblySMZxOmYVknDecmvPu1
	wjSsC6lzEpzGBZZQTMMHPIzQIhcVv6q5f2JbUWbofC0FpCf+QwBq3frUv8RjQUJq9lVIg
X-Received: by 2002:a05:6102:424f:b0:7c1:9f20:36ad with SMTP id
 ada2fe7eead31-7cb36985e66mr5432455137.2.1791997385802; Wed, 14 Oct 2026
 10:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791933697.git.lucasadramalho@gmail.com> <3f9bdd755f3db2405ec44471ebdcfb614bf41725.1791933697.git.lucasadramalho@gmail.com>
In-Reply-To: <3f9bdd755f3db2405ec44471ebdcfb614bf41725.1791933697.git.lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 14 Oct 2026 14:02:54 -0300
X-Gm-Features: AclHuK9QC3EQ75rLe9HTtHN9Rpytiw08godnH_mR6QYhJ5b38reZqyt0tZjRwqo
Message-ID: <CAMAsx6fTx4hO2Dr-5a7R=OmUsbVvM7LAibh5avY3aXzwUpNU-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] docs: translations: pt_BR: process: add driver_development_debugging_guide
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 13 de out. de 2026 =C3=A0s 20:46, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
    Hi Lucas,

    Thanks for working on this! The translation is very well done and
  the documentation builds cleanly.

    I have just one minor suggestion regarding technical terminology
  in the DebugFS section:

    > +Com esses arquivos, =C3=A9 poss=C3=ADvel armazenar valores de vari=
=C3=A1veis
    >ou gerar
    > +dumps de registros/mem=C3=B3ria, ou ainda tornar esses arquivos
    > grav=C3=A1veis e modificar
    > +valores/configura=C3=A7=C3=B5es no driver.
    > +
    > +Poss=C3=ADveis casos de uso, entre outros:
    > +
    > +- Armazenar valores de registros

    In the context of hardware and device drivers, the English term
  "registers" translates to "registradores" in Portuguese (rather than
  "registros", which usually refers to data records or logs).

    Could you please update them to:
    - "dumps de registradores/mem=C3=B3ria"
    - "- Armazenar valores de registradores"

    Please send a v2 with this change so we can proceed.

    Thanks,
    Daniel
