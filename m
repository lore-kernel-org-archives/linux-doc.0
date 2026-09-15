Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006243D4FE
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494976; cv=pass; b=p9DKYAA1a9XpFmUJtAE777rrQ0PAzj5WVeRIZn+6h3hVzZbW9Ii+eZ/1ZwBEHUo1vAH8XN+4XHvZsqrrf9wj6MnPB+9F+prpF3ehlUtLjBY2iN0Ui1G4/zofXlzbiTp+/VirUZWMxeXYwTxeIWdkaOr7vCUtyiCm0Gifer0jK+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494976; c=relaxed/simple;
	bh=P7a2zFFMvnl7AMMV9J8HoSFvOnO26MuCDolXpy7oTxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPqYqKuZKfgkmTosdfWQRTyVxe3BHPYZ1SbEojgFdQP73zFAQWvCjTI16FAMM7Q06aeOrYoBhZoWhx9HBVHLvUMnf/NM5z86F1NiYvFEAWjaNqI2heCwAYaXEQV1Lv6AL4M0vptj+s250q/p1ywMB2hR/xlJLO/m5D1SCnNpU5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a6KqVcGU; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a6KqVcGU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843e397f74so707068f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 10:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494973; cv=none;
        d=google.com; s=arc-20260327;
        b=i07FWib34YTJ51ALffewFAQYNa4+NWYloIND6geRUT0AJ3nCZSzFm7yxY99Ws3rcHj
         CShis303mjVN0Whw84vX+PxqDUcO1dESuwWtaceORq5VCpYNnqD3h8XT8yFTHL3BA875
         7+6OuXnhYMsFHPDrCvIEiZGRoUUOsor0K8+ime8ECqRk/nlpHyfoK2AVGZBGkkTuSESd
         cwpId2OCQLICGO6ZMKxnD5cCWALFyuropSs1KbsZ7hE9Lg5BsexjXb2cwS+V16OfMK6F
         w9H+Pwe8DFVwVNSUznC6PmZa2vAY48m2ZYC8GKbD0DkMMiOoGzwcua5c3xcvJXDmOjea
         k+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        fh=s6vElBKZS9DprHfwMb7idSbcMG4X/qvzXxGF1OXec60=;
        b=LRrdKETx/owrGk7zDvv620BwJ5S3jwWAUz3uUkcNqByF31fucemOd5GujSdZyblVvN
         7GSiMn1FkAWVPIF6TjLPpE7xehTYYaNEt65BUpZf1brpGTYuo09+JJAVZyhSTvaJLp/9
         sizCl4CrvCCM/uqVczVlURikVtbQp8Z/Ls3ZGkuQw9XRg/VF2f28Jz9fXYGj/WV2NVVk
         jmNaXMjUO0BciLts9/McDSyp6w22kI4CazOPIyY6q8lgNkVJX8MoyS83m+2PqBgUWMVW
         3R+LHeMEvj2qD3zP6qOVtVEGZlQ31uOp2h3m9mQOXDLvWUt0Nq1fVEuUZ65QkG36wYSJ
         38qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494973; x=1790099773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=a6KqVcGUw2fLFtF1Hm9cc5yrvLvRY7YxPEhLHNJIfcavwgt1rbW5yhhfaSMX9+BAED
         DGIeBSCgb1PlyB68lxCyUYa/zeD7s7Lo+A6Qmv93dYvmxfOjOqiT4T0+b7iIrlo89kl3
         YmXf3optvEP5cx8oa/c2vYZz/Cpd/9YBfStzMILEteq521PB7cv0n4n8ZyMgrCmgFcCE
         lMSUEJYprCL+/e4j6Ny2nYOmfUuoU2z79ZlpeYGa4QTjMUcNXGJrHFAK5pWg2+Dyb0Pk
         ebFFkqcbAhZKuXXO3iWlS5mmW4BKwKJfkzmb/CfloFnTWbyEEabpV3Xv4BxGONXxY8dZ
         5NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494973; x=1790099773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=FT2QXlnFOFkSf+PnMDJCy3Rl04qAKkCAQj0WIsdQgABMYhCpYlXmJ0EAQmHmECvqtW
         ne5RegjfR0v+q76XqfvwMtKujosNWUNDZoEERRqE+FhadWLBzHMQd3nJtwlm+D54x1cd
         WpDCDxX19XsPcBwv4XK2s8Q4LTwzmsOuQ0e3vTT3cUVCxh1fnprcdqOJ+lGMJ7CspZz8
         EH4JhP552vgPMDBbF9biQw0Dn0GnQXI0MzpWSmyaPnnu+9o4nKQuoAMZTHmoiEB4P/Bc
         cKrTZsjDV/kDQsufSROXPZqwM2Sj9bS1YATmkbC1ip//LlRMK+1QiSROLhZV2pjV5c4B
         ZONQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbfBnhkhuYmwPfr7CmfT8ydgEHz54Gr2ENbHKHI7cRypcXN71RhXgeXbVLKK2bIMxupiG3x+NCfus=@vger.kernel.org
X-Gm-Message-State: AFuF++knxr7wl6qAZ2MjjQfQxYXg/df1I59Y9cVc/LhhagBxbLx8N87R
	8+LUQkVTW8jTSxPqxw5c7d6jjIX6Kbm1jm6QjN7KNX1yODDNIGQyVkKAyc4+H1ioZ46uzhXZBlD
	nzw6xm+JZuKfYQvvHYB0EH+sCLXV2yWQxgM/eo60N
X-Gm-Gg: AYBFou1us+am720z5S5N2glz01rk4tRwNUIKV8TXDZuFmzlPNzr+4ijEJ3hi0MNl2Xj
	tT8sF7qdqUGwuzFRo1CJdT56qIXlVUsFBl0i9GDkRST5V/5sNS4MW7wgRe1rL+pJr52mOea4G9d
	lIJJljAG8rQGD+ueuRedZnLWdKIh7IuNAMXcpRwtni83iJTEMjmdAbUYsoCp0OyTyFCh6PGEwFy
	2kiNJ3YpSbTm9Y4pNBlALgppr7ER4ClabEY+WchNxLj3BlMEFneNHc1x/bmmeM6oCX8cSvNMGOj
	9kOJIgGwN/e2Cz/Pc3QFD/m0MWik9ZnIWPB0xg0eN8UgGUnSj2v1CsXnosWcNIu9naye7B9y5nD
	OD6d9ibUz+TA5jSe39GtAk4/HgNs3ju5OoHsj7aPJpLqfmKwBq7ZIc/RKy4jo+vJFSBM=
X-Received: by 2002:adf:eec3:0:b0:487:13f:4968 with SMTP id
 ffacd0b85a97d-48705b5d792mr5756089f8f.11.1789494972051; Tue, 15 Sep 2026
 10:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org> <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin> <202609150943.000EC9277@keescook>
In-Reply-To: <202609150943.000EC9277@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:56:01 -0700
X-Gm-Features: AcwNN1WPMMWK_d5_qt02ICUH5UNGl72dPPgrM0zv_mQxUiZh6yRKMNR6HBnx31I
Message-ID: <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:49=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 11:44:01AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 11:00:27AM -0700, Kees Cook wrote:
> > > On Mon, Sep 14, 2026 at 10:22:13AM +0100, Lorenzo Stoakes (ARM) wrote=
:
> > > > Module finalisation on allmodconfig builds consists of a large numb=
er of
> > > > very short-lived jobs, and the make job dispatcher cannot possibly =
dispatch
> > > > jobs fast enough.
> > >
> > > This "cannot possibly" sounds like a weird LLM language intensifier. =
I'd
> >
> > Again that's my writing actually, probably best to stop assuming LLM no=
w ;)
>
> Apologies; whatever the opposite of the Turing Test is, I have failed.
> :P The AIs are winning: humans are suspicious of each other now. :)

Is there a term for this yet?  Cylon paranoia?

--=20
Thanks,
~Nick Desaulniers
