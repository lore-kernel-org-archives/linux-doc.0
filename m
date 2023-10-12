Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE10249F2
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMlfZNUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B74BC433C7;
	Thu, 12 Oct 2023 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697111463;
	bh=4Y7rKxiCW01/9GQcbtlTps0JwLRbYTYOda2S200SdyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CMlfZNUFFNjNNGnSL4zV2wmeRzpu1PDENqmw8/a5GL9RGEkHwBPZPjxI3lSAWHaqr
	 v1Jn6MD0CvycLDWeJtP747k6A25vufz653mr9ZEgww2siCTlcS2k+avMPi2/2xIAt5
	 B+xbjoZ3qkHOeCSrRQldqOR9rsQ4vBJN2+U7INmyqFZ7jdUrPQpSVVjr8Mvq76eyKH
	 p+ElPXV/Gkp0LPqoQXZ61Y8ktFZqMdDrW0UC/HtT+4Uq0Ijao0AdLaLLAUKnlMN2hv
	 DOqVa2IPVuBEXN1HY89YlwmvdR7HH4ZOhP1pzAsTIhTURMuY/380oQDjNDfbirzLNn
	 KlgAf+2nb681A==
From: Miguel Ojeda <ojeda@kernel.org>
To: dan.j.williams@intel.com
Cc: corbet@lwn.net,
	gregkh@linuxfoundation.org,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	max.kellermann@ionos.com,
	workflows@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: RE: [PATCH v3] Documentation/process/coding-style.rst: space around const
Date: Thu, 12 Oct 2023 13:50:39 +0200
Message-ID: <20231012115039.1680561-1-ojeda@kernel.org>
In-Reply-To: <65271731e25f4_7258329472@dwillia2-xfh.jf.intel.com.notmuch>
References: <65271731e25f4_7258329472@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Oct 2023 14:44:17 -0700, Dan Williams wrote:
>
> I notice that clang-format reflows that example to:
>
>     const void *a;
>     void *const b;
>     void **const c;
>     void *const *const d;
>     int strcmp(const char *a, const char *b);
>
> ...but someone more clang-format savvy than me would need to propose the
> changes to the kernel's .clang-format template to match the style
> suggestion.

I think we could use:

    diff --git a/.clang-format b/.clang-format
    index 0bbb1991defe..9eeb511c0814 100644
    --- a/.clang-format
    +++ b/.clang-format
    @@ -671,6 +671,7 @@ SortIncludes: false
     SortUsingDeclarations: false
     SpaceAfterCStyleCast: false
     SpaceAfterTemplateKeyword: true
    +SpaceAroundPointerQualifiers: Both
     SpaceBeforeAssignmentOperators: true
     SpaceBeforeCtorInitializerColon: true
     SpaceBeforeInheritanceColon: true

At least that makes it match the documentation example -- I got this:

    const void *a;
    void * const b;
    void ** const c;
    void * const * const d;
    int strcmp(const char *a, const char *b);

But it is only supported in version >= 12, so we need to wait for the
minimum LLVM version bump.

(Thanks for the ping, Joe!)

Cheers,
Miguel
