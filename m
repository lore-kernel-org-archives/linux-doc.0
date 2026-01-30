Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9AE378829
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771171; cv=pass; b=FQZGV5B/EfVd9uLZxToGTZ63zHlWwaJxCjBTmUUUjvyyqyjVuUUKjXvN8ML82u0p2n3cVJBD5KjNhSB3t8wU0MQvpU+XlNE0NVBIs9K9my2AniTq0TeIbp31LFHv4K+/n0JtB3Ig/N/HIOuIK6T7qV6i8wHF9OwATiNVIAEd6FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771171; c=relaxed/simple;
	bh=9/zpKffe7y3uB+Qn0SF95hcsB79LbAi7GedReWEKmVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lv+h18ZRrPsJojI0rtnjtZSQPAD4SZetLa7Z5WYaj7TI3nJUHT02DBm7TeV/C4v6sLaF9V0b7Nq8dHQ6FIR6KAkSWMyGCpE2Ay+VTYKYkKP2XZ5lPnRhU47BiqrFS2dVhQpcAWuAWM5En+hwzvjb7GpvtywadiGWev3GC2WeudY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIPqm4+U; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIPqm4+U"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-658ad86082dso3551348a12.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 03:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769771167; cv=none;
        d=google.com; s=arc-20240605;
        b=gLODeMKIQx7MorxlJgC7EnotJ2uVfVPHjCQmFsMbevapR7FGevnP8G36ynb3XhESLz
         IyGKnkktALf75bdyAcZo1SnsGwLC1oNFwQ+c6G0AxrTjtpg2e4UynJeouYChyAiY8FmL
         3ETBSZhxVUqNcVTtaqfF0U0S7cFelSRhEatlhEP/l6GlFc7asMSTNHraVCaCIGVqofUH
         TvQCzqBajIRMIf0wtiJ2VLWNW+w5IbyjlvoPNknWMplN6ZVS0x5Y//EUaBSc5zMbHWEd
         2PtXUXaIkspvRYILjdDG5OxkRMwqL8TkKP06ilsz7yeJlk3M5zrluTUhqcdPda1al+9f
         rOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KJi4aV/ZmRDHm0hyQsYhdJh23rHtSjaZzhOLa52dkXo=;
        fh=e/HKNwaK3xsS7E9MxZp/ALyfTbXY1eA3fzNIsHUI580=;
        b=DA0Zf1pQwzt24b5dXJJNucqagYEBJWdit5J7llB9R5NJbB0bwCcgpEwK/RsRpeCx2Z
         R30XSZxF85cCzEHygUsMe7n82EJAYGnC15xxCipT2m3w84Lkrxr6aLpO4pBcESfMXDK/
         kP2W8vKISPMlvKrMk9A4vAh+dU27YVTpNKdyzmEsyVlHOnTF7OGnMvq9u16xWIS0mYB0
         IQbB8R9zbSWvM6bjrAf0vRZQFIjOZDyXfOHXcaChc1Gg5ncrwQ6n56s0CxZqsjSVN4tt
         I6QeCtT8LOfyM3EDu4+kSSrlSAg2+oG5rsBKIjvR9fkEWbC4ttjSfYYBxZx6WfALQnJf
         ZbTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769771167; x=1770375967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJi4aV/ZmRDHm0hyQsYhdJh23rHtSjaZzhOLa52dkXo=;
        b=hIPqm4+U7OpUx4koc8RxObDAUkvZy6VqulOYO9UF7VmAqvuywLjIBne/1s2y5L2HSl
         3NOn4JBHg4TW8CgfTcWdRF4fTU7Dzgj3zjxxux8m0FaIw4XhxHpKTw88+Se3e16dF3pe
         i3KvNaXRk8wHAZ04vVaKk6BjxrpDuTvVVPqzba6D3tXrZIGMA+oQZgSwYKNRmeKdiNPR
         LRo23su5YjT6ie/CZEpITLV2onC0bu5b6UFf7AUTV7s1dtxI7/6H/ED9C+97NiFlJVak
         TAEIah49ALrBIzvxVT5Yk6E17Sqp5tSb8rsC2bIlt94bwfu82BR8LzjfR8eOJPzeMpqO
         HA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769771167; x=1770375967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJi4aV/ZmRDHm0hyQsYhdJh23rHtSjaZzhOLa52dkXo=;
        b=mQ2ycIiky47khGSPooggsEcBa6IKitb/x42O+8iHmU+p4GO3xmpjvUgUcdZ73kdKuf
         QeMahjt3cSyUw6eBcQTFHCfbg9wsSH/DlcK3kK3sHxJb0WTOMen/VVASFZITqfgAyWoY
         lqctWwCEIp+2AIn9VM7wwFV9N0JS8Q6f3bM8tLX2JFT33b5WLoFka247AtlLIc7Yf7dD
         UIKSTqAAkHXRd8CQCeQH5FiBC1mh5atbLqIPqz6AvSJpvvAdQ3SQzLIiV+DLj2vUTAd0
         eOnYVWzL7BG4riZ2m8vC8q6ojaYW3Nkh3vF+FTCnFtkkRc1HRE0LIkbvsqrch2kXq3Xp
         FD1w==
X-Forwarded-Encrypted: i=1; AJvYcCUc3y7oDQv7u+uqI+cNA29Fb8TvVQwfXP29Y9MdYkH4skTt9M5xyJD769IQikrzgufbpsGoUIwJlCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMlif/TOJJ2s61WqEFlwhQbi1AzmuWmkVriF6uLV8Umo8qdFaq
	xaK7/2vs8g4Qj+1ZEGP6d7lCh68GxY7WDCihr6m2DPADvW23sY0U+b+KkL+poqWRUHBAE6CnrzV
	GdakCsnoDHw4/hYEtg3TYpLtpPGpI5q8=
X-Gm-Gg: AZuq6aL9S/9Ou8DAL+aUtZrVS6ktbGlqWZwmfs/6c62ZrA/7/PhsikQe61ENo95O7jV
	TChtfCwbglmlOqAAI4iRC3SseVXFWfQFFxVBuPA/rxflo5ZMq9nVdBpZmWoolRLe5oI5zvyzu1V
	fH6hnsDT0x63l7jiNtAzcnPNJ9YdjmmemZkPxt9oZ+Y4slsfW+LuVxzntIBE3IkxvnNldDLLOPJ
	vdU492dgHGOTP2HaY9colGdPLAlH/CUT/CTHXd6YXiEboyoepX93sSPrICc09egSpaBm9K1Ic6n
	pNhUX0NnoW4SwneuRexZg/W78UMQeg==
X-Received: by 2002:a05:6402:144f:b0:64b:588b:4375 with SMTP id
 4fb4d7f45d1cf-658de543897mr1599144a12.2.1769771166763; Fri, 30 Jan 2026
 03:06:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130001418.18414-1-wufan@kernel.org>
In-Reply-To: <20260130001418.18414-1-wufan@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Jan 2026 12:05:55 +0100
X-Gm-Features: AZwV_QgghBBStBrPYhn9xu--KNUWAryBYerGvsUjHEDtz6N4ByrCAVmC06166_U
Message-ID: <CAOQ4uxhf6EQKcoN055xzmi-RW2GPxRzz_ExsQawGQBSmoX2WYg@mail.gmail.com>
Subject: Re: [PATCH] ipe: document AT_EXECVE_CHECK TOCTOU issue on OverlayFS
To: wufan@kernel.org
Cc: linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, mic@digikod.net, 
	miklos@szeredi.hu, linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 1:14=E2=80=AFAM <wufan@kernel.org> wrote:
>
> From: Fan Wu <wufan@kernel.org>
>
> Document a known TOCTOU (time-of-check to time-of-use) issue when using
> AT_EXECVE_CHECK with read() on OverlayFS.

Hi Fan Wu,

TBH, I don't like the way that this problem is being framed.
IIUC, the problem is using IPE on a non-read-only fs.
Is that correct?

That fact that IPE metadata is usually coupled with read-only fs
is interesting for the understanding of the use case, but unless
IPE feature mandates read-only fs, this is a generic problem.

OverlayFS is just one private case, which happens to be common
in Android or containers? IDK, you did not mention this.

Please describe the problem as a generic problem and give
overlayfs as an example, preferable with references to the
real world use cases.

If I misunderstood, please explain why this problem is exclusive
to overlayfs.

Thanks,
Amir.

> The deny_write_access()
> protection is only held during the syscall, allowing a copy-up operation
> to be triggered afterward, causing subsequent read() calls to return
> content from the unprotected upper layer.
>
> This is generally not a concern for typical IPE deployments since
> dm-verity and fs-verity protected files are effectively read-only.
> However, OverlayFS with a writable upper layer presents a special case.
>
> Document mitigation strategies including mounting overlay as read-only
> and using mmap() instead of read(). Note that the mmap() mitigation
> relies on current OverlayFS implementation details and should not be
> considered a security guarantee.
>
> Signed-off-by: Fan Wu <wufan@kernel.org>
> ---
>  Documentation/admin-guide/LSM/ipe.rst | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/Documentation/admin-guide/LSM/ipe.rst b/Documentation/admin-=
guide/LSM/ipe.rst
> index a756d8158531..b621a98fe5e2 100644
> --- a/Documentation/admin-guide/LSM/ipe.rst
> +++ b/Documentation/admin-guide/LSM/ipe.rst
> @@ -110,6 +110,34 @@ intercepts during the execution process, this mechan=
ism needs the interpreter
>  to take the initiative, and existing interpreters won't be automatically
>  supported unless the signal call is added.
>
> +.. WARNING::
> +
> +   There is a known TOCTOU (time-of-check to time-of-use) issue with
> +   ``AT_EXECVE_CHECK`` when interpreters use ``read()`` to obtain script
> +   contents after the check [#atacexecvecheck_toctou]_. The ``AT_EXECVE_=
CHECK``
> +   protection (via ``deny_write_access()``) is only held during the sysc=
all.
> +   After it returns, the file can be modified before the interpreter rea=
ds it.
> +
> +   In typical IPE deployments, this is not a concern because files prote=
cted
> +   by dm-verity or fs-verity are effectively read-only and cannot be mod=
ified.
> +   However, OverlayFS presents a special case: when the lower layer is
> +   dm-verity protected (read-only) but the upper layer is writable, an
> +   attacker with write access can trigger a copy-up operation after the
> +   ``AT_EXECVE_CHECK`` returns, causing subsequent ``read()`` calls to r=
eturn
> +   content from the unprotected upper layer instead of the verified lowe=
r layer.
> +
> +   To mitigate this issue on OverlayFS:
> +
> +   -  Mount the overlay as read-only, or restrict write access to the up=
per
> +      layer.
> +   -  Interpreters may use ``mmap()`` instead of ``read()`` to obtain sc=
ript
> +      contents. Currently, OverlayFS fixes the underlying real file refe=
rence
> +      at ``open()`` time for mmap operations, so mmap will continue to a=
ccess
> +      the original lower layer file even after a copy-up. However, this
> +      behavior is an implementation detail of OverlayFS and is not guara=
nteed
> +      to remain stable across kernel versions. Do not rely on this as a
> +      security guarantee.
> +
>  Threat Model
>  ------------
>
> @@ -833,3 +861,7 @@ A:
>                       kernel's fsverity support; IPE does not impose any
>                       restrictions on the digest algorithm itself;
>                       thus, this list may be out of date.
> +
> +.. [#atacexecvecheck_toctou] See the O_DENY_WRITE RFC discussion for det=
ails on
> +                             this TOCTOU issue:
> +                             https://lore.kernel.org/all/20250822170800.=
2116980-1-mic@digikod.net/
> --
> 2.52.0
>
