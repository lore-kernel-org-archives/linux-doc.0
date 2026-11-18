Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795021194;
	b=GvrT0gqdqVPCZBFRSzGOHbIlCyPhUZ0fFQqJpIWF4PY0osfzDSrXZLO3YaxsKIBFguxl
	 IzrqSYIi/8a8iMQ7Jh4HEW1/JW7f3oSfB9gNlmlrQhamzZBOm41Fl0J3uZ3hjDuyknj8I
	 oTnAiKmKW12gnrldpexgMdWm7NkH/6e8bfET4to4Q8TK4glaPhN/FPnCLhFUR3BsOLY2s
	 cbR5HDZG3Sv0khGzgm02RPjl4+HXdnpRSGDt9M9LNb5bKZNnGWvhs5WB4WneIPOC/eYI1
	 ucl/Jl8eUpGVSGEEwW8BHGXnDarkNSstq4FFnWAJqjUBAe/w5yHhYs1JiB1XTm/xcEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
	b=2PxQ1SpLRcbxXVhuNm0MLHQVeWNFgK4/Sdp7sfYlGPRx+xMpwT37R85YJnBqZXc1JGRm
	 2TGATA9/exwi6qgikS156aa8k3XKG/mH7DpmQTgxbQlETtXEUvGKPYCTY3ArWwiHrJsir
	 DlYD8741FJe0dEnX1KeSt0JG+9Zys8GdRlSWhEyJ1n+XFFI++e/PaPovJhOsuGXj60VdU
	 mSQrL/gC03WieyVzmGrkvYmgGyKPkxWBnzcN2KbG136Tf5oyGjc+S5a/otDVgHMS1ZlqM
	 LXTvovZeQpGgVMNnRgK5O10j5m1bJcN0hscrIHL935wAoIapDrfTaMF0tEFM3K5d9bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="tsb3jtv/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281E606A337
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5281E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tsb3jtv/
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14f7768acso896107e87.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795021192; cv=none;
        d=google.com; s=arc-20260327;
        b=U3vUaLagggTqDtJbIp42TijCu56gSCAQnFjXzAgynWLEN95k3Axrpm0rs1eByLbw7R
         B9G4+28+IVKJmyWhKVAnBeX7Zl+WUXLrUMekUsuPAGNGmJEx+BJIXpMwQX6thL20V2tw
         nazinXTawFvUyOpjf1zizW8COn5Sf52MhSfzrZyZPjgJx9+GPMbmbhwMmQkbD1XALI5S
         3WuAWzmIlhklUFcDuHTXIYicJcbwVTfiMP/iidQCKI0SK6q+eBPbKHLpkBdPmxy4/Tc4
         yGDBTU4bKFaUyPw/jfBAT2L4tKfLacFhP1VpdGLP68KxIQdXv9nNykMGYgExPXom9yVn
         /2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        fh=trOI2ANMz7Sy+XTN0ZgdOkMonLLoKuMd0MHk7saW98w=;
        b=Zg/S9bCF0EIp5qbdnAvS2PkbxI+M/jsa4+rb27TR2FUwRcQKnAGRc/ksfy0h96QznE
         Ykb9nBEb4DcEZEutirX2iV6ynZG2yLY+urzNoImsVIyEdXzThKeC1nMWUrrVmF5eFSSv
         gLBXPAoa+N0qIarEUJVYAd31J3gHit2Xso0GhdxwgYJGbR0Cny0NbYK9pzWsBB8G4OpH
         AyvCdBq8wp27HqYznIYoJJDTFeADIsrZJ9F7w1fVuqnh6WqFTspNPIX/IAkEI3HX5kZY
         YXxkQgFFSEZS/Q2WXULhuw/TAeRZhXu0/82gLaIKkK6po5GC4oNuAeMejomUFPs/cS5+
         Z7AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795021192; x=1795625992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        b=tsb3jtv/d+zI1r94mKuk01oFSXaGJ5VfBd68Dm3Rzy3k/9SLJEJI9zvC5ERx83P8mh
         L/1k5WahXt+pRRzhHcYHDMSRuJM1TjD5VHtPSmgdvcsE7bgjMsIlMo+YJOsxodt6BDKE
         WgZi0KNeAOjP6r2GiyTfd+fHBUESbduG4DYdClB/Bqst6T6AYc3Y24sbaheI8lu+qMGX
         3hhYwGZJIpgbaepiYwepZXr+V9cZ/bQz35fnXnkTNzQzPv5ISz2zAb8tKPjJ5JQ0vFBn
         iosrC4gHAY/nVJ74V0i+yTKb1wxgWpU8SzcVufvUcALVry0duvdDvm8V8jy8r4h1xcDj
         iTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021192; x=1795625992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eo4FKNzNbHf/eH43g1C8Z3to6Do7+2E27gt4uDxW08=;
        b=mRtnOADLlRbRkhKqLYWLAEdYqfTz6KQqoszj1bjRNNjlKtN7G7sBXRWg0fkozJ/wIc
         ph7K0XWrjKAqabEtdxqoZo0ptKf4mLYJOslY74o/bHUoGaOiKs2Aj2MHfLaG2bATJdkp
         gj0sKuBnot7xAGkekyX4wZ7rg2WLJGCRX/lN+xMOk0xk0eIcSrAFcdyW5vFhzxFMFxFY
         SvSHayYzgzBEfqd7VmrOsTvyWmQYFOgs6WEtPsTGuGGonLJEF8yJvDjzs8Jj2tkonPzX
         so5HyIB+hmoI4HQyGNJ890AW+UetqxIw7jvYgQg2N4o+rIDWeh95V8qX3ah6DISFosBV
         NukQ==
X-Forwarded-Encrypted: i=1; AL+hErEmNXrGBZOb8keagB6U+rkijGJ9ixcYBvLBh+xC2MQS/2x0Y3LyKIx4rzzH15KkDC3sgwFUcEkWQYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MNIDgTgiowHrmYkCr7jwQKa3Zn3AB9MVUY8WLID8Kut9Egy8B
	QxUY+Npuyt7U7Ui3OnaMVgul+sDxjKmXSg+Fs7JxZJVgYk8RWx8YAmAdJGh3XqZihAEHDsnz4nk
	OnSzs679O4wddzTx5W3L/3GGeQYUwrz0NXa0n3PXX
X-Gm-Gg: AYBFou1agYJfaEVaHcbmf/HWe4FsW9FeV1o62Nz4InIqEU3UVT4X16tbCQ7J9Sa5aC+
	DLoi/f7zd6tKBBLW75OQmuqvfJH5vWw9knDBLcU8e/0H7ZlAPsxDUQOY0P/y0ZOWBVQdw6YiDbE
	k6h1k5+F799Xiws72jxTtcQvzD/W+uw8nT3eCesccot/cb+pUgY1bYk8XQZLb2JN8kWMR9YgjBS
	z14xWInbKCzbVJL4BU+xmbsxpI32vyn6l9rCUGnKkABNy5iqtOn2UhUv8/ATYDFLVW3SMa5GlO3
	68WcbiP9MAU0CVm8UhbJKsHNjItKnHaVvUDlznXObwHmQRspgZ8ADQPB2cpXo+NpUQE+OfxgA1D
	zdsyMo5FDeha9+hOymRhInwTJaue2uSd2Zw==
X-Received: by 2002:a05:6512:318a:b0:5c1:4e41:3cdf with SMTP id
 2adb3069b0e04-5c1a9c09ccemr1012943e87.12.1795021192313; Wed, 18 Nov 2026
 08:59:52 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117231352.3816603-1-jarkko@kernel.org>
In-Reply-To: <20261117231352.3816603-1-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 08:59:39 -0800
X-Gm-Features: Aa3M54p70wvOKpegO09-C-J-9l2I7cJO4B_J5hynU_tjApdK664yCTjVeFp42MQ
Message-ID: <CALCETrVUkbpoFjwSAejyA4b_9qEauAP_36i=O8Op1ifp8aUkqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
To: Jarkko Sakkinen <jarkko@kernel.org>, josef@toxicpanda.com
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	John Johansen <john.johansen@canonical.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Kees Cook <kees@kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:14=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> OVERVIEW
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> A root namespace (rootns) is a kernel object backed by a file descriptor
> that binds together:
>
> 1. A full or partial set of detached namespaces.
> 2. A dedicated PID namespace for spawning processes into, signaling
>    members, and polling or waiting on PID 1 exit.
> 3. An initially empty mount namespace (CLONE_EMPTY_MNTNS) that must be
>    populated before going live, without inheriting host mount-tree
>    ancestors.
>
> Work on this feature started in 2025 from David Howells' container object
> patch set [1], which I turned into a namespace for namespace roots and
> rebuilt around that premise.
>
> While the patch set is manually written, the original motivation came
> from isolating LLM agents. Running untrusted agent workloads made it
> clear that OCI runtimes need to minimize their live configuration
> surface.
>
> Assembling mounts, credentials, and namespaces inside helper processes
> with a half-configured container is what I see as the main challenge,
> and the existential debate around namespaces and container objects is an
> unfocused discussion topic.


I've skimmed some of the series, and I see a bunch of good ideas that
involve using an fd to manage a thing.  But I'm wondering how much of
the value is added by that and how much is added by having a new
*type* of thing: the "rootns".

How much of the value comes from the rootns vs the new APIs to
configure namespaces without entering them first?

For that matter, the cells series also seems to contain a (possibly
very similar) variant of the same thing.

Would it make sense to come up with a patchset that does *just* the
configure-a-namespace-by-fd part?  It seems to me that this should be
an easier thing to agree on, and it's a big part of the complexity of
all of this, and it solves a real problem even without
cells/rootnses/jails/whatever.

--Andy
