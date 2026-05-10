Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFD9257854
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406587; cv=pass; b=DKznK1uXirjbrolEYcPyihC175xSo3qw/ldxTDbOVuW43gArla2LgFMRIzp3lXPENWdEbLv/dC137NpDZ3wjBkFSRahC42gky+EydobBtHgm+ds0ph1nwzIyWIe9ejHZ8BkYqrU/xauVffDX5LHMdraFDXf03vI1HLxKkDt8a4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406587; c=relaxed/simple;
	bh=lJQniN39MziSusnrSeOllIKVtVemIJd3P4RXjYACezk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/FLEwV2TIvUAMFS2+mClo+hXgM+jbwpodpg+9Jm+AhkuoNSRjKjD2le13EgHIB0xU8G0322bhABB4SNXcCEsHVvpv7ovozgrTi3JQWRQ5PY8Y4l557JhvloT3FHIqIYb1/jMH8EwtVmt5f4AcTM3M5OBfFx+P7bYGTQ5C6TXsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeTCXj1q; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeTCXj1q"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f6e6a0a215so249422eec.2
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 02:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778406585; cv=none;
        d=google.com; s=arc-20240605;
        b=EL6dsMKHV7Pm7hMLWZkX679qcLwlTmaMevjg+OOewMSL1oWIHUK/pQNu19Hb97m/Fc
         iLCHT1hHUjlPGv3iaNTsven5IbOd3TtFKW0LOEd9rhhFt8o/oye7iPVdUXJTKWUM8+C2
         bFVu9Jb+VRV195ExB0Mum4nrAgqJG5yoW95RbU2aaBu3WlqOTLlUrMA3R5Ocioxgm7Ta
         ZFZcn3xwVyI1x6CwxTOcPlwOF9+WqpD9DqIRiLmLjaQwvkU6F6OX3G5ddQQ4UT5fgTHt
         /ib6QyG8KGczPYrIKKeskDk8V3iTg8SYLTmFkri8n9H0KisjsOEoyU5nD6fneJ11uZ58
         sqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        fh=FthiEDXsmfgy7WKS4kUHCSf0j3vLdFliFhLa+l6q1IU=;
        b=BNX68P/pqsc9asMorZ2FUKNz0JkMCYuDDxEYfqxrBewiiMVtmRxg+XN9bA/Uhth1Bd
         Hm4/1yENgzjEMs9N/V40fpr+YIGvAV0ifvIEZodssBapuHOvG8Zk8vqjTpsr5VAeN5WZ
         najAfFA9jVjgihC5+lKfJMCIKIwVtotQEAKTTOJuMLmPCaO8FQwhyTXNlHWrWgaqdRJt
         C7lxIvOBUJa6j4/xJlc0X2QpsbdoRKiBOmlLBXUcETxeRrkxLFUqj8lfWpMqWUxlLLNZ
         +2cQguPL+L2etG/EMJ9GqFKaIA3KyHHryUlkrhLKllVYHmnDJ2mMm62CNpHxllPf/iZl
         Jmlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406585; x=1779011385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        b=VeTCXj1qlRbFO7LmPcLoVI6ldZazYNphicwv/BaQTE+GH4MthQqUhTXxpYgP4YTK1J
         AZWyB6uG2zSytTYmqje/1AgdRy5DeAHtkKeT1BbwxE6YtE4fZInYkGakV8JsqEqHEDRo
         TXVCM46Iu4kuCoUhTQs3bfdgpnlJ3MB4eCgxJR5ce4a6xd7VE6U1u+/0XBQYxP4uuktF
         M6G7aJtkFSXSLdQ+nVAB2PtQD74ZuuG9SB//j3yPxIVrJFvDwxb8QRJ3HMUlH9vV0Sev
         4gi1BQtiaqawpx0jS1vjZGypefUn2OI9ZXL4abVGCHTYRk8RVTIM9AEwDO5agwlIvygn
         i9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406585; x=1779011385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        b=blnLYT/oJqLYdVf1XL3/s72EX/KfGV9epuRd3Q/ykw8zALYmBpZlcrMospLp18iaVh
         qCbz/XVctMd7QknaNn6Bk8oDK39KJd2LOwxxiWZLbSmwtBpGYjbA4jD5piiUVUWWRKoM
         /vLejEwEq+//MkOw2d4twse9yUHFjVU138SwVpv2+wh6JxAZN8HMOh5l/qdgAgxRlLZH
         fvU+1y11I++yMXmDScureXEkPlV+N1FLJEtP51QMcfA5GFo8g+sFT6vWajAOm4VuHlf8
         MjFRSFDq4932UiqZXFz0GkGqG5b7r4HyFn8W2THnybviXYFlJXPP1loPR0nAR2QLJ4Ve
         DFWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g6SeGm8dadUJMdMGMAuXq/V2gLE8mm1Z41jRz4LsQ/fCKB9huzZ33gJyhkmVPckmQ3cr+cc58Boc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNngOt1Z2+SqLVpKDfK3J3sEK/lAX0qzegf9X38p29rdl/G8oo
	f2NBl5QRX5SFPtYSI+K2dLIfRzW+ZtrLxALckRXtcgd+5PEkE/VTJPmAKUcjhxpE8jxWhyHdSKd
	Ios5mAsxZGYqVPMHEBwUyO+B6qPNZKMo=
X-Gm-Gg: Acq92OGQutDScmmTSNOmmpYTVy2H8TqfQmHJiG/6D1yMRFrkRmnaxwSXd0eCRWy/aAU
	n4WEoIczx+0BR6rm22j05uo5xq2AtbZkUBIq7uvMrV9tEHAhp/Y0CdisDpXdAcfBP4v9ovdHK+z
	PqepvOMgIF80FsKiYe3858DsAQuQFgpwVF8n6ZbzWw8G8+QLheuFc2yulL+A0Z2o9sb+taGDWsd
	DXZIYreEu9k8k/p6xsawF+kuQc40T2b+eTDYaS1Vm/nIFevgqnsy1utyY0p/T1rD/nmrsAPZuLR
	n+Grtb9dafemsN0MZ3r7HQEAJYtKDeWEH6G+3Ys2IDhjsxlHbaixEcO/u9QcTfd6qjQUspdQawg
	YijjUW3Bycj/aNba/19i+V4o27clyC1BDc9YjP9MGMUIl
X-Received: by 2002:a05:7300:d511:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2f59fed19famr3955753eec.8.1778406584746; Sun, 10 May 2026
 02:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509203808.1142311-1-julianbraha@gmail.com> <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
In-Reply-To: <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 10 May 2026 11:49:31 +0200
X-Gm-Features: AVHnY4ISEl_kLYwIQZ64WmR4duBVOb0clDciE4kHT74zzm-QAgeyD8jr_6WPd14
Message-ID: <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Jan Engelhardt <ej@inai.de>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 7:06=E2=80=AFAM Jan Engelhardt <ej@inai.de> wrote:
>
> Good lord, how is anyone supposed to review that amount =E2=80=93
> or is it just getting rubberstamped anyway?

Yeah, if one really wants to statically vendor the files, then please
follow the pattern we used for other vendoring: see the commits that
introduced e.g. `rust/syn/`.

In particular, we try to cut down there the dependencies and the files
within each dependency to those that are actually needed: no need to
support vendor optional dependencies that aren't used (and if they are
used, please try to see if they could be avoided), no need to support
all platforms (e.g. why do we need FreeBSD files here?), no need to
vendor the tests nor scripts, and so on.

For instance, for `syn`, I modified it (minimally) to cut down one
dependency. I also provided a script in the commit message to verify
the files are 1:1 identical to the ones upstream (before adapting them
with SPDX identifiers etc.).

So, from a quick look, here I see files like:

  scripts/kconfirm/vendor/vcpkg/test-data/normalized/installed/x86-windows/=
bin/freetype.dll

Which I would be surprised if they are needed.

In any case, when we discussed offline building in v1, that did not
necessarily mean vendoring every dependency manually into the tree,
but rather let the user set up the dependencies before (i.e.
connecting is fine) so that then the actual `make` steps can proceed
offline. For instance, using `cargo vendor`:

  https://doc.rust-lang.org/cargo/commands/cargo-vendor.html

In other words, one should be able to have users run a command or
similar, and then use the dependencies that are already downloaded.

By the way, another option for that may be using the distribution's
registry (e.g. Debian and Fedora provide one through the package
manager). That is even better (and we were requested to look into it
back then for `syn`), but it does introduce complications even if one
assumes Cargo is available (which we don't so far in the normal build
path), e.g. the versions need to fit, one still needs to provide a way
to do it for distributions that do not match, etc.

I hope that helps!

Cheers,
Miguel
