Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F7C32FA12
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846456; cv=none; b=SqjZiqMclE2DTnCBBt/vn2ilOneiKT4ODX/izOgcp1H/YO0eaVF5oD8s2u96b99TQlKc68VxQhQUn3L59ikxL8mW9l5cOb+gCSmoLTJbRgE7yyj4hvLZUW4Eg7IadoyXx/6MOG4HDr3ZOU5Z8GmMWQBVNUK1hWS8qD89h0DZtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846456; c=relaxed/simple;
	bh=bj95vgAZVPhJ5iLFRK0Wh3k7CRZDgw7L+i/67I9oJrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBBU+pEQigSmK7GdQIvj3DSnsXFoomge7+Uz+wA+QZziO3DbXS9mZ5wSYFdy7ZbP/l95ln2d02lCk2FjmP1fEqKHOV//aVlpj/3aqT7Wrfds1i3270NBrTYpBfjzFqQFggROLvIg0SagosxIzCZBR7Yjr4pmvsSoc1Kbh/FLJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwNnzwDk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwNnzwDk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee598d00fso3221585e9.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 10:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768846453; x=1769451253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSQyY/sbw+WW+mdZ495+fmp7dM6Z9X4lGB7EkpPTED8=;
        b=HwNnzwDkIj3hPklIWuYFVVJyk2Vp7mhydZREI63mpM4e4r9c0NFfxILelhO6FqBEpK
         EMfqowKx/BjmmLrjLpYo3HaDO2WgUQtL+s30BjHZHP2TfXBZQ1eogimycmTb3tdIWsUn
         Sc69Jlryb7VyohSgjZjltdnUAmo7bVhc0qfoqwhhff8O/jtEVTm0QEfi49tVumpDFkUj
         RyYO784LB/L9CO9+XWFjhOXHhOi+WzsicYKuDXqmQ/sdugpmhkKjsXA00sVOwffkh+Zr
         uFJQY58JfvuQtqTqWXxs3ZQeycVJ0E1K4kq73r4XOQMASveza1sr1VFWjczWA590mJHU
         avmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768846453; x=1769451253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSQyY/sbw+WW+mdZ495+fmp7dM6Z9X4lGB7EkpPTED8=;
        b=BiBmGai4YTjXbbsTJudH38Zvz0AbdKPxOKacmz44AKXEX7GuxT8adt3+DHmodc3I4u
         yXLKqTYCcguoHdjmeRiEW33z8SMgZv9QDcdl3uXH2nIkhqNjgdi/t6kOaFNiCOd0pGV2
         o0UOwII1bCvUPoOyu0hA2eLK7LRUk5md7KtSFq5d3s4of5vrr7B2qrma57MXBvKENzgw
         O5QhoGl5KoZ/ovrrtwENbraom6uGu5OsOmXceuaRJTiTKALEXWTv9gDZxChnk47Oj7d0
         DJWngd7uVOI0sJQYzI+OB983cXb7cM8nk5+VbQiiZBq+Ca90WRUcFR2mTQ02l8Ljl9GC
         ejmw==
X-Forwarded-Encrypted: i=1; AJvYcCVkz3cU0Ahz+fdhFjvChCwQhGTa9AqUmOzb/YCHumdGL9VEpqt8x5A2fdU+Y9wjYI+ZrnaqxZh60Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+sZEFjnmZKm0jabMT3yaA2TttlaMPkLddFJ0G2XlqZjKTAAOg
	GLcOpOe3PAFS+2Z1rVNw+sLBJQnA2hdfgPjxZPdgQDWFO6Hy3MgXbKhgDLcmyw==
X-Gm-Gg: AY/fxX6BiCBXDm/aXQpGaDbhKUzA/KwxQvGnr1DBEvUi8zYrOK89N5ELWWjeMu/Xw4F
	VoPOa5jNGbTsNuGo+Nk0YNxQ6E3JdvF57Mkji9KiqEBuLgXXXJQJZf0bja3N4hBfZxEqgF7sMI7
	8F6GPkptqNhQZQkzUWW78dYJpJ2JpU2Ok0PHNDuf61Z7+Lb4z7npu8vy4lsvFRCIilihScd/Lxr
	eYZSe3aLZOi8G6SoLB+py9XB2s8YGyBP22JRg07+47IKlAuZEQA1ofVIzBtjoFcnbhj7wE9CWom
	sg7V9/XdUv2BoGYWilikJl9vkLPhXVS+RETVZ/ii7SLzBJlk0fNZQyo3tVJvYkWGtPOXD+Gqxtg
	mPyE2lNuONhFg4c8SYUA5/nMZlDMr6dFJTKtHIFv4IiBrFOkx7KogbsnbuZLBdhWuTycUaEtjAN
	fbGx6x90soywx64Qo5uaCywSyY52vv
X-Received: by 2002:a05:6512:340e:b0:59d:c490:3ab9 with SMTP id 2adb3069b0e04-59dc4903b42mr330960e87.0.1768840488602;
        Mon, 19 Jan 2026 08:34:48 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a6ff6sm3432421e87.102.2026.01.19.08.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:34:47 -0800 (PST)
Message-ID: <e273571e-ab8f-46d6-a44e-c1d0d06d3cbf@gmail.com>
Date: Mon, 19 Jan 2026 17:33:35 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, corbet@lwn.net,
 morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com,
 ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com,
 maciej.wieczor-retman@intel.com, maz@kernel.org, catalin.marinas@arm.com,
 yeoreum.yun@arm.com, will@kernel.org, jackmanb@google.com,
 samuel.holland@sifive.com, glider@google.com, osandov@fb.com,
 nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org,
 akpm@linux-foundation.org, Liam.Howlett@oracle.com, kees@kernel.org,
 jan.kiszka@siemens.com, thomas.lendacky@amd.com, jeremy.linton@arm.com,
 dvyukov@google.com, axelrasmussen@google.com, leitao@debian.org,
 bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com,
 urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com,
 andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org,
 vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com,
 samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com,
 surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
 yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com,
 kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org,
 bp@alien8.de, ardb@kernel.org, justinstitt@google.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, x86@kernel.org
References: <cover.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/12/26 6:26 PM, Maciej Wieczor-Retman wrote:

> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86.
> 


It appears that GCC nominally supports this, but in practice it does not work.
Here is a minimal reproducer: https://godbolt.org/z/s85e11T5r

As far as I understand, calling a function through a tagged pointer is not
supported by the hardware, so GCC attempts to clear the tag before the call.
This behavior seems to be inherited from the userspace implementation of HWASan (-fsanitize=hwaddress).

I have filed a GCC bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=123696

For the kernel, we probably do not want this masking at all, as effectively 99.9–100%
of function pointer calls are expected to be untagged anyway.

Clang does not appear to do this, not even for userspace.
