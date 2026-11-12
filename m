Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499201;
	b=BYqEBifM8IiuJ69luU8B9IwvKxLT3nOM0EGB2bXYuSw+ekeF3ekrlgfkyyajUlYGEY1L
	 NaYdD/AyzaxKsw3RdDyPyRDaZ7lgHXWReOyUzbnY/1NCrbX/+DAV4zZYbk/tmBcKDOq43
	 GeOjcXuIbIQV40XiKdSm0o2u5REZrzMPqvnjmuU3AWrXnoM6OejCRkrVCQxIMmzTNSeuA
	 sDTzejdSxYuEaGjGJCstVkTjeaHj89ZBeAcfVg/zGMHn3DlujZncNqo8UckeapiwXq05R
	 8mDNHUDXFdNQPCuknf5wyk735Plk44E1j6J2SR7IE8WeluXb8jTRZhAL1aulJqbBztg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
	b=bu2GdnANbJq2BlxKOLSIQtdQ9UUwPWVHCSpXsIxXl/jIlh24LJKyJJgkfemnu5uFgOJc
	 l/KdOd53wECg7GZ60RkQNgeP+3qLXGsYiqoDnAkLK6GhQ1xZ+oLu+rMZxDIiBY1yzFn+z
	 RJHgFOhyFUtgWoQn+sxuCJkV0Pc3fFZRXJwqwXoL6Xv7FGXbKvbI6PN5cFlMqKPCyBPo/
	 37+XiiGQxeMu+354UCbHPvzrNWrVvf+nbgU5LIN7iexgWJHKr1X9zqD/IX3R+og7E9URu
	 CYwFWRo6l17NajHNJotMrcdXG7wwsTBDncbcOi/8riiIPKlwA/akYH3uMS/i0nsn7Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VNq/TS9Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A17E606A330
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A17E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNq/TS9Y
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a208d93758so47556735e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499199; cv=none;
        d=google.com; s=arc-20260327;
        b=MIpQO5O3yDaB4ymHIUDyRI0inbY2r777UGBQxRFI8b69OEk+BJxrxR/jeYPRBjLrla
         Ds2en82avU9v9nPT+da221y1guKN2YKX/9qO+uZaQrXpZk3hFXIsgpvDhf3ppUWJwA3/
         xgQAjIrXfTuO0bbzmmwJVS8wm49iKIHS2Ijrv9zgUB68NR7MS4ECwR+nZxIVj9nYG3Wf
         0ulQfE/6eZYWsfjwBZJ9CmMj7IaCzHO6ZJ0LwZUwooY+Qe/I80smH8uwcbVATWeWxsWu
         pwNg/XEWvTBFbcL0Ko2MzyY75HSS+eioBstfiC68Tac7nf8uOTecmHt3OFBx4n8L6Si5
         Dtjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        fh=5L05hRMNy6qKqDYX6Vuztizf19ZjubSN7jqh9Bjlz5o=;
        b=d9opEGnR4G3Dzi8ZLcg4xeIEunpUyTkjH9ShJkeGtrhX5KYZ7VV5yDO5pDI90yq47A
         juT+i0QwREQP3paRx9V9UwWrSJ+XLjJBEL9fmB4+Pe3s97oY5zX3OwZL+intyjD8awEt
         L8JemffcsziAx/foUtESAnF99VurW04KRDA+ib9/5lV1txmGQ0ytrt+ET6/P06ZpsUwB
         5UzgV060uFe1EiqUbLu3K5efwE1J+osX1YVeuZueYuYq2E/zvI++jQGKqx4pbL4fTBML
         ruZPb6rBZFuM9+Bl6pC/noX75GDGGs3cZ2h/HP4ZefsKR8C2/H+PQ6AIDa4Pg/DvX1IA
         uMVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499199; x=1795103999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        b=VNq/TS9YxMxpbxP3+3LmkMowYv8beN+AZb3BYPOxmeYCeq9+wN7D+1Kyz71UyEdZF4
         IkvZSUOob95mNXALzE8xn3UgGVvP1eilHuH2U+u79e5E6ebphwRqn0mF6VRmKlKbGuJV
         tX0doJRuOkq2kcmCTLV6p8qoCbmNRJKe+nDaeE5VHBDXVlMDcguz4kusAP5WttG8yNL9
         3VO7sjdZKkPWklzSyO1jeUoz0ev96lP1NhlgObkTjbJ0pR8NLBKYy+7KOmYJ4U2CmPlt
         2g4GlHdLb9s+LAr08FGs3b8IRKIIoVRwlbqGIrwvA4w3PCfbmNbrUIrHWx1ydZ4pSl2y
         z6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499199; x=1795103999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        b=BKPDsGZMkn0jUQ1HKxVxQUpXm5SyyiErrFG3RW2RQa77Km89Txrt9070/Y5CLlflmp
         R+n67oUtJJtYQYM02M79FbQNwhUz4RVsad6hGt9C+zamExrDbmn8W55FaM9EYtse1Fo0
         +EGj1I6l30QVpcFcubbRsueYBabdslILDLO3JSAeggGIemK+cgxqXHwXXZmpsakGdV93
         KZX/hSKbqxsS/DrPGaTRRHJmxMRWOwNbmayuJURkjFb9n5fXoduSIEWaUoJlSzqLvBfP
         UWbL0x5L3xKU+I8/fILhvXKX9Ex5WhiGXOY+cSMqoE+DQUsV4cs3bCM8fP7r8VoXlSjU
         E29g==
X-Forwarded-Encrypted: i=1; AL+hErHsWBg9B7/M6xBzqpi7p6M7r/xi9Z0vpz3i+nxcUX0ZtnVloZcipQki2D6Pw0B2l24ZJqpJmI6YYhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uLAzoWXPQzTFhhX16yqftgqB+JFIv9W9PgIQ7xoAQ7giGsChB
	S26MVB1h5YLI6iVXW54wJjQLJVShqV1VSXrNxQ5iHjYtT9iT/Ts9fiDmQAgsc5s3LVqSNDgEQbt
	9uShn40Nx4PqUtiuPmLGbrQM/lOql/Z4=
X-Gm-Gg: AYBFou1EOI/iYfrgXMm0D4EtPFtvmi863Y2dBRphnvlwNPqilg5Z3WWXF5kDL1y6ZDa
	m5xf2OYHkiq0TkMXcWreFb9XX2ZQpfK60wUwaEmxGFgUxgRJJBV3P2tELRTWjZS925LNcT65Zm8
	HjbJpGQfq68huTf8NsAap/3In19yN0k6yp4M152xar246+3QX45jsCICkAtipM+xKD8Us/WsnGL
	FVlfsSWqJREA3Yk1M9xi5b10Ji0xqJNlC0tF8KUixymrssf9UBrU4Vyn/AWQKhMkvlxlDUqN77D
	ZAkkBLItemkl6R2Q3In8lOGPgiFHOUejue9xxYKpCAx8MMonP0RHxl6B7ooZCU6oV/X5V+XYKan
	AI/1y1tfnc1fQD+EAknpgm3ey2k4BxpF42/W8SoIao6yhJYL1gcJTS/ERPs6kKDJ3rzacZg==
X-Received: by 2002:a05:600c:e558:20b0:4bb:4b30:8042 with SMTP id
 5b1f17b1804b1-4bb4b308088mr61967275e9.19.1794499199056; Thu, 12 Nov 2026
 07:59:59 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-11-kunwu.chan@gmail.com> <83463788-5e18-4932-99c9-4cbf4148a213@paulmck-laptop>
In-Reply-To: <83463788-5e18-4932-99c9-4cbf4148a213@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 23:59:47 +0800
X-Gm-Features: AclHuK-mTFCsu5EzH21jY8YFD-8az2xhySVKCOowInql9XH_2VCFG8c3gHLmBa8
Message-ID: <CAN_Opa-bdkVQWNHm1N7Kk-sD36SM8Z99odPkCTngcnkWwU8tpw@mail.gmail.com>
Subject: Re: [PATCH 10/28] hazptrtorture: Add 128- and 256-CPU configs
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:35=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:28AM +0800, Kunwu Chan wrote:
> > Add CPU128 and CPU256 configs for hazptr-stack torture testing.
> > These configs exercise the shared-scan path at larger CPU counts.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> For these, why not instead add '--kconfig "CONFIG_NR_CPUS=3D128"' to a
> run in torture.sh?  Ditto for 256 CPUs.  These will override the values
> given in the hazptr Kconfig files.
>

Hi Paul,

Agreed. I added these to keep the 128- and 256-CPU cases explicit
and repeatable, but the configurations duplicate PREEMPT. I'll
drop the separate configs and retain the cases as scripted PREEMPT
runs using --cpus N and --kconfig "CONFIG_NR_CPUS=3DN".

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > Acked-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
> >  .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
> >  4 files changed, 34 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU128
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU128.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU256
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU256.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b=
/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
> > new file mode 100644
> > index 000000000000..079b463607e8
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D128
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.b=
oot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
> > new file mode 100644
> > index 000000000000..1d09a6446080
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b=
/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
> > new file mode 100644
> > index 000000000000..b00a984977f3
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D256
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.b=
oot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
> > new file mode 100644
> > index 000000000000..1d09a6446080
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > --
> > 2.43.0
> >
