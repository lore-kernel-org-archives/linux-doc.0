Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E421A0A
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J1/ecE9y"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415B095
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 12:22:43 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5045cb9c091so3168063e87.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1697224961; x=1697829761; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMlHIs+RXRwcCam9b7W7YcpdMJXw0XO1+U1rinkBh7Y=;
        b=J1/ecE9yrtRPZTboE8htd7Ca/ineFvcB6mGCRFLZAxCNZcRm3SapTB204qJ9tlEIPx
         smT/+VFV/De/jpapaRXjA0/hJnCaVbe7/AP9WRVgnDixBSHEmOCQa1Oo467C8nIBSTKs
         JSQmHj797cOAmkkTfUqV+DePX44RNjTQaN3Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697224961; x=1697829761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMlHIs+RXRwcCam9b7W7YcpdMJXw0XO1+U1rinkBh7Y=;
        b=gt8s9Ip9HTIigdgy6+wc9j4e4r3fE2Y1Pkx7SdyblOJ2k9IgmtK9lYvaYs23YbYAQ0
         zdsM8k+KoM5JAVRAUIyxt4uJy57R3gOFRypzl/zyfI7OiuVV6XOdxRzX337MSvaJh2jX
         sdBJeHdTUXeGeTUvI09cwCbqXOF7OAfoPbhEA/ha5NO460HuDu+/7jror6rruYHO2s99
         MGAB7mk+28nJTmz3EykFGIAdGyr/3aQDhI+cvxFePizeTcNBb0JdxrwwDlWF291Z0lVl
         CIi7Gs3oJJTDzrpH+JfckaPQY9Ik3XPmxrx9koMvXX2DdjjLAGE5jMgzrmKytQnJ/Ffl
         o3ng==
X-Gm-Message-State: AOJu0Yxabx+mZ/IF4qe15RgrxlKsfKHkbz7Nh8pdmbcSpIjRaHauKmjo
	Jyvxxv23f+aXqS+Avf0DmINwi/YMPbZMUez4Ynv8Us+G
X-Google-Smtp-Source: AGHT+IFXA4mr+tLU8WiqSSqCJME5b1bfnmg5I2GBpJDkthlgTvX4cyOlpukQ7Kt0o6umcc0Hh9wzhw==
X-Received: by 2002:a19:a414:0:b0:502:a55b:c2d7 with SMTP id q20-20020a19a414000000b00502a55bc2d7mr23528533lfc.60.1697224961070;
        Fri, 13 Oct 2023 12:22:41 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id k15-20020a0565123d8f00b00500b561285bsm3364310lfv.292.2023.10.13.12.22.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 12:22:40 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50797cf5b69so1626098e87.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 12:22:40 -0700 (PDT)
X-Received: by 2002:a17:907:7790:b0:9b9:facb:d950 with SMTP id
 ky16-20020a170907779000b009b9facbd950mr17575861ejc.72.1697224939431; Fri, 13
 Oct 2023 12:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220927131518.30000-1-ojeda@kernel.org> <20220927131518.30000-26-ojeda@kernel.org>
 <Y0BfN1BdVCWssvEu@hirez.programming.kicks-ass.net> <CABCJKuenkHXtbWOLZ0_isGewxd19qkM7OcLeE2NzM6dSkXS4mQ@mail.gmail.com>
 <CANiq72k6s4=0E_AHv7FPsCQhkyxf7c-b+wUtzfjf+Spehe9Fmg@mail.gmail.com>
 <CABCJKuca0fOAs=E6LeHJiT2LOXEoPvLVKztA=u+ARcw=tbT=tw@mail.gmail.com>
 <20231012104741.GN6307@noisy.programming.kicks-ass.net> <CABCJKufEagwJ=TQnmVSK07RDjsPUt=3JGtwnK9ASmFqb7Vx8JQ@mail.gmail.com>
 <202310121130.256F581823@keescook> <CAOcBZOTed1a1yOimdUN9yuuysZ1h6VXa57+5fLAE99SZxCwBMQ@mail.gmail.com>
 <20231013075005.GB12118@noisy.programming.kicks-ass.net> <CAOcBZOTP_vQuFaqREqy-hkG69aBvJ+xrhEQi_EFKvtsNjne1dw@mail.gmail.com>
 <CAHk-=wjLUit_gae7anFNz4sV0o2Uc=TD_9P8sYeqMSeW_UG2Rg@mail.gmail.com> <5D8CA5EF-F5B0-4911-85B8-A363D9344FA7@zytor.com>
In-Reply-To: <5D8CA5EF-F5B0-4911-85B8-A363D9344FA7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Oct 2023 12:22:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiiBpw-0MKBbPkvo54=Cvyi0b3_1bDtqbgiD4ixd+OPow@mail.gmail.com>
Message-ID: <CAHk-=wiiBpw-0MKBbPkvo54=Cvyi0b3_1bDtqbgiD4ixd+OPow@mail.gmail.com>
Subject: Re: [PATCH v10 25/27] x86: enable initial Rust support
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ramon de C Valle <rcvalle@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	patches@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	David Gow <davidgow@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 13 Oct 2023 at 12:01, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Transparent unions have been standard C since C99.

Ahh, I didn't realize they made it into the standard.

In gcc, they've been usable for a lot longer (ie --std=gnu89 certainly
is happy with them), but the kernel never really picked up on them.

I think they've mainly been used by glibc for a couple of functions
that can take a couple of different types without complaining.

           Linus
