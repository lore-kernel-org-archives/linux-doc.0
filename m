Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792492027;
	b=q+LoZzXaY82j7rBZ8uExUmjFjZnQVeU8y0f76N9GAPUBVeG+67eDs+FCgbCJZCTcDmao
	 mhnSgvVE4svzmfO5VG5CMzmCl+I6qYT4ffVYDH+fzEXVPJSY9lK/26R/8q9smUvMniqGF
	 Ukkc68WxBPLBuJC8EJaNs0lqItQzKNsATXTRrrLIvLuiKnxkZy3KF9A+M7K7zT3Sw5OLX
	 ZiCg1PGj9pNPA3O12gDUevqwIJ3qu9uK793KggHzmvKv8wopaXwfqfSshUsGvVzTkA0gP
	 AZFBWVAWx689dAQUR0KgsZ+/LLTuzlazCAbFzRVuGCP4EnSv2Z15yfdT7+nw2ZqCENA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
	b=Y3zRvLSERoxP3AMJph41o92LKwcIYsojFEZ965zWIu9eLpal69NA8t9TV++Ws1H1vr5W
	 icv4j1Kb5Vt7PHDwMn1tuZDtjiNmBUacl2mz5GKbQJJa/2y0dM9hvqDzK6cRBzzRPKyrh
	 EY6aI24cMDWSiO41MlRMoAn3bz5iQw6hQ2ony+9vnjus5ZSKuz0KVXEaFh68K3gyjOwCq
	 X09p4EKoi2EAUNP669bW/d5TwQ0/RLYnElr6SWnBBYGFdRNfjvkeuc5hrHcDl8EXKzJ+4
	 Li+FzN7FW0ndUDIEREXbvyuGFOkhphjY8Kbm4O6hAehfH5elbFZYVV1byknboYL3nNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D75606A31B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D75606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35159e0092aso361838eec.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 03:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492026; cv=none;
        d=google.com; s=arc-20260327;
        b=EEBc866BkjRrm7wBdk+DYcuRXx5PzgD+zRkSeYy6GvqZUvX9DgEMqquNAq/kqBP6Wa
         ywTc64yF1GFWH6j/4g2IcZ7CM9nohiLzo9Ne3R+Awc8Y1laxOWwGsmvbyoSz9ElsBYIn
         qBw4CMJ9gHL/2sCMwoWUfbTrWI+6TpuAZDybTqXRSkx9FKqAi4n1dWBpJLO2Ngq1bRf8
         pxNW4/4LyfLShA3nrFuT3T5cWM2JdTKvvplTnZ9APfPdw4htXCf0DHaZZx/roHG71N8d
         16RTxEBzpgUM0A0mL9gVB8docA9PzeRAtKBARXlcn4EV0rzEhbvVjrcRSYn1s5lgfa81
         zOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        fh=2qfh6GZDeXKlSq1GaQ+p3IREjWdrwfTetHdDC6lEiQs=;
        b=rQMI6Lgh8WHvYdGpgktUqBI0joQE5jZDwaqP8yZiKxpW7P7HTAipMQHkOeNdwbWtsg
         drlXIjfKlDPfm2Bx7lVnBM4Jno+p2/733KEeQTUVrZ//Q67T+CRfBbifi8M0k3pks9JU
         hSX20o3DULF1m8d0FFOxcbfK6sVcMoHtR1AHkveMF+gs2G3lS0KWcBp/BCeUMqDxePDD
         jzXIT1Bom/WYL40UqpC+ecazJc027zs2duDfPauMdjfo+9R3VUyz+fWKSuiVtEG9vKQO
         OdEJ1NyrCbDXBhQKwjr5QZW7Uek7x40YEhW8+vlkzDoJENay0gZRcXmtRNX732lScNhF
         5kZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492026; x=1793096826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=eK+TzsrG8ppsuUBTMaNmtZbCwx1Zipxq05QH5xDzFvCB8pUTqpe+AMfkezQc9FE4q+
         47eMC81vpyd1Omv5sO+zDkakHWpHql5m6bNxnQrVrvxr67vRPTY6ommHrH46rl4pbAGe
         oX6tn5uuhJ0Pny2Z7AimovUIRmVppIjpaIUGRyBcLReYhmWvOUSr+tvqcrmE8j6JqQ5P
         zlspHWJBGuPxO2SoBJ4XJKzWF7VFR+Lxl+xi39nnPAMB8SGoovD6X8OZvLAh4PTir1zc
         7fQxEGw85RUrzwIka79bjhAwvI/G9PAfrDnYuaEL7jdUzxlwUMz0LmM6SSEsa902xGjR
         EmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492026; x=1793096826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=wrOfcMvuUSph+AO+YW3Ni/J7uOthf9iOR7XLPboE0lQ5m0RBLr/GVlmk7KKKb73gEI
         bxKxy5/CSzNjHGhMzBjZtHbbfhifyOl1/I5p3RJQIyIagxww6NhHqqSWFe+ajbq/e/5o
         DMHarr/6pToyd7XfAFtH+Yo2USW2vidEtmo0luxFyXteJ/srcx7A9psj4YXEK/F9HWYr
         747sg5EHSn5WoVTYuCulkBI0BlipKjFmrXomVTk63Rr9afIMQhYBQ9ePAAB51mMIgrE3
         ngChXpN4UoBZzjVzfoMgCAk9SBVjLCypcGwegnExWbwXP5RZtgEsbt1DQGRTOQSbYTU+
         i+Aw==
X-Forwarded-Encrypted: i=1; AKwUvBxefTVobImyTEJfyg4hg4CsH8icxtsHl1smIRdtJRkYAFpWxcfeQN8AO72mLAHr/jNPr2C5nLR6Nm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMBg1xrxkj7ak7cty/JwdjoZBQgPdAPaYAoHjuZ0unMDlQ5Unc
	6EqfhJItQEYhx+MixTIqarQzSRx8i78xV0DS71hqPzi2o+NKb4ejCM35cPoccimQYSaH20ehuys
	xv2k61JPsktR896G3dZCw2zsNv6RctN0=
X-Gm-Gg: AYBFou2Bd5olBcFkF8aDZAOjxMTFv3OuWn1WwnTH/VHAspqN2Wbkn2YSD6+UhgOk9VQ
	xdWOqcm60bj1e7dl1O5cuCQNR8PIgDGdHoWlnxkNnaLD5gc3M0D4aD9pET7klehTgZvL6Yt7u3B
	AoJZ1mzPFfEH049cQkRGq7ZGbF8Cy3GzWnVboFhnapBWaiNYoWtQM95Z/QlzHQdZAyCXHM0KVUM
	sddFwm/ucbFXyS8snWPtYDiyRguIsWsVcbpWHMnHNdUOIeQu3Wi93aG6KzJDrAv5DR8Nat9tWSU
	5ssmE4QbuRyh6+C5/umU6EKWv59lEDZrrxPaQksuflLS9aVfsFmkDNzZlVPzap+ujse0HPvEv5c
	lLYAbIXtxw9TWvGi5IWtglw5gJ73BQXow86y3WobY5hoFuSyDilOcOrC5+1dY+64RcG4sQqIJl5
	KCybhU4AXwfavpx2vJoZQ3sZLV6+7rC6pI89Y3rCjC1+6EJBfsddo=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr21744064eec.2.1792492026480; Tue, 20 Oct 2026
 03:27:06 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
In-Reply-To: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:26:52 +0200
X-Gm-Features: AclHuK-QCNlJqtXqMEy-POlR7cKE_rSWRMxYBpanQuZ3UPD3z8WuYE16A81SYDk
Message-ID: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Which tree should this go through? The Rust tree? Probably too late
> for this cycle.

I think you send KCSAN PRs, so I thought you would use that, thus the
Acked-bys (I suspect others thought the same). But the Rust or Kbuild
trees are also a possibility, yeah.

In any case, at least for Kbuild and Rust, the PRs were already sent
(and, generally speaking, I would have expected a patch like this to
be in the list for longer anyway).

Thanks!

Cheers,
Miguel
