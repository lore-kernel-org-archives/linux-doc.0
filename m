Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795481693;
	b=uEqVgbik/4vAq2quZqouDaHoj9D+gHP0Hgzf4yo6t/FdBlNWArCWiWUg4bQ8DSJf2jOp
	 hJeZPJHsJ8uo/zWTb+Lpno1S8AdPqOt5Tm9xwTEpXFkNRj2ahZ5RKgSzHLA/dyF06NhVt
	 punFoXEQwQU2LQo76SDJ+02F2ymgGBUfFMmMVCjIeEJlruLRo28ZTBb1RkljyA41gc7jn
	 uC8LkZr5n4AT81+giFXgmf7WfyTKTD7DZRBLrFRC3vURnhas335AxEoi3YFyIU/+SdXpA
	 NQdTiSmmfA0YzhZeBaISLMgfx9wYOBQ8320P3A5STlPWrMpBaLHhHF0bnSZnEKrsjsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
	b=W/S9BdiBVViL/xqypG8nZmNGAxvt12WlvZab+ZBi3avO2oQQlDd3RBdWSvBhod3844RK
	 2pNleUGxsBminSLHtThbCpleQLN5tdgwyGUbmX9N3aHMjN8rq1q9RtLyCLnygk4VroX6S
	 MLTChK6j43ePn6/E4xc2QHmp9Juoal0cRvwyDBHeAo+ZYfYyOi754uq6o4catM12KMAxz
	 GGdiiymbRhEnmKsYgD+yJLAg4ljVjl4N3AtgnhpK3U61JpYQCaOD6QwUZy3rKceZFCDOk
	 EFAAfSD60hwRUBvGdeHkFJQGfMhWMSA1LYVjZlugDogiZYCXM3DKVN+e+7mPBR7wKbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o5Dxd8NH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E8606A326
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 00:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o5Dxd8NH
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14a204305so2558564e87.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795481691; cv=none;
        d=google.com; s=arc-20260327;
        b=NQXnBv6kuoUlB1mFXrj0kPxKMbekeQUTAp+pcg/wvKFxM7tB+XCxD1dEr09U56+Q6U
         xhJyVL9KfinyUm0SGaLuX2E8jnIZA1t2pnYR1rkOMrlL2/Dj3L3rOa9cbG5dp2TTW8vw
         5vnAHceY8t3dokzd8ipOeqk/5Hiw33+9np5UnyIyCoKvC+67u1y5tyuJ1VCX56Qsp6T5
         MSxDw8K67o4bTjUQP/W9DzR1yevawPVLlDml6+YFrZd6SgDEBPs6yaAdNT76jbMbTvV0
         GYWzupLUqN48NtdRNLK/avoiMU1F2Illq7U7QdT3v5XrC6refVP5M6oSwgardxznGVTj
         iUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
        fh=V7SzD0b1PXJ9dHaSqn846O2ID3h8Vp7blcDzFjaGjq0=;
        b=IRasCGD7FQVhvsN4yYaOYv1WfNL07xV6bBjXfnWu/g/V4Y9CEeiCm9m+HVG7BAK+om
         8IMJoH8dH+6dZ91afV6rret7/tTpNmYjkzlEb5egMU3FkQ+u+wDTs/eAVGaayvzarZfn
         50f/dTYpXHi5nNmV+AHxgB1cs/q8Nl/tC9vTLUEHiwrUpZ0QlrBwKDIN5VeGirEldwaA
         loh0OGr50LejlxwwRmV4z3TF+hSsCaBnmmz9mCzWheJd/RwnMA6Tizf9/GGv2C0DTI1n
         N5LKZRFVQgKFn6PDj0tMF2anf1o5xkMjmf7tn5bLxV1Y7cijaothpNAWaGgPYK3GpPHv
         L57A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795481691; x=1796086491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
        b=o5Dxd8NHFXX2cE4R0WwhlruqtyJ5oTB6aI2dShZR/o5Rl58IMbHEEZjajXUrFyVu6/
         8mXqmn+2VD5DRqMrlSibhb4wjce6v4IMfd8hvEFR7waf34/GvyabBuqgI4p+wbzUebY0
         PtVFDm2OmwUbfHnzZpw5hKcBjamTr9Fljw9+QPc3P/TonvAJ4LRkPwKgsZdKsQQj+mTE
         gHnJr5r7k81sZSurhg7E3ROWf7AMbZ6pikX+mz0df5BOgQbMUJnldE9O9hdgpAtnaY8t
         3eeU1jniYS96HJMurxAIjQuVWVUuh1b/3Y2+peQtrHa7ShTn5WwZEpwbSSr9cvsD8FqF
         /4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481691; x=1796086491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEKEeKCLRaE3702Za70pxElLp2Z9ygHS6e2aDItiwcY=;
        b=CIBQa//sHPSBh2ISMciA48YxVl3QhsuIWYZS7FtnpCvD7Zw0RYQQHr7VHeko//65zh
         8b4EoVAklAgLGSKz4L466njPtnvx+JuxLHEUe+bJr/sZVII+Y9TowPshM309utosFuKJ
         lOy3Qj0F7zEZdcbfYblYohkutdKvnhbHNh6wkEqPy6lLILhz7CeFrhzdyzt4eL2X6oJx
         Zi8Wd3q6ic5tUbNY3E4PXEHKlXaaaIaZyHjny/btNdxCSXJReA8CuKXbqrHy60P/cwcO
         T5qjPcxZStAkjV0B9Uzm9ViB/jc/GKWjU3PNpVabYBZHg43tpOylfpn0cmOGYVpgPefr
         qrfA==
X-Forwarded-Encrypted: i=1; AL+hErGEWigJFo9IYG82O2hVtI//BaxKRKgijGdOBPiO2PLG3RfC8M5x7QhiSJksZ3ffyu0AKQvk3WeEKxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LHhuv0xcrpfjCxHQJ/GLzwCAW7PeqBJJD2CJ4gXOgytLqPO+I
	Jv2BpScGu7fWt36wtqGMJ7pQF0iVHFO/b1ZVkRt+mMCjqHNefSvGUcLxPGTspE5qPvSvykaXZRc
	f1hIKRnNhcyogPyr7mwkiVT7kZgjBpp5dDMlS1Czm
X-Gm-Gg: AZFdTZeRZWjEolVhJiKNqyBZBkG6c338iroSt7qP+6L2fpeNGPnwE8M9hF8CbyVHZVp
	MjIdsXWNzYlQPMI1L8ONyZ1hdvLklFOdyJej3X9fWr7/VsFmkkh5rwPwVX6kKgFjO6K2Z0GmYKt
	BxHZuj7ovo/WIVTN2iRNPJai+UCi48+CkJ8ODgxw/7BdHsSnxJxkU7Yj/64E2XNIW0t2KlcTrNG
	Ear5BF28G4OIQQgZFa3yy5mI+IPDGyDIzm6ILM1Tcf9mBewBd7UiO8XmWSV70vnK8AU1mo7ufh0
	IXaH7/Np1f/arD9NaEsqWHyn3gbPFWx5uxkjipFxfxsIP1EJNh5EkLInj7pBM/0aoOGDxr0U0pS
	yWKG9iralqqL2j8JeoSHICEQTKWD+3Ou5tp/blJ0=
X-Received: by 2002:a05:6512:618:20b0:5c0:165:16c3 with SMTP id
 2adb3069b0e04-5c1bc85f246mr2665281e87.64.1795481691103; Mon, 23 Nov 2026
 16:54:51 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119104208.782900-1-halg@google.com> <20261119104208.782900-2-halg@google.com>
 <CALCETrVqc+1bjH1bhqHee9bsUdk2B6314z7PMexbsnNpMhk14g@mail.gmail.com>
 <CALCETrV=zSxb6sgA08DLiK2bQovdMEj9ycG=Cc71mLn2C5Pgeg@mail.gmail.com> <4db941ba-3001-4019-8910-63e534b29f89@schaufler-ca.com>
In-Reply-To: <4db941ba-3001-4019-8910-63e534b29f89@schaufler-ca.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 23 Nov 2026 16:54:39 -0800
X-Gm-Features: Aa3M54oMS94l-c6quSe09sYNPHMWYafhDwaB4QCI_jHSdqjrERKiY6yBrUdD7_4
Message-ID: <CALCETrX7_HidtLAjAh=D0m2Fn=1ZkfMBiXUVXbjyu+xDY19u0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] userns: introduce capability bounding set for user namespaces
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Andy Lutomirski <luto@kernel.org>, "Hallgrimur H. Gunnarsson" <halg@google.com>, 
	Christian Brauner <brauner@kernel.org>, Serge Hallyn <sergeh@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Jann Horn <jannh@google.com>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Singh KP <kpsingh@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, keyrings@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:22=E2=80=AFAM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
>
> On 11/20/2026 9:09 AM, Andy Lutomirski wrote:
> >> On Nov 19, 2026, at 2:52=E2=80=AFPM, Andy Lutomirski <luto@kernel.org>=
 wrote:
> >> =EF=BB=BFOn Thu, Nov 19, 2026 at 2:43=E2=80=AFAM Hallgrimur H. Gunnars=
son
> >> <halg@google.com> wrote:
> >>> When a process creates a new user namespace, it receives a full set o=
f
> >>> capabilities (CAP_FULL_SET) scoped to that namespace. While namespace=
d
> >>> in scope, several of these capabilities (such as CAP_NET_ADMIN and
> >>> CAP_NET_RAW) expose broad kernel attack surface that many sandboxes a=
nd
> >>> containers never need. However, there is currently no configurable wa=
y
> >>> to withhold such capabilities from user namespaces while still granti=
ng
> >>> them to workloads that require them.
> >>
> >> One thought (from the rootns thread): the other decent sized attack
> >> surface here is CAP_MOUNT_ADMIN.  Which doesn't exist as a capability
> >> bit.
> >>
> >> A sort of horrible solution (but maybe not so awful) would be to
> >> declare that the bits in cap_userns aren't actually capability bits,
> >> and that you need the bit in cap_userns *and* the bit in cap_effective
> >> to do sensitive things, and that mounting needs cap_userns to have
> >> NSCAP_MOUNT_ADMIN *and* cap_effective to have CAP_SYS_ADMIN.
> >>
> >> I want to sleep on this.  It might actually solve several problems,
> >> e.g. controlling creation of ipv4 and ipv6 loopback or tunnel devices
> >> or whatever.
> > I slept on it. Here=E2=80=99s a counterproposal.  I=E2=80=99m not sayin=
g I think this
> > is better than this patch set, but I think it=E2=80=99s worth weighting=
 the
> > options.
> >
> > Define a whole new set of privilege bits.  As a
> > poorly-painted-bikeshed option, I=E2=80=99ll call them eprivs (for expo=
sure
> > privileges - it=E2=80=99s a crappy name but at least it=E2=80=99s prono=
unceable).
>
> I played with a mechanism I called "chits" (all the good terms for securi=
ty
> bits have been consumed for a very long time) that looks a lot like
> what you're proposing. I did it to address the CAP_SYS_ADMIN problem,
> where any use of the capability opens up a whole barrel of worms.
> I cannot, unfortunately, find my patches. :( The basic approach is:
>
> A process has an optional set of chits. A process without a chit set is
> unaffected by the mechanism. A process with a chit set is allowed only
> those operations for which it has a chit. The existing but empty chit set
> allows no operations. A process may drop a chit, but not the set, which,
> again, can be empty.
>
> Because I was after CAP_SYS_ADMIN, I envisioned a call
>         cap_able_chit(capability, chit-list)
> but there's no reason there couldn't be a
>         chit_able(chit-list)
> as well.

This is quite pronounceable, but I'm not sure I could submit a
patchset with a chitlist with a straight face :)

I feel like, in our brave new world, much of the work here is defining
the interface and how it should work, and our little AI interns have
gotten quite good at actually writing the code.  So my grand plan is
to let people contemplate it until next week (i.e. after the
Thanksgiving holiday) before actually producing any code here.

I was imagining something like:

prctl(PR_EPRIVS_AND, mask1, mask2, mask3, mask4);

(i.e. define the things to be 64 * 4 bits max until we add a new
prctl, which will hopefully be along time.)  And to maybe make mask4
be specifically arch-dependent bits, because I think EPRIV_X86_LDT
would be an excellent addition.  (I say this with some chagrin because
I fixed some gnarly vulns quite a while ago in modify_ldt, and I
missed smp_mb(), and someone rooted it.)

>
> I wrote this as an LSM, but the system-wide aspect of it made that
> a questionable choice.

I'm thinking not an LSM.  The goal would be to make it available everywhere=
.

(If you missed the other thread, I'm also imagining adding
CLONE_NO_NNP, only allowed with CLONE_NEWUSER, which would *clear*
no_new_privs.  LSM would have a chance to veto this, but the default
behavior would be to allow it.  This would allow running an entire
system with no_new_privs set for all normal tasks including PID1 while
still running conventional distros in containers.)

>
> If you have any interest, I could dig more deeply to try to find the
> patches. Otherwise, I'm happy to look at what you come up with.
>
> >
> > An epriv is not permission to do something *to* an object; it=E2=80=99s
> > permission to do something that exposes a meaningful attack surface
> > within the kernel. So there=E2=80=99s no ns_has_epriv because there is =
no
> > object.  These are kind of the opposite of object capabilities.
> > Additionally, an epriv never grants the ability to do something that
> > one couldn=E2=80=99t do in an epriv-less world.
> >
> > For now, all tasks have all eprivs, even not-yet-defined ones, unless
> > user code or config explicitly changes this.  (Maybe some day secure
> > boot might remove certain eprivs.)
> >
> > There should never be a check like ns_capable || has_epriv. It=E2=80=99=
s also
> > &&, or perhaps caps are not checked at all.
> >
> > Example eprivs include:
> >
> > EPRIV_FSOPEN_VIRT: may fsconfig, fsopen, etc a virtual fs like fuse or
> > tmpfs or overlayfs.
> >
> > EPRIV_CLONE_TREE: may clone a mount tree
> >
> > EPRIV_MOVE_MOUNT: may move mounts around (but only if you also have
> > CAP_SYS_ADMIN on the correct namespace, of course)
> >
> > EPRIV_FIREWALL_TC: may configure any firewalling configuration or tc
> > configuration (this includes iptables, nftables, and ebtables)
> >
> > EPRIV_NET_RAW: may use raw/packet sockets (like CAP_NET_RAW)
> >
> > EPRIV_TUNTAP: may create and attach to tun/tap interfaces
> >
> > EPRIV_IP_LOOPBACK: may set up IPv4 and IPv6 loopback using whatever
> > new facility we add
> >
> > EPRIV_NETLINK: may use netlink at all
> >
> > EPRIV_NET_ADMIN: may use traditional CAP_NET_ADMIN abilities (all
> > CAP_NET_ADMIN checks will also check EPRIV_NET_ADMIN)
> >
> > EPRIV_OPEN_FILE_HANDLE: May use open_by_handle_at, etc.
> >
> > EPRIV_UNSHARE_USERNS: may unshare userns
> >
> > EPRIV_UNSHARE_NONUSERNS: may unshare any other namespace
> >
> > EPRIV_MOUNT_CGROUPv1, EPRIV_MOUNT_CGROUPv2: may create a new mount of
> > these subsystems
> >
> > EPRIV_PTRACE: there are lots of different variations that might make se=
nse.
> >
> > EPRIV_MOUNT_PROC_PIDONLY: may mount proc-pidonly
> >
> > EPRIV_MOUNT_PROC_NOTPIDONLY: may mount proc not-pidonly
> >
> > EPRIV_MOUNT_SYSFS: may mount sysfs
> >
> > Example eprivs that are questionable:
> >
> > EPRIV_DMESG: the kernel log is a specific object, and I think it's
> > better to control access using something kernel-log-specific.
> >
> >
> >
> > There is no operation that increases eprivs -- even without
> > no_new_privs set, a task will never gain an epriv, nor will a child
> > ever have an epriv that its creator did not have at the time the child
> > was created.
> >
> > The evolution rules could be as simple as, on fork/clone, the child
> > inheriting exactly the parent's eprivs.
> >
> > Or we could bind eprivs to a userns instead of a task, but that could
> > be more limiting and awkward than we want.
> >
> >
> > What do you all think?
> >
> >
> > FWIW, I had an LLM make an inventory (surely not exhaustive) of
> > recent-ish CVEs and how they relate to this list.  (The below is the
> > only part of this email that is LLM-generated, although I added
> > EPRIV_SYSFS because I didn't realize that nonroot userns could mount
> > it until I asked an LLM, sigh.)  To me, the list and its breakdown
> > suggests that there is quite a lot of room for meaningful attack
> > surface reductions while still leaving large parts of userns
> > available, and that my epriv proposal captures much of this but the
> > cap_userns proposal may be too coarse-grained.
> >
> > (I also asked about eBPF, and my LLM came up with a lot of CVEs, but
> > there's an existing BPF token mechanism and I therefore did not
> > propose EPRIV_LOAD_EBPF.)
> >
> > --- begin LLM output ---
> >
> > **EPRIV_FSOPEN_VIRT:** CVE-2022-0185*, CVE-2023-0386*, CVE-2023-2640*,
> > CVE-2023-32629*, CVE-2025-38499*
> >
> > **EPRIV_CLONE_TREE:** CVE-2025-38499* (only if the check also covers
> > the relevant internal mount-cloning path; explicit `open_tree()`
> > restrictions alone are insufficient)
> >
> > **EPRIV_MOVE_MOUNT:** CVE-2025-37988
> >
> > **EPRIV_FIREWALL_TC:** CVE-2022-25636, CVE-2022-1015, CVE-2022-1016,
> > CVE-2022-32250, CVE-2022-34918, CVE-2022-48911*, CVE-2022-2588,
> > CVE-2023-32233, CVE-2023-35001, CVE-2023-4004, CVE-2023-4015,
> > CVE-2023-4244, CVE-2023-5197, CVE-2023-6817, CVE-2023-3609,
> > CVE-2023-4623, CVE-2023-4921, CVE-2024-1086, CVE-2024-0607,
> > CVE-2024-27397, CVE-2024-26925, CVE-2025-38001, CVE-2026-23111
> >
> > **EPRIV_NET_RAW:** None identified.
> >
> > **EPRIV_TUNTAP:** None identified as requiring TUN/TAP. Some
> > packet-triggered exploits may optionally use it, but that does not
> > establish it as a necessary blocker.
> >
> > **EPRIV_IP_LOOPBACK:** None identified.
> >
> > **EPRIV_NETLINK:** Also those blocked by `EPRIV_FIREWALL_TC`, insofar
> > as the documented attack paths use netlink. No additional CVEs
> > identified.
> >
> > **EPRIV_NET_ADMIN:** Also those blocked by `EPRIV_FIREWALL_TC`,
> > insofar as the vulnerable operations require `CAP_NET_ADMIN`. No
> > additional CVEs identified.
> >
> > **EPRIV_OPEN_FILE_HANDLE:** CVE-2025-38306*
> >
> > **EPRIV_UNSHARE_USERNS:** Also those blocked by `EPRIV_FSOPEN_VIRT`,
> > `EPRIV_MOVE_MOUNT`, `EPRIV_FIREWALL_TC`, `EPRIV_OPEN_FILE_HANDLE`,
> > `EPRIV_MOUNT_CGROUPv1`, and `EPRIV_MOUNT_SYSFS`, plus CVE-2025-38058*.
> > More generally, blocks the documented unprivileged user-namespace
> > setup for the entire inventory when no usable user namespace already
> > exists.
> >
> > **EPRIV_UNSHARE_NONUSERNS:** Also the namespace-dependent attack paths
> > blocked by `EPRIV_FIREWALL_TC`, `EPRIV_MOVE_MOUNT`,
> > `EPRIV_MOUNT_CGROUPv1`, `EPRIV_MOUNT_SYSFS`, and many of those blocked
> > by `EPRIV_FSOPEN_VIRT`. Coverage depends on whether the necessary
> > non-user namespaces already exist.
> >
> > **EPRIV_MOUNT_CGROUPv1:** CVE-2022-0492*
> >
> > **EPRIV_MOUNT_CGROUPv2:** None identified.
> >
> > **EPRIV_PTRACE:** None identified.
> >
> > **EPRIV_LOAD_EBPF:** None identified.
> >
> > **EPRIV_MOUNT_PROC_PIDONLY:** None identified.
> >
> > **EPRIV_MOUNT_PROC_NOTPIDONLY:** None identified.
> >
> > **EPRIV_MOUNT_SYSFS:** CVE-2025-22089*
> >
> > CVEs not cleanly blocked by an operation-specific bit
> > Excluding the two EPRIV_UNSHARE_* gates:
> >
> > - CVE-2025-38058: No explicit unmount privilege. The vulnerable race
> > involves umount(2) and path lookup.
> >
> > - CVE-2022-0492: The cgroup-v1 mount bit covers the documented
> > new-mount attack path, but not necessarily configuration of
> > release_agent on an existing writable hierarchy.
> >
> > - CVE-2025-38499: The correct gate depends on which filesystem-context
> > or internal cloning operation reaches clone_private_mnt(). I would not
> > count EPRIV_CLONE_TREE as a definitive blocker without checking the
> > exact call paths.



--=20
Andy Lutomirski
AMA Capital Management, LLC
