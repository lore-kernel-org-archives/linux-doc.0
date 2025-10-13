Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FE199BC
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348754; cv=none; b=bl0D05DJTHwJVAA+k/61+sW2WdAKpAaqjNn6LuK8SLUb5Va7xyfGpUoZ5AxeVy7JNVjHXgtGnONSYWg9JpG5Fb/xF8zJGf3KbBqSvX4L5P10enDxjm7TIjPLUMo6VgmP5iUe8v37Nun2JbWLGKYQxuk7gus58ua6GhRuNl4ScEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348754; c=relaxed/simple;
	bh=f5S5EzRGvuz/r4X9fJ+a+VGxsMoAlj8KpasOUBJh7Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnwioi+YlNf76YACnJtsFRkMbExZoUSJYYUTDaqzuTH7kRredwytXP+Qzaa7MPP3bHek0rJg7EFI0WhklVg2XNR/JGW8Gu2p95/VbSBciert3TThxrviXcMNLaJs4aUPg01rIi3MbvZZDrOnQagHrNsTs/m4AngCX82dBXJKzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cMFqA0Wi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cMFqA0Wi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so41053635e9.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 02:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760348751; x=1760953551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVu1hEkIf44NHHLfFJPgY+f91pjliiXRGzufnhZn7d8=;
        b=cMFqA0WiHBlr+qcD6I3/7PFTzWl85dVmq/H7T3GWOpm2RsiGufqjMM72VEAJCLkDAe
         DhwME2wCbZUe7DEF89ZDFF4VAJIqsnIFEAV4/JTlOPfdtrnofR7iyXVAZN1hfd2N1zvD
         cjkK560wz2MEV8zSGtcv412sbn+D+S2jvHo46NcSOT4S+qM5RMLA/XRskJdCNXcUR6ub
         vdIHk6GkDbWXdAUqoptWSvI6inMArupUEQsM91Kh7K9Cc82OfnGs1NVqdZdPosvEkm+K
         9WpEpB5qvuaAYhIBEdqgsjXlBVTSV9WoyT0ozfU53TqH9EdL0CEbRVWMilrPcGyk2xwo
         xz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348751; x=1760953551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVu1hEkIf44NHHLfFJPgY+f91pjliiXRGzufnhZn7d8=;
        b=id+RrEKsQfGoFveYpPl2NhgLx45MKupCtThc5c1P8ADHwMYJJamFWKnWn6VdSY1GZ1
         45gSt7Fcf+sNK2S4/AvrgzXSj1XMfglUJxarKwN/22ZoGicCOjy8MnV99ugjz0+EWw8M
         /ZNgdrodj2ZiLOJQENP1RXAaMFwZvkZC0JnZHxxaE/e0CHA727QS2lZd3nZVBj9xvOCO
         omEKq/yFmR/ACPoXY3abvCWJPr/lSaGVCHwT3Nnj56xo0QR5GgGKf8kT8mJt6Gcyu1Py
         5iFYlHOS59Hb/rwmYXq4VuaV+j9P0MDhJZ2QPRsg+b+N6m10NcCl6QBmY/Ubl6v75Q9A
         LuGg==
X-Forwarded-Encrypted: i=1; AJvYcCUHddwNM/LbZOTBztPK+JYBVNFuoQlqoHRtYL0KL9bNF1PYTtZk6QTulXyHt++WBiELP9nfb7GyMLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQlkwhnvaA3mDzLsA3gFFy3ceNMxuBImvU1RjpoE5jEl7LaB4
	x256cymzdbu+ZsdX0Yq+6ArQg21DldRJ2W7Pv+x9RwmBvz/rW0tvxlL6Lpdr01Ml47z3kLfcvY5
	lEnr4c+VDgWjDxgQS3KFjqUiEN1lWI7AA0sEDnwf/
X-Gm-Gg: ASbGncs3E88sZCXLlX58WVUi2yR+FqaUwhjTN1DUbUsMTg9OWAjWrAimgW+0ZENIt9n
	vzpitnvZWL+aZcxyYJ2XJI7hJjp/B7BHgM5X3FTZDyctCA9o5526S8xMaURyGfXwyUVaMKghfs1
	0PuAHayXXk6369xMlBT8wW6rhK5sx+4fFpQWvFiM3iaaYnB2yComRosorfrBGY2OHYq5c2luIvz
	Fs55Ln9V9jDlWS/748GPo05XSoDbOeSBt6TR6HFVPSf4q2kthCJvsybxC/zp6n6ucs6vi/C
X-Google-Smtp-Source: AGHT+IFqaBixRi77uwFxD0KO5fWa70Oa0mflVhXrjLFcAwKyNCUyus7ehKoAqeSTAbzAk4ZDHyQpfzilqQdd3qFUiUs=
X-Received: by 2002:a05:600c:502c:b0:46e:3d41:5fe6 with SMTP id
 5b1f17b1804b1-46fa9a9ebb8mr133351055e9.9.1760348751245; Mon, 13 Oct 2025
 02:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003074939.465517-1-benx.guo@gmail.com> <20251013043812.13186-1-benx.guo@gmail.com>
In-Reply-To: <20251013043812.13186-1-benx.guo@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Oct 2025 11:45:39 +0200
X-Gm-Features: AS18NWC7zd8zRon9s3XEh0rKZRaVm37ojpo0BrRNHaKslRzb8eH_XUzUW9LbRAU
Message-ID: <CAH5fLgi4C454xG67vN-T5rRV1X4-rAGEj_ftnHqTOoN61wtcKw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add translation of rust/testing.rst
To: Ben Guo <benx.guo@gmail.com>
Cc: si.yanteng@linux.dev, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	alexs@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	corbet@lwn.net, dakr@kernel.org, dzm91@hust.edu.cn, gary@garyguo.net, 
	hust-os-kernel-patches@googlegroups.com, justinstitt@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	lossin@kernel.org, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 6:38=E2=80=AFAM Ben Guo <benx.guo@gmail.com> wrote:
>
> Hi Yanteng,
>
> I=E2=80=99d like to confirm the expected use of the In-Reply-To header fo=
r versioned patches.
>
> In my case:
>   [PATCH]    ->  Message-ID: <20250929163531.376092-1-benx.guo@gmail.com>
>   [PATCH v2] ->  Message-ID: <20251003074939.465517-1-benx.guo@gmail.com>
>   [PATCH v2] -> In-Reply-To: <20250929163531.376092-1-benx.guo@gmail.com>
>
> That means the v2 patch points back to the v1 message ID.
>
> Could you please confirm whether I should start a new thread for [PATCH v=
2], or if there=E2=80=99s something wrong with how I used the In-Reply-To h=
eader?
> Thanks for helping clarify this.

When posting a new version, you should start a new thread.

Alice
