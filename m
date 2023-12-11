Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6xf+iJQ"
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0884E5
	for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 00:23:45 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2866fe08b32so2879872a91.2
        for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702283025; x=1702887825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9SGMAohI1bI080siIkPTaq7KnlqYCY8ucsxsXTXtBIQ=;
        b=r6xf+iJQQBao2+2QuLGFBT6ysxoN2/o4W96/K6c0U2FKKuET66to4MpA0wpCSK8fO1
         sOCtPN9DE/xRk/y0FQchypmp229KDq7qF+YBs457x45NLBvQj8oPCp6EgDMhMxfpF21o
         6hnHxbeSSmxRQg7u+kzk5ygd2jbp5DnmztZj1E1Ry63HzVz/IXF5XDjDvBOcT2fEeJks
         nCcOR/qhKyfuE/wkMXSsJzLD3Ds7VT852VEMfbt+dgyVlUdsAlXZv28k5TF2HeauoXVB
         eBOt5Ybt2IIgpIdwAGBWEDfYyJzfN8s6BF4SCzXzYi8JhHofrLmqwuOwzLEPrta8Wrex
         FbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702283025; x=1702887825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SGMAohI1bI080siIkPTaq7KnlqYCY8ucsxsXTXtBIQ=;
        b=WKa0crLnLYXU4tRYB/gLvfNXSNIFnZOwxWrozEkT5tNpLqj/eNZdfoFtOSSOnQ5l0Z
         drPjwW+nSnER5Sn1vgc9wIJUwtA/U8j5I8l+5PdabJ3HkjTYHgMggBel2Gu2vO7nkUVr
         XIuYD5OJ+dFW+A/Xi5oGuVizTjpNck5k8FPZ15OGVimJjKHaOijp4yYjVJ4nhuw02idj
         rz+CM3tjUUZ7T7Ztx8C2WCTbUHAo2ywG15UL6uDf3qahQeauAELT1O/PvIUSE+QWLXJD
         dWuL67OybwMDqdCo466Je/e6x+ogzFKtDME8Rsd88m1rxbUfqT/AHVgjpEB7gYqoXplX
         AFTA==
X-Gm-Message-State: AOJu0YxYNJJ3hmOf9VtKUmfbnUOE5LNuLAVw77LJlPxzAxxrK4Al3Ccm
	QwUd0WZZiD+QgBcqX4UAGALlWA==
X-Google-Smtp-Source: AGHT+IHUybRnAug3nsceifCVm05j+nlMJJ89oCKo2V9GgwS0YbdYklk/h05eKA9tfXjZHnUAxCL7Mw==
X-Received: by 2002:a17:90a:df86:b0:28a:464d:5ecb with SMTP id p6-20020a17090adf8600b0028a464d5ecbmr1681094pjv.36.1702283025392;
        Mon, 11 Dec 2023 00:23:45 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id c11-20020a17090a020b00b00286d75e10e4sm8527933pjc.37.2023.12.11.00.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:23:44 -0800 (PST)
Date: Mon, 11 Dec 2023 13:53:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <benno.lossin@proton.me>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: rust: Clarify that 'rustup override' applies to
 build directory
Message-ID: <20231211082342.dkcnlamsyaqxaylg@vireshk-i7>
References: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org>
 <4738ad1c-eb54-4ad6-98c8-3852de3e8fc3@proton.me>
 <20231211064742.63l4cmvxe4uso5us@vireshk-i7>
 <87h6kpf9am.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6kpf9am.fsf@metaspace.dk>
X-Spam-Level: *

On 11-12-23, 09:09, Andreas Hindborg (Samsung) wrote:
> 
> Thanks for fixing this Viresh!
> 
> Viresh Kumar <viresh.kumar@linaro.org> writes:
> 
> > diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> > index f382914f4191..dee787f92d26 100644
> > --- a/Documentation/rust/quick-start.rst
> > +++ b/Documentation/rust/quick-start.rst
> > @@ -33,14 +33,17 @@ A particular version of the Rust compiler is required. Newer versions may or
> >  may not work because, for the moment, the kernel depends on some unstable
> >  Rust features.
> >
> > -If ``rustup`` is being used, enter the checked out source code directory
> > -and run::
> > +If ``rustup`` is being used, enter the kernel build directory and run::
> >
> >         rustup override set $(scripts/min-tool-version.sh rustc)
> 
> How about just specifying the path here:
> 
>          rustup override set --path=<build-dir> $(scripts/min-tool-version.sh rustc)

Hmm, this sounds good too. In that case the above line can be changed to:

"If ``rustup`` is being used, run::"

Looks okay ?

-- 
viresh
