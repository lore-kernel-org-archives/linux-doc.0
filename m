Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40541DE3A5
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921027; cv=none; b=rTAFZ2MdRqbdXqOzbThanO4hC3Vqv0AvOAbkaMgsialZ04cgpyFq16cHfQITJesev0x430eferMA6UGfUAU44Drtemq9nJZProbLPEuKBLzp1rc79EO0SgdIPH93Z1xt8xzICA7qBFi2l4o5PCgi0LT75i5QfrAuCHYk3xneAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921027; c=relaxed/simple;
	bh=DZTAjfcVEUMXilHAzTkctefbUlsyz5gN6B4U82wmSfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOVbefh2m/h03YyA5k5YPwVm58UGjBEKceFdyAnN0bWEXndB29lY7LlpkRq6pyO5SSYOCBDYO8G+m8qKZo5JUdwzNKnyyDwxHbzO7znQwuK17968e2sWO/NXB2tUXDFaXyEd8SzrLhwqQRdt8887ekZ0hiyeUlG7RZczuLNTIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UPGHq/OE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPGHq/OE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dc33931d3so661660f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 01:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738921023; x=1739525823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZTAjfcVEUMXilHAzTkctefbUlsyz5gN6B4U82wmSfA=;
        b=UPGHq/OEGsLt/LitskuTmmS481dbq0ATubFggBBwGLX4GiB5KDxrKwXIOp6la7UQer
         ICFaRTtYP1TCcWRSCutXVXWIk+hhMbrss3onbzlLw9kOCUs4o1/V5oXBvLZJBOxVHE/b
         ML4il5yurF9Sza0Gg1nIKPEQ2XLEmq/i1Fj3yjEC/QYOQstbwkuhv27j/og+47Mmaoj9
         iS/4Y1wK9b8Mwmatus2i6I1ys06fQXSZWTnsRsJVj/cX+jbD/iUKfWAk3RUTUyY/hlkq
         TJtkmbOEDSImn4Mnd4xvBeUZ3wizO5/eXNEQrbirhA3H469yY06oGQHn8y/r1H2HuR1R
         Lwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921023; x=1739525823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZTAjfcVEUMXilHAzTkctefbUlsyz5gN6B4U82wmSfA=;
        b=vl94Rcc2geuLelHOdLHTuQrT9lugTPBOep4WibKUSTdZRH9GJ8LkwEVkZ49Abwophf
         T0IAp330+kzUNyvtY4gQf/ykPjjtbG1cI+Ts5D0K60MaF1LnYCzuqlvvKn2t7OZDm9DS
         Eu3T3Ud9nvtLUO+cuNZl1ftsOfs17u+LJQ/HB2Ve5bCytBoChPq8Fby9ldgWA7Hs5mQZ
         HUxtIyh7eie5Ca8JRIDwBy16SEDFJfw5bhvAo38cLjpEOX1KJSJw3RVop2A0gj5+nY7U
         iTGeS4Bcy4vV+IFoocEKbhmEdwUsqzyF4XnXZziItgxHXRihRV5LlrlGfRL8ROTBTjIC
         rZIA==
X-Forwarded-Encrypted: i=1; AJvYcCVp+l7c5bMa1m8HE+5PVfuFBKNwCvDviN4LH5G4w4vTEv9q9vBS+/36GZn4DCIHu6IMmKw/SeHr7PY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDSOcGCiz/FHlsHq0CNFxFreDgAJjoC+Zv/fwqiVb0EfAGemXx
	kcj/CLkzr9fVk+i+aTIykeAQVCpqWO/ap4xNU3UANxvP35uQ49zIMJeeDEVLPeL+hTVw7YGXqGp
	0n15lU6W598guplBHtvzWEhg7H54pWc9AOGLi
X-Gm-Gg: ASbGncudn5dE9QPgH5v1G+kyOP0rj2RyfmBWfcymI0C8ll8AM5Lk8bYKVmF64D9WJBD
	/sbQvv2YVvy0k+KbYC4A+iREE8rhXId7NtmB+XtVYI37zjLy9q5XbU1hSTPfv2wN9PznOIdICgq
	oUxfolNIsjjvo97DjALTlEvROJA+c=
X-Google-Smtp-Source: AGHT+IHuGjdlqwgeTAUhzEPVafoaXXC6hiVr8E+u3Ozfb8k4Fr6W8d/NvE60aVN0kWu0TCZXFFymCnn9uBwb/aF1fiA=
X-Received: by 2002:a5d:47c7:0:b0:38d:ada6:f261 with SMTP id
 ffacd0b85a97d-38dc8da7968mr1534040f8f.11.1738921023063; Fri, 07 Feb 2025
 01:37:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai> <20250206-printing_fix-v3-5-a85273b501ae@invicto.ai>
In-Reply-To: <20250206-printing_fix-v3-5-a85273b501ae@invicto.ai>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Feb 2025 10:36:50 +0100
X-Gm-Features: AWEUYZkj2fGcFoTVezigggL9H4Yb160h5AwliIu1UEAWrlmXMzfRaAs7Nqrubqk
Message-ID: <CAH5fLgh56iNEBVO3J9-_brJ=H=ThaXuZ4iEXj=seABvXy=r7AQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] rust: workqueue: add missing newline to pr_info! examples
To: Alban Kurti <kurti@invicto.ai>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Asahi Lina <lina@asahilina.net>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	"Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Fox Chen <foxhlchen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 10:08=E2=80=AFPM Alban Kurti <kurti@invicto.ai> wrot=
e:
>
> The documentation examples in rust/kernel/workqueue.rs use pr_info!
> calls that lack a trailing newline. To maintain consistency with
> kernel logging practices, this patch adds the newline to all
> affected examples.
>
> Fixes: 15b286d1fd05 ("rust: workqueue: add examples")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Alban Kurti <kurti@invicto.ai>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
