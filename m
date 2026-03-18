Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AF83806D9
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 09:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825008; cv=none; b=cFBsVTP2u91KtW7R1GvdAvCun8P4zZYsds1vXxp4Fyle+9Z2rbw9e5kXOOmwJ5xTDxjplvaTXYqwPIQgk/5JEvuUWmvlhzZe0owVfTx5LgChRGbUdmahaGebcAePHKGQJkLzoGoi+xlxZBI4tk6mPBW7IXJDEi53dVF6E4ezf1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825008; c=relaxed/simple;
	bh=RGacs2beT3PZu9097upNzyWrZnaBTNv6EpBqYfjVR1M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LFuvInztjj9TsazUsL0EH69SFvE7DJLbBIRdx6L9s8mAPe3upFwR6YjGrnk537IxeW90o5ROx2FkejFXsYGQ8GabcWqLqpR+nv4wpNEEDkyuOTElJWhbFTv+tIEj72aqXKvzCF7Xb716a2tg5b1tzPUxtMlwc1Exc4WZ+XJ7ok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B957Sag8; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B957Sag8"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b97aa7f54a6so56255566b.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773825005; x=1774429805; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=03huxt4oynUT1355qRW2FMfKGuIDazVvmXTmtQppc9Q=;
        b=B957Sag8/5rMK3yws4YNEazOyKBP7kFgS3fNbdJFAdEAcOpg7G2CptIZZB4vtipgTT
         KoLrFopsLoSg+gGmhXvSRCKKE0WdQwT2tfHb5+vYGzE9u15o1+L4fB1EV+UotXoJdQ9X
         A7F5CZjM8A+QHYAhcrjx9G512RSszgs1KPSU4fDvCuXEW0JCxxyZy0r3ywP9la+outVk
         GreyDltUoMb+AZGuTYmkq/t+DyIHgfK4WilQyqxzavKGD4IRJedR6uFTeen4ZcTT6bEi
         8E23a2Anm4DLA3DR53ZvL4A/mHypRGRXMlWslsFGTX6tdCY8HHZ4j+GdViGz6Z+VUlel
         4UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825005; x=1774429805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03huxt4oynUT1355qRW2FMfKGuIDazVvmXTmtQppc9Q=;
        b=iPOEfzjvj3AT5gGFynXpm7McRxen2Gkmawplxf6KmUwRjtwG3wpC6r5q78YgNFuOEg
         VPL+1pmdbYl6dusC6YbwbFeRsDIE9XrtYroSLLTJWFmI9EW2dFG9zXnp1SvrHkTXdeGC
         gsEBADB8WYq8iZ2sQ+8GgJx0IPBW1puD/SdXrkzS1sf1rwhXFBdAgiC5AUNPqqdsdXIW
         EbgU1aptcJQYsZg3/ZCGvu5eGzKGbCPrnz/zxqAJq2sMngj7aA769kNBnV5HwJUo3xQV
         4zOfe511m9NNL3iKHr31UB4vEbjK4H+TKbQbVENLEfCzKni7GMbm97aG/vyVoT0oMvQl
         imXg==
X-Forwarded-Encrypted: i=1; AJvYcCUwWxszeJ04M9bmY2a4s39vesgGq4xUF/SH3NwBIac7Ze668enDjD9yDmHehtRcG1lHNLakTLiIdYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrx5esQub2W2/39SNoOXNDxqR8vs08GQJyjM/7L2vH+kurZTG
	g5MTPL7um11znahCpzCmknSqN4MSJ6spcrL7I/IYqITXIjeZDagjyuNxAM1JBGgIJP95LJSkQmt
	RgzRU9wj3Mf9QFnwQ6A==
X-Received: from ejjr7.prod.google.com ([2002:a17:906:7047:b0:b94:2c7d:9fe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c145:b0:b97:ca81:e89a with SMTP id a640c23a62f3a-b97f435a1afmr186730166b.0.1773825004253;
 Wed, 18 Mar 2026 02:10:04 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:10:03 +0000
In-Reply-To: <20260317201710.934932-2-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com> <20260317201710.934932-2-joelagnelf@nvidia.com>
Message-ID: <abpr65jD6esHysWO@google.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 17, 2026 at 04:17:10PM -0400, Joel Fernandes wrote:
> Add a new module `kernel::interop::list` for working with C's doubly
> circular linked lists. Provide low-level iteration over list nodes.
> 
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I have a few nits below. But overall I think this looks ok:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Please do consider my mod.rs suggestion too, though.

> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist_create,

IMO the automatic re-exports of macros at the root shouldn't be used.
Import it from kernel::interop::list::clist_create instead.

Note that you need to put a re-export below macro definition to do this.

	macro_rules! clist_create {
	    (unsafe { $head:ident, $rust_type:ty, $c_type:ty, $($field:tt).+ }) => {{
	        // Compile-time check that field path is a `list_head`.
	        // SAFETY: `p` is a valid pointer to `$c_type`.
	        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
	            |p| unsafe { &raw const (*p).$($field).+ };
	
	        // Calculate offset and create `CList`.
	        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
	        // SAFETY: The caller of this macro is responsible for ensuring safety.
	        unsafe { $crate::interop::list::CList::<$rust_type, OFFSET>::from_raw($head) }
	    }};
	}
	pub use clist_create; // <-- you need this

See tracepoint.rs or any of the other macros for an example.

> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: `head` is valid and initialized, items are `SampleItemC` with
> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over `SampleItemC`.
> +//! let list = clist_create!(unsafe { head, Item, SampleItemC, link });

Did you try using this in your real use-case? You require `head` to be
an :ident, but I think for any 'struct list_head' not stored on the
stack, accepting an :expr would be easier to use so that you can just
pass `&raw mut my_c_struct.the_list_head` directly to the macro. Right
now you have to put the raw pointer in a local variable first.

Alice
