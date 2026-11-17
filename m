Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937497;
	b=Wy0kvw8Spw2DLfdCaK4UKHqep1fm/t6xBg4uHJlkgacNbef2a18CSPYjkDwmnv735/+k
	 1Mb2KzMtrl0nwO3rxSBz3xD10fRLztvazzO5BA5AN4TAdUzxKIk81oqWNY91D99Cncjru
	 yuGiulGwVVM8fBTN4nIklBx834O7geZYxuizdikeUwXHGuYepG0gzRvhyPcR6ZkbjJ3l7
	 fPETGZT1InbnXIFbbbkXyIGiM+kd0p9coQc4MKYyqKaqkKQCI+J1qp03dmI4bLChT4akq
	 AM89YXPsnch5xqftVRQpjECXfdE9+Y7uu/k4KA5LG4bfXRflfvy60P69o/Lpsz5Gkhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
	b=S7sQZcXDV062MVlzQGLm2E2J4tSTJ3MoXfHGi33Os4G0cGXnQhCs+uljoMOqUoaL//q2
	 oyteNuqtesRytyoCEV4Sl/QtnZElI5X+OfZSoDO3dF9fWNgxFQUH0JOq7RXnwv7gvdf1b
	 KPaOO6BKDtMOCFPlrN0zSZZSmMPeJttowUqsNsrd0cX88u4XEAOleV25T5JDQjCOnvm0L
	 eMo1WmtC+e0bH1Ju0ZLyiLuTgPeFkwzAO4+JZByZjMeNOR1oypzEJXHpXCk6NSoEhjbPL
	 74kVQuALIKUEd9COW2Cg0z9XdLOsdgRIlb30wbjTbRnK3RovqoUWRDbehSZCsIz1ITQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oAFIhfOA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E751606A32C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 17:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E751606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oAFIhfOA
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso1820e87.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937495; cv=none;
        d=google.com; s=arc-20260327;
        b=EXj4VvHyJtuiMPsdtjb+/uNeo7t62WL85znNnhGPUkJAsWNldnA76GjZwAtqnMuZeC
         GBmerOkNHJ85/cCYxAAW4YRNYn1S+XRQzxcGtXq3BcsMuS3wrsp8dLwBX9AvTIQF6YKD
         4ZWvtUksuRoya/zCNrwvcTbPX2z3DFhAPkItMOX5P7/HOo1HsC5+mEQOvezlIzKdadQu
         kYDJj6oG6BI6A5fWCtlVqRSUq+kRwZHLYhqGSQYHVDocmO8iuBe4B0YUO1OiMCUYRKNE
         bF9JR9czz3cyPAdu0xz8LyHFRdHPGN24Fh9pcuERFj/PcMB9+q7tnBWyBM5tyfnoxtRx
         GN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        fh=mduiHi44SAOV7q+Puh6Xy1yGhPqFYJLVXp5nPWSm38Y=;
        b=aYLGmXqfJp+hDjUqTmtK580w6qFhcYZmlDLD9Ea9xTFpbF/H84Wrh9KwxxI4PTuvsc
         KDF/NgPhi98nBhIdUnEcm7WPSjuASL+aWCQdJkfUrOin7NigyAqNBdPg0toApeh751FG
         IhwQLlWftbtrFn/33eclRgTCvg/OnUWEiFIRv0ib1csIKwtQmI0a1fUriXyEdl9flAHx
         kP7XbfkI6wW0P4cAF6tl1+XWbpMdmpATb8+DCFy2KLDUpNy5RdvytObs5FXNjf0zn4aX
         ++76YKCvfN8QGXPF+myHiIe5TlFC++GHIl2cTyCC4cwXbcjypbhTzHDM8+uLSbh+y8rH
         s3RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794937495; x=1795542295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        b=oAFIhfOAkcB0Dg4mKVfkuis2uNtcfHHW1ME1slyaFUO4AI5iAHAmrY1Nw3LuN2VQnC
         6IGXyvAYklXrHuXDFIJP+OpIvCKpQXcsR6yhi7y7UMeoYZWd0Rkq8srCeIQr3Ut6yHo9
         s3QMrLw8d+7yQo0fv8lDR6N1UWY7BgFBjya/tZ7WAbd98chUjwhGKhZVz4B8CNKS2JVt
         s01yrFYXNsMtBbhpU0mHCjFVPEb/8RNf03yXDk0jC6t71dtVUAnUQlSNlv3yrv5kFy/Z
         7TcwXV5Nfa08sHn/NIrA4+u1dyH1Y1UL/1CiJgo3Ncba+UeXkhzzSc1rUH+9TFU6YyuR
         ZiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937495; x=1795542295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNNOnQUc8HQHxzszI7I5Z5MCWmY2JGLCloKQuWJY2Z0=;
        b=D4HCOe4BJK7GHg5GWaxhCI8fkPNV9LLg7qwLfy6JthZiwfXrj0AFM1AATseovoctoO
         7b0NtiYVBIhcnzCfipv3K8ruJlcLzvM1XV3y78C9U6RcEZiPYj736CDMZjWhfA8p7I7O
         99j6SI8b7fb1G/zG3ukKwHHW2iC2cwzlO9ZPoCTPtMjk4fBAUgdRL7Fl/Ems9m5MCUiR
         a84dAYlr7EC/xyN/Y5dAC0ROzwkittwo+vjGpZmjvW/gjJs9XCS0klK1Ce6x8UFa2SX2
         bUvVGoPVHcLKLbVH7Py7wk1640SayC8cz2CZzkRPCF9TvPiqDeSnPTlHnuRYCR3+0M9J
         OM/Q==
X-Forwarded-Encrypted: i=1; AL+hErH025q20fDEXupMPKkdG6/RH7BA6mCQKm8F8obKsozYVwDCCIdn7AhtVy9lHicPxKYbMg4HpmZIcw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zglK+vxb7O4bLpiwPCmvGxXerxtevXsIcfHkKT+1TqlXRGHQA
	mkrs7lzmJGJu+1prkAM9L+qfGfYQYZBD3EaJtCGbze/DhWLhhr+f0NQZXlcsVMSltyxLOk+vkle
	Ndbfu+XzcYwAHd1gEoKIfF96o7u6+6Ocg9CzlM80c
X-Gm-Gg: AYBFou1IkAi70+S/eTP7GLisUPYBusQ0Uhz82N+y1sXYqKEFf5yb2WQddD/pGjbprMT
	l7WSX84TDx/iN3pwDTtfbhXMY+Ec6s61WPN+iLBz71AVA8vQwGaD50y6ss8LjMRWP9O2I6qOhKL
	YEgax6nzJza+cRv9qWty7OqCB0w/ZRcZaWgmp0eaCJQks+c5vJT4xho11J//t+vhvU/fItQ0Lw3
	EbZMKtMlqXJDoXB8qYkFPUWZb87CnxiXKL7Xr2UA8djcGjg7zjCJcpn/7tYMY/fx7SygGsRNv/q
	KdEPo4ry5zASkeciNgItAVaX/D9aBKrzSRGEMwyxNoGE6qFWRG8k4LDdmW4NqkpzgegjwHcA7hM
	L3vC3ts3+Y7GHuo924chujQBqPjNOMdMbr9ImuZEWT5YeiHgBGoNzr9Q=
X-Received: by 2002:ac2:51c6:0:b0:5bf:b945:4334 with SMTP id
 2adb3069b0e04-5c170a15b78mr6210350e87.67.1794937495491; Tue, 17 Nov 2026
 09:44:55 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org>
In-Reply-To: <20261117050841.3289652-1-jarkko@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 09:44:43 -0800
X-Gm-Features: Aa3M54pzaE332pTi53D1YpA5VO7WahNUrZvzEHccu8lFNhASVJD5SKW-Zdzq05g
Message-ID: <CALCETrUBUnJVhiMkft6hTZZMe8nTpMBRTGY2v=9x5ETBSvmPZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Namespace for namespace roots
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

On Mon, Nov 16, 2026 at 9:08=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> OVERVIEW
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> The problem that root namespaces try to resolve is starting a container
> from a root mount tree that is pre-populated before any process is allowe=
d
> to run, without inheriting any host mount-tree ancestors.
>
> Work on this feature started originally in 2025 from David Howells'
> container object patch set [1], but I turned container objects into a
> namespace of namespace roots and built a new implementation around this
> premise.
>
> In early 2026, the patch set was left to gather dust in my kernel tree
> [2]. Then, the other day I saw [3] as was shocked by its over the top
> complexity and thus, here we are.
>
> Not doubling the number of container frameworks inside Linux kernel is at
> least a benefit over container object based solutions. Parallel plumbing =
is
> an inherent flaw of container objects, and it directly affects on
> development and maintenance cost of container runtimes.
>
> Also, thanks to better scoped implementation surface, verifying rootns
> correctness is factors easier than with container objects, and even my
> early kselftest is meaningful. We know what and where we are testing,
> which is always great.
>
> Finally, it is more compatible with pre-existing container tooling
> whereas container objects would have much higher cost.
>
> [1] https://lore.kernel.org/all/155059610368.17079.2220554006494174417.st=
git@warthog.procyon.org.uk/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.gi=
t/log/?h=3Drootns
> [3] https://lore.kernel.org/linux-fsdevel/20261105-b4-cells-v3-0-bc909593=
7a84@toxicpanda.com/
>
> IMPLEMENTATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> rootns_create() allocates a rootns object backed by a pollable anonymous
> inode fd, pinning dedicated empty mount (CLONE_EMPTY_MNTNS) and PID
> namespaces along with any optional namespaces selected in flags.
>
> Before entry, a manager prepares the mount tree through the control fd:
> FSCONFIG_SET_ROOTNS binds a newly opened fs_context to the target rootns,
> and move_mount(..., MOVE_MOUNT_T_ROOTNS_ROOT) installs "/" onto the nullf=
s
> root once and attaches relative submounts beneath it.
>
> rootns_enter() forks a child directly into the rootns credentials,
> nsproxy, and root path without mutating the caller in place. The first
> entrant becomes PID 1; once it exits and zap_pid_ns_processes() reaps all
> members, poll() reports EPOLLHUP and rootns_wait() returns init's status
> and rusage. rootns_kill() walks pid_ns->idr under RCU to signal member
> thread groups.

Can you clarify what this new API actually does?  I've read this three
times, and the best understanding I've come up with is that you've
designed a way to create a group of namespaces identified by an fd and
you're adding an API to configure and enter them cleanly.  Which
sounds very sensible.  But I'm completely confused as to why a
namespace needs to be owned by a "rootns" or why that ownership
affects even newly created sub-namespaces.

--Andy
--=20
Andy Lutomirski
AMA Capital Management, LLC
