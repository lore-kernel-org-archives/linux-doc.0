Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD271370
	for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.219.179])
	by gateway (Coremail) with SMTP id _____8DxPunh9Z1lfrEDAA--.3150S3;
	Wed, 10 Jan 2024 09:41:53 +0800 (CST)
Received: from mail-yb1-f179.google.com (unknown [209.85.219.179])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxXN7d9Z1lkfYJAA--.26496S3;
	Wed, 10 Jan 2024 09:41:51 +0800 (CST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbd715ed145so2656929276.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 17:41:51 -0800 (PST)
X-Gm-Message-State: AOJu0YzNUL234HQCPpj2WUH5EeC++o111eyZldLVc+zoU0kN8phmAGWs
	FltJfC8DI1RyVdfBfq5qDSpWPC9a3KzahNrSX7chrj80+Tz1vA==
X-Google-Smtp-Source: AGHT+IFGt23l19RvWe7u/09i6msGSYglWfrLjSgX4g2U8Pt+hIzJyRXUH8Z8WRcK14GmDck2BQKYnlRjXVeZ7mu7+k4=
X-Received: by 2002:a25:730e:0:b0:dbe:5353:3174 with SMTP id
 o14-20020a25730e000000b00dbe53533174mr204149ybc.57.1704850909353; Tue, 09 Jan
 2024 17:41:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108032117.215171-1-wangrui@loongson.cn> <ZZ2fn0scbDKBXWe5@boqun-archlinux>
In-Reply-To: <ZZ2fn0scbDKBXWe5@boqun-archlinux>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 10 Jan 2024 09:41:38 +0800
X-Gmail-Original-Message-ID: <CAHirt9iox8FGV2wrMyxwFRjab2avfOcyLKvBc9K=AqiHxqHXKg@mail.gmail.com>
Message-ID: <CAHirt9iox8FGV2wrMyxwFRjab2avfOcyLKvBc9K=AqiHxqHXKg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Rust enablement for LoongArch
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8DxXN7d9Z1lkfYJAA--.26496S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF1fCrW8CFWUGw45WFy5Jrc_yoW8Gw1Dpa
	y29F1Ykr4kGr1xGrsavw1UWFn8Aw1fKrWxXw1rt34xKr4rArn7ZrW7KrWfWFyDZrW8AFWj
	vF4F9w13tF4UAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	GVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU7NeODUUUU

Hi Boqun,

On Wed, Jan 10, 2024 at 3:35=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi,
>
> Thanks for the patch.
>
> On Mon, Jan 08, 2024 at 11:21:15AM +0800, WANG Rui wrote:
> > Enable Rust support for the LoongArch architecture.
> >
>
> Could you share how you build and test? For example, I wonder the clang
> or gcc version you used and bindgen version you used. Thanks.

You are welcome! The versions I'm using are listed in
scripts/min-tool-version.sh, and I have tested Rust samples and the
rnull block driver.

llvm: main branch (ea3c7b3397f8de8e885ea7cd1ed5138ec4a72d50)
rustc: 1.74.1
bindgen: 0.65.1

Here are the build steps:

1. Build llvm
2. Install rust, rust-src (using rustup) and bindgen
3. Build kernel

For more details, refer to Documentation/rust/quick-start.rst; there
is nothing special about it.

Regards,
Rui

>
> Regards,
> Boqun
>
> > Previous versions:
> > v0: https://lore.kernel.org/loongarch/20240106065941.180796-1-wangrui@l=
oongson.cn/
> >
> > Changes in v1:
> >  - Address htmldocs warning.
> >
> > WANG Rui (2):
> >   Documentation: rust: Add a character to the first column
> >   LoongArch: Enable initial Rust support
> >
> >  Documentation/rust/arch-support.rst | 13 +++++++------
> >  arch/loongarch/Kconfig              |  1 +
> >  arch/loongarch/Makefile             |  3 +++
> >  scripts/generate_rust_target.rs     | 10 ++++++++++
> >  4 files changed, 21 insertions(+), 6 deletions(-)
> >
> > --
> > 2.43.0
> >
>

