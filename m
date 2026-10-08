Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F096389458
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475932; cv=none; b=hbc/7W6Z/LyzGK8bxXu5pAjDinV8yWft4eB3VLEqjKyk46WgUFXsJ4TvLv0rfepLoyoY8KA0U0Et4umZI0LnTs3OU1ihstdwhdtKMNvsJm6Mn1aHQqcBqUQJUUAP6eZsY9EinB0gu5a3JttaO5iXD0NwncyV3TAkivdesm7RTas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475932; c=relaxed/simple;
	bh=BI0G7qBpI/7KwQFAhmOUXBzLsg9VZTTr2gCpFXZLAhc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnqNu1a81jgtOz1MV9+GuxeYMfMBjYXWVHiFguFnVp6fHWSYioSDZ3EztENVjVFA2O7rg9+0evGFeCrUTvmuZG0HyrlZbk+ty5MKyE0O0gBEzdm8tOUv1l2g+2LC5GrnYXWHheB9GA/B04racuZCMD8s6loYAfOmMXYJ0IqtaGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBV3HFqz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBV3HFqz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c45111bebso2131337f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475929; x=1792080729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGTDk2M1CVr9/HPRZF14PhrI+tmF1KcbANTHbSO6d8s=;
        b=cBV3HFqzzOWW6/3mIA5IUdq0aM9r9hZqea0qp+sbS+quwYPN03Xl2tEzFF1fM72QhI
         /MZxGKXKbaBRh7XSSAEQfpK/r4I6uy2cIeljH9/LKXLwHoT+AvHZLRE4uvH4TSA70Df1
         xMa4MTwSXFIG6huQ31xlXGdhSIItoM1l9uQ+LTTqybNAURHWE7gP72MfEQXopxrCXrA/
         L9gjISpur6L/aZR2K/SIiuuWCC1YMR/J/aaQ5lkVlLZBUTCBfNJGMCzIZwaoA2MbFHa9
         sAWSyoUQbs1dkFjbDjGrlKLdI8gKE+FCl1emLGi4fG7+MByYp3V8EXvQ1nnU8PsYIcHZ
         6vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475929; x=1792080729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGTDk2M1CVr9/HPRZF14PhrI+tmF1KcbANTHbSO6d8s=;
        b=E2DXVOT0l3I4/v6u+WpzL67CT28xxt1slHuaoDVde++ierFyf0D3E/VQCW+DcuXs0b
         4ymdVpse+psukJZCr3pyhsJv/+mRr1fjA3GIyWuykZPeZ/978tItcM6eecrHSVJBvTqX
         Q6idVd0zG/9mZJcHjkTeHphHe4xt6jGwxSvUMtwxVDQXq/N6q0TNUZEUWpjKGfBu5gC+
         +N5rCdr1TMMqLUjUx68Xi9IUKKeBRi9pLw0I+z3eZ3ntDabkS9YqUVTeQ2nq67sb8wKH
         Uez4xMxy/xLexocELQOWH87zgF8FTto5dKwDJnFk6fsVeKCtdrAkwGoAEzAhEB1qz82X
         Sg/g==
X-Forwarded-Encrypted: i=1; AKwUvBwryCzVqD7/9gYhSZ0kc0QP8sVHeKOPW5Kw2cowyZ6Rb90JkmF4uKdktJzQUH+AknHJLUF3+Cq9QLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1bB6xLJjDwI8PsMuplppoZt318VPTu1qM6gtTWg7yfFjOdvlk
	YrA14FHtgX0MHG1Fv7/BJeciLoC0FC1f6p3rOkBk/FYuMD/xn8LWwoz6
X-Gm-Gg: AYBFou1a+C9o2zaox0qSTAl/pL/mOe7iJJfihblqvP9alYoax/KJ3eA5UvagVpR7C/8
	qmXtrlrCmVm2ajYqKcIRKiQ1tBgR0AjN1n4IeOgAU//GUEwRghgwvv3PfiqT8nU9yL3NUedYYge
	PcK/UbsevMc1LCjKrto1LCWyteaeCJcxeL9KvnTGuU2RhvmPcK0SwgC3Nhw1HMjG+k/NXLbTWaf
	2U/HqwymeTOGEW6z6w/hzv5z4HVoP5Li0XEcdlmYXyMu61TLYWnBi/8Fiw5oQuUYy8kDbA07B0d
	vrVpO27s04yzXhDsSdTOEdIH1NLvOKPsK319sJsuZ3GtHxAacKl07hGXJPquAwkqvobakZdameh
	Haof1ytwjKI9oXVYTxr82Q+pb60AWzNmxQRAq32Cdl9/0HE+zbk/rHZ+5+cLDMetJTlBo8Wf1N4
	+e6c22GfQbe0wUecDXxRIqo9r5uDQPaxgdbv2H5ZTUuRiz2JSG+JXkqozyQ3DczeQC5/XbDzTqh
	y65UouPeG79wL0+e2Zuyy7+eXnYcw2u33BGT8eGoUqtUQ==
X-Received: by 2002:a05:6000:25fb:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-48c77add59dmr9194549f8f.43.1791475929174;
        Thu, 08 Oct 2026 09:12:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db650fd4bsm478599f8f.11.2026.10.08.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:12:07 -0700 (PDT)
Date: Thu, 8 Oct 2026 17:12:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Gregory Price <gourry@gourry.net>, Sasha Levin <sashal@kernel.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, tools@kernel.org, x86@kernel.org, Thomas
 Gleixner <tglx@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap
 <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook
 <kees@kernel.org>, Jake Edge <jake@lwn.net>, Gabriele Paoloni
 <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Nathan
 Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <20261008171205.7239c463@pumpkin>
In-Reply-To: <asemkQ2v0di0Eea3@hallyn.com>
References: <20261008084956.2911790-1-sashal@kernel.org>
	<20261008084956.2911790-6-sashal@kernel.org>
	<aseRXi7hMWBBc0tB@hallyn.com>
	<aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
	<asemkQ2v0di0Eea3@hallyn.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 Oct 2026 09:20:01 -0500
"Serge E. Hallyn" <serge@hallyn.com> wrote:

...
> 
> Even if there's just a three line comment above a fn, history proves
> that it will not reliably stay in sync as the fn changes.  An automation
> step/check is needed.

The only way it can possibly stay in step is to have the compiler process
the same source text.
Then, if you add/change a function parameter you'd be pretty much forced
to add/change the comment.
Return values would have to be documented at the C return statement and
really as an extra parameter to the return.

But, IMHO, the whole thing adds too much bloat to the source files.
When you 'grep' a source file, you don't really want another match in
a big comment at the top of every function.

David

> 
> > ~Gregory  

