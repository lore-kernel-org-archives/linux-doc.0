Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6281723D7E3
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764977359; cv=none; b=hPQZnG71fOfDuIFa9nT+37It+GoDbuGlysmXPZx2qZLqHZ2QQhggsexUAJEG5W4aJuYWhYZZZb45+7EjgxEzE3jNEAfU6N4Cjc/bU03vPmRMj3IyJ5neRajKsgIO1bJ+bTWoTEhiq5By6EtE0dajqonOU5S1I/v7dplD1F7xI/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764977359; c=relaxed/simple;
	bh=m859Pz85Fe3NafYsTdo+q5V0iu/zXgcB/nZgW0VxOeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leMM4proTekKiaBi0YS/rJ9bui4Q5eVpIm7mtsa02vDcCcy47pXAojOKflTHwmY7cvQ6kzk7DrXVJCPgSUGvzRFJLiyDJ78cXq2PBKR+Ql3hjx6P7fPsKoVIcrtw0d8csAnQ5KS8JUH9LFX48rvVXypXt1Hxd25fw/oadqtoSKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=BH205gXZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="BH205gXZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so2984824b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 15:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764977357; x=1765582157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m859Pz85Fe3NafYsTdo+q5V0iu/zXgcB/nZgW0VxOeI=;
        b=BH205gXZYJ5a0fn8CWHNqlDnZYH3sOYrd0JGKZQfaknmTs2AXYO68EsIaYIHLj38Ia
         /jSLtXTsSqSES39s7WRNzd8XlHdlWlpz3QdgfPIDCI2dGIsb8T1rCiSbdAjp2wCJWY4r
         sbpJ1DG29iDLWe9wBWVAEzjDfrlpmae2g4jf+zaeJO7jY/bAZBLEJcyYtowiZSbovGhA
         QH31lsWZLEW5gMgMNZGDC3fFCU4H/ioziPF7RjEZ6crCmfVK3g3SImH3Rv/PQ3RtUg+3
         RqOgiy78eW/7GCbAo8dW/2ODfUE9L7H4gSdaG6GY/3tKsI5BAx2hSbnuIzA5u+ymd9+w
         Zzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764977357; x=1765582157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m859Pz85Fe3NafYsTdo+q5V0iu/zXgcB/nZgW0VxOeI=;
        b=mGExTD9zr8eE/Zu16sPxh1G3arskEl/Fg0BeV+m98CVFb0ADwXyWRUsAnQUy0nSTrH
         rbiDTbWB4Gi7KNdQMgQHFAyo8z9aP6om5Pqb0jCJGl96ROoK6HDdnnlTrl4x3eiIskZe
         oaXyWiSkW1UYRijrr1YTQHamPvWgl0HTi5nA/JNExhfv60zWvxyxy6m/I0vjl+C6SONd
         sL4G+m79XkRPgKiGDWclpNp9jFrK7ZnZmzeNKWk+Ethw5e5si5kp3KowrSD/zfIetEXV
         rh5nUUbZybns07rVN02a9aoe6m7OEcbj7duP7NpJRLvt6uF57TntwPZ2XEKZJ4/dTidE
         3lBw==
X-Forwarded-Encrypted: i=1; AJvYcCVsrXUmFI9BuqhIlGXcq7y2inbW5wvFJ3B+ivPgDHJFyDmjJgxN1MHhnODhdaFn3/b8l1HoijCB6bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqCrDdfwCcIVQ9R1EL0EOLqFqn88qij81t0FirwcDVtHOFz+B
	0QQfup5dacvZOYNPqsyTixJFSf3H89w5IrtX7ftkNGcO4pFnkKV1SBU3xRZL2sdT5D/18Imj4DW
	fTjwi
X-Gm-Gg: ASbGncuLNnF1T1+nHVWMTIHeTONFKDZnS6jumwRga2cpPaoPAMRrqqn/k37Skzhq9y7
	1RaeRfQVTKEnZsDSgylYKfaEW56EaAfEOd6vhSv0/vT5GCcvOaOBz0EyX49mvERqiEfTcTqZvpJ
	CJd7zg08u2dtqndVghRhfqGll0W3GedEEHRsvvOHuLlJBvC8dH0lFEqrJ23WO6MB3s36cv2oowq
	HvvJzTZaDy+TK7cSVpwXgGXzLGeqDXhCvLG0EZxSP39b0iwt4i59TaYiB1FPw9AHIbaHrm0SZEz
	/H2ojJvANA/OiVsZzsGeWkg3b0/6oUDxECp9CKNg/bWOoW9Py953EwKxwIMS2jrZkpgyyfypslL
	WvitbGdCdLnO/fZMniSoTYrA4mNqPlnpzdk+96ncmcwbrmDQ2IC3Rhezah8+kN02js5J0hn/rgq
	2yljrvg81OPEWGGNgpDvllSyevKApQhZU=
X-Google-Smtp-Source: AGHT+IG0PS99KFFmyGmoZ4EZkx7PjzgoWxSynADwEB0PMGoZ1tOJUc0gMelNMUgjpR2OcW1nhmhbdw==
X-Received: by 2002:a05:7022:24a4:b0:119:e569:fb9b with SMTP id a92af1059eb24-11e031662c8mr594295c88.10.1764977356505;
        Fri, 05 Dec 2025 15:29:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76ff44asm23779652c88.9.2025.12.05.15.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 15:29:15 -0800 (PST)
Date: Fri, 5 Dec 2025 15:29:13 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>,
	Paul Walmsley <pjw@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH v25 00/28] riscv control-flow integrity for usermode
Message-ID: <aTNqyVVGy9_XjFGt@debug.ba.rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-1a07c0127361@rivosinc.com>
 <d45808b5-44c3-42c6-a54c-3a13606ee39d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d45808b5-44c3-42c6-a54c-3a13606ee39d@kernel.org>

On Fri, Dec 05, 2025 at 08:32:32PM +0100, Krzysztof Kozlowski wrote:
>On 05/12/2025 19:41, Deepak Gupta via B4 Relay wrote:
>> v25: Removal of `riscv_nousercfi` from `cpufeature.c` and instead placing
>> it as extern in `usercfi.h` was leading to build error whene cfi config
>> is not selected. Placed `riscv_nousercfi` outside cfi config ifdef block
>> in `usercfi.h`
>
>
>Please stop. You sent this 28-patch-bomb TWICE to 50 or 60 addresses.
>It's actually merge window so it should wait in the first place, but for
>sure sending it multiple times does not help. Please observe the Linux
>development process.

Sorry about that. I'll be careful next time.

>
>Best regards,
>Krzysztof
