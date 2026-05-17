Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F432E6B4
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 23:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060126; cv=none; b=fhthuebAKXBuQgqDXntdHoLfmlE8G33uj33unXBbb1My6Rkf2WkKWb9/CGXMnP+Xbz1CloC+o2bUSObEZh++FgDXr1lsYLn0xjVMk+1ZbpTsiTYKFczsdhP8jixPs69jaELFVoxInPkmAOtkxPps4luwl3or6pUmpN0D4ILdvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060126; c=relaxed/simple;
	bh=WxHYqkzp7/G7ttQ4qio7ZbKdNhBkpwbp4SLfPYgRBs0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QSdJobILMxCeDz80IZLSyCf3iI25Ie07THmmutap+fzNQkkSsSPq724NhkosheQa/Ul746Dmm4lucdLovQ+7KLKGfcTAxIAjvVU94LLd0Xn9yfp5cpUOYzAfufq7dUuL6C+1OUe8rEattg1thxfkRP0R35rrpGUWDSkNCOjeJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrmlvSCT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrmlvSCT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso12736715e9.1
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 16:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779060123; x=1779664923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBbUGCFqJiMRYfsl+eF9tbHmcztNauGUmlMdpL91Tl8=;
        b=JrmlvSCTzJ7VL4x1ZyI7ZLr3CfFzZqnIWOpug8xh/mvmbUCqSy7abXVfjTIMJ0J76l
         wA9Ad2oLh8LR014R7KsKvbkZ4Xz/i2ez+ND6yEPNbZGOESA3yKNQ4WjF7zTaPARM1Z2d
         u5TjwGQ8GJoEIv1RKzRe4fGax6Wjk/3LLeshQtd9qOH2LlGaoB6Nw4VADZU/crPuwHM5
         UZ9fF7gwbM/HnRq4fG+Yes6NYEF83xNshonI3DYFYkIvrU8MPVcDMNS830Wxc4EeKN0f
         Hz+fWAYJNzHzEmEcQjgmaGmBJ5VrR1mK+MM2gkL3c160j3UcqqQVwLS20jxgLDQ+ilJQ
         3qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779060123; x=1779664923;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBbUGCFqJiMRYfsl+eF9tbHmcztNauGUmlMdpL91Tl8=;
        b=ZR46WpWbw37OvcjdQpQm0o1orRj9Ix89cSNDUf7Eb0eHKRHcGXizSi+KPMI011ODZV
         UFIjjriyRKkdAlBzw7SPLa7pCmNQ33iAZarO50dCqmijIseYqkp/4gsEnIovuCBGCKtm
         As+T3c17gpqQO8zJ2g0ByT6vDIYapmSZdB1oYMUY1cydEybgiURuFswdSp3yynesGV50
         mLphoDANd6SMjinDZ78Ko89/4zTa6zZeq+5h7qnIzvGNlpeBMTverRXJj3o+/kGXv62V
         GOgaO0mIFX/8MTNggKvE+7GS1ZsAAO5i603MEJJjlToEzXj5jd2nhDUL/vaVX7W/fjrM
         h7dg==
X-Forwarded-Encrypted: i=1; AFNElJ8VezztQvHAiBnroNuCRzDxg7gHk7PlhHEA0iikRmlRe+AfaZmI65NNbfBGYSSOD8zwbZYTskCl+zI=@vger.kernel.org
X-Gm-Message-State: AOJu0YztxZ+KG8jhtAZm8+UkJRxmGF5OAZkgKqrCA56+Kk0i9y+WHXz2
	ShY77M39oNQdvRfLzrp1ey1Rk0KaYah3IwDY6fnLDgVmbQAuO72yVzUTuvuCbVIHIDB1mTQr
X-Gm-Gg: Acq92OFEdwzR38UQwLPd0+AC1Ow5iZV5UiXkRzD/8t9eQh4LpKfNY1KYqWVt14CG5rr
	9tYXXZD4QrF9TYBK4pDtE3/N/Hv+2kgPYOfzNke/x5xwwhem88vxL6hqQKzDvbCE71ACE2hlm+F
	gsn+lT+hYXUWMRZ6YIUW0EklRQUs6SIF3FlXGqaLufsQJOAKaskNx4aTPPK7Z1XcAFZIM8/kJnh
	ARrHXAesD3aUCzHn46Fm39fea1++oYd+4bENQ81M6seA4apVvW79MjWlTl3rQ3BJFC7mQ1cj1YA
	V0zVmXpZaOXS9JlXF0pmpd0m9b87zYDQEK+dJZwpmpCajCff/N3CfZFiRzeoWv9ZuM/iui2fPcw
	gl9SjhZhLG5i9YWleK4uO5fxAT7miLJC9z7Gad/5vNwJ5eT1KIq9VScKTqAcKaoUT06dM0OkivO
	ZlDymMbEYTyzxAlUfggcVQpr5JjxoXMU1jYwf1zSmoasXti1h+PWo9saA=
X-Received: by 2002:a05:600c:4a1a:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48fe6325f25mr113675785e9.17.1779060123186;
        Sun, 17 May 2026 16:22:03 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm218924895e9.7.2026.05.17.16.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 16:22:02 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <dc9bf309-ba57-4ab2-a297-206fcabe318d@gmail.com>
Date: Mon, 18 May 2026 00:21:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v3 0/3] add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>, nathan@kernel.org,
 nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <c6e9481c-932b-42f7-a903-b781d38cc1a8@gmail.com>
Content-Language: en-US
In-Reply-To: <c6e9481c-932b-42f7-a903-b781d38cc1a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/17/26 07:14, Demi Marie Obenour wrote:
>> Hi all,
>>
>> kconfirm has shrunk a lot since v2!
> Thanks for dropping so many of the dependencies!
> 
> It might be able to shrink it further by using the existing C Kconfig
> parser.  This has the advantage that it ensures kconfirm and Kconfig
> will interpret the Kconfig files the same way.  I'm not sure if
> that would be too much of a change.  That's up to you.
Hi Demi,

I did look into the in-tree parser after your suggestion in v2. What I
discovered was that this parser performs too much evaluation of the
kconfig code during parsing, making it unsuitable for purposes of static
analysis:

The in-tree parser doesn't actually output a parse tree that we can
traverse and analyze, which is how kconfirm currently works. Instead,
semantic actions directly construct the symbol table *during parsing*,
with that symbol table being different from ours. I think(?) this makes
the overall process faster (which is great for real-world kernel
builds), but for static analysis purposes, we really need to preserve
as much of the underlying code as we can. For example, we don't even
preprocess variables, because this allows us to analyze more regardless
of the host and target. (Well, architecture is the one exception there
because we need to resolve imports/"source".)

I do want to point out that Yann, the author of kconfirm's parsing
library (nom-kconfig) is CC'd on these RFCs and has done an awesome job
of supporting the parser and kconfirm's usage of it.

He also helped reduce the number of indirect dependencies pulled in by
the parser following your feedback in RFC v2.

- Julian Braha
