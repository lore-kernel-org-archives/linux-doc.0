Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378CABE68
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 03:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.222.169])
	by gateway (Coremail) with SMTP id _____8AxjOhWaptl6AQDAA--.1653S3;
	Mon, 08 Jan 2024 11:21:58 +0800 (CST)
Received: from mail-qk1-f169.google.com (unknown [209.85.222.169])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx399SaptlmuUGAA--.18272S3;
	Mon, 08 Jan 2024 11:21:56 +0800 (CST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7831389c7daso159358085a.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jan 2024 19:21:56 -0800 (PST)
X-Gm-Message-State: AOJu0YwFRlw8JTFWbtH2zGs/moQwPswIg5/XNV22TSIEb1pQTgPbfn/a
	/SUk33stR17a+6ixNiTK/0f+G5cmpUq0Si1w3+BoAAjV0hgTFg==
X-Google-Smtp-Source: AGHT+IGKnCG8TykNKu6ZAbyjwnzNC87gaoIpVZsuDDN+mlXo4QRoj8lgmpTyYllZ7a5FmM235WXdm/gN/LQ8AnX4xlE=
X-Received: by 2002:a05:620a:272a:b0:783:251a:e5d9 with SMTP id
 b42-20020a05620a272a00b00783251ae5d9mr445312qkp.21.1704684114109; Sun, 07 Jan
 2024 19:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106065941.180796-1-wangrui@loongson.cn> <CANiq72=M5TrUL+9Z0nqKKcD=KHwyDA79fNYHgU2EJ+7u6Ct8qw@mail.gmail.com>
In-Reply-To: <CANiq72=M5TrUL+9Z0nqKKcD=KHwyDA79fNYHgU2EJ+7u6Ct8qw@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Mon, 8 Jan 2024 11:21:43 +0800
X-Gmail-Original-Message-ID: <CAHirt9hd4W25p1kVNYXbEXrLj6NgT5r=EPWsoOmHZzS1qGR-yA@mail.gmail.com>
Message-ID: <CAHirt9hd4W25p1kVNYXbEXrLj6NgT5r=EPWsoOmHZzS1qGR-yA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Enable initial Rust support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8Bx399SaptlmuUGAA--.18272S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1Utw17JryrZFykCF1DCFX_yoW8GF45p3
	Z2yryxKr4UJr9rJF17Ar1xXw1qyrn5Gw15Jwn5G3yUAw1UJr13Jr1UKF45tFyDGr1xCr4j
	yF1jvF1DAF4DJrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU289NUUUUU

Hello,

On Sun, Jan 7, 2024 at 10:29=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Jan 6, 2024 at 8:04=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wro=
te:
> >
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  Architecture  Level of support  Constraints
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +``loongarch`` Maintained
>
> On top of what Huacai said, it would be nice to add another character
> and realign the table so that `loongarch` it doesn't overflow (perhaps
> best done in an additional, previous patch).

Thanks Huacai, Miguel.

>
> > +    } else if cfg.has("LOONGARCH") {
>
> Would it be possible to do it without a custom target in
> `scripts/generate_rust_target.rs`? If it is not possible (e.g. there
> is something that you cannot tweak otherwise on top of a built-in
> target via the CLI flags), it is fine to use a custom target for the
> moment.
>
> For instance, this is how ARM is doing it:
> https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jamie.Cun=
liffe@arm.com/
>

Thanks for your comments. I noticed that the refactoring of the build
system to support the use of Rust built-in targets is still ongoing.
Could this take some time? In the meantime, let's proceed with the
generation method.

> Thanks!
>
> Cheers,
> Miguel
>

--=20
Rui

