Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91011386C9
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 03:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113618; cv=none; b=oUCSMssvE13sKsQHRJif+LYp2A3O3eUroNWSXmRKqL5Ws2+EBZh8OyH7VnispvaGZoHJxFVnyy+IOIucKglt5n8lsry/oJri2j3aQSUiortR8fbhOBVdVs0NeLPJybL0xuv386Mxf9LekYCHpCA/TYCISzUjTbIvZn/NKgSRps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113618; c=relaxed/simple;
	bh=riCQmqv59fYVS8hWxRXdwFETb7DJ/KktAoG6aGFy9oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdYYzf2QalYHuMhpNkYsU8b2E6YlH/Utqvm5KmANS3zbxhBVGYZEP4h4nf7l96/y0FNorA4nLWBMpKGnaKHY/oIuVgoUO9gKUYZxR82+ieDDnPw/6TusPBPkZF4flEHWmXMiKqfocu4DG/3bQWTXw9v+KVP6m1n+FiXipEhtCgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daqKEfat; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daqKEfat"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba895adfeaso10411984eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 20:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113616; x=1773718416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0G55sZaCfmUkk/dIDbo0vXR8fTsJ/lrn4erTzvFJHk=;
        b=daqKEfatHOIlk+CKmkfsm1FzzTK4EUPB8EU8Xv3/Ey2vJqvyLZD6GYghvEenD1Y4yj
         WBV4C0v62G3xQphTeaJadCHSL+qikSmJxH0Yuwus42/mMQGI3uhxvo2EK0PylIpPYrKf
         4zxjgQ7S2AesLfnso3N6/029Zsy8TJXRLafOa1iHp4u6Vh5ddadb/RDRcp6xCj9rWNJy
         C7p+oeX+3lkKREz0U8htumRuLtHJ/++X1zZg/tny3OCquf6v66VMDh2yQTooDiVUA5mM
         FFWme6hgtr5Kc0M+xeyMv3tHVPX3hB7eiLsCi7T26C5q4WPI3ReHOrPl8Rj2yd2kDkxs
         9rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113616; x=1773718416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0G55sZaCfmUkk/dIDbo0vXR8fTsJ/lrn4erTzvFJHk=;
        b=muFBQl2pqjlLqfRzRAeJVVknVbBoRwE2VJtS158w9dfq7iSQ+BeE9Ldb6qXdwjb9LW
         +AuVp5p3cB433ZAHxgr2r1/NwuTBRG/+Pb26F4ksOT0XlkZEHnAVpFLlDX2cj6f4n9nr
         cg0xsmlbDL/YGcXDncIIlNqdXtxe7/riYKGPqgbhbDcrLVSKcwi3XvlnNEa1K8QOa36F
         IFNjWNFDTWw2rPSGjb+/suHwGLYT547PkICbEjiIShdFzEmNDLKhobUcTiHx8wcw1WtX
         UeQH93Iy8EF82oKomKPytQHyKN0FWg912zakwQYfjgwWq4ZIZBrEjKeeh5cVmFVtDI20
         r8vg==
X-Forwarded-Encrypted: i=1; AJvYcCVshWYcsbAg52ObbSRbOW0uPTGE0VTxkwK7gJjDGH2sXNd6GxpPKDKKuS/ULnrDTYMMX5W9IXlv440=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0krAe86tDer6RyQSVYjmPxi5yIpPPwa9pLfsvxeKQDkRyjq4
	6n5w/mcPfe0c2KAaU3p2/PC+fTxKg/MMINgTWa09vMldNgZ04/wCv3Ln2opX4w==
X-Gm-Gg: ATEYQzwoX29p0fXuCuzXUgXZVfWgOWaHPohIPayg6Low3IcxcAbX+Cn273PzHWy90tP
	j51doqIuCIYMpn2C4eUV1x6qlyi47ZRhBKa4BhUmgv8Xl5NT+L/ZjGOwsUGj1qhEW4HSYQVG9Qo
	E7gzsC0xG+wvdXyGe4RKmOoBv8z7YgiCWif7W8CzDYn+OxVXEYGzmcoifi/1qkGSp+vfXcl7aft
	8XNEe31ClCxGw3/8/vjDNxLoUvmmMxPPKj+VU02MSfqUwzsPIiaZADwQhWcgsW0ix6WW7ADFesK
	gUHc9INKgnLc5c9yp45IXGg+se6ygPWWZX6pL6FbSCtvT1KlPlGTfGp5ShuNyqGALr0hifFHnks
	7YC4cpFO1ptasOMVrxpiSMjw7+8Bdr1H0Vkth5eTWpvAvhuck8FGKYTx9O11WFR7xQ3MkCI9eXo
	CrZVf0ss/1nKWjhQ/ektno/08X3cL8eF0y1l0mpwCQ
X-Received: by 2002:a05:7301:eab:b0:2be:d62:abfc with SMTP id 5a478bee46e88-2be4e03eb9amr5456099eec.31.1773113616014;
        Mon, 09 Mar 2026 20:33:36 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984ceasm13952770eec.32.2026.03.09.20.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 20:33:35 -0700 (PDT)
Message-ID: <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
Date: Mon, 9 Mar 2026 20:33:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com>
 <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Miguel,

On 3/8/26 12:16, Miguel Ojeda wrote:
> On Sun, Mar 8, 2026 at 7:40 PM Carlos Bilbao
> <carlos.bilbao.osdev@gmail.com> wrote:
>> In Rust, there's some keywords like # Examples, # Safety, # Panics, etc,
>> that need to stay in English.
> I don't know what the translations' policy is, but shouldn't all code
> remain in English? i.e. not just section names, but comments and Rust
> docs (i.e. `///`, `//!` and `//`).
>
>  From a quick look, at least I see another couple translations that
> keeps them in English.


TBH, a reasonable case can be made either way, and there are no written
rules on this question AFAIK.

In terms of precedent, the Chinese (simplified) translation keeps code
blocks unchanged, which I suppose avoids giving the impression that
non-English comments are acceptable in kernel code.

That said, the goal of translation docs is accessibility, and since these
are illustrative snippets, Spanish comments help readers follow the example
without having to switch back to English. Personally, that argument
convinces me more.

>
> Thanks!
>
> Cheers,
> Miguel


Thanks,

Carlos

