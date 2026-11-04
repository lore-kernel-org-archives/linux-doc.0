Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801408;
	b=XUEk7q+h4Kv5IlSROvzqlmjYgO1cDiwz5mSo2YQAzuy99KX35PzfB4pBBGLv7jYKxcEh
	 HPCCTdnKxOOkDjGbUJc9/r+RuBBGosdxwgtbStAM4MrxJ1828XWbuMZKEB5ux0HAQEIeO
	 0PTHr5d3A2jMmQVodiq2D5LQOzc8HmM3/2+v9YSzK+eYhXZPzmcWn4LpvXCYBYJlMTHma
	 EqT3BY67Ht4U4Au9RaSV9R5copVKHr+PpUvm5wC8OAvdH8TiWmXUrb82fNx5sJo+E515X
	 nPBgq9CrK2Ajp+D0cXOs180Cs57hIQhSx59LVP0hvsJnQcFVzrQWrE53yt/ioMMxnUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GN5BfdRea5fYOeBLCJpptlR+i/h5pRU6WPEvbKGT6ZM=;
	b=bYNnbbc0rOOeMdv2XDUuFtYAasTHqCnbrp9MYjiGlmGJ/0lj590lStJualoMjxsZQZru
	 RFOxykLX97FW/MU6Q/W1dcal1gm45biR8t4Vt6950cxglwA6qW40y3d//0gmsAO44ONE0
	 4UNkWQK7VnPs2DQHlC+X9DKhHIgUO67hi04/WIWp8CsJueLbkYj6zvHqzpRUxgSzV3yMG
	 YOd8GEFwyLVpD3BcozRtrk6wu0WlfAVXzPRYQLR8tTlIKAMYht9q+DPBY3rMXrGSLN19v
	 OeZeSDQeqRFMFLPSh0uABGW/UTf62OF53EUS5C/I0i8JXWQbF5VJCUpmJm6kinWjooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="pq3g/bOU";
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224FB606A33E
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 14:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224FB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pq3g/bOU
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91e8938fd01so4426076d6.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793801406; x=1794406206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GN5BfdRea5fYOeBLCJpptlR+i/h5pRU6WPEvbKGT6ZM=;
        b=pq3g/bOUfq0Yp9sLjFjCbtvlrE7Qv37AIQDPWErqvoVqdvo9xd9+crfCI1n/K0m2B6
         /wyj/0wj7PG9On9oxbXiA4rR65b4VsiwfWH27eP7hjSzrTjFaPE5VsCuVLqLFeDollNV
         sSQkgF5p76zqF8M9G+GCUKOvNgstu4dm2MtmBAlnVSrHvAx2VNh1rsIbm7TLW/4YUnpH
         2wamaFqvyznTtMzIDz0Caf8OxwRpcmXrUmepVB5vQmVQ2aC5DHcIMLavjRxAG33cfmcv
         YehJUZYQiSvn32N26c8g4y7N960LtKU/uhkwpOuWWY9Gt8P0rRbNkVIa/+Gz2vV9TBLy
         qiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801406; x=1794406206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GN5BfdRea5fYOeBLCJpptlR+i/h5pRU6WPEvbKGT6ZM=;
        b=yHGr0IfCTt3LJDhkg4jUp9AxVS9Dfrz2hSf4XvhvtyV4g/DQ1jL14IvIwUXPkbr3kq
         psU432rLXEqPZncUVqulsunqyrUBDP9OOKnfH62wbm86Jgzr3DegPnbvcx0G5sqUy+GA
         lB6Jv7nNOsce7VQw7aJafYRls3NBp5OIgT4qNTdkLnSPRPfTG2yn5K6LECr4V9yQgkYE
         s98j3Zu43KixXsdYbY6x5jt6d03umSm0AtcLDM9JVqyIC4ZOSiIu6BfipY1TofykfgQX
         FBI9nXg/h17klHi2wTuP2SaSv8tPYGWODMsyuWM/XQ3AjotlhuY89QKxIwftThtjmOGm
         WOPQ==
X-Forwarded-Encrypted: i=1; AKwUvByPslxVcnbBi0wUB1Uz/8RoAuVOnckBZHMmNQU0nWGL8p0iA/RSsfWi5B5Yaa0rbNsyGwbpshDAgYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KXErM5LYMkmS8X4Lawz/qtHlZrB9mEmsWPCnFFmD5BDADyGto
	w2vMWr1BFOe2hg2rDm/TwG18vkV8AHjmnFEUJxy3WwYurpAPF7APXKjDzpHMZCQ9FXw=
X-Gm-Gg: AYBFou3pWvRJ4rylLeB8tzVC5cFpeG/xGFiP3Rv+3cToBhpY0dK+rLXtYgznKMQUOtB
	wUXe21dQPkmLPCbbvWadmSvihk09DjjU+0RU5k3Th3HZHrq7e/VJ7RXVlhcuWt9h1Z0m43JTo89
	uZWVgiUjbZKUilgFRwWjN/NUXHdgbh/CdvrJkB9UIm7gByFzSpolJFiR/P5qLBdjti3J60rIg23
	Tn2ioX91f7hQ0PtK2CjQqu1iqD9Qaz/HmQRwB2o4NmVLRfDHxW/4f0oTqEn4zonT8utP5Sa9Ilf
	YPaWo4fXFfMUHtwlONsqkeqIZyJq+EMLjtIigHLZQ6ENlApAXXVtJNCO4Y5arrFMaTQQBmGUMYt
	U4Wdqh9i14mc/Q/H/f76zcQdTTAGmRLfT2AxzUQ9zn3kPK7Xs8v4lMFj9y+L3ZLsNrl5PJuaAn4
	mx2T3phPkj8PWlItjch40eFDEoPWWQSj+GfujKZrwtf6zIs3x0p2Hf25tTpGUHMK9JJzoUzi7Pt
	jfRLyr4vGX8yK7ut1pFdiNgtlfLYt6py15T7m+PtgftTaX3s5Ka3ciQorB1tvTsB9hoKxRgXXIh
	FJI9FD3JQCdrsXrBZxNS5ECsChX/KnDhuuwSPcXF9slrRgtJiPyrt6NdEt+DUZy2mw==
X-Received: by 2002:a05:6214:5902:b0:91c:7c53:152d with SMTP id 6a1803df08f44-91ca4b2d871mr264201116d6.29.1793801405923;
        Wed, 04 Nov 2026 06:10:05 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e728f87sm19598316d6.36.2026.11.04.06.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:10:05 -0800 (PST)
Date: Wed, 4 Nov 2026 14:09:52 +0000
From: Josef Bacik <josef@toxicpanda.com>
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jann Horn <jannh@google.com>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
Message-ID: <orevqgwqw53sxc3tii5zr6x7veu3p5nr3ndkndegpikfogmqy6@j5agkwrxcksj>
References: <20261028221705.3915340-1-halg@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028221705.3915340-1-halg@google.com>

On Wed, Oct 28, 2026 at 10:16:57PM +0000, Hallgrimur H. Gunnarsson wrote:
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
>   However, requiring a sandbox to hold CAP_NET_ADMIN in a new user
>   namespace solely to bring loopback up conflicts with reducing the
>   CAP_NET_ADMIN attack surface. Today, an unprivileged sandbox must
>   start with CAP_NET_ADMIN to bring loopback up, drop it, and then
>   block CAP_NET_ADMIN from being regained in nested user namespaces
>   (e.g. via seccomp or max_user_namespaces limits). Conversely, when
>   CAP_NET_ADMIN is restricted at user namespace creation time (via the
>   sysctl ceiling or CLONE_NEWUSER_BSET introduced in Patches 2-3, or
>   via LSMs such as Landlock), tasks inside the new namespace never
>   acquire CAP_NET_ADMIN and cannot bring loopback up from userspace,
>   breaking localhost networking for unprivileged sandboxes.
> 
>   Introduce the CLONE_NEWNET_LOOPBACK flag for clone3() and the
>   corresponding UNSHARE_NEWNET_LOOPBACK flag for unshare(), which imply
>   CLONE_NEWNET and automatically bring the loopback device up in
>   copy_net_ns() before returning the new network namespace. Making this
>   an explicit opt-in preserves default network namespace semantics
>   while allowing unprivileged sandboxes to create an isolated network
>   namespace with functional localhost networking without ever holding
>   CAP_NET_ADMIN.
> 
> 2. Per-user-namespace capability bounding set & sysctl ceiling (Patch 2)
> 
>   Add cap_bset to struct user_namespace (initialized to CAP_FULL_SET in
>   init_user_ns) and introduce a system-wide sysctl ceiling for
>   unprivileged users at:
>     /proc/sys/kernel/unprivileged_userns_caps_allowed
>   (defaulting to CAP_FULL_SET).
> 
>   When a new user namespace is created:
>   - Privileged creators (holding CAP_SYS_ADMIN in the parent user
>     namespace) inherit cap_bset from the parent user namespace.
>   - Unprivileged creators (lacking CAP_SYS_ADMIN in the parent user
>     namespace) have the child namespace's bounding set constrained by
>     the sysctl ceiling combined with any effective capabilities the
>     creator already holds in the parent namespace:
>         child_bset = parent_bset & (sysctl_ceiling | creator_effective)
>     Allowing the creator to retain capabilities it already holds in the
>     parent namespace ensures that a process granted a specific
>     capability (e.g. CAP_NET_ADMIN) does not lose it when creating a
>     nested user namespace.
> 
>   When a task enters a user namespace via clone()/unshare() or
>   setns(), its cap_bset, cap_permitted, and cap_effective sets are
>   clamped to user_ns->cap_bset. In addition, cap_capable_helper() is
>   updated so that implicit capabilities granted to the parent-namespace
>   owner of a user namespace are likewise bounded by the owned
>   namespace's cap_bset.
> 
> 3. Per-namespace restriction via clone3() (Patch 3)
> 
>   Introduce CLONE_NEWUSER_BSET and add cap_bset to struct clone_args.
>   When specified alongside CLONE_NEWUSER, the new user namespace's
>   bounding set is further intersected with the requested cap_bset mask,
>   allowing container runtimes and sandboxes to drop unneeded capabilities
>   from a user namespace at creation time even when permitted by the
>   global sysctl.
> 
> 4. Introspection via NS_USER_GET_INFO (Patch 4)
> 
>   While tasks inside a user namespace see their initial ceiling in
>   /proc/<pid>/status (CapBnd), threads may subsequently drop
>   individual capabilities from their per-thread bounding set. Add
>   an extensible NS_USER_GET_INFO ioctl on userns file descriptors
>   to allow userspace to directly query a user namespace's cap_bset.
> 
> 5. Selftests (Patches 5-8)
> 
>   Add kselftest suites covering CLONE_NEWNET_LOOPBACK, the sysctl
>   ceiling, creator capability retention, nested monotonicity,
>   parent-owner bounding, CLONE_NEWUSER_BSET and NS_USER_GET_INFO.
> 

FYI I'm doing something similar with cells
(https://github.com/josefbacik/linux/tree/cells) that gives the same
sort of discrete control over the different parts of the network.

I super dislike this mapping of user to capabilities, as you said it
creates this hodgepodge of areas that need to be updated and just
creates more possibility of escapes where we get it wrong.

Extending userns makes sense in the current landscape, but I'd rather
get away from using arbitrary user ids + a capability set as a control
for what a task can do. Thanks,

Josef
