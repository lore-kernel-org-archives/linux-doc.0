Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961AA3314DE
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138330; cv=none; b=H4R0rKDUD0Y5dYCQo2TfdBakdxL+hCiJ9xxpO+d6x19QNSRZT9JXHCTVia4hPTtvD66X8hmQq6iOuqjSZS+p2uCfAb3CPbtu1TsbIhsAqwTvp57qcsVQGzNxkoRn1GWaN/qjPt4GNMP11XRRwInL2BBPJssCboJ/BPHU2QRGZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138330; c=relaxed/simple;
	bh=1ArEdGwJd4akLgQ+SZ6Un1i7sYoRraUekLjZXcwXaWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pZsPSgUEcsirF1R99wIgLOKTvAUtGAQNPwDgDl4QtJl4UXHhZvu/ZhOULMy6Xdanm2uqymgjEWTdSdIzr3ltj8AUq31r1yjy1Lz1tmZoWHiRlhCrpIQDppyxtaUVtDAtuAS4AkhdmbEFag0/UxOaPUgT7Im2vnvCek9feNf3lJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jc36E/pG; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jc36E/pG"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-44cc3c9b2feso468735f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778138327; x=1778743127; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=STH36cS/F87DhIyaZ+8OVzfArrGCDV+Ojd5JS20sYwA=;
        b=jc36E/pGmC39UkJUJNndAyekhU6asksxweNoIOt6W9GwjHdiKUZKVEODySSxDoRSXj
         EemefrI5O/A+X42a78LLcrFbrXCO7sUOubUlk+dKts2hPN/sfL0/gT+VF6ACn3lyvn2E
         YrNbAnNyYgzjmGx47LGPazloL7S36M0a9Qe8Q/Bo5PAs0PIvwppFUDXOBWA4YNLamr2h
         lDs5DJtYBau7z6hGXwub8UR/VJBa0KwR2s6zWSmOlGN1ZsyAFlPJa/yAmx8M1mV2cBM0
         CN1hizGVuKBLQ0c6j4x9AMFP/iCKMCxdflWCNHhYNLFZ55EE0qT7JVMDmu2u/zsQ/+8G
         LpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778138327; x=1778743127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STH36cS/F87DhIyaZ+8OVzfArrGCDV+Ojd5JS20sYwA=;
        b=DUj9V1Fn8d82BgzqSSy3n03tvo9LRl3p9iCrvleak/JqZLHqApjbg7drFGTu28McKa
         yzKJfNBwchltUmG7MBAH39Hqwi4XLu1aJR+lgjM9DV2Lz+6kxSiFH6vC+BxvIpE7RCfX
         Z0WeoKFPBCaFt9eIp3V41QpbM/vz4UhSMwyeBlp4lkZ8QFc5aJs0wKQATaTT0VXy8WqX
         HyHYftyBIz/ax71oeE5bK3nC2qqN2TGANFecPqCAvlrIoxNd/mMhzDh9XgbLqghUiQa9
         yJGQz+1iE9zJnjJXsoj3z9Ystc2HZfgKlS52CAUZkn1b6KZnIfvfOXajJelglnVlw9v4
         qi8A==
X-Forwarded-Encrypted: i=1; AFNElJ/d1SSHJTJYx2xamHcSibMi9qeMoCbZKvs2zeJLDxo3UH9jsxc5M5XP7ate9h0rKMSLojmcFJLP0/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzfa97WIXY+4/lbvb182wPPJkxWMqcgb1UnLkpdP5v4zAvXTi
	97bXJGramwfdiEsxN539qZNyzMkI9m9ftJrRYrPL6Hhc2FNMzTzMELAoyTtZ1t08ehTTJcBUhXr
	nE6f4dLWakPRuSXIRRg==
X-Received: from wrqr6.prod.google.com ([2002:a5d:4986:0:b0:43c:f906:ae85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4381:b0:441:247a:e98e with SMTP id ffacd0b85a97d-4515ce1c738mr11025046f8f.24.1778138326535;
 Thu, 07 May 2026 00:18:46 -0700 (PDT)
Date: Thu, 7 May 2026 07:18:45 +0000
In-Reply-To: <20260506135122.GA1432412@joelbox2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260506135122.GA1432412@joelbox2>
Message-ID: <afw81cVYyF6hRhkj@google.com>
Subject: Re: [PATCH v2] rust: maple_tree: implement Send and Sync for MapleTree
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	Nikola Djukic <ndjukic@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 06, 2026 at 09:51:22AM -0400, Joel Fernandes wrote:
> The C maple_tree struct contains a *mut c_void, which prevents Rust from
> auto-deriving Send/Sync. Following is an example error message when using
> MapleTree in nova-core's Vmm.
> 
> This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaCore,
> causing NovaCore to fail the Send bound required by pci::Driver:
> 
>   error[E0277]: `*mut c_void` cannot be sent between threads safely
>       --> drivers/gpu/nova-core/driver.rs:77:22
>        |
>   77   | impl pci::Driver for NovaCore {
>        |                      ^^^^^^^^ `*mut c_void` cannot be sent between threads safely
>        |
>        = help: within `MapleTreeAlloc<()>`, the trait `Send` is not implemented for `*mut c_void`
>   note: required because it appears within the type `kernel::bindings::maple_tree`
>   note: required because it appears within the type `Opaque<kernel::bindings::maple_tree>`
>   note: required because it appears within the type `MapleTree<()>`
>   note: required because it appears within the type `MapleTreeAlloc<()>`
>        = note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to implement `Send`
>   note: required because it appears within the type `core::pin::Pin<Box<MapleTreeAlloc<()>, Kmalloc>>`
>   note: required because it appears within the type `Vmm`
>   note: required because it appears within the type `BarUser`
>   note: required because it appears within the type `Gpu`
>   note: required because it appears within the type `NovaCore`
>   note: required by a bound in `kernel::pci::Driver`
>       --> rust/kernel/pci.rs:294:19
> 
> Implement Send and Sync for MapleTree. The tree contains no thread-local
> state, and all shared access goes through the internal ma_lock spinlock.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
