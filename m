Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E014B09C
	for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721726086; cv=none; b=sztGfQm6baJwZ2VNll2kLZMGCvMnOoeNcritPUcSLA2N5oeqS+ZFYipywMSpWi+ZVelLwo7n6M9Sv16zlyEIrSw1VVdc34CWh9Jl2cOrYKMB1Ii09nX0M0Jes2HBKajuTm0CjoXu7Eaajgwh3A7jYhgov/o0urpc0sNdwgYsVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721726086; c=relaxed/simple;
	bh=/aNKj06umO1ELjsZmuI+lDtShakczr7S5rREf9XPkA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3NRWBBN+UhvHBoyYZ1w523TQsDneKvVOe3+PxkDG+o3UtXs4XBVdMod7S7R+w3OiITYHqgFTL7LKTw4JumqZ5TLanWfjNok1KdJzKZNeEx8wMzNEc/h1Fnw8jXcJmaVQdycxmQQgPu46v0aly9+2gBsAfyB6akKmI7Sz+8gTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mxZlkOFa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mxZlkOFa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso39296325e9.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721726082; x=1722330882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYXIvo6ejObcllWeu7HWV87ezFNYHlwsTYXkJwMjcE8=;
        b=mxZlkOFawh5UpoacEfRtLZWUddBs8AqFdLN5MzUj9sq5QSy1duLzmLzcuRZFIB8WyG
         VAuSMAkkbpBRp8bcSY97zyyCFonVcO+xxULm/5h+1/hhnrlmM34ALc/Tvs5insdgH5UZ
         ruxvO2ek9pgFSdZFOcckJV0gISevnz+5TrNsrz8XzYTV5CSmY/xcvFbtpazFtdAYDMvq
         Sd5PVTM4KnIDRSFyd53Hof3OZviP9+8YsUzDAZIXDxpCaoz3SQbCHO834rO8wV3SQpwJ
         V0XOTtWsUNBmPD3ca0LhqNFwUq1857kJ39yso0DqIDQlrYIsEyDvV6XNsUxkeRtaIWh+
         MX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721726082; x=1722330882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYXIvo6ejObcllWeu7HWV87ezFNYHlwsTYXkJwMjcE8=;
        b=V02162z/dNlZADRPvGravk/ad9VQ5xdALBznPXsOozN+hZ6/sOMlUpm0AxFnSpMaQ3
         JEXQu3o6LIVgfuwYq0BCGhVDIugnDEqnxTyguBEx6ru6ioq5YEh/YaylHEoyQAtvmUhC
         ElEcTwxAHCFzcgkpQfWFY8vVJ4GzmBGGYrnebiOwo5ToZwSDWqCW5Rt5CVh/uyj8h9cE
         iTCkkAG0ahPwSSxboasZV2mBnVLYGw8M5nGzNwzxsKYK3sI/RUue4f30WyOFKadRS0Bc
         UXKNMLrP4QtpIduc0cnIJd4hRGZwDn7DjHQul3pZ8EXIVxLgO/9YOl7vFOP/AQYbN+NE
         LENQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbkA1FFT+CPfLeGYILcvF5eJhlMqBtvn2w/sOI3PuOSQJlZFuPDnWHAiq6HNK+t882+Es7DLRWmGMohVxOrTTLxOFuvvyeiFK8
X-Gm-Message-State: AOJu0Yy8D5IbV2PFRt3Zvcwel4eNJs7tMcqhpnu2Ur8foFZ+rPY/G4oT
	sJXUOq/HtoClCSldRjCc8uPLNAXWmWiGJ21/aY7TP6PldS/be1rW3cbc9Uj738aRDY3z8qai9dR
	gCrnyqrbUS0nxftv0M41nGFfKjBNjord8eA+i
X-Google-Smtp-Source: AGHT+IG+v+KAqZFQ6+POHpLf04cG5azhbZw6oEk8RK9hK9xVMvlTZGPvw/7juVGHzBb4nSG9SnHl55WC+D+5on4rG5o=
X-Received: by 2002:a05:600c:384d:b0:426:5d0d:a2c9 with SMTP id
 5b1f17b1804b1-427dc522895mr70396675e9.10.1721726081495; Tue, 23 Jul 2024
 02:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710032447.2161189-1-boqun.feng@gmail.com>
In-Reply-To: <20240710032447.2161189-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 23 Jul 2024 11:14:29 +0200
Message-ID: <CAH5fLgjat2Y6RT957BhdOjJHt7rPs0DvZYC6JZ+pHFiP=yDNgA@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: types: Add explanation for ARef pattern
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Jonathan Corbet <corbet@lwn.net>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@redhat.com>, Trevor Gross <tmgross@umich.edu>, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 5:26=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> As the usage of `ARef` and `AlwaysRefCounted` is growing, it makes sense
> to add explanation of the "ARef pattern" to cover the most "DO" and "DO
> NOT" cases when wrapping a self-refcounted C type.
>
> Hence an "ARef pattern" section is added in the documentation of `ARef`.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> This is motivated by:
>
>         https://lore.kernel.org/rust-for-linux/20240705110228.qqhhynbwwuw=
pcdeo@vireshk-i7/
>
>  rust/kernel/types.rs | 156 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index bd189d646adb..70fdc780882e 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -329,6 +329,162 @@ pub unsafe trait AlwaysRefCounted {
>  ///
>  /// The pointer stored in `ptr` is non-null and valid for the lifetime o=
f the [`ARef`] instance. In
>  /// particular, the [`ARef`] instance owns an increment on the underlyin=
g object's reference count.
> +///
> +/// # [`ARef`] pattern
> +///
> +/// "[`ARef`] pattern" is preferred when wrapping a C struct which has i=
ts own refcounting
> +/// mechanism, because it decouples the operations on the object itself =
(usually via a `&Foo`) vs the
> +/// operations on a pointer to the object (usually via an `ARef<Foo>`). =
For example, given a `struct
> +/// foo` defined in C, which has its own refcounting operations `get_foo=
()` and `put_foo()`. Without
> +/// "[`ARef`] pattern", i.e. **bad case**:
> +///
> +/// ```ignore
> +/// pub struct Foo(NonNull<foo>);
> +///
> +/// impl Foo {
> +///     // An operation on the pointer.
> +///     pub unsafe fn from_ptr(ptr: *mut foo) -> Self {
> +///         // Note that whether `get_foo()` is needed here depends on t=
he exact semantics of
> +///         // `from_ptr()`: is it creating a new reference, or it conti=
nues using the caller's
> +///         // reference?
> +///         unsafe { get_foo(ptr); }
> +///
> +///         unsafe { Foo(NonNull::new_unchecked(foo)) }
> +///     }
> +///
> +///     // An operation on the object.
> +///     pub fn get_bar(&self) -> Bar {
> +///         unsafe { (*foo.0.as_ptr()).bar }
> +///     }
> +/// }
> +///
> +/// // Plus `impl Clone` and `impl Drop` are also needed to implement ma=
nually.
> +/// impl Clone for Foo {
> +///     fn clone(&self) -> Self {
> +///         unsafe { get_foo(self.0.as_ptr()); }
> +///
> +///         Foo(self.0)
> +///     }
> +/// }
> +///
> +/// impl Drop for Foo {
> +///     fn drop(&mut self) {
> +///         unsafe { put_foo(self.0.as_ptr()); }
> +///     }
> +/// }
> +/// ```
> +///
> +/// In this case, it's hard to tell whether `Foo` represent an object of=
 `foo` or a pointer to
> +/// `foo`.
> +///
> +/// However, if using [`ARef`] pattern, `foo` can be wrapped as follow:
> +///
> +/// ```ignore
> +/// /// Note: `Opaque` is needed in most cases since there usually exist=
 C operations on
> +/// /// `struct foo *`, and `#[repr(transparent)]` is needed for the saf=
ety of converting a `*mut
> +/// /// foo` to a `*mut Foo`
> +/// #[repr(transparent)]
> +/// pub struct Foo(Opaque<foo>);
> +///
> +/// impl Foo {
> +///     pub fn get_bar(&self) -> Bar {
> +///         // SAFETY: `self.0.get()` is a valid pointer.
> +///         //
> +///         // Note: Usually extra safety comments are needed here to ex=
plain why accessing `.bar`
> +///         // doesn't race with C side. Most cases are either calling a=
 C function, which has its
> +///         // own concurrent access protection, or holding a lock.
> +///         unsafe { (*self.0.get()).bar }
> +///     }
> +/// }
> +/// ```
> +///
> +/// ## Avoid `impl AlwaysRefCounted` if unnecesarry
> +///
> +/// If Rust code doesn't touch the part where the object lifetimes of `f=
oo` are maintained, `impl
> +/// AlwaysRefCounted` can be temporarily avoided: it can always be added=
 later as an extension of
> +/// the functionality of the Rust code. This is usually the case for cal=
lbacks where the object
> +/// lifetimes are already maintained by a framework. In such a case, an =
`unsafe` `fn(*mut foo) ->
> +/// &Foo` function usually suffices:
> +///
> +/// ```ignore
> +/// impl Foo {
> +///     /// # Safety
> +///     ///
> +///     /// `ptr` has to be a valid pointer to `foo` for the entire life=
time `'a'.
> +///     pub unsafe fn as_ref<'a>(ptr: *mut foo) -> &'a Self {
> +///         // SAFETY: Per function safety requirement, reborrow is vali=
d.
> +///         unsafe { &*ptr.cast() }
> +///     }
> +/// }
> +/// ```
> +///
> +/// ## Type invariants of `impl AlwaysRefCounted`
> +///
> +/// Types that `impl AlwaysRefCounted` usually needs an invariant to des=
cribe why the type can meet
> +/// the safety requirement of `AlwaysRefCounted`, e.g.
> +///
> +/// ```ignore
> +/// /// # Invariants:
> +/// ///
> +/// /// Instances of this type are always refcounted, that is, a call to=
 `get_foo` ensures that the
> +/// /// allocation remains valid at least until the matching call to `pu=
t_foo`.
> +/// #[repr(transparent)]
> +/// pub struct Foo(Opaque<foo>);
> +///
> +/// // SAFETY: `Foo` is always ref-counted per type invariants.
> +/// unsafe impl AlwaysRefCounted for Foo {
> +///     fn inc_ref(&self) {
> +///         // SAFETY: `self.0.get()` is a valid pointer and per type in=
variants, the existence of
> +///         // `&self` means it has a non-zero reference count.
> +///         unsafe { get_foo(self.0.get()); }
> +///     }
> +///
> +///     unsafe dec_ref(obj: NonNull<Self>) {
> +///         // SAFETY: The refcount of `obj` is non-zero per function sa=
fety requirement, and the
> +///         // cast is OK since `foo` is transparent to `Foo`.
> +///         unsafe { put_foo(obj.cast()); }
> +///     }
> +/// }
> +/// ```
> +///
> +/// After `impl AlwaysRefCounted for foo`, `clone()` (`get_foo()`) and `=
drop()` (`put_foo()`)  are
> +/// available to `ARef<Foo>` thanks to the generic implementation.
> +///
> +/// ## `ARef<Self>` vs `&Self`
> +///
> +/// For an `impl AlwaysRefCounted` type, `ARef<Self>` represents an owne=
r of one reference count,
> +/// e.g.
> +///
> +/// ```ignore
> +/// impl Foo {
> +///     /// Gets a ref-counted reference of [`Self`].
> +///     ///
> +///     /// # Safety
> +///     ///
> +///     /// - `ptr` must be a valid pointer to `foo` with at least one r=
eference count.
> +///     pub unsafe fn from_ptr(ptr: *mut foo) -> ARef<Self> {
> +///         // SAFETY: `ptr` is a valid pointer per function safety requ=
irement. The cast is OK
> +///         // since `foo` is transparent to `Foo`.
> +///         //
> +///         // Note: `.into()` here increases the reference count, so th=
e returned value has its own
> +///         // reference count.
> +///         unsafe { &*(ptr.cast::<Foo>()) }.into()
> +///     }
> +/// }
> +/// ```
> +///
> +/// Another function that returns an `ARef<Self>` but with a different s=
emantics is
> +/// [`ARef::from_raw`]: it takes away the refcount of the input pointer,=
 i.e. no refcount
> +/// incrementation inside the function.
> +///
> +/// However `&Self` represents a reference to the object, and the lifeti=
me of the **reference** is
> +/// known at compile-time. E.g. the `Foo::as_ref()` above.
> +///
> +/// ## `impl Drop` of an `impl AlwaysRefCounted` should not touch the re=
fcount
> +///
> +/// [`ARef`] descreases the refcount automatically (in [`ARef::drop`]) w=
hen it goes out of the
> +/// scope, therefore there's no need to `impl Drop` for the type of obje=
cts (e.g. `Foo`) to decrease
> +/// the refcount.
>  pub struct ARef<T: AlwaysRefCounted> {
>      ptr: NonNull<T>,
>      _p: PhantomData<T>,
> --
> 2.45.2
>

I think this is missing some basic information related to `&Self` ->
`ARef<Self>` conversions. We should explain that these conversions are
possible, and that you usually don't want `raw_ptr` -> `ARef<Self>` to
increment the refcount - instead provide a `raw_ptr` -> `&Self` and
convert the `&Self` to `ARef<Self>`.

Alice
