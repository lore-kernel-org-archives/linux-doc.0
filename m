Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D626056C
	for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519556; cv=pass; b=bD1/kA0PofoQhgfB6K5Qmx/8yKg+jTxojuB3HcgSgSE21o06tzrULa1JjD5GhK7NWDw7wiwST8m0gZ+5ceXG39gc9cTs1IcgODYdtOTA0hfkxBsueZZNfCiHJwPCzA8oyD4MysGSE7iFC4PuDVFvVOuKiI0jLY2aiUR/2vJj5aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519556; c=relaxed/simple;
	bh=d4bLKITpmnH9pzxHe7TU3Fvheb79/c67RT1bq/kCK48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkb3kYkWsmVR5wJYrYW+sKQ/n+mX6MMVqNAxVNxYjC+MSkXrPl4rfAmpFuUO/LsM++CFYzq35ekt+tqk0N+ViyybuYOLzEcZRzF8XwVHe8fje+oAYooqfsSKJyEcIgWvNk3WjVxjTW1YDS+BNG6657QPzJ88Md+7cb0ZdWI9a4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIxX55Rl; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIxX55Rl"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38df1889fb9so15909261fa.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 06:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776519551; cv=none;
        d=google.com; s=arc-20240605;
        b=F7LTX3KmbPFBw4VR/0scwkvKj2r4zh/5Vh1jDBcBC+CiGVqkuZ2KJuGY/yBmkzhFfQ
         JBZUyYIa0ZVIxtYwlQarhWVu+wO1CMrf8FtvvyjSeVCQuOQSPEYLZBMQoPRvg02lKO/M
         gAP/8ce0Kb9/gMqGfuCpHZtKfPg/mzNkoUv85ZAWJp0FLjeWeg+Spz2Kpxt9xc3eKtgo
         rUZa0cMY9LRfD7cxPW0NHX+kaCyauR74p+xO2w7JgWV6zSSdkde/uaWpDIeQr2T7kD2P
         dyy+qU47+zDO08uXt+X1Z8L+zsFsd7Lg6Hr4U1TPBG0tKe9KE+D6GGfZz+7ZhFPow6oe
         GYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJvC40gLFsltBxZ1uI7Zn6ceoWA65E55bZG+Boc8a7w=;
        fh=5DHTnhW/cwW3x1/nJIE+OXSV1j1nZSkwklW1Siq/jkQ=;
        b=QoA7AH9svcTIRm+UC+VDzcrEIjezfNEDgPOdOQb/emgRnAfxkkM4mROaYMnNwIesXq
         GFEsLBsrkh9JMFH2WLWiNhkL7b3sfu2V9Kif5zt9SOEiO6Y5oUWS2ZZexPJOFTzT4P9K
         bzumflKQnF/fBGy3nQbG3CI0CRpWeN/eZ3/lVfJNR1nkVhrqtXcYTU4VdRWV6XQWW990
         UxfOa83kAC98E0LMpnvRWxQsD5VMo/Bhm43Zuf8wXU4bjDj4hoVlxxoB+ZuHjR79TU04
         CNc8atBIaeaPaoYkb5LoJPTtV2bNHjD0ml2eZY5I5T8mBXigopTEKInBG5ZK1fpficJf
         Qgww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776519551; x=1777124351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJvC40gLFsltBxZ1uI7Zn6ceoWA65E55bZG+Boc8a7w=;
        b=FIxX55Rlbpv4kkQ2QYTXmgl1kgyrHELlM/z10PqY0ngaT2ECHK86fPtcoCjpjilt20
         twpbtYqT6DNM3jJHxkWXzIy9RvC0tNVnBodH3VPNJ5qW9FlU6KySz8AkPE93TUF7ZLu2
         ir/XoOV59UQbRwsYDLwPg4rN9JfdbkyOneqixY5P5jQaovQNDYrH9PvSQXA4A8KpfpPi
         j3h7l6T1vVieXpUgnoDK2mxIKmAPoqFsGWAYj85xUqcs0g+218xrZlTmYdDz6CZdZPtC
         I8LIRr0Pckuz6kHfDZVGJel1wDFRg1j0O3xqV4sGQfguorVuRVg4MLHSfrK0u/m7h6H8
         MbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776519551; x=1777124351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xJvC40gLFsltBxZ1uI7Zn6ceoWA65E55bZG+Boc8a7w=;
        b=kGUWU4L6eIx82jewTGqMYraIg6r7RjPLHoyAoG1uvpYSRKM56KFHoHYV3gB+WFUXVq
         hLPOKO8nhhHKZzmIJ7zgj+yKJsh/LHpUyBBWVHFpJB6+AYi04FS9b00UPu4lgiWeJYYO
         cN5w1An2uOQe2fF7XFLP5fh0F9Jx7foUmv1bX5x1sMXPnweCKbN+h7OAgyXMDMNC1k16
         l+hBnd3janpS4hdQvq1HEFe9Kfc+RTNAGuvKCJDYP5T9DjVH/YtN9IckjXPjoXssCKQx
         +uatKQXM1dSFoKyEUA3JSxEbg531jr55dE4L4Ed8kYCdigNxQU013eg8rGG2VYpYhkAB
         ljVg==
X-Forwarded-Encrypted: i=1; AFNElJ8nZL/kMAg9gxDyqFVw+CuROlXXLcGXOeunYsv1wLaYdARbJ0CYC12IK5ELTx9S+s39qnTHt5W2FnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8U1J1uVGyP14odAxzdOrVXg4zrcsdfDXIEyybtYGF76rRR4w
	hR44vQemOxJ03t0NLCtI8FOOZM4xmH952Hcw5cDEHge7RgTWC1w21PYAy2ulPjMXJF8uol5AyCJ
	M6tlBkETcTLexJqrKlOM9ykO2pkKhEOA=
X-Gm-Gg: AeBDiet7yxU1JZqe2ih5VKDpwXXJOXZ0ReJbTyenKDW+IqtGRkrRV97iptTDuQE5rnq
	/lLuGVhAvz/0DTgRWQGpkutfszB/PkX+wMx4ydWeZa5P/Z7VEP0jF/G2m3rE0+urxTNI3vJqO4j
	BMGx0A2ykC9ZsMaxhgw0mGLfnu8zBXxziOQjd6bBIgpLWvdOFC94mYTDV/PZUOBsfoYAj4Q4tI/
	iGSvkz6DkhvRY8uV6JT7ruvVFX28CZbR0H77AwoVJhVLX8O7nN13fca1bX+Vi9T8EU/10taG13Z
	aruJtuwMq6IjYxGl1yZLjwmJHwtHyXb18vvzBFLsHCKvfbCgnW0dnIJZsWYeBG5050lzaKyxPBF
	9GE8=
X-Received: by 2002:a05:6512:3e0f:b0:5a1:d0d:1ba9 with SMTP id
 2adb3069b0e04-5a4172ca7e5mr2035977e87.7.1776519550953; Sat, 18 Apr 2026
 06:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410221257.191517-1-piyushpatle228@gmail.com>
In-Reply-To: <20260410221257.191517-1-piyushpatle228@gmail.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sat, 18 Apr 2026 19:08:33 +0530
X-Gm-Features: AQROBzAje9emFgJGKispWDWa7f0aHgah91MrMhzwf-cPoxhz0ANOFzegP--MYHw
Message-ID: <CAMB+xkY2judiZiTV7S1DpHuFdZg6WNzpNnn2k0zEUxXmxfBpnw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: document generation of offset header files
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	Chen Pei <cp0613@linux.alibaba.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 3:43=E2=80=AFAM Piyush Patle <piyushpatle228@gmail.=
com> wrote:
>
> Replace the placeholder reference with a description of how Kbuild
> generates offset header files such as include/generated/asm-offsets.h.
>
> Remove the corresponding TODO entry now that this is documented.
>
> Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> ---
>  Documentation/kbuild/makefiles.rst | 41 ++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/ma=
kefiles.rst
> index 24a4708d26e8..7521cae7d56f 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1285,8 +1285,39 @@ Example::
>  In this example, the file target maketools will be processed
>  before descending down in the subdirectories.
>
> -See also chapter XXX-TODO that describes how kbuild supports
> -generating offset header files.
> +Generating offset header files
> +------------------------------
> +
> +The ``include/generated/asm-offsets.h`` header exposes C structure
> +member offsets and other compile-time constants to assembly code. It
> +is generated from ``arch/$(SRCARCH)/kernel/asm-offsets.c``.
> +
> +The source file uses ``DEFINE()``, ``OFFSET()``, ``BLANK()`` and
> +``COMMENT()`` from ``<linux/kbuild.h>``. These emit marker strings
> +through inline asm that Kbuild extracts from the compiled assembly
> +output.
> +
> +Example::
> +
> +  #include <linux/kbuild.h>
> +  #include <linux/sched.h>
> +
> +  int main(void)
> +  {
> +          OFFSET(TSK_ACTIVE_MM, task_struct, active_mm);
> +          DEFINE(THREAD_SIZE, THREAD_SIZE);
> +          BLANK();
> +          return 0;
> +  }
> +
> +The rules are defined in the top-level ``Kbuild`` and
> +``scripts/Makefile.lib``. The header is built during Kbuild's
> +``prepare`` phase, after ``archprepare`` and before descending into
> +subdirectories.
> +
> +The same mechanism generates ``include/generated/bounds.h`` from
> +``kernel/bounds.c`` and ``include/generated/rq-offsets.h`` from
> +``kernel/sched/rq-offsets.c``.
>
>  List directories to visit when descending
>  -----------------------------------------
> @@ -1690,9 +1721,3 @@ Credits
>  - Updates by Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
>  - Updates by Sam Ravnborg <sam@ravnborg.org>
>  - Language QA by Jan Engelhardt <jengelh@gmx.de>
> -
> -TODO
> -=3D=3D=3D=3D
> -
> -- Generating offset header files.
> -- Add more variables to chapters 7 or 9?
> --
> 2.43.0
>

Hi,
Gentle ping on this patch.

I=E2=80=99d appreciate any feedback whenever you get time, or let me know i=
f I
should resend/rework anything.

Regards,
Piyush
