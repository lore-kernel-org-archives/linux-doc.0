Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE69030C368
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511715; cv=none; b=fN8XlWC275FbBfOtTz5EJtaf/OPS6yotR5CL0+Za7OfOIQpV2QOxxV9JNKUsuLe//s4s/7YNrvCLSm9SMmjZvYAthYzJd3NZWwQclr5vnwG1L4VVkjTcCbKD6b11XTu0ytTde+PD8ZpXpAvwYjzZk3Y1URzcCnmB48Q5B/OzIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511715; c=relaxed/simple;
	bh=tEwvuFOHCr7SN8AzC30UrDoTcfRjUrmnfC1usjvWQzo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jqrqti8ExyyikDtp0yyirpKzIQDFmuOvBnBwDrB8sOlXIecW0SPifp1T+ZTFk7A9x7orjTTK207LWrZ9S1bWqv1dES6cxpgMxKC6arCuD66h0TN2OWGKn8g4Eeg7mzF96dZI5kkCEmxDf62wYwWaHEdL7Di4iazWeO8REW1mHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z9bX1CMS; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z9bX1CMS"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-658b82db375so950437a12.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771511711; x=1772116511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEwvuFOHCr7SN8AzC30UrDoTcfRjUrmnfC1usjvWQzo=;
        b=Z9bX1CMS5eIg2CdlsGpQ75WmV6xIpiKkq5qeITrCrUiYVliCSi9EJgpJ5zsEMa1Psk
         BW/EGJVs2mreqU4b8d/TqgiMHwj/DOhQH0uKngXCr6sLvsZpW6c3Yg9jwLU7MiKZKZwN
         pvy2ld4lU78Z41ODcP3cC0BHytKB/YfWmVPvfHLK+lJ+xWkfXpT0Lno7atuE89nLZHL5
         i1t1SdvEIkEtgUjn+KymoonpMC+MGmEw6Y84yUL8tuAF5Ux1SOR/Bgqlk1X5V1t8oUXN
         GynmlauKLDxC6e9u6ChJnXnT3FonkJlb6RM1Uuc6dbkLpfQa+IAXHkBlbC31I6tANOlD
         njPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771511711; x=1772116511;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tEwvuFOHCr7SN8AzC30UrDoTcfRjUrmnfC1usjvWQzo=;
        b=iYjfhIi3gK/6K1ZWBD08Y2x/mVqMAsq92jeIkHSGRqA/XQ0vXmf3EFuFPSEYDcJRQx
         aB+iHj3He7L0srZ3kjbFtJap2zUGpBA16wj4EJhrL1Xhbd+nkKdfIrZ2IeY/3A2vuCr+
         HOFKSfWUmXQxRAvjxz+B44JiI1+RJLrNK5TiQq9Ok6gCSssu3noGU1X3ohmdpMlFNJpc
         T8w2W4qGsXStL5ghagT+chOk7WSLKJIzxeqCQpz9e5zeEoK17wexL1hKVH6D1gRiVUWm
         8HGWtyJxiU9Ps2EV/FPlt9gll/EOhhij7HIkwz5Nf/nih3U6V2mNK+HWz1v/kR+pV1LW
         N+hw==
X-Forwarded-Encrypted: i=1; AJvYcCXdheUZ2vMoStbzdLV1/ONQXc1vLSZhBNKQ/jebsn95eSZk2V8SFZbA/uMck3ekGwhYro+ffv/m83A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBurcaHZ93ichs+55ju3TxBaaOey1K8G+bR8dxNqDKpsuf6ztc
	nwEJQ+Croi4m2gDWU/vTqVIYjqrvFR0SgTOvTJURWKZkKMjzj8ZlpuDcG7qiBDjWwg08PhYjzdZ
	1LJWbe7rZ/NRnZWPZwg==
X-Received: from edrv4.prod.google.com ([2002:aa7:d644:0:b0:65a:409d:beb7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2787:b0:65c:1488:182 with SMTP id 4fb4d7f45d1cf-65c769793d2mr3008040a12.14.1771511711043;
 Thu, 19 Feb 2026 06:35:11 -0800 (PST)
Date: Thu, 19 Feb 2026 14:35:10 +0000
In-Reply-To: <c2b65a8f-b0cc-4bba-8ef9-7a079314d52d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-remove-task-euid-v1-1-904060826e07@google.com> <c2b65a8f-b0cc-4bba-8ef9-7a079314d52d@gmail.com>
Message-ID: <aZcfnqkGcFb2k_hT@google.com>
Subject: Re: [PATCH] task: delete task_euid()
From: Alice Ryhl <aliceryhl@google.com>
To: Alex Shi <seakeel@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBGZWIgMTksIDIwMjYgYXQgMTA6Mjc6MDFQTSArMDgwMCwgQWxleCBTaGkgd3JvdGU6
Cj4gCj4gCj4gT24gMjAyNi8yLzE5IDIwOjE0LCBBbGljZSBSeWhsIHdyb3RlOgo+ID4gdGFza19l
dWlkKCkgaXMgYSB2ZXJ5IHdlaXJkIG9wZXJhdGlvbi4gWW91IGNhbiBzZWUgaG93IHdlaXJkIGl0
IGlzIGJ5Cj4gPiBncmVwcGluZyBmb3IgdGFza19ldWlkKCkgLSBiaW5kZXIgaXMgaXRzIG9ubHkg
dXNlci4gdGFza19ldWlkKCkgb2J0YWlucwo+ID4gdGhlIG9iamVjdGl2ZSBlZmZlY3RpdmUgVUlE
IC0gaXQgbG9va3MgYXQgdGhlIGNyZWRlbnRpYWxzIG9mIHRoZSB0YXNrCj4gPiBmb3IgcHVycG9z
ZXMgb2YgYWN0aW5nIG9uIGl0IGFzIGFuIG9iamVjdCwgYnV0IHRoZW4gYWNjZXNzZXMgdGhlCj4g
PiBlZmZlY3RpdmUgVUlEICh3aGljaCB0aGUgY3JlZGVudGlhbHMuNyBtYW4gcGFnZSBkZXNjcmli
ZXMgYXMgIlsuLi5dIHVzZWQKPiA+IGJ5IHRoZSBrZXJuZWwgdG8gZGV0ZXJtaW5lIHRoZSBwZXJt
aXNzaW9ucyB0aGF0IHRoZSBwcm9jZXNzIHdpbGwgaGF2ZQo+ID4gd2hlbiBhY2Nlc3Npbmcgc2hh
cmVkIHJlc291cmNlcyBbLi4uXSIpLgo+ID4gCj4gPiBTaW5jZSB1c2FnZSBpbiBCaW5kZXIgaGFz
IG5vdyBiZWVuIHJlbW92ZWQsIGdldCByaWQgb2YgdGhlIHJlc3VsdGluZwo+ID4gZGVhZCBjb2Rl
Lgo+ID4gCj4gPiBDaGFuZ2VzIHRvIHRoZSB6aF9DTiB0cmFuc2xhdGlvbiB3YXMgY2FycmllZCBv
dXQgd2l0aCB0aGUgaGVscCBvZgo+ID4gR2VtaW5pIGFuZCBHb29nbGUgVHJhbnNsYXRlLgoKPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9j
cmVkZW50aWFscy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0
eS9jcmVkZW50aWFscy5yc3QKPiA+IGluZGV4IDg4ZmNkOTE1MmZmZTkxZDc5ZmMxMGJmYzdiMmEz
N2QzMDFiNDkzOGEuLmYwYjJlZmVjMzQyNDM4YjgxYmU0MTVkYzUxMzYyMmM5NjFiYjdlNTkgMTAw
NjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zZWN1cml0eS9j
cmVkZW50aWFscy5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3NlY3VyaXR5L2NyZWRlbnRpYWxzLnJzdAo+ID4gQEAgLTMzNywxNSArMzM3LDEzIEBAIGNvbnN0
5oyH6ZKI5LiK5pON5L2c77yM5Zug5q2k5LiN6ZyA6KaB6L+b6KGM57G75Z6L6L2s5o2i77yM5L2G
6ZyA6KaB5Li05pe25pS+5byDCj4gPiAgICAgIGBgX190YXNrX2NyZWQoKWBgIOeahOe7k+aenOS4
jeW6lOebtOaOpeS8oOmAkue7mSBgYGdldF9jcmVkKClgYCDvvIwKPiA+ICAgICAg5Zug5Li66L+Z
5Y+v6IO95LiOIGBgY29tbWl0X2NyZWQoKWBgIOWPkeeUn+ernuS6ieadoeS7tuOAggo+ID4gLei/
mOacieS4gOS6m+aWueS+v+eahOWHveaVsOWPr+S7peiuv+mXruWPpuS4gOS4quS7u+WKoeWHreaN
rueahOeJueWumumDqOWIhu+8jOWwhlJDVeaTjeS9nOWvueiwg+eUqOaWuemakOiXj+i1t+adpTo6
Cj4gPiAr5pyJ5LiA5Liq5pa55L6/55qE5Ye95pWw5Y+v55So5LqO6K6/6Zeu5Y+m5LiA5Liq5Lu7
5Yqh5Yet5o2u55qE54m55a6a6YOo5YiG77yM5LuO6ICM5a+56LCD55So5pa56ZqQ6JePUkNV5py6
5Yi2OjoKPiAKPiBMR1RNLgo+IAo+ID4gICAJdWlkX3QgdGFza191aWQodGFzaykJCVRhc2sncyBy
ZWFsIFVJRAo+ID4gLQl1aWRfdCB0YXNrX2V1aWQodGFzaykJCVRhc2sncyBlZmZlY3RpdmUgVUlE
Cj4gPiAt5aaC5p6c6LCD55So5pa55Zyo5q2k5pe25bey57uP5oyB5pyJUkNV6K+76ZSB77yM5YiZ
5bqU5L2/55SoOjoKPiA+ICvlpoLmnpzosIPnlKjmlrnlnKjmraTml7blt7Lnu4/mjIHmnIlSQ1Xo
r7vplIHvvIzliJnlupTmlLnkuLrkvb/nlKg6Ogo+IAo+IFBsZWFzZSBrZWVwIHRoZSBvbGQgdmVy
c2lvbi4gdGhlIG5ldyBvbmUgaXMgYSBiaXQgYW1iaWd1b3VzLgoKVGhhbmtzIGZvciBjaGVja2lu
ZyEKCkFsaWNlCg==
