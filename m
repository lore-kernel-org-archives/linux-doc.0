Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6707413227
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930970; cv=pass; b=k8IqJ4qIxkV6wMwLEDolLW6WoPz29o120ZtGbzCdOo9ZIh+cZ6PLtrb3qvNYC0sGWjUFXmKg/svvMFMRCnBZCEFcoXM9wgm5Bd+BrJ8eyNl/aRU3GiRKAirjkHLCoDRqcCtAw4ELwBF4uG2dwd3Y+YZwSypzZ6To0ynhCxVSxAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930970; c=relaxed/simple;
	bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0h5qcVLIzt/ptGEmZuXX5dLVqtvju6tfpVHOQvQyeikCECm2F/VASsxaO0iKq4vJvOwO7+5+tXg24wdR9Jnce/VW4rq+yIl/URgPDQKQk8RAsyTQzSOBzp6VHCMDXaxLLj1AryoC1MycedVvhHLhx5K12OSw1Y/acFh3vPSxIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SN4g2w+7; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SN4g2w+7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so29125a12.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 08:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780930963; cv=none;
        d=google.com; s=arc-20240605;
        b=UtDGCUsIDQWAhnQ+2j5/eQopS48mVvX+tpinLZ2PpiZ2oN2X3kPCIMPibcgX3octlH
         XWBoWn96MS+VfJaBPXB7Kgj9e26EiD5EQLUVTooYj8ev8j2tez0cgVZmUd29MR2d9G0M
         aHHiwzQI08H6kIHCtuCTzKSQayCMQYFZezGBFLBSUhCqcbuD8GSruwnpIkIEbSIcja/K
         KSb+1yVCLBX3YqFNFeZqkWvP1VFF37aBmQKdElsvfZNx9ni2NrPXjp0+3dZEuj9EJi+Y
         5BrnyYHYZC7oTN+OGZgWhXalTrkAZUuJPNacv/HktZ0qhaSPru1aDwrG9lCMuDMWDl6I
         v+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
        fh=w5Vp6g/C9ro7O3ay6Flqo9I+i9O4rI6s+AXd7JaY6WM=;
        b=kViBnyquRPmWdIBqyWLWy5Vrcj/oqua74pjNnWy8LaSh/zWGTrKK3Qd4Zpnb/+91vG
         kviKlHnX8d8q4IRNGejgnzMzN1xl4U85Nw4R0Geji7a95nejl4K/P4J7AdJCgASGEP5X
         0Rr2ZRfey9/mZCwkoDQ5eM/hsk++nSfIlBabJsFzEDgeuSSaVVHpVWfa/UwVW4PcJX9X
         ZHOFjSgR1oVZvanbwJBwaVDOBfAGTuXBcZ+e69PY4XNMfwda5VhFgMS6TssFXqzrsmZ5
         WReQo62iJpp+fecOpLL8W81cUPrhEOjbLtM+zwVPw7z4hlWHyINnH9ADWusDDa5SGQXJ
         kSXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780930963; x=1781535763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
        b=SN4g2w+7L37u55NOHnH62hsXGmHRkvICDQ97Qol/4mqxJN6kaeE8TAGexGnPVk+0Sj
         vOwhOYMqgm/ZclL9AVkos/+Rx8n4xUQp6WI17G0GvGaF7oUhQmM6qa4pgZfpehiTajlm
         1SDyEkqnzK56xnyHFwufRSwSX0EjLVEUE9paFJ3tapzaLxxpDd9MLsnbyCvYHXQ8eyRx
         jqeFQF/H5AIlNqAkFEFS+VpK/60tXK9rrfMmWz4xC7aWMinwx328dqWwShlEraX65KC1
         MjGPFslpEltXzdQ+rgN6o+Eovk1f5szk3IXtjEeBQEUbHxqXHqaAtVntDNampvk7JuT5
         Eqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930963; x=1781535763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
        b=tI09PM028i2DX//yW35TT2eLmhJ57LRbhACJIWMYxKcACi4BnW58sIEjZcFAny5qFW
         wAeZh7rqkoZEND4476orT+vYb1Tnu50w8uvQfQ1yAihhyHCnyNJqzMv8F9eI7U3xCips
         sVTX7ZlIyWDAFJZ0JZ1XiIYE3ujwquzYNWoZEKQR2a0VXvSQFs9ODmcpPFjRd9TUUkv9
         H+Kh1zvqE4nzjdbRU/wfeuJdW54z/vJIKJ4x5BqSkQXxWcAZkF40aA8QpmdfZBwZRsil
         eI7V7PkfkVmP9BIwkjFAADgXe5Uu3axDJvFeBpRMgpX8qAnRWWRtlHVzRuYlW1d1T9E/
         oVrw==
X-Forwarded-Encrypted: i=1; AFNElJ/OnI/tAsq1FHnjAxFHNHllzm/kMpbAVvvdQFKx4lskAS4xe9BJlxnemk7WqeKgVznpsgxHNidpQGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDd+foxLFmptBDLv7smHRpNvPD0yMdZzsZKteTTC/Wau9dVGp
	euxID5/2xLXufJ/5SVpw/lJU/REGVEx961P2K1e3VzJguwUG/Lh6+yuvFve24OIIT30IMQxkq4k
	ksyu6ORWJVJelNxzBOaJxu16MI8DRyzDwc42aiwTg
X-Gm-Gg: Acq92OFP4zFqLHfzWyFKS5BCDVd4HAGLFT97G4pSdNtwy5XSQn1g1KEm+FZ/B2OWaNZ
	qjnUdV24Y5BO/y9pwR4S4HqrWY85o1BBbqhQUUgw0j5gfMtvVfPIpS5TwlT9mXO2iw9DNg86hAr
	17zYOPgLWwU1ZNO2FIHs819r7f7nmBZjwm3mjQZ3GuIjjaTmnqRgDKhtZobDiASvAykd+Ljo8px
	CHKZ42MCAIVz+RHrtKN1sZdHDXAkt2kiy8i4p9k60MBzE9mGsVzZtGKYVHaPZjWiWaeW8C8BaeZ
	RWMFSctCK8rMT/rjxTw0YsXoV+0g9QcTzUo7H4Km8fme6lnh
X-Received: by 2002:aa7:d848:0:b0:68f:d41d:ca5d with SMTP id
 4fb4d7f45d1cf-68fe907ab8amr167661a12.11.1780930962621; Mon, 08 Jun 2026
 08:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528095235.2491226-1-me@linux.beauty> <vealb52tv5suireenkke4lul2l3wbnaul2rp3ea545ly5wa5ty@yk3aksvp7skt>
In-Reply-To: <vealb52tv5suireenkke4lul2l3wbnaul2rp3ea545ly5wa5ty@yk3aksvp7skt>
From: Jann Horn <jannh@google.com>
Date: Mon, 8 Jun 2026 17:02:06 +0200
X-Gm-Features: AVVi8CcAEOXMmuMTSZ94akkMqWU1PSwZDT3Kns1-hWwyFL18yvP1h0y8fjumjnQ
Message-ID: <CAG48ez38OEE8ZPLyU6nr9=cYx-hMsdoh5WRrv-GMZGMDKyyOTA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/13] exec: add spawn templates for repeated
 executable startup
To: Mateusz Guzik <mjguzik@gmail.com>, Christian Brauner <brauner@kernel.org>
Cc: Li Chen <me@linux.beauty>, Kees Cook <kees@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:55=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
> This problem is dear to my heart and I have been pondering it on and off
> for some time now. The entire fork + exec idiom is terrible and needs to
> be retired.

It seems to me like vfork+exec is a decent UAPI building block, on
which you can build nice-looking userspace APIs, though I agree that
this is not an ideal direct interface for application code.

> Additionally there is a known problem where transiently copied file
> descriptors on fork + exec cause a headache in multithreaded programs
> doing something like this in parallel. I only did cursory reading, it
> seems your patchset keeps the same problem in place.

I think we almost have UAPI that would let you avoid this issue?
You can use clone() with CLONE_FILES, then unshare the FD table with
close_range(3, UINT_MAX, CLOSE_RANGE_UNSHARE). That is not currently
implemented to be atomic with stuff that happens on other threads, but
if we changed that, and it doesn't provide a good way to carry some
FDs across, but it feels to me like this could be fixed with a variant
of close_range() that removes O_CLOEXEC FDs except ones listed in an
array.

> There are numerous impactful ways to speed up execs both in terms of
> single-threaded cost and their multicore scalability, most of which
> would be immediately usable by all programs without an opt-in. imo these
> needs to be exhausted before something like a "template" can be
> considered.

(I think probably a large part of this would be stuff that happens in
userspace, like dynamic linking.)

> Per the above, the primary win would stem from *NOT* messing with mm.

As you write below, I think we have that with CLONE_MM? The C function
vfork() is kind of a terrible API because of its returns-twice
behavior, but I think if process cloning with CLONE_VM|CLONE_VFORK was
wrapped by libc in a way similar to clone() (with the child executing
a separate handler function), or if it was used in the implementation
of some higher-level process-spawning API, it would be a perfectly
fine API?

Or am I misunderstanding what you mean by "messing with mm"?

> As in, whatever the interface, it needs to create an "empty" target
> process (for lack of a better term).
>
> In terms of userspace-visible APIs, a clean solution escapes me.

I think we already have relatively good API for this - you can use
clone() to create something that initially shares almost all the state
that a thread would, and then incrementally unshare resources and go
through execve().
