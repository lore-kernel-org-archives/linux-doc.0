Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A077C3ECBDB
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212214; cv=none; b=B1JV9HXRejyFSPkdMMo0elQYD1g9SWowMOI2A2u4bxPn+0V91SspoNKCVj6ZCtm5j8FABBiUxE1dd18c7Of/oeFj/9QVEQgoV5TCyjQwPYlRkp+E6Nw9ewUUSUNEqh9i3gjhpvGlRHOJ6rLv6UScS+Cx6D+gAecZx+G0DG1fC3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212214; c=relaxed/simple;
	bh=Ek8/E1uf8JioxwC17102C6P6AwOf+FpydRqado7kk28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JHKBxMkBtn9LIObNROkruYqFEm6gEoKPvXJImDdANgf90T26rsLwHaTvNNGpjUOGErReEHBuBOMHxql0iWN8P55MwfcgUINceILk5N69aIpzqc+pLiqSRyCGFoWqIAd48SqUVw4zC31g4LRwx2A9TFbVisxT7R1kTtGusIuXW5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4UqWpX2/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4UqWpX2/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso5287055e9.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770212213; x=1770817013; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=4UqWpX2//2G4LYZ/G3/D06NHsswUewt8LRV4ONZHoh0JM5OyaQcsgoW2eTdl1yFHBA
         9Cypkhpm4iEPTdx/cEQD9DnI2Qbs2gUEMhZljsWF5rC+xTwQH0YClthvq3aO+nv3UYds
         DoEprOhP+o26m0gw5gYHjPGzO978woS05rdkvZZu2wDELg9tnwXiaokrWX8XXgkowdmZ
         SxtBYMFUsaUsavXEoE2Dvl7LPckUBXIJByuaKG/z0fWY56A7cUgHIVKoXcYun5KjOO0a
         V8f36nkmaGbyVVDBYYS98EWV4np6KbA5CJSagQYw+uiijBAhgdZN3qtETdku0h0PvIta
         LVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212213; x=1770817013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=GX1ZaKxhPf3vOlGMgDjpXBJ090FdR3SPCWp+6u8N3r7F23TEYeHOrEN+7sLbxjc56O
         HnHZ0bohxaigVtLxak1sTAhNd8jIoxFijcAmLVwDB9DqMlXHKa9bxX8T7QXEukYiReMB
         K0ZlRaOz/GaGb4YZix1q5exQzWlA3sUuNWrSQ28Dg6l9cRpjLVX+5bWpAPgzjvVR3JcC
         YTBShlzYRemyWGJvopOUUA6lsvOPz7DQE7TQXdQCJqeiTCS8oUI381Yfg1FAjl59e75G
         kCAWAcls3jwBD9+lei4teKI+740nF/OlSceVt8onMQAsri2bh/RGCc1+Ea4uiCRWE9Xt
         6wxA==
X-Forwarded-Encrypted: i=1; AJvYcCWgty1oVy33TuqCpk/yTag1j4F+gUGIJ60souwYM7lAkEK9NFU9dDbfpxVeVGaVk4ph72q+quovkDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YylJXvHytaXIW/88eAXXuk73zmTmHZ7FYXgdJ6btOHVcgkdzi/+
	26MgDRYqutND7vjR23TjtyaDitKsKT7hgdAzagm2o8skvQBRqJU7HTXJqB6OfTTMWXai/o87aHR
	PH7jfwuudXbx5G28i5Q==
X-Received: from wmqu6.prod.google.com ([2002:a05:600c:19c6:b0:480:4a03:7b76])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c17:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-4830e930f73mr44864985e9.11.1770212212161;
 Wed, 04 Feb 2026 05:36:52 -0800 (PST)
Date: Wed, 4 Feb 2026 13:36:50 +0000
In-Reply-To: <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204030507.8203-1-linkmauve@linkmauve.fr> <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net> <aYNBtc2Jbtg9sLIE@google.com> <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
Message-ID: <aYNLcqEo45oWpRYi@google.com>
Subject: Re: [PATCH] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, officialTechflashYT@gmail.com, 
	Ash Logan <ash@heyquark.com>, Roberto Van Eeden <rw-r-r-0644@protonmail.com>, 
	"Jonathan =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 04, 2026 at 02:06:53PM +0100, Peter Zijlstra wrote:
> On Wed, Feb 04, 2026 at 12:55:17PM +0000, Alice Ryhl wrote:
> 
> > Is there any reason to not make it Rust-only but for all Rust code?
> > Making the / operator work seems like it would be a good idea.
> 
> Why would it be a good idea to have it work on non-native types in Rust?
> 
> The reason we don't have them in C is because non-native divisions are
> expensive and doing them should be a conscious choice. The very same
> argument should be true for Rust code too.

I suppose that's fair. Perhaps one way to go about it could be to create
a clippy lint for 64-bit divisions telling you to use an explicit
division method?

This way cases such as `core` that use division can still use the slash
operator because the lint is not enabled when building core. And normal
kernel code would be told to use the explicit method instead. Or kernel
code could explicitly choose to silence the lint on a specific method if
they want to perform a lot of divisions and know what they are doing.

Alice
