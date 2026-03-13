Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49BB33F5AC
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 02:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367958; cv=none; b=r0tguMCd4clU9D5W6Mz3sEUES30KK+5Q6w6wvIGiqHlW+blkfhefxNOjRLAqJvC1kmdK7mpz3BoiQUyviLqy0enTFRKGkcPTCFH9vbmlVIpjY375QqVfkyD4BM+xw4o4nnq5whftNi/88YEOV3n6RGC1l+TzfpbN4MsYCS9+QtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367958; c=relaxed/simple;
	bh=R5kX8BPQ+CDYGdPeei3dhycI3hXIHMHg3V91onGJBWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCmRQPtu+yFBvCcLs8yVzpeMfg6nuitOX/fddd951c/j1k6m++OQ8vzKvqbqGfUgB/VUojRt69f0oVdWwG0QoOJsThx9YKcbTDc/DlDgydJImU3/Esu+TRwoLTT6/J+yVFFQPsWSUPQ1k10IAHA3t9tU5kSjlQDDcvrNEkQuCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lphFk6b9; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lphFk6b9"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be19f05d7dso1508190eec.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 19:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773367955; x=1773972755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5kX8BPQ+CDYGdPeei3dhycI3hXIHMHg3V91onGJBWM=;
        b=lphFk6b9w3PGozphh1jUSX241D+DtnaOFioPuC/YJVs4/+V/MaeXGWiTYnTk6r+gxH
         Tnm/TsMSzy+07sXJP4UUxtvPeF/GewQYcZnPCr7i+mk6oGY5SPEZzASfaxl4B2pVh6tW
         Byc6LhWMZJ6AOUxjaHilovHrS5L2+vOFEjgekjNkZA02tkFc58cKWjRKRSduuBCzL1DH
         bgnu2afVKRBbU6nGLiv58Ctz6o58eyKUtyyB2DYbGrJlCucOaOG1ehZsx9AcyR6u/S/r
         b8GWQz5PSy73f5LVQQCuYHG/9rD6/67vFfj/emQdGc7NxCNOtSM+cq11vptZ9S5JmwOb
         zx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773367955; x=1773972755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5kX8BPQ+CDYGdPeei3dhycI3hXIHMHg3V91onGJBWM=;
        b=kiB2S9cq0flREbwxbSimDgTo1db6FVCA5of+rGtfib540z4fqcHtsfHIN7kZEQEIcF
         B7NQsgnmCueWRNQsLGuD920TTF6eI+etPBQ5g6UGUJtFAatuHL6as6aggLeIE5ClKX0y
         f/IhzpsDLJylOCWHEliBj0YzpgWJWYCsfU1eSq+gJkRSKPcUSfnJBQDHpH/RBFFOxoZP
         bcv6yA9Hz78g2ilDpeCEY9h0bNVxGhV9bQSP2yb0m5/skMx5OpHve7JBThzPAVMoJUEP
         dXqhP+uxCU1ot7MTI3wtj+nsYwSmxfyQjJvhI46X/LDcmb5yQkicnbswJmCIQ/jp6WvN
         ZXHg==
X-Forwarded-Encrypted: i=1; AJvYcCWIhFevAJ9ypo0JOedVJggV3aoeLjxrG36dfMaELTTmxVNmMkn07DRQNXr3bEaeCo9kgRbHdCbHMpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxapG/vfe7dqIB6uUQZIKE/XCzUUB6BAynzI1f5lorVpLMlGLDV
	XvPaZZDu6AMH0MY93Rl1f7/iNj+nxYK2n79AEiXMNZW2cAWnJ8r9FrkHL6Xiwg==
X-Gm-Gg: ATEYQzxTDlassxaT0Yauf0p9h0VsCH+CvtArBT/1GNX7C6e8srqu/wAyRlbgLw2P45n
	xuA4NvZdr82Hwn6xS/045IeJjEc7ti3gUvOIJ8RJuD1bj0x5vMs75xaKfR+a+aAHPhqUV2yH6ds
	cytDB7dj0kGjvQ/P2slL/1L37BVXjP3kG6FCzDJ0PuAwpyeBf4x2yB5ouIji63pCx49SktSv03F
	I+jB7GOxBQAffwphYB86MTBtwnVmY/aP2zLZwN3skOk8mFfIGh79x4x3g+y2tSnpK+lY8Mzd/8W
	ezVcyyyDXmPLyhF6Ks8TvtmMulNgFjSrtoMw29HoLMPE22TtOzXUVkPvDMQmkez/gSrJIRkBXR0
	9OZ4rAA+muzYNMdTTHgaNadX5aNCg6xBK4yi2/2qQCnwn1s+vM9wQEqhDrMOp8gJGUyKCgIn8ET
	/H34nS5aOtmIOL/JF6GW6ZsifVVylOmL7awSMbTlXY
X-Received: by 2002:a05:693c:2b17:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2bea5477f47mr956251eec.14.1773367955004;
        Thu, 12 Mar 2026 19:12:35 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab527170sm653550eec.21.2026.03.12.19.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 19:12:34 -0700 (PDT)
Message-ID: <037345d9-56d2-4499-ae30-1a29482900b0@gmail.com>
Date: Thu, 12 Mar 2026 19:12:31 -0700
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
 <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
 <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
 <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
 <CANiq72mvzMnkwhGV+_srz=kLazpHVg5+-HaOtczaTzgFdaYQiQ@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CANiq72mvzMnkwhGV+_srz=kLazpHVg5+-HaOtczaTzgFdaYQiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 3/10/26 23:11, Miguel Ojeda wrote:
> On Wed, Mar 11, 2026 at 12:57 AM Carlos Bilbao
> <carlos.bilbao.osdev@gmail.com> wrote:
>> Yes, I suppose one day I’ll work up the courage to use automatic
>> translations for what’s left. But I’d still need to review everything
>> carefully to catch mistranslations (the classic Spanish example is “driver”
>> to “conductor”), though in practice the issues are often subtler. It also
>> means resisting the temptation to skim large paragraphs and trust the
>> tools; something that’s probably more tempting with docs than with code.
> Ah, I didn't mean to commit change, i.e. not for maintainers. Rather,
> I meant a set of suggestions for readers about how to best read the
> English side of the docs.
>
> That is, when they are done with the parts that are actually
> translated and humanly reviewed, they might need to keep going and
> read some English parts (or the code itself), and thus perhaps they
> may appreciate suggestions on how that may be best accomplished could
> help.
>
> And for those nowadays using AI for translation, perhaps what could be
> added is a set of guidelines to guide the AI while translating (e.g.
> to have a greater chance of not failing on the subtle points you
> mention), both for all translations (like whether to translate
> examples) and for particular languages separately (like the "driver"
> example, though I imagine that is handled by context nowadays quite
> well).


Ah, I understand now. Yes, maybe a prepared prompt with some
well-thought-out guidance would help; that’s a good point.


>
> Anyway, like the policy across all translations for whether translate
> the code snippets, these are also just random ideas that came to mind;
> and perhaps they have been suggested before. :)
>
> I hope it helps, and thanks!
>
> Cheers,
> Miguel


Regards,

Carlos

