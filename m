Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CxVHFMRl"
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D6DD6
	for <linux-doc@vger.kernel.org>; Sun, 10 Dec 2023 22:47:45 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5ca119bb5ceso137846a12.1
        for <linux-doc@vger.kernel.org>; Sun, 10 Dec 2023 22:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702277265; x=1702882065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a48U/31wlYhKh2YcSR/tePNphggIU3CwJSH0jG+cw8E=;
        b=CxVHFMRlgB3caYI7f54djRbSS7nlsRY6EH1bJoZAmmP8x+HFbdwt4X4taiBgdo4W+S
         iDrPms4bPKIRQZbgu6KMNkbeu9iysadMyAkMKSKAwtWZjoCdAxuZMHKvJ02cDpexvipD
         KLf0klhrHjNTZLoXKRMDFDR9iC2geVo9PxNw4+G+/XA4kLnhBnoMv79OaM6ms+yEesXU
         1Q7hXLprADmXs4IrKGCwIqCPCMYP2lYya08Z/yIfv030QXKnM8bDQ8WxI2xZxBUM48nC
         5TGJfuvZdLNifk5Yl8s41zm2Ef03E5ID+l6U9kY71+v/ihiUJ4aCPNu7/1IkF/MBCG0F
         fx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702277265; x=1702882065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a48U/31wlYhKh2YcSR/tePNphggIU3CwJSH0jG+cw8E=;
        b=OtM3jWRcQkLXUuPHkSadayQcu6S1BBInuS7IxuP6KpoqHcSRvdrzT2dP0L+UHb3gru
         g1DNUuzpjG/eiXML25xZSTOvrDrxR5Zldq4Po3e+t9AI1M3bqE7lujy6lmYYuluufNVS
         1AHz8/tC9Nu0XM8l6eXuS5trLPn5aPBD0g9tPzQsXDrirGUkERdPqVg956dazNOpDOL3
         map1jJeX7huk8S5ZXpus3LM2lTYQKa89LNCqdVpEGuoCR/hCkTNKLiulNa+g76LnDm2E
         wJDWLGXJwLKoAGC63HDDLVCY30K70Nlw7qBWokfwJ7yizgm+7hRVn/qc6Scl1Uztxfo6
         nZUg==
X-Gm-Message-State: AOJu0YzwRRBXyPzbwGJytu7nhcXwZTLrQFnu7u7kKWBArSo8OLYBvN7z
	zo6bj7TWzxOyBIW54V9EZ9THUQ==
X-Google-Smtp-Source: AGHT+IH1sraA/ewghKmWcDdZXIY/GSc4x1aDBpmQSc9Y28rj/4GaXYs1TwdtDbpoGr+jWN9S49K08w==
X-Received: by 2002:a05:6a20:431c:b0:18f:97c:ba03 with SMTP id h28-20020a056a20431c00b0018f097cba03mr1769416pzk.93.1702277265442;
        Sun, 10 Dec 2023 22:47:45 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id pt8-20020a17090b3d0800b002839679c23dsm6161953pjb.13.2023.12.10.22.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 22:47:44 -0800 (PST)
Date: Mon, 11 Dec 2023 12:17:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <benno.lossin@proton.me>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: rust: Clarify that 'rustup override' applies to
 build directory
Message-ID: <20231211064742.63l4cmvxe4uso5us@vireshk-i7>
References: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org>
 <4738ad1c-eb54-4ad6-98c8-3852de3e8fc3@proton.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4738ad1c-eb54-4ad6-98c8-3852de3e8fc3@proton.me>
X-Spam-Level: *

On 08-12-23, 18:04, Benno Lossin wrote:
> Shouldn't this be "Note that the override only applies to the current
> working directory (and its sub-directories)."?
> I think it would also be useful to continue with this: "But in order
> to build the kernel, this override must affect the build directory.".
> 
> And then you could also mention that in the default location for the
> build directory is in the repository.

Based on feedback from Miguel and Benno, how about this instead ?

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index f382914f4191..dee787f92d26 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -33,14 +33,17 @@ A particular version of the Rust compiler is required. Newer versions may or
 may not work because, for the moment, the kernel depends on some unstable
 Rust features.

-If ``rustup`` is being used, enter the checked out source code directory
-and run::
+If ``rustup`` is being used, enter the kernel build directory and run::

        rustup override set $(scripts/min-tool-version.sh rustc)

 This will configure your working directory to use the correct version of
-``rustc`` without affecting your default toolchain. If you are not using
-``rustup``, fetch a standalone installer from:
+``rustc`` without affecting your default toolchain.
+
+Note that the override applies to the current working directory (and its
+sub-directories).
+
+If you are not using ``rustup``, fetch a standalone installer from:

        https://forge.rust-lang.org/infra/other-installation-methods.html#standalone

-- 
viresh
