Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05DD492195
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005614; cv=pass; b=LK01uazYwi1Xn3WtlpNZ52hhKx5YsCSA3Vc1GakIjuLVvJ/9Rxblu471/WGmH35y8ZEWlaOgAs9Idls9fW7CScieFtEw2g9IKGj3HlXZjRz0Dqtmq+0hvzTTHC5Ku95NeIS+qJeT1ZCTazx3TvYUSx++22A/4/2A+NsytPFlja4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005614; c=relaxed/simple;
	bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ppwCsooaOE5TL0tnP222CvWMvQoyoULLlJhCQs5Ykjp9O09KpifM2klubu4k+PwAdwYXz/wbc6PKtvWLTuw3QMOwHNlx82Ge+PTRvTUgtOq7y+tOhHsrGmHxvSe2TbI8/OA+uSE6NscwG9IvjXZrxBrIRZOBzTsc/PcxNUBW4VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXK5c2xU; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXK5c2xU"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d4be94eeacso6254132a34.2
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 11:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778005612; cv=none;
        d=google.com; s=arc-20240605;
        b=NKUEkIpU0bkXVUKS9iLUKPD1eZLPt2C+chsnWLEAFhkI9BTVfz9A28zEqpNtlB35Oj
         NQa7NU9IBD2YIbG+tis8z3lLoVQ03cI+fnV48AoDiYObTDUdpHnGkjT5fdM8iBCqbb2r
         Q1J9Li+hCOFzSYIPDOshVQNBwjA7t4Zti0e9pwM+v+ZrIognfrlmSpHUUaZ4bXQKIVAa
         gENjdEp1SS7HaXCSm4gZHGykRKYXPdiCSP5qJjZ/lmViIxAw6PP7ERDt6PowydrOgPUC
         qnZqfdBPU0/6856J60u1Ywgsc1ynI3DO1AkkMWpnKvWoL1urr7701/+u5v6H+b6cF/c4
         +hHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        fh=EVeMK/pirxgBZkwoYjCZCYDk8g0KietX8YdCv3fZMTo=;
        b=O8SCYTVUOJrxIXo6U326Xyk4UdSh0yi8OYz6MDltyfCFlz83484wVx42FoLvaIBAZ0
         p3Z4TAMhLz/zdqUXdPS7YybPLDvqz7Q87Lwir6tThBEdu6wzFh0MrpFBQzMxmp8IXMR8
         7D7L3IikGdwf2zLlHtXElId/qQXdU/2H8LEyLJbAa3L/oiSspJwIjhyfNwMFBdCD46vU
         fXwRjB7K2xkxH+Q58GLTR9Z0/DmwxQmpMuSrSWESUqEA7eDcNUGa1XnI4dO9XMkUaCJ7
         NfGAkYg+2WRpKjKIqXj0qXh9HoOjFRq6W6s+r+mDiUIF17uWkc/qB5+AfxARjXl1JAVL
         IxLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005612; x=1778610412; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        b=WXK5c2xUX1xo+RMVivqX3up4KZYapyVg+4+CPgNLKv63ds/ORhgCSMwLSBx2rG/Do5
         dpkAhlGcPr9IdslXL0+OqqNreGKliFBrzP1fRZVmJIDxIAUdSKdNbwYfV7J8psMOOR4N
         xStDo6EyPOCMDLD6ublGYL+36BAJkllVGYXeP2AUP9FQTfidkKoWSFop5XRqMGV//rL0
         OVplLAFdoW6jmN6MxOR3xpgjUSntqWsQaqq8/aULEt6ILQ6frNGMeBkkeh7Isnua6xW/
         fMhBk6Eox5daRjZcnuur93XcMiT+c4/AKgc//4nrTydmi5TDcDufZEUch4J95sLW2bhx
         /ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005612; x=1778610412;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZIhgGw8OHp+7EafnrnJOBFkAUxEpp2cPLOL2P7jbZAs=;
        b=N10v5M4q3W/bLB2R+DKwFpo+YepGjsO785rYrV6ZgLoF9m8AvYzvtyUsKDtdEuOd0T
         aHhBY6z3eN6GzkdpHoGI6xHsR0TDBYWjQGv4Zv9oECj5/3nKgQSX+Tn2VWBGLfJjMGz6
         vFlGvwXHb4mb55iAJGHCQkL0phutyyMAYIWC7B3GAbKsRrENQT6rPI0aSEVQuFYL6f5+
         SbiXaXy6OeXGrsMZ1dLRz6Hlnsa8MQaSe8doWrFskM1f2PoFy6rdNQ+97pIPBGQh5lHf
         AX6Gt8hyNOS4Rrhyz/jwFzDnIu9RQtQuBtMjaeXWqNEHHtb3nOK7ru5niSOLr0GEW2Qq
         dSmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xSlRdwweW8UQPV3zIXzIq29d+69r/p93qre/vrl4UyCjrYE3wAIgCzKt66kFSP+EoWNwByyRrlSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YybFFhZdaT0aQsiP4zCUF4y9Iy6FbXSHAy/huFBzqQeT0f0fOuw
	kSzDma0TU4lt4GE7G42MEWjHKhXNftocCplYIoMJxhPpYX3dJSeIXsPgSeBZeE+2rlR2kfzkSvJ
	u4Mjyr9DTYAyvrwGrDmcXqnuxb/aYdpM=
X-Gm-Gg: AeBDievTDJMPmrKOCwmZu3lYOE4LmGPZ+S/IHFiXjur1f2+Cu1aFioloUNvVb0CdwoX
	hy3iNUpwEq8orCIsuLb6fBRE+6TGyen9AuB0zKxHO4AGllt3UNjufremkbCgx3BzYhLeyY2JH8T
	IEGQg7JrZJVpRobLeWHfTOPf70GTRJf90x+7RDFQ2JJnzXidZi2JGX5JzSK3sjsz+V8MbSuewz7
	URKMiN0xZERl5wJ2iHeI7SLPfSMn6RkOdCqSyax1brxF/DrvI4DXkn0UTtVWabj8Dv2vrdzwt9a
	M3ShX6KPPv6lOKQbE43MzPxnE2QUD9wGmEA2Q73mT1AF2BVs6ZPi+jlcqw0/BAIjtNL5dtbLlQv
	A9ehs+uyG
X-Received: by 2002:a05:6820:4c17:b0:696:8b09:6c99 with SMTP id
 006d021491bc7-699980a957bmr426610eaf.5.1778005611625; Tue, 05 May 2026
 11:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
 <afoMRMnSQUwk1eaN@levanger>
In-Reply-To: <afoMRMnSQUwk1eaN@levanger>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 5 May 2026 15:26:40 -0300
X-Gm-Features: AVHnY4LyB1Xe5rlwokmTAGILipbZzP-_Kf8TGIx7tE8Zk3dE-DZnkJNK9pzsLsQ
Message-ID: <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
To: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 1:11=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
>> FTR: The translations
>>Documentation/translations/{it\_IT,pt\_BR}/process/changes.rst become now
>>even more outdated.
>
>>Acked-by: Nicolas Schier <nsc@kernel.org>
>

Hi Nicolas,

Just confirming that I will make the necessary corrections to the
changes.rst Portuguese translation (pt\_BR) in the next few days.

Thanks,

Daniel Pereira
Linux Kernel Maintainer pt\_BR
