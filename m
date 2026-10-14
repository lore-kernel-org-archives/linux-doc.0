Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B615505C2
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996274; cv=pass; b=mlfy1k8lOMkSW+3uEqG3Fl9BAdLWD+fw8UqhAPX7XvXgPmDY4EIcvXVDVJ+WnB6h2QkVGGTK36AYiUPT5R1fXPmAtG0GWePUh1m0FTLC3+IcAX6p66a2z6IUWJhhoisWMc/uB4MnX2FQ+rM1CeNBFXLb5ax7zVVk1nPuNry9nYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996274; c=relaxed/simple;
	bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBDomy56JEj/XYTvkoab6gapc5MTyaHl2+H8UD3EJi86JVzxmOxNMAUYGAqrBlhaj30CNaDYcwv2RTJXSJE0j/11xITf9XmsZsVBOMZF1hmkMXXe2gK+rBg7mZFjGrFZ5uOnb0ZICl+iJIdITfWrG8xtxYaLB3vwPEmisJSk0LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG5LMeCX; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG5LMeCX"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33e623bd651so514498eec.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996272; cv=none;
        d=google.com; s=arc-20260327;
        b=A2PX7FbBV1wW4GoFyZ/XLAOmQKKhO3MX9+cuIr5T+FOOfszohZH3qTTwlyQ0KMTJob
         Fu3AOe6580UmyLSpSipG9rfGBSxlzuqYpgdx3wo8NaQTM2WFOAyVdv4nEntjWr5t+foH
         mL1hdzTTaOCdABF28pCTYxRUeDHvOuS27JaOHFMqY4oTwXBSw5KjW8AuUBXDqVzrGTIi
         w357B3iWtp5f70uQAj1S2okevRMCAT42B5+4iGQzjwnLuY8VxTQqU7ee5Bl/xfYiHs8U
         01/rYF1j5ONr+A6tUrNdUSrdmgq8ZNKxBXIuNOID2eg1BZDOa68SNREurclFgKC79f8L
         3MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        fh=axoSvqg5aGC4Xx9cbMBd0zXvLMthcO0+/AyLYT/aScA=;
        b=cg8O/uYdtIoxV9H1hPn4IluK8SRbFrbITh6P8hwrRF8le6oYgzBXz2KeRm3Xc/2lu1
         vGbdcp+n8ff+Ef8zd1Y03whWX8tiuOecSzPkEfEQ/dCtVKGfyHutAs5Q4b1ck4CSQ7qn
         UblpSywxf0T9MLUaUoguQx35vWIXGKWajTH/ehZ0/B4Ad52JJCHHmfRV9O601S0kJGeN
         mE7ryeNoyc44Kws+VR+r7aFrV6dLTh+MqfLHZF7WY8H/hPoPiYTJTHhXWcvWp/RgSXb7
         22SWt1JsdXSjgjJI9S5fr7kWjqUNOTC38pb58nhkSuory/bWA8VxRSJ566saueQPHW1x
         BWZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996272; x=1792601072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=dG5LMeCXSiSbpubk/BTMkvWJ2dvIK7jFfkGhSVKuiPvEccVQI9eRP/pY4aiG8kSDk8
         sybScDEKYa9pUjoob3fVfnbNdFtdkBXsSjpfjP+bPyBK5Chd00x6HJJ7X+HteLAY7JfU
         o4429zXiiE7e1UOccLBxgzcZh+G/nI2B8bjb9YKWi7iAEGL16Iblz9B6MpdkbUl3G+Fk
         3lPFokI++jDRZ0Cwvj1/64bOOygK5BR8VGYFxRHD7siF53FrkARVocKqUOcShcj0hkn2
         gYiKlI7ykCQvFk94TVoBL/XLbOsKN6gefpMbeBOS/eufSnZP21bV5ckiClL1WUdGnm6v
         +u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996272; x=1792601072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=U0vLvaJZ5j2K+s4fLbF4ilnjt6MDd5JXdR8mDcRlBH/dhdlXtLHI3fGj1/orhAU9ME
         M4ue229mOiVt60/GTvpljzzZc11vjIXwZFbuQjbdSSYEzEviiZlseRJZmB7lB+pL3opj
         OfSWoND7eyxJ3i7xewsoKvdxLWsVpulJbUqMfsNveCpNSb5Sqo3y/1aK4G726z7Sg8vj
         zrG8/p98tjWqXqnBplsymJIDjx3TQ17nRIKkdKczOmcTzfuYewchJ3Rg48jNAJduCHZQ
         D4O2AdMWw0a1lyk24G+dODGh4u6bHlRWJStQUbs2WjmNHvBaPBxdY9Vj3sHC8azo5aMC
         VBSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdJ5HmvOauHneOhGqvgnapbbsYpWnlDSOq5OA9qs2+kPZhGHfl4/kbXY57Q3BX3ZBG9UCQUjg9klI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJbfGPFzExlye5eWzUFK//h8LeJL3yCwsbRfarOvM90ZQdphp2
	EWh6WKtiOpdu8iZmlxFncky7odjFedMHZm/CsAOJcDRGSP38ig7I4G7YBjK2H5eunhL/Q11Q2lj
	62MvNg6OY6O+4yHa0lKlNboXKgmpAF0c=
X-Gm-Gg: AYBFou0pYJlomjpHZZhRwiWzffCzoFF4K3jIuY2EEr0yONPgV9idghPBnuzkPrePMf0
	me8DsC08B3iYn1yxJPWYi5B1ji3LoSwxvycWtO9Lb56wRokqJuxBqERj4IbtQweY3uzJ/vhTXqS
	kMlgEbPmtSIBLRY7D+Gksx6i6PCgEVEmTWtIuzU6qGM1tXCU5kplHERjEIW162+eInio7f59PXS
	zS75uhWtfdjsNh1l75+g7lPagFAqao1nRzZn6bj6FOT6YB3NcEao49UCWcwSHESGkonG2APMRup
	s4Km+PCqgYrM95cvTo8PrlqOtcWYWhGaz/c0WLVc2H5HdKBfHWoUuGN11Ve2N4QQVN7BSnYE/pu
	Z69zgk0Id8EcUoV/o3ncReD2pNRoBhWCTCypU3vfjB413hkyH3Lx9vlDG8klQsmT0KjA/pCeJXs
	ktxkw/guVzUaLvSjt6zfS5FMkARaIZkSDlLUlIDuOXzZuQTYMmQN0=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr28158500eec.1.1791996271702; Wed, 14 Oct 2026
 09:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 18:44:18 +0200
X-Gm-Features: AclHuK_d31yoge0njHjovdIQh7JfJY6W-PLjzMLBq14NjY-schAqigzEJUAQwG8
Message-ID: <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

Of course, please feel free to pick it up (with the small tweak I
requested) if you have a user.

And if you don't pick the user, I could still pick the first patch up
through the compiler attributes tree if you and other folks want to
use it after -rc1.

Greg: adding the attribute itself should be safe and would unblock
others that may want to "protect" themselves, without having to wait
for every potential user to get fixed (but of course I agree they
should get fixed -- we should not forget about them, if that is your
concern).

Cheers,
Miguel
