Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792539542;
	b=Q1axhheiSVvjDc4yKEMH6FaHcLFSupOquEo2oNaIOpl/zolN09RswEQQNNQUtmhzIVFZ
	 yd4x7yhYwkBtEOVqMkauCQVgU1/ycOz/kbTeV2YsPGvef9YJ1RBYixIZEeg5wq0XDvxb8
	 IAqOdgNGCZnSLT71jVpk3pH5zapeJ6NjVoxd7IotAeuV5FbSCt5oScYO8lNKUwptTQN5T
	 3yP6nBZM/eagIMMiRIffY55f6850FhVMdJEzUxfAL0iu4GUayGg/GMf9rePoSjy4Ac2M2
	 UJ1sFRXuGGxFi69UqAyzN949Ct4FKVzh8rCm+jY/32kMUZ6y48qXF1ocpr6J1F5yjxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
	b=clkV2vZ4uKzbG3zC5E2tvQPJx2PSsGAluxtjVv+58UuNxEZddpYXfIm2jmgDThZ2KBeY
	 N3vCjTJyFEwZBsIvdDT7Td4W/6Q445zWC2Qf1IgJiIyHvw3yu+RSw+2t6ejBgOJiEbZBF
	 K5gCKMODaBI99Gswq1G1Ebb7lhHjkLehV5B3B3BsERqp0oqfx9cmAvdHk9n5OqTVW4oUz
	 7LOgwdY2/+H1Ptla5COueZfwN3R7AYVJgCK5aQc8cot/GTHs57yzf+UXEZeU9B7JpD3MV
	 EGUuAuWjSWecqNJyzIqIXnmZGYM3XyRsds3ZMFnx5bh103VgHHgeIlIb7NtQNnzsNgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bgzntr+m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7D606A31B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bgzntr+m
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33c10faf6easo14885eec.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792539541; cv=none;
        d=google.com; s=arc-20260327;
        b=M/75F3Ct7BvAPQuGHsOVeg9gLyEL/T4wC1tW5aQcCyi2UbNu3RnbzMWMZoC4KDhXmG
         3jE3TcjfSEMXRyS2g0GWezxLYI99FhC4eWycaBpZ8V1ncUqB8nPrNbAkqHooyvmA3iVR
         Yu3SSqqlxorsoGge/0JBOzJisNI/sS9k1bEDaev/ntcHBl2V5fQNWmepMMiMiRjNqLxn
         ChZX3VcgS+RHeN9AzD2MA83tJhwgHdyWIXDyhcHBXXlaGFe5J3fxx37XoIm2TSYsOlt1
         Bdo4vYzjVp2DdVWTSCOVRmFYl98X4gnJSr6jWXXr6/1C8z8/k+26+gE69eULeweZrMuO
         t1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        fh=T3hp4cnVLe3Qx3MvjtZn/DpH65JuF1CoxRCC7PZM7fg=;
        b=elbT0hWoLTLWC81nffUUyIpSu+xVM1Of/Tp/8pyATKnse+FgueojmKpGa/+m/LDEVp
         IuAOu1xSKImRfTx6GpWIL8rFmkpG1HiczrDYMMm7PXSFuUUAevmzX33fkO+hkyVfOT68
         rX5lxx9fHX6NtUseXufv39Zv1+oUMB83xPu+wRVHh4JloAtPKCW+pu16XQZz4XzFTsm9
         3nKccdJ6KBwVn1Aoa4kxX4LG8dDh5LALJxXHVhamvqMgjnlLfDdcRgjH6Eddka6Y90k7
         Y/jqMG6JcnQsNlHOlJ4XeLPjHYxEdh5CKfqDkx/RQKqUcK9LaD9Jhhu91OX6W1HmoFWy
         2z8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539541; x=1793144341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        b=Bgzntr+mTq/MYRdA0vDX01hYOFuHOkjfr+4ZTyvXjpCpqA6YQL8OesCpTivlbCO3M5
         QLrNcPkQuu4f7nSljhd+EfMSskX1pDwzgDgpFbEb3F7gvSqx4xvsqhRAo2d9Z/VUlau+
         TQWiXzY3jhHLdmwdGYHb2lNYXe9tl5FVQNzlKuQL/RPEWmJDPxNx6Y7EEgecSXzniz5F
         6SBRogJ4XtbD2CxvQ+AswQLUubKAqNHdzT6OlKsgdzdOYAeiPusiU/XUA4PABalcp1Jd
         9nwfKUoXOgZdmty5Y3fbNMnj3f74JoMZbWWSmdjfJCvJ5kG5jlw8UguMEGYzTrNiOZRf
         lrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539541; x=1793144341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        b=oX461qthjvQugOsxS5ZkjRetJkWre2uxPXq/pz0XpsOWm+8jt8k1yje8OswggUUcbx
         Gs6QN3Qp23wMqwDuHu82O5pkvMVWrtwLagjTpA5FEz1NlwwP0tpJwhiARoU+YvFTPAFR
         tfqlMaSJ6Uc2OFViqBAaimZcE7S2ilrSxaPMqu/WOlwj4YGboByhIGZ+5++vzkwhkRJ2
         jdB2aeNp31tDA4qbM20tlLSAuTwK3Z6l9T71VxF5E5msIiKrBNBcZUfA4xIo7xa5mDR6
         SNhrT5mQ1k5vbh3ZaCuh4fu2jAJp4sY7SaNetUvxWnhKP349/8XEKI+CHatrbqRS+WhP
         CwEw==
X-Forwarded-Encrypted: i=1; AKwUvBzC3D0Jy8Hu0UDCNZ+NfKJHj9dikSUhDuTs3SbncizhDikozDryEqcmbQ/KYI/P82EWCWEqyqdA6As=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh0gSlsWwXsRWAu5hrWWALPI9GrTG+f+9JwojuoNexIuPGcBUD
	hcadS/qjXFXy9OdLbyHIQXr2B8Rfr3f6Wff4mOnlH3j5jdKWwxmn0e8dtt0yTmE25Q4ftC/31Wh
	PR3TrlN47Hd2ciqee9PqimZAMhjq0oo4=
X-Gm-Gg: AYBFou1G6Vn1ukiwwe7daALZgzH/w1wg+MHCdF9nQZVw+pwpc7sqUJG8oq2O9JykWBO
	fHduAzXxUVkWekzWbnhMLBTn6CW1PI8T7ziqkkTNc9n6GststUC+Ip5Tlv6MW5izzJZ9iwCTy9L
	zbY/uIb/0f1gxghU7191HJSP8fp7zmHg3WdTsjLROM82D+Cf5o4Rfm5JTTzQhG5sZIXt8rJkwby
	qDf3hx5Iwx1nO3kv1JM/Y7AXaNqLzEVfK0BBHgElhYjl3S2NKjvEIszzF8l5aPpSwYzOUCFMrYb
	5D90pGIRcZrw6ZU7kwhOE8gp7xYgaoJKi83QumiDLEVWyYBBG2ZzNJ9cty7hkIS2ONs/Ab7KI2O
	BFA7EB3LISbeJm/mWkQzc7rnV53uYff+GQuMV1vo++kCX8B1ZQ4pNlUpz5a/tdZobJdpQTM0IMF
	phPwLABQFppivPH1ilk4wuAob9pXikrqQt8Cj+vXrlOjXzbZ60Sc84hMKEVf9/FA==
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3674c43a7dfmr1490822eec.2.1792539541506; Tue, 20 Oct 2026
 16:39:01 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 01:38:47 +0200
X-Gm-Features: AclHuK9F_7aaAg0X585zfZoDOcg5-Ci0Oo6j4hvWMoH5Rdsf4VtUyCtDgPceqfs
Message-ID: <CANiq72kACdJ+yaKd81TxnQTfYoc1drNMxv-4pdWMty8dSkwxyw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
