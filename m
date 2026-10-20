Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523381;
	b=eoZNFsizKsKLFnKlOXSgmDeJg7jfyYywjwF2mdgfNkTLg6ZhulxAVxvY/ZYB711Vkkjj
	 NvpnGe3VsTaAauORtpC7BDAOfttYWnbeu63cRhVA+9gZnrZN+LIjfMQ89ok7rxP1EYZi/
	 Nozf/X8ckvOY1B/p2IcIP6zmwi5gIhyTB116scOqrLjUuN5xja3/L/T2qXJ0zL4fOan8l
	 TLXh77OwGS9rDVkVqxlZ0k+M764U0yEPbETVRrGqAm2+oKepcTNIdfuKwTOodOVpsb4l0
	 OOECIH047ihxBLhDJAwcUi4xMyJx05r/7NAMVzK1TG0WNmdnkN1kLaaxn4v9AD7s3Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
	b=jOftjDCX2YIpmIjgTHlEUSr4mEQmYphq4Sgvr/qu77PU3QX0ZS8N3Vf+JX1IZ1ANYBwX
	 sEU0P+fsewP/o+FSQwkT089j+DND9rF33dAZNT3scW89L8uTWGnj0kk83uFhsyfOgLhpr
	 dWQMa0rWT6XTRN+KpXxmx0CsE+cEjRQjlIZEYDM0BLGaP4rxdY9v5m6kbqx0d6Ru+TMwY
	 3bgQbCO1iT+8mBJiXeXN9FvCdonqTTfAuP8eUIRiz8kfqKsEhfLHfFej5VBOHrBtKjPCM
	 8rZ9044OFKVVYL/QC6J6YABcYBZP6pPOQs32M8UHoNC7GX1gQtOEie1yA6YUyNIOdQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E8606A31E
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-313bab9cfe7so511331eec.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792523380; cv=none;
        d=google.com; s=arc-20260327;
        b=CfwJguitLKNlwf8se2LZwRg2MuTkVzIH8ZC1GVU3j/xKHlfC0rd89kJXRi6kPUALzr
         8QkjF1vOuNyzlxFxnQ/eTjCT2RsLmFLid/8+7xVDspxW7XgQANrtWa9QIDniRGACuwyC
         ZOdUWcdCu+QJmNXVuAcNi1p1XGzkO/BOrKyGNHjP5lFsrG5l+OElkfkiSFxt3tM48W8b
         f+Qcp9I1BBa2qdd6ftynUQox2GVtqkvHp7R/7czn6uE3+Y6I6Y2baXD9cm3UVVEFZXgN
         TEjVSXIGJdM8/Gre02Cb5Lv55k28A4/RhmGpix25r3EkqIU3LMMLgYE5IAIIsyWRBVGi
         Utvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        fh=8Os150p6J+plNntHmvWrMr4d7/IQy/rxJIdrni77RwI=;
        b=lYIR9VBQ+L2MNNyumO0o6boB5mGN4OKocCnQbMSQSs+aMEbWp1cjfo18TtwtiXvyWi
         BufyBX9uIeGCNyIHvgDeQOqHCgvDAQ+03p3xNp5rqKL01x0iYHDDHcDmxkIuXCgGLr9C
         v0KmJqQSx502sza3e5iT3qQLMZRrJeGCNOFZnrRdOJUL4XxUhHYizQfUNak2UWtmX8BK
         dWkccSovD8/3Y/nSm/aD2hfd5DdpU56veq2bFzHWdiU1Lxj6qa6leH6dsAxhZ7AzQLcA
         KpQ8XXe5T5S1yDTUeNtcHlj/pKSWtWQNpUmlLyVk5+rF+SCq97+ed4/EV9lIoUiBjOrP
         TUbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523380; x=1793128180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=IygMgcs6Wkd11h28ba3ojzsoJTpJa94odgDpgzrul6leMm134UWAt/R1EWFLQ7KrD7
         cBSCFOQ7MVWcZDDh+NFWLTMz20zU5V4OtYha/Dt/ndOifBmQqWKbEPWCSAUmQUCztPrU
         lV/rb5aZyojz0KbkWV7UxioMmIVCAOfmPB183Z6/VcaAHY/R7bG+jTfqiIfMVDC+L9J7
         Ru+qT/CBDKbmkkQdRKoQq1VXCffrvFzcO+E4IgTEus+geEGk8m379SuKk4YQ5MAzXfhX
         dJhCDvgLPUuAjgpRnNwG6zwIfkaC4zt+/JtE4MTaMLMyHELdf2YxSGLFrPDVCiXvHLUX
         iOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523380; x=1793128180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=l59aZP+71JxxYsBIHjhEZqYz0oUXBI5k+d1hagW+P7/Z39YXcs7ot7HI7P9ktvxuBQ
         lU0aFvsbZ1k5gZcHr/2aAC8/KK5bZ0GPlg5BKCec+lwV8x4K1gvNtrLcGKmGWc9X8GQx
         kOm/4NnAjothMVhei/F2+7ulIsu93ERwGdwjHDA/27SfGV2+5OeizfBlSa9LzFkkUOnQ
         7BNMMsaY2g14Kw7wKMA9zm5y36zbIXSHaisaFxCyJlr56VJPTK3/N3Kyn70KRPKj1m2B
         wffosduVMieM+CzfM16zyeazILH2s+E1vw0+XZgCFWamcGN8lLylmewqrzFll11DWWxD
         v0bg==
X-Forwarded-Encrypted: i=1; AKwUvBywZqDWTjGl5ZZHqWI8j8ysuJ92BQQk7vNfjCWd3kLdo/30CbRMbcMgoJh/D+hjlUj/PO0F1F7YYxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGDhb6RGwvRB5lN0kaONGksZleDk/BucuXbh7ZzKfMgJ0CPn4f
	g6BGrOj764c5tA38qc1lQ1vKh7vHGgn98iEXvo2jeVLjO46wrmjAx3R2CywK/2nfb3YS/DOejgD
	c2BOYMKXRBiQeDLDnuRjh6VsF8saFZI0=
X-Gm-Gg: AYBFou1BBE7gvZI843coELtZcXf6+spmRbGYgdC4rHOQMxT5P2cjWkLAHFx0CYmUFMe
	A1DBVncxc8hTpa+lTFQsPAjuxm1sBiQ2EwnAT2GnionOwMrIpEHLGjIarVpFCXr7skYXEtPmhE4
	gL7f3VybjTi42kY8qG1TV5JtjRxSY8K4gEmuxsaXpVkBmePKw7S1dwxcgcAW3rdcZF+rEg76jhE
	cGotIN58rdR6keawi0hWsAAyL7a53Gu8a06yIhCAWA/zGyg+K+zlK2sfv1Dg2losriIhONZiB0l
	TVfH1I974sAPhzJoeETql+SyvH3SwJwi/nIf8wupxgYMMS+8KNpyNIiCRD2SQ+Pwx2Lm7fw49A2
	kvScNZeWCKSU2o9ehhfJJMHnZ++GqJZRMZtNn/4KoYDknq6Zit+o6zzyhNfbzJONMdt5kIVKAqu
	POgY1ERmOavaUwTBvlbANk1hw+y2/htRziY/x4ST32tpE0HL5SDcM=
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-18507ce1c04mr25464534c88.0.1792523379507; Tue, 20 Oct 2026
 12:09:39 -0700 (PDT)
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
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
 <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com> <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
In-Reply-To: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 21:09:24 +0200
X-Gm-Features: AclHuK__St0uTCw1avvWmNXKKyd1psXINLsd-c9PUmbMZ1zOmfz4IJPwzKvtrCE
Message-ID: <CANiq72mcCErQoK6wmtOcAZ+SOgRNZO2fPoZ1dac1Now6txy=MQ@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 8:22=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> If you think there's a low risk of conflict, I'll take it.

Hard to predict everything... but conflicts are generally fine anyway.

Thanks!

Cheers,
Miguel
