Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E761E25FA
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292145; cv=none; b=dvLF1Zir4+1QuY8MCAR1EH2WKqQI0yMALj8b4RyAJoF4J2va7yT9Lbgh+O8zb+3K1U9fw4WADmhS5mZGCr7YPWp2ve5SLdGawDcTT0P14WG2dosmFakIHrIaRKOuhdQzMGSB68n5tGd9yUda/zVFooaiTg/hPXp21n8PkBTuEzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292145; c=relaxed/simple;
	bh=kqT747FmPo57Mh2L2DsdkZ1PQOh+OrrGGBMEC/GEJIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ta9wyindgoylzvDQCv8ZZE+dtOkQVU4rKdyBtwBdpelvDrUEGM27F4JoR+bSQt6TY8CWKAjFor1/OAxQ7vk656v60HiAMr46VRPVr2luivlF+Mf0eFmiuIOI/KjlRT9ek6u5P3hGS5xjtCH7VaOlunI3lxBfJdFWPTjcAGEtccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xshsazb7; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xshsazb7"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4679b5c66d0so40471cf.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 15:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736292142; x=1736896942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrVZBpUmvlm0NnokXpGjQnKUqHj01A+8/hZhhPzYQoI=;
        b=xshsazb7+/J0AOBRj+S7ImsKwuRri4PuvfDMqfR47+VHi+dz/Z/MkF0zceXW5A8MoO
         J+0FDFPSiCYmCAMIOy2DEfEW4MbYXMVpkn55l2JNDStyvfDjmlhCPAPI81fP1yNbyis+
         RRfse/rPp00uq3qj9S80M1Z+8UGGCu3WoKGWzVNrVN0wGyVcQF2yKpFz+Zibb2TIU800
         FBUC29S1KeDleQjme6ctTq5mVzPFbdTBe1G48a3vewhyoPvtmxmVRpCGcfXho3jQYYi+
         qDzAwqQDMj05mcg0NEHasYotnOaWfgW5U2L/x+0BWin3tNPk5eN0QpadUkn9SVZCv8Uw
         e19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292142; x=1736896942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrVZBpUmvlm0NnokXpGjQnKUqHj01A+8/hZhhPzYQoI=;
        b=C1Kh2wDHpP+1JXEcGQSvDXjQnNNVqO8iEtybqMY5/rD2eGU1d5PI8EF8i3TkI/i92C
         JiOZOl/whpsZV9qVTkemwo3Qowwckaqcpn/jPBAt5I+DNY4pvLwdZKO6RodjVUCMwnyJ
         5u/Pa37ez3K9KVxvlrhjIXylO+604APoX/HFvxtxFWwIeW1duvFTx4ENEMuNbz/mQNr7
         hEo+j0haVjFYpepxVjsePkZYvS4yrK9T4u8dGJ0Swj8hlXOyxQIHNSxEIsmNKrDjv8la
         lJA7VaFfbEymySWKd7bY3NmXbwuawnNBB5aETErw8cK4RlCEAGO0is3k6U4R+OZoKEAZ
         RXNg==
X-Forwarded-Encrypted: i=1; AJvYcCWlEYwy5h0jxtyCxQ2Mn8QYR1pKefqWNERIasRfc7DDXPqAdtR0DT/YdsKqwUMhajIWZeTg3g32ZAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKxu+cYJrjBKRvo32cetBYhak5QhHfxQ5F0hx1uNdso+Kmxv9
	eD189qM8bjzu8TwkXLej5aI9t79WuYaPpACO3ESTH3auT/Q3oexML9/Klw+bX4E/3Lde53z5vfn
	4B85erF+SLRRafQd8OwZtDTml/4FjJVYeXs3i
X-Gm-Gg: ASbGnctrGoX7Lnm23Rk2O7ikmduGDmzoWzory+GgrqFhsc91/2Hy/DsvMbQt3nlUt1I
	bNP5ypHSUNX32PabQnVWjoJ02QxrJ/UJbmOSHOw==
X-Google-Smtp-Source: AGHT+IEpQzRLxiuB1jT2vUBbfAuBb9/GSt/nwSklPLPGLl27yYB31UvM3A4BKyGUvxnVdYUKLclC1LLsTAejqH31Slw=
X-Received: by 2002:a05:622a:1828:b0:466:8906:159a with SMTP id
 d75a77b69052e-46c71fe2df2mr326951cf.19.1736292142325; Tue, 07 Jan 2025
 15:22:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107030415.721474-1-surenb@google.com> <20250107122809.ofddv3yw44ciaklm@master>
In-Reply-To: <20250107122809.ofddv3yw44ciaklm@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 15:22:11 -0800
X-Gm-Features: AbW1kvZaHO58vTfeT2La7AQFhN5fnTYAxeBfUL2fEXNVTiP-y8o8EvksqfqJbF8
Message-ID: <CAJuCfpGq5yQwcMsqKTuHN50PCrd=w=55Sv2P1cjyuPYxnn=1gA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: remove extra check for VMA_LOCK_OFFSET when
 read-locking a vma
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 4:28=E2=80=AFAM Wei Yang <richard.weiyang@gmail.com>=
 wrote:
>
> On Mon, Jan 06, 2025 at 07:04:15PM -0800, Suren Baghdasaryan wrote:
> >Since we limit vm_refcnt at VMA_REF_LIMIT and it's smaller than
> >VMA_LOCK_OFFSET, there is no need to check again if VMA_LOCK_OFFSET bit
> >is set. Remove the extra check and add a clarifying comment.
> >
> >Fixes: e8f32ff00a66 ("mm: replace vm_lock and detached flag with a refer=
ence count")
> >Suggested-by: Wei Yang <richard.weiyang@gmail.com>
> >Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

Since I have to respin v8, I'll fold this fix into the original patch.

>
> >---
> >Applies over mm-unstable
> >
> > include/linux/mm.h | 9 ++++++---
> > 1 file changed, 6 insertions(+), 3 deletions(-)
> >
> >diff --git a/include/linux/mm.h b/include/linux/mm.h
> >index 486638d22fc6..b5f262fc7dc5 100644
> >--- a/include/linux/mm.h
> >+++ b/include/linux/mm.h
> >@@ -747,7 +747,11 @@ static inline bool vma_start_read(struct mm_struct =
*mm, struct vm_area_struct *v
> >
> >
> >       rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> >-      /* Limit at VMA_REF_LIMIT to leave one count for a writer */
> >+      /*
> >+       * Limit at VMA_REF_LIMIT to leave one count for a writer.
> >+       * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() w=
ill fail
> >+       * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> >+       */
> >       if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &o=
ldcnt,
> >                                                     VMA_REF_LIMIT))) {
> >               rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> >@@ -766,8 +770,7 @@ static inline bool vma_start_read(struct mm_struct *=
mm, struct vm_area_struct *v
> >        * after it has been unlocked.
> >        * This pairs with RELEASE semantics in vma_end_write_all().
> >        */
> >-      if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
> >-                   vma->vm_lock_seq =3D=3D raw_read_seqcount(&mm->mm_lo=
ck_seq))) {
> >+      if (unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&mm->mm_lo=
ck_seq))) {
> >               vma_refcount_put(vma);
> >               return false;
> >       }
> >
> >base-commit: f349e79bfbf3abfade8011797ff6d0d47b67dab7
> >--
> >2.47.1.613.gc27f4b7a9f-goog
>
> --
> Wei Yang
> Help you, Help me
