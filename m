Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73873BED77
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 12:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650356; cv=none; b=jUfg91V6hMKTOqi789JMQUzUG88RaECvc6krehmX6ebyW4KALbXoZoaWnxwvwZ31DcW50ot6q+jsMBi+DAa/rpzB4/BwUQ3wvl0irbHz2Vb8MquM+UUWacpUfMBYFkk04cihvNPV+tUT0eGElAGzGyYFxwJTde4vmu+AaDn2HfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650356; c=relaxed/simple;
	bh=8scfsOfxjJCA7PsheVSzcMVVAN4HZJ5wygd7fo905BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDRqYSZVXY4EyeNTBFLRE8M5YORnVTcLwFiUJQs80FQxVjG6xSUcQw4KhoaBBLfXMG2HeRrVLDVCaGcUlEHALuUiwrzvim33BMLuSe7jkBpmasPEyjxG1ugua4hDwM55cIvRoYKXv3agNnJvxVDOgTAZoeS9l+iBzTymo97cRmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50d59d249fbso64194621cf.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2026 05:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650353; x=1776255153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGRbYznGbDw7bAVfW0akDmACi6u2DoC61pG2AP+p98k=;
        b=ZmbbEdIwNl1nxzfPzoMpGza/AB1y/3DFd5fl+SWArcPm06iIbhrG8ZT3qtWdKf7qUe
         nFKwivER3JfWvjjTIyxhDMF/tdfYHUmgj38Gfet7jZXoBPFpJOwpjh78/O/6t1Dn75vU
         FVjcDuLmmQBEdE83CervOwyU50LwxSRRn+vCXjqmZMbK/RVPoG3uUu91rrX5KgKJr8wG
         TfAVDG0vbw+e1OMhyqarJBxGbtTzXSojc/Xal5XRVVpb255esqXfcAJvKmg/qqkcWZgE
         1nkswQ+X/rNFdeJ1XRZWas2F82TodJ7Df7LUPCNsYyA313fiuQ1AMmtm3Hw0y2eAtEN1
         qfnw==
X-Forwarded-Encrypted: i=1; AJvYcCUwTPq26w6quxhoz0RlhDj61lPAgA3dgd0/tUsLwdjyqncXvogWOqUnMv+z8p8CTzLAS7JIgGPkG+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIf62c7pdYVvRowpgX80X8XN4p/DyVuGM3wLS8OgToCxpoFRWi
	VDPeyvNuyXKAmXFb/2pwUVCEpYPSambQMfbABF9SycWd+Xi3v2tL8kpkk8VU8w==
X-Gm-Gg: AeBDievTAWedSLMFw03POS+j7B3+hxIhz8jYpkj0AkjpVwJ9v7olhRuGzewnuYiY51c
	nvCvMJmMIvaTBhgO6iMApD3rAoWYXhDQB9lVRIU2Vmu0qtHrkMobEtRnkSAsq6wD6EUMUYr/nQ2
	Yg0ur1ixKTAD6Efpp+MDUvV3AV0H2HgjmwnhKvgIOES4qeoHTiUO6Tmmq3jSO7rD8XD0IJmvWtN
	ESh070pkcciEN2ZloRzZ4/KVBqdNTHTv2d1bmn0Nh2oGc1PbPZpItjTdBqHLeGcsIgI+W8AT/Ac
	OEgTHIbDY0VKs3Sb0OPGLuEj3XuheNdLv1Yc55DljsW0lDsMPM2VpgMsxcmClES+c2Evvxl4SA3
	6dnZGdg5HAh9ACS5ENTxih4xOU6upAgQgW7wpB6gEM+a478Uaawf67PNZGLo+XldbC3laCfX3fc
	F9fhDSrHmwc7UaBpDDgx3T9mvDrIVzK5hReCc5B0Usdcvz0yACGurhNCTfAWKX
X-Received: by 2002:a05:622a:4d0a:b0:50d:a644:699d with SMTP id d75a77b69052e-50da644706bmr89970511cf.46.1775650353455;
        Wed, 08 Apr 2026 05:12:33 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b8d0904sm159383841cf.29.2026.04.08.05.12.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:12:33 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89f68634786so75363226d6.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2026 05:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXB29u2s94wHNG2Y7mZEA3rUoIG3JEJ7LIOzS2+rw3sZeBBZtvF6iTtkP6k0ZyfBcpNsq7i7PnVS5E=@vger.kernel.org
X-Received: by 2002:a05:6122:3784:b0:56d:92dd:a0ad with SMTP id
 71dfb90a1353d-56daba970e8mr8020585e0c.15.1775649953503; Wed, 08 Apr 2026
 05:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
 <abZTg9ZwnE5J4qXa@laps>
In-Reply-To: <abZTg9ZwnE5J4qXa@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 14:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
X-Gm-Features: AQROBzA3VNDAkN7JQ2RBFKXcNeNTnnQqU_cNeGRDhYiY7nC0FR4lVKTSqS90qsM
Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge <jake@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Askar Safin <safinaskar@zohomail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 15 Mar 2026 at 07:36, Sasha Levin <sashal@kernel.org> wrote:
> On Sat, Mar 14, 2026 at 11:18:22AM -0700, Jakub Kicinski wrote:
> >On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> >> This enables static analysis tools to verify userspace API usage at compile
> >> time, test generation based on formal specifications, consistent error handling
> >> validation, automated documentation generation, and formal verification of
> >> kernel interfaces.
> >
> >Could you give some examples? We have machine readable descriptions for
> >Netlink interfaces, we approached syzbot folks and they did not really
> >seem to care for those.
>
> Once the API is in a machine-readable format, we can write formatters to
> output whatever downstream tools need. The kapi tool in the series
> already ships with plain text, JSON, and RST formatters, and adding new
> output formats is straightforward. We don't need to convince the
> syzkaller folks to consume our specs, we can just output them in a
> format that syzkaller already understands.
>
> For example, I have a syzlang formatter that produces the following
> from the sys_read spec in this series:
>
>    # --- read ---
>    # Read data from a file descriptor
>    #
>    # @context process, sleepable
>    #
>    # @capability CAP_DAC_OVERRIDE: Bypass discretionary access control on read permission
>    # @capability CAP_DAC_READ_SEARCH: Bypass read permission checks on regular files
>    #
>    # @error EPERM (-1): Returned by fanotify permission events...
>    # @error EINTR (-4): The call was interrupted by a signal before any data was read.
>    # @error EIO (-5): A low-level I/O error occurred.
>    # @error EBADF (-9): fd is not a valid file descriptor, or fd was not opened for reading.
>    # @error EAGAIN (-11): O_NONBLOCK set and read would block.
>    # @error EACCES (-13): LSM denied the read operation via security_file_permission().
>    # @error EFAULT (-14): buf points outside the accessible address space.
>    # @error EISDIR (-21): fd refers to a directory.
>    # @error EINVAL (-22): fd not suitable for reading, O_DIRECT misaligned, count negative...
>    # @error ENODATA (-61): Data not available in cache...
>    # @error EOVERFLOW (-75): File position plus count would exceed LLONG_MAX.
>    # @error EOPNOTSUPP (-95): Read not supported for this file type...
>    # @error ENOBUFS (-105): Buffer too small for complete notification...

The actual E-values are positive, so I guess you want e.g. -EPERM?

Note that the actual errno values are architecture-specific.
E.g. EOPNOTSUPP can be 45, 95, 122, or 223.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
