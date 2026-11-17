Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937360;
	b=KcB39aDuKUEu0iLWmJCniHFqkJyV0MUewxEzSrOqvhhb+zVft5g90Yy5eWV4rJ3hDCQB
	 b7n0qDj3s/jJdxDRJtT13F0mJbmpwiPHx/Q/RUuJCRNOWJJyHnwDXsOYebqLiaHdP+dpL
	 bgq6fRBCUQ3P5+BlXCoon7uV3ObnAQWK+ygJliuiKwRvKnxIStT70ozOGiPLRRFfYTQor
	 c7jW1wEP1KJzRqRxbrCVgUmO+TBV6Ujhe9TUehjJMXS63eFQonctJBLrzTrwp2C7Ar0U6
	 zT1Oc9N5FalAsaWRjIhrNCa6BUbLEZQNtbywlV/GI1ZmK69Gt7mU00mGq8D5x3QKCUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
	b=r1oqCHGAQ6aWeH3+whXk4/qZVoY1vIbs97b4UkofIHwJ989cg6b2K9GV9ipW0byT/Jh/
	 CgDSayeSWYnSBay8XcZA/e8s2lA7n5Oo2bUffxCfooEm1pKG/ywlNOYpnfG3m4vV0bJOR
	 epj5xLgeG0AxQXPFf6Gbc7XeVQMSl0MLEsjTXEKTWriol6hx7L8vfuRnWvY3m3t3R34K1
	 DLeAq1U9RC0wgGs2S7vr8EQrcWFsS2dL2GmzrW5q9dx5VHsXd1FEOoU4pk4dZ6vjkOWuN
	 QRInFjRfO/hJhlEpNHCc7TPg8ea508HpK3a22c9btxffsbn19kFwpjUg5Sbl9fJuxjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EEvWGAFb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB99606A32A
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 17:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EEvWGAFb
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so1562711fa.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937359; cv=none;
        d=google.com; s=arc-20260327;
        b=nr4+Ghh+EDIVXjGNLB9ZQMoRhlOL33lEuKfQUXOSUA0idG0JJLdQk3xea0e+RkNwg3
         A8d0gbxpuPoubkOiyEMWZEVPEOUEpGsWUkiYplpY9XWbjx5TYhSQAQQuJYy9o3JJH/FU
         G7DK48jYeLR6Q+B2/pObD8q4AkRyc5QaQ7cMzQs7pfj8tFH6V2yB4vTcrDo8SzD3ZS24
         k1U/tymFFMpGBdRu2/Ob1Ruox6PapTZUd44aEEEjyciemglbRnbDhbzBEgudxwvQoyS7
         /EQoq0tZopJTMkOR+hTeiF3/CdYUE5NDBS8FxnjHKDgt1DlLMhhtRb9KZnZ6BMzcp0Sn
         fx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        fh=Le4bwMoI4YoZrVOkrF31dyCCHLrbIOKKlEAAQh9B5d4=;
        b=TiJd4UmVwCh2rr9qjgJ6S6aVrWY1i1xMdkT8MBDwgAzO9dzH+/4p7YZkgZvnZRjPim
         qQA8foRGozwHiVDh1SNiH8QiDgZ2n3hr+dd5HA7SfbW4Os2rHI7is64JP/udwWWX+tba
         pqaNyvnN6plR1g+So48nz775Qc5VfnxsyvOF1wN3TRgysV7g7EGtWP54HV1C1I/7TXlr
         4eST43WnENo4RoGrQb4tLfVnA1U9I4k1HiJnvZ9+MPb0D84iCCAKSSquuXhX5DyG7IJd
         /ziBNYIYsAZv/jCQRCi9vOCD+ml/OmcEV4x56JAFup6oXFc1wK3Bif+Y3jAjhWPQuDEU
         i9kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794937359; x=1795542159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        b=EEvWGAFbOmPz0e1bruaOl0rjybH0s4KDHt1ZdsIprIDdOYSYYFkdgv0P5ZbqLm9wOt
         QUKZ38KmXI7yBp+GV0/eyJrlR0x9jaOEr3Ii55nnjpnVrQIiwkaoActJokk0nmQSZd7G
         61WKKrB70e3ufmKjp4oHO9TAABVl1efKkOpBvtOYK6RF6gVHy0E+rjZz0xIx57DanHDh
         1TInlFBGPv/IJYMg1cTj312Sc7q2gHY8Ugtu6+Jpk/LKIOoiULHPpgJvsVB0ghEN1g8q
         2dPQMdyQdgbZ8hjQrp+yJxxt3I0107KE+viwJ2hHYYVk4FGOG+dWGVAy9wgHIHfa0LWA
         TeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937359; x=1795542159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0Br6uNbCeSZG/D0SaMC7uBQz4y4PQvjObMC5HHmvxw=;
        b=lmaCDdb9pxOF9FJb7wv5WC2gdnpDs3qPNDqXWdV/fr+MGEjvNUn4nO0/px9QAaCKvD
         wFKyxaYM9xw0Z+BN9PFeOJkD1UggV0YBpTocg+H2pdeiqbrcUDalMZCJb1VAIjG6NySW
         SSMJ8QCLKVLab6rMf+KwoBFLPJqaCMANBu9JIoAXXAVDgD6WJzrs+IEKkG06URaqQrQ4
         o0fxco8YXBm0c5hCFcyL4ABQtGF2fWCfdtnTAz0nqvQ8BLjq3hmZAF5OKMj0hUT6xOiH
         b2SSQC1NeIboyE2F44t+Bq9xdoUYFiLoBHzoDdO9yA8ogWVEDpEa4cSm4Mfx/Iqhlj2B
         OciA==
X-Forwarded-Encrypted: i=1; AL+hErHQMe9zBGjM9W3tCsCxYTvbryLNy/9/pBfs4Rripn70eRod5Pp7Untxk+hdjT9YvDPA0ZZFZJp/Y1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nqswtHf6i2oEnMQXYODSWikUHabUL2IE/Z9OGlDdeXU5svaMf
	SVHYlBcpn9Dz/LxNVNkW0PNPMo1MwXV4wwI+v5Dl3/iT1kQ77B2f8HLXHIatG1QykurKPdvvQjn
	fiy2RO3mtIu9bhndAsV/t0UciinQ0PxFOH+ghOBvf
X-Gm-Gg: AYBFou1usXpJWGfyJkQSRSiCLFo0YSqaX6yjsVeunJzIN/uElZcDIQw/jGO55unI783
	pLyGVBejwNXPD/dH3q3DwPuVpz+A2gzXsyR9Q336h3CH71AF/IULC+5LW3lKFz+QN1dQXy/dgOk
	47s1kkyA+VImj9UM7KBBBXl84LVq9IFC0xswHXDB5MGIIaSljNhXCOqHeYn3va2ciCmZyWzn9tn
	B7TUpcj/la/BoI8zg/qOrGsb3q2gWWQUoD56JPp/BvPN9RVAgx005bvnGTrIJLgyn63vPhfmLVM
	0ZhX/zkZHYeWoesROT3E5+50gxQglhM8VaHkA1bNHAoxt/R+Vr78+V08bZYYA9uKofMjjJrv83M
	3oYtv4NEkgo6Hg4vf9QQTzQcYLuMhQ950Dw==
X-Received: by 2002:ac2:4bc9:0:b0:5c1:4ccf:f0b8 with SMTP id
 2adb3069b0e04-5c170a0bb3cmr7252657e87.16.1794937358574; Tue, 17 Nov 2026
 09:42:38 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org> <20261117050841.3289652-8-jarkko@kernel.org>
In-Reply-To: <20261117050841.3289652-8-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 09:42:26 -0800
X-Gm-Features: Aa3M54o6AJsup2EB_D5C3UIkkriS8wK22wW9apyv8KKATx5_DoWBh2HrH9mfDyU
Message-ID: <CALCETrWtbUFQGDOCHkxAN9O4i29ixfL5KKF1Cqw2-CjxKwC6gQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/13] rootns: Add rootns_enter() system call
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:09=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> Multithreaded userspace daemons cannot call setns(CLONE_NEWUSER) or
> safely mutate process-wide filesystem state in place before spawning a
> child into a target namespace set.
>
> Add the rootns_enter() system call to fork a child process directly into
> a rootns whose root mount has been installed. Transition the rootns from
> ROOTNS_READY through ROOTNS_FORKING to ROOTNS_RUNNING for the first
> process so it becomes PID 1, serialize concurrent entrants on waitq
> until bootstrap resolves, and admit subsequent callers into the running
> PID namespace until teardown begins.
>
> Require CAP_SYS_ADMIN in the target user namespace, forbid credential or
> PR_SET_NO_NEW_PRIVS privilege escalation

Why are you disallowing this if no_new_privs?

This isn't necessarily a showstopper, but fork() is really quite slow
in many cases.  It would be nice to have a more spawn-like API
available.  I assume it's possible to open a file in the target's
mountns by some sane API even without entering that mountns, as a side
effect of how the fsopen / move_mount mechanism works.

--Andy
