Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795528213;
	b=IUgL6I0uRxWPvM0IfbrJwrgsbcukygyRv1PyVyh0TFBjvgFt+fBYrW3JU7lrj855jokT
	 VpZbxFzJGdhqNYxW8LeAoQAZ2EMprmrLGbuNBFUHJQztkODDfyNb73Q3w2OZoDbM3FMns
	 E1LlzvQrOPzTPpXXY2m8B8vEDmt3SJTflbVzCiieEzrW7AVSQpD/y60ZB38+e+tQ/CUOi
	 J8KbwxF7Tb4PGodBai8O8RaXgCl5dqmoBkOIzJ15byFMVbxh13pN+QE7Mgz9QjhIus0Nm
	 CJFyjJeUOpGXXpwIrT4Ehfii16GHgNHGDNT4c7HhjnaA2JhOcgFD9VhP7r/M4yQoZoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
	b=iBMZXpbryrTnQwhYtwPY8rzMiWL0Xh8ETpN3i68tsXCgqiw1FadTlpHXAz6IpHd/ez3H
	 3Y0nQvUxwg7YHC6XQDMUC6YWtitWV15I0rINv/1ShkP2sz6AMFFlp05Eb+guJGVAZRGqG
	 jd4KuuGRSMP/0nlh7QZ50DVL45joreYXKx6Re2LnmBhtdLUsUAnSkDsWEV4GARSHJFndS
	 D0vrvRCo0OfvfYxJG6Y6oi3rU/qhEbY6Jh70DnMwrYPirlsKmUTdraNA288r1L2rKTAqR
	 2XzxfjuTZ0Tb8GLauNLXmxLMj4D2OMa8Htky630vSKALLugRyVOKPkWAIUx/CuA3kAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=A8I4Yhd3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67E606A326
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 13:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B67E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=A8I4Yhd3
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so38147445e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 05:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795528211; cv=none;
        d=google.com; s=arc-20260327;
        b=cojy5nuil0eTX6ruOOpCJHmGci9v8w/RKsVPxsxHF1a1LYmmlUbWSIX6HFTvqSPXS+
         zuhfN1Oc4SsXiHhp2VsFrQf2qSwtayNAlMtDeTvk6fkBRaTTPYR3XTFD6+3OyTXGcsWL
         xFZttNNMfe0X6j1jaLo6wN/Xd5jaT4Qo1JrCfOqzsgMr/5e1NgNKNz6gpB51lLRkPRIF
         48Dcm1wJYyBSiXSCTgjbdlUkYscQkpr6DycpAEwjvSGyMlMLUZpMRu6VsK9/HPlLf0jq
         38N25+EZLDolLW8rtKmu7GBGzsYrQL55TMT1kXCqgu2da4lrSb769u2GlMrEL8A01PHA
         s2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
        fh=G6cyuLIyvrUeNxLbMFOPKAw8qMw4XtfYMf6g0kTIzVI=;
        b=RuHV7Nc5xUElmL5UhzyIiPQc3N1mtcZCr6wR2yugJpHWu0Gj1AFjtTfzZhFOJPRe2v
         7K8/ndq23u0S6+1KK8+ITIuPYhMydLQBBapRp9t+/7vK/d022XULvr4IYnbby8j9NAFB
         syo+6AhA/T/VWRDUBhpO1IGSzjHjmXbyeBc+AsIj/C1+C+mOYVCrporiNJhupL4Rud0i
         DUz9fewFKI8Ax3qI9AFz5lBKAkjo0xIqIAhXCuFykJh37NZ6zEld0mHAtcV24GE86FCq
         TwP8y9XxSQUyhWpIb2fFxZhe6J/kKxucG5KcW8oX9KoMHo05mcUcT3f6UofrCEOEr+ZV
         +IIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795528211; x=1796133011; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
        b=A8I4Yhd3hz3WrVqqp6QMzsDrRJ3HJpUPxahpoSPUafEcj3SFymXcsAZEIf+a8ALG0Y
         V6s6xA+Ay4lWI9NhS7nxfL6F29mbmiE0uOfCYQxnOZUS20qgiOGqYoApJy9HRpK68tu/
         HSDE3IpIQJQ4GKB5Z7mVIff3PBnaum/E2gzkgJ+jFNG6YlWz7P5hX0VEOjoFbkoF1lDn
         8Ndrqr7MabRwOciYR7MGfzUJA7NWdJsl6TU8hPnym7YlbmO7JaMnO34+0kr0IDyXTgzd
         2RYMtv2kGAXDO2iT8hQ8hVHgIcSefON4ja9k6LVugyoh7mCZfqIgxnZvX+r5RFBAMb5n
         NOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528211; x=1796133011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTPCHg4unEN6vtUDvCIgxfYMZVabwQIC4dv3+3CL15w=;
        b=EsUwQG+hhA9q8osma3fOi94JPxCVUoeTcAhVCphVtNaYgITTU85YLNxnvG5HI8FB2d
         q62TqGO/bn++Y5hzQ1VXRQHFWeTQVtLkQpo886nibdCsP/VnE/g6NgqU/Divj+9nLPGR
         qam7+i88NQfuZ4eFQ3UvF+Msgl7P30YVvPQP/QotKwv583icBPfTXBVdgEW6zuWvGZvt
         dL50O24nh+o1BiMCkBiaz4bGdzW9ZmJ5X+ZNmD/mxAHoB/AKif5N3OKIiYiId/9ASl/K
         iPBnKcidPSh5Y/naLRSmFTKG22Pa/R7Z3r6RBAmi21+2dyzdXKWCdNmUSGy0piSNKNKC
         01Ig==
X-Forwarded-Encrypted: i=1; AL+hErEarK4aqVA1dRU6P8gejnSPZ0pr2orNVLj7ZZj3T/SEDemgFfYZO3YaOFOOZJJklsjLJ3Yz8rcKQ7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dEsM131DtaE1eC5IHEkMfJxZ4XBF+JDjvmpF3yn7/McPlGMet
	N1beQLZJhDiMmcwSrrSD80KOc2nVQcAu7ErILX6mpMVG+LXKoeGH6PeB9CMPhGQU+N1mzzTELld
	8OXE/MlgYZHCUFPreXIBsgJ31PtLWPU4=
X-Gm-Gg: AZFdTZdtpRfXKCUr0XvbPqyCZ2kqtR2ebLCHUvgvOX7J7BQgm8wOulZ1cqdXjAYzyHh
	KVO48ZcRYTWSQy9nUQpLH9vm0+yU++tWepO8oL7SUAwJ3JcKlDhrqSp+8ZdN/I2qJxKQCH4YFDh
	R6iR0iGXn2yNIXIploYHDXkkgdraikSULTTzM1dwzJBMcY+Co1PjEHvgXFr0qfA9E0Y/ZXeyLD9
	6v+1npz8BToNSuiDK3EZSnSSHbZG9hUrP1SFdroYhki09WMu7YKdGwojIxIXORz072IKjGg4QbB
	Ad4d7RlJPIuMY7hRjB2y4xVOqioR2OIb/D9PcSdnucXKSxBeNdZ0p51CqlwxR0MLNJ2T+8mxyUA
	1u9fepaGv1cssjXAympU4oiJhwDiqvD1ceiyANjDDjmj0qMk2j0Pj
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id
 5b1f17b1804b1-4bb8881b9d7mr305306125e9.19.1795528210579; Tue, 24 Nov 2026
 05:50:10 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-v2_20230123_tjmercier_google_com-v6-0-dce12fa03ad6@redhat.com>
 <20261124-v2_20230123_tjmercier_google_com-v6-6-dce12fa03ad6@redhat.com>
In-Reply-To: <20261124-v2_20230123_tjmercier_google_com-v6-6-dce12fa03ad6@redhat.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Tue, 24 Nov 2026 14:49:55 +0100
X-Gm-Features: Aa3M54qkPJ8C4GRzLQzCC_QtBShd4rpGnT89RPbtOkkrzzkAiMVQPjTTZfQmmls
Message-ID: <CAJ2a_DeDF+9pbLKS9pcX4Tot4xZZ-K7HydKnDjW6TWC5bvREzQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] selinux: Restrict cross-cgroup memcg charging
To: Albert Esteve <aesteve@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, airlied@gmail.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	echanude@redhat.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 14:05, Albert Esteve <aesteve@redhat.com> wrote:
>
> The security_current_memcg_charge_task() and
> security_current_memcg_charge_cgroup() hooks allow security modules to
> control which processes may charge or transfer memcg memory to another
> process's cgroup, named by a pidfd, or to an arbitrary cgroup named by
> a cgroupfd, both passed in charge_fd. Without a policy implementation,
> either hook is a no-op and the restriction is not enforced.
>
> On SELinux-managed systems the only limit is CAP_SYS_RESOURCE. A
> domain that holds both dma-heap access (today's only exporter that
> opts-in) and that capability, can charge memory to any cgroup outside
> its own subtree. Since the capability is all-or-nothing, SELinux
> policy cannot express which targets such a domain may charge to.
>
> Implement both selinux_memcg_charge_task() and
> selinux_memcg_charge_cgroup() using avc_has_perm() with a new cgroup
> object class and a new charge_to permission. Both charge_fd flavours
> ultimately charge a cgroup, so one permission covers them and the
> target type keeps the distinction: for the pidfd path the target is
> the referred task's SID, as there is no cgroup object to take a label
> from; for the cgroupfd path it is the cgroup directory's inode SID,
> which comes from the genfscon entry for cgroupfs unless the directory
> is relabeled.
>
> The checks run when the charge target is resolved, before the
> CAP_SYS_RESOURCE baseline is evaluated, and apply to every explicit
> charge_fd target, including the caller's own subtree, so policy needs
> a rule even for self-charging. Policy authors can then grant
> cross-cgroup charging selectively, for example:
>
>   allow allocator_app_t client_app_t:cgroup charge_to;
>   allow allocator_app_t cgroup_t:cgroup charge_to;
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  security/selinux/hooks.c            | 19 +++++++++++++++++++
>  security/selinux/include/classmap.h |  1 +
>  2 files changed, 20 insertions(+)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 6c4c64d6e904..76a714107ae4 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2204,6 +2204,23 @@ static int selinux_capable(const struct cred *cred, struct user_namespace *ns,
>         return cred_has_capability(cred, cap, opts, ns == &init_user_ns);
>  }
>
> +static int selinux_memcg_charge_task(const struct cred *to)
> +{
> +       const struct cred *cred = current_cred();
> +
> +       return avc_has_perm(cred_sid(cred), cred_sid(to),

Small nit:
`cred_sid(current_cred())` could be simplified using `current_sid()`

> +                           SECCLASS_CGROUP, CGROUP__CHARGE_TO, NULL);
> +}
> +
> +static int selinux_memcg_charge_cgroup(const struct file *file)
> +{
> +       const struct cred *cred = current_cred();
> +       struct inode_security_struct *isec = inode_security(file_inode(file));
> +
> +       return avc_has_perm(cred_sid(cred), isec->sid, SECCLASS_CGROUP,
> +                           CGROUP__CHARGE_TO, NULL);
> +}
> +
>  static int selinux_quotactl(int cmds, int type, int id, const struct super_block *sb)
>  {
>         const struct cred *cred = current_cred();
> @@ -7683,6 +7700,8 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
>         LSM_HOOK_INIT(capget, selinux_capget),
>         LSM_HOOK_INIT(capset, selinux_capset),
>         LSM_HOOK_INIT(capable, selinux_capable),
> +       LSM_HOOK_INIT(memcg_charge_task, selinux_memcg_charge_task),
> +       LSM_HOOK_INIT(memcg_charge_cgroup, selinux_memcg_charge_cgroup),
>         LSM_HOOK_INIT(quotactl, selinux_quotactl),
>         LSM_HOOK_INIT(quota_on, selinux_quota_on),
>         LSM_HOOK_INIT(syslog, selinux_syslog),
> diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> index 90cb61b16425..1f1f2fc4d35d 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -181,6 +181,7 @@ const struct security_class_mapping secclass_map[] = {
>         { "user_namespace", { "create", NULL } },
>         { "memfd_file",
>           { COMMON_FILE_PERMS, "execute_no_trans", "entrypoint", NULL } },
> +       { "cgroup", { "charge_to", NULL } },
>         /* last one */ { NULL, {} }
>  };
>
>
> --
> 2.55.0
>
>
