Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XEycvlSL"
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2860D5B
	for <linux-doc@vger.kernel.org>; Wed,  6 Dec 2023 14:58:24 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5c68da9d639so206339a12.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Dec 2023 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701903504; x=1702508304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rlRwxrjO/fwpJbdnxlIZRwQlN6+I20Mp4XVwBmKHsZs=;
        b=XEycvlSLVhHjwQQEo0A3dAfC92LbsY7kCx9Yy2e90+kQlFXZ1JjVu7inbpKPDiwit0
         +MBeV+wBPzjfsV25hGxHD4lLfFb5nd6uWvebbMmUDwFvTs0HgeybJTL/L5bfGF2wkYdn
         Fm00IYR7WcyXKpm9C8iLzqq9b4RUPFkfN17Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701903504; x=1702508304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlRwxrjO/fwpJbdnxlIZRwQlN6+I20Mp4XVwBmKHsZs=;
        b=hmwhfcRkutUYObhbw000tLI5yy5w0tRKEXPDfMCpi6OPRo+582WhIf69GSUt1kpy8M
         FGls2ZRgJqGevq88mSzUnWB16gYmSZ9oHqTXoPh6crLtQgROoI+2Oa/xtKH9w5INOEDu
         6bTHybC0+KT0hZJsqORAT3qIbB8Bg5AcFapwG6Duju6hvS+HsK6j5GfkQya1XyqgyUsY
         RnUDBOoqdefN5CS+vPujIgAnFRsXATOSMTAXuBOrjF2rt+d3CQS2Q3emH0vAWVVytl2e
         Bo13bvWC3LVASeooMzGmo1Hf4GBmbMzdelh+ksXCl6+or3Dfe245e2qnbhlDEeQQ/ZNY
         sngw==
X-Gm-Message-State: AOJu0YxFEDOEzN7r5hyF++Hb59O48ye10mjXwtJZx8rMDK9H9DyxwTF5
	d16q9Fr/VCiRqQGecNFHwd1uKg==
X-Google-Smtp-Source: AGHT+IF21TEfSUWNryCsppjMZp7UZtzSTndkR8MeQxDsRI0Vo9gwMzOLX3f62R0JkmE2aAtvmNiKUw==
X-Received: by 2002:a05:6a21:6d9d:b0:18a:b5c3:55c1 with SMTP id wl29-20020a056a216d9d00b0018ab5c355c1mr1334523pzb.57.1701903504112;
        Wed, 06 Dec 2023 14:58:24 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t24-20020a17090ad51800b00286d44e0c59sm336823pju.36.2023.12.06.14.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 14:58:23 -0800 (PST)
Date: Wed, 6 Dec 2023 14:58:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Biederman <ebiederm@xmission.com>, linux-mm@kvack.org
Subject: Re: [PATCH v3] ELF: document some de-facto PT_* ABI quirks
Message-ID: <202312061456.2103DA1@keescook>
References: <2acb586c-08a9-42d9-a41e-7986cc1383ea@p183>
 <e262ea00-a027-9073-812e-7e034d75e718@infradead.org>
 <c4233c97-306c-4db8-9667-34fc31ec4aed@p183>
 <87edp7jyu4.fsf@meer.lwn.net>
 <88d3f1bb-f4e0-4c40-9304-3843513a1262@p183>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88d3f1bb-f4e0-4c40-9304-3843513a1262@p183>

*thread necromancy* Question below...

On Sat, Apr 15, 2023 at 08:37:29PM +0300, Alexey Dobriyan wrote:
> Turns out rules about PT_INTERP, PT_GNU_STACK and PT_GNU_PROPERTY
> program headers are slightly different.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
> 
> 	v3: move to Documentation/userspace-api/
> 	v2: integrate into documentation build system
> 
>  Documentation/userspace-api/ELF.rst   |   34 ++++++++++++++++++++++++++++++++++
>  Documentation/userspace-api/index.rst |    1 +
>  2 files changed, 35 insertions(+)
> 
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/userspace-api/ELF.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================================
> +Linux-specific ELF idiosyncrasies
> +=================================
> +
> +Definitions
> +===========
> +
> +"First" program header is the one with the smallest offset in the file:
> +e_phoff.
> +
> +"Last" program header is the one with the biggest offset in the file:
> +e_phoff + (e_phnum - 1) * sizeof(Elf_Phdr).
> +
> +PT_INTERP
> +=========
> +
> +First PT_INTERP program header is used to locate the filename of ELF
> +interpreter. Other PT_INTERP headers are ignored (since Linux 2.4.11).
> +
> +PT_GNU_STACK
> +============
> +
> +Last PT_GNU_STACK program header defines userspace stack executability
> +(since Linux 2.6.6). Other PT_GNU_STACK headers are ignored.
> +
> +PT_GNU_PROPERTY
> +===============
> +
> +ELF interpreter's last PT_GNU_PROPERTY program header is used (since
> +Linux 5.8). If interpreter doesn't have one, then the last PT_GNU_PROPERTY
> +program header of an executable is used. Other PT_GNU_PROPERTY headers
> +are ignored.

Should we perhaps solve some of these in some way? What would folks
prefer the behaviors be? (I like to have things been "as expected", but
it's not very obvious here for redundant headers...)

-- 
Kees Cook
