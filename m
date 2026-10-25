Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950738;
	b=T1dGqI7VVLQuS483j6jcd5PM1dlIUHvzOmv8zAW3A93ExnvI2axDdkcz0sSqDkrf5Gvw
	 VF3zavFamZO/R+Xe4p3HSUee8yNmR+ZOK27Zf7outcIfsJffiaNDA99vPhY/kvVqwDyYT
	 Q/TQxM37ZRX9Efj4CUm/SL0tfBmtYzLQgOm88wq3qcd3EY0KquyoNKhYmaMT1lRJv3Lwo
	 YFrjEODrDp1NxTCIuQp/j6+a0l2cIhO910jtvyT184FZvt+v6XYDR8n8AHBGTdR5/JZOj
	 wHSdl7lmoLD11mT0vrXpE+AhbNDkdHX8s16O6WRMLfpoUcgpXdSq5lXJpeRTXrjN11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=yEmuPuDD8UK5IkZalmUOKJ7w1yR3lVP8uGzhXUXIML8=;
	b=g2kx/aMTEEMenDOYoqr2RVBw8tTpKO73u/ho7DynqoNvX6Yr69I/Z7lEGxIqK0iFI3ar
	 ZNw/fixHwjHkuVpMVqzkO5lFqY88bUvDtJfGZxvuRJBRpd45gZSsfL/ro00zYMIgOkUs0
	 UiKoEx2GpU+AUmv99aGyqgMAQ/iMVmV1qEd3H6uUsoQEzJ6WM2Sho0OCx611qDxkAeJEZ
	 UxyP5/wgPBji0HRgIHlmzDs3gAEo0dmKJ7exotx2aDlJcsHuylEk3c2s7auNrP+9x/iI0
	 AGMmJM3Fy2a1P7XkKyVXsVcRUaG8bSrd6XYpzVSlx88IfePNmUU4KgPJOIiXY+Bbbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qa6bIIhI;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4FA606A31E
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qa6bIIhI
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35d0be18c71so3985674eec.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792950736; x=1793555536; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yEmuPuDD8UK5IkZalmUOKJ7w1yR3lVP8uGzhXUXIML8=;
        b=Qa6bIIhI1zo3p2dQWKhj2tR8pnLI8Zl6m0mWyMLnSmPhQLxVUnu4fcOkdUUT056diK
         KGkkH3Qjq6CcF4SOsLCQd00vYbcrT1g4QhKIielEjpkQ6I60pmJixMfUzfeSFp9frTfB
         bRlNv9B6UD0jwOxsfAM/f4+k8LocdAfBbdEGabstyrmfmZM6qo6GsDycOYPYajrLCK1g
         +yhV60oSbn/GH88u9gU+mcUTc8nInQjyBQJdOgQKnpAH4Mpa/JEZ32N6M0EsVfuwPQL6
         FfnDqUpneeuzoHqYtxMOgYIVDnM2agcI3+iPFA62lKUnWE3uYqcgEv5ZEqKRl8APDAwy
         ab/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950736; x=1793555536;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEmuPuDD8UK5IkZalmUOKJ7w1yR3lVP8uGzhXUXIML8=;
        b=DZG9GMyuepPoDFTU30bRKFXqltgOREV2Z8+hJtXXYoDoMreVXaE4J2MO5Yr+Zr/Ckh
         Qb8HF/jG+PTeE1NcHnfpKti91XpOgf7LPONc1R6kc7x12FAOJPPhMlV7SiPSNoSN072L
         QsXfGWEdnIcm+e9RU1AkfUSObnA13Uf+Eb6lGajD+ETnQVlHtXR8i+STmnyYj7GK3T3V
         PC7ETZNO0OmzSIFr/QKdFNuiJKFNKxWPFzFSWXqobEevAhxB2+5Ms7iU1Cqz8b+Zl7Wq
         f8irUc4eEdSiDIbAoWCqkZvBtUFj2UHk0NWUwvCazRQ6etSDuXaw0I9FQrmHFTApBZRq
         zBQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5rLmisobQJSnaeePTaK95Fmj3bXliyh/oKa7hFkMWI/FXCeqpGmJwSbQBTsPDuXGdSFaGSz9g7lM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg83zAB+qlz5geyKBnB5Z8gV327LlmCSIfg4gSyjzN4cpYklqB
	dgvoDP8eukqsnZ5RcM8vOyq3t0rlMmu7I9F8KUJmMumNYG8bQ/Aczqa4
X-Gm-Gg: AYBFou1hibsy1eFzf8n4Pbhed64Xdiw96AIGC30Nzm6aTc6bFlDAszMs/LIH4KTKsPu
	LcPx3YWN728lCOQtHWdIalK5vVq/Tf/V2pOTiC+pXiuTTsDoHY8g8bCpCeEhUdIZgaLhGuIcBbG
	5/prCBLy5rJOg9/e+yFErc1MFmw1VhWJ816myKSgaPkb5qF9q8aRpN/liOQvdD3UHVw9cYoO/Km
	tgy5xEdCq2k0m9/jOQu9jwr6+EeVuIP4ArvBdGR4z0jrpq2IcQeJl+8elPvbLKtzByqbLb9kfT1
	b3UQtS8aSJOiiNsJ/8grYhJcS+Tip7pEOxoHEqictLDvvqeEPcojw9gExRwbJt8VUUOoipcTkT1
	Q+ZhalXvxVRKbatkO6Aruw0YZdcch73DITUgsaFT1afMwf2sqjMhLsSZdswM30CAzVLL5Cxbp9A
	7Q4gcOnSCV3bVO0IpaHclS7yDroiLlTws9cmWzCBhSA6NS45hE7RP8gIl/rAoNU4zlAVvmh3sUw
	hnuX1GHlVAzb1e9jfy7TRoIDQMnPs+G6dcEP1hh8b+/M0pGtj+x+9rFR/yV
X-Received: by 2002:a05:693c:2502:b0:357:ee3a:267a with SMTP id 5a478bee46e88-369e866a7dbmr6307920eec.2.1792950736269;
        Sun, 25 Oct 2026 10:52:16 -0700 (PDT)
Received: from localhost ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8afd64fsm21569336eec.0.2026.10.25.10.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 10:52:15 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 10:52:14 -0700
Message-Id: <DME3ZOI3Z6VE.1XGI920DJV4LE@gmail.com>
From: "Farid Zakaria" <farid.m.zakaria@gmail.com>
To: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>, "Farid Zakaria"
 <farid.m.zakaria@gmail.com>
Cc: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Paul Moore"
 <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Shuah Khan" <shuah@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "John Ericson" <mail@johnericson.me>,
 <linux-security-module@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
X-Mailer: aerc 0.22.0
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
 <20261025.769b43a39e24@gnoack.org> <20261025.8e22954c9c47@gnoack.org>
In-Reply-To: <20261025.8e22954c9c47@gnoack.org>

On Sun Oct 25, 2026 at 7:57 AM PDT, G=C3=BCnther Noack wrote:
> On Sun, Oct 25, 2026 at 12:07:10PM +0100, G=C3=BCnther Noack wrote:
>> Hello Farid!
>>=20
>> On Sat, Oct 24, 2026 at 01:39:16PM -0700, Farid Zakaria wrote:
>> > This is a proposal for an idea to add support for landlock to work
>> > better with build systems such as Nix where they want to apply
>> > restrictions but the paths may not yet exist.
>> >=20
>> > TL;DR;
>> > =3D=3D=3D=3D=3D=3D=3D=3D
>> >=20
>> > Landlock rules attach to inodes that exist when a ruleset is built.
>> > That makes a directory shared between trusted and sandboxed tasks hard
>> > to confine: the sandbox may create entries there with
>> > LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
>> > time, and granting read access on the directory to cover them exposes
>> > every other entry as well. This series adds a rule flag that grants
>> > access rights on the entries a domain creates in a directory, instead
>> > of on the directory.
>> >=20
>> > Motivation
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >=20
>> > The motivating user is the Nix build sandbox. Every Nix build runs in
>> > its own sandbox, and a build may only read its declared inputs in
>> > /nix/store and must be able to write and read back the outputs it
>> > creates there. Nix enforces this with a private mount namespace: it
>> > creates an empty store directory and bind-mounts each input path into
>> > it, one mount per input. Nix has paid this per-input cost since the
>> > sandbox was introduced [1].
>> >=20
>> > The cost is paid per build and grows with the size of the input
>> > closure. Nix is moving towards much finer-grained builds (many small
>> > derivations instead of a few large ones), so the number of sandboxes
>> > grows while each build's own work shrinks, and the sandbox setup is
>> > becoming the bottleneck. A typical build has hundreds of inputs; large
>> > ones have thousands.
>> >=20
>> > A microbenchmark sets up and tears down a Nix-like sandbox (user,
>> > mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
>> > removing the chroot afterwards). It compares one bind mount per input
>> > with a single bind mount of the whole store plus one Landlock rule per
>> > input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
>> > ext4, 16 cores:
>> >=20
>> >   inputs   bind mount per input   one bind mount + Landlock   speedup
>> >       10         3.2 ms                    2.3 ms               1.4x
>> >      100        11.6 ms                    2.8 ms               4.1x
>> >     1000        79.3 ms                    6.4 ms              12.4x
>> >     5000       400.1 ms                   24.4 ms              16.4x
>> >=20
>> > With Landlock, an input costs an O_PATH open and a landlock_add_rule()
>> > call: there is a single mount, and no mountpoint directory to create
>> > before the build and remove after it (removing the 1000 empty
>> > mountpoints alone took 17 ms).
>> >=20
>> > The single bind mount is only sound if the store listing and the
>> > undeclared store paths stay unreadable while the build can still use
>> > its outputs. Without this series, covering the outputs requires a rule
>> > on /nix/store itself, which makes every store path readable again.
>> >=20
>> > [1] https://github.com/NixOS/nix/issues/179
>>=20
>> I have not done a thorough code review yet, and will focus on the
>> general approach.
>>=20
>> I am generally in favor of this approach where we keep track of the
>> directory inode plus the file name.
>
> Apologies, I think I was jumping to conclusions here when I read this
> too superficially - I realize that you have implemented something
> different;
>
> If I understand correctly, your proposed patch set is granting the
> access rights on every file that you are creating freshly, but not on
> files that were created by other processes in the same directory.  The
> semantics, from what I can see, seem like a Landlock variant to what
> the "sticky bit" does in /tmp -- you have access to what you create
> yourself, but not to the files created by other processes.
>
>
> ## Alternative suggestion
>
> I have been discussing the other approach with Micka=C3=ABl a while back.
> This would also work in use cases where we want to express a rule on a
> path whose underlying file inode might change, with examples being
> /etc/resolv.conf (recreated by a DHCP client) or Pathname Unix Domain
> Sockets (commonly recreated when services restart).
>
> In that approach, we'd add a rule like
>
> /* pseudocode; name and exact layout TBD */
> struct landlock_path_beneath2_attr {
> 	__u64 allowed_access;
>         __s32 parent_fd;
>         char  *basename;
> }
>
> During the path walk when checking for an access right, it would match
> if the parent_fd matches an inode and the name of the next path
> component is basename.  For example, to access a (potentially
> changing) /etc/resolv.conf:
>
> struct landlock_path_beneath_attr2 attr =3D {
> 	.allowed_access =3D READ_ONLY_ACCESSES,
>         .parent_fd      =3D open("/etc", O_PATH|O_CLOEXEC),
>         .basename       =3D "resolv.conf",
> }
>
> Or to allow the creation of an output file:
>
> struct landlock_path_beneath_attr2 attr =3D {
> 	.allowed_access =3D READ_WRITE_ACCESSES | LANDLOCK_ACCESS_FS_MAKE_REG,
>         .parent_fd      =3D open("/output/directory", O_PATH|O_CLOEXEC),
>         .basename       =3D "mymodule.o",
> }
>
> Would that be a model that would work for your Nix use case as well?
> I'm imagining that you are declaring the exact list of output files,
> is that correct?
>
> =E2=80=93G=C3=BCnther

Gunther,

From my reading of your suggestion and the code, I think that would work
for Nix and maybe a little simpler. Nix does know ahead of time the
output directory (/nix/store/<hash>-<name>, one per output), so
a parent_fd and a basename that we walk uptowards would be sufficient
without creating inodes.

This sounds like a good approach to me and my research upon your
suggestion is that it would simplify the proposal as well (drop
a patch). Should I try to implement this and send a new patch series?
(Disclosure: Will use AI to help me write the code, but will review and
test it myself.)
