Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D679F2
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 04:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864874; cv=none; b=NJv7NY3hx/98eWA2/3Mb5JUFw3TuJIOs90ecMHPe8xhk/Y1B0riPiJQymfhr9lzEDM48TZznepemmaBE2WFdniayTDtiWVQlfFuODSjbwrHSD/oD/A5eR4jabpaaRGQd23bglqwqxJhTtynMkTDxsD738a1o/Ap+mub0GEojdIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864874; c=relaxed/simple;
	bh=SPeJW8O/RdyKgGzZdcpOtGY1BN9HvfKy7ydyqtr/PlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRcbV8UBclPGDr+toIeq3O7WjrBpt1AruaYH97dcRM3AncK0Kt4r3roaRwvbCD9Z237mL8PntXm7nDXTfQh7pxl5usG4NIRr2Sr1Pa+t3SetZiJpNz/rcIFSKP9GHX+h/FmSfxbFarXZUPvji2Zv/SS8oV3ZaFrj+CoxCyj3KQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wc9NaWYy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wc9NaWYy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso232892a91.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 21:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744864872; x=1745469672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StTtcZEL8yuxE8J2mkGpzTNue0dDQ/MJGGswTzHY9b8=;
        b=Wc9NaWYydXVPhnfu4GiffbN/Qhn7zlGN4oeKKFZ3Wgm/Ep0W5+Nnsobc7nTwUZC4y+
         nsM6WpK1u7kP37SHWpZhje2qBLaq/kXOGctU692HUeA6efi3r7pKA4Eh5x9yZ796GVQH
         eD294EUGl4F/zSqzhntB/oqG6sbL6i9cb3MGFQ6b9zHYFHhRuMoEz0FIAib1gOlyIqKo
         1qBi6apBOA+UEZEMzq+14uzW6dhk0TIQd/gYTJe4YSE5cpSArKByQ63/CJpdoimnLtED
         5aHFFIj5JlxYRrsQBKPDAstYVR4/SZ5G+0J8cwo2pVIEppc0hZ4eA2DRHkhThWrrVm1L
         G5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864872; x=1745469672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StTtcZEL8yuxE8J2mkGpzTNue0dDQ/MJGGswTzHY9b8=;
        b=RlSugwRCj2PeVR2SKwv8hKPhQ4n/m/YqHp7lCniFxTgQKp00A22sSJddHFQEq0KzAq
         3Sc7WDubMfiTrC7NZ+MqLwMpkezAXcvLwXTudT5CA9nr/Yh34YQR7tqX3wlbqHeiiT8n
         hMm6TF2ZkIpdOJ4fmvUIxZG9+pIwi2VJ045ycZBjdwuS/kTq55twBBSAg+9Awil3QETc
         ar4vH9q2YlUjM7CbDTp+Vn0ieHb6SqrCvp72JQDeQ5GxM2aEVyiYm5H/Xa7QA391w51S
         u31x6r1GBgOVFlA7gDYNljyWeS7UAolgvuIzfku8bomvuc6kY/zd86MGARZT+khziZau
         0uag==
X-Forwarded-Encrypted: i=1; AJvYcCVzwrJ5EU3NPE9Q7RGS6ap67UwPG6TzItkAlPgPwENBfB52y5IlGnI2hNBEe1WJSe4Wk8ZoC3A6AAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLBdN2qUHFpLylpA++WDFzeN0Q9A2aJiAH849mI2L6T2xreTt
	giHSKN6Emtyi9JOdtr4YQCiG51NiQ/6nchsXUjzDAIf6emyEd3rntRSl6lBqQEk=
X-Gm-Gg: ASbGncssZ3He7zlhDeDtMtv6zucVAKzlkfuxx7q2a/bN8jNCFgzvV7JbGnF4vcy0QDP
	JwERc+JPo3a/GdPUGbWJn2zVwUq0KKX9QlzJee1q86HE20aRnxllj3tGMI1grBms+fAj1R+mY6x
	rwK641yplxhDe8s7OKoVv5YljFhtOA66fyDUZuvo4kihW0bJgPOTm0HWGHBJSOyl5WlUmmqymAN
	GtNVpxHQXbuEv1fXgkACXts44nYC8seBUeNMvyO6b9RmRF9xMVKVNAYjxVKBPPEmRD/pFYlxymx
	tVYpnrPDM+vAbtN8oG1KUDRHOg0+ViRs9WfB5t0QcA==
X-Google-Smtp-Source: AGHT+IHSwNZXRlBErUquc9s/KXGJ/tJ0ZSJY//U3+xrEDFrzroEcRYfbd88YerCo8sKgIpeIi1M9yQ==
X-Received: by 2002:a17:90b:5864:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-30863f198c7mr8175815a91.12.1744864872142;
        Wed, 16 Apr 2025 21:41:12 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb765sm2573852a91.43.2025.04.16.21.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 21:41:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:11:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
Message-ID: <20250417044109.3enslespfaifjw7o@vireshk-i7>
References: <20250416112454.2503872-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>

On 16-04-25, 13:24, Miguel Ojeda wrote:
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
> 
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
> 
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.

                                            changes ?

> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
> 
> Thus document this explicitly.

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
