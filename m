Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F4380FC5
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926377; cv=none; b=pgkQlEx7K4Fcibu4wmFCV34jns+XK692UQnKpPgryGxh0BYbpIjeEuB9UbQ7vjRu7VWm5djT2cZmUpI4I4worEgT57UFNWX163hU/5ZckTftS7izvhYv7lyypIEbp0Y9n1WB2A80ZfWnuArrQl9N480Ueh0G5oLC8v3i2HdCKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926377; c=relaxed/simple;
	bh=RO66ZSgeAevdykbKvjRvaupd46uMfbyQ3WNh5DzjFAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjaJ/tM+q/e/NO5BDpkGYovRRWora3EfySv4dDxfFNb7yN9esPvNF/9YALq8bm5j8DqZWXUG/WHCFqo0SKn1sLB3BRGf8SzLZBgsHuQvFAOCNg9fuR8+f8Q6LoqbBQ9BmjGoA//8tPvYo1LuNiLCdn5uDOx49qunEPfVCRonWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZdPNrjo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZdPNrjo"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-836ebdeb969so287953b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778926374; x=1779531174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8BMJQqrO716nFis1QFa00/opFE3hkG9LaeWTbJyVcu0=;
        b=LZdPNrjo4FWh3VeQiSqLbSq+GrNrd4oIYBSO8jjrjfGCGwNhaKXpAmXc7uq5B/wt8h
         Q3hHuMLmSdKF+ad+mwVrA6MwOvK5otEb2itkF/EEzFws5pAL0p/L9pNsrdffkA5kpik2
         tMPgjoz2bnBdug6UlgCMCf5SmwxNM2eXQXyfAmZGzEdkDFcHZxgPwJJV5A6BkXXp9xuo
         Hqbiv48UWl+uHLd/cXRNunyaJ9I/+Cx3mywvtoDLxQ6ZvEMZ4t+zYv/6z49DxvPe9ZAb
         KuxYuBjTC/0h1iAmc0Uy/URYgMkeo00j+5ci73wp5mlnk8Dn6vBREhDSECyanSrR6Z/y
         O2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778926374; x=1779531174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BMJQqrO716nFis1QFa00/opFE3hkG9LaeWTbJyVcu0=;
        b=br/QJe9O1BCweHNXy0WvX1lMG9dhowgjFgm4z5fxXPIeEzYVk62EyaTM/2nger8Iq+
         on8zg87DHbV+Le1MjbQ6d6JcvALkBwwL6u2b5P9k6tx01PR+3yiMuChQ/T/GLy9Vr4bL
         1SgehdH9Pxd0+5gHWxCvOXWO9L5OPvr/mc6qkD8oLF53nz8ULf8GcpQCVA9k24qgUCCz
         gXmW3O2I5pLbHDVD6L7oYfKboPDZcO32G96hzOdwYgn37PI00uK7OcNMAjdPLl31Jdsu
         CsRsdvqFiEpwNTg9747lZR0U8qr7JN9xWwxIuD80JKDgNciLnWeWfpsuLA41cNVXb1VZ
         1STQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+sfQ3j/InQBLny5X2/2pwwMM026i6fHAwndO7Q/o0tMl9wAOPMMgOwdv65OrHYSUPYi2u550DJCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWfXIHGr1o4iEZDekODz3b+qX4K/foZfEjaOzm8j+JNd39kjW9
	ASStQVvDd8b1z76rZpmOvEQNlGOvOuqQeRdoEj5xjYzxUUvZBSr3ZOYH
X-Gm-Gg: Acq92OF62qY8HZoypU7SJtbNiRUuXd18Yv8MgFMEM35YkCMfjH4ljczZoLX19Shm4mB
	LBSZvLV7FahN2ry1qBsp9Nr8QUkdxITBiabMJzu7rLW1pt/fPFa8fFPJAkrSyabLurb1sXW/HA0
	1QUs4PR7BhjcCMww4EvBXjG/saXgIX05fnbvPqicaTfitYuJon4qzQcCVXCrNK0r/yCwv4JfHbG
	CwfUhkSk5Vv1MCa3xKhiQUtA94JYpzRaN/7K/KOAsJUUoVswPMbTUEegg24t+BzTWwzIM70meCX
	+w47VsvdOhSSqLLm3DZsqu+rAXDaPAG8pzAlofg4TIqz695UVaW3/93384t8cKgVPmZXhmL6CNh
	CVJxf70mQ0HJLYbxdS8O+6tGDi/qBR/jZc6utK2ouUdIHc2PIZYo0Sh20517alO+VXc8YvTJCW1
	mGuMtbvoEbl9DcQUnj3YRXrKF0G1liP9bkYOYaT01koBYKuzz4k0IDd9++e03hjsSwQzhr
X-Received: by 2002:a05:6a00:440e:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-83f33d4ed63mr7538622b3a.34.1778926374467;
        Sat, 16 May 2026 03:12:54 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm9856504b3a.61.2026.05.16.03.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 03:12:54 -0700 (PDT)
Message-ID: <0e67cc69-405b-4e29-b9ef-a541cd60ed54@gmail.com>
Date: Sat, 16 May 2026 19:12:52 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/ja_JP: translate more of submitting-patches.rst
 (no-mime)
To: Akiyoshi Kurita <weibu@redadmin.org>, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260513131111.432772-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260513131111.432772-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 13 May 2026 22:11:11 +0900, Akiyoshi Kurita wrote:
> Translate the "No MIME, no links, no compression, no attachments.
> Just plain text" and "Respond to review comments" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v2:
> - Make the subject unique.
> - Reword the no-MIME section title.
> - Refer to the untranslated "The canonical patch format" section by name with a TODO.
> 

Looks much better now.

Acked-by: Akira Yokosawa <akiyks@gmail.com>

Thanks!

>  .../ja_JP/process/submitting-patches.rst      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
[...]

