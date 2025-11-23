Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A861F5EA
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763897308; cv=none; b=e8om1a7Z4ys4CjKsS2PaKj2qcBxpDKSjQqrFSj7fuDesgN0nYFGXLkQ28FztBQ9D7c4CuaYB6ao6UdZPaAo1U9moJyABX43QSchyt53advT6aQTssv1GmmdJyw6H5De5UibiHWYsrr4vpojesrc7TltXTCY2HOSWU3kDA33gs+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763897308; c=relaxed/simple;
	bh=kT57LczMOH07o602knbDM/aHRy0H+ccN//PzLKyZxzo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=TucMruImzZ8NyCT9JG1mRDZRqlGnK1DE7JLwJuGHYBGPx4kTQ0CWat3QnCos345n5GQO00uAYp3Z/c7RrymVzZ/q0+gCLo4mG4Gl9b40xPHRkxq7GDuTfJeB0kC75BbgzsROw1jtWpPhkWE1MAl0agrJEgV/EVvNA3dPJ2WF+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6xdleZw; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6xdleZw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-299d40b0845so56128835ad.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763897306; x=1764502106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61tCAo806dIBQjZwytZtfz6gA3zKHHYqFzMOBDmk6es=;
        b=K6xdleZwCLf3CVslr10e1K8GdK3uqzFed/vJYVeK5YhHDxUqOrTz1CVqq5VYfu6HL6
         PLKyHZHWXHtzbCGqAj/IwOe7CCO+jaePXhumcL/ua9PrN0u0jRzWyWya92xBiOlRNRuR
         +YXzyNJWTB7nQXuZ3UxVrnADe4cmfjdkaxmhhK53klYjDIoLVsWBs50qrKNOq4oiIsm5
         zUiGMonpEP+Wkw1BPXcGU7TuZ3Jr0f3gPBjYnQArTipoG4WiQ9GVTZvxZqcx0rX8U+0j
         YvEZnt//0QWFB5QdphN/86ucJKlPB2IieY1XcRPQLT3zIiDMZ8Rph71pm6U6Lbzqrtg0
         R0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763897306; x=1764502106;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61tCAo806dIBQjZwytZtfz6gA3zKHHYqFzMOBDmk6es=;
        b=KRGC50RgkMo694f+LPrOX9xJckQQZLyKwIBjJKkHI5QiO8oDJT8is+OEFNVfIDr3XO
         qfaLS66Dh+kX5umtD99wmNLegn2GqOK6V7IhzodR4Jlnu6GyIuniR3f/VQk5A0SzWMb7
         bw9FM2E2zG8TSnnYhDP/OaEFS1eQuqUT9I5YCyXuUQzXbDe/lnKhuUP/HMD3wzrZhSPY
         k5VMgo6t0FxSuHGGsAn60Utmw7R0FhSsPaHSmaPhbynclfJ3QQ/EmdPwkMrOervKSYov
         AWqf+AQ1+AdE85xLz8Im21jydBbFWLDq1giTN5Hn+wxYrb3+UgmUclvf0ebeou5sJTrY
         i4GA==
X-Forwarded-Encrypted: i=1; AJvYcCX6PXU3936BGZ4g1LqwtPuJhMng6jJ2/EXuuXr6o1zjWryeGlQYOxMiLfBJ9F0ZTu5044GetT0yJtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQyQUPjjXEKzE67Bs2MDXMH6bBEzLmmbBN1BPPAqCvJD5h4i9
	87Mj3nOC7hqESQ3qKoo1JFlOxTOMggCoTJC4ZFoAOParFSWV31TaWrM8
X-Gm-Gg: ASbGnctV/RVRN6vSaWzkryYuioqM0vKE7KCxT9yeRJk7CZBPO2/xIuvzs4IhjU4Rq62
	tuv3EYSb3KkDmLA4S6f8bmWD+UrXXB1YT9V8pb0yU851AiKjJEeD1HZw58Xz9j10ig0OvsTuCzt
	qvwrMoyooRXqvnXrTBZTt38LOrguKpOuFKrxCiAQQR2efAQPyCX4e5FBG6MN04R0eKxTNRIw30t
	CpzH61HkFxFlfWtll+sK9t8nk/mV4gXhRYNSz5oiLuOX8IuDVI+DPDkUCG+rm1Gm5lXRZienWjg
	3xoe3CYfHBCreFQkBvWHZw7o04j/sN6c6BjnSgYX9PReLg3qANhhw9VcTOvITjeZJQJPm1oOcyA
	Mh+O9vx6O0tlXS1oRDnX3px3vxVUvIEPh7fkCPFIUCCPJXcV82l0T9PzLq3NF5ftQQqH7O9pg78
	6qBbSE7TOVKY7H7q7nbVRnCcxytzHv4Y1Lcn6CsnHXqqxMVm8+eHe68BBq
X-Google-Smtp-Source: AGHT+IFxWTJB63voHXky/YXI1TWJvYvO+sEuTf/VXA4Nb4YTLVhTU1RSL+X39WT0EdMWX3Np9XW0bA==
X-Received: by 2002:a17:902:d592:b0:293:33b:a9b0 with SMTP id d9443c01a7336-29b6bf1a512mr87555105ad.32.1763897306035;
        Sun, 23 Nov 2025 03:28:26 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm102905925ad.42.2025.11.23.03.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 03:28:25 -0800 (PST)
Message-ID: <dc0540b6-4f48-4d06-b68e-c4cb8be7a52e@gmail.com>
Date: Sun, 23 Nov 2025 20:28:23 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, rdunlap@infradead.org
References: <cover.1763814816.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4 0/5] kernel-doc: add support for documenting vars
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <cover.1763814816.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On Sat, 22 Nov 2025 13:37:54 +0100, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> As suggested and discussed with Randy, this small series add support
> for documenting variables using kernel-doc.
> 
> - patch 1: add support for the new feature;
> - patch 2: extends to support DEFINE_*;
> - patch 3: document two media vars;
> - patch 4: fix an issue on kernel-doc.rst markups and automarkup;
> - patch 5: document it.
> 
> On this version, I'm using "c:macro" to describe variables, as it
> avoids Sphinx C domain to try parse the variable. This makes it more
> flexible and easier to maintain in long term.

In my test on top of current docs-next, I got two *new* warnings from
"make cleandocs; make htmldocs":

    .../Documentation/driver-api/media/v4l2-common:8: ../include/media/v4l2-ioctl.h:665: WARNING: Inline emphasis start-string without end-string. [docutils]
    .../Documentation/driver-api/media/v4l2-common:8: ../include/media/v4l2-ioctl.h:678: WARNING: Inline emphasis start-string without end-string. [docutils]

"scripts/kernel-doc -rst include/media/v4l2-ioctl.h" emits the following:

    .. c:macro:: v4l2_field_names

=>    extern const char *v4l2_field_names[];

      Helper array mapping V4L2_FIELD_* to strings.

      **Description**

      Specially when printing debug messages, it is interesting to output
      the field order at the V4L2 buffers. This array associates all possible
      values of field pix format from V4L2 API into a string.




    .. c:macro:: v4l2_type_names

=>    extern const char *v4l2_type_names[];

      Helper array mapping V4L2_BUF_TYPE_* to strings.

      **Description**

      When printing debug messages, it is interesting to output the V4L2 buffer
      type number with a name that represents its content.

I think those declaration signatures need to be inline-literal. 

Thanks, Akira

> 
> ---
> 
> v4: 
> - document the new markup;
> - fix an issue on kernel-doc.rst due to automarkup;
> - add support for DEFINE_* macros
> 
> Mauro Carvalho Chehab (5):
>   kernel-doc: add support for handling global variables
>   kernel-doc: add support to handle DEFINE_ variables
>   docs: media: v4l2-ioctl.h: document two global variables
>   docs: kernel-doc.rst: don't let automarkup mangle with consts
>   docs: kernel-doc.rst: document the new "var" kernel-doc markup
> 
>  Documentation/doc-guide/kernel-doc.rst | 48 +++++++++++------
>  include/media/v4l2-ioctl.h             | 15 ++++++
>  tools/lib/python/kdoc/kdoc_output.py   | 46 ++++++++++++++++
>  tools/lib/python/kdoc/kdoc_parser.py   | 73 +++++++++++++++++++++++++-
>  4 files changed, 166 insertions(+), 16 deletions(-)
> 
> -- 
> 2.51.1

