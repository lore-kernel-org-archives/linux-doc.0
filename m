Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A6128395
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 00:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149652; cv=pass; b=H+jUPVOp3slO6RKY2xbu/LSYlQViWXz//ogEDBsSMHxFz9UL7C+irsCtaXb9gf2e9aMBCLhhYYael7NEWKwwDzqFsWc+ATyklYdfae5xOUPp/AbY+gGQn++zh79UYq7TJDaznsCaoRTY8Q5kIIxynQhYRizeNWR3f4Hs+ILCC4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149652; c=relaxed/simple;
	bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJnhIsYmXKiVZTQuvsdqKTjHAdYBNJSDG+ArPG2CnyiLu6UjKPlXbDztpC+xdTsECd2xjtgJkAIwOkXRWjqmKAOKUPVgto1GRFCnmFFTFhObivvYzGruL8Ni8/9pwJQrdv8BIMzwgileVqMQfYIvmHtSlCueAEfhmVUxE3/pM48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d59lwcl8; arc=pass smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d59lwcl8"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-9102e90bcbeso335701185a.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 17:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779149649; cv=none;
        d=google.com; s=arc-20240605;
        b=cdSJi8JxPt0CRyqcRsE+kZuKj3IeZWaZt8S1B21+dSl1SNuOfSq47+6ugoOImNrkQx
         KZGC+eCsfVFxHaAte/aEEWIlJOTWyOS0ZOtf9G3s2AQnautS96eyFiDWCwNJhv2HIpTD
         zm0bnuyMV5dNxz0s9l2PpW1HEihKy8sa2O8lcu/q5Zz+YM7FuswAPhYWNyBVU3q3uI2n
         rPxWn7Je+3/xEc6vtGqmyTjaDuJnsZWdcusxY2FLbBE4iDR4n5cudb7CL/n+qxJ6KecR
         OqnjAijDYcAOKth/TTscjWAlQVtOFA56Zy00Z6lvVv6EEz+KwWfqnxtWEm5yDceq0zQ2
         bgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        fh=FKHvoC7KM+q5qfDGbY4M8EeXekhCYf+n4gq1m+NtEeY=;
        b=U8YCqPM1rPBo74FQxkSbOSR9IorrglJQRuw5ouP3GX7PYyuZ8jL7862kJ4YBq3ULQv
         fIGb4h1l5ItEPkzMiJXKhvMUEujQ5X4YmhW3mevoxEXAWS3OwA9S/8MBpT8ezmYvV5Rx
         wqxJuqeVVRR9Hib7JfWH57eEVY/zKaqVZ14DbZRoEuAFWPrnKAlhVMxNE+IuM7qkbG+S
         2c1yb8SElVo3Tq8g4FLQxP96C66RKYNQwT9wMChzqPwjKkuJLHeZHDOK18MiVaAliloB
         vPZzov4whsAa2Gsg9xVl30uwjdLqh2S6TVxIwAcmOcBdTUbOwMYyGELO00uzXSfbbhNo
         b3jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779149649; x=1779754449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        b=d59lwcl8NvuOHlMwJ/jtLfvIVKwSl887jI0zUq+n+MokZhIz5kSNG+Q7m83cRRj++o
         7S3rzqts7N4yutIkInkFXV9kygWG7yxiMPc0JWryBnFhkU7pGX5375FZhqllLsu46QxD
         yqRXefPbKqpNqDqlvNkmKy9NH53MH/MzNhs5i0t6EGN/qbHwnG3z9w6y+vTpWbbm4ui8
         +Y/emkK8/ZzUeQNXSb3F20EcO2qGGKw0KLfo5yfAg9tQxjLb8ir1PQn5DJpL6n74Uv7I
         Kzy/KgWqFZU9F5z3/y0h3xh8lwac6mtJi6nFuR/ealUBmYZWKM9xgcZKuPtDs3lS0PL6
         E+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779149649; x=1779754449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        b=F3Lq+iG8D2on+/z4MuwjJ0myYjkBYF8WAr4Ks7OwvGOvYG85RHPKFEBsSprazJWk1Y
         4sKK83Xl4ShCHA6hQtdanq9vDGD6envhP1QtMLi0VrwWCXNpAIi7A1r4M1fVYCgRyd6D
         OP3QBfJt/1fEZvd53P1cfJokTYBuvvSgmWVSmDIKLdsdyXYkMQBGbuGMUJifvmic1are
         sIPVmiJniV4zIdd4sdzQ39M7C/ySHzgrr1xujKCEs9OKCve8P94L02iF50ZZoul6JpPU
         qkgFU/j2kr4oySQMzTP2QchCCe43itfQWQIFyf+eFZxqNMAIaM/fNy9FnnTI+Nk/mI4T
         KtQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Hpw0D1hyXHI4DghOia3hmOyd+OgVedz28Ntpa8rZ8VhXNqIVtBxSghtzJ7Quo/54OWoQTtWcAee0=@vger.kernel.org
X-Gm-Message-State: AOJu0YweyEH0/0CJZzA8lLHFG6lfSM5wjKaPTU2BqjtcGDInnUl5DEhM
	Tz+NR/KWm4HrHRy+P5hpuleHdsTp90dmUyD2rNlc7YSjh/qb1JgI/4cIyBZhFqjWWwdTY6kQFmM
	7NxEMIMxEujWEN+un4ik+QewXdQdI43w=
X-Gm-Gg: Acq92OGA9VbYBwnZaVacKi72r4ic4+dsdhHyG9xNX9jqNFkzpPR0bRE9TipKEnWWKW3
	DFuJwWEdF6OLX0YBtPiYvJxyWKoqbIz5ndZMhEYw+DIMy/WDrDv6+7PQkjpuywmS9uXyLE7TDAz
	yFsZDqCrDqiMJpo3Ymco2ZjuEkbxPZILR7xWocMtZRdB+jrSbb96PAfV40emA+UFWrVUPhGVrJo
	5KvGnxw+SLbU0sDRQjUTl+kMRTK0rNOzzE/eolVLo30xWcBigGvHfVKUUm4+4SlRFS0SMRlPRxF
	vzL2JSmZvDPvfRyB2wsos/4eW/clpbI3Tllwg8SgsbJ2Zjy5wkWmrl/GjDQmQ2nGkufXNRz4DSW
	uRbQ=
X-Received: by 2002:a05:622a:d0e:b0:516:707a:cf8 with SMTP id
 d75a77b69052e-516707a0e9amr149948671cf.44.1779149648695; Mon, 18 May 2026
 17:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com> <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster>
In-Reply-To: <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 18 May 2026 17:13:58 -0700
X-Gm-Features: AVHnY4ICd7H9-70Xucdx9uJAfA9u6BhUaXyRyteuNE6Jo8mNtePRuTvmeSFjqyQ
Message-ID: <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	workflows@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dave Penkler <dpenkler@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof WilczyDski <kwilczynski@kernel.org>, 
	Andreas Oetken <andreas.oetken@siemens-energy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Simon,

Thank you for notifying us of your continued use of the Nios II architectur=
e.

On Mon, May 18, 2026 at 10:24=E2=80=AFAM Simon Schuster
<schuster.simon@siemens-energy.com> wrote:
> Unfortunately, as we are an infrastructure provider for civil energy
> infrastructure, the refurbishment cycle is a bit slower than for
> traditional consumer systems. This implies that the traditional LTS
> support duration (max. Dec 2028 as of writing [1]) is rather short, and
> we would be glad if we could keep the architecture in mainline for at
> least 5 years and only then "decay" to LTS.

Your reasoning makes complete sense. However, there is an alternative
to maintaining the architecture in mainline.

The Civil Infrastructure Platform project maintains super-LTS kernels
(and a set of base Debian packages) for 10 years. They are intended to
be used for exactly these kinds of devices.
See here: https://wiki.linuxfoundation.org/civilinfrastructureplatform/star=
t#kernel_maintainership
and here: https://cip-project.org/about/linux-kernel-core-packages

CIP will maintain kernel 6.12 until 2035. Is this long enough for your
lifecycle? What kernel are you currently using? If it's newer than
6.12, we can easily wait until the next CIP SLTS release to remove
Nios II support to avoid a downgrade.

One important thing to note is that the default CIP kernel branches
are not equivalent to standard LTS branches and include new hardware
support, which has a higher likelihood of introducing regressions.
However, the -st branches do not include these changes and follow the
same patch acceptance rules as standard LTS, so they are likely a
better fit for your use case.

Also, CIP focuses on architectures used by CIP members - currently I
think they are x86 (32 and 64-bit), ARM (32 and 64-bit) and RISC-V.
Since Siemens is already a CIP member, you can simply ask them to add
Nios II to the list, and you can assist them with testing and directly
submit patches to them once the standard 6.12 LTS period ends.

I hope this information helps you decide on the best course of action.

Ethan
