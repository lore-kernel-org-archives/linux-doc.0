Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793228190;
	b=JCCgxa+aL8CW+2JP+LI+wBxzCAnm8+PPS8EfiANiG74odogODskCw1kW0IWVkwrNWV8b
	 vILsTUz5NpqLD/Zqi5VtZb1w3OFUy0EWQfBIJOmiWWbqIWoMHc/dhX9G6GHxfdjJddoqK
	 s/i56rg6D16KCyOBkdQsO+BTISiPWyZ8XGm82FIyIUXFoiw1/Ch0bF0TEzdkIfNr5dA0E
	 F0PGh2SE8hFtFFwtYjy3oLEHl8QJyWyaa/9Lqw+qumLATObrmALPp2Iq2Lmll+xd4gjL2
	 CaCk/uWyPaPNsCTAXiXeC5FGhVvDzKjlclDhVIzcSVnNqpQEAp5tiZD//8W2gMGASQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
	b=FWSEQMbITFCzx+V6AHGpwMb86+QJWQbTeVgNoiIKc5W21DXEzJSdHexrSgtIoL7za+de
	 hPBBicsHw0zjPK2qA7DP1kKtopBk0xVyYoen50WfvrVrWHaajzjbDgvw2dbT5bG3QuwhS
	 Y0Bp7KRgLEzZnMvTgBYi+6dr5j30goheem9t7mU6CUZ6Sj/PPxRYL467UoJaxVAe5J4bq
	 nXxv5B79b+nnsTROi9Gf4Lt45LSbVMh5Fmh2wpbXOq9W5UbPj9ySc88HhR845u6RVL7uK
	 re6NMXmTAW9jDWicOOTycnIfKscpO43gaJFp7vKX3wF8uKFNY8E2lo8d5hBJBgkE4VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZOSlVJG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1B606A31F
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B1B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZOSlVJG
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso1096324e87.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793228183; cv=none;
        d=google.com; s=arc-20260327;
        b=cnUE3IFL67MXAIfTYXffRfTzmQB3fN6q9vaxWyAma9427ilKSswQhH1UirIHTtjGCV
         Ods3hWVTbsuDLdQKcSxPcanxuk4/by9fBsCHiiSKoMPcelt4ZvYW9zTjG4Xt6iZmHr0h
         pUvTMOtCAqyAZhR2mOfMYqtmg06CiU+2u0yV22jbL52y1j1/h6Bn+j+AI10+N3AwA0Cd
         NEfOaFQIRQ/1evY4/u5sya75XvlEOaMv/N2ucB1xCzgpJTkEGXvs9rd/kHedq4Upc4/V
         eboVWsjkuvil4+j4d22ePD6HbcNrL8uART/Uwt5yjyuvvyo0UDlYwfZGKigIjmKS24Wf
         BPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        fh=scwMATsxzXmYWtPaq97ErI1V8jqmHoOK+Mq2K8khmQQ=;
        b=n51o2EVLIu2XyMLf+UBkrYHkt7TvCN4jzODMpyFJgLWUTR8KDrqW2l5N56wGTCS+RF
         BSgnXMsIJXg6oS93P2DBL9tuZebkDDTN67Ty4U0Q7cfthYZskC4kN9koY/p3hrZSQLlU
         6KLBlqxtIDzh+AWcgfIQlNTWIrE03Kn0V06LILViM9cG5Mottzc+Ge8qAzR1RUx8U07h
         sb/LDaoPi7xfJs37QwLUCZl91LaudHtp2WqGC4nOk25wCDZxCVADbq5+HbBN8gPGXgnD
         A1wBg/ea+F8Deg4f2E8naV/jnm5pw7WC9h/yM5ZjOvqsSTPMtCd/Cm6ind5E9bB/3Dze
         Tg+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793228183; x=1793832983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        b=bZOSlVJGtHEYwYd8P/JXTJGc0heKbmZ4zF6gCQsfAWUdj+V8lveZo37a35kI44zsZG
         8r9p4GP3JXlJVRf/lRQCeD7DpNu+EpwjtNRy8B/mAQWg4VrhYeyQL+tDoFWr1hQ8Js/1
         WmBu61FcofxUa9iC2o9+OqMJhIY2ZxGCvswPzn8Prxv7xx3PhcvCqjngxpEz26C3Zh5+
         QCDR/cnpyszjYnYa+NJ3GR//R0d+Eo5+XTYFDLb2ivFHUdLHCDDXia/PshsMR6SOBMAE
         M4o+rVXHudqK4Y3GjiNjn4cOkyeetgJTVfYAYDZGmr6blu+DiQE+KChOyTySu65qfvrn
         wIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228183; x=1793832983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        b=JXkigMYHD9H+uDGjul1tdDKVbEgwN0bQJ6f8snddhMGLBzXWDEO81MhExYBZ6A8keM
         bSBaT3AJXHOk447ISnetp+mJr+m8/uag/XunirS6zToLtbRcmiRCJHWq10z7tsb7h0Ht
         jEzcP4Q1GqafWDubthlgWXLj02Zm1kFU34XTBCPhaHLfFBQ+S4k7miNiTrovfowKFCgG
         4ynTTkHg1HO6efzY8PvXzIeTSlL2JF3lbOIVVVK0UVuuvp6iWmk8U7GRQwK0gXcWZXNp
         22xghOg5lDWVNPnYaNpo5nyqS1cy8BouTN4VhtWVkhBU6yj+aQVcCswjMlTIeiFosmvv
         dwIw==
X-Forwarded-Encrypted: i=1; AKwUvBzYFBCKB6xAW42FvH2Yi/7xmTsqJdJ5aSFbqvIo2WDuKT9zOANnXk/wSLVlwpIwNDhoW4XJnq8pEe0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0NUlUoYudI/JSMpzwdEVdw/pyPfbpkmACbNdFChj9KMC3MWEy
	4OqN0MXDUH6STcannVd6VNuFND+LSfZ6BcFsVJc/EPF3CEqdJvQqA2bwiubQ5gxZ38Qtn7Xsj4z
	wCSin3euHsrD4gjEMTzJ2JY/gL19u+kTnEc2LVGIR
X-Gm-Gg: AYBFou1PSYvNGdrE1m7r3mFeGmPjAskP3ulQzzWaamcdcvo9hx4fflVl8Q2aVbVL73z
	DZra9CyGRFlTl06OuWDeq0ef202G+8dL2WpyG6WXSTd5+HNASukqOBWaa/4d0eYYj6cVvFXoh27
	3bJpa5fAA1C5F3NS0kvUMw3MwrVDr7JqYbObe9gRgRQS6ADFs3tUwB1u0N5orbPSdRIpq96Z9cF
	Pffl8YK1R1VxOmuj4fsca596pWY07Z700qKSBLsNnxSJ+tM3W5GtUa2lfekyFOju3uTuQhoi3D7
	HJ3Y8FnUpOSHSJnx8OGswM+v3rG0AhTe4n/DklsLgF/upZh5C0UpukQKOIdW5VFYWbF5de7aNJJ
	dNheYDLQ8UVjGUlvten/YUvyOPzlYkuS5cTFcsg==
X-Received: by 2002:a05:6512:3e19:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5bfcad69127mr1282221e87.38.1793228183136; Wed, 28 Oct 2026
 15:56:23 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com>
In-Reply-To: <20261028221705.3915340-1-halg@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 28 Oct 2026 15:56:11 -0700
X-Gm-Features: AclHuK_P2NrO86m_OPGwNSCuxqmiVp7fbTt4tlVfFApQPbneLnvcqCjpUTpk6N8
Message-ID: <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 3:18=E2=80=AFPM Hallgrimur H. Gunnarsson
<halg@google.com> wrote:
>
> When an unprivileged process creates a new user namespace, it is granted
> a full set of capabilities (CAP_FULL_SET) scoped to that namespace.
> While these capabilities are isolated to the namespace, they allow
> unprivileged local users to reach deep kernel subsystems (most notably
> networking configuration and raw sockets via CAP_NET_ADMIN and
> CAP_NET_RAW) that historically assumed a trusted caller and have
> accounted for a large share of local privilege escalation
> vulnerabilities.
>
> Many workloads and sandboxes use unprivileged user namespaces strictly
> for basic UID/GID, mount, PID, or network isolation and never need
> high-risk capabilities like CAP_NET_ADMIN or CAP_NET_RAW. Likewise,
> system administrators often want a host-wide policy ceiling restricting
> which capabilities unprivileged user namespaces may acquire, without
> disabling unprivileged user namespaces altogether.
>
> Prior work by Jonathan Calmels [1] proposed addressing this via a sixth
> per-thread capability set (cap_userns) alongside a global sysctl mask.
> During that discussion [1, 2], feedback (e.g. from Casey Schaufler)
> suggested that rather than adding another per-thread capability set and
> prctl() interface, capability restrictions could be integrated directly
> into struct user_namespace and configured via clone3(). At the same
> time, as noted in [1], a clone3() flag alone is not sufficient for
> administrators who need to enforce a host-wide ceiling on unprivileged
> user namespaces without modifying every userspace callsite.
>
> This series combines both pieces of feedback: it embeds a capability
> bounding set (cap_bset) directly into struct user_namespace, reusing
> the existing task cap_bset, cap_permitted, and cap_effective sets on
> namespace entry, and provides both a system-wide sysctl ceiling for
> unprivileged user namespaces and a CLONE_NEWUSER_BSET flag for
> voluntary per-namespace restriction via clone3().

Why should the task's cap masks affect this?  *Maybe* cap_bset makes
sense, but I'm struggling a bit to see why cap_permitted and
cap_effective should matter.

Also, I think that Docker in non-userns mode restricts cap_bset, and
the purpose of that restriction is rather at odds with interpreting it
as a restriction on newly created user namespaces for purposes of
vulnerability mitigation.

>
> In addition, because restricting CAP_NET_ADMIN at user namespace
> creation time prevents userspace from bringing up the loopback
> interface in new network namespaces, the series first introduces
> an opt-in flag to automatically enable loopback on network namespace
> creation:
>
> 1. Opt-in loopback activation on netns creation (Patch 1)
>
>   New network namespaces start with the loopback interface (lo) DOWN by
>   default, requiring CAP_NET_ADMIN over the owning user namespace to
>   bring it up. To block external network access while preserving
>   localhost networking, sandboxes commonly create an isolated network
>   namespace with only the loopback interface enabled.
>

The whole unshare/clone flag situation is getting out of hand, IMO.
And this new thing makes logical sense but is really about reducing
exposure.

Perhaps we should instead have a small list associated with a userns
(extensible in the future) of things that the ns's admin (i.e. whoever
has CAP_SYS_ADMIN relative to the ns) may do.  That list could
include:

- Create loopback with sensible defaults for ipv4 and/or ipv6 (i see
no obvious reason to separate them)
- Create tun/tap interfaces in that ns (and attach them, etc)

And add a very simple new API to do these things.  Actually, the
tun/tap could just use the normal mechanism.

Thoughts?

--=20
Andy Lutomirski
AMA Capital Management, LLC
