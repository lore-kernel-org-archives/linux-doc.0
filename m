Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC44205AB7
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355539; cv=none; b=DqBg+KipCovOVGcug6EdezU35VOE7XpX7UMN/0h+L6jnt2jhEKRzwi/TpUK1OTaKxBXAOyi5RSS/TVr8kbiJm0PKpfUiEZUXUnpyEDWcle/DtR9ql98DoBZO5jHtAMgcXmfl1T3R855eoleemEaU5o1WFGiSjfPWIOK09zxtp8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355539; c=relaxed/simple;
	bh=NndeOH6sd65ORicRkF+Jky+H97Q2/FBkQEok6InkZT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ2spYz6mRepW8WzpF08VO5Oe9gS8D3vOgFTI8biaV+cuz1LGyqB6WQ0G8ygpnwbvBMaS1QXqOSrC5QpWENCl4ozl74okxA2oHV38FDZS3aoh9+RJwy78SbfXtVS5gZLc0+ObAeC5RI2BYcYpATBlWLfVEzwmO8ikg7B2R7LNuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EUpcv9Jh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EUpcv9Jh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso3941978f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734355536; x=1734960336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=EUpcv9JhDG+2+g4LGiJBH1hjfimm5Q0kzVNJbo3NAy1yLnwroXqbQ0NS/QZp5EYQVV
         /5ImGO+ypVik5s8CR5Vcas9g9zsw8KiGgkktNCkfbrVT30JlWJRm9JScQfidsojKDP6F
         LyqMVkm8eXmX87BJzpX5OFKwwtXff544hFQJS57sNf3lS6PQqdZwViSyNgKWRHDwq0ZR
         MLC0oapa2oLutHV2lmPGbmwHMklOpIvP2sXkAK1dLPzoPodLhxemY1HBI/g7W0KhqPCM
         HAJtOW1vcBxejpgdrTVniY212gDzGYMNv5gNiB1JYwHGtNVuSIMr1GVxc/Gvq8XdaJiP
         /rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355536; x=1734960336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=euRymNwmSkmOMSrdJkrrwhXCCWiC2/SS/+2aAXMyjSbg+ARfoPi2i+2zeRULlOSfea
         ye0Y+Ei9F14jKP9sVW+NyDL3PAHBrBq/WY6ecGH1FiB/UGlIF1gGnNgZtaQWqS1T7GxZ
         YnbHQjroHtcWSYGnnOsnTUEfJdFEwmfIIq4SNaWFZg0c5eON7/KhW7uM7i0O+PxyjD7j
         +3A86voxw0JiirK8e5dHKW92MAVc7V5jamu64rkJY5K0qdqzUKaM1RwjpwnqUuhCqvUm
         c0eUnxA+iSibe9+EKwe5nlnMS383tmtBHgllIns0DgGXVYkENoqpe4seKWE6fJpNcUMI
         AqTw==
X-Forwarded-Encrypted: i=1; AJvYcCVOmSIk4TGOHKcQsd7JpzlSut6+dA6g1p9ELDpfk4tfbCRlxUIume4UqRcV9q4H2W2L2P3gRweuc3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFW3Swk/XimGMwrZatcnyMPx73QP5osHH1tLPcrbTFswM0yCl
	AmX+oU/o2IW2hbKJavJ7DPd9YehSDPaRcJK0jmGlQF1dVjsAsJx9dVVB36vMxGc=
X-Gm-Gg: ASbGncsaJZW0+ydRD5O8NBrWemCLGdsaVxG1A7ZhGnost1w8XDDYGwsMlmr8o89UXZX
	nm1mt8vw0FLkisn+BdH2TcUIBRP5UZjPVafVtEuT5oorTQZc96CxkMM1TutDW98To67nhBKZks5
	9u7HkkZoS65f6WHOdt+8hzncdZvZ42IbSKY1jtNCpbBKSCu5NwbFrxkwycbNU3UEd7hWTJIEFGx
	h8yiakc3t/y2Y/OKoRE31LJCgP+6F+mgkw35wutW2CpoX0rp3pyK9Kp0Tqk
X-Google-Smtp-Source: AGHT+IGqoSYH/VA6fKloW87cFzqLGeD30iZmGbWZZas/HuP1gKITI6KUoUpWyXXkXirFAcpa9znGog==
X-Received: by 2002:adf:eec3:0:b0:388:c75d:be97 with SMTP id ffacd0b85a97d-388c75dbeaamr7310161f8f.11.1734355535593;
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804a34fsm8253045f8f.76.2024.12.16.05.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Message-ID: <e522ec59-6ee6-4c11-8a4f-91a683e6435c@suse.com>
Date: Mon, 16 Dec 2024 14:25:33 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] Documentation/kbuild: Document storage of symbol
 information
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/24 03:42, Matthew Maurer wrote:
> Document where exported and imported symbols are kept, format options,
> and limitations.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  Documentation/kbuild/modules.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..c32e3ed67cd26070f6929f6ad98c4308a1ab71f8 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
>  	1) It lists all exported symbols from vmlinux and all modules.
>  	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
>  
> +Version Information Formats
> +---------------------------
> +
> +	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
> +	sections. Symbol names and namespaces are stored in __kstrtab and
> +	__kstrtabns respectively, using a format similar to the string table
> +	used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs corresponding
> +	to exported symbols will be added to the __kcrctab or __kcrctab_gpl.

The second sentence should be that symbol names and namespaces of
exported symbols are both stored in the __ksymtab_strings section.

> +
> +	If CONFIG_BASIC_MODVERSIONS is enabled (default with
> +	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
> +	CRC stored in the __versions section of the importing module. This
> +	mode only supports symbols of length up to 64 bytes.
> +
> +	If CONFIG_EXTENDED_MODVERSIONS is enabled (required to enable both
> +	CONFIG_MODVERSIONS and CONFIG_RUST at the same time), imported symbols
> +	will have their symbol name recorded in the __version_ext_names
> +	section as a series of concatenated, null-terminated strings. CRCs for
> +	these symbols will be recorded in the __version_ext_crcs section.
> +
>  Symbols and External Modules
>  ----------------------------
>  
> 

-- 
Thanks,
Petr
