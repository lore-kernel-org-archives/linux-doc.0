Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496999;
	b=2g1XmM3ey2EsIUnLomwRJ6LrtA54Mk+OAu0jyXWxClkKnZIwfAPGz3H1UqDFcUX/Eejb
	 SltC3I5vlsg1r+Yj2FPMkoL681JYvB58uuy/pgRe7A1FkjoiguUadJwS/4puRlOZmssgJ
	 6Kt444PIgjsz3XOmZj+G6STu7vOXracFv4VDbRPfnJng+wjPqBKzbESg1pt1TfFNSLwmF
	 5G6ko4C29WyR18I3BkCMGXspwDJ36dPhlXsn681Cq1DiMC/5O0knRFymbVLue1Q3koUXO
	 UAQF9/9BIIXn+h1AYyfSHorsAjEa+z3Mtj0fujSYadQee6keI3Z8iBuQ6Q7K/ucxdeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
	b=CcIHO6iBosDWcs1wczPnoc++7xqYdTZTxnlHz+rs+51UscBX59rLXp1+9yhp4i9HU5sv
	 ypGdFXxFmoaZEUezLnu5cLQYRiWbsxd7nZ66bWhFhRhMOABWPtIFvbXycz6krkMToXBnB
	 Ll7NF7pXMvHgIfNNnxN2KNtauZr6AiqgrLhuj4GV6rBWtJcJhvJ2vPE0tYGtN3A9J9SiS
	 ZeWyY4sssp0fLQbBEZSZsuV/DBn/1/NFm8KmKL7H4SIvo77lPP+BUbgkgx3vvcK/C97CN
	 sfvqlEgtHhzhi+TUWxiOai9nNx2zbye2UCV9HaGRZRipaOOr3Ri/igoqmpcvcm3vGoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdHySA5y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139860A2607
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 15:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C139860A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdHySA5y
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so47159905e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 07:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496997; cv=none;
        d=google.com; s=arc-20260327;
        b=sYm5cz4cAOHX5mXT/RxUIgh40/QXGT4EHg9z5shFVBKZsMDOqpXbnoXtyOG2pNFiW0
         1qZ986FGxeJyVCv3A/tcCLodmr2dP7b9uSGgnNjMcTrewda5N249KvZsLt0bpS8F3fFR
         55VcdIjt+qKnMdfvym0pWwl6ox9KsfDG2815OOiLuWLQwxlUKC+ko8Rn+eCwu+cPtLMG
         qLXM1jsMP+BLaBQv7VQQOXrO8YcPzTCDilMwotC2+uFElPQr9ZzqjmD5LlbxvS6qunBR
         0dmsdxb7/zUzQzDZW17QfL3qvo0EKnxRKxlGnSJHfFFeNUvVMZcvVYl3JvwhER7ly+C0
         YlXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        fh=YuE+xj+2G6Hj76v/u5N80Jo/j7QJQZU910TG9f+OSW4=;
        b=AhmD+1UUgVTs3qP/SJZo4erYpd+2tcw4INK+0NkPKWGsW4lxvDeyH6VO6rPLWF9LHs
         b3gFmS2nSNu0JtIcYF8kBD2soflw2oVjfrIiet1zuOvs/DsdSupWYZqQwh7n4hF2m/TD
         GHVh1EQbZ5daIPF6lczGzNH9bv5DOukmQ/gOljLzeFhKLwQS20vhujjQzdzndL5J4VJL
         O6HXnPvOI7ppa6RJX5fKsH9i3MaACU8TlufwNbc9t5je/+YnLEblQoZ4nFGSDhbiB+QL
         +hwKosoMVFeKdIb7OspvR+lPGWs34bLastmeroflC761anP0faMovHzcF20qHPfwz10t
         5O5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496997; x=1795101797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=xdHySA5yJr8R3v1bJTdVJvaIGdetLFfLzfjuM+o7syK/yGeAzwWzFMxbWd/Ct+6rMK
         MVANAOQwCJNG35jAUcUyz4qb96VvSdxfmtWqtOhL07JUGI5YDqKmQrWanxsYe0RUh4zA
         h/f/rDCpmTn4mbz57neFPhvuuBN/Tq6CJYzLaR1BKKzGinJoy41is6MxKy1i9f9xSrkJ
         Eh+N8FqElCwLLQdbDMED3VH/oMYEJIZfp3JDX38AozVHqv61qQEQ8tJnfedJbuyUQKf3
         2G72UmsyJWQGEErAwHvQG+tY7G0eeC/0puJ2E95E1nXfJyAsX9FNegJ6m2ZoHeIHGgXM
         AMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496997; x=1795101797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=xH8QcWBSYquiGh72zzhM6lJKq40k8BVSV4t5yRe3BsnDPmj9c7PpuKkfKAPlpvUjBq
         1sngLJlHPDbc21/F2fA7VFHSOPwyj2Pf5O6/PcnabVO45cx/buYeo0ZoCFxsiNxQYQ/o
         qeI6sW9ut4DH+RjxLm8HZnrqZPEMAtlhdbF05DAYX03AweH403QPoCvLiAnasgVr4Imp
         nJ9m5FEWPaXRJGznWKkLbcd7dFmm8ySWv4iRRXUOi1LgcFdA2teRh3nUX2+gDXPMuQ2X
         nRjxXk9nn20aKlsuRvW+4eaivKgaQVY1YIvC1jDph9/cnQTwALpEIybGXpeMSyXSjhmv
         Ir0A==
X-Forwarded-Encrypted: i=1; AL+hErGLNQeSjsn0A41PgRyyv+8WNepjuOblwvzNSxJ4xs4mZIJfCS4n50pbzgPp5yQF15gobN7inkTgTW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jXEFl68gl4bIcGuvucWjcv/CSIoQVYV4fEwNL+nzWyz2AHAon
	JpsFeAOoPJ9K1dmXU5m3OVvuzTiJuN4Ycmu7GfBxX8Xzrk0hjz2uKGbLfvZz1pF2Z4/pJFZV4aL
	HFSxGpg+UUVpkLS7CggSGPNIiyibCW6k=
X-Gm-Gg: AYBFou1GNMEfalAEIDyAiC0dxaoZV9z1MzNdq6xCW3ZVzdcuMGp8q78M/ZZMgdXYnvg
	jtLfMQTsPEG16J09FOfTWh+iBiaLb4SxhSfhNqneAOzyYRYP8rNQUd6sLYLplZjGsf1k9BL4vMv
	DkLZHdk6JUnTrf0KxJzE7YxFUNzus5YyuQk8zQb8I8ovMwUi8fU9rMHYWATG1+3SopIZQSheW5A
	M6iP0eVktnG9z6w07fZ5TsCDqVP6f6JNn/NK/M6a66y7vxum9/jdwRrAor1NPpFcI1D6u4+nlKi
	ronecKKcK7wcfVVK4VgplCclwnfKaLAi2aqY3hzRAR7rI0ZQ2Rd+B8lxTnkA43NrH1h32At8ojz
	Ue2B4ltyXXKQtHxNxFWdaV3fOeUW6YfGAhXL7oMgk+7oc2FJqQynzItzXxXcUffZdlJ0UxMog+x
	xy0eb2p3PooVZzkCor
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7ced with SMTP id
 5b1f17b1804b1-4ba0937a886mr110753845e9.17.1794496996738; Thu, 12 Nov 2026
 07:23:16 -0800 (PST)
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
 <20261104165504.2430480-27-kunwu.chan@gmail.com> <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
In-Reply-To: <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 23:23:05 +0800
X-Gm-Features: AclHuK-Vxw-TWlfdg2rnJncie6E1-Z5rOKezLCml8xvtMgG1OEVJSy5iWLiq3yg
Message-ID: <CAN_Opa8-macEL323Tw3JUai3ETmq0CCt93ddCZ+Xqd1RF1Q5nA@mail.gmail.com>
Subject: Re: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for
 rcuscale coexistence
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

On Wed, Nov 11, 2026 at 5:31=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:44AM +0800, Kunwu Chan wrote:
> > When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
> > the same kernel, hazptrtorture calls torture_init_begin() first
> > and rcuscale fails with -EBUSY.  torture_type=3Dnone makes
> > hazptrtorture return early without registering, allowing the
> > rcuscale hazptr scale type to run in the same boot.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>

 Thanks Paul for the detailed reply.

> You are only supposed to build one of them into the kernel at a time,
> so the intent of the torture_init_begin() failure paths is to enforce
> this rule.  If you want to run both in the same kernel, the way to do
> that is to build both as kernel modules, then do modprobe and then rmmod
> of the first one, followed by modprobe and rmmod of the second one.
>
> So please help me out here.  Why do we need to allow both rcuscale and
> hazptrtorture to be built into the same kernel?
>

You're right. I had incorrectly made rcuscale's hazptr scale ops
depend on CONFIG_HAZPTR_TORTURE_TEST.
That led me to enable both tests in the same kernel and add
torture_type=3Dnone to keep hazptrtorture from registering.

> If your desire is simply better handling of an error condition, an
> alternative is to force either a Kconfig or build failure when more than
> one of the modules invoking torture_init_begin() is built into the same
> kernel at the same time.
>

The hazptr core is available independently, so that dependency is
unnecessary. I'll remove the guard from patch 23, leave
HAZPTR_TORTURE_TEST disabled in the rcuscale configuration, and
drop the torture_type=3Dnone workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
> >  .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
 b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > new file mode 100644
> > index 000000000000..c5e9cf0184ae
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > @@ -0,0 +1,13 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D128
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_TORTURE_TEST=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > +CONFIG_HAZPTR_STALL_DETECTOR=3Dy
> > +CONFIG_HAZPTR_STALL_TIMEOUT=3D1000
> > +CONFIG_HAZPTR_DRAIN_ASSIST=3Dy
> > +CONFIG_RCU_SCALE_TEST=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > new file mode 100644
> > index 000000000000..e9cca4cf453b
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dnone
> > --
> > 2.43.0
> >
