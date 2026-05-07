Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871EB286425
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155448; cv=none; b=iPmlwM1WBMAzuI20uhc+wimI+ruONzQ56JhcE5dQL6taIKHQxD/vqApupMm3V23f6V4UB2mJJ1JeHDqRyidrOcS5ELzTxTdO0Pon7PDBBREgg3RwFTO7Hl64imjU2oXIOu6Cq1xmlzJYqhff7MDqVt40mfW4NPCkGBwg8zFzCAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155448; c=relaxed/simple;
	bh=T8EtYFipGWvnMjMF+3tEvxPNBm0vfHz1WTDCFPpbNV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=acgfGO4TsfXrsOh4vBD8Sbqkv51nJIk33n7S+s06HHsz4mWkNdX4MYkfm0NXE8CsT722LasEijBpeUNvgrIjO5ZevGgCxYH0r/dil+FP2ZNzUzddByBKU4VUDAwWAjYmR6IlCTFxS5GmIAiOfRtK3O5uKcrSJQuhzMohMM8Sdv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MseMl9LM; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MseMl9LM"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-676fb54c0cdso616701a12.2
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778155441; x=1778760241; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PXDCzyYbe0fvDc+BkrtxvXQejJaBIAM1AIWN2IkCsvs=;
        b=MseMl9LM/9YVaq0qbUpCjMMWfuZRO5ktR2j9AGDU9hH2VC05nIYE1gSkzScR29I4LT
         guV5C7d6mVf55B1/c7zGMpALw31oP//jS4t8IhQCXQeQUM2ZTeAcKd5BTnkFF7nPHlzI
         DzDnF4vcKVXTiOzW5BJIQdJzkn2YtK//eUnpEjDx/ANIqVr+OZIoPnDs/43MbnUUqe8y
         IYrbDCbXHbQe6q9zOYHY46bhl0Jl0tD/K9/sdiOM32Fr6K5f9UlZuy57n9RDXyog/Qsj
         OFi5X63rnr/H46Rf1bXEwe0Q6KJgxNmImRl8i57xfms7JbCngXN3QlJiocKtRBIYSv0r
         j3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155441; x=1778760241;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXDCzyYbe0fvDc+BkrtxvXQejJaBIAM1AIWN2IkCsvs=;
        b=CiGLuSmx6SAKhx3ELGeaW5nkzVE/TxuIL5ufWuMTbajhlrGHr7AIwoyR1eRxJFvTQ5
         NEHCX1XSBY/GXMCjb2bDHJy8JkF6BoLeKJFZKAEFmBI4mNnsaAWxdSusRS6nW0z2e+eb
         Ru+XOj54jnpd5L6jc+5dtfObNF7Maov8mM6XE9wVZ93MPzG1qU9OCaQDoGjPJRs5I7IK
         btuILFyse+7WbOU8wORBDwPxbiYdEElY+zE4pgcUP/NkIcNbMQ2XNJwqFYYH4y5HIrbk
         GDly0OXE8+aAOG2R3m9uHHd0UzeSPbsyqc0qJb95bWBhrhmRvrX13jstXJmfGhW2lteg
         ZZRw==
X-Forwarded-Encrypted: i=1; AFNElJ92nGM+6uep7o1O6cKFae3e/ySMr3mlhdJ78pXjf5FE/aQ5Vzic4i+ANgrN28Chl8bvE2YVtE6Vq2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBabw+R+yo6qh2RP93GG3QddKosoTGmBNPWwItEUCHHR0N3o8e
	QlxKcF42B7hnm+iWUF/uPqvWD5DrlM8eZ/iMc8hJkRk440H5xY3XJ5+fomVdwYFZzOlqLCdSd65
	9omhmAi9OMNOLa0inwg==
X-Received: from edbh15.prod.google.com ([2002:a05:6402:50cf:b0:672:bfdb:8b72])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:eaa:b0:669:cc03:334a with SMTP id 4fb4d7f45d1cf-67d63d984d0mr3569787a12.11.1778155440181;
 Thu, 07 May 2026 05:04:00 -0700 (PDT)
Date: Thu, 7 May 2026 12:03:59 +0000
In-Reply-To: <DICEBGUAU4OT.244JDJIKXRHBS@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260507-remove-task-euid-v3-0-27f22f335c2c@google.com>
 <20260507-remove-task-euid-v3-1-27f22f335c2c@google.com> <DICEBGUAU4OT.244JDJIKXRHBS@garyguo.net>
Message-ID: <afx_rzB-NvW5JkoY@google.com>
Subject: Re: [PATCH v3 1/2] rust: task: clarify comments on task UID accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 07, 2026 at 12:08:35PM +0100, Gary Guo wrote:
> On Thu May 7, 2026 at 10:48 AM BST, Alice Ryhl wrote:
> > -    /// Returns the UID of the given task.
> > +    /// Returns the objective real UID of the given task.
> >      #[inline]
> >      pub fn uid(&self) -> Kuid {
> >          // SAFETY: It's always safe to call `task_uid` on a valid task.
> >          Kuid::from_raw(unsafe { bindings::task_uid(self.as_ptr()) })
> >      }
> >  
> > -    /// Returns the effective UID of the given task.
> > +    /// Returns the objective effective UID of the given task.
> > +    ///
> > +    /// You should probably not be using this; the effective UID is normally
> > +    /// only relevant in subjective credentials.
> >      #[inline]
> >      pub fn euid(&self) -> Kuid {
> >          // SAFETY: It's always safe to call `task_euid` on a valid task.
> > @@ -371,7 +374,7 @@ fn eq(&self, other: &Self) -> bool {
> >  impl Eq for Task {}
> >  
> >  impl Kuid {
> > -    /// Get the current euid.
> > +    /// Get the current subjective euid.
> 
> For consistency this should be "subjective effective UID".

I can update this for the next version.

Alice
