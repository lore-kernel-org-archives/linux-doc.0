Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492487;
	b=miHqsfDOHGdMAjNsmgdkz0KdWDMTR9F54jRfSmFF1nEFb0CBcQiKybdDVWQc7qyORaH3
	 K0puIOJXdgXNjxPz3PTRMImW6OQ/KBn2ePKUe87dk001XPjMrf407NoGQOjWtPp09atlh
	 vQk+XKM7XFYYWMpnbQuWVzCg07MoSF/JMoLa3y45ZKR/EsF+RRGL6SbK4cqi4fYDwtipa
	 FRqd13ZTxw1+t40Ujjdj3NoPpzqwoCuDdjxL1nMNPZ538WJrrRnhMznCJcM3VXUmbEUVw
	 aesmeYIkB2O6MLD//oywfaunt3M8wPXCVbsFjSMG2pnQ6AFiv/qpS98g0BYyUGfmJaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
	b=VAnmBLwxzD0qSq8KD/gXRht3Lnf1SGCECa6c3HxKrUvrktHSC7ID6MKutzeWRkt8Fuby
	 m3rpaMxTZBjrcmWIP5feSJ+e90QUcsUohvbts47vIIbbRZ5bHBDcelh+Jdoifm2zI2JOI
	 Z6ZPjCDrfVD4a58UMOxdQKajUK+Z7nSDkRDRbPYzVAgG8OJpGokJnEAtwD0iCtQMvujfv
	 iCWqkz8pE5tP5qbBvGtDnv2HqfnXoO6ntBPiptAEc4KXs5iRbRwO/4+ZFmlmfsnG1e3xA
	 GuH7LMQR+8TKn42tBk9FXaegxX3zrlKFtkF6k7xYZoI8EJe0VWbEYbbNu4+Wu6Y+tUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA087606A319
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA087606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1811500c88.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 03:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492486; cv=none;
        d=google.com; s=arc-20260327;
        b=N9bXXkd3fxqj7lCbFnl3U2xJV/EyqBMxmr8dJg6K8C2FXAuC6yuNGV/4udXXXnAPCj
         OoSueSXC5e4r+JDdpFk+FwgvdeS/FDwim7XMMWiYIt8v6rnteV2dXFCJERYtCRxgQ7fT
         aQ3yy8WDP5k+Uhe0THkAkPJc4U5nT47AYo1/YwInTFmzTidlFpvaVZhX5jBfToeHPp/9
         h85HrpqP8WwdDLBUFsJjNZxUSO2BNrJyF2esuy/AEU/wRSaoyGCCVXTnlmpsJ/MgQH1Q
         YSymtR/kkB/mpDjrhlHTh+d6xr3vbounDGC1z+RiqzNLiIGO90b7yFxP1rmQuOn78vJp
         j/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        fh=Er7ceS0LtaaJWjSEwmJgYJb67cj3tRC1DkVkAIKQpTU=;
        b=bx+B2PqAsnjldURhChadfQ8py8+eiNLkM6btMDwTHhTOJl1ttIuNl+6B+IQfFh07Nr
         Ti/I/MPxWpj7WU1BAu6a8O9pZSC8obwUv00cc3c0zkRrnR9t594Zy+CISqoGt5yM1+xt
         As0Bx8uvIwbCyGAQjmlT2fKKJ6xlPydF1nUzdQLrXde/aUENjHwEOP6LNQ94T4Ljcj5K
         TUlSwAEqXLD3SkdwNWRVZIpsQ0sfkJsxE+tOkLNJMt7X3lkGU14XsxhJsnsbmssN0R8V
         YuSx86PJeYZu0III2WVHgnYUdw0xYnSaK0MeIkJpRbn2yC4Wj8M9TCRla+h3m+KGnXTP
         V1Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792492486; x=1793097286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=cI4IJybIWAFbUhFgiqBGwhfqjgpLGre5R3ot79Ke3zI83Rv8hsE7zK5rQQywe4d1ep
         r23usjXDN6ONg5MR+VjsdgsKNHxDDg0RrsGtvGgLLY7pBHRzQC8h3/H7kxTnExzE6Qmo
         QpZbMR5D5TDURKfX9iAKFDKoEOuHC/IePb6qiP33yxaGOZL4qmuyU3HaaGQSjnc/0vAN
         VhzGtkVCEK9aZxDzOsE877SK4MI9vgdKQQaC/5Oj8b/f1ETaawk5swZ6s8fSIdJzKSFn
         lbaG7dr3LzHW2i+qbB5nZmgclId/Y+2MInJaqBdwT014/GtR7t3ednJvS8omieNK8REW
         ob7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492486; x=1793097286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=sv/uomINA8Fbh3CCKR2gb1xXbJ6sArssYaLQjgxpxClpVOUY+Jm5KCt2839mmXgJj+
         HmtVlcISPF2aaY0ecTBI41fwS1cWZQWW807Qjw8s2BMWXnANeJTzEWn8pQhjkTz0Fhqe
         D4kctvoQTxx/wDYZlkb5XAHqjCtKj8mMPFGkfU7g/Y+EWrZvp/S07Xor1v7AoaluvjN8
         QCOJ8Bhdw1+aLM6r92CjBzy2uq5xNR3oKAlL4eWPpzTngKxcowaVcOzlGBV4CdbVnx9u
         Ezw3EDJbD2p2jkpDh7BtCEEGIT0yBd6IsXpLBeoB5zpWXUDRN+34GFGD5uh3+Lpy/kCu
         7ogA==
X-Forwarded-Encrypted: i=1; AKwUvBwVdSyKIpEh9G/PN9FIIY3Ln1FKRmr7FKgQeLYifGV1LkAcycsxpA0AmQ3mtin70UwoRWlwV+QBptY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4iX24UAivX4f3oj6yztDZNG5f7mMBgIQJh1PcFkdxMSC42ZyY
	brL0XEfErwewsRxCM8GBX2eLHpWKjHFPRhHICVplUJ12xP6v0FJQSF0zN7VpBQZc5ovCjSZYPTE
	bcM0S+lghYt0GccU6gAbRs2/7t2ynAIO0kf8uJCbI
X-Gm-Gg: AYBFou1++/2TPnVfAMYsydnUcPuL4SNStua+r6desRmtAGta54HKbjYK/H0uGJp2RKe
	VM2tBpVoKrotPWhaFg9PFSnVGZ/i6UK5Uxp9HaAjoZ5vICS83Wbvx4gRacE2k/6VSzpVr8nYdsH
	qyF8FzjIbLIBjVAgd01AzaHuG8YurnVaa/1ftUxzA24MikX9d/msut8nZyZIc7PAF1Kn3PzNB4a
	gs7TAv0derUf6iZoKoWzgP1rGNWusKuiwZHug6+eX/Hm2GgUCIg4YqPe90Ozw6fZxIVZp78LZpU
	czt1TQSaRUMFwwyzzNvH6uWoGNB6Ge73qIuwz3bPYJldqaAL9bmMEI4F9hfarvOS+hdENbqSBIH
	0ZLbb/3jpwt+eh2WpzEGaHA==
X-Received: by 2002:a05:701b:4657:b0:183:bebb:e93b with SMTP id
 a92af1059eb24-1850d3705c0mr13844857c88.6.1792492484834; Tue, 20 Oct 2026
 03:34:44 -0700 (PDT)
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
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com> <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
In-Reply-To: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 12:34:07 +0200
X-Gm-Features: AclHuK9vxwrK8NaLvu2ec0o5N9md4lXO8zMypsPDxXbgQlLlX57bi1hqfmPPF_I
Message-ID: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Tue, 20 Oct 2026 at 12:27, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Which tree should this go through? The Rust tree? Probably too late
> > for this cycle.
>
> I think you send KCSAN PRs, so I thought you would use that, thus the
> Acked-bys (I suspect others thought the same). But the Rust or Kbuild
> trees are also a possibility, yeah.

Happy to take it - but in the interest of avoiding conflicts, thought
it might be better suited for the Rust (or Kbuild trees).

> In any case, at least for Kbuild and Rust, the PRs were already sent
> (and, generally speaking, I would have expected a patch like this to
> be in the list for longer anyway).

Needs some -next time, too.

If I don't hear otherwise, I'll pick it up later this week / next week.

Thanks,
-- Marco
