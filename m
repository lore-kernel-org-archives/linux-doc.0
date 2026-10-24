Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792886388;
	b=kQDr2Wvgnyye5Lkks6sfGgiEGvtPabC5biidc0ksTgqw6UpVu5hsQy3k3QG1iJp5STpx
	 d1X4Fv8YWZi/ucJaAxMQSDiOJjRcrMvBuVcqHTp126ZcjZkTxuTATTFKo/o9vKKeu0fbh
	 nPsHKTzrl6wnR7t6ataXJkQvuuxyxgQEUXKXQT+cVsrEaOVmi31mG3ly/Ut13UsCqacOI
	 0LJIOve84E5GwybsDv9S5g5s9j74Dr/sQ/7AFipe0ccWTaeHpKMHDbNL01KaiuFcSsRIF
	 92PNvLHns3A+IMNFIdYS4m+Bcaxlfh9hajYL+Q4mRIrG0CmT+QhVYQSTVCtTIhM5vXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792886388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kPGkV1PrAtGPm5u8Uv9TfVrX1KaCYLI/ILzCGAHiWVU=;
	b=TmkNEEKTI7oEzyFNngsoV71Pl5L2ttf7gCdu7joGq+V113Z/F4a9Uu5gmW3DiVNWMSOh
	 4f58FoIoZkWbKsbeZkHbz9otT543n2zllFIiedJWBxOOaUt5XNSUs2s373IO1cyfWmWUC
	 U+VMN5HdrUwtpqMEKR3pCs65yVxk8T6tecx6Wl7jGD+3oqBcoHUIyBgUMbwxrhK6floRu
	 hng3RofHLlVFXJGNWYf0D/nOg2UUHUQSmselA0g+iQMdMwwcoSNgjt8FTtPIaXoGPsEic
	 uilTYJynWUdiGMKPooGkTCL/66WuSu/if+zLWwt9DT6RsZrb6GJWRi2PKZUi4pgEwXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WloVDXD6;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C459606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 23:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C459606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WloVDXD6
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso588249eec.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 16:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792886386; x=1793491186; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPGkV1PrAtGPm5u8Uv9TfVrX1KaCYLI/ILzCGAHiWVU=;
        b=WloVDXD6l+pIZoSuUYA2v1ecepRDeOY/98L4cBaFUnmdRioBkEBCuosjzGB95QYmyz
         cf8ETJoaRyLTbUdk29oQX9Pd06r1pw9ck/OnFGffFOhKUTrOX062tJJ+Emj6X9n+iwAJ
         AK6kEYIy3QpXVll2lLC6ClP9pCeh48f3w05eYWJUe6DyvQyXU7JT1xcyEiKw4Ez3dSPb
         WhmyfAbMxa42p9jafEhFxGEKH2Rg5agHKe2/364HccVsMhBwwoSsdvmRH2Ackp2gm6L/
         CmSuw1hgmsps+o4TngBhrlO4K5xOJDJEjZ1OKNvDTho8AJcC88RM6HNOyVpVrhW9H2Rm
         u/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792886386; x=1793491186;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPGkV1PrAtGPm5u8Uv9TfVrX1KaCYLI/ILzCGAHiWVU=;
        b=FTYlSYc5RPUXjxTAE5Ds7T06of2js4hPbCBwZxKe1hueC5JbRZJJaDlSyQN3IwwPG/
         KMcuNlKOBbsm0LmIwRlB7TJo0sm56i+XqZmHUhEhGugh5EchqNnoimkuinYAzDQ8XrbO
         Lv5O4Erm0zr1dcdKQOgGqPtTubeepWb103tquSqxUekRwpML3JGAczohEKYxUazuwSTU
         M6+DxK4ONMKeVzrMv3UJyEr6Vl4CIzcQHUxPOEBBRM+HrsnGQAdqNlxOQYj642SbvOrj
         6jE9Hem0i4BsozT0asyNGZw2FTto4aQH/WGINMyQexmbE89TStbgzf06bhxPrqwmqYmb
         h+jg==
X-Forwarded-Encrypted: i=1; AKwUvBwbKs9KCiPjxNK0OgS1Q9OK5nSxTSF2e9nq4csCuENNTJULuGTvSNmJFoPAewY6Wkuo3Igv40765vs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF67ozp5xdrhlDhd9x/aqtMmYiEW1vAnna42ibo9UMwfHATRmg
	O+wlvgiVGiJMf3zm8cwk0ZbSCNE1D1XYXYYiSjbzMDD7iq17396DPPim
X-Gm-Gg: AYBFou12v/Gp/cLrU9p0ojpaXCLOWhgsyHC5lkoYmB8CoW5jA/MJxh944m9hEIGlRaB
	5k5GfA8JHgpkXo5wbXCDSufqaOeVSnlZGNzwLY06HCLYcpRJHo4wls1HZp3cozJwF8uye8ee0Wm
	m/onRGrrzj7/oT7f8BzMkMOqNp1nUUA8D5jv+XqlfUAnoQb//cDiBRu2U8UoCIDJzZ8f6BFUKB5
	0Q2m9300PlxBbQYSv9s3xfebf4C5Rg1uuph8BYr+/+pquT3xQ3P3tqObuUP70f89/4iGss9YJv4
	Q/10ppy2Ateb+zB+ycB0I/dvuBJtewIgu1WGctbKvrfZ+c1+3v9zEI/qZABiq4tqXY/zN1ixC06
	iDMDHsXoQHsp0coQV16s4kj3LNWsLq5w0QU5TwjgU/88YbXj7IGywQ5djmY8DSWWo8mlbnin34J
	dvXvpfXucUK5yAKrPSmdTMVb/znAa4RAS2HkUkvTMJazUSrY9xKAc7ywY6Aw/DNV0MFq7JFpOXR
	XQ2TmuytDPZZztPAaoOyBnhi+od5V/drBcUzqof88IRoomM1TDgewlDRX4=
X-Received: by 2002:a05:7022:e10:b0:14b:cf58:ce15 with SMTP id a92af1059eb24-199377d8c81mr6217789c88.43.1792886385960;
        Sat, 24 Oct 2026 16:59:45 -0700 (PDT)
Received: from localhost ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm24522674c88.17.2026.10.24.16.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 16:59:45 -0700 (PDT)
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
Date: Sat, 24 Oct 2026 16:59:44 -0700
Message-Id: <DMDH6IGUKIG4.PFYGRQT3YJB9@gmail.com>
Cc: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, "Paul Moore"
 <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Shuah Khan" <shuah@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "John Ericson" <mail@johnericson.me>,
 <linux-security-module@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] landlock: Add access rights on created files
From: "Farid Zakaria" <farid.m.zakaria@gmail.com>
To: "Justin Suess" <utilityemal77@gmail.com>, "Farid Zakaria"
 <farid.m.zakaria@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
 <at0agiPbtxz5zD41@zenbox> <at0o7LydcgezBf7D@zenbox>
In-Reply-To: <at0o7LydcgezBf7D@zenbox>

Hi Justin,

Thank you for engaging me on this RFC. Admittedly, I have not followed
the landlock discussions closely. This was an idea I had concocted while
thinking how we can make Nix sandboxing faster.
(I'm also exploring the space with AI - so I'm a landlock newbie but not
a Nix newbie.)

Mickael, et al: I see that sashiko found some legitimate concerns.
I can fix that up in a V2 if we like the general idea and want to
continue exploring it.

On Sat Oct 24, 2026 at 3:03 PM PDT, Justin Suess wrote:
> On Sat, Oct 24, 2026 at 05:43:26PM -0400, Justin Suess wrote:
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
>> Hi,
>>=20
>> I'll chime in since I run nix and have a little bit of familiarity.
>>=20
>> Looking at my (admittedly bloated) nix store.
>>=20
>> [justin@zenbox ~]$ ls /nix/store | wc -l
>> 259356
>>=20
>> That's a lot of inodes. And a nix derivation creates hundreds if not
>> thousands potentially throughout it's build.
>>=20
>> My main concern is that rulesets are generally considered
>> immutable after enforcement. This allows for well-defined semantics on
>> inheritence. This from my understanding would mutate the ruleset after
>> it's already enforced, so changes wouldn't be copied to inherited
>> domains automatically.
>
> * nvm on this, it looks like you are adding them to a different
> heirarchy. The point still stands though on the inode pinning, which you
> pointed out.
>
>

On the cost:

only entries created directly in the directory that has
the rule get recorded. For Nix that is /nix/store, so a build records
one entry per output ($out, $dev, ...). Nothing is recorded for
$out/foo or anything else under $out.

Access there is allowed because the path walk at access time reaches
$out and finds it in the recorded set, the same way a rule on a directory
covers what is beneath it. Existing store paths are never recorded, so the
store's size does not matter... right?

A bad actor could still create many entries in the store
(touch /nix/store/junk1 ... junk1000000), and each one stays pinned
until the domain is freed. I can add a per-domain limit on the number
of created entries. Nix only needs as many as the derivation has
outputs ($out, $dev etc..).

>>=20
>> My other concern is with the overhead of automatically generating an ins=
erting
>> a rule for every new inode that gets created. It seems like a complex
>> way to tackle this problem.
>>=20
>> But beyond that, let's go back to your usecase.
>>=20
>> ....
>>=20
>> Basically from what I'm seeing you want to grant some access to certain
>> subdirectories (including newly created ones) but exclude others.
>>=20
>> Presumably in the nix case, you want to grant /nix/store/{abc,efg,hij} a=
nd NOT
>> /nix/store/{xyz}, but still allow /nix/store/{foo} (the derivation
>> output) to be created and written to. This would allow the nix build to =
only
>> have access to certain inputs, while being able to write to the /nix/sto=
re
>> and produce an output. This is a valid usecase that Landlock cannot toda=
y
>> accomplish.
>>=20
>> There was this NO_INHERIT series I proposed a little while back.
>> [1] It's sort of the inverse of this (removes accesses inherited from
>> parents rather than granting new access) but would accomplish this
>> goal.
>>=20
>> With NO_INHERIT, you could grant whatever access rights you want by defa=
ult on
>> the parent directory, and place NO_INHERIT on any specific entries you
>> don't want to have inherit those rights.=20
>>
> It seems like NO_INHERIT too might scale poorly for the usecase. Since th=
en
> you are trading O(store) for O(inputs) so not much better (strictly
> worse).
>
> Thoughts?
>
> Justin

On NO_INHERIT: besides the O(store) cost, other builds keep adding
paths to the store while this one runs. Those new paths have no
NO_INHERIT rule, so they would inherit the store-wide access and be
readable by the build. With the CREATED flag, nothing is readable
unless a rule covers it.

>> So for nix use case, you could grant no_inherit on everything except the
>> inputs you need, then add READ/WRITE/MKDIR etc on /nix/store. The new
>> directories would inherit this by default, while the ones you added
>> NO_INHERIT on would be restricted.
>>=20
>> Additionally, you should also examine the mutable domains proposal by
>> Tingmao Wang, which could also facilitate this usecase as well [2] (i.e =
by
>> dynamically adding and removing rules with some fanotify/inotify glue).
>>=20
>> That being said, neither of these two patchsets / proposals are merged,
>> and the playing field is still open on this.
>>=20
>> So the problem you are pointing to is legitamate, but the solution still
>> needs to be considered carefully to avoid complexity.
>>=20
>> Justin
>>=20
>> [1] https://lore.kernel.org/linux-security-module/20260621035223.2651547=
-1-utilityemal77@gmail.com/
>> [2] https://lore.kernel.org/linux-security-module/cover.1741047969.git.m=
@maowtm.org/
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
>> >
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
>> >=20
>> > Series
>> > =3D=3D=3D=3D=3D=3D
>> >=20
>> > Patch 1 lets an LSM observe inode creation through the
>> > inode_init_security hook when no LSM provides an xattr. Patch 2 adds
>> > the LANDLOCK_ADD_RULE_CREATED flag for path-beneath rules and bumps th=
e
>> > ABI to 13. Patch 3 adds selftests.
>> >=20
>> > Testing
>> > =3D=3D=3D=3D=3D=3D=3D
>> >=20
>> > The series applies to the Landlock next branch (3e271a27c46f) and was
>> > tested on Linux 7.3 with that branch applied.
>> >=20
>> > Without patch 2, the five new tests and the ABI version check fail.
>> >=20
>> > Open questions
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >=20
>> > - A created inode stays pinned until the layer's hierarchy is freed, s=
o a
>> >   sandbox that creates many entries in such a directory keeps them all=
 in
>> >   memory. Should this be bounded?
>> >=20
>> > - Creation is detected in inode_init_security, so on filesystems that =
do
>> >   not call security_inode_init_security() created entries get no right=
s.
>> >   Is there a better hook?
>> >=20
>> > - Through overlayfs, created entries get no rights either, because the
>> >   upper inode is created with the mounter's credentials. Should overla=
yfs
>> >   be handled, e.g. via security_dentry_create_files_as()?
>> >=20
>> > - A file renamed or linked in keeps only the rights it had at its sour=
ce.
>> >   Should it get none instead?
>> >=20
>> > ---
>> > Farid Zakaria (3):
>> >       lsm: Call inode_init_security hooks without xattrs
>> >       landlock: Add access rights on created files
>> >       selftests/landlock: Test LANDLOCK_ADD_RULE_CREATED
>> >=20
>> >  Documentation/userspace-api/landlock.rst     |  42 +++++
>> >  include/uapi/linux/landlock.h                |  18 +++
>> >  security/landlock/domain.c                   | 182 ++++++++++++++++++=
++-
>> >  security/landlock/domain.h                   |  28 ++++
>> >  security/landlock/fs.c                       | 176 ++++++++++++++++++=
+--
>> >  security/landlock/object.h                   |   6 +
>> >  security/landlock/ruleset.c                  |   6 +
>> >  security/landlock/ruleset.h                  |  14 ++
>> >  security/landlock/syscalls.c                 |  20 ++-
>> >  security/security.c                          |   9 +-
>> >  tools/testing/selftests/landlock/base_test.c |   2 +-
>> >  tools/testing/selftests/landlock/fs_test.c   | 227 ++++++++++++++++++=
+++++++++
>> >  12 files changed, 703 insertions(+), 27 deletions(-)
>> > ---
>> > base-commit: 3e271a27c46fd591d1011c7de5a644a41e2010f1
>> > change-id: 20261024-landlock-created-rights-9340b00a8c4d
>> >=20
>> > Best regards,
>> > -- =20
>> > Farid Zakaria <farid.m.zakaria@gmail.com>
>> >=20
>> >=20


