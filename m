Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793060150;
	b=rGOSztGHTAh+t/N2NwZb4B6KpBWYOt+ckN7AfppIN92coGQ2wY66GzAqfLKyKsYlIYnM
	 yQcI1sEzcHe7LiRouePQmG3NUkxz+lx2QKdNmEzBg736ngI0CIo8nJfTSB1PgwyqEB6aE
	 YSs0l52lmw7YO5d6SydbpY0KuSIMQ8HUGFpE0ssUabcP7w3hl7HvWztc5ZeYYcrKq157S
	 yRAz3ovl1MHJs+hGnR4kDAEZvEsmY2xLr+evbrqZ4vEIjnC/hpKWT9tZ9Gy0QmTAhMxLH
	 Xm1O4h/PGT3dsGqjQzmrpffduy22mSDttSsZ3FsD9pNSyyt+yYLNod3vJ6/yzJE/6eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
	b=sFpMb88dMluTkJ7XyXwKWcyhcN6PW2medYIQyOZBetG9RKFOHYmyE/g5Juaa1qm+zGgz
	 CxvdIuzBzsVguYfZ+qGOZbjXv32dtZJis7jI8QlbQxmojm62MgIDlZiFUj+0rLH8xgQ1t
	 wbB+T5mRq6thRBaM7w4VH7//ZffxDnErZTgMu7I+6FjVhc7+94tEw7WJnZQKQ+gECbBnj
	 401QuCecC7yuEYKSV/1sZ/IoafumjT252Y+WzkXFArA3giQSDwjgGydBuvj7Dr+7WDbFa
	 VTRgT+Lt2X2mCc6QuQ/qef4dRtRLd3n/NQG81an54xfd3xm8fNBM7Y6IO2+/yd4M2Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0Wfg3DQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78D606A32A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F78D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0Wfg3DQ
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8aea7b7ca0cso29153347b3.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 17:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793060148; cv=none;
        d=google.com; s=arc-20260327;
        b=LtBFAMOWLigUbKhQlxDmQGxr1GbYJ4vULWXxRHhTLyEkJ0WjTdyyzwTcwiHPX/848F
         8suVGdLag85/wRTGMXWg7nRXuM5DGe7kLDTVndbAnezyLHY6kKNGHnYq7NS+T1JbN9+5
         KrpEsWid1Ej8Mxl23vxNzzAbhAZvY/Ggk+LkeqdGoWPMK9C8hgd23ERV/g+EGSygPU93
         /AQlkvja8CsaNErdDtqH2AJD/uLo0nDZ4m/N9+vCTPnZKwiwdByJRw21N9pwTPVKQQJ7
         WrDC5WkbTuzhf0fxd4ka9Z+BA9jAs/VG+VEwKHKrXDvV0izmF7+zS0mBjKXcrySzD7re
         YtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
        fh=ZfyGkKHZ2svi+kVJbQp1oh1N2rzGdE5b9Pvx4nVybeg=;
        b=L4NRmMOU7OE4qfpiSEI5wlEpvBr54zjOQJrikVWflV5CBdhmH7cy4cAUgIuP0Vjjjs
         GkGDn8lVdQwlpj9lIQgT+6q1CQjBb7y79kYRhtyPc4atPob0Jn3zz0Ik0zXsF/hcJf0v
         19oSgVRXlNCG5Vo6Z2eQ4K4DBPRv4ljdwL2/LJm3G7eHMXkchPDszGFsM20bg0pMTqiE
         JeLmMGggUM4O/VccjcaHLPN3pN5ttPFQs+Rhq03j09jmb3xodBM4+pBt3ts+xvJfumLn
         CuAqPmiAIFwZGvqoFDe7bKx6cfyeJw0X96GWl6x3XR9ChmNps+qDW0So3S9wiuLoqIVY
         kn9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060148; x=1793664948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
        b=s0Wfg3DQSfdPBtgTrPJ7hEq4HUweU0fxNhhrERYXULKUVGjvojByBZj8KKVt7nRxU+
         qfuMSheIJo5HVMHmH35pJ0m4FosgwDQvoFqO6hWdyPRkiWPWjpgGD4+44lYarYwcj4p9
         lwGrCp9TiIJ7Y9Q7o3VLX5IDHtJph2ZfYWK9hb7nwFZcN/EGzSOwKwJdiqW4e4tKM19a
         TwcHswoqbtz3QUq2JqUArNS2ontBIM0U5Az1Xxt/qvNOY6jlotL5RVH54V4eQYaO9/UJ
         cfXBJNeZLYP/7FfHZRk1FnPXiW2XAqkAAz+W61A369XeoogwEs/6FcBTuT08s5U96hTP
         UsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060148; x=1793664948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKeQmKdHS147YBCUhe6/TQHxqYO/kgxJinnL8fZRSJA=;
        b=BssTPrSpne/c6AUWLZspS11jTZwjXvrv4XJAGZkvWcSDKiGtXw9NrbIa2OgNQyjwmq
         Z+D96s9nd169YrBRHpYlBFzmbok7OxeqNl3Q5MFkRIDMoF3CSLRVvrnGWpiH6eDWYkFg
         eHw2jqvEtiheLo8jl0VLww7cFAaObp2AajOvR25wq/eyxQmFAMPGBCMVOx/Es+VTN6h5
         c63Nnq/GEhM2UBw3IX6wvBwp1CVkDDUvyOwUEhuliurCWzjtGdoUMDRz9kut8+yZtMQM
         +lA+hPQh2uREKegqy64omBNEFWo64jjopGVD0im1XyDE2tYIsbV67a/c8yXOVgmdFINK
         tReg==
X-Forwarded-Encrypted: i=1; AKwUvBxezy9DhiY/ljZzQApuvwE9xa6ZPli5fU/TjiiJuuJyNqh08gPQWQj11RbLFKpFqMlb9SUUPanuFfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/mzgYISpWmAPt7Sq9gjpisEDcjmOWykDsxfvTEhy31qdC6Nnf
	fsdkQ31muLdkjL5GkRJZAAuhENFmAR8Ua0I4Lgz0MTToA1rq7DPUEftnDlc7I30BY6WoD8rHx/t
	pZxI7Go7MFvicrwDJuCSm9+gL0PcOFjbRxavb
X-Gm-Gg: AYBFou3Mlf0Jbq4FW30hH2YKszg7OSzGsui3xedFBL4ojiOrHcMulHqDyhPOgEWP1SO
	dtUv4l6Zjk8HmsG2lcLDvBvqUrdqgNhHL/QVE/4CwVDIieuNwHAPg4rxEeNZN4oR9tD4UeidB6+
	CQsxMkjSMTnoNEtst2gDraLck/SnLRjkGnaegZ/qTrDQ9zwLeEt18zFy8TYm2l42Uvnii4jVSaJ
	RFnWUF0gee2HJS1JxqOU8q1G/H/OUbq1nlQYCqGyambV8Qv0NFoAxV+Z2Kq91Hrx4VBkT5ebkTd
	bEabbFCU2ebPROa4p6xgB4ljrQ30dePdLkVBJkGMNUFPgh4hJuA4up/VcPzLbNVOHXhck8Q5suG
	PSWqq7QE6hOAtDb9/rdgbpPcuHA7gGEEeF8gPlFXocagjUip4M+fA3jr97eYRt+N4YbbuqGu39m
	XD0LcOrh1xTX57Rjs=
X-Received: by 2002:a05:690e:150f:b0:679:c803:98d1 with SMTP id
 956f58d0204a3-67a45496c6cmr4080476d50.152.1793060148265; Mon, 26 Oct 2026
 17:15:48 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com> <as4W9hToBqAvbzJ-@pathway.suse.cz>
In-Reply-To: <as4W9hToBqAvbzJ-@pathway.suse.cz>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 18:15:21 -0600
X-Gm-Features: AclHuK9LH_u23sCYiYKMz0I-9md-phfbwb6JA9KZbhXjHlVRGYmTapsg8H2JBYc
Message-ID: <CAJfuBxw-cq3AYXKZ07Y3732tDM-NYxt+rs8Fz6S=P7+1TF5WNA@mail.gmail.com>
Subject: Re: [PATCH v12 33/40] dyndbg: Ignore additional arguments from pr_fmt
To: Petr Mladek <pmladek@suse.com>
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
	Philipp Hahn <phahn-oss@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 5:33=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote:
> > From: Philipp Hahn <phahn-oss@avm.de>
> >
> > pr_fmt can be used to add a common prefix to any output from a module:
> >       #define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> >
> > But adding additional arguments breaks dynamic debug:
> > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 arguments, =
but takes just 3
> > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > |                                                  ^
> > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)       \
> > > |
> > > error: =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA_CLS=E2=80=99 undeclared=
 (first use in this function)
> > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT=
, fmt)
> > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> I wonder what this error about undeclared macro means.
>
> > > note: in expansion of macro =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA=E2=
=80=99
> > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));    =
     \
> > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > note: in expansion of macro =E2=80=98pr_debug_ratelimited=E2=80=99
> > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > |         ^~~~~~~~~~~~~~~~~~~~
> >
> > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to slurp
> > any additional argument, which `pr_fmt` might add.
> >
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor=
,
> >               dump_stack();                                   \
> >  }
> >
> > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)    \
> > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)       \
> >       static struct _ddebug  __aligned(8)                     \
> >       __section("__dyndbg_descs") name =3D {                    \
> >               .modname =3D KBUILD_MODNAME,                      \
> > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > index f594c1266bfd..5d701952e739 100644
> > --- a/include/linux/printk.h
> > +++ b/include/linux/printk.h
> > @@ -742,7 +742,7 @@ do {                                               =
                       \
> >       static DEFINE_RATELIMIT_STATE(_rs,                              \
> >                                     DEFAULT_RATELIMIT_INTERVAL,       \
> >                                     DEFAULT_RATELIMIT_BURST);         \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));         \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);         \
>
> IMHO, this changes the existing behavior. The prefix added by
> pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> Is this intentional, please?
>

yes, its intentional.

515a9adce0f0 ("include/linux/printk.h: include pr_fmt in pr_debug_ratelimit=
ed")
added pr-fmt to both the METADATA macro call, and to the printk() just belo=
w it.
The commit-msg was clearly about adding it to the __dynamic_pr_debug() itse=
lf,
the METADATA addition was overzealous.

Removing it brings pr_debug_ratelimited() into conformance with the other
*_pr_debug_* calls:
    dynamic_pr_debug, dev_dbg_ratelimited, net_dbg_ratelimited.

and as you noted, this makes the ... variadic unnecessary.

Ive added the Fixes: tag accordingly.

thanks for the review & pushback.
and apologies for the delay, I picked up a FLU shortly after sending v12.




> Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
>
> By other words, we newly pass just the format "fmt" without the parametes=
.
> The 4th parameter was added by pr_fmt().
>
>
> IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> BEFINE_DYNAMIC_DEBUG_METADATA() and
> DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> to accept var args. I would expect something like:
>
> #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)  \
> ...
>
> #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)           \
>         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt,=
 ##__VA_ARGS__)
>
>
> or maybe, we could "eat" the extra parameters in
> DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> DEFINE_DYNAMIC_DEBUG_METADATA(), aka
>
> #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)           \
>         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
>
>
> Or do I miss something, please?
>
> It is possible that the macros work another way. Or this depends
> on another change. I checked only this patch...
>
> Best Regards,
> Petr
>
> PS: I was curious what Sashiko says about this change and it seems
>     that it does not review this patchset from some reasons.

I checked shortly after sending, it was "embargoed" for 24 hrs,
perhaps cuz it was so soon after rc7

>
> >       if (DYNAMIC_DEBUG_BRANCH(descriptor) &&                         \
> >           __ratelimit(&_rs))                                          \
> >               __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS_=
_);    \
